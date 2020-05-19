Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320031D9889
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 15:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb2cU-0007Uc-Mp; Tue, 19 May 2020 13:49:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb2cU-0007UX-30
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 13:49:22 +0000
X-Inumbo-ID: 8a9a1b45-99d7-11ea-a91a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9a1b45-99d7-11ea-a91a-12813bfff9fa;
 Tue, 19 May 2020 13:49:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C84A0ABE3;
 Tue, 19 May 2020 13:49:22 +0000 (UTC)
Subject: Re: [PATCH v3 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
To: Paul Durrant <paul@xen.org>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7455ebb7-89c8-75f0-5904-aec344c8b85f@suse.com>
Date: Tue, 19 May 2020 15:49:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514104416.16657-3-paul@xen.org>
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
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 12:44, Paul Durrant wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1129,6 +1129,43 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/*
> + * XEN_DOMCTL_getdomaincontext
> + * ---------------------------
> + *
> + * buffer (IN):   The buffer into which the context data should be
> + *                copied, or NULL to query the buffer size that should
> + *                be allocated.
> + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> + *                zero, and the value passed out will be the size of the
> + *                buffer to allocate.
> + *                If 'buffer' is non-NULL then the value passed in must
> + *                be the size of the buffer into which data may be copied.
> + *                The value passed out will be the size of data written.
> + */
> +struct xen_domctl_getdomaincontext {
> +    uint32_t size;
> +    uint32_t pad;

This and its counterpart don't seem to get checked to be zero.
While an option for a domctl, any desire to use the field in
the future would then require an interface version bump.

Jan

