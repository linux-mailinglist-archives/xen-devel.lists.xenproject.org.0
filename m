Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFBC7D48D6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621718.968470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvC4b-0005o8-Ca; Tue, 24 Oct 2023 07:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621718.968470; Tue, 24 Oct 2023 07:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvC4b-0005le-9o; Tue, 24 Oct 2023 07:43:33 +0000
Received: by outflank-mailman (input) for mailman id 621718;
 Tue, 24 Oct 2023 07:43:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jXWl=GG=casper.srs.infradead.org=BATV+e2898748ca55db067849+7366+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvC4Z-0005hr-1e
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:43:32 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f376cc-7241-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 09:43:28 +0200 (CEST)
Received: from [2001:8b0:10b:5:545e:5208:5de0:9d33]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvC4Q-001DbK-JN; Tue, 24 Oct 2023 07:43:22 +0000
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
X-Inumbo-ID: 03f376cc-7241-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rADGbKH/agUBw1bSe+A7AQHCPoullbpznN6Sp+8K54Q=; b=j4GB5lcU5w9XQs7Vu/UNYN0dSz
	naig9JapxQ8zolvuSOvXvOPwvpS7E0nVdHL9nANIMyl1mvxjFvv9/yZtFoFsGTYi3jVpMrahP7OyB
	ffhhOVI4IRdXmZ+yjxEk2Ug8/cT/91gWc9m4kVdDT51Bv3taRtuwU0FmjNGibYoZ7xWN2DPJXUj/m
	T7qgq4q7JGCeW7qWes4FFfmcZNSqmh5gD1QiSApE/hs/QzLt/FD9+1nkkhqUofEqobYxeF53cylVt
	D2Tb+k2xYj7KQPRvCxYo0lbp10il2YXFnhk0D2aMlGhCwBkzjhnyfAzkSFdWJBat58rpxuk+bcs2+
	3OxtHQfg==;
Message-ID: <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>,  paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Rahul Singh <rahul.singh@arm.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 24 Oct 2023 08:43:21 +0100
In-Reply-To: <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
	 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-CWHGAPOLbxU2Zh5JwAWE"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-CWHGAPOLbxU2Zh5JwAWE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-10-24 at 08:53 +0200, Juergen Gross wrote:
>=20
> I'm puzzled. This path doesn't contain any of the RCU usage I've added in
> commit 87797fad6cce.
>=20
> Are you sure that with just reverting commit 87797fad6cce the issue doesn=
't
> manifest anymore? I'd rather expect commit 721255b9826b having caused thi=
s
> behavior, just telling from the messages above.

Retesting in the cold light of day, yes. Using v6.6-rc5 which is the
parent commit of the offending 87797fad6cce.

I now see this warning at boot time again, which I believe was an
aspect of what you were trying to fix:

[    0.059014] xen:events: Using FIFO-based ABI
[    0.059029] xen:events: Xen HVM callback vector for event delivery is en=
abled
[    0.059227] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.059296]=20
[    0.059297] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.059298] [ BUG: Invalid wait context ]
[    0.059299] 6.6.0-rc5 #1374 Not tainted
[    0.059300] -----------------------------
[    0.059301] swapper/0/0 is trying to lock:
[    0.059303] ffffffff8ad595f8 (evtchn_rwlock){....}-{3:3}, at: xen_evtchn=
_do_upcall+0x59/0xd0
[    0.059312] other info that might help us debug this:
[    0.059312] context-{2:2}
[    0.059313] no locks held by swapper/0/0.
[    0.059314] stack backtrace:
[    0.059315] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.6.0-rc5 #1374
[    0.059318] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[    0.059319] Call Trace:
[    0.059320]  <IRQ>
[    0.059323]  dump_stack_lvl+0x57/0x90
[    0.059327]  __lock_acquire+0x7bb/0xbb0
[    0.059334]  lock_acquire.part.0+0xad/0x240
[    0.059337]  ? xen_evtchn_do_upcall+0x59/0xd0
[    0.059340]  ? rcu_is_watching+0xd/0x40
[    0.059345]  ? lock_acquire+0xf2/0x110
[    0.059349]  _raw_read_lock+0x3b/0x70
[    0.059353]  ? xen_evtchn_do_upcall+0x59/0xd0
[    0.059355]  xen_evtchn_do_upcall+0x59/0xd0
[    0.059358]  __sysvec_xen_hvm_callback+0x47/0x80
[    0.059362]  sysvec_xen_hvm_callback+0x99/0xc0
[    0.059367]  </IRQ>
[    0.059368]  <TASK>
[    0.059369]  asm_sysvec_xen_hvm_callback+0x16/0x20
[    0.059372] RIP: 0010:__x86_return_thunk+0x0/0x30
[    0.059375] Code: 0b 66 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 =
90 90 90 90 90 90 90 90 e9 3a ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 <c3=
> cc 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00
[    0.059377] RSP: 0000:ffffffff8a803ef8 EFLAGS: 00000202
[    0.059379] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 00000000000=
00020
[    0.059381] RDX: 0000000000000000 RSI: ffffffff8a537ca9 RDI: ffffffff8a4=
cb0f7
[    0.059382] RBP: 00000000000000a0 R08: 0000000000000001 R09: 00000000000=
00000
[    0.059383] R10: 0000000000002e00 R11: ffff8fea0f7cd540 R12: 00000000000=
00000
[    0.059385] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
14010
[    0.059390]  start_kernel+0x26c/0x630
[    0.059396]  x86_64_start_reservations+0x14/0x30
[    0.059400]  x86_64_start_kernel+0x88/0x90
[    0.059403]  secondary_startup_64_no_verify+0x178/0x17b
[    0.059409]  </TASK>
[    0.171308] Console: colour VGA+ 80x25
[    0.171342] printk: console [hvc0] enabled

But offlining/onlining works without a problem:

[root@localhost cpu1]# echo 0 > online=20
[  103.585558] smpboot: CPU 1 is now offline
[root@localhost cpu1]# echo 1 > online=20
[  105.675214] installing Xen timer for CPU 1
[  105.675537] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  105.677744] cpu 1 spinlock event irq 57
[root@localhost cpu1]# while true; do echo 0 > online ; echo 1 > online ; d=
one

http://david.woodhou.se/config-hvm-hotplug-2023-10-24.txt


--=-CWHGAPOLbxU2Zh5JwAWE
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDI0MDc0MzIxWjAvBgkqhkiG9w0BCQQxIgQguIITGqH7
SQGBkUJTExEV0/WL8LSELKZ13OwnYDD4eXYwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAE2qXvs+/C7cIhjD6lI+fPEdTArppujDTK
pVmIrHAVvLAntxbunZSn9KszDYGfs7MHxPH/j2vo8utw0tEyz/Qc7JcNVhCCJElA9rKeCedTOgHB
6VG+AaQ8ouctgaubjaZJDjLyVCtWFwyd22TqyEoT1czLFr+0axIzwaSOxV3hbf6HPss9cHt94yi0
K1Alii0YIVFZPTNrj1xomEd4Soxuva4kZUEkrIlChO3WZXiK+hMATnZ3dM3tQ4RjN6MZQwSpK0e8
LbWnuTmxMalkO9kHQ6+POhyVBBQshVaEuo8W5OPUYC51RMdUdwFYmDbltwBVS2g3xm+2ijZnzJq/
y/jWI3YFzFoiVQybTOxpx+duY1lVoGhfZLBYVmPM56YV9aqCcRONJ/NFnm2ZIfkijv+V+ftV4QZp
GC6hu8pYEvS9Pn+RIesH7G77qfEAWSlWj5wO53bfNHfLUVPTCVpcoMvqNv9wGXJGDPwIOQGp2ea7
VHER07UBcu95cXfGYHOF8yhRNuRl78NgxExWAEqek895GF3X3/kAfBFQF3+oMZboELQpEn+YDAhP
NX/Lc6WrToiElJsAvPuYElIvEVanZhNztjEY4hYIPfK3RQF3SuPkOg/tDQ0na5sEislnGNfIAQEm
7Q71qUUP060HXh3kre6ilXxDOw9bOsBWgAojZkV7dAAAAAAAAA==


--=-CWHGAPOLbxU2Zh5JwAWE--

