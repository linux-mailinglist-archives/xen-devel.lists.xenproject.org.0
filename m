Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHrWFxGa12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:22:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7A63CA597
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277234.1562462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoOf-0005Ox-6R; Thu, 09 Apr 2026 12:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277234.1562462; Thu, 09 Apr 2026 12:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAoOf-0005MD-2U; Thu, 09 Apr 2026 12:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1277234;
 Thu, 09 Apr 2026 12:22:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d799ec.v1-f245dc9079344828b0ea5d8e3faeb5b4@bounce.vates.tech>)
 id 1wAoOd-0005M7-3W
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:22:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAoOc-001K4b-3l
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:22:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d799ec.v1-f245dc9079344828b0ea5d8e3faeb5b4@bounce.vates.tech>)
 id 69d799e6-e002-0a2a0a5209dd-0a2a4506b954-32
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:22:06 +0200
Received: from [198.2.180.46] (helo=mail180-46.suw31.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d799ec.v1-f245dc9079344828b0ea5d8e3faeb5b4@bounce.vates.tech>)
 id 69d799ec-0df0-0a2a45060019-c602b42eb7bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:22:05 +0200
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-46.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4frzZh0svdz8XS6nf
 for <xen-devel@lists.xenproject.org>; Thu,  9 Apr 2026 12:22:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f245dc9079344828b0ea5d8e3faeb5b4; Thu, 09 Apr 2026 12:22:04 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775737324; x=1776007324;
	bh=6/LSDButP8uM6JPqcrKxjpaj3SVY0qzt4DP43fBQAec=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=B/T9oqJ5Sw+LuRI0Ne/QIm5RpGZMyK4F7eEdZpWxFWLXKkks7x9l+/UToR87vF+QL
	 E5ncMMa/mXOYrA8ZkBdDuI9Wtczrr8d85MfAHZGE77npUUXgAt41reTynoMEgHyD9J
	 3ry2NHbMergu4kqd9r1GtIDjINN3dbHCcjxzu2jia5MtY9AyXritMpwKMFBW7u0H1D
	 aCg6Bn/ZbtuSNUfqhi29XtB/lv3nGsYPy4KT2AMB10tXvuKFkVBXEeesuLRMa18Rup
	 Np/SoZjVHB205SzGszm8r9+Q8dJCg4q7qmCd21qlsZlq5vCBYEPr7NIiHMKrl34Q3e
	 3jZvdAQP2fpvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775737324; x=1775997824; i=teddy.astie@vates.tech;
	bh=6/LSDButP8uM6JPqcrKxjpaj3SVY0qzt4DP43fBQAec=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Yg8vnszdQtBIFMQHdBqjHkrTnPCVpqk4TMH5hlQY4KnyReQ/S1CX0b7AEgJu8qbzV
	 eFexKGKGkPnhqY/k7m4wOvB6Cq+suZOysh1Kjgb4YF+oIH0/vFFPEYWHCuf9CQKlPo
	 SROrQEGpjvFpKiwCNbSoShku09SwYuQWR72Qx9OuEtaV+RWM5KowLrxAUq5TxfzmY0
	 dII+0oEBQb2RH9qc2ITuNFE5sJzJtnZmJkwDnugvaLIzFdgsOUmM5ULi71FB7yX7mO
	 qaVmEBUAFugfFgnqKs3cKp8uu+OMdjpHS/dJR9JBlS+62QvdXlvAxfIZO4X9s1tuKx
	 sUgKeTs5YS4uA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20x86:=20Avoid=20using=20.byte=20for=20instructions=20where=20safe=20to=20do=20so?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775737320936
