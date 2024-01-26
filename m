Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368383D949
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 12:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671956.1045524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTKLM-0006kQ-61; Fri, 26 Jan 2024 11:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671956.1045524; Fri, 26 Jan 2024 11:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTKLM-0006h8-2E; Fri, 26 Jan 2024 11:25:56 +0000
Received: by outflank-mailman (input) for mailman id 671956;
 Fri, 26 Jan 2024 11:25:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTKLK-0006h2-Ec
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 11:25:54 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8db8bab-bc3d-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 12:25:50 +0100 (CET)
Received: from [2001:8b0:10b:5:66db:af88:1954:1e3]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTKKn-0000000DQl0-2of8; Fri, 26 Jan 2024 11:25:23 +0000
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
X-Inumbo-ID: a8db8bab-bc3d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KTw/8zDf1X8KjYIr+FnbXNhPNeTYeslDSj+8vPIMptA=; b=OaHpoyL7w+9VJ9SCbKEaap7VDU
	45o+2XSuAXAFJYHjccGCadOZNStFzlNSExLajpMCvWoubMol2LrAqkrDovdC8nyUhB0JPC+iy8Y4T
	AI4nth31iPqwXg2DEfrCMW3hSvZlJpq2OjeQdmWVNwg/48ryFMXb5InMEn5rp39xxzzo1Hu52rHt/
	843OscrqWQQ/Is6ZkPlY8MbB2/ak92GvSrul5zKL6iatUWYLMdxRZuDNhsYVYnVmolzCvK46xHulu
	2c3P29LTyB72yHSX/iiTMLyo9tZkDBW9D5KPQWVnUUUf1x8TfNlzGcsha2WyBrbuiOPOEBAW+r/Ks
	8f5HIArg==;
Message-ID: <983ce258a214a0cbe6aeaabab01daed47a2e1066.camel@infradead.org>
Subject: Re: [PATCH v3 05/46] hw/i386/pc: use qemu_get_nic_info() and
 pci_init_nic_devices()
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Strahinja
 Jankovic <strahinja.p.jankovic@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>,  =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
 <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>, Jean-Christophe
 Dubois <jcd@tribudubois.net>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Rob Herring
 <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka
 <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>, Hao Wu
 <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>, Laurent Vivier
 <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  =?ISO-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Nicholas Piggin
 <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Eric Farman
 <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,  xen-devel@lists.xenproject.org
Date: Fri, 26 Jan 2024 11:25:19 +0000
In-Reply-To: <da5f845f-dfee-48de-9fc2-af27b83a615b@redhat.com>
References: <20240108204909.564514-1-dwmw2@infradead.org>
	 <20240108204909.564514-6-dwmw2@infradead.org>
	 <d6b0fd22-92ef-4873-a19a-e7752bfddd2d@redhat.com>
	 <b618c5e3163a3407c413464edd5f638f1c8563fa.camel@infradead.org>
	 <da5f845f-dfee-48de-9fc2-af27b83a615b@redhat.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-tAhVskJ9pKOcssdJnf27"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-tAhVskJ9pKOcssdJnf27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-01-26 at 12:20 +0100, Thomas Huth wrote:
> On 26/01/2024 12.13, David Woodhouse wrote:
> > On Fri, 2024-01-26 at 11:43 +0100, Thomas Huth wrote:
> > > On 08/01/2024 21.26, David Woodhouse wrote:
> > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > >=20
> > > > Eliminate direct access to nd_table[] and nb_nics by processing the=
 the
