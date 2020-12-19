Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5B2DEDCE
	for <lists+xen-devel@lfdr.de>; Sat, 19 Dec 2020 09:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56809.99553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqXF4-000246-KU; Sat, 19 Dec 2020 08:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56809.99553; Sat, 19 Dec 2020 08:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqXF4-00023h-HW; Sat, 19 Dec 2020 08:05:30 +0000
Received: by outflank-mailman (input) for mailman id 56809;
 Sat, 19 Dec 2020 08:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/w4=FX=casper.srs.infradead.org=batv+5a3b6fea02aaeb467610+6327+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kqXF1-00023c-KX
 for xen-devel@lists.xenproject.org; Sat, 19 Dec 2020 08:05:28 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f58918a-2e00-4062-8302-c7503edecca4;
 Sat, 19 Dec 2020 08:05:23 +0000 (UTC)
Received: from dyn-227.woodhou.se ([90.155.92.227])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqXEg-0007Na-Qp; Sat, 19 Dec 2020 08:05:06 +0000
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
X-Inumbo-ID: 5f58918a-2e00-4062-8302-c7503edecca4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Mime-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U35lWhbX+MQaMgtOhHPhLopmPRezupUV1K70jjV6Mbk=; b=FHTFHEQD5irytrhe35uh+Rj1Hh
	sOd59ZytfNE3AV47/syXMj5AfHohH7lnXwcM2cEEO9IfRKdVDVlKs+j3h+2NnkFyETdcI+JkINHMQ
	A+neRlGSFLZr1mHgYhmrFhvec/o+p/rRl4sBQ+Fed50SRRgOzMLotoP4jLD68V8RPsFeUl9/MTE4F
	ji9DDwAoMVoVJ/gmI6iBtZrhLnykN/AWUBiJi+g7cbsXR0tPwPRktdqKpI9Y64ZMFgo5QsDXADxyb
	7xFH6/Hx7sQy11i4CQFH5bp3GF6Wl/EB7+YQqqmu7RBOmVVDmhBQJ0rXu8NIs0M1t57Euaiq2op8g
	VB2qcW2w==;
Message-ID: <a02cb64ba5680c0f2076da714d06b8704e3411c2.camel@infradead.org>
Subject: Re: [PATCH] xen: Fix event channel callback via INTX/GSI
From: David Woodhouse <dwmw2@infradead.org>
To: boris.ostrovsky@oracle.com, "x86@kernel.org" <x86@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,  Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com,
 karahmed@amazon.de, xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 19 Dec 2020 08:05:06 +0000
In-Reply-To: <6b6544ac-06b3-2525-aed9-39015715f71d@oracle.com>
References: <5ba658b2d8a2bce63622f5bb8ef8d5e6114276eb.camel@infradead.org>
	 <6b6544ac-06b3-2525-aed9-39015715f71d@oracle.com>
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-sTDwrdaNLhqUO8bcSRdy"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-sTDwrdaNLhqUO8bcSRdy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-12-18 at 17:20 -0500, boris.ostrovsky@oracle.com wrote:
> Are there other cases where this would be useful? If it's just to
> test a hypervisor under development I would think that people who are
> doing that kind of work are capable of building their own kernel. My
> concern is mostly about having yet another boot option that is of
> interest to very few people who can easily work around not having it.

For hypervisor testing we can just set the Xen major version number in
CPUID to 3, and that stops xs_reset_watches() from doing anything.

cf. https://lkml.org/lkml/2017/4/10/266

Karim ripped out all this INTX code in 2017 because it was broken, and
subsequently put it back because it *was* working for older versions of
Xen, due to that "coincidence". The conclusion back then was that if it
was put back it should at least *work* consistently, and he was going
to send a patch "shortly". This is a that patch :)

> > Add a 'no_vector_callback' command line argument to test it.
>
> This last one should be a separate patch I think.

Could do.

> > +		/*
> > +		 * It doesn't strictly *have* to run on CPU0 but it sure
> > +		 * as hell better process the event channel ports delivered
> > +		 * to CPU0.
> > +		 */
> > +		irq_set_affinity(pdev->irq, cpumask_of(0));
> > +
>=20
>=20
> Is the concern here that it won't be handled at all?

Indeed, the events don't get handled at all if the PCI interrupt lands
on a CPU other than zero. When the handler calls
xen_hvm_evtchn_do_upcall() that processes pending events for whichever
CPU it happens to be running on, and *not* the events pending for CPU0.
And the boot stops in xs_reset_watches() waiting (without a timeout)
for an interrupt that never gets processed, as before.

> And is this related to the issue this patch is addressing?

It is required to fix the event channel callback via INTX/GSI, yes.
Although it could reasonably be lifted out into a separate patch too.

