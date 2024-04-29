Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D88B62BC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 21:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714382.1115585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Wso-0000Tm-1R; Mon, 29 Apr 2024 19:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714382.1115585; Mon, 29 Apr 2024 19:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Wsn-0000Ra-UJ; Mon, 29 Apr 2024 19:41:49 +0000
Received: by outflank-mailman (input) for mailman id 714382;
 Mon, 29 Apr 2024 19:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPPc=MC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1Wsm-0000RU-CQ
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 19:41:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8320f43f-0660-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 21:41:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8566D4EE0738;
 Mon, 29 Apr 2024 21:41:45 +0200 (CEST)
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
X-Inumbo-ID: 8320f43f-0660-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 29 Apr 2024 21:41:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau?=
 =?UTF-8?Q?_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/3] x86: detect PIC aliasing on ports other than
 0x[2A][01]
In-Reply-To: <c29ced52-6e1e-4997-81ab-8882df2d38a7@suse.com>
References: <0c45155a-2beb-4e69-bca3-cdf42ba22f2b@suse.com>
 <c29ced52-6e1e-4997-81ab-8882df2d38a7@suse.com>
Message-ID: <b4f7b508c0bc28b4531680813f809dbc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-18 15:48, Jan Beulich wrote:
> ... in order to also deny Dom0 access through the alias ports. Without
> this it is only giving the impression of denying access to both PICs.
> Unlike for CMOS/RTC, do detection very early, to avoid disturbing 
> normal
> operation later on.
> 
> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> from the probed alias port won't have side effects in case it does not
> alias the respective PIC's one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Use new command line option. s/pic/8252A/. Re-base over new earlier
>     patch. Use ISOLATE_LSB().
> 

Hi,

coming back to this patch, which I believe didn't receive much feedback 
and thus wasn't committed, for a reason:

> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -19,6 +19,7 @@
>  #include <xen/delay.h>
>  #include <asm/apic.h>
>  #include <asm/asm_defns.h>
> +#include <asm/setup.h>

Here asm/setup is included, which provides the declaration for init_IRQ, 
defined below in the file

> 
>  void __init init_IRQ(void)
> @@ -343,6 +396,8 @@ void __init init_IRQ(void)
> 

which is defined here. This patch would, among other things, address a 
MISRA C Rule 8.4 violation ("A compatible declaration shall be visible 
when an object or function with external linkage is defined"). I did 
send a patch concerned only with the MISRA violation, but correctly it 
was pointed out that this one was doing that and more. Perhaps someone 
can have a look at this?

>      init_8259A(0);
> 
> +    probe_8259A_alias();
> +
>      for (irq = 0; platform_legacy_irq(irq); irq++) {
>          struct irq_desc *desc = irq_to_desc(irq);
> 
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -46,6 +46,8 @@ extern uint8_t kbd_shift_flags;
>  extern unsigned long highmem_start;
>  #endif
> 
> +extern unsigned int i8259A_alias_mask;
> +
>  extern int8_t opt_smt;
>  extern int8_t opt_probe_port_aliases;

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

