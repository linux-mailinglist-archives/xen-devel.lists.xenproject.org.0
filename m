Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F97D65FF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622728.969816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZkQ-0004nI-8X; Wed, 25 Oct 2023 09:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622728.969816; Wed, 25 Oct 2023 09:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZkQ-0004kC-5j; Wed, 25 Oct 2023 09:00:18 +0000
Received: by outflank-mailman (input) for mailman id 622728;
 Wed, 25 Oct 2023 09:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJSz=GH=casper.srs.infradead.org=BATV+85b1c44ac99574f3713d+7367+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qvZkN-0004k0-4o
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:00:17 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6ef601b-7314-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 11:00:12 +0200 (CEST)
Received: from [2001:8b0:10b:5:758e:a1c4:bc7:e7a7]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qvZkG-007ndV-SB; Wed, 25 Oct 2023 09:00:08 +0000
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
X-Inumbo-ID: e6ef601b-7314-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iZi1uuJHpalMiH9ef9Cqm3wVDhjFV8Mn+j0MBqXsuRQ=; b=JCUq6U7qwwVrWm5cWzMCHuWkgY
	SKhbhBxPvA1sIxwcDgOwd8eg+IBdpJnPRXHTvRqYn96zYDgqnEnHfNlMeNSlBqVE2M2oQ5537dhdd
	qNIrntNVWQZ57yt/A0wLUVgisFoAPGgUPMsnQRnQWRz240MXbJ05/8U+o9l1r/eJLD584c9SCN7CB
	YeDnudR/Lgipkd5t/uOloQvxFvL030KakHu4k802jOzJhqxa74pYNYoNSqeII68LXzcSlL7z2mGqL
	AzQb/4ridsGNAHweMgZBl837ajslJemNikAki4tzVq/5xOYR1wtQmkdsuRmHoBkLjW2oQy8pmhj8X
	2R8g8o4g==;
Message-ID: <31b160a3f3ce2eda057dafec3cab273a38f1dc0f.camel@infradead.org>
Subject: Re: [PATCH 12/12] hw/xen: add support for Xen primary console in
 emulated mode
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>,  =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Date: Wed, 25 Oct 2023 10:00:08 +0100
In-Reply-To: <684d378d-9c71-4a5f-8f0c-3ed6ffc20a70@xen.org>
References: <20231016151909.22133-1-dwmw2@infradead.org>
	 <20231016151909.22133-13-dwmw2@infradead.org>
	 <c18439ca-c9ae-4567-bbcf-dffe6f7b72e3@xen.org>
	 <3acd078bba2d824f836b20a270c780dc2d031c43.camel@infradead.org>
	 <3f22903b-30f0-40f2-8624-b681d9c7e05d@xen.org>
	 <42b005d7c03d5b0d47a16c4e025d8c3ec7289e0f.camel@infradead.org>
	 <19fc2701-4cd8-4a14-9d45-bfaea37ed2d6@xen.org>
	 <efdefcc11e2bd8c0f7e6e914dc9c54ffd65fe733.camel@infradead.org>
	 <684d378d-9c71-4a5f-8f0c-3ed6ffc20a70@xen.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Mq1/62YRka1szoenOvX5"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-Mq1/62YRka1szoenOvX5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-10-25 at 09:31 +0100, Paul Durrant wrote:
> On 24/10/2023 17:34, David Woodhouse wrote:
> > On Tue, 2023-10-24 at 17:25 +0100, Paul Durrant wrote:
> > > On 24/10/2023 16:49, David Woodhouse wrote:
> > > > On Tue, 2023-10-24 at 16:39 +0100, Paul Durrant wrote:
> > > > > On 24/10/2023 16:37, David Woodhouse wrote:
> > > > > > On Tue, 2023-10-24 at 15:20 +0100, Paul Durrant wrote:
> > > > > > > On 16/10/2023 16:19, David Woodhouse wrote:
> > > > > > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > > > > > >=20
> > > > > > > > The primary console is special because the toolstack maps a=
 page at a
