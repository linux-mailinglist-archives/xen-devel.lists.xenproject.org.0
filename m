Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H4SaF6UlO2rTRggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 02:32:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC416BABA2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 02:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=QiQ0RqaT;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="NECrRj/A";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1344534.1603579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcBWd-0004Ks-F1; Wed, 24 Jun 2026 00:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344534.1603579; Wed, 24 Jun 2026 00:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcBWd-0004Jo-Ba; Wed, 24 Jun 2026 00:31:31 +0000
Received: by outflank-mailman (input) for mailman id 1344534;
 Wed, 24 Jun 2026 00:31:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wcBWa-0004Je-Sv
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 00:31:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcBWY-00Brc9-JS
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 02:31:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3b253e-2eae-0a2a0a5409dd-0a2a4502eb7a-14
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 02:31:26 +0200
Received: from [202.12.124.153] (helo=fhigh-b2-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3b255c-fdf1-0a2a45020019-ca0c7c99b825-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 02:31:25 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id DFEBB7A0138;
 Tue, 23 Jun 2026 20:31:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 23 Jun 2026 20:31:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jun 2026 20:31:22 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782261083;
	 x=1782347483; bh=hEcx3YhDX7gRkr1bi4FW6e+w10i75bwc8tAPFAFDAIQ=; b=
	QiQ0RqaTSBryTtoo73R+GcMoai1qwn0RS1HgR3KCAyXAq8r9oq7i/K6YcliSl7hm
	KUZxim1MQfP3dEV14+ryrv/l9fApRwgfcte+fC17663VCwkZEXtat9QGqe3pkuBN
	YkDRe/DoHFyz3ZDiBIx/RFNKLQzNmYlPaXOC+U0ta9fHKLWcbU8EXSwejYQw0YjZ
	JWO0S95dKH5uWIDjbT3i9oa5rhseuu4lPLAHGgRfIshjMwuZdiwRsh22eUwHShCk
	FTCR+gf4oMURMgZD2InzLrCMEvZjOBtdNz4yUSkJEzfzMve/71gEGeyevaDPNfQh
	Ihv9SyGQi/DfLGrkkM1FQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782261083; x=1782347483; bh=hEcx3YhDX7gRkr1bi4FW6e+w10i75bwc8tA
	PFAFDAIQ=; b=NECrRj/AkN5ZazchGbswckN19CKoU3zZ6/BmqVpVUF1tmdD53TU
	HcUleRmFEf8t7OdUhN7ecq7vh+gr7mABoM6FvOH/7CwgojezKPdAahLSW0K3udI1
	zwq5+YiwCh9gzT7M8MnXs/9a9v98B6kSGkO0WNlMpgHy/HgAcmnSxkllwSH2rfhM
	5fl+EjfImVicL54s81c5zSknoIkTfokBLwtVSINayaPu+POtfdKrWj7z2VyVfzDL
	VhiLKT2QjXpUrxLCjkUlGCCCN2eOYFgvD9tVIsJuUbLu+GLJxf3KhqCZ1FRPidIb
	lDVTyL9qttU1EpB2GbjiaC788Ba1tyqz0xA==
X-ME-Sender: <xms:WyU7auZK9gg8RlLmqXmtqGbqNZXzJzpLMvL5xmREy8-1G5fpH-cFmg>
    <xme:WyU7anYnxHCdAvkA6nwB24dZn9n74UeuTHHa5-9TOLXtwNd8MqThnsYkmf_4BrDxu
    nKbfmuime-KHPUL9BesDLDf-nAtPM5y5iVfbUnyzAHiFwNnPw>
X-ME-Received: <xmr:WyU7amnHCSh3BpX62r26lo-pY7PJbkgZR6x0XZSiXQ5mkMSPnA0FPIigIRMFx2fQqd1TwS1DzCrcrdji_hwLocz5H-c5h165xW8>
X-ME-Proxy-Cause: dmFkZTFutc/TBbgcfvlUGF+8aFvqW8AKyRQxdE7ZBxFYDE2Ec4ToDqqZ8HIb+F5z7KrQTA
    zi9+aWK62hs/qVC2FJQL7NCPZjZfeQxb8K0nwc91PX7+0w3p5jzdkcvIg+JBlXwhWWikxd
    fNin/5Mx+CaDP3kYK0eMXwn6ogQ0qSyHiteMbpiA7uVVOzi0oyZho6+bx5p+Km0MTDrN/7
    oV4KGI1Q9vZOkcZAm2e28eV1db1d3n4YgJs34UW+IhdNKCKJ7dOZhAnFmDykdC0RNXL0XY
    8FNFPWKU2Szj2fqJKxxaIk27nCGg2nwALDAHJQZMVxOwkt2KYHAvv4OAUhPrvgLTxgdAHW
    tIY8lSoTCHlrskzoGFckeal4JCIc/xwwX7RIsHXnuU4wULUMG0PqYu3WY20PK3JnOCBvW1
    Jrj3ueZbzRmidDdzOJI+Lgw7fm8mAEiDfEq6KWj8pfuXwBvrIwDcIW9V0Qe739yTrg5a3c
    08ezHEk8ex8Ds5Bqxo/KDZBQ5TUHoIqjzemERmgi7U8ZcVOgGQSzUoms3LsbgNdIlU15+Q
    NglYn3XJtPyyhLsz10jfqMH26ZYh+jNAMTH0iI+VU+L9+xH9FjNqb+9QP9l0DFgpl+Vomq
    cDkcr/mI4vXbMcrhbnnJyAkul8m0lJ9WlAc7i/O95qyq76gnNzkayeYuABjQ
X-ME-Proxy: <xmx:WyU7aryG-N-tCijK4Q2j9sh5bYBg0g7eqPGvUWIMoNMlfs4byDZ24A>
    <xmx:WyU7asPD9MwlrEMi1jDnzFA3zCPz4aY3ZeexVFg7X-m_Ex0-yw8seA>
    <xmx:WyU7anR3dFuqAxuCsZHaVUzR-cQn9e4ltbfJ3PTx2QwtQ8SLz1oeyA>
    <xmx:WyU7aibHbSYt-lqyuCxgqXURWxa9pWBoAoGePhdhRz8qi-6YmOu-ig>
    <xmx:WyU7auuYGxTQKPPB-vMd99m_DKJxo71ZhYE4Hk-BemFYybW-giyxBviY>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 24 Jun 2026 02:31:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware
Message-ID: <ajslWA63ZdPhfYvw@mail-itl>
References: <ajVUS5F9G4Jse20i@mail-itl>
 <a6b83fc1-aa98-4b45-ab7f-503715861a7d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jMAIu2igKRfDROZy"
Content-Disposition: inline
In-Reply-To: <a6b83fc1-aa98-4b45-ab7f-503715861a7d@suse.com>
X-purgate-ID: tlsNG-720697/1782261086-4566B3F3-CE9BEC9F/0/0
X-purgate-type: clean
X-purgate-size: 8442
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,qubes-os.org:url,invisiblethingslab.com:dkim,invisiblethingslab.com:from_mime,mail-itl:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 7CC416BABA2


--jMAIu2igKRfDROZy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 02:31:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux dom0 hangs on boot with Xen 4.22 and Heads firmware

On Mon, Jun 22, 2026 at 10:53:01AM +0200, Jan Beulich wrote:
> On 19.06.2026 16:38, Marek Marczykowski-G=C3=B3recki wrote:
> > After updating Xen to 4.22-rc2 on a system with Heads firmware, dom0
> > doesn't start anymore. It worked fine with Xen 4.19.
> > The last messages on console are:
> >=20
> >     [    1.495140] installing Xen timer for CPU 2
> >     [    1.496149] installing Xen timer for CPU 4
> >     [    1.496587] installing Xen timer for CPU 5
> >     [    1.496809] installing Xen timer for CPU 7
> >     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. CPUID: 0x=
0002 APIC: 0x0028
> >     [    0.008235] [Firmware Bug]: CPU   2: APIC ID mismatch. Firmware:=
 0x0011 APIC: 0x0028
> >     [    1.497055] cpu 2 spinlock event irq 200
> >     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. CPUID: 0x=
0004 APIC: 0x0000
> >     [    0.008235] [Firmware Bug]: CPU   4: APIC ID mismatch. Firmware:=
 0x0019 APIC: 0x0000
> >     [    1.497074] cpu 4 spinlock event irq 201
> >     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. CPUID: 0x=
0005 APIC: 0x0002
> >     [    0.008235] [Firmware Bug]: CPU   5: APIC ID mismatch. Firmware:=
 0x0021 APIC: 0x0002
> >     [    1.497074] cpu 5 spinlock event irq 202
> >     [    0.008235] [Firmware Bug]: CPU   7: APIC I
> >=20
> > Full console log (containing both successful boot of Xen 4.19, and then
> > reboot into 4.22):
> > https://openqa.qubes-os.org/tests/184780/logfile?filename=3Dserial0.txt
>=20
> The 4.19 log also has an anomaly around this point in time. Can you try
> again with sync_console added to both the 4.19 and the 4.22 attempt?

Yes, sync_console helped quite a bit, now I get full dom0 panic message:

    [   10.334800] vesafb: cannot reserve video memory at 0x0
    [   10.340009] vesafb: mode is 0x0x0, linelength=3D0, pages=3D0
    [   10.345515] Oops: divide error: 0000 [#1] SMP NOPTI
    [   10.346503] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.9-=
1.qubes.fc41.x86_64 #1 PREEMPT(full)=20
    [   10.346503] Hardware name: Notebook V54x_6x_TU/V54x_6x_TU, BIOS Dash=
aro (coreboot+heads) v0.9.0 01/01/1970
    [   10.346503] RIP: e030:vesafb_probe.cold+0xd4/0x5fb
    [   10.346503] Code: 08 75 1f 83 3d a8 8c 1d 02 00 75 16 48 c7 c7 90 4a=
 fd 81 e8 8a ef f9 ff c7 05 d4 54 09 02 05 00 00 00 8b 05 c2 54 09 02 31 d2=
 <f7> 35 d2 54 09 02 8b 15 fc 54 09 02 48 89 c1 48 c1 e1 20 48 09 ca
    [   10.346503] RSP: e02b:ffffc9004001fbb8 EFLAGS: 00010246
    [   10.346503] RAX: 0000000000000000 RBX: ffff888101d86f28 RCX: fffffff=
f823666e8
    [   10.346503] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000=
000000003
    [   10.346503] RBP: ffff88810197d400 R08: 0000000000000000 R09: 6c656e6=
96c202c30
    [   10.346503] R10: 0000000000000030 R11: 203a626661736576 R12: 0000000=
000000000
    [   10.346503] R13: 0000000000000000 R14: 0000000000000000 R15: ffff888=
106351000
    [   10.346503] FS:  0000000000000000(0000) GS:ffff888cef7c1000(0000) kn=
lGS:0000000000000000
    [   10.346503] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   10.346503] CR2: ffffc900064ff000 CR3: 000000000222c000 CR4: 0000000=
000050660
    [   10.346503] Call Trace:
    [   10.346503]  <TASK>
    [   10.346503]  ? __pfx___device_attach_driver+0x10/0x10
    [   10.346503]  platform_probe+0x39/0x70
    [   10.346503]  really_probe+0xdb/0x340
    [   10.346503]  ? pm_runtime_barrier+0x54/0x90
    [   10.346503]  __driver_probe_device+0x78/0x110
    [   10.346503]  driver_probe_device+0x1f/0xa0
    [   10.346503]  __device_attach_driver+0x89/0x110
    [   10.346503]  bus_for_each_drv+0x94/0xf0
    [   10.346503]  __device_attach+0xaf/0x1b0
    [   10.346503]  bus_probe_device+0x8d/0xa0
    [   10.346503]  device_add+0x508/0x710
    [   10.346503]  platform_device_add+0xed/0x250
    [   10.346503]  sysfb_init+0x283/0x320
    [   10.346503]  ? __pfx_sysfb_init+0x10/0x10
    [   10.346503]  do_one_initcall+0x57/0x310
    [   10.346503]  do_initcalls+0x1ef/0x240
    [   10.346503]  kernel_init_freeable+0x187/0x210
    [   10.346503]  ? __pfx_kernel_init+0x10/0x10
    [   10.346503]  kernel_init+0x1a/0x140
    [   10.346503]  ret_from_fork+0xf2/0x110
    [   10.346503]  ? __pfx_kernel_init+0x10/0x10
    [   10.346503]  ret_from_fork_asm+0x1a/0x30
    [   10.346503]  </TASK>
    [   10.346503] Modules linked in:
    [   10.559786] ---[ end trace 0000000000000000 ]---
    [   10.564581] RIP: e030:vesafb_probe.cold+0xd4/0x5fb
    [   10.569546] Code: 08 75 1f 83 3d a8 8c 1d 02 00 75 16 48 c7 c7 90 4a=
 fd 81 e8 8a ef f9 ff c7 05 d4 54 09 02 05 00 00 00 8b 05 c2 54 09 02 31 d2=
 <f7> 35 d2 54 09 02 8b 15 fc 54 09 02 48 89 c1 48 c1 e1 20 48 09 ca
    [   10.588833] RSP: e02b:ffffc9004001fbb8 EFLAGS: 00010246
    [   10.594255] RAX: 0000000000000000 RBX: ffff888101d86f28 RCX: fffffff=
f823666e8
    [   10.601622] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000=
000000003
    [   10.609000] RBP: ffff88810197d400 R08: 0000000000000000 R09: 6c656e6=
96c202c30
    [   10.616378] R10: 0000000000000030 R11: 203a626661736576 R12: 0000000=
000000000
    [   10.623755] R13: 0000000000000000 R14: 0000000000000000 R15: ffff888=
106351000
    [   10.631136] FS:  0000000000000000(0000) GS:ffff888cef7c1000(0000) kn=
lGS:0000000000000000
    [   10.639483] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   10.645434] CR2: ffffc900064ff000 CR3: 000000000222c000 CR4: 0000000=
