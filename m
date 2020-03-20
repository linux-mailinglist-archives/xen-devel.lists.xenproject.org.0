Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C7018D2AE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 16:20:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJOo-0005CW-7r; Fri, 20 Mar 2020 15:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wyMw=5F=merlin.srs.infradead.org=batv+064a609472cd1da14fbd+6053+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1jFJOm-0005CR-Cv
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 15:17:24 +0000
X-Inumbo-ID: e40f4382-6abd-11ea-bec1-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e40f4382-6abd-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 15:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SoFDaGPDTARfmm21CrUrbmY042t4/gMSqd7Smh8ED7g=; b=OJaT1wE1vU4dgh0OXy6Oijdlhb
 6JRfwnevgokONOmnnaSfTyvLaBadAzcCECl0BF1A+uOiB5xD6JEINIB9n8gdU/7gTSuj8Jb89UPko
 kQYFGzp+lQ5pipHXIe/PIeo20f3PB9g//6LTUwQ/+xVQ7rLoLP2M2JOglS6IWK5kQ4Ys0Wmp54RO4
 jj6Jgmaxo9MCugqXF6qPczsTdxLptsmb1T3a05g3CBmXvKcCFmQRwdd6MkPkR1WLKofhif/AB8w12
 q0BguD3D7ZtUELINqG+cUFzouKSIkJMu224S1cjxY0GdKRl15TRIEEhwMYePDB7AnWDppK+qvuQ+P
 0STcM9Sw==;
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=edge-m1-r1-107.e-iad16.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFJOd-00043x-Ol; Fri, 20 Mar 2020 15:17:16 +0000
Message-ID: <45c147a12565cb1b0ca34217a8d66289a91ec35c.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, xen-devel@lists.xenproject.org
Date: Fri, 20 Mar 2020 15:17:12 +0000
In-Reply-To: <004701d5febc$3632bfe0$a2983fa0$@xen.org>
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
 <20200319212150.2651419-2-dwmw2@infradead.org>
 <004701d5febc$3632bfe0$a2983fa0$@xen.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce
 PGC_state_uninitialised
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, hongyxia@amazon.com,
 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Roger Pau =?ISO-8859-1?Q?Monn=E9=27?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6777815110167488269=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6777815110167488269==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-dQVycDoOSkADGuuNoXi+"


