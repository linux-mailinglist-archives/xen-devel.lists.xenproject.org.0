Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA664ACF4FD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007239.1386549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNE3O-00032u-MV; Thu, 05 Jun 2025 17:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007239.1386549; Thu, 05 Jun 2025 17:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNE3O-00031D-JZ; Thu, 05 Jun 2025 17:06:58 +0000
Received: by outflank-mailman (input) for mailman id 1007239;
 Thu, 05 Jun 2025 17:06:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95Iq=YU=bounce.vates.tech=bounce-md_30504962.6841ceae.v1-6c9a378f36024232a7564311669ba435@srs-se1.protection.inumbo.net>)
 id 1uNE3M-000317-UO
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:06:57 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b509377-422f-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 19:06:55 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bCrTV1kv6zS63LyK
 for <xen-devel@lists.xenproject.org>; Thu,  5 Jun 2025 17:06:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6c9a378f36024232a7564311669ba435; Thu, 05 Jun 2025 17:06:54 +0000
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
X-Inumbo-ID: 7b509377-422f-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749143214; x=1749413214;
	bh=fKuSwTCyXu9Im5b8kMkxc1XVU5MJZjNRA+QKFgbejZQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sn7MBWNYJQINSk1ehIS4/BS9g/m2TKO7euQGrr8nA9nwDJLyWFYjHNYzHKjbb3eXi
	 JeUjuxWL9+VxUmlTzwQ+hiRfsFHUyINp7nx1iAjGkxpIiw9sWmln+Ql9VTs1c9qqTN
	 XuiLEJopgNN2drfPsxr6ZLVJjjOokPjRZkSfGvXdRhnLwS6K/Jd5At3+WMA6l+zrDS
	 DQo7f0vDat7++QIusW0K7OmjEWPhqHGYHVE4IK4gARGYm/IgEoTmBi63vBDz7tOzIZ
	 Wb3D0JhXVynn7y5zeR6ietFOMcHINWYSWgE4nAUl7VwAdfFEAboaxpcATbcJGCqQ4W
	 YrFed2Yt9n8kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749143214; x=1749403714; i=teddy.astie@vates.tech;
	bh=fKuSwTCyXu9Im5b8kMkxc1XVU5MJZjNRA+QKFgbejZQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xrB+24ihoyBNlOvQR07ThvppBH13Qi6W+lpoJ746ymHrQBtEWr+JIGjgEXuXbIrTG
	 1vax12DaclQTuewSlw7anO23AgsyDknH/CcMW10DrNHdtmSXzGo1C2Rbk+a1UyJf5u
	 Aitua51QQgsOW8DDZGU4lbCcrsG+fAZe5sHsprZEj6zMiC2T+U4aRuazVuiUpMFl9d
	 T0eHKe0nAmKuKSr4ft4njCMPsXMxrPRB6DeNT19WkOv+WLagvBE/V97dvREPXcXwij
	 astTigq3wpnZXzYUp8ucP6aTE5TwcmdHrXKLdzNv4JHjI/YYHUuRp+7yWAMmpjEFhi
	 gPactjBjCKdWQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=203/6]=20x86:=20re-work=20memcpy()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749143213293
Message-Id: <81da4e8e-9dcf-4630-a535-39ce0b07260c@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com> <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
In-Reply-To: <017e689a-41a2-4722-a5e7-19ffef27500f@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6c9a378f36024232a7564311669ba435?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250605:md
Date: Thu, 05 Jun 2025 17:06:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 05/06/2025 =C3=A0 12:27, Jan Beulich a =C3=A9crit=C2=A0:
> Move the function to its own assembly file. Having it in C just for the
> entire body to be an asm() isn't really helpful. Then have two flavors:
> A "basic" version using qword steps for the bulk of the operation, and an
> ERMS version for modern hardware, to be substituted in via alternatives
> patching.
> 
> Alternatives patching, however, requires an extra precaution: It uses
> memcpy() itself, and hence the function may patch itself. Luckily the
> patched-in code only replaces the prolog of the original function. Make
> sure this remains this way.
> 

