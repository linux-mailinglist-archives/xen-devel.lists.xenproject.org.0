Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B76AE61A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507574.781261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZzk-0001PI-BC; Tue, 07 Mar 2023 16:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507574.781261; Tue, 07 Mar 2023 16:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZzk-0001Na-8K; Tue, 07 Mar 2023 16:16:56 +0000
Received: by outflank-mailman (input) for mailman id 507574;
 Tue, 07 Mar 2023 16:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yYpO=67=casper.srs.infradead.org=BATV+9298a7250c90fe94fbb7+7135+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pZZzi-0001NS-E4
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:16:55 +0000
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74e5b3d1-bd03-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 17:16:49 +0100 (CET)
Received: from [2001:8b0:10b:5:640c:634b:db90:9c87]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZZyx-006YAm-Tj; Tue, 07 Mar 2023 16:16:08 +0000
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
X-Inumbo-ID: 74e5b3d1-bd03-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3ZCf67GpIRVuyIcW88YqOAiLLpuW8e60237wNWVEDts=; b=mUIaWge720r+rqVV7qHF/shzF4
	/j5BTpT1mG4d0WsYO8gcUb5OGiOzbGRbE329ATjppPcXgTqLb5omnJL2UZCvKr8SVUTsrjxLd5sdh
	bmLPQGvgXNvxalsQKdPDAawVBSuEifK+YCK1NN0khVnVMAoTfcmrefGVhTHjbPHpQTcFHplOvP2EU
	NTkZnlmFgIj1cahHjL8nsvEZPnioBQMZYW6LgyIKfGZb4GQBlv91UBKwRQIXtRDDJko7bq0VM9ibN
	FGDXcUKHAVrNzYOvL7sXNCWz1MrvGu4kja9vZf6/k2WI6iv4XIuiECaBJcB1z4WoPdyp/N7xMb0uY
	aB4Wc4hQ==;
Message-ID: <e72d7f6b09031603f63498bb555dca3c25c3fde5.camel@infradead.org>
Subject: Re: [RFC PATCH v1 21/25] hw/xen: Add emulated implementation of
 grant table operations
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>,  xen-devel@lists.xenproject.org
Date: Tue, 07 Mar 2023 16:16:06 +0000
In-Reply-To: <ee8f307b-1e0a-6d6c-3edc-8f8262dcfe42@xen.org>
References: <20230302153435.1170111-1-dwmw2@infradead.org>
	 <20230302153435.1170111-22-dwmw2@infradead.org>
	 <ee8f307b-1e0a-6d6c-3edc-8f8262dcfe42@xen.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-AQQHNLypwwvIWGFooPru"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-AQQHNLypwwvIWGFooPru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-03-07 at 16:07 +0000, Paul Durrant wrote:
> On 02/03/2023 15:34, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > This is limited to mapping a single grant at a time, because under Xen =
the
> > pages are mapped *contiguously* into qemu's address space, and that's v=
ery
> > hard to do when those pages actually come from anonymous mappings in qe=
mu
> > in the first place.
> >=20
> > Eventually perhaps we can look at using shared mappings of actual objec=
ts
> > for system RAM, and then we can make new mappings of the same backing
> > store (be it deleted files, shmem, whatever). But for now let's stick t=
o
> > a page at a time.
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> > =C2=A0 hw/i386/kvm/xen_gnttab.c | 299 +++++++++++++++++++++++++++++++++=
+++++-
> > =C2=A0 1 file changed, 296 insertions(+), 3 deletions(-)
> >=20
> [snip]
> > +static uint64_t gnt_ref(XenGnttabState *s, grant_ref_t ref, int prot)
> > +{
> > +=C2=A0=C2=A0=C2=A0 uint16_t mask =3D GTF_type_mask | GTF_sub_page;
> > +=C2=A0=C2=A0=C2=A0 grant_entry_v1_t gnt, *gnt_p;
> > +=C2=A0=C2=A0=C2=A0 int retries =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (ref >=3D s->max_frames * ENTRIES_PER_FRAME_V1 |=
|
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->map_track[ref] =3D=3D UI=
NT8_MAX) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return INVALID_GPA;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (prot & PROT_WRITE) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask |=3D GTF_readonly;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 gnt_p =3D &s->entries.v1[ref];
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The guest can legitimately be changing the =
GTF_readonly flag. Allow
>=20
> I'd call a guest playing with the ref after setting GTF_permit_access a=
=20
> buggy guest and not bother with the loop.

Didn't we have this argument already when I tried to get you to change
your one? :)