000050660
    [   10.652817] Kernel panic - not syncing: Fatal exception
    [   10.653803] Kernel Offset: disabled
    (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.

>=20
> > It doesn't reach loading graphics driver in dom0, so I don't have
> > anything interesting on VGA (the last output is about the kexec call
> > done by Heads). But at least I have a serial console.
>=20
> Yet interestingly Xen's "  VGA is ... mode ..." lines differ as well.

This might be relevant given the above.

> That may be a separate issue. Or maybe that's how one of the EFI changes
> that were done a while ago actually surfaces?

But this isn't booting via EFI... Heads is coreboot + Linux payload and
it uses kexec to boot Xen (via multiboot2 entry point).

> Another difference is
>=20
> (XEN) HWP: Using HWP for cpufreq
>=20
> in the 4.19 log vs
>=20
> (XEN) HPET: 8 timers usable for broadcast (8 total)
>=20
> in the 4.22 one. Does the latter perhaps go away if you include [1] in
> the build?

Yes

>=20
> For the HWP driver do you perhaps have a patch in 4.19 to default-enable
> it, but you don't have a similar patch in 4.22?=20

Hm, I do have that patch in 4.22 too, but maybe I failed at rebase...

> If so, to compare apples
> to apples the driver wants enabling/disabling consistently (via command
> line option) for both runs.

Since here booting just dom0 is enough, I don't need any of the qubes
patches. So, now I tested vanilla 4.19 vs staging - both console logs at:
https://gist.github.com/marmarek/e017f0a9ad3cc6ab2bac8849492c41a9

> And then "mwait-idle: lapic_timer_reliable_states ..." differ as well.
>=20
> Jan
>=20
> [1] https://lists.xen.org/archives/html/xen-devel/2026-04/msg00200.html

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jMAIu2igKRfDROZy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmo7JVgACgkQ24/THMrX
1yzMJgf/UJ4CoaGNvX9Nm55jQLFIshiIvlV6obLQILxlqKwAd28vJevUyt8Ja2u9
K3reQAG4F7km+r/PBiVTXUTzM4w8S22c5sPuAUV0Hm0f9SdrUHNbab+k+yx6xCG2
tGNGyvz4AIghLBvoi64keTzt+Bh3jRxukue8fDBTaaEPcir9kG3DFMyq23GVei8S
+/Ttu4yeKC3jbJRjGA/hN8s2e5gtd9Tiu3sc26//YL3v9KxmDGxE3fh9OhGexrRc
du9ZgWpLzuPkJmrpIiyqBMLf9N+RFeN/u3CfFXIrO0QDaYXpgkQgbA1ypB95b4dH
P0K2EbH5SWqysI6iG5BtcMuhCVSu3Q==
=nKsO
-----END PGP SIGNATURE-----

--jMAIu2igKRfDROZy--

