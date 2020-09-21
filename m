Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE927331F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 21:47:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKRlv-0004sv-N1; Mon, 21 Sep 2020 19:46:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIeE=C6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKRlu-0004sP-5h
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 19:46:46 +0000
X-Inumbo-ID: d69fbf66-5c59-465e-bd23-28639d819982
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d69fbf66-5c59-465e-bd23-28639d819982;
 Mon, 21 Sep 2020 19:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600717604;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=H7sbEgXzEY04q9N4UrOnKQYPH2k/+eZc9viZRj6l470=;
 b=LCYpp5QXSm5y5+vzZTUSuLaRotdVH8dAJm9/7WR++G70MLYM+EQ2NapS
 BXkDv9NIUfjuUhErxQ5aLuAn/eHoK4tf5J45eoUpGn9uSSsueI43HSlLs
 RHk+di+9bRYebQyBeNjrpWTENf33Dpl6saFOCc46UpbzvrHcGiOOu9Fv+ c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: P/S7jxjFRwBXl0tekIGhraIBumb6mmAFmZ0K9Z77ve+8Q7LANu7xIzHk+IUP/rLddfurutOKVC
 CT4J26td5aEpl2HgNtM3gYu6JU3QChcGC+7v4Ip57olcbn50A5xnPUvYBErNPvuO1b7/Ln/N9N
 A78+b438osyouzwihUwgtBbBfhH6NiO4JBDVTImn+lqyVH598oeHYZjWcc9ZBl0oXulgp4zvwC
 Z2yZ84qO1JIIZtd0aKJuhVvvHwunWHizpcREoVDAjLDEk5xOhq34NvE32+2Uce6cY0l8Q04qE1
 WRo=
X-SBRS: 2.7
X-MesageID: 27532996
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,287,1596513600"; d="scan'208";a="27532996"
Subject: Re: [PATCH v4 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
 <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-2-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6e22ec07-d489-33dc-62e7-415e760bb3ea@citrix.com>
Date: Mon, 21 Sep 2020 20:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921180214.4842-2-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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

On 21/09/2020 19:02, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> XENMEM_exchange can only be used by PV guest but the check is well
> hidden in steal_page(). This is because paging_model_external() will
> return false only for PV domain.
>
> To make clearer this is PV only, add a check at the beginning of the
> implementation. Take the opportunity to compile out the code if
> CONFIG_PV is not set.
>
> This change will also help a follow-up patch where the gmfn_mfn() will
> be completely removed on arch not supporting the M2P.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>
> Jan suggested to #ifdef anything after the check to is_pv_domain().
> However, it means to have two block of #ifdef as we can't mix
> declaration and code.
>
> I am actually thinking to move the implementation outside of mm.c in
> possibly arch/x86 or a pv specific directory under common. Any opinion?

arch/x86/pv/mm.c, with the case XENMEM_exchange: moving into
arch_memory_op().

However, making this happen is incredibly tangled, and we're years
overdue a fix here.

Lets go with this for now, and tidying up can come later.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, however...

>
>     Changes in v4:
>         - Patch added
> ---
>  xen/common/memory.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 714077c1e597..9300104943b0 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -504,6 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
>  
>  static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>  {
> +#ifdef CONFIG_PV
>      struct xen_memory_exchange exch;
>      PAGE_LIST_HEAD(in_chunk_list);
>      PAGE_LIST_HEAD(out_chunk_list);
> @@ -516,6 +517,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>      struct domain *d;
>      struct page_info *page;
>  
> +    if ( !is_pv_domain(d) )
> +        return -EOPNOTSUPP;
> +
>      if ( copy_from_guest(&exch, arg, 1) )
>          return -EFAULT;
>  
> @@ -797,6 +801,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)

... there are now a load of #ifdef CONFIG_X86 between these two hunks
which can be dropped.

~Andrew

>      if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>          rc = -EFAULT;
>      return rc;
> +#else /* !CONFIG_PV */
> +    return -EOPNOTSUPP;
> +#endif
>  }
>  
>  int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,


