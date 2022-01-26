Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58749D274
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 20:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261083.451689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnrw-0008Qy-OK; Wed, 26 Jan 2022 19:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261083.451689; Wed, 26 Jan 2022 19:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCnrw-0008Nj-Kh; Wed, 26 Jan 2022 19:22:12 +0000
Received: by outflank-mailman (input) for mailman id 261083;
 Wed, 26 Jan 2022 19:22:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nWl3=SK=bombadil.srs.infradead.org=BATV+677f07704d1834417a80+6730+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1nCnru-0008Nd-Id
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 19:22:11 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e5ffbe4-7edd-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 20:22:07 +0100 (CET)
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCnrh-00DNGn-IN; Wed, 26 Jan 2022 19:21:57 +0000
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
X-Inumbo-ID: 3e5ffbe4-7edd-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2fnL7rQ7kcT9IsaiLiUVD6C4YSxBZpKPKph6eke7jh8=; b=s8dAOjBDgy2EXwrler7aafa1uh
	rslrgvWa5vnzT1BiKyseJevQHKzi/dC0kSMAOdelaH8HbYb1O1bRtZwYcl2Ztkq6i6t03bkFe5+Gl
	mYusgkcpkvCWE7Ridf3x8gyilGsa1+hunqPYkgE2Cd6lpddoH9Lfu8pna735hMtMpdTYZugDtjMQK
	v1hv3B/EhWVhrouwSQsTCTBoVkSppDtscxVlWNlhIr5b3zhEo86IMhLfMEBhp9X7zhOop8MFntLj4
	B0YOvF6dhMHyGHhDv6ulK4nwKwyhI/mkzdWI+TAdTRsk/UB8pDzo/00+N/wwUF69Vl16Rnt/khXf/
	D5H3weQA==;
Message-ID: <05217a1176ba2d296c078d4e188184096bcae905.camel@infradead.org>
Subject: Re: [PATCH 1/3] xen/vioapic: add support for the extended
 destination ID field
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Date: Wed, 26 Jan 2022 19:21:55 +0000
In-Reply-To: <72f35326-0ae1-458c-6490-37d14524bf33@suse.com>
References: <20220120152319.7448-1-roger.pau@citrix.com>
	 <20220120152319.7448-2-roger.pau@citrix.com>
	 <5f8d332d-1bc3-af71-27ba-a4ff7b6e9514@suse.com>
	 <YfATkz+nse45Vg3C@Air-de-Roger>
	 <72f35326-0ae1-458c-6490-37d14524bf33@suse.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-h6U6qKmPRj1v1vMlxeZO"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html


--=-h6U6qKmPRj1v1vMlxeZO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-01-26 at 13:47 +0100, Jan Beulich wrote:
> On 25.01.2022 16:13, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Jan 24, 2022 at 02:20:47PM +0100, Jan Beulich wrote:
> > > On 20.01.2022 16:23, Roger Pau Monne wrote:
> > > > Such field uses bits 55:48, but for the purposes the register
> > > > will be
> > > > used use bits 55:49 instead. Bit 48 is used to signal an RTE
> > > > entry is
> > > > in remappable format which is not supported by the vIO-APIC.
> > >=20
> > > Neither here nor in the cover letter you point at a formal
> > > specification
> > > of this mode of operation.
> >=20
> > I'm not aware of any formal specification of this mode, apart from
> > the
> > work done to introduce support in Linux and QEMU:
> >=20
> > https://lore.kernel.org/all/20201009104616.1314746-1-dwmw2@infradead.or=
g/
> >=20
> > https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc1bb5418e
> >=20
> >=20
> > Adding David in case there's some kind of specification somewhere
> > I'm
> > not aware of.
> >=20
> > > What I'm aware of are vague indications of
> > > this mode's existence in some of Intel's chipset data sheets. Yet tha=
t
> > > leaves open, for example, whether indeed bit 48 cannot be used here.
> >=20
> > Bit 48 cannot be used because it's already used to signal an RTE is in
> > remappable format. We still want to differentiate an RTE entry in
> > remappable format, as it should be possible to expose both the
> > extended ID support and an emulated IOMMU.
>=20
> I think I did say so on irc already: There's not really a problem like
> this. For one I wouldn't expect an OS to use this extended ID at the
> same time as having an IOMMU to deal with the width restriction. And
> then, even if they wanted to use both at the same time, they'd simply
> need to care about the specific meaning of this bit themselves: When
> the bit is set, it would be unavoidable to have it (perhaps identity-)
> remapped by the IOMMU.

As you later said, it's too late for bikeshedding that decision. But I
stand by it regardless of the time.

