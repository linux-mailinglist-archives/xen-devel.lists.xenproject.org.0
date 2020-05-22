Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D11DE8BE
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc8bI-0003Z8-EA; Fri, 22 May 2020 14:24:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=knsM=7E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jc8bG-0003Z0-Qu
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:24:38 +0000
X-Inumbo-ID: f68cded9-9c37-11ea-abe7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f68cded9-9c37-11ea-abe7-12813bfff9fa;
 Fri, 22 May 2020 14:24:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D5970B142;
 Fri, 22 May 2020 14:24:37 +0000 (UTC)
Subject: Re: [PATCH v5 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>
References: <20200521161939.4508-1-paul@xen.org>
 <20200521161939.4508-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62f13c6d-8d5f-7d06-d7e9-d17b960c8264@suse.com>
Date: Fri, 22 May 2020 16:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521161939.4508-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.05.2020 18:19, Paul Durrant wrote:
> To allow enlightened HVM guests (i.e. those that have PV drivers) to be
> migrated without their co-operation it will be necessary to transfer 'PV'
> state such as event channel state, grant entry state, etc.
> 
> Currently there is a framework (entered via the hvm_save/load() functions)
> that allows a domain's 'HVM' (architectural) state to be transferred but
> 'PV' state is also common with pure PV guests and so this framework is not
> really suitable.
> 
> This patch adds the new public header and low level implementation of a new
> common framework, entered via the domain_save/load() functions. Subsequent
> patches will introduce other parts of the framework, and code that will
> make use of it within the current version of the libxc migration stream.
> 
> This patch also marks the HVM-only framework as deprecated in favour of the
> new framework.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Julien Grall <julien@xen.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> +int domain_load_end(struct domain_context *c)
> +{
> +    struct domain *d = c->domain;
> +    size_t len = c->desc.length - c->len;
> +
> +    while ( c->len != c->desc.length ) /* unconsumed data or pad */
> +    {
> +        uint8_t pad;
> +        int rc = domain_load_data(c, &pad, sizeof(pad));
> +
> +        if ( rc )
> +            return rc;
> +
> +        if ( pad )
> +            return -EINVAL;
> +    }
> +
> +    gdprintk(XENLOG_INFO, "%pd load: %s[%u] +%zu (-%zu)\n", d, c->name,
> +             c->desc.instance, c->len, len);

Unlike on the save side you assume c->name to be non-NULL here.
We're not going to crash because of this, but it feels a little
odd anyway, specifically with the function being non-static
(albeit on the positive side we have the type being private to
this file).

Jan

