Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF3A06F95
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 08:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867829.1279375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnQk-0007CZ-MZ; Thu, 09 Jan 2025 07:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867829.1279375; Thu, 09 Jan 2025 07:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVnQk-0007AQ-Jd; Thu, 09 Jan 2025 07:58:14 +0000
Received: by outflank-mailman (input) for mailman id 867829;
 Thu, 09 Jan 2025 07:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pmh1=UB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tVnQi-0007AI-IH
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 07:58:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77e41db3-ce5f-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 08:58:10 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2DDD74EE0738;
 Thu,  9 Jan 2025 08:58:09 +0100 (CET)
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
X-Inumbo-ID: 77e41db3-ce5f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1736409489; bh=OgbivrCiHo3rweuOIoES0Qt2H48OR3AsalfdoGE27aA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F0cO2BDupEKy02UvrkT98NdXSdkoOy7n9H/9dp9Vh26o1Q0KLUU1Gw0x66+9/dckX
	 3Kl7kPXOo4O7nvgVPHMHkDnbe8jMGrGpGcmuFFqYbaL2xsUIbCbaJA0fPz5v8g0I9b
	 gEKpk32oONm3J0NbZVEpne3w/DmxIbJlf0+OfgYNoUx/j+pvS+Z3erAb04p49znzOc
	 zDhO39Qjhv+uFTtGxQgSuxcFeJrrEXFV04O9/1CWTUKa5L9A6Mgqof/azLNPp1ZnQe
	 S3GOTzS3JnY9xE9QXigKAN5mUqeeCZIpz0axc5UU+3fj6aclNG3KgdtPwcRMZwRjh6
	 gwbiCDiiBBTYQ==
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 08:58:09 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com
Subject: Re: [PATCH v2 1/2] x86/uaccess: rework user access speculative harden
 guards
In-Reply-To: <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
References: <20241126093508.6966-1-roger.pau@citrix.com>
 <20241126093508.6966-2-roger.pau@citrix.com>
 <cf1f87d1-f616-4944-94fa-69a777249072@suse.com>
 <e3ec3dad28dc94436c0b330b2f995120@bugseng.com>
 <alpine.DEB.2.22.394.2501031617280.16425@ubuntu-linux-20-04-desktop>
Message-ID: <8e31daaf77216534c252d371a3251595@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-01-04 01:20, Stefano Stabellini wrote:
> Hi Nicola, one question below
> 
> On Wed, 27 Nov 2024, Nicola Vetrini wrote:
>> > #define AMD_OSVW_ERRATUM(osvw_id, ...)  osvw_id, __VA_ARGS__, 0
>> >
>> > where we're using the C99 form rather than the GNU extension, and where
>> > hence __VA_ARGS__ would - by extrapolation of the Misra rule - need
>> > parenthesizing, when it isn't and can't be.
>> >
>> > Isn't it rather the case that variable argument macros need a more general
>> > deviation, if not an adjustment to the Misra rule? Extending the Cc list
>> > some ...
> 
> Nicola, if you look at the original patch:
> https://marc.info/?l=xen-devel&m=173261356716876
> 
> "The current guards to select whether user accesses should be 
> speculative
> hardened violate Misra rule 20.7, as the UA_KEEP() macro doesn't (and 
> can't)
> parenthesize the 'args' argument."
> 
> And the very first change in the patch is:
> 
> diff --git a/xen/arch/x86/include/asm/uaccess.h 
> b/xen/arch/x86/include/asm/uaccess.h
> index 2d01669b96..6b8150ac22 100644
> --- a/xen/arch/x86/include/asm/uaccess.h
> +++ b/xen/arch/x86/include/asm/uaccess.h
> @@ -24,9 +24,6 @@ unsigned int copy_from_unsafe_ll(void *to, const void 
> *from, unsigned int n);
>  void noreturn __get_user_bad(void);
>  void noreturn __put_user_bad(void);
> 
> -#define UA_KEEP(args...) args
> -#define UA_DROP(args...)
> -
>  /**
>   * get_guest: - Get a simple variable from guest space.
>   * @x:   Variable to store result.
> 
> 
> Do you think there is any way we could configure Eclair, with or 
> without
> a deviation, not to detect every use of UA_KEEP as violations?

I narrowed this violation down to a different treatment of the named 
variadic argument. Since the argument 'args' cannot be parenthesized as 
a regular argument could, the invocations of the 'UA_KEEP' cannot comply 
with the rule. Therefore, as an extension to the rule, ECLAIR currently 
ignores the use of '__VA_ARGS__' in a macro definition, but treats 
'args...' as a regular macro parameter name, hence the violation.

To be clear, these two definitions have the same semantics, but one 
shows a violation and the other doesn't

#define UA_KEEP(args...) args
#define UA_KEEP(...) __VA_ARGS__

I will update ECLAIR to treat the two forms as the same, so this patch 
can be dropped. If you think it's helpful I can send a patch spelling 
out this - arbitrary, but reasonable in my opinion - extension to the 
MISRA rule (which does not consider the implications related to the use 
of GNU exensions) so that contributors have a clear picture of the 
situation.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

