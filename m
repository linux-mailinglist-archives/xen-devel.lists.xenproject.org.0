Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3F47D5214
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621998.969031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHiY-0004JD-Af; Tue, 24 Oct 2023 13:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621998.969031; Tue, 24 Oct 2023 13:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHiY-0004GU-7X; Tue, 24 Oct 2023 13:45:10 +0000
Received: by outflank-mailman (input) for mailman id 621998;
 Tue, 24 Oct 2023 13:45:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jXWl=GG=casper.srs.infradead.org=BATV+e2898748ca55db067849+7366+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvHiX-0004FA-Ci
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:45:09 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a9f5bee-7273-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:45:07 +0200 (CEST)
Received: from [2001:8b0:10b:5:758e:a1c4:bc7:e7a7]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvHiR-002nVf-Kk; Tue, 24 Oct 2023 13:45:03 +0000
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
X-Inumbo-ID: 8a9f5bee-7273-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K4D7odNBJQH65J7yw2XffuQZDPo9BXWlXSoRpsAebs8=; b=pUSraHcINhvc0nrpjghjhqkEYD
	CARYyvLOehik6Evgz0SPAnSm9ySTJuTdd7bdafaH0Ro+5KO7L2SbJUxf9+C6EnwdN9i9FKsRc9TLE
	rPHX0AVyDAnJdlxthLJwgOSUOlLWub9D7e6EScFuBY9lb1BoRQDYlf6xvHomfVW6Wk+fRlnVNu9qg
	y6aihXhJsQ18Byy9talQTHJddQac5fhePCYZpXQW3acTZYyQbHfu/SiTFYVBdEd9zWTN0h+2RHrWW
	XlnbBnBlCGoGFDxa6/42yrujzyrEDl2zvbUEFweiZS3nQMbsnmDJfsZyCHZ7Ppr2NZ57vp0Zwqnh1
	srl6488Q==;
Message-ID: <f527753bab9fd48e3a3fdc060c33bba9e2a14324.camel@infradead.org>
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>,  paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Rahul Singh <rahul.singh@arm.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 24 Oct 2023 14:45:03 +0100
In-Reply-To: <0a2725ee-a1a8-43e4-b117-f474ffb392a8@suse.com>
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
	 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
	 <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
	 <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>
	 <0a2725ee-a1a8-43e4-b117-f474ffb392a8@suse.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-1RTq8o4N2oPBk6gxcPmK"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-1RTq8o4N2oPBk6gxcPmK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-10-24 at 14:08 +0200, Juergen Gross wrote:
>=20
> > I can probably change xen_send_IPI_one() to not need irq_get_chip_data(=
).
>=20
> David, could you test the attached patch, please? Build tested only.

No longer whines when offlining CPU1.

Still triple-faults when bringing it back online. Or if I remove the
lockdep_assert_irqs_disabled() from load_current_idt(), gives the same
warnings as before, all on the same theme about IRQs being enabled when
they shouldn't be.

