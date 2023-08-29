Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D902E78C758
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592297.924980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazae-00056x-Md; Tue, 29 Aug 2023 14:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592297.924980; Tue, 29 Aug 2023 14:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazae-000556-Hr; Tue, 29 Aug 2023 14:21:08 +0000
Received: by outflank-mailman (input) for mailman id 592297;
 Tue, 29 Aug 2023 14:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oK0n=EO=casper.srs.infradead.org=BATV+3a9ed657c5c9a78d2ebc+7310+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qazac-00054i-2E
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:21:07 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4697b1f2-4677-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:20:59 +0200 (CEST)
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=freeip.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qazaE-0071HI-Cl; Tue, 29 Aug 2023 14:20:42 +0000
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
X-Inumbo-ID: 4697b1f2-4677-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=10hotENc6uNLPo+4Aajfu/bvpKSjJAs0JJdmsI4pucU=; b=NFp5nkJbQYsrVrMw8nL2nv7ZPV
	K48JPtLU+OtAeL+OshHanGvoZUZ/eXphjobjvlwOaRph+h/MXI1KRCi7c5CAbTN1Y4Vft1lGvBP7E
	qilgKALFxbCwsFgrXvZz5D+Vkfp5ng1hj6nY5WRbA9utzJPu3iqwV9voUw0enyEladllpDgMWaOwF
	UJIOAD92b7kx/DPGW/Mmy8uB8pm8XCt07YToCPp9HhXMJUMUTDV0amwPT/F43iAYxTiUM4CFZID9e
	n8F1zoEX6j15vJpBYv+RIPtoyT7/+OciR6XscSM6G/EYSzcwQaVr8dfb+4NF8kTFDuAZeGCkrZq8P
	vXj4JW5g==;
Message-ID: <c6e8cfbdbb6449111271ef391d3759ca2cb0c1cb.camel@infradead.org>
Subject: Re: [PATCH v1 01/23] pc/xen: Xen Q35 support: provide IRQ handling
 for PCI devices
From: David Woodhouse <dwmw2@infradead.org>
To: Joel Upham <jupham125@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Date: Tue, 29 Aug 2023 15:20:38 +0100
In-Reply-To: <1c547c5581ce6192b70c68f39de108cdb2c73f7e.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
	 <1c547c5581ce6192b70c68f39de108cdb2c73f7e.1687278381.git.jupham125@gmail.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-hh/jFNut+TT/EA4qh4z0"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-hh/jFNut+TT/EA4qh4z0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-06-20 at 13:24 -0400, Joel Upham wrote:
> The primary difference in PCI device IRQ management between Xen HVM and
> QEMU is that Xen PCI IRQs are "device-centric" while QEMU PCI IRQs are
> "chipset-centric". Namely, Xen uses PCI device BDF and INTx as coordinate=
s
> to assert IRQ while QEMU finds out to which chipset PIRQ the IRQ is route=
d
> through the hierarchy of PCI buses and manages IRQ assertion on chipset
> side (as PIRQ inputs).

I don't think that's an accurate way of describing it.

Let's take the ICH9 as the basic case, and look at how the PIIX3 and
Xen both differ from it. As far as I understand it...

=E2=80=A2 ICH9

The four INTx pins from each PCI slot (32*4) are multiplexed down to a
smaller number of PIRQ lines; 8 of them on the ICH9. The mapping for
each slot is quite complex and depends on chipset registers.

Those 8 PIRQ lines (PIRQ[A-H]) are mapped directly and unconditionally
to IRQ16-23 on the I/OAPIC.

There is also a set of mapping registers in the chipset which allows
each PIRQ line to be mapped to the i8259 PIC (as e.g. IRQ5, 10, etc.).

(I think QEMU has a bug here. It should be able to deliver to *both*
the I/O APIC and the i8259, but it seems not to deliver to the I/O APIC
when the i8259 routing is enabled.)


=E2=80=A2 PIIX3

