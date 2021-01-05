Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D842EAE3C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:29:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62046.109594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoHD-0007Lp-MU; Tue, 05 Jan 2021 15:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62046.109594; Tue, 05 Jan 2021 15:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwoHD-0007LP-JB; Tue, 05 Jan 2021 15:29:39 +0000
Received: by outflank-mailman (input) for mailman id 62046;
 Tue, 05 Jan 2021 15:29:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBUl=GI=merlin.srs.infradead.org=batv+0bced0ab9dcc91656173+6344+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kwoHA-0007LH-MI
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:29:37 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60f5fb97-dcdd-4e69-a29a-c32f839b5480;
 Tue, 05 Jan 2021 15:29:32 +0000 (UTC)
Received: from [54.239.6.185] (helo=edge-cache-257.e-hkg50.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwoGy-0002CG-DF; Tue, 05 Jan 2021 15:29:24 +0000
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
X-Inumbo-ID: 60f5fb97-dcdd-4e69-a29a-c32f839b5480
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Mime-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KByX3bg/y2/+mP1yzJSCUEnrmiWPS+TKmPFICIKSnt4=; b=xicAsQwvbILnRcvqF3oszFU/C/
	raCdV4uD3ma5bMAUwRn7cl1g3gt84seuCNYSQjN3ANcFZ18KgTGJAZYkqEjpPRE88hjho3aAf0I8M
	G4kHCau9N5Gniud8rxRyjNjIJSeSHvxsiLTkgbwJcdcZL76tmML7mT1WpKZYW1b/DwnLCEsD+raV8
	+WXZZZiMo2bXKgNE/24tpWiE6cbmPfjd0MJOu1qnQwc5C3HmbJgHxIWcg6taKTeyx1F00Zga53Cwa
	kA/tSCHyP5KjpROlFOi3wFhmDIo1zr/gksm7C0/LIXG9gBWWa3rZvIouE5azvnm4uTgxURDdy41p2
	N/H4f7yA==;
Message-ID: <90cea679da691d97bbd7a9015ba82d0634848299.camel@infradead.org>
Subject: Re: [PATCH 5/5] x86/xen: Don't register PV spinlock IPI when it
 isn't going to be used
From: David Woodhouse <dwmw2@infradead.org>
To: boris.ostrovsky@oracle.com, x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,  Paul Durrant <pdurrant@amazon.com>, jgrall@amazon.com,
 karahmed@amazon.de, xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 05 Jan 2021 15:29:21 +0000
In-Reply-To: <312dff57-f7da-7c9e-0e1f-2bbb28d3c3a5@oracle.com>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
	 <20201224115323.3540130-6-dwmw2@infradead.org>
	 <b6681a06-4c00-61a9-2112-63ee3eb8d86d@oracle.com>
	 <eb7378cdbbdbff2548d510c453ede8baa917647f.camel@infradead.org>
	 <f681dfe6-d0fb-e451-a58f-ad5cafa1cd62@oracle.com>
	 <706a569a1321deafb3ae7a4e8d569fb6f2291f50.camel@infradead.org>
	 <ea05c086-3b0c-0deb-c4c6-08a25beecb38@oracle.com>
	 <6a032d2ff0d52ee19b2a88ac6813e25c6efc3733.camel@infradead.org>
	 <3c27abbb-2f1d-2641-51c6-2f6bdbcf559b@oracle.com>
	 <8a61ecbf527f1402ea19f0d1910f0af651b11229.camel@infradead.org>
	 <1cf261fd-0062-8bc5-c3de-53b281accb82@oracle.com>
	 <575e71c6f0bb672770390d45a0218d3064ce4860.camel@infradead.org>
	 <312dff57-f7da-7c9e-0e1f-2bbb28d3c3a5@oracle.com>
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-XbowXVXofV87ITg15/2u"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html


--=-XbowXVXofV87ITg15/2u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-01-05 at 09:45 -0500, boris.ostrovsky@oracle.com wrote:
> For maintenance purposes. When something gets added in initialization
> path (prepare_boot_cpu() and such) we likely want to tear it down in
> cpu_die(). Today both native and Xen cpu_die() ops work the same but
> things change. And chances are people will not test
> no_vector_callback case so we will then have to hunt down what broke
> when.
>=20
>=20
> no_vector_callback is a pretty esoteric case already so making it
> take different code path from common case, when there is little or no
> penalty for doing the latter, seems undesirable to me.


That makes sense.

I'll also not even bother to look at those three teardown functions and
work out if it's harmless to call them unconditionally. If the point is
to remind those who come after us, then it's actually far more
effective to have an explicit 'if (xen_have_vector_callback)'.

Looks like this. I suppose I should actually try booting it under real
Xen instead of just KVM-pretending-to-be-Xen, and then I'll repost the
series (which is the top five commits of =20
https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/xen-pci=
-irq )

From: David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH] x86/xen: Fix xen_hvm_smp_init() when vector callback not a=
vailable

