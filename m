Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B4A12A14
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 18:44:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872961.1283959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7RQ-00030S-Jn; Wed, 15 Jan 2025 17:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872961.1283959; Wed, 15 Jan 2025 17:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY7RQ-0002yq-Gl; Wed, 15 Jan 2025 17:44:32 +0000
Received: by outflank-mailman (input) for mailman id 872961;
 Wed, 15 Jan 2025 17:44:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWPo=UH=casper.srs.infradead.org=BATV+fb641630334796bb9467+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY7RN-0002yd-VF
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 17:44:30 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c60c5c5-d368-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 18:44:25 +0100 (CET)
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=freeip.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY7RH-0000000Gz0R-3aqu; Wed, 15 Jan 2025 17:44:24 +0000
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
X-Inumbo-ID: 5c60c5c5-d368-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nr1w0HMnYTbUG16M788RJVriNHteT9a5YyCdF9NcA5Y=; b=QLBRekgutO+jUH4VQcQZGr5Za3
	WldofV5kM0xk55Lx/5AyTYBDx3vzV5waalhViy/5UapGwTl0l/eRECW/BXtCb+lX10JSnsV7hPTOk
	nXj/Tx/qNrkOt1I129a2T6DRzI9lqHBFYByXBUexYv3QVH0XjOpTy+3/mpYoJjs1DHRsdlkmrPZlU
	8CFMzSRwQnSFSAQPYrXwGYkv87qrpRzPSGWLyInoc7H2Gc93SWhXishyrnSB97XPiOsqxPRvl362M
	RMsvmX+8fBSd+vTV53pyrNu8kdGAbKigpvMxCpQNHNb99nlC+c8jeI5VgC8eaSb2RzNxSqwTP6YBQ
	Ol2eKVhA==;
Message-ID: <e3a0a04e867514d33e434804fd6a9c48936b9e72.camel@infradead.org>
Subject: Re: [PATCH v3 7/7] hw/xen: Fix errp handling in xen_console
From: David Woodhouse <dwmw2@infradead.org>
To: Anthony PERARD <anthony@xenproject.org>
Cc: qemu-devel@nongnu.org, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Date: Wed, 15 Jan 2025 18:44:22 +0100
In-Reply-To: <Z4fnIQ8YbTP_i0U9@l14>
References: <20250115163542.291424-1-dwmw2@infradead.org>
	 <20250115163542.291424-8-dwmw2@infradead.org> <Z4fnIQ8YbTP_i0U9@l14>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-6iKf1h7eQmpGaijurTmn"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-6iKf1h7eQmpGaijurTmn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-01-15 at 17:49 +0100, Anthony PERARD wrote:
>=20
> With those fixed: Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks. I've pushed those changes and am watching the pipeline at
https://gitlab.com/dwmw2/qemu/-/pipelines/1626804720

I'll probably send a pull request tomorrow. The patch now looks like
this:

=46rom 8b44a3e39f36540818d99ef8cf79e64bba1ed9c3 Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Date: Wed, 15 Jan 2025 15:46:06 +0000
Subject: [PATCH] hw/xen: Fix errp handling in xen_console

When attempting to read the 'output' node, interpret any error *other*
than ENOENT as a fatal error. For ENOENT, fall back to serial_hd() to
find a character device, or create a null device.

Do not attempt to prepend to errp when serial_hd() fails; the error
isn't relevant (and prior to this change, wasn't set anyway).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 hw/char/xen_console.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index e61902461b..d03c188d1d 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -569,7 +569,7 @@ static void xen_console_device_create(XenBackendInstanc=
e *backend,
=20
     snprintf(label, sizeof(label), "xencons%ld", number);
=20
-    output =3D xs_node_read(xsh, XBT_NULL, NULL, NULL, "%s/%s", fe, "outpu=
t");
+    output =3D xs_node_read(xsh, XBT_NULL, NULL, errp, "%s/%s", fe, "outpu=
t");
     if (output) {
         /*
          * FIXME: sure we want to support implicit
@@ -581,19 +581,27 @@ static void xen_console_device_create(XenBackendInsta=
nce *backend,
                        output);
             goto fail;
         }
-    } else if (number) {
-        cd =3D serial_hd(number);
-        if (!cd) {
-            error_prepend(errp, "console: No serial device #%ld found: ",
-                          number);
-            goto fail;
-        }
+    } else if (errno !=3D ENOENT) {
+        error_prepend(errp, "console: No valid chardev found: ");
+        goto fail;
     } else {
-        /* No 'output' node on primary console: use null. */
-        cd =3D qemu_chr_new(label, "null", NULL);
-        if (!cd) {
-            error_setg(errp, "console: failed to create null device");
-            goto fail;
+        error_free(*errp);
+        *errp =3D NULL;
+
+        if (number) {
+            cd =3D serial_hd(number);
+            if (!cd) {
+                error_setg(errp, "console: No serial device #%ld found",
+                           number);
+                goto fail;
+            }
+        } else {
+            /* No 'output' node on primary console: use null. */
+            cd =3D qemu_chr_new(label, "null", NULL);
+            if (!cd) {
+                error_setg(errp, "console: failed to create null device");
+                goto fail;
+            }
         }
     }
=20
--=20
2.47.0



--=-6iKf1h7eQmpGaijurTmn
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDExNTE3NDQy
MlowLwYJKoZIhvcNAQkEMSIEIKALmnpjA0+bZOSSBCkUBKjkN8GBxsmKKwQsn9EyMN+8MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAxUsoY6KSALQC
sU1yu5jkGVAheCAMC6FDFjoOPGGR1VkC2T+/ENKuolZhM8XQrp/FoIzaBWfXsVU+bCnrsRmAvs/9
XEKis7Dhg3iuE8lMcxT+dh4HtID+lmGsIO2qwocZ3iqdRQ5jdUBBxWIyFXRFQ/S81LNaOGyQ1BzG
ZkMHaxcHWNLRx4CEcUt6dVFz4EnCRCJ9wSyw/x9GnydwyIjKOfTXpf8ELoFbpgj9zWA0CY1vHG8W
5OrveLIf2n9RvenASwqy6r9uXa+PpWN/cPkPy+jZeRy1SQnsXXcxxMXbl9I4jBt06SeqT/6myaIQ
s8GxfHstSfotncQUsgE2NmEgEaBCoHF1jnSL/IRluq7Umq7JNQy/odxcaxHvFk8J/7BgYQe+CNdV
3PDYDhx0xqr4EkaXRUC9VMjF8VZK3H7kuKMlxYCmCi3RV6GaL+nGBQWgLSCgnV4hUBYqWwqi/I9F
osnOuHaN+tQFyLGbgN1LYw/AdQHYYo/T1E5sr3PytcbXtHVR6PM9v4sTFsedcOifv5aDZBKPGr3h
FoGOY4koT8B+DO09tszQpljWokh+52516ihknC/BviuuJg//yi6e5NTRlcw+RPCgAz+U5pk6SEaQ
HYqIUB7f/5ruqmG7W6GplvSCXKrRhRvEcjOTfu86/OqOvh95M4HMqX6owKWcGRYAAAAAAAA=


--=-6iKf1h7eQmpGaijurTmn--