The PIIX3 only has four PIRQ lines, and the mapping from slot/pin to
PIRQ line is a *lot* more deterministic; it's basically just a simple
mask and shift of the slot/pin numbers. And since the PIIX3 also didn't
have an internal I/O APIC, the chipset registers mapping PIRQ# to IRQ#
*do* (at least in QEMU's emulation) affect the routing to the I/O APIC
as well as the i8259.

(I think this is probably a QEMU bug, or at least lack of fidelity in
its PC platform emulation. Real hardware with a PIIX3 and external I/O
APIC would have routed PIRQ[A-D] to I/O APIC IRQ16-20, wouldn't it?)


=E2=80=A2 Xen

Xen has two *separate* hard-coded rotations from slot/pin down to
PIRQs. For the I/O APIC it multiplexes down to 32 I/O APIC pins (IRQ16-
47). But for the i8259 it hard-codes the PIIX3 rotation down to 4 PIRQs
and expects the device model to provide the i8259 IRQ# for each of them
(from the chipset registers).

When you say Xen is "device-centric" I think you're saying it's hard-
coded the pin mappings and that's why it expects to take the actual PCI
bus/device/function/pin in order to do the mapping for itself, while
QEMU would normally expect to have done that part "properly" to get a
faithful emulation of the hardware in question.

(Note the extra fun part I mentioned earlier: Xen can route I/O APIC
interrupts as PIRQs, and needs the *I/O APIC* IRQ# for that which might
differ to the i8259 IRQ#. So running with 'noapic' and
XENFEAT_hvm_pirqs is probably going to *really* confuse your guests
because the ACPI _PRT table can only tell them one number.

> Two callback functions are used for this purpose: .map_irq and .set_irq
> (named after corresponding structure fields). Corresponding Xen-specific
> callback functions are piix3_set_irq() and pci_slot_get_pirq(). In Xen
> case these functions do not operate on pirq pin numbers. Instead, they us=
e
> a specific value to pass BDF/INTx information between .map_irq and
> .set_irq -- PCI device devfn and INTx pin number are combined into
> pseudo-PIRQ in pci_slot_get_pirq, which piix3_set_irq later decodes back
> into devfn and INTx number for passing to *set_pci_intx_level() call.
>=20
> For Xen on Q35 this scheme is still applicable, with the exception that
> function names are non-descriptive now and need to be renamed to show
> their common i440/Q35 nature. Proposed new names are:
>=20
> xen_pci_slot_get_pirq --> xen_cmn_pci_slot_get_pirq
> xen_piix3_set_irq=C2=A0=C2=A0=C2=A0=C2=A0 --> xen_cmn_set_irq
>=20
> Another IRQ-related difference between i440 and Q35 is the number of PIRQ
> inputs and PIRQ routers (PCI IRQ links in terms of ACPI) available. i440
> has 4 PCI interrupt links, while Q35 has 8 (PIRQA...PIRQH).
> Currently Xen have support for only 4 PCI links, so we describe only 4 of
> 8 PCI links in ACPI tables. Also, hvmloader disables PIRQ routing for
> PIRQE..PIRQH by writing 80h into corresponding PIRQ[n]_ROUT registers.
>
> All this PCI interrupt routing stuff is largely an ancient legacy from PI=
C
> era. It's hardly worth to extend number of PCI links supported as we
> normally deal with APIC mode and/or MSI interrupts.
>=20
> The only useful thing to do with PIRQE..PIRQH routing currently is to
> check if guest actually attempts to use it for some reason (despite ACPI
> PCI routing information provided). In this case, a warning is logged.

I don't quite understand how this works. PIRQA-H are supposed to map
unconditionally to IRQ16-23 on the ICH9 I/OAPIC. But you can't do that
without fixing Xen. So doesn't the ACPI _PRT table have to reflect
Xen's hard-coded I/O APIC mapping of slots to IRQ16-47? I don't see
where you did that?

And there are some devices which are defined to use PIRQ[E-H] by the
ICH9 datasheet and which *can't* route to PIRQ[A-D], aren't there?
Those devices just can't be used in i8259 mode unless Xen is fixed to
handle more PIRQ routings? In fact, Xen doesn't even get the mappings
to PIRQ[A-D] right for the ICH9, does it? It's just applying its hard-
coded PIIX3 mappings to PIRQ[A-D] and then the ICH9's mapping to IRQ#
on top of that?


--=-hh/jFNut+TT/EA4qh4z0
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwODI5MTQyMDM4WjAvBgkqhkiG9w0BCQQxIgQg7jt9yvyk
UZbwU86j9uueRrEbIqYpMBQbJUAS69aWy/kwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAo92jN2itrRAmXtdvwqYKqksr/6/flT9A3
csFCrZ+4p1haGq5lxyst8jAEiXZ8NkT/zDilbmrlq/u/QwtBTq0cx2Cjy6S8VaFlqPDddNIuu5AS
3ndbU3gQZFoGhWOZBtGADU3PsKyj66de6wI9qKt5mE89Mbys1nT/OxbMbUghEvtOyLX5/iz+7p+p
MVQhHX5krf3ggD4tebb1qEmCLKLFgXECCKQ2UAJKn3bOFOEdsPWHF50kwnogudIcW7Gwu9kaHWx8
Axg6lkWc+eYjgshJwnlu0t6P0/ee6zQOf2oDgL2NRjNMyfpIzmeKJ3hHD/BhL6KOc+VSC67gnaYe
G+OH0PI23A/i9BtQyV8GTiyF6zcOAcyDA8VrpgKXi0U89bF90907jPx2l8RUULHjMxthWfZBt36/
xcK40907Lg0mtlZ7bAa2DG2qiQ7xXHb3A1XUYvbfNJGTw5IvJTSN/1cvAA4rrCDlmZP9T/PM0BOM
2RSnOAzDI87A8g0sRURtKFQM8lj9PqmwiwxFsehlD+RiprIX8NVLp0mJz/NQb8O8HKXlPoXTODjh
5CiMPQ/6aZgsgvMmn28KpFILzAP8QP0YOx6pJ7lqhPwU1IxiSBvrSTWZoGrMJzCeOfodkTqK93Ta
X7WaJKd06NzaNDpUjFdCE5kPdBUSGGXPSzO4PybvJgAAAAAAAA==


--=-hh/jFNut+TT/EA4qh4z0--

