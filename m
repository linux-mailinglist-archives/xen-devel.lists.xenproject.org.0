Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F406B998A24
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816251.1230451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syuPr-0008DE-Dn; Thu, 10 Oct 2024 14:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816251.1230451; Thu, 10 Oct 2024 14:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syuPr-0008Ap-BD; Thu, 10 Oct 2024 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 816251;
 Thu, 10 Oct 2024 14:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NG+C=RG=casper.srs.infradead.org=BATV+368770c0ca5004ac3ece+7718+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1syuPo-0008Ah-UQ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:45:21 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44ec1e30-8716-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:45:19 +0200 (CEST)
Received: from [2001:8b0:10b:5:b738:9e92:c87a:9258]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1syuPk-00000007sFl-048u; Thu, 10 Oct 2024 14:45:16 +0000
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
X-Inumbo-ID: 44ec1e30-8716-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9UpAqBaLdOwjRfattNdMmmFMPmb/qAcE+NJFCvCGM9Y=; b=fGcWAtZc2ogH4c/JlkB1SJ8hUe
	006u6ZW0dVRw+fOiwpFbdZ31j0WkQofl7LBGGkHrxGUifjird9qviluEyId3wJO7Y2IqDY50Q8oQ3
	L6ljA6vd90ee38TEXQzqs4JwQ44jg9cKcQqPdWsaV6PbDJwb9QS9SLA8a+ZzmKCzLYoDjs7G0L416
	IT5CX2M8fdLfTbrd/LcFfib0Qyv5TRhOHH9I9Iy7WEwf1oLoaYvVMnq+2F6hYtchqLCW7/Pxf7Aa0
	hF+Roaf067WmWPW16YeKj8OPWL8ekk8k1erl73YmF4BfRkzW+rdYmCAlkgNhmilB4U57orEXcYfZ0
	AUaNhQLA==;
Message-ID: <422974b53c8da25c917a540d2f6aa5b7e6c247cf.camel@infradead.org>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>, =?ISO-8859-1?Q?S=E9bastien?= Chaumat
 <euidzero@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Juergen Gross
	 <jgross@suse.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Date: Thu, 10 Oct 2024 15:45:14 +0100
In-Reply-To: <962cad57-21a8-4882-a23a-95add04cac9b@suse.com>
References: 
	<CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
	 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
	 <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
	 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
	 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
	 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
	 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
	 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
	 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
	 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
	 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
	 <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
	 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
	 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
	 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
	 <962cad57-21a8-4882-a23a-95add04cac9b@suse.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-oVGzV8JU921wCdqYk8wt"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-oVGzV8JU921wCdqYk8wt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-03-07 at 09:39 +0100, Jan Beulich wrote:
> On 06.03.2024 18:28, S=C3=A9bastien Chaumat wrote:
> > Reasoning backward=C2=A0 (using a=C2=A0 kernel without the pinctrl_amd =
driver to
> > > ensure xen only is at stake) :
> > > =C2=A0checking the diff in IOAPIC=C2=A0 between bare metal and xen=C2=
=A0 (IRQ7 is on
> > > pin07 on APIC )
> > >=20
> > > using kernel argument : apic=3Ddebug
> > >=20
> > > bare metal :
> > > [=C2=A0=C2=A0=C2=A0 0.715330] fedora kernel: ... APIC VERSION: 810500=
10
> > > ...
> > > [=C2=A0=C2=A0=C2=A0 0.715433] fedora kernel:=C2=A0 pin07, disabled, e=
dge , high, V(00),
> > > IRR(0), S(0), physical, D(0000), M(0)
> > >=20
> > > xen :
> > > [=C2=A0=C2=A0=C2=A0 2.249582] fedora kernel: ... APIC VERSION: 000000=
14
> > > ...
> > > [=C2=A0=C2=A0=C2=A0 2.249730] fedora kernel:=C2=A0 pin07, disabled, l=
evel, low , V(60),
> > > IRR(0), S(0), physical, D(0000), M(0)
> > >=20
> > > So the APIC table is not the same.
> > >=20
> > > As strange as it looks the=C2=A0 (IOAPIC 0) pin07 is correctly descri=
bed by the
> > > APIC in xen but yet differently than in baremetal.
> > > But the APIC message comes long after the
> > > [=C2=A0=C2=A0=C2=A0 1.833145] fedora kernel: xen: registering gsi 7 t=
riggering 0 polarity
> > > 1
> > >=20
> > > so I wonder if the APIC pin07 info had any influence.
> > >=20
> > > Finally found the fix : adding ioapic_ack=3Dnew to xen boot parameter=
s.
> > Not only the trackpad is now working but also the ACPI Embedded Control=
ler
> > which is completely disabled.
>=20
> Hmm, interesting. From someone else's laptop many years ago I had actuall=
y
> an indication in the opposite direction: That didn't work because of our
> defaulting to new (no directed EOI in sight yet back at that time). I
> wonder if overriding the ack method isn't actually just papering over the
> underlying actual issue here, whatever that is. IOW with the edge vs leve=
l
> mismatch addressed I'd hope the override could then be dropped again.

With interrupt remapping enabled, I'm surprised any of it works.
Especially the broadcast EOI.

Remember, the I/O APIC is just a device for turning line interrupts
into MSIs. You couldn't tell from the Xen code, but there's fairly much
no reason for the IOMMU interrupt remapping code, and the I/O APIC
code, to know *anything* about each other.

