Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEBYNSWS+Gl8wgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:33:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EE4BCF06
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 14:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299749.1574298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsUJ-0007mM-8t; Mon, 04 May 2026 12:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299749.1574298; Mon, 04 May 2026 12:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJsUJ-0007jg-66; Mon, 04 May 2026 12:33:27 +0000
Received: by outflank-mailman (input) for mailman id 1299749;
 Mon, 04 May 2026 12:33:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df2fa95a7000f373@swg.vates.tech>)
 id 1wJsUI-0007ja-G4
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:33:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJsUH-005tC9-Rk
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:33:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df2fa95a7000f373@swg.vates.tech>)
 id 69f8920a-2eae-0a2a0a5409dd-0a2a4509df14-24
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:33:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df2fa95a7000f373@swg.vates.tech>)
 id 69f89214-2497-0a2a45090019-b9ff1c22adf5-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 14:33:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19df2fa95a7000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 May 2026 12:33:21 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3F1E682C7B;
 Mon,  4 May 2026 14:33:21 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=z1SahcxJS9PEhd9nLCjwMi74YvkGkujJc5tcAM5h/cg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DgyM5Ng4Ps72VGAYzzpWoq3QdzlPPY6t02VsQgfXkBE2vb4bTTeI41awOP/dQIB06OKoZmzsy
 x260i7Cj0Ccgawp75DmlJzENlv/+Xa0/pol2f2pgiUXb+5B8hYAj7vXM6aBuoflzWo2QKXj4LQU
 HWwE8EvgJv8Pw/v4Ujloui4h8RWhas4JowGP9jUhG7VjRbgZOYiisn9eJVDJ1ITMsdgVfjWhPI5
 yByY9w5dYZ9JnwsaHmOq4bPoPIGf1X4UNwxeIJ5d2DxcvFqXmuWRE3HFROXCYEEpQRhMJz4x846
 y7FKObK2hUvg8+a6XQYcuiaG+WZCSpzHQLgkyxFKFyPQ==
X-Zone-Loop: 639d19f8d8251d1d763f59e389c23f386502cb7888a1
x-campaign-type: default
x-transaction-id: 72b9757b-341d-472b-a8cd-f38d541b56d4
x-swg-uid: 01-6f80c560-cf2f-424d-aeca-d5d275a3f892
X-Mailer: Sweego
Message-ID:
 <1777898001.8631fc262581453bbf619ec5b2062170.19df2fa95a7000f373@vates.tech>
x-swg-bid: 1777898001.8631fc262581453bbf619ec5b2062170.19df2fa95a7000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 4 May 2026 14:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Disable interrupts when establishing SSP
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <20260501191028.1250225-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.d8.e997219826f44562.19df2fa93bf.8d0c5c40427badda=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777898001343
X-purgate-ID: tlsNG-bad1c0/1777898004-496B0A53-1C87D334/0/0
X-purgate-type: clean
X-purgate-size: 5340
X-Rspamd-Queue-Id: 379EE4BCF06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,gitlab.com:url,suse.com:email,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.d8.e997219826f44562.19df2fa93bf.8d0c5c40427badda=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 01/05/2026 =C3=A0 21:14, Andrew Cooper a =C3=A9crit=C2=A0:
> Gitlab CI reported a crash on boot on Alder Lake hardware=2E  The bug is=
 years
