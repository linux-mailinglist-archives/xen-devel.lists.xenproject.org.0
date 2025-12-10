Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA7CB4092
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 22:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183362.1506090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTRTH-0006vk-03; Wed, 10 Dec 2025 21:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183362.1506090; Wed, 10 Dec 2025 21:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTRTG-0006sx-Th; Wed, 10 Dec 2025 21:11:38 +0000
Received: by outflank-mailman (input) for mailman id 1183362;
 Wed, 10 Dec 2025 21:11:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TEw+=6Q=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTRTF-0006sr-4f
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 21:11:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf0761c3-d60c-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 22:11:35 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5AC4B4EEBC5F;
 Wed, 10 Dec 2025 22:11:34 +0100 (CET)
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
X-Inumbo-ID: cf0761c3-d60c-11f0-b15b-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765401094;
	b=O1XuAQpX4bj9ZB8vwQREnL0lvVZgDWtJsdc/7hOIZddn8fMNiFMqVHAU8Z5+/A7E8x+H
	 GsUbSDOAOHGlD33Uat2bquaCscdphpnUwIcK7RycXcQS58ou//zMdVFD2GRWNdGOfzVHJ
	 VggOM2td9NsyOU6EJYFhn5O2HdianQNdzxk27aChSFFI69BNcoEdvSbmxK+xTLj+pZS7a
	 38VGp1T573BYd8SsJLF6nSnDAjmFHPQYbm5KnbHeFEYekktgJlawzpiMbvGAS7koQ7zBe
	 yam2Ny48j35TSyJHDvPQuGknE9c9j4OkqYUQ9l+1eHwQ6ewXbGCUiikzhqPhbYl+SFvhl
	 FPBB0F1swmwJD+Luf6aTt4zVTTaW7DDpPscMJ/wjo7hd7Mg6T4JDWwCmIq9uTTOQge0Gf
	 2jRy7CUUSiaj97vHTL+RGWoVyGAHUtTxebZF4FWzulXGjiIXHWnhgF17YKgXLCP84hG6z
	 yGljqpULrFPs1HJe4mp7VkXZXZeRWAUM5gOXlCX2v/yC34U5LHB82keZiKC/zHIZPK6yk
	 LEBdabS+nsG1myC7G/EHNUnBsU/tjXDcMrBabt39lp9aJYQomq0v3h/qxjYRAlCSAfjMH
	 um2mnIJmrvHUyvFrmBK3UvilOV4qp+mzULK5UuCm6Ve35WHoYfK04X316ktu+nQ=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765401094;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=bDquDehxI3TmvD/ZVag/FN6qOvIJaedpEm7q9tTfScM=;
	b=yw/6ePXuoIBMQhymAmFuSpzwn0wC6b7xNNaxPuGeySg/CgVir4UMkleR7shARhIsG8EK
	 t1Gq3qKxAjpfw8KOYEm8dZuGb67Q464uDzMRWZAsfuhAHyG3y69GL/PE3wLFvfKkmUrVw
	 T0DObdx1z4sXd5LUlXOnyaIFNi2emluTYdJmEYVgFwekK2DlTTUJl5SuyJofEINZw9v0Q
	 DoKGZn3elmzBQhVE/1Tl+TO+0t6uHYEAzGQjmfK6paduMA6opi4JtpXjc7SB2xC54hO9I
	 P+ybLHhWWB8Zi97nYivHRqJRLyEjVArrySe9IQ9Uvv8RlQhNsoY0Un58Wnle18rWUdajm
	 aTf5GvYwvmMzR3xhMO+UyADQSHTb4pN4hHR6aQHHxlnoQd/l5LAPtmT1KikRbdBUyC3qn
	 2PWoP3WUPbeemi5039Jwksa7wJs0cYpB82ONAqGq3xf+mEK1N2uA/B9BIYnzWSDV4b6oe
	 OFE0+xPo0apgdP9FlGvyZ1CpcCr2u6CPN+l61cIOQo9wDRzQn3mi//vOcylDhv+rorr9V
	 WXOBHOHLwJWca66yWY8sxwK+fveYM3S0O6V6krSxEgGIpM/3kPCU2++wZkxeLbOVY5JQ6
	 VsJLqIPe+BI/nMkEeqLYh34++SSJkknpLDpD0fGcR/LfQvhBuNcgSCwlyi21Dd4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765401094; bh=IQf/2iuESqWwO47FH1x6aWDnmiz0sVvZAQJvvTGit44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=faPHyiWBfpkE1pW8Rx2+ecrp+tCNLNUOEYD+0JC7IogQanxKb+DbuUI3gg5Z83nAE
	 goh1FY7NVFmCLNf5sN+k71390e8WIzIaANaPdgYqVaI8RzYxv61ByAVfXLI/mzF+wu
	 3YlBo/43Xr5R+3UyXSNwnPfo9dm0cAWWiif/zAYU9aoa61XWYnOsPDNqDxU9dNpltW
	 /pzKbozhHEemYRqQUa3argh3AdkeqTY3fCmdTXZEUCg3OwCuXeajKDfJYuSjtyk1zS
	 1yrJ9+Mno04/8rvLkR0uIY/IZMnvVBwsq7ouK7LO1ic0/GKTZ9ZpAUIv8Yzl7L8isS
	 rZsX9Rt3w/17A==
