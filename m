Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E1EA3BBE
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 18:14:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3jVf-0003G8-F8; Fri, 30 Aug 2019 16:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o4/1=W2=merlin.srs.infradead.org=batv+534f0a6dd087dad51536+5850+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1i3jVd-0003G2-Dj
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 16:12:21 +0000
X-Inumbo-ID: ec129402-cb40-11e9-951b-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec129402-cb40-11e9-951b-bc764e2007e4;
 Fri, 30 Aug 2019 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2NDUOIRjj/qHNes8UMxuYtjYKZgz1EAwRuBFlav9UVg=; b=0AJjXHaBdLcdryaXdug+Jcyg2
 7hF3ZMWDRxWaLZjmJsfRMkE+9QBrBcAFEv4D7U222Yo5ccpD3nGImp5msBbM2BHqTxCB5AOkJhcP2
 cs8fUqxds6WkWlNADORDiV3g/GRl5NEwrqpysfKaOSdP9YrWTbNtbOeQbp2p7sGc5bYFDylWQRTEG
 44xbZbW74ckww+Slpax2I0j4Blovk02FpTQ0jor7p3kw3Huq+a63pCgB3uhRnXoWEaKwZJWZFltQ6
 aGCNXJOX/C/EpfLd7zjekVeQ6uEq62N4jjzrIQzUcsLR+y5hADJfYV26nt5e8qs4ppT3FiEHA/H3z
 TzCdV7WmA==;
Received: from [2001:8b0:10b:1:4a2a:e3ff:fe14:8625]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i3jVR-0005sR-A5; Fri, 30 Aug 2019 16:12:09 +0000
Message-ID: <56629d19da2cf1b1fd4a02e34354f0ca865f3a00.camel@infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Fri, 30 Aug 2019 17:12:07 +0100
In-Reply-To: <251a1598-f5b7-5c13-fbb8-34d9757570e9@suse.com>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
 <20190821163542.172063-1-dwmw2@infradead.org>
 <20190821163542.172063-2-dwmw2@infradead.org>
 <251a1598-f5b7-5c13-fbb8-34d9757570e9@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/boot: Split bootsym() into four
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============8224412795949353782=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8224412795949353782==
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-LLK+3R4xERxyqmEiCvIE"


--=-LLK+3R4xERxyqmEiCvIE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-30 at 17:10 +0200, Jan Beulich wrote:
> On 21.08.2019 18:35, David Woodhouse wrote:
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -699,14 +699,30 @@ trampoline_setup:
> >          cmp     $sym_offs(__trampoline_rel_stop),%edi
> >          jb      1b
> > =20
> > -        /* Patch in the trampoline segment. */
> > +        mov     $sym_offs(__trampoline32_rel_start),%edi
> > +1:
> > +        mov     %fs:(%edi),%eax
> > +        add     %edx,%fs:(%edi,%eax)
> > +        add     $4,%edi
> > +        cmp     $sym_offs(__trampoline32_rel_stop),%edi
> > +        jb      1b
> > +
> > +        mov     $sym_offs(__bootsym_rel_start),%edi
> > +1:
> > +        mov     %fs:(%edi),%eax
> > +        add     %edx,%fs:(%edi,%eax)
> > +        add     $4,%edi
> > +        cmp     $sym_offs(__bootsym_rel_stop),%edi
> > +        jb      1b
>=20
> With the smaller sets now - are we risking misbehavior if one
> of the relocation sets ends up empty? This wasn't reasonable to
> expect before, but I think it would be nice to have a build-time
> check rather than a hard to debug crash in case this happens.

Or just code it differently as a while() instead of a do{}while() so
that it actually copes with a zero-length section.=20

> > --- a/xen/arch/x86/boot/trampoline.S
> > +++ b/xen/arch/x86/boot/trampoline.S
> > @@ -16,21 +16,62 @@
> >   * not guaranteed to persist.
> >   */
> > =20
> > -/* NB. bootsym() is only usable in real mode, or via BOOT_PSEUDORM_DS.=
 */