> old, making it an incredibly rare occurance:
>=20
>    (XEN) *** DOUBLE FAULT ***
>    (XEN) ----[ Xen-4=2E22-unstable  x86_64  debug=3Dy ubsan=3Dy  Not tai=
nted ]----
>    (XEN) CPU:    0
>    (XEN) RIP:    e008:[<ffff82d04077bbc4>] arch/x86/setup=2Ec#reinit_bsp=
_stack+0xfa/0x160
>    (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
>    (XEN) rax: 0000000000000007   rbx: ffff83049a4b0000   rcx: 0000000000=
0006a2
>    (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000=
000000
>    (XEN) rbp: ffff83049a4b7f00   rsp: ffff83049a4b7ef8   r8:  ffff830497=
e47000
>    (XEN) r9:  00000000ffffffff   r10: 00000000900c2121   r11: 000000009a=
392956
>    (XEN) r12: ffff830497e47000   r13: ffff830497e49f40   r14: 0000000000=
000000
>    (XEN) r15: ffff82d0407dad10   cr0: 0000000080050033   cr4: 0000000000=
f526e0
>    (XEN) cr3: 0000000043c16000   cr2: fffffffffffffffc
>    (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000=
000000
>    (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>    (XEN) Xen code around <ffff82d04077bbc4> (arch/x86/setup=2Ec#reinit_b=
sp_stack+0xfa/0x160):
>    (XEN)  00 b9 a2 06 00 00 0f 30 <80> 3d 71 26 f1 ff 00 74 3e 48 8d 93 =
f8 5f 00 00
>    (XEN) Valid stack range: ffff83049a4b6000-ffff83049a4b8000, sp=3Dffff=
83049a4b7ef8, tss=2Ersp0=3Dffff83049a4b7fb0
>    (XEN) No stack overflow detected=2E Skipping stack trace=2E
>    (XEN)
>    (XEN) ****************************************
>    (XEN) Panic on CPU 0:
>    (XEN) DOUBLE FAULT -- system shutdown
>    (XEN) ****************************************
>=20
> This is on the instruction boundary after enabling CET (writing MSR_S_CE=
T) and
> prior to establishing SSP=2E  Despite identifying this as a critical win=
dow
> where any fault was deadly (the CPU tries to push a shadow stack frame a=
t 0,
> hence the CR2 value wrapping around to the top of the address space), I
> clearly forgot that this meant interrupts too, which are enabled=2E
>=20
> Along with regular interrupts, NMIs are a problem=2E  Unlike other cases=
 needing
> NMI safety, we can't use a self NMI and callback, as the stack needs to =
be
> empty at the point of enabling Shadow Stacks=2E
>=20
> Disable interrupts, and turn off the watchdog if it's configured=2E
>=20
> Note that watchdog_{en,dis}able() do not work here=2E  They cause the wa=
tchdog
> NMI to be ignored; they do not inhibit the generation of NMIs=2E
>=20
> Fixes: b60ab42db2f0 ("x86/shstk: Activate Supervisor Shadow Stacks")
> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
> ---
> CC: Jan Beulich <jbeulich@suse=2Ecom>
> CC: Roger Pau Monn=C3=A9 <roger=2Epau@citrix=2Ecom>
> CC: Teddy Astie <teddy=2Eastie@vates=2Etech>
>=20
> The only way I can think of doing this in NMI context is to have the NMI=
 LRET
> off the NMI stack back to the interrupted context=2E  But this is horrib=
le to
> arrange, not to mention different between IDT and FRED=2E
>=20
> Also, the {disable,setup}_lapic_nmi_watchdog() API is horrible but I don=
't
> have time to make it sane right now, and this needs backporting a long w=
ay=2E
>=20
> https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/pipelines/249406=
9238
> ---
>   xen/arch/x86/setup=2Ec | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>=20
> diff --git a/xen/arch/x86/setup=2Ec b/xen/arch/x86/setup=2Ec
> index d041cbd5f6f1=2E=2E95ac36beab37 100644
> --- a/xen/arch/x86/setup=2Ec
> +++ b/xen/arch/x86/setup=2Ec
> @@ -908,6 +908,19 @@ static void __init noreturn reinit_bsp_stack(void)
>  =20
>       if ( cpu_has_xen_shstk )
>       {
> +        bool watchdog =3D (nmi_watchdog =3D=3D NMI_LOCAL_APIC);
> +
> +        /*
> +         * Between enabling CET and establishing SSP, any fault or inte=
rrupt
> +         * is fatal=2E  We must arrange for none to happen=2E
> +         *
> +         * TODO: Figure out how to perform CET enablement in NMI contex=
t,
> +         *       given the constraint that the stack must be empty=2E
> +         */
> +        if ( watchdog )
> +            disable_lapic_nmi_watchdog();
> +        local_irq_disable();
> +
>           wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
>  =20
>           /*
> @@ -932,6 +945,13 @@ static void __init noreturn reinit_bsp_stack(void)
>           }
>           else
>               asm volatile ( "setssbsy" ::: "memory" );
> +
> +        local_irq_enable();
> +        if ( watchdog )
> +        {
> +            nmi_watchdog =3D NMI_LOCAL_APIC;
> +            setup_apic_nmi_watchdog();
> +        }
>       }
>  =20
>       reset_stack_and_jump(init_done);
>=20
> base-commit: 61f957d48c78df6c5254b6f54d6170d3bd3d717e

Reviewed-by: Teddy Astie <teddy=2Eastie@vates=2Etech>


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.d8.e997219826f44562.19df2fa93bf.8d0c5c40427badda=---