We can probably workaround that by using a separate memcpy for 
alternatives patching. So it wouldn't end up patching itself.

> Additionally alternatives patching, while supposedly safe via enforcing
> a control flow change when modifying already prefetched code, may not
> really be. Afaict a request is pending to drop the first of the two
> options in the SDM's "Handling Self- and Cross-Modifying Code" section.
> Insert a serializing instruction there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> We may want to consider branching over the REP MOVSQ as well, if the
> number of qwords turns out to be zero.
> We may also want to consider using non-REP MOVS{L,W,B} for the tail.
> 
> TBD: We may further need a workaround similar to Linux'es 8ca97812c3c8
>       ("x86/mce: Work around an erratum on fast string copy
>       instructions").
> 
> TBD: Some older AMD CPUs have an issue with REP MOVS when source and
>       destination are misaligned with one another (modulo 32?), which may
>       require a separate memcpy() flavor.
> ---
> v5: Re-base.
> v4: Use CR2 write as serializing insn, and limit its use to boot time.
> v3: Re-base.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_RETURN_THUNK) +=3D indirect-t
>   obj-$(CONFIG_PV) +=3D ioport_emulate.o
>   obj-y +=3D irq.o
>   obj-$(CONFIG_KEXEC) +=3D machine_kexec.o
> +obj-y +=3D memcpy.o
>   obj-y +=3D memset.o
>   obj-y +=3D mm.o x86_64/mm.o
>   obj-$(CONFIG_VM_EVENT) +=3D monitor.o
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -195,12 +195,16 @@ void *place_ret(void *ptr)
>    * executing.
>    *
>    * "noinline" to cause control flow change and thus invalidate I$ and
> - * cause refetch after modification.
> + * cause refetch after modification.  While the SDM continues to suggest=
 this
> + * is sufficient, it may not be - issue a serializing insn afterwards as=
 well,
> + * unless this is for live-patching.
>    */
>   static void init_or_livepatch noinline
>   text_poke(void *addr, const void *opcode, size_t len)
>   {
>       memcpy(addr, opcode, len);
> +    if ( system_state < SYS_STATE_active )
> +        asm volatile ( "mov %%rax, %%cr2" ::: "memory" );
>   }
>   
>   extern void *const __initdata_cf_clobber_start[];
> --- /dev/null
> +++ b/xen/arch/x86/memcpy.S
> @@ -0,0 +1,20 @@
> +#include <asm/asm_defns.h>
> +
> +FUNC(memcpy)
> +        mov     %rdx, %rcx
> +        mov     %rdi, %rax
> +        /*
> +         * We need to be careful here: memcpy() is involved in alternati=
ves
> +         * patching, so the code doing the actual copying (i.e. past set=
ting
> +         * up registers) may not be subject to patching (unless further
> +         * precautions were taken).
> +         */
> +        ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
> +                    STR(rep movsb; RET), X86_FEATURE_ERMS
> +        rep movsq
> +        or      %edx, %ecx
> +        jz      1f
> +        rep movsb
> +1:
> +        RET
> +END(memcpy)
> --- a/xen/arch/x86/string.c
> +++ b/xen/arch/x86/string.c
> @@ -7,21 +7,6 @@
>   
>   #include <xen/lib.h>
>   
> -void *(memcpy)(void *dest, const void *src, size_t n)
> -{
> -    long d0, d1, d2;
> -
> -    asm volatile (
> -        "   rep ; movs"__OS" ; "
> -        "   mov %k4,%k3      ; "
> -        "   rep ; movsb        "
> -        : "=3D&c" (d0), "=3D&D" (d1), "=3D&S" (d2)
> -        : "0" (n/BYTES_PER_LONG), "r" (n%BYTES_PER_LONG), "1" (dest), "2=
" (src)
> -        : "memory" );
> -
> -    return dest;
> -}
> -
>   void *(memmove)(void *dest, const void *src, size_t n)
>   {
>       long d0, d1, d2;
> 
> 

Aside that:
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