Message-Id: <ec45bd37-280c-4752-b38b-99dcdf4b92a2@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <20260409114151.179408-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260409114151.179408-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f245dc9079344828b0ea5d8e3faeb5b4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260409:md
Date: Thu, 09 Apr 2026 12:22:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1775737326-AF5383D8-16B0ED0B/0/0
X-purgate-type: clean
X-purgate-size: 8076
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,suse.com:email,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.920];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1E7A63CA597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 09/04/2026 =C3=A0 13:43, Andrew Cooper a =C3=A9crit=C2=A0:
> The new toolchain baseline knows XGETBV, VPXOR and VPOR.
> 
> For the other cases using .byte, annotate the toolchain minima.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> v2
>   * CLZERO, {WR,RD}PKRU can't be named yet.
> 
> Pull out of previous series as it's somewhat unrelated.  The XSAVE cleanu=
p has
> other prerequiesites before it can move away from .byte.
> ---
>   xen/arch/x86/arch.mk                   |  4 +++
>   xen/arch/x86/include/asm/asm-defns.h   |  1 +
>   xen/arch/x86/include/asm/msr.h         |  2 ++
>   xen/arch/x86/include/asm/prot-key.h    |  4 +--
>   xen/arch/x86/include/asm/xstate.h      |  3 +--
>   xen/arch/x86/x86_emulate/0f01.c        |  2 +-
>   xen/arch/x86/x86_emulate/x86_emulate.c | 34 ++++++++++++--------------
>   7 files changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 0b42e6312fac..cd0602a79aaf 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -17,7 +17,11 @@ CFLAGS-$(CONFIG_CC_IS_GCC) +=3D -malign-data=3Dabi
>   $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>   $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
>   $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_S=
YM)
> +
> +# Binutils >=3D 2.31, Clang >=3D 7
>   $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_M=
OVDIR)
> +
> +# Binutils >=3D 2.33, Clang >=3D 9
>   $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_EN=
QCMD)
>   
>   # Check to see whether the assembler supports the .nop directive.
> diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/=
asm/asm-defns.h
> index 239dc3af096c..dc9b3ce272fd 100644
> --- a/xen/arch/x86/include/asm/asm-defns.h
> +++ b/xen/arch/x86/include/asm/asm-defns.h
> @@ -1,5 +1,6 @@
>   #include <asm/page-bits.h>
>   
> +/* binutils >=3D 2.26 or Clang >=3D 3.8 */
>   .macro clzero
>       .byte 0x0f, 0x01, 0xfc
>   .endm
> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/ms=
r.h
> index 941a7612f4ba..1377d156f4e1 100644
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -63,6 +63,8 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
>       /*
>        * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redunda=
nt CS
>        * prefix to avoid a trailing NOP.
> +     *
> +     * Binutils >=3D 2.40, Clang >=3D 16
>        */
>       alternative_input(".byte 0x2e; wrmsr",
>                         ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
> diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/a=
sm/prot-key.h
> index 8fb15b5c32e9..e8550e0c9203 100644
> --- a/xen/arch/x86/include/asm/prot-key.h
> +++ b/xen/arch/x86/include/asm/prot-key.h
> @@ -19,7 +19,7 @@ static inline uint32_t rdpkru(void)
>   {
>       uint32_t pkru;
>   
> -    asm volatile ( ".byte 0x0f,0x01,0xee"
> +    asm volatile ( ".byte 0x0f,0x01,0xee" /* binutils >=3D 2.26 or Clang=
 >=3D 3.8 */
>                      : "=3Da" (pkru) : "c" (0) : "dx" );
>   
>       return pkru;
> @@ -27,7 +27,7 @@ static inline uint32_t rdpkru(void)
>   
>   static inline void wrpkru(uint32_t pkru)
>   {
> -    asm volatile ( ".byte 0x0f,0x01,0xef"
> +    asm volatile ( ".byte 0x0f,0x01,0xef" /* binutils >=3D 2.26 or Clang=
 >=3D 3.8 */
>                      :: "a" (pkru), "d" (0), "c" (0) );
>   }
>   
> diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm=
/xstate.h
> index c96d75e38b25..0519379edb57 100644
> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -118,8 +118,7 @@ static inline uint64_t xgetbv(unsigned int index)
>       uint32_t lo, hi;
>   
>       ASSERT(index); /* get_xcr0() should be used instead. */
> -    asm volatile ( ".byte 0x0f,0x01,0xd0" /* xgetbv */
> -                   : "=3Da" (lo), "=3Dd" (hi) : "c" (index) );
> +    asm volatile ( "xgetbv" : "=3Da" (lo), "=3Dd" (hi) : "c" (index) );
>   
>       return lo | ((uint64_t)hi << 32);
>   }
> diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0=
f01.c
> index 4d36c7d289a5..87d338f0c74a 100644
> --- a/xen/arch/x86/x86_emulate/0f01.c
> +++ b/xen/arch/x86/x86_emulate/0f01.c
> @@ -122,7 +122,7 @@ int x86emul_0f01(struct x86_emulate_state *s,
>           {
>           case vex_none: /* serialize */
>               host_and_vcpu_must_have(serialize);
> -            asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
> +            asm volatile ( ".byte 0x0f, 0x01, 0xe8" ); /* Binutils >=3D =
2.34, Clang >=3D 11 */
>               break;
>           case vex_f2: /* xsusldtrk */
>               vcpu_must_have(tsxldtrk);
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_em=
ulate/x86_emulate.c
> index 11d145e17723..e58735ee9590 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -4748,27 +4748,25 @@ x86_emulate(
>                    */
>                   if ( vex.l )
>                   {
> -                    /* vpxor %xmmN, %xmmN, %xmmN */
> -                    asm volatile ( ".byte 0xc5,0xf9,0xef,0xc0" );
> -                    asm volatile ( ".byte 0xc5,0xf1,0xef,0xc9" );
> -                    asm volatile ( ".byte 0xc5,0xe9,0xef,0xd2" );
> -                    asm volatile ( ".byte 0xc5,0xe1,0xef,0xdb" );
> -                    asm volatile ( ".byte 0xc5,0xd9,0xef,0xe4" );
> -                    asm volatile ( ".byte 0xc5,0xd1,0xef,0xed" );
> -                    asm volatile ( ".byte 0xc5,0xc9,0xef,0xf6" );
> -                    asm volatile ( ".byte 0xc5,0xc1,0xef,0xff" );
> +                    asm volatile ( "vpxor %xmm0, %xmm0, %xmm0" );
> +                    asm volatile ( "vpxor %xmm1, %xmm1, %xmm1" );
> +                    asm volatile ( "vpxor %xmm2, %xmm2, %xmm2" );
> +                    asm volatile ( "vpxor %xmm3, %xmm3, %xmm3" );
> +                    asm volatile ( "vpxor %xmm4, %xmm4, %xmm4" );
> +                    asm volatile ( "vpxor %xmm5, %xmm5, %xmm5" );
> +                    asm volatile ( "vpxor %xmm6, %xmm6, %xmm6" );
> +                    asm volatile ( "vpxor %xmm7, %xmm7, %xmm7" );
>                   }
>                   else
>                   {
> -                    /* vpor %xmmN, %xmmN, %xmmN */
> -                    asm volatile ( ".byte 0xc5,0xf9,0xeb,0xc0" );
> -                    asm volatile ( ".byte 0xc5,0xf1,0xeb,0xc9" );
> -                    asm volatile ( ".byte 0xc5,0xe9,0xeb,0xd2" );
> -                    asm volatile ( ".byte 0xc5,0xe1,0xeb,0xdb" );
> -                    asm volatile ( ".byte 0xc5,0xd9,0xeb,0xe4" );
> -                    asm volatile ( ".byte 0xc5,0xd1,0xeb,0xed" );
> -                    asm volatile ( ".byte 0xc5,0xc9,0xeb,0xf6" );
> -                    asm volatile ( ".byte 0xc5,0xc1,0xeb,0xff" );
> +                    asm volatile ( "vpor %xmm0, %xmm0, %xmm0" );
> +                    asm volatile ( "vpor %xmm1, %xmm1, %xmm1" );
> +                    asm volatile ( "vpor %xmm2, %xmm2, %xmm2" );
> +                    asm volatile ( "vpor %xmm3, %xmm3, %xmm3" );
> +                    asm volatile ( "vpor %xmm4, %xmm4, %xmm4" );
> +                    asm volatile ( "vpor %xmm5, %xmm5, %xmm5" );
> +                    asm volatile ( "vpor %xmm6, %xmm6, %xmm6" );
> +                    asm volatile ( "vpor %xmm7, %xmm7, %xmm7" );
>                   }
>   
>                   ASSERT(!state->simd_size);

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