> > +/*
> > + * There are four sets of relocations:
> > + *
> > + * bootsym():     Boot-time code relocated to low memory and run only =
once.
> > + *                Only usable at boot; in real mode or via BOOT_PSEUDO=
RM_DS.
> > + * bootdatasym(): Boot-time BIOS-discovered data, relocated back up to=
 Xen
> > + *                image after discovery.
> > + * trampsym():    Permanent trampoline code relocated into low memory =
for AP
> > + *                startup and wakeup.
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
> > =20
> >  #define bootsym_rel(sym, off, opnd...)     \
> >          bootsym(sym),##opnd;               \
> >  111:;                                      \
> > -        .pushsection .trampoline_rel, "a"; \
> > +        .pushsection .bootsym_rel, "a";    \
> >          .long 111b - (off) - .;            \
> >          .popsection
> > =20
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
>=20
> Why this and ...
>=20
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
>=20
> ... this #undef? You have none ahead of the bootdatasym #define-s,
> and (other than for bootsym) there's not conflicting C level one
> afaics.
>=20
> > +#define tramp32sym(s) ((s)-trampoline_start)
> > +
> > +#define tramp32sym_rel(sym, off, opnd...)  \
> > +        tramp32sym(sym),##opnd;            \
> > +111:;                                      \
> > +        .pushsection .tramp32sym_rel, "a"; \
> >          .long 111b - (off) - .;            \
> >          .popsection
>=20
> After your reply to my comment regarding the redundancy here I've
> checked (in your git branch) how things end up. Am I mistaken, or
> are the trampsym and tramp32sym #define-s entirely identical
> (except for the relocations section name)? Even between the others
> there's little enough difference, so it continues to be unclear to
> me why you think it's better to have four instances of about the
> same (not entirely trivial) thing.

The distinction is that in a no-real-mode boot tramp32 is used in place
in the Xen image at the physical address it happened to be loaded at,
and then *again* later in the AP/wakeup path. In the latter case it
needs to be moved to low memory (or we need to put the physical
location into idle_pg_table which seemed to be harder, as discussed).

So tramp32 symbols get relocated *twice*, while the plain tramp symbols
don't, but actually we could probably ditch the distinction and treat
them all the same, which would reduce the four categories to three.

I'll take a look.

I suppose we could also combine bootsym and bootdatasym, and copy that
*whole* section back up to the Xen image; both code and data. But I'm
inclined to prefer keeping them separate and only copying the data back
up.

> > @@ -48,16 +89,19 @@
> >  GLOBAL(trampoline_realmode_entry)
> >          mov     %cs,%ax
> >          mov     %ax,%ds
> > -        movb    $0xA5,bootsym(trampoline_cpu_started)
> > +        movb    $0xA5,trampsym(trampoline_cpu_started)
> >          cld
> >          cli
> > -        lidt    bootsym(idt_48)
> > -        lgdt    bootsym(gdt_48)
> > +        lidt    trampsym(idt_48)
> > +        lgdt    trampsym(gdt_48)
> >          mov     $1,%bl                    # EBX !=3D 0 indicates we ar=
e an AP
> >          xor     %ax, %ax
> >          inc     %ax
> >          lmsw    %ax                       # CR0.PE =3D 1 (enter protec=
ted mode)
> > -        ljmpl   $BOOT_CS32,$bootsym_rel(trampoline_protmode_entry,6)
> > +        ljmpl   $BOOT_CS32,$tramp32sym_rel(trampoline_protmode_entry,6=
)
> > +
> > +GLOBAL(trampoline_cpu_started)
> > +        .byte   0
>=20
> The movement of this item here seems unrelated to this change; it's
> also not mentioned in the description.

Andy's already moved that elsewhere anyway; I'll undo that as I rebase.

> > @@ -115,10 +115,10 @@ static void __init relocate_trampoline(unsigned l=
ong phys)
> >            trampoline_ptr < __trampoline_rel_stop;
> >            ++trampoline_ptr )
> >          *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
> > -    for ( trampoline_ptr =3D __trampoline_seg_start;
> > -          trampoline_ptr < __trampoline_seg_stop;
> > +    for ( trampoline_ptr =3D __trampoline32_rel_start;
> > +          trampoline_ptr < __trampoline32_rel_stop;
> >            ++trampoline_ptr )
> > -        *(u16 *)(*trampoline_ptr + (long)trampoline_ptr) =3D phys >> 4=
;
> > +        *(u32 *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
> >  }
>=20
> Seeing this and adding in the comment about the redundant tramp*sym
> macros I wonder why the relocations can't be put together in a single
> section, and there be just a single loop here. (I realize this
> entire function gets deleted from here later on, but anyway.)

Yeah, I think it's worth the harmless double-relocation in the non-EFI
case to treat everything (well tramp vs. tramp32) the same there. I'll
do that.

Thanks.

--=-LLK+3R4xERxyqmEiCvIE
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
ODMwMTYxMjA3WjAvBgkqhkiG9w0BCQQxIgQgYSZZfHkoYx2tk2CnpPnOvsPDuTOvbQEbOXiH1Vno
3Fwwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAA9jBa9z0SFO72uKG9HFOsAyjMoL7H5loEiu5w5cyUECBQnXpGiNjMSeRtbMkjCn
qObco0FBpzdwdEfomuzoa3xlIq+ejb+fcQWTpYfHYNFEqOthKz+V6S2oM3cTWIo9nVd4Utgif6JM
CHuGnzirCiEn9f4OE6bXzQmTAPXl3YgfClwFm5XuLJbTTy1h/eLWNhSn8jKR3Xb812KxVKvbFT3I
g02xyDgjG2WhwgPIdgHTvkBqaqCgD3xPY4ANyu8mg683I11inxwT2CVxWyRpQCsqE8AFKgCcjbZv
LIxZGERjbzal9KBCJU6ceQxbLPaktjgm4bRNgua9vjdibIdAWYIAAAAAAAA=


--=-LLK+3R4xERxyqmEiCvIE--



--===============8224412795949353782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8224412795949353782==--


