Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B255B1890D0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 22:55:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEK8D-0003Sl-SY; Tue, 17 Mar 2020 21:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9B5f=5C=bombadil.srs.infradead.org=batv+61104f8394afc62ff192+6050+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1jEK8B-0003SE-Vg
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 21:52:12 +0000
X-Inumbo-ID: 8c66507e-6899-11ea-92cf-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c66507e-6899-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 21:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hNbUk6gzLoqK8lTX5sdLhOVevXIk/NZbz4f3JrWr2QA=; b=PS2Gkg4MvZtr9sA8KS2q9DNX7e
 C3rFUBBu6wpR/xTTYzzFYpwdDAlGQhXnxXIIYwxA/Tbta2lPZS7c1foUqGBq6qNm/zDo5a+mOnyTy
 vxPMay+cE7HD+5F2SnfC4AEVwxq5tb6P/a74au3aKVgIPjeOvaubl8od3BsJNhDQQokGvwfg5uOjp
 M9EkdVSGneCW/zery83/ub+NxxcYPjGhoFa7xKf5rJGd71PY8VOrGrJ/NquOGeJAY8E72mjDwTAvk
 WsOzuH77fDUfbCW8MMQEg2u0MMVEu94+Ot4iJX/SFULGzilbW7GO1R/oNX+kceZARUqf+YCuRSdDf
 bcteEZeg==;
Received: from dyn-248.woodhou.se ([90.155.92.248])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEK83-0000gw-VL; Tue, 17 Mar 2020 21:52:04 +0000
Message-ID: <641040a4aebc62e1e0e3874f513e3a308ec3ace0.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Tue, 17 Mar 2020 21:52:00 +0000
In-Reply-To: <a531f518-f996-34a0-7218-a746ae210393@suse.com>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-1-dwmw2@infradead.org>
 <a531f518-f996-34a0-7218-a746ae210393@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state
 bits
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============5713692362739206093=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5713692362739206093==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-79rZ5Xq0J3JVm3irRaK6"


--=-79rZ5Xq0J3JVm3irRaK6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-02-20 at 12:10 +0100, Jan Beulich wrote:
> On 07.02.2020 16:57, David Woodhouse wrote:
> > @@ -1145,16 +1145,19 @@ static int reserve_offlined_page(struct
> > page_info *head)
> > =20
> >      for ( cur_head =3D head; cur_head < head + ( 1UL << head_order);
> > cur_head++ )
> >      {
> > -        if ( !page_state_is(cur_head, offlined) )
> > +        struct page_list_head *list;
> > +        if ( page_state_is(cur_head, offlined) )
> > +            list =3D &page_offlined_list;
> > +        else if (page_state_is(cur_head, broken) )
> > +            list =3D &page_broken_list;
> > +        else
> >              continue;
> > =20
> >          avail[node][zone]--;
> >          total_avail_pages--;
> >          ASSERT(total_avail_pages >=3D 0);
> > =20
> > -        page_list_add_tail(cur_head,
> > -                           test_bit(_PGC_broken, &cur_head->count_info=
) ?
> > -                           &page_broken_list : &page_offlined_list);
> > +        page_list_add_tail(cur_head, list);
>=20
> While I realize it's fewer comparisons this way, I still wonder
> whether for the reader's sake it wouldn't better be
> page_is_offlined() first and then page_is_broken() down here.

Nah, that would be worse. This way there are two cases which are
explicitly handled and the list to use for each of them is explicitly
set. The 'if (a||b) =E2=80=A6    some_function(a ? thing_for_a : thing_for_=
b)'
construct is much less comprehensible.