[root@localhost cpu1]# echo 1 > online=20
[   26.435377] installing Xen timer for CPU 1
[   26.437493] smpboot: Booting Node 0 Processor 1 APIC 0x2
[   26.438830] ------------[ cut here ]------------
[   26.438842] WARNING: CPU: 1 PID: 0 at arch/x86/kernel/cpu/common.c:454 c=
r4_update_irqsoff+0x2e/0x60
[   26.438858] Modules linked in:
[   26.438864] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0-rc5+ #1382
[   26.438870] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   26.438873] RIP: 0010:cr4_update_irqsoff+0x2e/0x60
[   26.438881] Code: 89 f7 65 48 8b 15 ba 07 fd 7d 8b 0d 54 28 dc 01 85 c9 =
74 18 65 8b 0d 51 f5 fb 7d 85 c9 75 0d 65 8b 0d 42 f3 fb 7d 85 c9 74 02 <0f=
> 0b 48 f7 d7 48 21 d7 48 09 c7 48 39 fa 75 05 c3 cc cc cc cc 65
[   26.438885] RSP: 0000:ffffb245000aff10 EFLAGS: 00010002
[   26.438891] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00001
[   26.438895] RDX: 00000000001300a0 RSI: 000000000000000f RDI: 00000000000=
0000f
[   26.438898] RBP: ffff9002c1398000 R08: 00000000fffffe51 R09: 00000000000=
00000
[   26.438902] R10: ffff90030e106078 R11: 0000000000000000 R12: 00000000000=
00001
[   26.438905] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[   26.438908] FS:  0000000000000000(0000) GS:ffff90030e100000(0000) knlGS:=
0000000000000000
[   26.438912] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.438916] CR2: 0000000000000000 CR3: 000000004483c000 CR4: 00000000001=
300a0
[   26.438923] Call Trace:
[   26.438927]  <TASK>
[   26.438931]  ? cr4_update_irqsoff+0x2e/0x60
[   26.438937]  ? __warn+0x81/0x170
[   26.438951]  ? cr4_update_irqsoff+0x2e/0x60
[   26.438959]  ? report_bug+0x18d/0x1c0
[   26.438974]  ? handle_bug+0x3c/0x80
[   26.438983]  ? exc_invalid_op+0x13/0x60
[   26.438990]  ? asm_exc_invalid_op+0x16/0x20
[   26.439015]  ? cr4_update_irqsoff+0x2e/0x60
[   26.439024]  cpu_init+0x54/0x1a0
[   26.439034]  start_secondary+0x2e/0x140
[   26.439044]  secondary_startup_64_no_verify+0x178/0x17b
[   26.439071]  </TASK>
[   26.439074] irq event stamp: 109567
[   26.439077] hardirqs last  enabled at (109567): [<ffffffff82720a76>] acp=
i_idle_play_dead+0x46/0x70
[   26.439087] hardirqs last disabled at (109566): [<ffffffff82124e00>] do_=
idle+0x90/0xe0
[   26.439094] softirqs last  enabled at (109502): [<ffffffff82cec89c>] __d=
o_softirq+0x31c/0x423
[   26.439105] softirqs last disabled at (109489): [<ffffffff820bab91>] __i=
rq_exit_rcu+0x91/0x100
[   26.439111] ---[ end trace 0000000000000000 ]---
[   26.439141] ------------[ cut here ]------------
[   26.439145] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:4429 rcu_cpu_sta=
rting+0x192/0x1f0
[   26.439159] Modules linked in:
[   26.439164] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          6=
.6.0-rc5+ #1382
[   26.439168] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   26.439171] RIP: 0010:rcu_cpu_starting+0x192/0x1f0
[   26.439179] Code: ff 65 8b 05 80 7c e9 7d 85 c0 75 af 65 8b 05 71 7a e9 =
7d 85 c0 74 a4 0f 0b eb a0 65 8b 05 62 7a e9 7d 85 c0 0f 84 94 fe ff ff <0f=
> 0b e9 8d fe ff ff 89 c6 4c 89 f7 e8 9d 71 b6 00 90 e9 c0 fe ff
[   26.439182] RSP: 0000:ffffb245000aff08 EFLAGS: 00010002
[   26.439188] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 00000000000=
00000
[   26.439191] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00000000000=
00001
[   26.439194] RBP: 0000000000000000 R08: 000000000383c000 R09: 00000000000=
00000
[   26.439197] R10: ffff90030e106078 R11: 0000000000000000 R12: 00000000000=
00000
[   26.439200] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[   26.439203] FS:  0000000000000000(0000) GS:ffff90030e100000(0000) knlGS:=
0000000000000000
[   26.439206] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.439209] CR2: 0000000000000000 CR3: 000000004483c001 CR4: 00000000001=
706a0
[   26.439213] Call Trace:
[   26.439215]  <TASK>
[   26.439218]  ? rcu_cpu_starting+0x192/0x1f0
[   26.439225]  ? __warn+0x81/0x170
[   26.439234]  ? rcu_cpu_starting+0x192/0x1f0
[   26.439244]  ? report_bug+0x18d/0x1c0
[   26.439256]  ? handle_bug+0x3c/0x80
[   26.439262]  ? exc_invalid_op+0x13/0x60
[   26.439269]  ? asm_exc_invalid_op+0x16/0x20
[   26.439290]  ? rcu_cpu_starting+0x192/0x1f0
[   26.439306]  start_secondary+0x3f/0x140
[   26.439314]  secondary_startup_64_no_verify+0x178/0x17b
[   26.439338]  </TASK>
[   26.439340] irq event stamp: 109567
[   26.439343] hardirqs last  enabled at (109567): [<ffffffff82720a76>] acp=
i_idle_play_dead+0x46/0x70
[   26.439349] hardirqs last disabled at (109566): [<ffffffff82124e00>] do_=
idle+0x90/0xe0
[   26.439354] softirqs last  enabled at (109502): [<ffffffff82cec89c>] __d=
o_softirq+0x31c/0x423
[   26.439362] softirqs last disabled at (109489): [<ffffffff820bab91>] __i=
rq_exit_rcu+0x91/0x100
[   26.439367] ---[ end trace 0000000000000000 ]---
[   26.439377] ------------[ cut here ]------------
[   26.439418] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:4462 rcu_cpu_sta=
rting+0x17f/0x1f0
[   26.439427] Modules linked in:
[   26.439432] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          6=
.6.0-rc5+ #1382
[   26.439436] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   26.439438] RIP: 0010:rcu_cpu_starting+0x17f/0x1f0
[   26.439446] Code: c5 60 dc 55 83 b8 04 00 00 00 f0 0f c1 45 00 e9 23 ff =
ff ff 65 8b 05 80 7c e9 7d 85 c0 75 af 65 8b 05 71 7a e9 7d 85 c0 74 a4 <0f=
> 0b eb a0 65 8b 05 62 7a e9 7d 85 c0 0f 84 94 fe ff ff 0f 0b e9
[   26.439449] RSP: 0000:ffffb245000aff08 EFLAGS: 00010002
[   26.439454] RAX: 0000000000000001 RBX: ffff90030e12f280 RCX: 40000000000=
0177a
[   26.439458] RDX: 3fffffffffffffff RSI: ffffffff8344ef66 RDI: ffffffff834=
cb177
[   26.439461] RBP: 0000000000029328 R08: 000000000000003e R09: 00000000000=
0003e
[   26.439465] R10: 0000000000000000 R11: ffff9002c1398d48 R12: ffffffff83c=
03d00
[   26.439468] R13: 0000000000000002 R14: ffffffff83cb7280 R15: 00000000000=
00000
[   26.439471] FS:  0000000000000000(0000) GS:ffff90030e100000(0000) knlGS:=
0000000000000000
[   26.439475] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.439478] CR2: 0000000000000000 CR3: 000000004483c001 CR4: 00000000001=
706a0
[   26.439481] Call Trace:
[   26.439483]  <TASK>
[   26.439485]  ? rcu_cpu_starting+0x17f/0x1f0
[   26.439492]  ? __warn+0x81/0x170
[   26.439502]  ? rcu_cpu_starting+0x17f/0x1f0
[   26.439512]  ? report_bug+0x18d/0x1c0
[   26.439525]  ? handle_bug+0x3c/0x80
[   26.439530]  ? exc_invalid_op+0x13/0x60
[   26.439537]  ? asm_exc_invalid_op+0x16/0x20
[   26.439559]  ? rcu_cpu_starting+0x17f/0x1f0
[   26.439570]  ? rcu_cpu_starting+0xef/0x1f0
[   26.439582]  start_secondary+0x3f/0x140
[   26.439590]  secondary_startup_64_no_verify+0x178/0x17b
[   26.439616]  </TASK>
[   26.439618] irq event stamp: 109567
[   26.439620] hardirqs last  enabled at (109567): [<ffffffff82720a76>] acp=
i_idle_play_dead+0x46/0x70
[   26.439626] hardirqs last disabled at (109566): [<ffffffff82124e00>] do_=
idle+0x90/0xe0
[   26.439631] softirqs last  enabled at (109502): [<ffffffff82cec89c>] __d=
o_softirq+0x31c/0x423
[   26.439639] softirqs last disabled at (109489): [<ffffffff820bab91>] __i=
rq_exit_rcu+0x91/0x100
[   26.439644] ---[ end trace 0000000000000000 ]---
[   26.443877] cpu 1 spinlock event irq 57