There is an upstream *target* of the MSIs generated from the I/O APIC.
That's either an Intel IOMMU, and AMD IOMMU, or a standard APIC without
remapping. You ask that upstream target to compose a standard MSI
message (address within 0xFEExxxxx, data).=20

Then you hand that to the I/O APIC and all it needs to do is swizzle
those address and data bits into the right place in the RTE.

For more information see=20
https://lore.kernel.org/all/20201024213535.443185-22-dwmw2@infradead.org/
where I decoupled these in Linux, and a little light bedtime reading at
http://david.woodhou.se/more-than-you-ever-wanted-to-know-about-x86-msis.tx=
t

The only caveat to this simplicity is the whole EOI thing.
Historically, the I/O APIC would be told of an EOI for a given
*vector*, and it would scan the RTEs for all its pins and clear the
remote_irr bit for any level-triggered pin which matched that vector.

But now, those low 8 bits of the RTE, which end up in the low 8 bits of
the MSI data, aren't necessarily the 'vector' at all. For the Intel
IOMMU remapping, those bits aren't used at all (so actually we can just
put the vector in there, and keep the I/O APIC happy).

But with an AMD IOMMU, the low bits of the MSI data are actually used
as the index into the IOMMU's Interrupt Remapping Table. So *that* is
the number which needs to be fed to the I/O APIC's explicit EOI
register.... and good luck getting the CPU's local APIC to generate the
right value for the broadcast!

So... with the directed EOI, when __eoi_IO_APIC_irq() finds the
*actual* vector with 'vector =3D desc->arch.vector', then calls
__io_apic_eoi() with that value...

... and when __io_apic_eoi() then blindly writes that 'vector' to the
I/O APIC EOI register, it's writing the wrong thing. At least with AMD
interrupt remapping enabled.

So I believe this 'fixes' the issue, when using directed EOI:=20

--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -298,8 +298,15 @@ static void __io_apic_eoi(unsigned int apic, unsigned =
int vector, unsigned int p
     /* Prefer the use of the EOI register if available */
     if ( ioapic_has_eoi_reg(apic) )
     {
-        /* If vector is unknown, read it from the IO-APIC */
-        if ( vector =3D=3D IRQ_VECTOR_UNASSIGNED )
+        /* If vector is unknown, read it from the IO-APIC. Also,
+         * with interrupt remapping, the field the IO-APIC thinks
+         * is the "vector" might be something completely different.
+         * With an AMD IOMMU it's the low bits of the IRTE index
+         * into the IOMMU's table, for example. So using the actual
+         * delivery vector which is stored in the IRTE would be wrong;
+         * we need to use the actual bits the IO-APIC sees in the RTE.
+         */
+        if ( iommu_intremap || vector =3D=3D IRQ_VECTOR_UNASSIGNED )
             vector =3D __ioapic_read_entry(apic, pin, true).vector;
=20
         *(IO_APIC_BASE(apic)+16) =3D vector;


That's actually reading back from the RTE each time, which isn't ideal.
I think what we should actually do is ensure there's a 1:1 mapping
between the I/O APIC pin numbers and the IRTE indices (since the AMD
IOMMU has a per-device IRT anyway), and then you can just write the
pin# *instead* of the vector# to the EOI register.

I don't really see how this would ever work with the "new" (that is,
broadcast EOI) method. I'm confused about that part. I wonder if
there's some AMD magic, like broadcast EOI ending *all* level
interrupts?




--=-oVGzV8JU921wCdqYk8wt
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQxMDEwMTQ0NTE0WjAvBgkqhkiG9w0BCQQxIgQgLIv0YjZF
OK63Y6SJGalzqvYddgHtytArfu9tdboI7Ucwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCZtZR5HsTsl5GY8sDyCYcFzgs+gnytQSvJ
f+DFZ+R3qiTLkiHJDFo03eT7dX33laiYYkyeIEWvN3A3ZQrBlVvxSLU6+K+eW7XWcCa+hux39+Lw
0R1rJJ+CqxmYjKjSMxz1h4k4bwcBT0oi1XoLd1TWCPp/khHNm0r42eAZHHafMfkjNWA+Z+B8AkIg
Ktc78uA2pIkEvOR5RKFCx6o81Cjja+Zg9+nXhSkNWajHhzr1y9u1kNupuf8tcuh3cyBgyRd3g0Cn
CEwsYzL25+96hP4qxTxw/zA6rM7T2hduGiVR2/bkjOo9nlfTYfEyk565B6NSlFxeUG6exTjWoQXC
m3vp5ESvQnbnGuVFkj50+K+lbmHNt3XTknk5V0BJcAOp3V/5+nAX6MYLuUty69qWFOYAMEunRHui
swjlba79Dsl8aIDRdOXf78pVNS2RU1sgqifA75Bbj3yFFpKWEuWopSdSDdbYHLgr7F5IHxoTIdTC
ApKDrOm39MZb5/yPS+JmSsVKLlVhalF561xVb5Sz/nXvpcMgQEjeq8k5pGyLij1GD6byBqHVN1Ze
gnVUNAevthpr/AAjfo3Q+kYsI3yJIJEZEibxAx/O+o/l9TJJYbCNXKdBTXVJbGlmbKhMt6L89Rtl
DcPptNOOmzOHiWbP80Tx/HxyJo9ZM6MJy7E78/3mKgAAAAAAAA==


--=-oVGzV8JU921wCdqYk8wt--

