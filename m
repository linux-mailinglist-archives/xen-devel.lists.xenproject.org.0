Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497F7FBC5F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 15:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643213.1003192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yoH-0004Ji-Aa; Tue, 28 Nov 2023 14:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643213.1003192; Tue, 28 Nov 2023 14:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7yoH-0004I3-7k; Tue, 28 Nov 2023 14:11:33 +0000
Received: by outflank-mailman (input) for mailman id 643213;
 Tue, 28 Nov 2023 14:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/U+o=HJ=casper.srs.infradead.org=BATV+1109833b3cfcadd2158c+7401+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r7yoE-0004Hn-3f
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 14:11:31 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 057b042b-8df8-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 15:11:28 +0100 (CET)
Received: from [2001:8b0:10b:5:f9ea:a921:5c3e:db1d]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1r7yo3-00CQQo-Hh; Tue, 28 Nov 2023 14:11:19 +0000
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
X-Inumbo-ID: 057b042b-8df8-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A8H4YFefXZoEJ7R00UxgIz/kgIL4v0DxDKH+UFE+enE=; b=WPCqOskbw3mxvg7bShMbpxiFlS
	rub9WdrOXDfOavdk3YF6oDmsu8Ds8anbxe8OkFSjSLkd6LKG23ieo7c7gWJlh2zDWsjGO37E+wjnI
	5dZH0N2NphHJ5RrLX/b2/m3LiXvjna66fsLxmSTQSKKBX8cGOCHZx7LKAl62KHnPrDHF1Ut6uqLQS
	qfKycws9xDnfvOPOVyXTO9jFwtfkeRpeZ6mRrTWQxGZaODouYMo/oYL1GmWIrGuAzOA1IMq9s5T04
	HPuIN/ulXst61x8Eq7tJ1OWt5jY3/EH9El7jhnPxTbGZjqR0aXb6FpXWJy1SnETFaUzMdRA4P/5dV
	1ayNCMaA==;
Message-ID: <685c9b037b66dd250565f3022d53297c02a3cccd.camel@infradead.org>
Subject: Re: [EXTERNAL] [PATCH v3 2/5] xen: backends: don't overwrite
 XenStore nodes created by toolstack
From: David Woodhouse <dwmw2@infradead.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Paul Durrant
 <xadimgnik@gmail.com>, Oleksandr Tyshchenko
 <Oleksandr_Tyshchenko@epam.com>,  Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, "open list:Block 
 layer core" <qemu-block@nongnu.org>
Date: Tue, 28 Nov 2023 14:11:18 +0000
In-Reply-To: <87il5mvfkt.fsf@epam.com>
References: <20231124232400.943580-1-volodymyr_babchuk@epam.com>
	 <20231124232400.943580-3-volodymyr_babchuk@epam.com>
	 <51fd9b1f4407b92352c109cbef5acf16c91351d4.camel@infradead.org>
	 <87il5mvfkt.fsf@epam.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Vf+wu7c63S3rqDwH86wx"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-Vf+wu7c63S3rqDwH86wx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-11-28 at 01:20 +0000, Volodymyr Babchuk wrote:
> Hi David,
>=20
> Thank you for the review
>=20
> David Woodhouse <dwmw2@infradead.org> writes:
>=20
> > [[S/MIME Signed Part:Undecided]]
> > On Fri, 2023-11-24 at 23:24 +0000, Volodymyr Babchuk wrote:
> > > Xen PV devices in QEMU can be created in two ways: either by QEMU
> > > itself, if they were passed via command line, or by Xen toolstack. In
> > > the latter case, QEMU scans XenStore entries and configures devices
> > > accordingly.
> > >=20
> > > In the second case we don't want QEMU to write/delete front-end
> > > entries for two reasons: it might have no access to those entries if
> > > it is running in un-privileged domain and it is just incorrect to
> > > overwrite entries already provided by Xen toolstack, because
> > > toolstack
> > > manages those nodes. For example, it might read backend- or frontend-
> > > state to be sure that they are both disconnected and it is safe to
> > > destroy a domain.
> > >=20
> > > This patch checks presence of xendev->backend to check if Xen PV
> > > device was configured by Xen toolstack to decide if it should touch
> > > frontend entries in XenStore. Also, when we need to remove XenStore
> > > entries during device teardown only if they weren't created by Xen
> > > toolstack. If they were created by toolstack, then it is toolstack's
> > > job to do proper clean-up.
> > >=20
> > > Suggested-by: Paul Durrant <xadimgnik@gmail.com>
> > > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > > Co-Authored-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >=20
> > Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > ... albeit with a couple of suggestions...=20
> >=20
> > > diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> > > index bef8a3a621..b52ddddabf 100644
> > > --- a/hw/char/xen_console.c
> > > +++ b/hw/char/xen_console.c
> > > @@ -450,7 +450,7 @@ static void xen_console_realize(XenDevice *xendev=
, Error **errp)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 trace_xen_console_realize(con->dev, object_g=
et_typename(OBJECT(cs)));
> > >=20
> > > -=C2=A0=C2=A0=C2=A0 if (CHARDEV_IS_PTY(cs)) {
> > > +=C2=A0=C2=A0=C2=A0 if (CHARDEV_IS_PTY(cs) && !xendev->backend) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Strip the leading=
 'pty:' */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_device_frontend_=
printf(xendev, "tty", "%s", cs->filename + 4);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> >=20
> > It's kind of weird that that one is a frontend node at all; surely it
> > should have been a backend node?
>=20
> Yeah, AFAIK, console was the first PV driver, so it is a bit strange.
> As I see, this frontend entry is used by "xl console" tool to find PTY
> device to attach to. So yes, it should be in backend part of the
> xenstore. But I don't believe we can fix this right now.

Agreed.

> > But it is known only to QEMU once it
> > actually opens /dev/ptmx and creates a new pty. It can't be populated
> > by the toolstack in advance.
> >=20
> > So shouldn't the toolstack have made it writable by the driver domain?
>=20
> Maybe it can lead to a weird situation when user in Dom-0 tries to use
> "xl console" command to attach to a console that is absent in Dom-0,
> because "tty" entry points to PTY in the driver domain.

True, but that possibility exists the moment you have console provided
in a driver domain.

...

> > Perhaps here you should create the "mac" node if it doesn't exist (or
> > is that "if it doesn't match netdev->conf.macaddr"?) and just
> > gracefully accept failure too?
> >=20
>=20
> I am not sure that I got this right. conf.maccadr can be sent in two
> ways: via xen_net_device_create(), which will fail if toolstack didn't
> provided a MAC address, or via qemu_macaddr_default_if_unset(), which is
> the case for Xen emulation.

The latter happens with hotplug under Xen too, not just Xen emulation.

But the key point you make is that xen_net_device_create() will refuse
to drive a device which the toolstack created, if the "mac" node isn't
present. So creating it for ourselves based on 'if (!xendev->backend)'
as you did in your patch is reasonable enough. Thanks.


--=-Vf+wu7c63S3rqDwH86wx
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMTI4MTQxMTE4WjAvBgkqhkiG9w0BCQQxIgQgphxmPZCN
5DEzdK5wzOBqoHt37Do80zTyZXZZiCWmZOswgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCzKh26ZcWWqrIYQxL+3JK/SxMTcyKrsUjg
k4V4OY6+qKqwCbYB/C8y/ftVLWFtEh7IqECglAtigsm4TrOqNxJZtrxAvWnV3rJNSEUdpV1rRC+B
iRSQTaaYVv+IuEJibKjTmrtMPh2jK/O6bxThQAtYE9pZ1wlZL62o9zFw4zbb8hIxn88ngdLyRSLy
PtL2P7qzbizeegHbcfk7Es0xisIboTXblr/H9NZ12IW7nNzsczlfj0D0XOv7Xw8gRg2KqepSmeQ6
B6XwfSHt5lWl2XrgAlEyF1qZIq91vJAWXU7B4K0MyOTnWmsTwe25iJfEnmdzwHS9BnLxkPGDdCQN
RBj6mGE/wWrtvEwSWbFCjmDV7xum6kpjrt0tfrcn1zPiV1Gmtsi4FXQrXjjj2dGqWXmMWLUOHc+V
Ic/mD0hOw/gfuX23Ik42SGi4M754+PTzrdRpzPV7LRjtRyjGuIM5wRd0BRoE9f/s6BSjXHOPRt9G
emoQYOBx/sXwnv5exHoP42avM2vb3BqED6R/394HbnarH8+Me+KYkgkRcQ/qKJCcb0IGUslg+YvG
SR9kVb7akbDSsX89CibvVFo1OAYa710X/USZmTCltBy6cjO+oES6rVHhuFrPEDicscCPXgDaQ6k9
66zC1mp2iUXTuLtdnMVW2pEYaAqGI/7Yw7Z3vz4/IwAAAAAAAA==


--=-Vf+wu7c63S3rqDwH86wx--