--=-1RTq8o4N2oPBk6gxcPmK
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDI0MTM0NTAzWjAvBgkqhkiG9w0BCQQxIgQgwAAWWaq7
YSN4YhI3jQOxk2WLZ09/ZVW+xvGo6afQHwEwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBD6Y0iL9uUL1f90N5iovGB4+ept5TnYsiP
fjP7fHEke8P/S9aIg5CLCbyuW9h3AQsLXL52qzkOPpu3XdLEQ1/7TP8B8u7jydnrS39f+xHZvbbM
yCsIWzz34whJzG0H/9iLmAhJTN6qaTw3FMT+UpDcR9VQJq9wkBw5LsBM/UMKWKlxocTy1WIpeTg1
czmKPf5iLsAUTHVi5VD/jiFwQHZzzrBavSCuiB97Hy+cHD25NrLsisA9RwMjCddEXfa/csJuRVgq
VhbJz6trCWaEIKP/w9pCOuhbaXxTU/yJt4BKjjMrtQkA5oWvJNYf0Pmm5IpLYVZuTMWH3V8RrOUe
V7VIiz0Xp8HUvUOog3jETgsfrO2nDWT6jjknz76AR7gzauS84Rj/dEP3cyb+m3DFMI96iKJyHsoI
zwN8Q0vCNV/dv5qvDGz5rOuIzekav1LJOdqHNUpuNER2jc6WWxrXCEBIDRRdzdaIYBuyJpTg9ghG
zcpotiie3yHB2JSJgniSdUg/41CH/w1AA3IRtKdhun6hZRFkPwPmaYpWfiYsyogbDB3Qx43P/FB1
Kwi9J7fTA6yZAas/p53NcEqrQdv2WFE4aB+hxwba4uN7bRal9jATQMLgpvHfD+zSx2wd/z/WqF3a
Ida8nJI32xMIbU99+ucnfO2TtSd+iW2Sj6yV0sIK1wAAAAAAAA==


--=-1RTq8o4N2oPBk6gxcPmK--