Even by the time *I* made that choice, it was long since established by
Intel. You could make the same argument about their original hardware
design, that the format bit is pointless and that if an OS enables
interrupt remapping, it knows full well when it's going to use it. It
can even be configured in the IOMMU per PCI function.

There is benefit to having a very clear and unambiguous difference
between the MSI formats that isn't entirely dependent on the IOMMU
being configured correctly. And in my case there is *definitely*
benefit to following the precedent already set by Intel in the real
hardware. For me, those outweighed the marginal additional benefit of
going from 15 to 16 bits of APIC ID in the MSI.

> > > > --- a/xen/arch/x86/hvm/vioapic.c
> > > > +++ b/xen/arch/x86/hvm/vioapic.c
> > > > @@ -412,7 +412,8 @@ static void ioapic_inj_irq(
> > > > =20
> > > >  static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned =
int pin)
> > > >  {
> > > > -    uint16_t dest =3D vioapic->redirtbl[pin].fields.dest_id;
> > > > +    uint16_t dest =3D vioapic->redirtbl[pin].fields.dest_id |
> > > > +                    (vioapic->redirtbl[pin].fields.ext_dest_id << =
8);
> > >=20
> > > What if an existing guest has been writing non-zero in these bits? Ca=
n
> > > you really use them here without any further indication by the guest?
> >=20
> > Those bits where reserved previously, so no OS should have used them.
> > There are hypervisors already in the field (QEMU/KVM and HyperV) using
> > this mode.
> >=20
> > We could add a per-domain option to disable extended ID mode if we are
> > really worried about OSes having used those bits for some reason.
>=20
> Generally I think previously ignored bits need to be handled with care.
> If there was a specification, what is being said there might serve as
> a guideline for us. Even if there was just a proper description of the
> EDID field found in recent Intel chipset spec, this might already help
> determining whether we want/need an enable (or disable). But there's
> not even a bit announcing the functionality in, say, the version
> register.

It's not very verbose, but the Extended Destination ID in the I/OAPIC
is at least mentioned in the RTE documentation in the 82806AA datasheet
https://datasheet.octopart.com/FW82806AA-SL3VZ-Intel-datasheet-13695406.pdf=
=20

See page 47, =C2=A72.4.10 "Redirection Table High DWord".

The rest you have to kind of piece together from the later
documentation once they actually started *using* it for IRQ remapping.
I think it may also have been used on IA64?

The realisation that we didn't need to have special different code to
compose RTE entries for Compatibility Format vs. Remappable Format, and
that we could just allow the 'upstream' APIC code to compose the MSI
message and then swizzle the bits into the RTE... was rather slow to
come.
https://lore.kernel.org/all/20201024213535.443185-22-dwmw2@infradead.org/


--=-h6U6qKmPRj1v1vMlxeZO
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIwMTI2MTkyMTU1WjAvBgkqhkiG9w0BCQQxIgQgjd+6hKAS
nrhGSBrn3wSKefclHFaOqX64A1esXaTCMdowgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBaR7kbMZxbPEowSudGbuS0/6MjYCQ0Sc42
o/p2fxgYYGv/DTMJDWIXQUXRXXDvsHfc6qKzVcy4Tiw9bRozJXPSewVpDadIg/8unAALsdfR5zdD
Ypxl+fz0GwjF+Sb4txiO4T703LfoUOjYsCFegvKYDb3aPxRd3Z4X+/Am3U9Xv/JeZ2Xg5bVIV/8C
MLmOLKDNnFIJ46aF6rqATzcCYK8u7w3PgYE5jVft2O3v2yTbccGSp26WDhgJbqrAbI3Z+1HkJAkf
mUb7AUj6XC8KCXSLiCiqWeAPVZwRQtg55bnzDqOpb/7YH0l6/JvlVmOjvrCrT3vuvHODJaUsCobL
iERm4PKIk0MEmquYusvZT2eA1bIqEwa+iRfE0Blxtc3qbCRYMxk+cRllgTnQl4RUOJGYZOiwQ9Mr
CcVDhbmBdPhZoXNjGKDEp4WkpUnebwqYtL4eYB7eLILnU3z8JeeD+fwM0Vmx4CNoeg9e8KkMGoGz
uc1LiJw5S6y9VsOcmURHd6ntQJXVp18Lny85X4o18OAx5jOecENy+PFO8y+KxJQCzRw1tR8/Oh2u
7qjykV6gtaBr+jc380rlIJ7aUIMdBsqgiOHwFTj0X1iJ58nJRv8tOnK8g8e4LaMrqDyr4b0InPQj
81lS9XTmqAfYGNMzXmGRJKztEkhfZgmBhZCZdKpKiQAAAAAAAA==


--=-h6U6qKmPRj1v1vMlxeZO--