--=-dQVycDoOSkADGuuNoXi+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-03-20 at 13:33 +0000, Paul Durrant wrote:
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of D=
avid Woodhouse
> > Sent: 19 March 2020 21:22
> > To: xen-devel@lists.xenproject.org
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@x=
en.org>; Wei Liu <wl@xen.org>;
> > Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <ian.jackson@eu.=
citrix.com>; George Dunlap
> > <george.dunlap@citrix.com>; hongyxia@amazon.com; Jan Beulich <jbeulich@=
suse.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m>
> > Subject: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PGC_state_uninitiali=
sed
> >=20
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > It is possible for pages to enter general circulation without ever
> > being process by init_heap_pages().
> >=20
> > For example, pages of the multiboot module containing the initramfs may
> > be assigned via assign_pages() to dom0 as it is created. And some code
> > including map_pages_to_xen() has checks on 'system_state' to determine
> > whether to use the boot or the heap allocator, but it seems impossible
> > to prove that pages allocated by the boot allocator are not subsequentl=
y
> > freed with free_heap_pages().
> >=20
> > This actually works fine in the majority of cases; there are only a few
> > esoteric corner cases which init_heap_pages() handles before handing th=
e
> > page range off to free_heap_pages():
> >  =E2=80=A2 Excluding MFN #0 to avoid inappropriate cross-zone merging.
> >  =E2=80=A2 Ensuring that the node information structures exist, when th=
e first
> >    page(s) of a given node are handled.
> >  =E2=80=A2 High order allocations crossing from one node to another.
> >=20
> > To handle this case, shift PG_state_inuse from its current value of
> > zero, to another value. Use zero, which is the initial state of the
> > entire frame table, as PG_state_uninitialised.
> >=20
> > Fix a couple of assertions which were assuming that PG_state_inuse is
> > zero, and make them cope with the PG_state_uninitialised case too where
> > appopriate.
> >=20
> > Finally, make free_heap_pages() call through to init_heap_pages() when
> > given a page range which has not been initialised. This cannot keep
> > recursing because init_heap_pages() will set each page state to
> > PGC_state_inuse before passing it back to free_heap_pages() for the
> > second time.
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >  xen/arch/x86/mm.c        |  3 ++-
> >  xen/common/page_alloc.c  | 44 +++++++++++++++++++++++++++++-----------
> >  xen/include/asm-arm/mm.h |  3 ++-
> >  xen/include/asm-x86/mm.h |  3 ++-
> >  4 files changed, 38 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 62507ca651..5f0581c072 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -491,7 +491,8 @@ void share_xen_page_with_guest(struct page_info *pa=
ge, struct domain *d,
> >=20
> >      page_set_owner(page, d);
> >      smp_wmb(); /* install valid domain ptr before updating refcnt. */
> > -    ASSERT((page->count_info & ~PGC_xen_heap) =3D=3D 0);
> > +    ASSERT((page->count_info & ~PGC_xen_heap) =3D=3D PGC_state_inuse |=
|
> > +           (page->count_info & ~PGC_xen_heap) =3D=3D PGC_state_uniniti=
alised);
>=20
> Could the page state perhaps be bumped to inuse in this case? It
> seems odd to leave state uninitialized yet succeed in sharing with a
> guest.

No, that doesn't really work.

You can't just *declare* that the page was properly initialised,
because it isn't true. There's a pathological case where the zone
hasn't been initialised at all, because *all* the pages in that zone
got handed out by the boot allocator or used for initrd etc.=20

The first pages 'freed' in that zone end up being used (in
init_heap_pages) to create the zone structures.

Likewise, it could include a page which init_heap_pages() doesn't
actually *put* into the buddy allocator, to work around the cross-zone
merge problem. It's fine to use that page and share it with a guest,
but it can't ever be freed into the buddy allocator.

> > @@ -1828,7 +1840,8 @@ static void init_heap_pages(
> >              nr_pages -=3D n;
> >          }
> >=20
> > -        free_heap_pages(pg + i, 0, scrub_debug || idle_scrub);
>=20
> Would it be worth an ASSERT(!pg[i].count_info) here in case something
> is added which erroneously modifies the page count info before this
> is done?

That seems valid, I think. Will test it.

> >=20
> >          page_set_owner(&pg[i], d);
> >          smp_wmb(); /* Domain pointer must be visible before updating r=
efcnt. */
> > -        pg[i].count_info =3D
> > -            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
> > +        pg[i].count_info =3D (pg[i].count_info & PGC_state) | PGC_allo=
cated | 1;
>=20
> The PGC_extra seems to have vapourized here.

Oops. Will fix; thanks.


--=-dQVycDoOSkADGuuNoXi+
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
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAw
MzIwMTUxNzEyWjAvBgkqhkiG9w0BCQQxIgQgRBN965smBmHaOe2q4kiWnGoTJupzFkcEcMODCoWl
deAwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAC6OMCzKUhCk3C3Ie+X87tX2aIKMQgMwk7tOF/JvVxVgmJBJfgGgAcU7zm8LjTxq
OKoTWmaI4DiPv7ikJAUGgz+oKLcgsWpEsZDtahB1JHJxOEjLEoDHj9bX7F3saKzyyZfq7sSweD3q
5GgHgQflVHY9llh1sHuYF4UC4HzrzLBoP7LtuMSjIO8O7wE7TCZYAnaztxM2dZ66v6rF4kUk2abR
U1JqnyY2dau7ea2vbJrOmDW/a8+NzxNtFc6THeFH/MZoOxkwqh9amfx5rtF9FQ7aot+brPOmVvt9
hqvjNQP2+vBeTqQuZyXggG/6qPepj03MuLzgO0GyNM+WpQz5zMIAAAAAAAA=


--=-dQVycDoOSkADGuuNoXi+--



--===============6777815110167488269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6777815110167488269==--