MIME-Version: 1.0
Date: Wed, 10 Dec 2025 22:11:34 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
In-Reply-To: <20251210183019.2241560-6-andrew.cooper3@citrix.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
Message-ID: <a48dece01f70c18be88692e10120599a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-10 19:30, Andrew Cooper wrote:
> With the wider testing, some more violations have been spotted.  This
> addresses violations of Rule 20.7 which requires macro parameters to be
> bracketed.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>  xen/include/xen/kexec.h            | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/shadow/multi.c 
> b/xen/arch/x86/mm/shadow/multi.c
> index 03be61e225c0..36ee6554b4c4 100644
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -781,7 +781,7 @@ do {                                                
>                     \
>          (_sl1e) = _sp + _i;                                            
>  \
>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )          
>  \
>              {_code}                                                    
>  \
> -        if ( _done ) break;                                            
>  \
> +        if ( (_done) ) break;                                          
>  \
>          increment_ptr_to_guest_entry(_gl1p);                           
>  \
>      }                                                                  
>  \
>      unmap_domain_page(_sp);                                            
>  \
> diff --git a/xen/arch/x86/mm/shadow/private.h 
> b/xen/arch/x86/mm/shadow/private.h
> index cef9dbef2e77..93834ec55c42 100644
> --- a/xen/arch/x86/mm/shadow/private.h
> +++ b/xen/arch/x86/mm/shadow/private.h
> @@ -636,9 +636,9 @@ prev_pinned_shadow(struct page_info *page,
>  }
> 
>  #define foreach_pinned_shadow(dom, pos, tmp)                    \
> -    for ( pos = prev_pinned_shadow(NULL, (dom));                \
> -          pos ? (tmp = prev_pinned_shadow(pos, (dom)), 1) : 0;  \
> -          pos = tmp )
> +    for ( (pos) = prev_pinned_shadow(NULL, dom);                \
> +          (pos) ? (tmp = prev_pinned_shadow(pos, dom), 1) : 0;  \
> +          (pos) = tmp )
> 
>  /*
>   * Pin a shadow page: take an extra refcount, set the pin bit,
> diff --git a/xen/drivers/passthrough/vtd/dmar.h 
> b/xen/drivers/passthrough/vtd/dmar.h
> index 0ff4f365351f..11590f71a828 100644
> --- a/xen/drivers/passthrough/vtd/dmar.h
> +++ b/xen/drivers/passthrough/vtd/dmar.h
> @@ -124,7 +124,7 @@ struct acpi_atsr_unit 
> *acpi_find_matched_atsr_unit(const struct pci_dev *);
>  do {                                                \
>      s_time_t start_time = NOW();                    \
>      while (1) {                                     \
> -        sts = op(iommu->reg, offset);               \
> +        sts = op((iommu)->reg, offset);             \
>          if ( cond )                                 \
>              break;                                  \
>          if ( NOW() > start_time + DMAR_OPERATION_TIMEOUT ) {    \
> diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
> index e66eb6a8e593..5dd288d1a50e 100644
> --- a/xen/include/xen/kexec.h
> +++ b/xen/include/xen/kexec.h
> @@ -66,9 +66,9 @@ void vmcoreinfo_append_str(const char *fmt, ...)
>  #define VMCOREINFO_PAGESIZE(value) \
>         vmcoreinfo_append_str("PAGESIZE=%ld\n", value)
>  #define VMCOREINFO_SYMBOL(name) \
> -       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned 
> long)&name)
> +       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #name, (unsigned 
> long)&(name))
>  #define VMCOREINFO_SYMBOL_ALIAS(alias, name) \
> -       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #alias, (unsigned 
> long)&name)
> +       vmcoreinfo_append_str("SYMBOL(%s)=%lx\n", #alias, (unsigned 
> long)&(name))
>  #define VMCOREINFO_STRUCT_SIZE(name) \
>         vmcoreinfo_append_str("SIZE(%s)=%zu\n", #name, sizeof(struct 
> name))
>  #define VMCOREINFO_OFFSET(name, field) \

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