> > @@ -1699,14 +1714,14 @@ unsigned int online_page(mfn_t mfn,
> > uint32_t *status)
> >      do {
> >          ret =3D *status =3D 0;
> > =20
> > -        if ( y & PGC_broken )
> > +        if ( (y & PGC_state) =3D=3D PGC_state_broken ||
> > +             (y & PGC_state) =3D=3D PGC_state_broken_offlining )
> >          {
> >              ret =3D -EINVAL;
> >              *status =3D PG_ONLINE_FAILED |PG_ONLINE_BROKEN;
> >              break;
> >          }
> > -
> > -        if ( (y & PGC_state) =3D=3D PGC_state_offlined )
> > +        else if ( (y & PGC_state) =3D=3D PGC_state_offlined )
>=20
> I don't see a need for adding "else" here.

They are mutually exclusive cases. It makes things a whole lot clearer
to the reader to put the 'else' there, and sometimes helps a na=C3=AFve
compiler along the way too.


> > --- a/xen/include/asm-x86/mm.h
> > +++ b/xen/include/asm-x86/mm.h
> > @@ -67,18 +67,27 @@
> >   /* 3-bit PAT/PCD/PWT cache-attribute hint. */
> >  #define PGC_cacheattr_base PG_shift(6)
> >  #define PGC_cacheattr_mask PG_mask(7, 6)
> > - /* Page is broken? */
> > -#define _PGC_broken       PG_shift(7)
> > -#define PGC_broken        PG_mask(1, 7)
> > - /* Mutually-exclusive page states: { inuse, offlining, offlined,
> > free }. */
> > -#define PGC_state         PG_mask(3, 9)
> > -#define PGC_state_inuse   PG_mask(0, 9)
> > -#define PGC_state_offlining PG_mask(1, 9)
> > -#define PGC_state_offlined PG_mask(2, 9)
> > -#define PGC_state_free    PG_mask(3, 9)
> > -#define page_state_is(pg, st) (((pg)->count_info&PGC_state) =3D=3D
> > PGC_state_##st)
> > -
> > - /* Count of references to this frame. */
> > + /*
> > +  * Mutually-exclusive page states:
> > +  * { inuse, offlining, offlined, free, broken_offlining, broken }
> > +  */
> > +#define PGC_state                  PG_mask(7, 9)
> > +#define PGC_state_inuse            PG_mask(0, 9)
> > +#define PGC_state_offlining        PG_mask(1, 9)
> > +#define PGC_state_offlined         PG_mask(2, 9)
> > +#define PGC_state_free             PG_mask(3, 9)
> > +#define PGC_state_broken_offlining PG_mask(4, 9)
>=20
> TBH I'd prefer PGC_state_offlining_broken, as it's not the
> offlining which is broken, but a broken page is being
> offlined.

It is the page which is both broken and offlining.
Or indeed it is the page which is both offlining and broken.


> > +#define PGC_state_broken           PG_mask(5, 9)
> > +
> > +#define page_state_is(pg, st)      (((pg)->count_info&PGC_state)
> > =3D=3D PGC_state_##st)
>=20
> Blanks around & please.

That part I hadn't touched but sure, I'll add those while I'm touching
it. I'd already ignored Julien's request *not* to make whitespace
cleanups while I'm here, after all :)

> > +#define page_is_broken(pg)         (page_state_is((pg),
> > broken_offlining) ||  \
> > +                                    page_state_is((pg), broken))
> > +#define page_is_offlined(pg)       (page_state_is((pg), broken)
> > ||    \
> > +                                    page_state_is((pg), offlined))
>=20
> The inclusion of "broken" here would seem to deserve a (brief)
> comment, either here or next to PGC_state_broken's #define.

Done, in the version which will be sent shortly.

> > +#define page_is_offlining(pg)      (page_state_is((pg), broken_offlini=
ng) || \
> > +                                    page_state_is((pg), offlining))
>=20
> Overall I wonder whether the PGC_state_* ordering couldn't be
> adjusted such that at least some of these three won't need
> two comparisons (by masking off a bit before comparing).

The whole point in this exercise is that there isn't a whole bit for
these; they are each *two* states out of the possible 8.

> Also for all three - no need for extra parentheses around pg
> (or in general macro arguments which get handed on without
> being part of an expression).

Yeah, I'll remove some of those.




--=-79rZ5Xq0J3JVm3irRaK6
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
MzE3MjE1MjAxWjAvBgkqhkiG9w0BCQQxIgQgiQ3nBBc41JysNkaoq1aRozUX8hzuy65ViV5VPPi8
wz4wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAK43Vs5T69Pe1WSH3toKmQTlIbQEwJDuauVPmy8QZ+P+L4AFhtnur1IGHi5JYcgY
kSFU+51okVayruxgFykWrP4FQpgqyirStAi3WmfIIJjiXz6GNldWe4uReBX3xjuCUQrXaXRRvL+G
Ds1Ww1D8JY7sfMDEKqCJQo4Qsk2SfXXK3iF7SHVP7u/N7M8ZI5K7fPmIx+bSip4ziK4G0w+lIlsN
GXvgPUykqyARxuzzmkTYBmZoI3aJKdoJRJVwsE2T3TD0N8HEkN52jfgNMeeiPxKnvoQh9cijCQAB
8DbMnR2YTLH77zoDM0AE2+XWfHNjHeWOChVf9MPcICF/BpwI3D0AAAAAAAA=


--=-79rZ5Xq0J3JVm3irRaK6--



--===============5713692362739206093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5713692362739206093==--