> > > > > > > > fixed GFN and also allocates the guest-side event channel. =
Add support
> > > > > > > > for that in emulated mode, so that we can have a primary co=
nsole.
> > > > > > > >=20
> > > > > > > > Add a *very* rudimentary stub of foriegnmem ops for emulate=
d mode, which
> > > > > > > > supports literally nothing except a single-page mapping of =
the console
> > > > > > > > page. This might as well have been a hack in the xen_consol=
e driver, but
> > > > > > > > this way at least the special-casing is kept within the Xen=
 emulation
> > > > > > > > code, and it gives us a hook for a more complete implementa=
tion if/when
> > > > > > > > we ever do need one.
> > > > > > > >=20
> > > > > > > Why can't you map the console page via the grant table like t=
he xenstore
> > > > > > > page?
> > > > > >=20
> > > > > > I suppose we could, but I didn't really want the generic xen-co=
nsole
> > > > > > device code having any more of a special case for 'Xen emulatio=
n' than
> > > > > > it does already by having to call xen_primary_console_create().
> > > > > >=20
> > > > >=20
> > > > > But doesn't is save you the whole foreignmem thing? You can use t=
he
> > > > > grant table for primary and secondary consoles.
> > > >=20
> > > > Yes. And I could leave the existing foreignmem thing just for the c=
ase
> > > > of primary console under true Xen. It's probably not that awful a
> > > > special case, in the end.
> > > >=20
> > > > Then again, I was surprised I didn't *already* have a foreignmem op=
s
> > > > for the emulated case, and we're probably going to want to continue
> > > > fleshing it out later, so I don't really mind adding it.
> > > >=20
> > >=20
> > > True. We'll need it for some of the other more fun protocols like vkb=
d
> > > or fb. Still, I think it'd be nicer to align the xenstore and primary
> > > console code to look similar and punt the work until then :-)
> >=20
> > I don't think it ends up looking like xenstore either way, does it?
> > Xenstore is special because it gets to use the original pointer to its
> > own page.
> >=20
>=20
> Not sure what you mean there? A guest can query the PFN for either=20
> xenstore or console using HVM params, or it can find them in its own=20
> grant table entries 0 or 1.

The code in our xen_xenstore.c uses its *own* pointer (s->xs) to the
MemoryRegion that it created (s->xenstore_page). It is its own backend,
as well as doing the "magic" to create the guest-side mapping and event
channel.

The difference for the console code is that we actually have a
*separation* between the standard backend code in xen_console.c, and
the magic frontend parts for the emulated mode.


>=20
> > I don't think I want to hack the xen_console code to explicitly call a
> > xen_console_give_me_your_page() function. If not foreignmem, I think
> > you were suggesting that we actually call the grant mapping code to get
> > a pointer to the underlying page, right?
>=20
> I'm suggesting that the page be mapped in the same way that the xenstore=
=20
> backend does:
>=20
> 1462=C2=A0=C2=A0=C2=A0 /*=20
>=20
> 1463=C2=A0=C2=A0=C2=A0=C2=A0 * We don't actually access the guest's page =
through the grant, because
> 1464=C2=A0=C2=A0=C2=A0=C2=A0 * this isn't real Xen, and we can just use t=
he page we gave it in the
> 1465=C2=A0=C2=A0=C2=A0=C2=A0 * first place. Map the grant anyway, mostly =
for cosmetic purposes so
> 1466=C2=A0=C2=A0=C2=A0=C2=A0 * it *looks* like it's in use in the guest-v=
isible grant table.=20
> 1467=C2=A0=C2=A0=C2=A0=C2=A0 */
> 1468=C2=A0=C2=A0=C2=A0 s->gt =3D qemu_xen_gnttab_open();
> 1469=C2=A0=C2=A0=C2=A0 uint32_t xs_gntref =3D GNTTAB_RESERVED_XENSTORE;
> 1470=C2=A0=C2=A0=C2=A0 s->granted_xs =3D qemu_xen_gnttab_map_refs(s->gt, =
1, xen_domid, &xs_gntref,
> 1471=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PROT_READ | PROT_WRITE);