I argue that it's OK for a guest to *increase* permissions to include
write permission, even while a read-only grant may be in progress.

And also to *decrease* permissions to take away write permission, even
while read-only grants may be in progress.

The loop is what Xen does, so let's do it that way.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * that, but don't let a malicious guest cause=
 a livelock.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 for (retries =3D 0; retries < 5; retries++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t new_flags;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Read the entry before an=
 atomic operation on its flags */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gnt =3D *(volatile grant_en=
try_v1_t *)gnt_p;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((gnt.flags & mask) !=3D=
 GTF_permit_access ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gnt=
.domid !=3D DOMID_QEMU) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn INVALID_GPA;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_flags =3D gnt.flags | G=
TF_reading;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prot & PROT_WRITE) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new=
_flags |=3D GTF_writing;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qatomic_cmpxchg(&gnt_p-=
>flags, gnt.flags, new_flags) =3D=3D gnt.flags) {
>=20
> Xen actually does a cmpxchg on both the flags and the domid. We probably=
=20
> ought to fail to set the flags if the guest is playing with the domid
> but since we're single-tenant it doesn't *really* matter... just a=20
> nice-to-have. So...

Yeah, changing the *domid* while it's active is definitely not an OK
thing to do.


--=-AQQHNLypwwvIWGFooPru
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMzA3MTYxNjA2WjAvBgkqhkiG9w0BCQQxIgQgWIxJGK0i
HuT3tvgYre9TZ43jmzjLTzQAHU7IE+g1OJMwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBACOlKiyXfqF5IsjponO/+NTIrxkBHb98x
b5CGZxA5yTbT3Myt/XM5gNk3awL1VCAfvE23cyI7nVkeEWisOAdVe54z9pWLDK7/8XXTJO/rk/1v
eRUr7VX2EEVQwESCj0U8Tj70BbguJ4j5NIqUpjBDimCDheRGIsVioQ21jwJJTkoRf9tvCerAQ+XE
AJx9JgFUZGOtb0LPB14xMJTa8eRnPxi4Ue591IiPgt1Fovp4MO/N8pf34S6d6Y3Mm3fjznNnBrWn
sFi6jn48EDKra3GM8s12Q416tQX0oGh3/LlFqG2BX3OgDl09CMMxiZdlT5T415AD/YsIXhS9Tyxq
2k1d9jlzGNuoYuloMHtcUlYlH9sU71GBXrgo4r+oqStGC40+yMLh9O961jAvwQsZbfqVYWx/E2am
IC2mFDxqFWmqgh23ddPMTsXpGMOhEVfYwBnXx4MuqwlbVr4BMi9NQBldiHLvFiMKdch8k/7dCEyf
1GXEk5j4WofK85/hFIUtxa91pDGdzkk/yk+mkvPd67yva6MBcA9JnXdcEOKZUq5M53Q0kWhq5iAa
4L57ekou2tEu5ne+/bKFCFyfoBEtnO9c11yGF0X0FpiKbJTohIaRR3xKtoijo0QaqduGshAT1VBP
m0sxxqutFJs0c88j4RRb74/U5k+dIQVKSrnV/f6QVAAAAAAAAA==


--=-AQQHNLypwwvIWGFooPru--

