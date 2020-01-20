Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00F01430C8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 18:27:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itamt-0003ta-Rj; Mon, 20 Jan 2020 17:24:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3m52=3J=bombadil.srs.infradead.org=batv+4aa1c4e8fa1fad644544+5993+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1itams-0003t3-Kl
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 17:24:30 +0000
X-Inumbo-ID: b025e460-3ba9-11ea-b833-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b025e460-3ba9-11ea-b833-bc764e2007e4;
 Mon, 20 Jan 2020 17:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HTwdpRp7dX3vjU+Ql21QjyvmFSpxGzrFK8kZEF3MNII=; b=U8ki5hGLX2sOZTtZqEBJF2d/G
 9SbUPO26CTXRPyy2DoMRoVB6LbEWljD6WkCVAEdGerJ5F+jxTS84E0U+PU8lBvTQGWHhBNm/OyjX2
 vAC2h+UBYZ70iwAu0HVuL+fzh+VJuIM6e6zHJdgZveiTCQet68fKKl+maU1ll7hhGLbRJHy+zhpZ4
 JyLlpYU7WAu0mytSxR42WC5MoB9o0zgL4DiJn6lxupp81QSYIMwku2PASGHm0ei4ftRcfOfzQOl0C
 0f+I+OGPaaD7ZDI9x3kP2HZzo+COl8QsNY8J3IvaulHGVXLT8jIQG75LOmzIjtd1gAUFtPp589Vrk
 z//gLYmgg==;
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=iad7-dhcp-95-156-83.iad7.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itame-0006sA-7f; Mon, 20 Jan 2020 17:24:16 +0000
Message-ID: <fc22d2db47d1ceffd4f0fbedba210d2c703fec7d.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 20 Jan 2020 17:24:12 +0000
In-Reply-To: <2ba7ecbc-a079-2dda-beed-d2bde4c9d646@suse.com>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <20200108172500.1419665-1-dwmw2@infradead.org>
 <20200108172500.1419665-2-dwmw2@infradead.org>
 <2ba7ecbc-a079-2dda-beed-d2bde4c9d646@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [RFC PATCH 2/3] x86/boot: Reserve live update boot
 memory
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4734237258064091116=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4734237258064091116==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-sQ52BjiIOlYIZOZrRTOi"


--=-sQ52BjiIOlYIZOZrRTOi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-01-20 at 17:58 +0100, Jan Beulich wrote:
> On 08.01.2020 18:24, David Woodhouse wrote:
> > @@ -980,6 +1015,22 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
> >      set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
> >      kexec_reserve_area(&boot_e820);
> > =20
> > +    if ( lu_bootmem_start )
> > +    {
> > +        /* XX: Check it's in usable memory first */
> > +        reserve_e820_ram(&boot_e820, lu_bootmem_start, lu_bootmem_star=
t + lu_bootmem_size);
> > +
> > +        /* Since it will already be out of the e820 map by the time th=
e first
> > +         * loop over physical memory, map it manually already. */
> > +        set_pdx_range(lu_bootmem_start >> PAGE_SHIFT,
> > +                      (lu_bootmem_start + lu_bootmem_size) >> PAGE_SHI=
FT);
> > +        map_pages_to_xen((unsigned long)__va(lu_bootmem_start),
> > +                         maddr_to_mfn(lu_bootmem_start),
> > +                         PFN_DOWN(lu_bootmem_size), PAGE_HYPERVISOR);
>=20
> Doesn't this require the range to be a multiple of 2Mb and below
> 4Gb? I don't see this enforced anywhere.

Aha, so *that's* why the mapping succeeded without having to allocate
any memory for PTEs. That did confuse me for a while, before I figured
my time was better spent in the short term by focusing on things I
don't understand that *weren't* working, rather than things I didn't
understand that *were*. :)

