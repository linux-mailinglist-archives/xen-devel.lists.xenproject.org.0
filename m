Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBACF241B8D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 15:26:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5UHS-0007Ha-Ls; Tue, 11 Aug 2020 13:25:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xK0=BV=merlin.srs.infradead.org=batv+15f5bd3e8430479a8e90+6197+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1k5UHO-0007HP-N2
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 13:25:29 +0000
X-Inumbo-ID: 0ceee8d8-5dd2-4bd8-9276-265d330ad40d
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ceee8d8-5dd2-4bd8-9276-265d330ad40d;
 Tue, 11 Aug 2020 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tXNYIywZjMnT73Cw5SMCL+2q6kZzBjr4+zG62GiEUmA=; b=Hn3+xOu7xdY+fpCU/Gdvrp1bk6
 PidiPUB5ahmz1xd3X1ROv5LxDkr8sA4yTzWHwASy69vHN5ABwNelMsASkuMystGoqfhsKn33GYYdY
 +hly+cxiK4nCcVdMJDWc4+zDpjHNx4t6zPGN3IL/j2IcNlQc+fMaB9Iq2HUJOhBSyY4KDDfkvx1G6
 Nkly1ZA1AWc3ein6jQTxJhmv9w6ytwNTQ+6Nmqp6rfxF5wyn9+igddYrG44HES9R5AAzwzexwylJE
 +TGSde/wSPs5GBeTMSwxaS1tJ+dO6Md1QEQttDkfcmsHgxD9V9hsqJPM6EKOvJkjbeqHE5qmRK2bu
 EHKVJjjA==;
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=u3832b3a9db3152.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5UHG-0000yd-Tx; Tue, 11 Aug 2020 13:25:19 +0000
Message-ID: <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
From: David Woodhouse <dwmw2@infradead.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, 
 Roger Pau Monne <roger.pau@citrix.com>
Date: Tue, 11 Aug 2020 14:25:16 +0100
In-Reply-To: <1535153880.24926.28.camel@infradead.org>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/x-pkcs7-signature";
 boundary="=-dgjdl+CAat6uZSRISdi7"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Eslam Elnikety <elnikety@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Shan Haitao <haitao.shan@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-dgjdl+CAat6uZSRISdi7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending this straw man patch at Roger's request, to restart discussion.

Redux: In order to cope with the relatively rare case of unmaskable
legacy MSIs, each vlapic EOI takes a domain-global spinlock just to
iterate over all IRQs and determine that there's actually nothing to
do.

In my testing, I observe that this drops Windows performance on passed-
through NVMe from 2.2M IOPS down to about 1.0M IOPS.

I have a variant of this patch which just has a single per-domain "I
attached legacy unmaskable MSIs" flag, which is never cleared. The
patch below is per-vector (but Roger points out it should be per-vCPU
per-vector). I don't know that we really care enough to do more than
the single per-domain flag, which in real life would never happen
anyway unless you have crappy hardware, at which point you get back to
today's status quo.

My main concern is that this code is fairly sparsely documented and I'm
only 99% sure that this code path really *is* only for unmaskable MSIs,
and doesn't have some other esoteric use. A second opinion on that
would be particularly welcome.


(NB: APIC assist was a red herring here, except that it had a bug which
stopped the gratuitous EOI work from ever happening at all =E2=80=94 which
nobody ever cared about since it doesn't matter on sane hardware, but
then when Paul *fixed* it, we saw it as a performance regression.)


