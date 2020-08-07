Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD8D23EF0A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 16:29:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k43NB-0006hS-5n; Fri, 07 Aug 2020 14:29:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k43N9-0006hN-0h
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 14:29:27 +0000
X-Inumbo-ID: 64207437-e62f-4bfc-bc5e-82df444351aa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64207437-e62f-4bfc-bc5e-82df444351aa;
 Fri, 07 Aug 2020 14:29:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DEBCACA9;
 Fri,  7 Aug 2020 14:29:43 +0000 (UTC)
Subject: Re: [PATCH v6 04/11] common: add vmtrace_pt_size domain parameter
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <036bc768bfb074269d9bd4530304a11170b7142d.1594150543.git.michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93de2427-d5ef-32b0-d5b0-dd9759c884f9@suse.com>
Date: Fri, 7 Aug 2020 16:29:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <036bc768bfb074269d9bd4530304a11170b7142d.1594150543.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 21:39, Michał Leszczyński wrote:
> @@ -443,6 +449,9 @@ struct domain *domain_create(domid_t domid,
>          d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>          radix_tree_init(&d->pirq_tree);
> +
> +        if ( config->processor_trace_buf_kb )
> +            d->processor_trace_buf_kb = config->processor_trace_buf_kb;

There's no real need for the if, is there?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
> +    uint32_t processor_trace_buf_kb;

Adding a new field to an existing interface struct requires bumping
of the interface version, unless that has already happened during a
release cycle.

Here I agree with the choice of uint32_t, but ...

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,9 @@ struct domain
>      unsigned    pbuf_idx;
>      spinlock_t  pbuf_lock;
>  
> +    /* Used by vmtrace features */
> +    uint32_t    processor_trace_buf_kb;

... why a fixed size type here? unsigned int will do fine, won't it?

Jan

