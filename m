Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313BC8B66EB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 02:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714440.1115675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1bTP-0005Ux-Kk; Tue, 30 Apr 2024 00:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714440.1115675; Tue, 30 Apr 2024 00:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1bTP-0005SV-IA; Tue, 30 Apr 2024 00:35:55 +0000
Received: by outflank-mailman (input) for mailman id 714440;
 Tue, 30 Apr 2024 00:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVXM=MD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1s1bTO-0005SP-1K
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 00:35:54 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988fed48-0689-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 02:35:52 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1714437346348812.2201374129029;
 Mon, 29 Apr 2024 17:35:46 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 988fed48-0689-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1714437347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NcD4Pp5emNoAzQIerOrpglkZEpXtzo4z2IJxg8y1SPQdJtPq9daUqPS/vLFxtiZ33XdVXpx4pfVnd7i+bd9eGVnm30ROCNVC4FzOm9h6iEjpy67AIoMo5qO52+IHeQd5Yc2zzmMOt0rna0mmrLgMO6EhBLOIYNhs8M7k5P0uofY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1714437347; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZsNtckI8sAsvwz3ieY4PW/i14UFHLaAmU4jvY212/7Q=; 
	b=ix/kO40BLAhYRuW6pukvwiVLPT3lA42hItfB1UX4dSPM68N0A+zQWpDmTj+k9S5DBXPuxW/pNs2+Zfofc2KqxWZSUD6QL/QK+qETHL0gfnaBiZhkrJJN0r1i0f22LcMQbrNnX+KHKHzd5gc3t3hIOoGQ+WChGFhW3XBNWokoBmM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1714437347;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZsNtckI8sAsvwz3ieY4PW/i14UFHLaAmU4jvY212/7Q=;
	b=WV2rf7bXTfEw5NMG3RMKC57sre8zLh0EgUoHgYyVg3TduRwO6S8+tFYrb66n7gBZ
	eIU02TCoXLqgiFXeUHzfk6BgfJhC++gxaCvClatzDKD1vu/4vOqSLUGAZHjNostmT5X
	X9RNMGdDRwxNbUcPsw9x/P0DSrhKuADvyAHi76jU=
Message-ID: <5ff31bae-5a70-498e-ba4e-5bf69e08d80a@apertussolutions.com>
Date: Mon, 29 Apr 2024 20:35:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <20240426031455.579637-3-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/25/24 23:14, Henry Wang wrote:
> For use cases such as Dom0less PV drivers, a mechanism to communicate
> Dom0less DomU's static data with the runtime control plane (Dom0) is
> needed. Since on Arm HVMOP is already the existing approach to address
> such use cases (for example the allocation of HVM_PARAM_CALLBACK_IRQ),
> add a new HVMOP key HVM_PARAM_MAGIC_BASE_PFN for storing the magic
> page region base PFN. The value will be set at Dom0less DomU
> construction time after Dom0less DomU's magic page region has been
> allocated.
> 
> To keep consistent, also set the value for HVM_PARAM_MAGIC_BASE_PFN
> for libxl guests in alloc_magic_pages().
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>   tools/libs/guest/xg_dom_arm.c   | 2 ++
>   xen/arch/arm/dom0less-build.c   | 2 ++
>   xen/arch/arm/hvm.c              | 1 +
>   xen/include/public/hvm/params.h | 1 +
>   4 files changed, 6 insertions(+)
> 
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 8cc7f27dbb..3c08782d1d 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -74,6 +74,8 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
>       xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
>       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
>   
> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_MAGIC_BASE_PFN,
> +            base);
>       xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
>               dom->console_pfn);
>       xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 40dc85c759..72187c167d 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -861,6 +861,8 @@ static int __init construct_domU(struct domain *d,
>               free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
>               return rc;
>           }
> +
> +        d->arch.hvm.params[HVM_PARAM_MAGIC_BASE_PFN] = gfn_x(gfn);
>       }
>   
>       return rc;
> diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
> index 0989309fea..fa6141e30c 100644
> --- a/xen/arch/arm/hvm.c
> +++ b/xen/arch/arm/hvm.c
> @@ -55,6 +55,7 @@ static int hvm_allow_get_param(const struct domain *d, unsigned int param)
>       case HVM_PARAM_STORE_EVTCHN:
>       case HVM_PARAM_CONSOLE_PFN:
>       case HVM_PARAM_CONSOLE_EVTCHN:
> +    case HVM_PARAM_MAGIC_BASE_PFN:
>           return 0;

I know you are just adding, so more of a question for the Arm maintainers:

Why does Arm have a pair of private access control functions subverting XSM?

v/r,
dps