> >  static int __init xenbus_probe_initcall(void)
> >  {
> > -	if (!xen_domain())
> > -		return -ENODEV;
> > -
> > -	if (xen_initial_domain() || xen_hvm_domain())
> > -		return 0;
> > +	/*
> > +	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
> > +	 * need to wait for the platform PCI device to come up, which is
> > +	 * the (XEN_PVPVM && !xen_have_vector_callback) case.
> > +	 */
> > +	if (xen_store_domain_type =3D=3D XS_PV ||
> > +	    (xen_store_domain_type =3D=3D XS_HVM &&
> > +	     (!IS_ENABLED(CONFIG_XEN_PVHVM) || xen_have_vector_callback)))
> > +		xenbus_probe();
> > =20
> > -	xenbus_probe(NULL);
> >  	return 0;
> >  }
> > -
> >  device_initcall(xenbus_probe_initcall);
> > =20
> > +int xen_set_callback_via(uint64_t via)
> > +{
> > +	struct xen_hvm_param a;
> > +	int ret;
> > +
> > +	a.domid =3D DOMID_SELF;
> > +	a.index =3D HVM_PARAM_CALLBACK_IRQ;
> > +	a.value =3D via;
> > +
> > +	ret =3D HYPERVISOR_hvm_op(HVMOP_set_param, &a);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * If xenbus_probe_initcall() deferred the xenbus_probe()
> > +	 * due to the callback not functioning yet, we can do it now.
> > +	 */
> > +	if (!xenstored_ready && xen_store_domain_type =3D=3D XS_HVM &&
> > +	    IS_ENABLED(CONFIG_XEN_PVHVM) && !xen_have_vector_callback)
>=20
>=20
> I'd create an is_callback_ready() (or something with a better name)
> helper.

I pondered that, and indeed dropping the XVM/vector conditions and
doing it literally based on whether xen_set_callback_via() had been
called at all (and not too early). But it looks like there are cases
where Arm doesn't call xen_set_callback_via() at all, and it made more
sense to me to live xen_set_callback_via() to sit right here and have
those two conditions within a page of each other in juxtaposition, with
suitable comments. I think that's probably easier to understand and
work with than a "helper".

>=20
> > +		xenbus_probe();
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(xen_set_callback_via);
> > +
> >  /* Set up event channel for xenstored which is run as a local process
> >   * (this is normally used only in dom0)
> >   */
> > @@ -817,11 +851,17 @@ static int __init xenbus_init(void)
> >  		break;
> >  	}
> > =20
> > -	/* Initialize the interface to xenstore. */
> > -	err =3D xs_init();
> > -	if (err) {
> > -		pr_warn("Error initializing xenstore comms: %i\n", err);
> > -		goto out_error;
> > +	/*
> > +	 * HVM domains may not have a functional callback yet. In that
> > +	 * case let xs_init() be called from xenbus_probe(), which will
> > +	 * get invoked at an appropriate time.
> > +	 */
> > +	if (xen_store_domain_type !=3D XS_HVM) {
>=20
>=20
> Can we delay xs_init() for !XS_HVM as well? In other words wait until
> after PCI platform device has been probed (on HVM) and then call
> xs_init() for everyone.

We're half-way there already, because xenbus_probe() *does* happen
later as a device_initcall, and I've just made it call xs_init().

We could make it avoid calling xs_init() from xenbus_init() in the
XS_HVM *and* XS_PV cases fairly easily, and let xenbus_probe() do it.

But right now xenbus_probe() doesn't run for the other cases, so
there'd have to be a mode where it *only* calls xs_init() and doesn't
do the notifier chain. That seems like more churn that was needed so I
didn't do it.


--=-sTDwrdaNLhqUO8bcSRdy
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAx
MjE5MDgwNTA2WjAvBgkqhkiG9w0BCQQxIgQgZPwaFuHvG+tUzrtB/ChHSF8kY4dQg33FYQDrLE0H
Glkwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAIVuSDcXGOvRQXB0vR1KGTfuC6Es2dfJfaFBgzOcWmcOO9E4DybGGTaQl0hgdmqG
MeooZHZT1ABh2jg+sRRcWFEnKY/DupLrSWpQtt0C+lYa4iBNHgsrI5lNV3cBO66nElG2YveQPxEn
kSCmikxtMV3vznU8P2gdxfEw3WSXgjd3XsMgDql5cSyCiJ3+CnuCD/TpE/ktKycUtfTKIVs9LY2i
H/98I2z+QqE0C/rN7ANVqREZtHdYWBBHyZxj8Nsth4rcgRjPrx9i90o7GUyAr6/xKihWhF/MQ/hw
XTguAeUiIihApEt+WcMuC3wuBJ6ZSCc3EygYPc4t94bRPaBnd0MAAAAAAAA=


--=-sTDwrdaNLhqUO8bcSRdy--


