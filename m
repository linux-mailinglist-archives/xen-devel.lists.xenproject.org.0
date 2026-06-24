Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /NNVFEGqO2oLbAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:58:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913B6BD1CC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 11:58:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=OJSxSUNe;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Ta3DB/Xl";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1344731.1603769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKMW-0004Uz-FM; Wed, 24 Jun 2026 09:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344731.1603769; Wed, 24 Jun 2026 09:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcKMW-0004TL-CJ; Wed, 24 Jun 2026 09:57:40 +0000
Received: by outflank-mailman (input) for mailman id 1344731;
 Wed, 24 Jun 2026 09:57:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wcKMU-0004ST-GH
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 09:57:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcKMT-00HKIC-DN
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:57:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3baa0a-e002-0a2a0a5209dd-0a2a4501ca36-38
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:57:37 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3baa10-e031-0a2a45010019-ca0c7c90d5bd-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 11:57:36 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 962981D00120;
 Wed, 24 Jun 2026 05:57:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 24 Jun 2026 05:57:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 05:57:34 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782295055;
	 x=1782381455; bh=PB7KQdwyUj3etFoTbUX3oZj0SQVeoL+5ZPogoQg/V6w=; b=
	OJSxSUNejkHOwX+GxD/LHt3d8duHDBQVuG6ZLwWCrhWS1PRv88Oqys3m2Mvwa04c
	zuxBlMID2m5OnVY+IoYjuEzZ5JmlBTfIgAg49vf6UBXeynNprXyV7MzoWPSiNh64
	QxnNzFl2/KTBraOVraGkxzaLOadR55frRRaE1V6JHH68xFCGyLGgyUgykiDcFkMk
	/Zib/S1Za/pJZfCG9F5NivWJDtkfg9/7rkMz7HSYSxPeL3mhF9RFIfY94eWe6Mio
	TUyR4JiAuQvnP5FF1InMc1DHzyFVl9PGR9RiPuEpBYF+SNUGGt4y5ZzW6SUEGWYv
	JuMrd12K+/ginTL4dIrwjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782295055; x=1782381455; bh=PB7KQdwyUj3etFoTbUX3oZj0SQVeoL+5ZPo
	goQg/V6w=; b=Ta3DB/Xlln1QD45oezh0SvbMYvEowUisHHqAnrfX+7YUkS+Ftwe
	BPjcd9s6y1uW010BdPKz67D5p9asWKMiVTZ9pTLTnHolWbQYjX/cjvk1bpdBD6Rk
	CwOUrtfe+LdH6jtvZn+giF08MD6BV0RSNfAnYbobIOTkzH1KRaskeIxmI1tFxM7D
	u0pu2w1B3Dow3BlrOLfLDUtDKzFk0+BCW57QuE7QNTFBZDOBaFihBROdREuSz1Vh
	sVsd5ED/g52kO8H7inw1CFTuC+5KuGa1r2yVQhjYZ4zvQ6pT4PCR4LHEO/fxdLGq
	EPXXqWfcn45zJJqKHDk7fBnukK72/dMq/QA==
X-ME-Sender: <xms:D6o7anCuvt2mqLT9CSvdzZ5Ktm0gYFhhGGHNWpEwyFrgqarNzqoHGg>
    <xme:D6o7ak_d-ltVghaGJxX4PZoMxeMNf9LbMaLnofuke3fjzAH_p8zBLLRYPJeAU3kzf
    sBFAPsu3Gc7X7A3HwTXAWsR2qNBYFbxLBFPb-ThC0i_rdPVvg>
