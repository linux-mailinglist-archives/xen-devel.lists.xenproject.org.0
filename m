Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4592855
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 17:28:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzjWn-000425-ED; Mon, 19 Aug 2019 15:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9RKc=WP=merlin.srs.infradead.org=batv+8bc00d32ecc795eaca9c+5839+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hzjWl-00041w-RM
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 15:25:00 +0000
X-Inumbo-ID: 79e018ae-c295-11e9-aee9-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79e018ae-c295-11e9-aee9-bc764e2007e4;
 Mon, 19 Aug 2019 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gm8KhzRvA8j2cgHtZt/sCh8qamp8+0CiwrikT4DS4G8=; b=xi992AVGKWsPlkG2G73LcBnGt
 XHuFpauXKAp5M1DdV467o1lvS6d4GdK4MatDMdCv14ssbuhUS9kMKPTcTOjSQ45s9PKBIIAnO76Ev
 aRiRsieBcoHJBNRTuQ1HwoiaHozhNUnDMu/L5L4w1o8M6yWdxHuaYgO9CzVrB8x2sNP4r3wWRBwTP
 fbfCDMiqpCRAxq26bdrN0+0XSRLv5xAuekfoSKenfWHPE+ovBFHvMWG1uyz6V9Ga95Xin9UHOMSXC
 sQ/dRrU/U+YXdhjHM58UudwqSA5d9t3lBZJT61pQxEon/uP4d3ky27ad2NPqQengPx5g1X2TzFIQN
 BOLDyTiJw==;
Received: from [2001:8b0:10b:1::eed] (helo=u3832b3a9db3152.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hzjWU-0000aS-1i; Mon, 19 Aug 2019 15:24:42 +0000
Message-ID: <1b8cc402336f738e840e30a78fe1ecc773c7850b.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 19 Aug 2019 17:24:40 +0200
In-Reply-To: <61537a65-90f7-bbc3-65b2-2bf7cf3069c3@suse.com>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <b14f575d4445e439e3d4fd7d385aab7f7f2bedd5.camel@infradead.org>
 <61537a65-90f7-bbc3-65b2-2bf7cf3069c3@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 3/6] x86/boot: Split bootsym() into four
 types of relocations
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============4069586762218440798=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4069586762218440798==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-xw9OGEtkdGVSZCV5Nptg"


--=-xw9OGEtkdGVSZCV5Nptg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for delayed response; I was away last week and was frowned at
every time I so much as looked towards the laptop.


On Mon, 2019-08-12 at 11:41 +0200, Jan Beulich wrote:
> On 09.08.2019 17:01, David Woodhouse wrote:
> > --- a/xen/arch/x86/boot/trampoline.S
> > +++ b/xen/arch/x86/boot/trampoline.S
> > @@ -16,21 +16,62 @@
> >    * not guaranteed to persist.
> >    */
> >  =20
> > -/* NB. bootsym() is only usable in real mode, or via BOOT_PSEUDORM_DS.=
 */