It already *is*. But as with xen_xenstore.c, nothing ever *uses* the
s->granted_xs pointer. It's just cosmetic to make the grant table look
right.

But that doesn't help the *backend* code. The backend doesn't even know
the grant ref#, because the convention we inherited from Xen is that
the `ring-ref` in XenStore for the primary console is actually the MFN,
to be mapped as foreignmem.

Of course, we *do* know the grant-ref for the primary console, as it's
always GNTTAB_RESERVED_CONSOLE. So I suppose we could put a hack into
the xen_console backend to map *that* in the case of primary console
under emu? In fact that would probably do the right thing even under
Xen if we could persuade Xen to make an ioemu primary console?





> >=20
> > I could kind of live with that... except that Xen has this ugly
> > convention that the "ring-ref" frontend node for the primary console
> > actually has the *MFN* not a grant ref. Which I don't understand since
> > the toolstack *does* populate the grant table for it (just as it does
> > for the xenstore page).=C2=A0But we'd have to add a special case except=
ion
> > to that special case, so that in the emu case it's an actual grant ref
> > again. I think I prefer just having a stub of foreignmem, TBH.
> >=20
>=20
> You're worried about the guest changing the page it uses for the primary=
=20
> console and putting a new one in xenstore? I'd be amazed if that even
> works on Xen unless the guest is careful to write it into=20
> GNTTAB_RESERVED_CONSOLE.

Not worried about the guest changing it. I was mostly just concerned
about the xen-console having to have another special case and magically
"know" it. But I suppose I can live with it being hard-coded to
GNTTAB_RESERVED_CONSOLE. I'll knock that up and see how it makes me
feel.

I'm reworking some of that connect/disconnect code anyway, to have the
backend tell the primary_console code directly what the backend port#
is, so I can remove the soft-reset hacks in xen_evtchn.c entirely.

--=-Mq1/62YRka1szoenOvX5
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDI1MDkwMDA4WjAvBgkqhkiG9w0BCQQxIgQgjb2Wctay
wayMeXa1kccBoKKQTImyQG/0HAtpbYX0UWIwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCte8NfAvKEg7iwGPvEZ3HLEgn7+bEZQ64Z
qooyTNdasNh7BEI5BX1iaVRNj6DJiwvRPJiLDm/J3XnqJgZ5mq/ZRLtG79QWi/SmPdLPzwvOfNxJ
4a8cbdKDg1AolIbSBh/ZQ5LoRGRmiCXIkkfhTgjGURd9IcUg8PikeVPX6LY/SG7pRKyP2/qgOMeM
WoutzBxOQLYttRQ6S4riF5s5Le0ez2wgnS3Ja29KgauqQ6H0inlQgXG83lKkXSLUssvIIL5R+fB1
UOnjJl6UtxOVytNDpWrsBRzqse229WEzsip9w8/ySgpV97tHQOk7yTNtWqhH/ECMPDWlQaO3ZjrF
0uLxyXno5nl+qWoRf7o172i+XgcLinVb0/eCAoD+e4cJiprJSK/IWXKvO8jzNgJhg36cVvmulTYk
34e1uwDz3LhiaPI1hiBE1uRQv7a/s2DlQYp/eVgLAtQEASarRe755l/TsgDkSbdzAVrgi/Mm3yAh
PardWYl9/Bf/skqSFdLqFUCcqNfbi0gGUFt7AZP30uB8rPk3P8uCwsIlg/6afGxe5B9DPVdVqmCQ
eRplXCg352JMzLcbkoxJ1laOc/vh5LvPPcfkhjQBbfqmg63gDZ7IqMkpBUkze7dpiOaHdU8aoro2
Bcfhmv/dhDWxB8hgFBf14TnsCtJP0IKWfFSnAzscMQAAAAAAAA==


--=-Mq1/62YRka1szoenOvX5--