Only the IPI-related functions in the smp_ops should be conditional
on the vector callback being available. The rest should still happen:

 =E2=80=A2 xen_hvm_smp_prepare_boot_cpu()

   This function does two things, both of which should still happen if
   there is no vector callback support.

   The call to xen_vcpu_setup() for vCPU0 should still happen as it just
   sets up the vcpu_info for CPU0. That does happen for the secondary
   vCPUs too, from xen_cpu_up_prepare_hvm().

   The second thing it does is call xen_init_spinlocks(), which perhaps
   counter-intuitively should *also* still be happening in the case
   without vector callbacks, so that it can clear its local xen_pvspin
   flag and disable the virt_spin_lock_key accordingly.

   Checking xen_have_vector_callback in xen_init_spinlocks() itself
   would affect PV guests, so set the global nopvspin flag in
   xen_hvm_smp_init() instead, when vector callbacks aren't available.

 =E2=80=A2 xen_hvm_smp_prepare_cpus()

   This does some IPI-related setup by calling xen_smp_intr_init() and
   xen_init_lock_cpu(), which can be made conditional. And it sets the
   xen_vcpu_id to XEN_VCPU_ID_INVALID for all possible CPUS, which does
   need to happen.

 =E2=80=A2 xen_smp_cpus_done()

   This offlines any vCPUs which doesn't fit in the global shared_info
   page, if separate vcpu_info placement isn't available. That part also
   needs to happen regardless of vector callback support.

 =E2=80=A2 xen_hvm_cpu_die()

   This doesn't actually do anything other than commin_cpu_die() right
   right now in the !vector_callback case; all three teardown functions
   it calls should be no-ops. But to guard against future regressions
   it's useful to call it anyway, and for it to explicitly check for
   xen_have_vector_callback before calling those additional functions.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/xen/smp_hvm.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index f5e7db4f82ab..056430a1080b 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -33,9 +33,11 @@ static void __init xen_hvm_smp_prepare_cpus(unsigned int=
 max_cpus)
 	int cpu;
=20
 	native_smp_prepare_cpus(max_cpus);
-	WARN_ON(xen_smp_intr_init(0));
=20
-	xen_init_lock_cpu(0);
+	if (xen_have_vector_callback) {
+		WARN_ON(xen_smp_intr_init(0));
+		xen_init_lock_cpu(0);
+	}
=20
 	for_each_possible_cpu(cpu) {
 		if (cpu =3D=3D 0)
@@ -50,9 +52,11 @@ static void __init xen_hvm_smp_prepare_cpus(unsigned int=
 max_cpus)
 static void xen_hvm_cpu_die(unsigned int cpu)
 {
 	if (common_cpu_die(cpu) =3D=3D 0) {
-		xen_smp_intr_free(cpu);
-		xen_uninit_lock_cpu(cpu);
-		xen_teardown_timer(cpu);
+		if (xen_have_vector_callback) {
+			xen_smp_intr_free(cpu);
+			xen_uninit_lock_cpu(cpu);
+			xen_teardown_timer(cpu);
+		}
 	}
 }
 #else
@@ -64,14 +68,17 @@ static void xen_hvm_cpu_die(unsigned int cpu)
=20
 void __init xen_hvm_smp_init(void)
 {
-	if (!xen_have_vector_callback)
+	smp_ops.smp_prepare_boot_cpu =3D xen_hvm_smp_prepare_boot_cpu;
+	smp_ops.smp_prepare_cpus =3D xen_hvm_smp_prepare_cpus;
+	smp_ops.smp_cpus_done =3D xen_smp_cpus_done;
+	smp_ops.cpu_die =3D xen_hvm_cpu_die;
+
+	if (!xen_have_vector_callback) {
+		nopvspin =3D true;
 		return;
+	}
=20
-	smp_ops.smp_prepare_cpus =3D xen_hvm_smp_prepare_cpus;
 	smp_ops.smp_send_reschedule =3D xen_smp_send_reschedule;
-	smp_ops.cpu_die =3D xen_hvm_cpu_die;
 	smp_ops.send_call_func_ipi =3D xen_smp_send_call_function_ipi;
 	smp_ops.send_call_func_single_ipi =3D xen_smp_send_call_function_single_i=
pi;
-	smp_ops.smp_prepare_boot_cpu =3D xen_hvm_smp_prepare_boot_cpu;
-	smp_ops.smp_cpus_done =3D xen_smp_cpus_done;
 }
--=20
2.29.2


--=-XbowXVXofV87ITg15/2u
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
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEw
MTA1MTUyOTIxWjAvBgkqhkiG9w0BCQQxIgQgM0FIUBzLOpObmx85uW6+VoS6brIIgzMMm4we5bvI
YZUwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAJcSDkrdAHzbMGL+4qh9tQBD5sxQ4faunCZ22iWxjaYW3P8NesWIIaI8sTeQbuvV
t2v1Ne44e9Eibe9sYRKh8G7K7hsCh1L0L6MJiASd8aRsMvchHYMWKNcY93dAwNtHP4Idf3vr+Zb5
j+de2Qm1TFxAmqOp2ftEDJqbj3RmfjjP01tLDGtAO0ski78I+RDdQjT+DgP1utKICQ5Nnq9SIRhP
KLA/tXXV2SZmPFnlMCdSHBjMA1U1Oj106sZWnb05zutPv/sU8IluSgMZ6OmG6DkAs4KcwTf/p6Zt
a+5d/v8wGUeAvYrfrI20TkCxdnLLWJ4UbhtFVaouQBhgshl5KDQAAAAAAAA=


--=-XbowXVXofV87ITg15/2u--


