Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF1A7AFF2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937286.1338295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0RjW-000621-Iw; Thu, 03 Apr 2025 21:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937286.1338295; Thu, 03 Apr 2025 21:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0RjW-000601-Ft; Thu, 03 Apr 2025 21:04:18 +0000
Received: by outflank-mailman (input) for mailman id 937286;
 Thu, 03 Apr 2025 21:04:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FCKq=WV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u0RjU-0005zv-AB
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:04:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3075b84d-10cf-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 23:04:10 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id E39ED4EE0760;
 Thu,  3 Apr 2025 23:04:09 +0200 (CEST)
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
X-Inumbo-ID: 3075b84d-10cf-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1743714250;
	b=m65MH6PMh+Z8sP6Yz+fDgP2Gov3kBRHobRa2erME6vUMbXSpxx7vzXm7eagrWQzMf59c
	 t45OASjT+fxNIFRBoA3M7qVzdORDw++tBZqpVpFstrCEj+KSx2kUPDY3zg8/y0gS+jfVI
	 gdMjb81a2KTvc0XsiVtoxVNpx6GwA69WOkjeMCGgPiyB1qTRdVoEa6gwL78ed3/Z2Vr0L
	 TNjL9OhMdWwgdgRNm8sm+E2PEX06vdn0U5aJT/DRtwXt/lGr7o6BqDxw2D8F5Lq99q3Mo
	 KfW1++tpiyqr1gcRq1wbBflwlUuCXRy1fBHFnjDbzdH4tcTO27HkSV24N6awUVGcYsE4b
	 H4hO4kR+E3ngZ5nTHUBx9uPt+3HVdWxA9qNuEovrVEno5ckKaPVkVubuz9yU298upCGXF
	 D9dU0T5ZtM+9O8nXe2+dwj/rTUzBOKXW/vyyaR2V7P8NYpq7tQPS9UdSLFMhHUTUdEQn7
	 +uWd5XtyrD34ub05yHKKJr5K2gSFIQhYoVU/c6jxoAO6Udqr0y0corql3N8cEAjk1eYRj
	 wNhat0ICqCEvq7dxJYo8p5edLPv0NC44fJx+ZEeZjXwGaxesxNwalJTSoP3kWW82Hb6KF
	 c3LGl0M7CUIfRNZsL+bAE3v0GheGdvLlo087/XMUE2wCrg5gjXxGZsNxiGVbb4M=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1743714250;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=bNKV1CpW/BD9WuAo7027O2LdhCDRUgtWGbEKGY7b5BY=;
	b=vunKxsNRNwoZgcPCVFvhd+682pCGuiqJhqvxmrK61zx4xZpQoGcO1n7x1e1W8YFNBEEH
	 5+WX+MxkrhqNWvY6gF4D0Ip0IwQrv+dtI6/jVwjs+abdP22wCrPMvF6+T3QuIGmvspCY8
	 +4KC8otF77Xv2TjW9dfsxeF9k1KGc+luzexw5XRfIWv53Z3hMtORgQM0PmFOmSBqEP3CO
	 g2SEgMTx7CiUG2zcCV2Nap5l/8BC4DjJNka2V49w+ZWoqkj5eWC88m3bkgB0E7CTunRV6
	 vNAT9OfZMTBA5nQzc3MY2yzXVRIxzkUoav6EvIR7MNlXhWi1sfyEhD52ZacvgHnUxSHAo
	 ktQEDsCw/ROlgTs4o26QHJ5JpQYqIUUzUo+t++o95Qt4G6tb4SecHfSJyrl/MZ52tqn+y
	 8KCK1T6E5ucX6sdia0kdscxcRaunvXYQ4qCHrMph7hjoh+7rC7uank1SvwkUYTWBN9H7Q
	 tXVM5LnCDqzGM4ItQP/9ffUPZLt5IdAEDnZ7tIgqFvXhOIJnHljCNY1A8vddpqOQGK1yh
	 OfjeakZ1+Q1e3wyqqq+eP/dX3YZS/RBRtoAM8iAJirfzUYnY9BteNtF8YreGs1puWhq+I
	 /1UtJ/GyKqMGrrjKNAe/9Ty4R4SMDUcORbpruUWC1t7OUB6a50Z3q/6JjVZ1U+E=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1743714250; bh=2ZKvMUyb4z3UnsmvX2bhdj7iNZfotJQrDzWdLFcDreY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g5JgpjNlumeEskw6kOv1vaOz/dm/qUr3/l3z3pm9TMduTAdF5T+EvB2FUeOjUMrHY
	 VwT8pVEFzHFDOlze2sUdvtEY0919llAyxcIuZ6E/qFDyP/lu2m7Etw3Lm0SUdjOeDA
	 zIG3X2Once4xQ7cEJw39vkmamU1Jzc6koOHKdICOKYzu8RMAslNdSFuFdrSGXqmEGZ
	 2QoHsQrsIGNae5kERavZqvQayKSiE8JUrf0PqMB5qyObeJCtgdjlcdqjf3HzYALZnN
	 a64uskjl8PgGJ3f9vibNuRYqpGegFPA5udk4n36PoeOa+u1Ypydy0NvZMYEhJ0cWoy
	 nfhqUzGzgR6lA==
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 23:04:09 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, consulting@bugseng.com
Subject: Re: [PATCH] xen: Swap 'const static' for 'static const'
In-Reply-To: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
References: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
Message-ID: <5e92df092cc323b061716004fdd41c33@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-03 22:43, Andrew Cooper wrote:
> MISRA C:2012 Ammendment 3 (which is under consideration, but not used 
> by Xen
                ^ typo
> yet) is more particular about the order of keywords.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Any specific reason not to give [1] and [2] the same treatment? Other 
than that, looks good to me.

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MISRA_C_AMD3/X86_64/9616508934/PROJECT.ecd;/sources/xen/arch/x86/genapic/x2apic.c.html#R4145_1
[2] 
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/MISRA_C_AMD3/X86_64/9616508934/PROJECT.ecd;/sources/xen/arch/x86/hvm/dom0_build.c.html#R13937_1

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com
> ---
>  xen/arch/arm/gic-v2.c  | 2 +-
>  xen/include/xen/init.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 02043c0d4b1f..b23e72a3d05d 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1311,7 +1311,7 @@ static void gicv2_do_LPI(unsigned int lpi)
>      BUG();
>  }
> 
> -const static struct gic_hw_operations gicv2_ops = {
> +static const struct gic_hw_operations gicv2_ops = {
>      .info                = &gicv2_info,
>      .init                = gicv2_init,
>      .secondary_init      = gicv2_secondary_cpu_init,
> diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
> index 0a4223833755..abf275f0eb72 100644
> --- a/xen/include/xen/init.h
> +++ b/xen/include/xen/init.h
> @@ -63,9 +63,9 @@ typedef int (*initcall_t)(void);
>  typedef void (*exitcall_t)(void);
> 
>  #define presmp_initcall(fn) \
> -    const static initcall_t __initcall_##fn __init_call("presmp") = 
> (fn)
> +    static const initcall_t __initcall_##fn __init_call("presmp") = 
> (fn)
>  #define __initcall(fn) \
> -    const static initcall_t __initcall_##fn __init_call("1") = (fn)
> +    static const initcall_t __initcall_##fn __init_call("1") = (fn)
>  #define __exitcall(fn) \
>      static exitcall_t __exitcall_##fn __exit_call = fn
> 
> 
> base-commit: befc384d21784affa3daf2abc85b02500e4dc545

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

