Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46D189138
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 23:18:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEKUu-0005GU-1O; Tue, 17 Mar 2020 22:15:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9B5f=5C=bombadil.srs.infradead.org=batv+61104f8394afc62ff192+6050+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1jEKUt-0005GP-1H
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 22:15:39 +0000
X-Inumbo-ID: d474fda4-689c-11ea-bec1-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d474fda4-689c-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aatesXnIdeVzjzYe4PxjWRRXF9OUcI+ZgKYABNpMwII=; b=mLk4E5YMQNCfk1MBvWdAhflZB7
 Jqyjois8BnKZZabyJ+tq3ZrUpoPNhG746WjnJycZM3XOm0ddSI0mywPgU6oq0bIcpmrTJkYq8aHCk
 Lm3yBYvVIjd+xPl/qqbmfddkIETepW0uTx0fkpTRckm73YryLC3J/NitobPRt0v8ukB4aeSw9WwwB
 WNHQY0DJyepA1qUYa4Ir5jitS8DiyTeReN/dCqO7RrExE6aFm8R7ygWkhvTv68AVPPleCk2lzbkKY
 0PBNW7c5IWrMDe8i64AY8+nd7FK7ZP4LANLJBAH7mWIwmho93uFGCc/aRffgC/fyAYSjYqd0I+r38
 pBiThnXg==;
Received: from dyn-248.woodhou.se ([90.155.92.248])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEKUW-000142-P4; Tue, 17 Mar 2020 22:15:17 +0000
Message-ID: <f320e035b9e77a565be61d7ad13c3947c1d00cb8.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Tue, 17 Mar 2020 22:15:13 +0000
In-Reply-To: <af374a90-f060-7239-5a02-c98df409819c@suse.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
 <af374a90-f060-7239-5a02-c98df409819c@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5861525740486675754=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5861525740486675754==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-73LR1sUt+Bfb/TvTmdXw"


