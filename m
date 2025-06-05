Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C458EACF4DE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007214.1386530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDw2-0000XE-O8; Thu, 05 Jun 2025 16:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007214.1386530; Thu, 05 Jun 2025 16:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNDw2-0000US-JD; Thu, 05 Jun 2025 16:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1007214;
 Thu, 05 Jun 2025 16:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WlfP=YU=bounce.vates.tech=bounce-md_30504962.6841cce5.v1-c5a0f23d0add42c99c15c3006c6f0ad8@srs-se1.protection.inumbo.net>)
 id 1uNDw1-0000UM-H5
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:59:21 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b294e8a-422e-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 18:59:19 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bCrJj4h0RzS62TTh
 for <xen-devel@lists.xenproject.org>; Thu,  5 Jun 2025 16:59:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c5a0f23d0add42c99c15c3006c6f0ad8; Thu, 05 Jun 2025 16:59:17 +0000
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
X-Inumbo-ID: 6b294e8a-422e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749142757; x=1749412757;
	bh=nJRgkP5vL2W6h9s/7X+kDF22JRxUuQPxBXBvy+T4DqA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uEkpiBCHR5H3xBd3uv1CCtFKfRvmIzIQtUdbNcvSUxL5sdJmr5YOf59iKULsgCNFk
	 JEUzeRsXeTSBnVoHJxd0ei1sFOpMV3cMQL4PP9wvuWYU9SsPmhJT8Ro7dYZqbWTUmQ
	 MVh5Yl5jAOO5gGR2LsLimpci+DDofYZ+ueya0M4h5mzoAfPeEXly7HnwMFyTMWe8ma
	 3Uqh2pYmqZ677/q8MfztKKhAFBmXl1RuIoIg5Z0Zcx+suS9hGIoYTY+w4pcyCQX+BX
	 9klhKrPzjlAN8Oda6lUp+UJFq/PDSPviCFg50BCBSwak0gpSOq6+CZQrWNpJlX5vvn
	 2vlBBikjMgIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749142757; x=1749403257; i=teddy.astie@vates.tech;
	bh=nJRgkP5vL2W6h9s/7X+kDF22JRxUuQPxBXBvy+T4DqA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1iuhBHyfzNLWJO6Gi1Uvnxd+zCMsCk6wln79/gTQZQlSHOpcFZJtiNXO8R8KCaNaZ
	 jGbvtD8XbBEJ5ORzT/7vegWU3E8yeSQUc/MANL8Whct9TyUzzLyGo3fUxHsRRPpAqz
	 pZ57S4pzZK4HD/z+yJVo5ptwRJBFVZA1y/LJH8juoaSJMgtP6MT+P8nQbf17XaESEy
	 k88n+zpG+3q3u9G7smEw3RmC0rC4wNu85UOikaNLQBRotpX2DxzPommA6iEORH3SMU
	 xZo4v3y+pDVJRYkICAZ1JsKyDR0cHAjPATnW1vLqxMmOw29dVWP36PbRIO7DGDR7Ki
	 JCp3oxl37yMJQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=202/6]=20x86:=20re-work=20memset()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749142756596
