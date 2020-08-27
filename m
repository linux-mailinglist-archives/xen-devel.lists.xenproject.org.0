Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67F2547D5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 16:55:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBJIH-0006mE-5a; Thu, 27 Aug 2020 14:54:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o8NI=CF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBJIF-0006m9-TP
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 14:54:23 +0000
X-Inumbo-ID: a4e18548-27fe-4717-a274-09cc6afa9360
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4e18548-27fe-4717-a274-09cc6afa9360;
 Thu, 27 Aug 2020 14:54:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 814C9AC2B;
 Thu, 27 Aug 2020 14:54:54 +0000 (UTC)
Subject: Re: [PATCH v6 09/11] x86/domctl: add XEN_DOMCTL_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
Cc: xen-devel@lists.xenproject.org, tamas.lengyel@intel.com,
 luwei.kang@intel.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <a9899858dba4a7e22a0256cff734399bff348adb.1594150543.git.michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d875c707-64cc-6094-77ff-5937ad2cd5d4@suse.com>
Date: Thu, 27 Aug 2020 16:54:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a9899858dba4a7e22a0256cff734399bff348adb.1594150543.git.michal.leszczynski@cert.pl>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 21:39, Michał Leszczyński wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1136,6 +1136,30 @@ struct xen_domctl_vuart_op {
>                                   */
>  };
>  
> +/* XEN_DOMCTL_vmtrace_op: Perform VM tracing related operation */
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +struct xen_domctl_vmtrace_op {
> +    /* IN variable */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define XEN_DOMCTL_vmtrace_pt_enable      1
> +#define XEN_DOMCTL_vmtrace_pt_disable     2
> +#define XEN_DOMCTL_vmtrace_pt_get_offset  3
> +    domid_t domain;
> +    uint16_t pad1;
> +    uint32_t vcpu;
> +    uint16_t pad2;
> +
> +    /* OUT variable */
> +    uint64_aligned_t size;
> +    uint64_aligned_t offset;
> +};
> +typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> +
> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */

Here and ...

> @@ -1277,6 +1302,9 @@ struct xen_domctl {
>          struct xen_domctl_monitor_op        monitor_op;
>          struct xen_domctl_psr_alloc         psr_alloc;
>          struct xen_domctl_vuart_op          vuart_op;
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +        struct xen_domctl_vmtrace_op        vmtrace_op;
> +#endif

... here I'm struggling with the #ifdef-s - see the very top of
the file.

Jan