> > > > Xen and ISA NICs first and then calling pci_init_nic_devices() for =
the
> > > > rest.
> > > >=20
> > > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > > Reviewed-by: Paul Durrant <paul@xen.org>
> > > > ---
> > > > =C2=A0=C2=A0 hw/i386/pc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 26 ++++++++++++++++-----=
-----
> > > > =C2=A0=C2=A0 include/hw/net/ne2000-isa.h |=C2=A0 2 --
> > > > =C2=A0=C2=A0 2 files changed, 16 insertions(+), 12 deletions(-)
> > > >=20
> > > > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > > > index 496498df3a..d80c536d88 100644
> > > > --- a/hw/i386/pc.c
> > > > +++ b/hw/i386/pc.c
> > > > @@ -658,8 +658,11 @@ static void pc_init_ne2k_isa(ISABus *bus, NICI=
nfo *nd)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static int nb_ne2k =3D 0;
> > > > =C2=A0=C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0 if (nb_ne2k =3D=3D NE2000_NB_MAX)
> > > > +=C2=A0=C2=A0=C2=A0 if (nb_ne2k =3D=3D NE2000_NB_MAX) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(&error_fatal=
,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "maximum number of ISA NE2000 de=
vices exceeded");
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > error_setg(&error_fatal, ...) quits QEMU, so the "return;" does not m=
ake
> > > much sense anymore.
> > > Now, according to include/qapi/error.h :
> > >=20
> > > =C2=A0=C2=A0 * Please don't error_setg(&error_fatal, ...), use error_=
report() and
> > > =C2=A0=C2=A0 * exit(), because that's more obvious.
> > >=20
> > > So I'd suggest to do that instead.
> >=20
> > It's going slightly in the opposite direction to what's requested in
> > https://lore.kernel.org/qemu-devel/34e2c0c6-4e04-486a-8e1f-4afdc461a5d4=
@linaro.org/
> >=20
> > I was thinking that a future patch would let the &error_fatal be an
> > Error** passed in by the caller, and not actually hard-coded to be
> > fatal at all.
> >=20
> > But sure, unless Philippe objects I'm happy to do it as you show above.
>=20
> Now that you mention it, I'd also prefer having an Error** parameter to t=
he=20
> function instead, that's certainly cleaner. So if you don't mind, please=
=20
> follow Philippe's suggestion instead!

Right. There's a whole bunch of functions to untangle, that take an
Error** but don't return success/failure independently as they should.
Or don't even take the Error**.

Rather than trying to fix that as part of this series, this was my
compromise =E2=80=94 making it easy to switch that explicit &error_fatal ou=
t
for a function parameter, but not trying to shave that part of the yak
myself just yet.

--=-tAhVskJ9pKOcssdJnf27
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwMTI2MTEyNTE5WjAvBgkqhkiG9w0BCQQxIgQghzCxi+If
SuwVtaHRs3NbRkZ/Yb709etMhnctalHnp1Awgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgClamZXrbQb4UzvcKQWRYPrJIMKLnCSn7na
JZn+fCgPYMerQjym+JOoNhnJ7OP8eTeACu24v9Uzq8Zk/PtGEKo9RqfQ+rjntYRDhWRC3sP5rQic
R3gfC9awRg7Hlj0Rtkw6khqGbGw4oLc1ZqcPY0zoI/wMJ51emWqkg5IZwImzd6UhLzjGwhW0WfxR
yJ3BIKT4DkfUgXKyKZs/ywRp7f0ayV+eqthOJxtjU2t/SDhVngnokuZH87RrScq5YWCcXivzBWv3
w/L9tm9fHGF6EYrJ73W1cJ01GizjrVDj8NjxaJpbwRgBrULqg2YGttUs6LIAAcQNJD5zayfF++ih
lrZRdKQn8W6Pe7nU179xJ6R/JfS5uc64JVsrJIoUPqZ5OdRpIVD6Zp44a1obcZKvnaM50TfiSr15
goG4ghfsLIxWb/+vj6wuZPzBzIslhJbo4+5yqU2OKA9Rw49pjFY5H9aRnjph5sSAS1r7CBLSLxQ3
lRInCBYjwV80/ldL14cX7tcvn5BvMQe78Bhwt/Tzqlcj/zotf7gAqyAy7mBje8tRPmnpt2uTdagJ
QR4/qjYVkd395CIwpqUQnlIvcP/p9We5VS9spIxVXLW8HWO3eHdOs+mUw8B0SXJktAHe0fh+bNxB
zurlebyByZHS4Qa1UBP20n8SecGHCLFSovONo6jGQwAAAAAAAA==


--=-tAhVskJ9pKOcssdJnf27--