Message-Id: <d01ed027-5cfc-4e0f-8d62-dadb3e76eed2@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com> <4592a702-acf3-4229-9069-d5b639151657@suse.com>
In-Reply-To: <4592a702-acf3-4229-9069-d5b639151657@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c5a0f23d0add42c99c15c3006c6f0ad8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250605:md
Date: Thu, 05 Jun 2025 16:59:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 05/06/2025 =C3=A0 12:26, Jan Beulich a =C3=A9crit=C2=A0:
> Move the function to its own assembly file. Having it in C just for the
> entire body to be an asm() isn't really helpful. Then have two flavors:
> A "basic" version using qword steps for the bulk of the operation, and an
> ERMS version for modern hardware, to be substituted in via alternatives
> patching.
> 
> For RET to be usable in an alternative's replacement code, extend the
> CALL/JMP patching to cover the case of "JMP __x86_return_thunk" coming
> last in replacement code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> We may want to consider branching over the REP STOSQ as well, if the
> number of qwords turns out to be zero.
> We may also want to consider using non-REP STOS{L,W,B} for the tail.
> ---
> v5: Re-base.
> v4: Use %r8 instead of %rsi in a few places.
> v3: Re-base.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_RETURN_THUNK) +=3D indirect-t
>   obj-$(CONFIG_PV) +=3D ioport_emulate.o
>   obj-y +=3D irq.o
>   obj-$(CONFIG_KEXEC) +=3D machine_kexec.o
> +obj-y +=3D memset.o
>   obj-y +=3D mm.o x86_64/mm.o
>   obj-$(CONFIG_VM_EVENT) +=3D monitor.o
>   obj-y +=3D mpparse.o
> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -346,6 +346,12 @@ static int init_or_livepatch _apply_alte
>           /* 0xe8/0xe9 are relative branches; fix the offset. */
>           if ( a->repl_len >=3D 5 && (*buf & 0xfe) =3D=3D 0xe8 )
>               *(int32_t *)(buf + 1) +=3D repl - orig;
> +        else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
> +                  a->repl_len > 5 && buf[a->repl_len - 5] =3D=3D 0xe9 &&
> +                  ((long)repl + a->repl_len +
> +                   *(int32_t *)(buf + a->repl_len - 4) =3D=3D
> +                   (long)__x86_return_thunk) )
> +            *(int32_t *)(buf + a->repl_len - 4) +=3D repl - orig;

That looks a bit confusing, to me that probably some comment explaining 
what instructions transform it's looking to make.

>   
>           a->priv =3D 1;
>   
> --- /dev/null
> +++ b/xen/arch/x86/memset.S
> @@ -0,0 +1,30 @@
> +#include <asm/asm_defns.h>
> +

It would be nice to have a reminder of the calling convention (i.e what 
register maps to what memset parameter) as it will definitely help 
future readers.

If I understand correctly here :
- rdi: destination (s)
- rsi: byte to write (c)
- rdx: number of bytes to write (n)
- eventually that rcx =3D rdx (mov %rdx, %rcx) in memset/memset_erms

> +.macro memset
> +        and     $7, %edx
> +        shr     $3, %rcx
> +        movzbl  %sil, %esi
> +        mov     $0x0101010101010101, %rax
> +        imul    %rsi, %rax
> +        mov     %rdi, %r8
> +        rep stosq
> +        or      %edx, %ecx
> +        jz      0f
> +        rep stosb
> +0:
> +        mov     %r8, %rax
> +        RET
> +.endm
> +
> +.macro memset_erms
> +        mov     %esi, %eax
> +        mov     %rdi, %r8
> +        rep stosb
> +        mov     %r8, %rax
> +        RET
> +.endm
> +

Overall, I am a bit confused on the mixing of 32-bits (edx, esi, ...) 
and 64-bits registers (rax, ...). But it looks ok to me.

> +FUNC(memset)
> +        mov     %rdx, %rcx
> +        ALTERNATIVE memset, memset_erms, X86_FEATURE_ERMS
> +END(memset)
> --- a/xen/arch/x86/string.c
> +++ b/xen/arch/x86/string.c
> @@ -22,19 +22,6 @@ void *(memcpy)(void *dest, const void *s
>       return dest;
>   }
>   
> -void *(memset)(void *s, int c, size_t n)
> -{
> -    long d0, d1;
> -
> -    asm volatile (
> -        "rep stosb"
> -        : "=3D&c" (d0), "=3D&D" (d1)
> -        : "a" (c), "1" (s), "0" (n)
> -        : "memory");
> -
> -    return s;
> -}
> -
>   void *(memmove)(void *dest, const void *src, size_t n)
>   {
>       long d0, d1, d2;
> 
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



