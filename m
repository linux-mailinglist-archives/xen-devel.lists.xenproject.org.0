Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607DB101C4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055318.1423735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqP7-0006vL-Ee; Thu, 24 Jul 2025 07:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055318.1423735; Thu, 24 Jul 2025 07:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqP7-0006t4-Bb; Thu, 24 Jul 2025 07:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1055318;
 Thu, 24 Jul 2025 07:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P3HE=2F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ueqP4-0006rd-Fo
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:30:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 064b19ac-6860-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 09:30:08 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 36F574EE3C07;
 Thu, 24 Jul 2025 09:30:07 +0200 (CEST)
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
X-Inumbo-ID: 064b19ac-6860-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753342207;
	b=4ODzr59seAvjmvQO15/cqvlVY2CScOWyAy32+sCMxdtlobcPIuAuVjVIyxtgvW7qmBrM
	 cS8VUZuJB4l4FXQF1JRzS3hfOc4wjNEmdTt+905SS4hAoLhVM1vQLId+sOXWdxOH845YJ
	 KEqX+NtIgvoDSPA0HTigWi12Bsgsam3vkRDY2++h4QEY4R7YzwIxNSPKSjPEjNRJRf3YD
	 /IUiw6Mg3LxBrWFShTOfLXYuWuwGAdgGn7WapWpVwjbTO0ATK8G5I9fifmD10hzqINafP
	 NErx9rBAa1C6XcTSAzmjlpcYl5d86NBDzwgLNeGKdpip29ogMZtLtP5+slWPOrgrlnUfL
	 4htRcY6uqvCyp0y/OQZoG6T6n7gYAoCSbC0KMdmsjDNto6FvGI0HDsF8nM2uUaA1hZMmS
	 eQdwAE662ZJzlklZGTxydW0EOpypujWR56sQ1/Acorn4BHLNaafuY4FIlTDfD9bpSkn4V
	 2kM3yKL1O16msZt87Uj2SaP30dtrR29e9QzhDRvGFdNgVkw6lr3x0MIg8RPjWGVL86ENE
	 ET/qWVWQYS4nwkRkM6C4RfvrLbu3AN75Je8eSgyKcOh+h6wSUPfvtl4xxxQHAJNTOA+pW
	 4juSmOKX22A08TqeFihsgdpcJUn3Ker9RnTCdXjnCMiPEmzrrWgOkECsthgzKoc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753342207;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=IaNw4G2pnOmdRpNiCicgUBey/lfUFaufRqjkrS5rtLU=;
	b=wYjSGrjBrEpWbG2huGTnt3f2uY9/8gKH2EJIxClgyRpYJ7y8r7JCm0EF8JVHYUMJd5Dj
	 3vGtEJcEbCPXk7Vmrgzf472zOZZ0NV8QIzJ0ps6A0s+JivDvaMp5OvAs4QzjfkcKXi8Ee
	 3qORQ0YfU6/gSPN2ePBtRZKRnPCbaH50B3c9jdaiKALLRzRpv3ZtEAMmp9CORXlD4V2Xm
	 FrrsFB1oI4FK1C6vOEpB8Be0L4xOV/UdOiG+071dTw3nTtpxhaMx/JW9NbC9qNfgdMVet
	 7PAGNffQFwp4g+exdeg4RiUwI2had2cXwN+Hw0G+7q9OugOaiM78rtx9VHJWG5yDUYoIe
	 1D6VYknIwinhb6bzTS8ZsTeOsg1kAPNWh8fnV1C0xPRUNQTG+mnk46p7gfyorpDGjjsv9
	 pmJiQhYyGptIT2eDt49i5BoYYRXNfixtxnaursGOwApC5V/Iq7XhDOi+6+n8rVpJ25ONc
	 5ZlEcieP8Zsyz7UY6EfZ51UV29a3pkHlPP+yvzAGUpCxED4FmrGn6fJdj+T0RK80n/ZCz
	 OrB57iyhBIfPLQ67hdoqxDez0BbrJIhQg2Gw33w1c9uUCsKWA9A9Bf8+qDJzdITiq9b4+
	 RuT/x9DEXSXwON5bQU1QpIWR3viWaLkBn+eGkK0P5MX6xArtdaKPT7X9cMQXOQU=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753342207; bh=dyFDrs22zP9fULKzYjrQhIQZOVENGWtRbkoDRSTPJJ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DkdbNqSdifz0vKBpSj0XbVZ1YyMhd5O09GMdG/5COeJmAAofgypGRWvEI5WffCsVn
	 kgXV0Z6Cf2rcFYxP9iQybs2dsyYRsPHQrEkOBp0cHq/ffbSxvrvvUrjzZTbcWayNMp
	 lhn2pmsoRPVsB+ItJbyR6kmh9XsRRIKY/WGTPmFRd3f1pr59+CC3O0rFg8/FfQ57/J
	 76KG/OD68SjJDj1EljJCikuaOEV02oweL6TiKkXsKd27MVCODOL/XyIPevb7s0OaVF
	 KBuIE/JUY8sQxn7GQUvA/5aD5WWQvFC9pFCQthaddJuFHHleIDCOgr4FHWVMiee6Np
	 IaaEwZTn/QpsA==
