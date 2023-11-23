Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9191F7F5CC7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639537.997052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67DZ-0007zJ-99; Thu, 23 Nov 2023 10:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639537.997052; Thu, 23 Nov 2023 10:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67DZ-0007x3-6b; Thu, 23 Nov 2023 10:45:57 +0000
Received: by outflank-mailman (input) for mailman id 639537;
 Thu, 23 Nov 2023 10:45:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17ou=HE=casper.srs.infradead.org=BATV+6463b3cc4e0ea8740225+7396+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r67DW-0007wv-0d
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:45:56 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 773cb0d9-89ed-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 11:45:49 +0100 (CET)
Received: from [2001:8b0:10b:5:aa35:270f:6b3d:6d64]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r67DP-007ROx-VG; Thu, 23 Nov 2023 10:45:48 +0000
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
X-Inumbo-ID: 773cb0d9-89ed-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YgbOl5KVQSweppal67uN/c/tuov8oL3IO6B2TE/Nb2A=; b=Twtcs798PsgHz1n3KmV4Hfts1h
	EVrzUULWOm+8NfGN4vw8vYlm3a+6qdp2d8+rJBREp1O1fLZOnrlF8sdjd4Sss0ZETDOiUHC5Q+4HZ
	KLZK7q6wUaxBXtK8yDY/EW+fNPfiZMrYk5HJyTzsdjwtvO5FAlL0ogwVt1WQD2Qn1GiVw5DqpLSwF
	40MLofirMifnCswsoW9WblhgD3TWSzvut3hpCJu9/Eo8Fd9/70m71N+FHPpUaFx1bT9zcX9t63SO4
	tDxJ7+ikPVnfh3enozhZ976e1mXWgzgvSK0MM0k6Z+v7QPEEc9Zw4Omtc933tfZFJ9H+pUtgs5do/
	J7KWX6yA==;
Message-ID: <db7f8751c569c7cbf0049807050054071ddda0d9.camel@infradead.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Julien Grall <julien@xen.org>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Anthony Perard
 <anthony.perard@citrix.com>,  "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Date: Thu, 23 Nov 2023 10:45:47 +0000
In-Reply-To: <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
	 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
	 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
	 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
	 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
	 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
	 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
	 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
	 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
	 <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-cdqYlfmCuXFPBfTl9hXO"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-cdqYlfmCuXFPBfTl9hXO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-11-23 at 09:28 +0000, Paul Durrant wrote:
> On 23/11/2023 00:07, Volodymyr Babchuk wrote:
> >=20
> > Hi,
> >=20
> > Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
> >=20
> > > Hi Stefano,
> > >=20
> > > Stefano Stabellini <sstabellini@kernel.org> writes:
> > >=20
> > > > On Wed, 22 Nov 2023, David Woodhouse wrote:
> > > > > On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
> > > > > > On Wed, 22 Nov 2023, David Woodhouse wrote:
> > > > > > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
> > > > > > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
> > > > > > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> > > > > > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.c=
om>
> > > > > > > > > >=20
> > > > > > > > > > Instead of forcing the owner to domid 0, use XS_PRESERV=
E_OWNER to
> > > > > > > > > > inherit the owner of the directory.
> > > > > > > > >=20
> > > > > > > > > Ah... so that's why the previous patch is there.
> > > > > > > > >=20
> > > > > > > > > This is not the right way to fix it. The QEMU Xen support=
 is *assuming* that
> > > > > > > > > QEMU is either running in, or emulating, dom0. In the emu=
lation case this is
> > > > > > > > > probably fine, but the 'real Xen' case it should be using=
 the correct domid
> > > > > > > > > for node creation. I guess this could either be supplied =
on the command line
> > > > > > > > > or discerned by reading the local domain 'domid' node.
> > > > > > > >=20
> > > > > > > > yes, it should be passed as command line option to QEMU
> > > > > > >=20
> > > > > > > I'm not sure I like the idea of a command line option for som=
ething
> > > > > > > which QEMU could discover for itself.
> > > > > >=20
> > > > > > That's fine too. I meant to say "yes, as far as I know the tool=
stack
> > > > > > passes the domid to QEMU as a command line option today".
> > > > >=20
> > > > > The -xen-domid argument on the QEMU command line today is the *gu=
est*
> > > > > domain ID, not the domain ID in which QEMU itself is running.
> > > > >=20
> > > > > Or were you thinking of something different?
> > > >=20
> > > > Ops, you are right and I understand your comment better now. The ba=
ckend
> > > > domid is not on the command line but it should be discoverable (on
> > > > xenstore if I remember right).
> > >=20
> > > Yes, it is just "~/domid". I'll add a function that reads it.
> >=20
> > Just a quick question to QEMU folks: is it better to add a global
> > variable where we will store own Domain ID or it will be okay to read
> > domid from Xenstore every time we need it?
> >=20
> > If global variable variant is better, what is proffered place to define
> > this variable? system/globals.c ?
> >=20
>=20
> Actually... is it possible for QEMU just to use a relative path for the=
=20
> backend nodes? That way it won't need to know it's own domid, will it?

That covers some of the use cases, but it may also need to know its own
domid for other purposes. Including writing the *absolute* path of the
backend, to a frontend node?

--=-cdqYlfmCuXFPBfTl9hXO
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMTIzMTA0NTQ3WjAvBgkqhkiG9w0BCQQxIgQgd0g4t5JB
jHoY9SKtyZD2BKEc2KsM4fwWyfxaI5pEzawwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgA6ccuH51xMiEnQ4qVgZVTix1LaPoDGjNJS
f15/qyL3h1O9qYhQEDbUPCpNvW+XEoZXrkBQEhVL3XREz5el2MEhIwUQFadgelct9sEyHhQfQNiB
/dmr1A15OI3VSrnv9w7rZZheiR/cT/sp6zL37OYGrsWU6QOB9dBqslqgi9gEN2oNZxr2exUpaKjT
zSXkl8Y8dbiDtFkHf0huAIfzjjRr5+tzvTueOvpFlUBqJ5FfnaWIOeWgFq7FlLxjUIIyPIkRuwab
cSQI4nD1zUoTleLgVGqxPuw43cCGxjQoed2XnM0oskiL7elMvwWjOVN0Abpctbs05SCk3gBZO1ac
QPKFdDbDhevCyhyPlHHhM8kQj1JS/n0hPxy9M7HXoiKKESSImprKbqtK9bKlz3B5UWGFlkckwBtR
e8UaPmU7RTWVf4S899CgOIyQSEshhjqM0KWSlxqIlTRrbyG3ic5YdrlZFyiG6p0GEMvD56uWiOTJ
neGMh9MzpaeHVn0pnx5s19kLp+jJDAdoJmzaDU5OVnn5ZHLv0Ov8nYAs0aybdkmgmfFaSIZqPO/c
A7aaXbsU/9p/d1ASMeyKETHQrc3rhDzZ2Lztd9lTrG4RE7QmdKamO+AA5m60QDVpp+jp5yTAGf6n
gqlZJ28yb2qq9AIGWMzMvPPRX86lwO98ypu5j+GxUwAAAAAAAA==


--=-cdqYlfmCuXFPBfTl9hXO--

