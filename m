Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD532A12821
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 17:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872737.1283730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY5t8-0007El-OS; Wed, 15 Jan 2025 16:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872737.1283730; Wed, 15 Jan 2025 16:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY5t8-0007CM-LQ; Wed, 15 Jan 2025 16:05:02 +0000
Received: by outflank-mailman (input) for mailman id 872737;
 Wed, 15 Jan 2025 16:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWPo=UH=casper.srs.infradead.org=BATV+fb641630334796bb9467+7815+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tY5t6-0007CG-Ai
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 16:05:01 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7675f05c-d35a-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 17:04:56 +0100 (CET)
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=freeip.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tY5t0-0000000FpPP-3M4A; Wed, 15 Jan 2025 16:04:54 +0000
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
X-Inumbo-ID: 7675f05c-d35a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zh4pjrW91hnVRk9ncvSX5fKSLJI2W3pr0C11ZvYhgkw=; b=COaHH0NTaQ4zOSTa5AXhRocW7A
	ffmBNndmpvC1e60QUgXUnCaSKwV4dfe2QWH8ZT0ZXW69d9wUHgXa7XUfC86YvO29/NGdJDJraVLGE
	Pb88o0E6TqZdHZchVZ2Cd4VAjQD9+INywYpfBTPWS70kAUTE4JFTWsR7M8hfj1FyQQBGqay6GOpYi
	CQa0ijnotBUHWbXoEdD1rxesrXATsr/dAybFfGEH5Xeo572ihxnQ8Z5gPFl6LdKOpjCxypw3oTcOc
	J3f5oxXaU8ceGr031bas1X1Dua5UJlQbGb0W+zl2HJSDRF44pCIhDnyn5Lb1Gl/uqcOB4TOm1ByIX
	9GSQiNhg==;
Message-ID: <82d7c9d49843afd44ddb7d14f518551646b921bc.camel@infradead.org>
Subject: Re: [PATCH v2 2/2] xen: do not use '%ms' scanf specifier
From: David Woodhouse <dwmw2@infradead.org>
To: Anthony PERARD <anthony@xenproject.org>, Roger Pau Monne
	 <roger.pau@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>,  xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org
Date: Wed, 15 Jan 2025 17:04:53 +0100
In-Reply-To: <Z4fH0NwPEmjryqoG@l14>
References: <20250110093531.23221-1-roger.pau@citrix.com>
	 <20250110093531.23221-3-roger.pau@citrix.com> <Z4fH0NwPEmjryqoG@l14>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-crBTpTo/dZrAlrKCg/Kg"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-crBTpTo/dZrAlrKCg/Kg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-01-15 at 15:36 +0100, Anthony PERARD wrote:
> On Fri, Jan 10, 2025 at 10:35:31AM +0100, Roger Pau Monne wrote:
> > diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
> > index ef0c2912efa1..989e75fef88f 100644
> > --- a/hw/char/xen_console.c
> > +++ b/hw/char/xen_console.c
> > @@ -550,7 +550,8 @@ static void xen_console_device_create(XenBackendIns=
tance *backend,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto fail;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, =
"%ms", &type) !=3D 1) {
> > +=C2=A0=C2=A0=C2=A0 type =3D xs_node_read(xsh, XBT_NULL, NULL, errp, "%=
s/%s", fe, "type");
> > +=C2=A0=C2=A0=C2=A0 if (!type) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_prepend(errp, "f=
ailed to read console device type: ");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto fail;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -568,7 +569,8 @@ static void xen_console_device_create(XenBackendIns=
tance *backend,
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 snprintf(label, sizeof(label), "xencons%ld", n=
umber);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 if (xs_node_scanf(xsh, XBT_NULL, fe, "output", NULL=
, "%ms", &output) =3D=3D 1) {
> > +=C2=A0=C2=A0=C2=A0 output =3D xs_node_read(xsh, XBT_NULL, NULL, errp, =
"%s/%s", fe, "output");
>=20
> This now set `errp` on error, when `output =3D=3D NULL`. In case `output`=
 is
> NULL, we check for `number` instead and may generate an error message
> that probably doesn't really make sense.
> =C2=A0=C2=A0=C2=A0 "console: No serial device #2 found: failed to read fr=
om /frontend_path/output"
> And if number =3D=3D 0, we tried to create a null device, and if that
> failed, the error message will just be about the missing xenstore path
> as error_setg() will not set `errp` again.
>=20
> Could you keep ignoring errors from xs_node_read() like it was done with
> xs_node_scanf() (I mean pass `NULL` instead of `errp`)? And we will need
> another patch to fix the wrong use of `error_prepend()` and use
> `error_setg` instead when `serial_hd()` fails.

Ack. I'll make that s/errp/NULL/ change in the original patch, and then
add something like this on top...

=46rom c6ea20c9055f6c5cdd44a56fd6f7f82d301412d1 Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Date: Wed, 15 Jan 2025 15:46:06 +0000
Subject: [PATCH] hw/xen: Fix errp handling in xen_console

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/char/xen_console.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 9338e00473..9e7f6da343 100644
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
+        if (errp) {
+            error_free(*errp);
+        }
+        if (number) {
+            cd =3D serial_hd(number);
+            if (!cd) {
+                error_setg(errp, "console: No serial device #%ld found: ",
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



--=-crBTpTo/dZrAlrKCg/Kg
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDExNTE2MDQ1
M1owLwYJKoZIhvcNAQkEMSIEIPSSazb4uD5mR6Adn3HoITo277uHzV3rkKh1qlPSDqmzMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAHdtZFMM743TS
m1Cd4vhQKFuzzHtuSRDfheZ4UHkkF9pQQFMCq7Se5IeDnkwSycrJNQXopkk73BZ7XKQwkukzLNuV
533igSA8IrdgTzH+ImKfmClrN1SQonSgnS/5thDUFcn7k0dKO9e6LOuDYbjQa/r2eIArsYJznCTS
SkzK+mLUy5pSJep0qNBisaltwNIRdcjXQZpiCOlEkZRcxFsCIWLhTslE9PBpezE43NABP62PsNVE
BJE1db+OC16AmDQYnMXcTkl2IrQA8hlKd4BTkBY+kUfLekBEc+FzMxVtiVdVioK1pF1Ra9coG1/V
sQdJrGedMggjznPwXqayJZzPw1IONmc2Twd8eIyjbVFc12B/MEAJ5sHbbt+07u9Zgr7uGDEkbLFr
FOi/juxYvHRWZZQIvndaR+XmTnjBxjTDd0SyktZ+u8A25NzDvWgIvxqsayZea1g3aOEMCQLIVW7O
6Xcz7lKeIWqqcov0r7oQn9M3+28cKaRWmHnVOGbZaDQa1qqheRh0w2jSe8zHxTOszfRrve+bij5g
I+OGfW9jh1KN+axAZ/Lpy9p24Amtl0lTPhYR3Wh7lufX+SfyvvSRkaI8PzhQ/cwN3999qDcnhU0T
1DAvAnXy4rNRFGr+GbLuap0QwxCWZZixOdiYn0S7Va0YC763C1dXIKrrnoQnOdIAAAAAAAA=


--=-crBTpTo/dZrAlrKCg/Kg--