X-ME-Received: <xmr:D6o7av8890c5kBWLEvmMXmq8DOQ4wyVqiRB-SwYRcR4JP5byTyit1k9aMv29qjn8YC3vqZXTctkXugdsTfpPx2zMAjfUNcQSKMc>
X-ME-Proxy-Cause: dmFkZTFh2A3fnmsnajrOlTGrF8j4ZZ6fRhp+BrttypdDfI4dRAEM/RzZ+TKKl7CFrrQrhX
    Hf9ksFRgMlVQdsTA6ojBaKVizcJEixi0HtwlFPccepKij7Ro3H3/h25Otpf2QM1wt+mBJS
    1WbPQ15BLGuylLEYylYMMnRcny28wXDrkT4QXkhTjEd1DKK9jaV5Hwl21n9DVgJ2y5wOD+
    6fQZZ/kyUUtjqG2SsoSW40XQQtAZfRwenLR6/hfki0c1b5/gwH8jViEwMoiQg7r+TI2EbC
    uwyVCZI3WR5Usv3ks2AN8dHH98Pf8Ax4A2gb9uCMq4K7ZHlRJ3/2sTPzQfqyHouAYbIIAi
    iJxeVPQP2u+UlpQGfD5Qu9DAQe8coBY6K31Iqav68CKx6xLGNM0hM9sJ4FqKyBmJOGNNuX
    l9G8195P/gL45G9+nRL+FF2T1bneoyX7aBaG9w2NIkwVhNw+LyOdibGx3F6/2dcO4KqawL
    MmVbDwwMblEojc01bHDy5vWXGLM6qiT+yif6Ql5Er6gqeP2J66Q/UpjzpRLRlBAJNJOtIp
    qYb8PHz/vs9XiUt6PkDS/7Sl1F3gogH5zJwg9fDPJLJLNjLDViMn/fW6SOlH6Evve0kNAq
    sHBSitplkmzOglN3Jl7yEpsED+palGfFUxapzrv1SeKyU+Mx7V39i7ftCH5g
X-ME-Proxy: <xmx:D6o7ajeW8Apy4FsCswdUPKNfcTiaa2ecNiVyj02-nCBCTNJMX5Kb7Q>
    <xmx:D6o7agHbemaBFTDWxK3aaX0JGyDMA0s7qxBUe63PlcfgZssMzFCmOA>
    <xmx:D6o7apemj9Civorj4GA9EZnMhDm6kso6Ii-l3bHwE9K9RbyzR6vRcg>
    <xmx:D6o7aiGi3M-7wcr7lU5oZX3GnSl5EcPOhYiZwm2UWqe6pTsc8mQQOw>
    <xmx:D6o7atz7yXMPHG5u5q-vazVpgExP0YAO2dA17EFN7zMfIs-xeVDQSMMY>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 24 Jun 2026 11:57:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: Re: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware
Message-ID: <ajuqDBWvOwIYir-P@mail-itl>
References: <ajVUS5F9G4Jse20i@mail-itl>
 <a6b83fc1-aa98-4b45-ab7f-503715861a7d@suse.com>
 <ajslWA63ZdPhfYvw@mail-itl>
 <1ecee09a-edd9-47cf-88d4-ad4e7e8b8216@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WGH6Ne85yU7OlOw5"
Content-Disposition: inline
In-Reply-To: <1ecee09a-edd9-47cf-88d4-ad4e7e8b8216@suse.com>
X-purgate-ID: tlsNG-d62444/1782295057-CD3B8E30-3E4E5D0E/0/0
X-purgate-type: clean
X-purgate-size: 9155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6913B6BD1CC


--WGH6Ne85yU7OlOw5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 11:57:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: Re: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware

On Wed, Jun 24, 2026 at 09:43:22AM +0200, Jan Beulich wrote:
> On 24.06.2026 02:31, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jun 22, 2026 at 10:53:01AM +0200, Jan Beulich wrote:
> >> On 19.06.2026 16:38, Marek Marczykowski-G=C3=B3recki wrote:
> >>> After updating Xen to 4.22-rc2 on a system with Heads firmware, dom0
> >>> doesn't start anymore. It worked fine with Xen 4.19.
> >>> The last messages on console are:
> >>>
> >>>     [    1.495140] installing Xen timer for CPU 2
> >>>     [    1.496149] installing Xen timer for CPU 4
> >>>     [    1.496587] installing Xen timer for CPU 5
> >>>     [    1.496809] installing Xen timer for CPU 7
> >>>     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. CPUID: =
0x0002 APIC: 0x0028
> >>>     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. Firmwar=
e: 0x0011 APIC: 0x0028
> >>>     [    1.497055] cpu 2 spinlock event irq 200
> >>>     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. CPUID: =
0x0004 APIC: 0x0000
> >>>     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. Firmwar=
e: 0x0019 APIC: 0x0000
> >>>     [    1.497074] cpu 4 spinlock event irq 201
> >>>     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. CPUID: =
0x0005 APIC: 0x0002
> >>>     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. Firmwar=
e: 0x0021 APIC: 0x0002
> >>>     [    1.497074] cpu 5 spinlock event irq 202
> >>>     [    0.008235] [Firmware Bug]: CPU   7: APIC I
> >>>
> >>> Full console log (containing both successful boot of Xen 4.19, and th=
en
> >>> reboot into 4.22):
> >>> https://openqa.qubes-os.org/tests/184780/logfile?filename=3Dserial0.t=
xt
> >>
> >> The 4.19 log also has an anomaly around this point in time. Can you try
> >> again with sync_console added to both the 4.19 and the 4.22 attempt?
> >=20
> > Yes, sync_console helped quite a bit, now I get full dom0 panic message:
> >=20
> >     [   10.334800] vesafb: cannot reserve video memory at 0x0
> >     [   10.340009] vesafb: mode is 0x0x0, linelength=3D0, pages=3D0
> >     [   10.345515] Oops: divide error: 0000 [#1] SMP NOPTI
> >     [   10.346503] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.1=
7.9-1.qubes.fc41.x86_64 #1 PREEMPT(full)=20
> >     [   10.346503] Hardware name: Notebook V54x_6x_TU/V54x_6x_TU, BIOS =
Dasharo (coreboot+heads) v0.9.0 01/01/1970
> >     [   10.346503] RIP: e030:vesafb_probe.cold+0xd4/0x5fb
> >     [   10.346503] Code: 08 75 1f 83 3d a8 8c 1d 02 00 75 16 48 c7 c7 9=
0 4a fd 81 e8 8a ef f9 ff c7 05 d4 54 09 02 05 00 00 00 8b 05 c2 54 09 02 3=
1 d2 <f7> 35 d2 54 09 02 8b 15 fc 54 09 02 48 89 c1 48 c1 e1 20 48 09 ca
> >     [   10.346503] RSP: e02b:ffffc9004001fbb8 EFLAGS: 00010246
> >     [   10.346503] RAX: 0000000000000000 RBX: ffff888101d86f28 RCX: fff=
fffff823666e8
> >     [   10.346503] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000003
> >     [   10.346503] RBP: ffff88810197d400 R08: 0000000000000000 R09: 6c6=
56e696c202c30
> >     [   10.346503] R10: 0000000000000030 R11: 203a626661736576 R12: 000=
0000000000000
> >     [   10.346503] R13: 0000000000000000 R14: 0000000000000000 R15: fff=
f888106351000
> >     [   10.346503] FS:  0000000000000000(0000) GS:ffff888cef7c1000(0000=
) knlGS:0000000000000000
> >     [   10.346503] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> >     [   10.346503] CR2: ffffc900064ff000 CR3: 000000000222c000 CR4: 000=
0000000050660
> >     [   10.346503] Call Trace:
> >     [   10.346503]  <TASK>
> >     [   10.346503]  ? __pfx___device_attach_driver+0x10/0x10
> >     [   10.346503]  platform_probe+0x39/0x70
> >     [   10.346503]  really_probe+0xdb/0x340
> >     [   10.346503]  ? pm_runtime_barrier+0x54/0x90
> >     [   10.346503]  __driver_probe_device+0x78/0x110
> >     [   10.346503]  driver_probe_device+0x1f/0xa0
> >     [   10.346503]  __device_attach_driver+0x89/0x110
> >     [   10.346503]  bus_for_each_drv+0x94/0xf0
> >     [   10.346503]  __device_attach+0xaf/0x1b0
> >     [   10.346503]  bus_probe_device+0x8d/0xa0
> >     [   10.346503]  device_add+0x508/0x710
> >     [   10.346503]  platform_device_add+0xed/0x250
> >     [   10.346503]  sysfb_init+0x283/0x320
> >     [   10.346503]  ? __pfx_sysfb_init+0x10/0x10
> >     [   10.346503]  do_one_initcall+0x57/0x310
> >     [   10.346503]  do_initcalls+0x1ef/0x240
> >     [   10.346503]  kernel_init_freeable+0x187/0x210
> >     [   10.346503]  ? __pfx_kernel_init+0x10/0x10
> >     [   10.346503]  kernel_init+0x1a/0x140
> >     [   10.346503]  ret_from_fork+0xf2/0x110
> >     [   10.346503]  ? __pfx_kernel_init+0x10/0x10
> >     [   10.346503]  ret_from_fork_asm+0x1a/0x30
> >     [   10.346503]  </TASK>
> >     [   10.346503] Modules linked in:
> >     [   10.559786] ---[ end trace 0000000000000000 ]---
> >     [   10.564581] RIP: e030:vesafb_probe.cold+0xd4/0x5fb
> >     [   10.569546] Code: 08 75 1f 83 3d a8 8c 1d 02 00 75 16 48 c7 c7 9=
0 4a fd 81 e8 8a ef f9 ff c7 05 d4 54 09 02 05 00 00 00 8b 05 c2 54 09 02 3=
1 d2 <f7> 35 d2 54 09 02 8b 15 fc 54 09 02 48 89 c1 48 c1 e1 20 48 09 ca
> >     [   10.588833] RSP: e02b:ffffc9004001fbb8 EFLAGS: 00010246
> >     [   10.594255] RAX: 0000000000000000 RBX: ffff888101d86f28 RCX: fff=
fffff823666e8
> >     [   10.601622] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000003
> >     [   10.609000] RBP: ffff88810197d400 R08: 0000000000000000 R09: 6c6=
56e696c202c30
> >     [   10.616378] R10: 0000000000000030 R11: 203a626661736576 R12: 000=
0000000000000
> >     [   10.623755] R13: 0000000000000000 R14: 0000000000000000 R15: fff=
f888106351000
> >     [   10.631136] FS:  0000000000000000(0000) GS:ffff888cef7c1000(0000=
) knlGS:0000000000000000
> >     [   10.639483] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> >     [   10.645434] CR2: ffffc900064ff000 CR3: 000000000222c000 CR4: 000=
0000000050660
> >     [   10.652817] Kernel panic - not syncing: Fatal exception
> >     [   10.653803] Kernel Offset: disabled
> >     (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.
> >=20
> >>
> >>> It doesn't reach loading graphics driver in dom0, so I don't have
> >>> anything interesting on VGA (the last output is about the kexec call
> >>> done by Heads). But at least I have a serial console.
> >>
> >> Yet interestingly Xen's "  VGA is ... mode ..." lines differ as well.
> >=20
> > This might be relevant given the above.
>=20
> Indeed. It looks like d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable
> directly from C code") is at fault, breaking this piece of pre-existing
> code at the bottom of mbi2_reloc():
>=20
> #ifdef CONFIG_VIDEO
>     if ( video )
>         video->orig_video_isVGA =3D 0x23;
> #endif
>=20
> Does the patch below help?

Yes, this helps, thanks!

> Jan
>=20
> x86/boot: don't blindly mark VGA in graphics mode on MB2 path
>=20
> Setting ->orig_video_isVGA to the specific marker should be done only when
> the VBE tag is present and the FRAMEBUFFER is either absent or indicates
> RGB type. Since the "video" variable now starts out non-NULL, this
> property was broken when in particular neither of the tags are present. To
> move back to at least close to original behavior, add a 2nd check to said
> conditional.
>=20
> Fixes: d5a73cdc6b90 ("x86/boot: Use boot_vid_info variable directly from =
C code")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -339,7 +339,7 @@ static multiboot_info_t *mbi2_reloc(uint
>   end:
> =20
>  #ifdef CONFIG_VIDEO
> -    if ( video )
> +    if ( video && video->lfb_size )
>          video->orig_video_isVGA =3D 0x23;
>  #endif
> =20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WGH6Ne85yU7OlOw5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmo7qgwACgkQ24/THMrX
1ywsTwf+II3bHcbfueRtSr1/3KsC06zHBiOXgAR8oljARB+YUCYCbkp0IcL0xa5P
vpalMKy5crFOwedenK1cVeRywkAU9KuPYIDDv8xbbDSWgIda0akmV7mr3EbEJiHe
F+eml5vEgkxlSrBVBn76sXRcJMvHuv4wuta0ZGun0MLWR11usR+D+llzkaS65EgZ
OILWldA5ARVkESZTM5DmhHRc8v7kLTQFRIKS4mH0NiVY1r4l3HMTVTQEQfOw/8mA
ZSYskfyKPFu7ksba4eyuIUYDQaW4wrMj/atP+L5op5vrF9WrL5/fFQNDS3GOFGM0
nM63G318gkwiHKE7YgNSPvSYorkBbQ==
=h0FA
-----END PGP SIGNATURE-----

--WGH6Ne85yU7OlOw5--