On Sat, 2018-08-25 at 00:38 +0100, David Woodhouse wrote:
> On Thu, 2018-01-18 at 10:10 -0500, Paul Durrant wrote:
> > Lastly the previous code did not properly emulate an EOI if a missed EO=
I
> > was discovered in vlapic_has_pending_irq(); it merely cleared the bit i=
n
> > the ISR. The new code instead calls vlapic_EOI_set().
>=20
> Hm, this *halves* my observed performance running a 32-thread
> 'diskspd.exe' on a Windows box with attached NVME devices, which makes
> me sad.
>=20
> It's the call to hvm_dpci_msi_eoi() that does it.
>=20
> Commenting out the call to pt_pirq_iterate() and leaving *just* the
> domain-global spinlock bouncing cache lines between all my CPUs, it's
> already down to 1.6MIOPS/s from 2.2M on my test box before it does
> *anything* at all.
>=20
> Calling an *inline* version of pt_pirq_iterate so no retpoline for the
> indirect calls, and I'm down to 1.1M even when I've nopped out the
> whole of the _hvm_dpci_msi_eoi function that it's calling. Put it all
> back, and I'm down to about 1.0M. So it's worse than halved.
>=20
> And what's all this for? The code here is making my eyes bleed but I
> believe it's for unmaskable MSIs, and these aren't unmaskable.
>=20
> Tempted to make it all go away by having a per-domain bitmap of vectors
> for which all this work is actually required, and bypassing the whole
> bloody lot in hvm_dpci_msi_eoi() if the corresponding in bit that
> bitmap isn't set.
>=20
> The hackish version of that (which seems to work, but would probably
> want testing with an actual unmaskable MSI in the system, and I have
> absolutely no confidence I understand what's going on here) looks
> something like this:
>=20
> diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
> index bab3aa3..24df008 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -24,6 +24,7 @@
>  #include <asm/hvm/irq.h>
>  #include <asm/hvm/support.h>
>  #include <asm/io_apic.h>
> +#include <asm/msi.h>
> =20
>  static DEFINE_PER_CPU(struct list_head, dpci_list);
> =20
> @@ -282,6 +283,7 @@ int pt_irq_create_bind(
>      struct hvm_pirq_dpci *pirq_dpci;
>      struct pirq *info;
>      int rc, pirq =3D pt_irq_bind->machine_irq;
> +    irq_desc_t *desc;
> =20
>      if ( pirq < 0 || pirq >=3D d->nr_pirqs )
>          return -EINVAL;
> @@ -422,6 +425,13 @@ int pt_irq_create_bind(
> =20
>          dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
>          pirq_dpci->gmsi.dest_vcpu_id =3D dest_vcpu_id;
> +        BUG_ON(!local_irq_is_enabled());
> +        desc =3D pirq_spin_lock_irq_desc(info, NULL);
> +        if ( desc && desc->msi_desc && !msi_maskable_irq(desc-
> >msi_desc) )
> +            set_bit(pirq_dpci->gmsi.gvec,
> +                    hvm_domain_irq(d)->unmaskable_msi_vecs);
> +        spin_unlock_irq(&desc->lock);
> +
>          spin_unlock(&d->event_lock);
> =20
>          pirq_dpci->gmsi.posted =3D false;
> @@ -869,7 +874,8 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
> =20
>  void hvm_dpci_msi_eoi(struct domain *d, int vector)
>  {
> -    if ( !iommu_enabled || !hvm_domain_irq(d)->dpci )
> +    if ( !iommu_enabled || !hvm_domain_irq(d)->dpci ||
> +         !test_bit(vector, hvm_domain_irq(d)->unmaskable_msi_vecs) )
>         return;
> =20
>      spin_lock(&d->event_lock);
> diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-
> x86/hvm/irq.h
> index 8a43cb9..d9d4652 100644
> --- a/xen/include/asm-x86/hvm/irq.h
> +++ b/xen/include/asm-x86/hvm/irq.h
> @@ -78,6 +78,7 @@ struct hvm_irq {
>      u8 round_robin_prev_vcpu;
> =20
>      struct hvm_irq_dpci *dpci;
> +    DECLARE_BITMAP(unmaskable_msi_vecs, 256);
> =20
>      /*
>       * Number of wires asserting each GSI.
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel


--=-dgjdl+CAat6uZSRISdi7
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
ODExMTMyNTE2WjAvBgkqhkiG9w0BCQQxIgQgBx8g8QjxtqTECMtsO2Tz/QfYwy+1L/tiNHjL21ce
YBYwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAAGxvGHpK4PBq2aL6p4wBX4i3rTLCtkil1TECG9u8vpzJZybbHtVNSu+kXyhquyX
nTE/uVjbIglg2VnZ5+WT6LKCYaZuHO1aXSMFvfr1s7AYP+3MoLSbzYkN4QzgzS3ePpMLFZ5IMsz0
J7GFuia11a/iHEe5M+/jpSs7s6J9vvYmawVripIoBNiVk45IDXo+sejIMNviiFriLQ7I5FtJVelN
p10Gqu5c7OLYFaJnZAoBEkkLU+5UkqPcrMELjwTOQOImCZbIXi3rVjQ1nsOPFr6YRUUVpRVT5K2D
VUqRxRzAK52m8ZZYjsWj13D2EUkOzEa2WSrRVCRF09XAZeGIM54AAAAAAAA=


--=-dgjdl+CAat6uZSRISdi7--