MIME-Version: 1.0
Date: Thu, 24 Jul 2025 09:30:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
In-Reply-To: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
References: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
Message-ID: <2d72df9f8dcc9c21023e5166cb82fbac@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-23 12:12, Dmytro Prokopchuk1 wrote:
> Rule 18.3: "The relational operators >, >=, < and <=
> shall not be applied to objects of pointer type
> except where they point into the same object".
> 
> Update relational comparison to cast `text_start`
> (void pointer) to `unsigned long`. This ensures the
> comparison occurs between two values of the same integral type.
> 
> Update relational comparison between `lock1` and `lock2` to cast
> pointers to `uintptr_t`. This ensures MISRA C compliance and avoids
> undefined behavior when comparing pointer values directly.
> 
> Update for-loop condition to cast pointers `p` and `params->checksum`
> to `uintptr_t` for the relational `<` operator. This resolves a MISRA C 
> 18.3
> violation by ensuring that relational operations are not performed 
> directly
> on pointers of different objects (which is undefined behavior).
> 
> Add Rule 18.3 deviations.
> 
> Add Rule 18.3 to the monitored set.
> 
> No functional changes to program behavior.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> This patch eliminates MISRA C Rule 18.3 violations for both ARM and 
> X86.
> 
> Test CI: 
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1943306650
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  automation/eclair_analysis/ECLAIR/monitored.ecl  | 1 +
>  xen/arch/x86/efi/efi-boot.h                      | 3 ++-
>  xen/common/sched/core.c                          | 2 +-
>  xen/common/virtual_region.c                      | 4 ++--
>  5 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 483507e7b9..d89834a49b 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -568,6 +568,14 @@ C99 Undefined Behaviour 45: Pointers that do not 
> point into, or just beyond, the
>  -config=MC3A2.R18.2,reports+={safe, 
> "any_area(any_loc(any_exp(macro(^page_to_mfn$))))"}
>  -doc_end
> 
> +-doc_begin="Consider relational pointer comparisons in kernel-related 
> sections as safe and compliant."

This would need some evidence that they don't compare pointers to 
different arrays, wouldn't it?

> +-config=MC3R1.R18.3,reports+={safe, 
> "any_area(any_loc(any_exp(macro(name(is_kernel||is_kernel_text||is_kernel_rodata||is_kernel_inittext)))))"}
> +-doc_end
> +
> +-doc_begin="Allow deviations for pointer comparisons in BUG_ON and 
> ASSERT macros, treating them as safe for debugging and validation."
> +-config=MC3R1.R18.3,reports+={safe, 
> "any_area(any_loc(any_exp(macro(name(BUG_ON||ASSERT)))))"}
> +-doc_end
> +

same here: no matter that they are used for debugging, if you mark 
something as "safe", then the argument needs to be there (in the .rst 
file, but still).

>  -doc_begin="Flexible array members are deliberately used and XEN 
> developers are aware of the dangers related to them:
>  unexpected result when the structure is given as argument to a 
> sizeof() operator and the truncation in assignment between structures."
>  -config=MC3A2.R18.7,reports+={deliberate, "any()"}
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl 
> b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 00bff9edbe..b8fb297e73 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -68,6 +68,7 @@
>  -enable=MC3A2.R17.6
>  -enable=MC3A2.R18.1
>  -enable=MC3A2.R18.2
> +-enable=MC3A2.R18.3
>  -enable=MC3A2.R18.6
>  -enable=MC3A2.R18.8
>  -enable=MC3A2.R19.1
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 0194720003..170c569eb4 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -461,7 +461,8 @@ static void __init efi_arch_edd(void)
>                  params->device_path_info_length =
>                      sizeof(struct edd_device_params) -
>                      offsetof(struct edd_device_params, key);
> -                for ( p = (const u8 *)&params->key; p < 
> &params->checksum; ++p )
> +                for ( p = (const u8 *)&params->key;
> +                      (uintptr_t)p < (uintptr_t)&params->checksum; ++p 
> )
>                      params->checksum -= *p;
>                  break;
>              case MEDIA_DEVICE_PATH:
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index ea95dea65a..c3c101c142 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -360,7 +360,7 @@ static always_inline void sched_spin_lock_double(
>      {
>          *flags = _spin_lock_irqsave(lock1);
>      }
> -    else if ( lock1 < lock2 )
> +    else if ( (uintptr_t)lock1 < (uintptr_t)lock2 )
>      {
>          *flags = _spin_lock_irqsave(lock1);
>          _spin_lock(lock2);
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index 1dc2e9f592..515751b6c3 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -83,8 +83,8 @@ const struct virtual_region 
> *find_text_region(unsigned long addr)
>      rcu_read_lock(&rcu_virtual_region_lock);
>      list_for_each_entry_rcu ( iter, &virtual_region_list, list )
>      {
> -        if ( (void *)addr >= iter->text_start &&
> -             (void *)addr <  iter->text_end )
> +        if ( addr >= (unsigned long)iter->text_start &&
> +             addr <  (unsigned long)iter->text_end )
>          {
>              region = iter;
>              break;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