Yes, if this is the solution we end up with (and I do think it's still
the best option I've seen), then the requirement should be clearly
documented and enforced.

Andy and Hongyan are busy messing with all the 1:1 mappings, both at
boot time and at run time, so the actual restrictions may change.

> > @@ -1278,8 +1348,8 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
> >          xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
> > =20
> >      /*
> > -     * Walk every RAM region and map it in its entirety (on x86/64, at=
 least)
> > -     * and notify it to the boot allocator.
> > +     * Walk every RAM region and map it in its entirety and (unless in
> > +     * live update mode) notify it to the boot allocator.
> >       */
> >      for ( i =3D 0; i < boot_e820.nr_map; i++ )
> >      {
> > @@ -1329,6 +1399,7 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
> >                  printk(XENLOG_WARNING "Ignoring inaccessible memory ra=
nge"
> >                                        " %013"PRIx64"-%013"PRIx64"\n",
> >                         s, e);
> > +                reserve_e820_ram(&boot_e820, s, e);
> >                  continue;
> >              }
> >              map_e =3D e;
> > @@ -1336,6 +1407,7 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
> >              printk(XENLOG_WARNING "Ignoring inaccessible memory range"
> >                                    " %013"PRIx64"-%013"PRIx64"\n",
> >                     e, map_e);
> > +            reserve_e820_ram(&boot_e820, e, map_e);
> >          }
> > =20
> >          set_pdx_range(s >> PAGE_SHIFT, e >> PAGE_SHIFT);
>=20
> What are these two hunks needed for? The comment you change further up
> relates to ...

When we use only the LU-reserved region for bootmem, we defer the
registration of the other regions found in E820 to a later pass, after
we've consumed the live update state (and know which pages not to
touch).

So instead of just ignoring those inaccessible regions in the first
loop as we did before, we need to *mark* them reserved in our E820 data
so that they don't get registered by that second pass.

> > @@ -1346,7 +1418,9 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
> >                        ARRAY_SIZE(l2_identmap) << L2_PAGETABLE_SHIFT);
> > =20
> >          /* Pass mapped memory to allocator /before/ creating new mappi=
ngs. */
> > -        init_boot_pages(s, min(map_s, e));
> > +        if ( !lu_reserved)
> > +            init_boot_pages(s, min(map_s, e));
>=20
> ... this afaict.

Kind of, but more to the point applicable to where we later *do*
register those pages, around line 1600.

> Apart from this, also applicable to patch 3 - where I have no other
> comments - there's quite a bit of style cleanup to b done here. And
> of course the new command line option wants documenting. I can't
> e.g. guess yet what lu_data is about, and hence why this is
> apparently an address without an accompanying size.

Right. The lu_data is intended to be the 'breadcrumb' which leads to
the actual live update state, which is scatter/gather across any pages
*outside* the reserved bootmem region.

Although it's hard to put it on the command line, since that has to be
handled by *userspace*, while the live update state is created *during*
the kexec hypercall by Xen itself. We've settled for now on putting
that breadcrumb into the start of the reserved bootmem region itself,
removing the need for a separate lu_data argument.

The series continues at
https://xenbits.xen.org/gitweb/?p=3Dpeople/dwmw2/xen.git;a=3Dshortlog;h=3Dr=
efs/heads/lu-master
and has reached the point where I can write "Hello World" to a live
update data stream and then frown grumpily at the next Xen telling me

(XEN) 1 pages of live update data at 23e24d000
(XEN) First live update data page at MFN 23ea34:
(XEN)  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

... because the first data page got zeroed during the transition.

I'll fix that, implement the code which actually excludes busy pages
from being registered in the heap (and fix up the fact that bad pages
above HYPERVISOR_VIRT_END are also not being dropped as they should,
while I'm at it), and post a second set for comment.

I'm mostly after feedback on the direction (of which the comment about
how the first mapping succeeds was massively useful; thanks!) than the
finer details of the implementation at this point. It's just that code
is sometimes a better explanation of what I mean, than prose.


--=-sQ52BjiIOlYIZOZrRTOi
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
MTIwMTcyNDEyWjAvBgkqhkiG9w0BCQQxIgQgkL4zddDENj2l2IHQ/OS8dH6edM82NFAljT2XtysX
tT0wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAK/BoNDfRk6B4jbWDlACOA7H3iIW4lC8uXVapU54PAPNfIS7q1u3tN9WDNOCte8N
te/+PrO/sjFyLtko3GXlVx7X4Kr+iho9PCnJh40BlXFgQry03iaTUEoGxqLykFwLvcSU+EM9IL3n
YCWZdYlOeFksnR2Z3gPIfJPCUeod/TbxF9jL92eSYTlU60aAgROXWTjQP0w5NyeLhAvMf6ux8zDC
GBD8OfRE3Eb2IUK0wacBLAImKIyOoYy9z7707GVIlZ7PGr3p4iccNeEd7NtWaAXm4T4o3/TRynUa
yDBBaCoZD91aILHBJJ9g4I7jmm6Zkvt5MEr55bnq3OChVUIvkPEAAAAAAAA=


--=-sQ52BjiIOlYIZOZrRTOi--



--===============4734237258064091116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4734237258064091116==--