--=-73LR1sUt+Bfb/TvTmdXw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-20 at 12:59 +0100, Jan Beulich wrote:
> On 07.02.2020 19:04, David Woodhouse wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -488,7 +488,8 @@ void share_xen_page_with_guest(struct page_info *pa=
ge, struct domain *d,
> > =20
> >      page_set_owner(page, d);
> >      smp_wmb(); /* install valid domain ptr before updating refcnt. */
> > -    ASSERT((page->count_info & ~PGC_xen_heap) =3D=3D 0);
> > +    ASSERT((page->count_info & ~PGC_xen_heap) =3D=3D PGC_state_inuse |=
|
> > +           (page->count_info & ~PGC_xen_heap) =3D=3D PGC_state_uniniti=
alised);
>=20
> Can uninitialized pages really make it here?

Yep, we share the low 1MiB with dom_io.

> > @@ -1389,6 +1391,16 @@ static void free_heap_pages(
> >      ASSERT(order <=3D MAX_ORDER);
> >      ASSERT(node >=3D 0);
> > =20
> > +    if ( page_state_is(pg, uninitialised) )
> > +    {
> > +        init_heap_pages(pg, 1 << order, need_scrub);
> > +        /*
> > +         * init_heap_pages() will call back into free_heap_pages() for
> > +         * each page but cannot keep recursing because each page will
> > +         * be set to PGC_state_inuse first.
> > +         */
> > +        return;
> > +    }
> >      spin_lock(&heap_lock);
>=20
> Can you also add a blank line above here please?

Done.

> > @@ -1780,11 +1792,10 @@ int query_page_offline(mfn_t mfn, uint32_t *sta=
tus)
> >   * latter is not on a MAX_ORDER boundary, then we reserve the page by
> >   * not freeing it to the buddy allocator.
> >   */
> > -static void init_heap_pages(
> > -    struct page_info *pg, unsigned long nr_pages)
> > +static void init_heap_pages(struct page_info *pg, unsigned long nr_pag=
es,
> > +                            bool scrub)
>=20
> Is this new parameter strictly needed, i.e. can free_heap_pages()
> be called with uninitialized pages which need scrubbing? (The
> code change is simple enough, and hence may warrant keeping, but
> then the commit message could indicate so in case this isn't a
> strict requirement.)

Yes, I think it's feasible for the initramfs pages, which is assigned
to dom0 from uninitialised pages, to later get freed and then they'll
want scrubbing?

There *is* a path into free_heap_pages() with the need_scrub argument
set, and I'd have to *prove* that it can never happen in order to... I
don't know... put a BUG() in that case instead of supporting it? Didn't
seem like that was the thing I wanted to do.

> > @@ -2301,10 +2316,11 @@ int assign_pages(
> >      for ( i =3D 0; i < (1 << order); i++ )
> >      {
> >          ASSERT(page_get_owner(&pg[i]) =3D=3D NULL);
> > -        ASSERT(!pg[i].count_info);
> > +        ASSERT(pg[i].count_info =3D=3D PGC_state_inuse ||
> > +               pg[i].count_info =3D=3D PGC_state_uninitialised);
>=20
> Same question here: Can uninitialized pages make it here? If
> so, wouldn't it be better to correct this, rather than having
> the more permissive assertion?

Yep, Dom0 initrd on x86.


        ASSERT((pg[i].count_info & ~PGC_extra) =3D=3D PGC_state_inuse ||
               (pg[i].count_info & ~PGC_extra) =3D=3D PGC_state_uninitialis=
ed);
> >          page_set_owner(&pg[i], d);
> >          smp_wmb(); /* Domain pointer must be visible before updating r=
efcnt. */
> > -        pg[i].count_info =3D PGC_allocated | 1;
> > +        pg[i].count_info |=3D PGC_allocated | 1;
>=20
> This is too relaxed for my taste: I understand you want to
> retain page state, but I suppose other bits would want clearing
> nevertheless.

You seem to have dropped the ASSERT immediately before the code snippet
you cited, in which arbitrary other contents of count_info are not
permitted. I put it back, in its current form after I rebase on top of
Paul's commit c793d13944b45d assing PGC_extra.

> > --- a/xen/include/asm-x86/mm.h
> > +++ b/xen/include/asm-x86/mm.h
> > @@ -72,12 +72,13 @@
> >    * { inuse, offlining, offlined, free, broken_offlining, broken }
> >    */
> >  #define PGC_state                  PG_mask(7, 9)
> > -#define PGC_state_inuse            PG_mask(0, 9)
> > +#define PGC_state_uninitialised    PG_mask(0, 9)
> >  #define PGC_state_offlining        PG_mask(1, 9)
> >  #define PGC_state_offlined         PG_mask(2, 9)
> >  #define PGC_state_free             PG_mask(3, 9)
> >  #define PGC_state_broken_offlining PG_mask(4, 9)
> >  #define PGC_state_broken           PG_mask(5, 9)
> > +#define PGC_state_inuse            PG_mask(6, 9)
>=20
> Would imo be nice if this most common state was actually
> either 1 or 7, for easy recognition. But the most suitable
> value to pick may also depend on the outcome of one of the
> comments on patch 1.

Not quite sure why 1 and 7 are easier to recognise than other values.
The important one is that uninitialised has to be zero, since that's
the default (because that's what the frame table is memset to. Which is
changeable, but non-trivially so).

--=-73LR1sUt+Bfb/TvTmdXw
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
MzE3MjIxNTEzWjAvBgkqhkiG9w0BCQQxIgQgRoJEpv8fFVfKBdGa9uVeHadVd/5uWg/Aud15XZvn
+x8wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBADA+zAFge/oJkAU4yHRIz8yu3/SaIDgh22+ueiUUdjA/fTKfr8mBOpb1ahmTRVlJ
Xvh6je0O+3tiVvxIpXUyEFcFAjI73hMtQVgNFiAXc9X5xV81BFft+ILVoJD9VSHNHmGviLGdNhFX
1bZ6pnejf8GXuxBRilN1lQuR8HdiVtHSYsHBe5BcwfgNU9nYV9JFzQVA7VXEqgBnfxV9L7QAylHa
v6Ko3sEzzy19vtD514fASh9SxbU5rZCJZuQdV7PqcrwBAbnlXDP3VmGzJ6iLBBdSyFkBeih95OVD
Ws+ZkZjXmiguPm+2If9XavdXd77hQGlFjl00vb0y5SLhzxcsqJEAAAAAAAA=


--=-73LR1sUt+Bfb/TvTmdXw--



--===============5861525740486675754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5861525740486675754==--