> > +/*
> > + * There are four sets of relocations:
> > + *
> > + * bootsym():     Boot-time code relocated to low memory and run only =
once.
> > + *                Only usable at boot, in real mode or via BOOT_PSEUDO=
RM_DS.
>=20
> I'm not a native speaker, so my viewing this as ambiguous may be wrong,
> but to me it reads as "Only usable at boot or in real mode or via
> BOOT_PSEUDORM_DS" when aiui it ought to be "Only usable at boot AND (in
> real mode OR via BOOT_PSEUDORM_DS)". In which case how about "Only usable
> at boot from real mode or via BOOT_PSEUDORM_DS"?

Yes, I suppose I see that ambiguity. But ultimately I file it under the
category of "don't hack boot code while drunk".

I agree that to the reader of English (native or otherwise), that
sentence may have either meaning.=20

But this isn't documentation; it's code comments in an assembler file.
Anyone who is actually going to make a meaningful contribution to the
boot code, might reasonably be expected to understand that "real mode
or using the pseudo-realmode segment selector" are grouped together,
and that they must use one or the other of those. At boot time.

This is not an attempt at a two-line tutorial on all the pitfalls of
touching the boot code/data; via bootsym() or otherwise. It's just a
pointer in the right direction.

But sure, I'll have a look at fixing it =E2=80=94 if I don't feel that what=
 I
come up with is too clumsy.

> > + * bootdatasym(): Boot-time BIOS-discovered data, relocated back up to=
 Xen
> > + *                image after discovery.
> > + * trampsym():    Trampoline code relocated into low memory for AP sta=
rtup
> > + *                and wakeup.
> > + * tramp32sym():  32-bit trampoline code which at boot can be used dir=
ectly
> > + *                from the Xen image in memory, but which will need to=
 be
> > + *                relocated into low (well, into *mapped*) memory in o=
rder
> > + *                to be used for AP startup.
> > + */
> >  #undef bootsym
> >  #define bootsym(s) ((s)-trampoline_start)
> >  =20
> >  #define bootsym_rel(sym, off, opnd...)     \
> >          bootsym(sym),##opnd;               \
> >  111:;                                      \
> > -        .pushsection .trampoline_rel, "a"; \
> > +        .pushsection .bootsym_rel, "a";    \
> >          .long 111b - (off) - .;            \
> >          .popsection
> >  =20
> >  #define bootsym_segrel(sym, off)           \
> >          $0,$bootsym(sym);                  \
> >  111:;                                      \
> > -        .pushsection .trampoline_seg, "a"; \
> > +        .pushsection .bootsym_seg, "a";    \
> > +        .long 111b - (off) - .;            \
> > +        .popsection
> > +
> > +#define bootdatasym(s) ((s)-trampoline_start)
> > +#define bootdatasym_rel(sym, off, opnd...) \
> > +        bootdatasym(sym),##opnd;           \
> > +111:;                                      \
> > +        .pushsection .bootdatasym_rel, "a";\
> > +        .long 111b - (off) - .;            \
> > +        .popsection
> > +
> > +#undef trampsym
> > +#define trampsym(s) ((s)-trampoline_start)
> > +
> > +#define trampsym_rel(sym, off, opnd...)    \
> > +        trampsym(sym),##opnd;              \
> > +111:;                                      \
> > +        .pushsection .trampsym_rel, "a";   \
> > +        .long 111b - (off) - .;            \
> > +        .popsection
> > +
> > +#undef tramp32sym
> > +#define tramp32sym(s) ((s)-trampoline_start)
> > +
> > +#define tramp32sym_rel(sym, off, opnd...)  \
> > +        tramp32sym(sym),##opnd;            \
> > +111:;                                      \
> > +        .pushsection .tramp32sym_rel, "a"; \
> >          .long 111b - (off) - .;            \
> >          .popsection
>=20
> This repeats the basically same sequence of things several times.
> I've not peeked ahead yet to see in how far more differences would
> appear later on, but I don't really expect much of a further
> change. In which case it might be nice to reduce the redundancy
> here (by introducing a single "base" macro from which the four
> similar ones would be derived).

They end up being more different than this. It was my judgement that
attempting to create a more generic building block from which they
could all be derived would end up being less readable than just a
little bit of partial duplication. If you feel strongly otherwise, I
would welcome a follow-on patch to attempt to remedy that, if you
choose to send one.

> Furthermore, with the intended isolation, wouldn't it be better to
> limit visibility of the individual macros, such that using the
> wrong one will be easier noticeable? This would be helped by there
> being such a single "base" macro, as permitted to use macros could
> then be, if needed, defined and undefined perhaps even multiple
> times (for the time being at least).

I think I'd class that under 'don't hack boot code while drunk" too,
which is apparently the existing approach taken by this most of code
(except on the occasions when people have clearly done precisely that
=E2=98=BA).

The other .S files are *included* from head.S; some indirectly via
trampoline.S. Various macros are defined just once in head.S rather
than being in a header file or with mixed visibility. There is a
potential cleanup to be done there, but it is not one of the cleanups I
had elected to make because I see it as being of limited utility except
cosmetic. Again, if you feel strongly then I would welcome a follow-on
patch or series to move everything out and build each .S file as a
separate compilation unit.




--=-xw9OGEtkdGVSZCV5Nptg
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
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkw
ODE5MTUyNDQwWjAvBgkqhkiG9w0BCQQxIgQg+igDZM2gdnW95SVYKSvgPpvRZMZV4mAw+x+ltykN
dK0wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAJagJ2TwGUk60lv1Jf2nkyvhQ3voLwqDwuskmxlLUH0mOc4/ui9367ZsX9zg/gHJ
vDpkU8+kbOPfKEwntiDwLDXwauURJsenrHzdDfqwB8ydgvxPr7uzrOWj6TPYUsbeLhTqLWe2K7Hk
OjgsT2Yxij7ESn+G+h3RGWrnv5p0wzjv18/OF4picofc2GtiRoymsjRR57tkR+VWYTv8MAQz0vnC
67sSkWzeX0nnAlsjAfrffY0zYE0ECQB5BurnH2XoaF2j9WGYifKAld/t4RDqidlH5TlxyHSlzxJw
d/7Eyo+02JflEehheOsfZgmEISSmeeJf3/Srko9qKeYn/p+5fVAAAAAAAAA=


--=-xw9OGEtkdGVSZCV5Nptg--



--===============4069586762218440798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4069586762218440798==--


