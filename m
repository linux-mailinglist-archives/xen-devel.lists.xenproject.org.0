Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4683DB97
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 15:17:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672032.1045635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTN0h-00042w-M7; Fri, 26 Jan 2024 14:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672032.1045635; Fri, 26 Jan 2024 14:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTN0h-000404-IY; Fri, 26 Jan 2024 14:16:47 +0000
Received: by outflank-mailman (input) for mailman id 672032;
 Fri, 26 Jan 2024 14:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPDA=JE=casper.srs.infradead.org=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1rTN0f-0003zy-T5
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 14:16:46 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 889ffa72-bc55-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 15:16:44 +0100 (CET)
Received: from [2001:8b0:10b:5:d160:e4ac:a057:38f5]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTN04-0000000DpQ8-1AW4; Fri, 26 Jan 2024 14:16:09 +0000
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
X-Inumbo-ID: 889ffa72-bc55-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WMKtQwDGQFDrlrI4mqsWtTQig46/I0wCQZlGkuPyJhY=; b=HMJc+4B8oDVOAfw6o7xfdKIlLl
	CZfWYnUy49ECGITnrAPZh2qWXSffoWORMYqScPNbxWD3maH3Hhqa3/0qfgJPhKHWFoq9UFgsGqpMv
	KRNJpJp0NAuEpTSNl8L80i5hp+gmdTnwTZFj4dZeoO8vMMWltEOIXSdF3/av5dZ6+a2OcNhw4GxUG
	ur/dVZvuznj04D2knJu0MKbdJX2s3pisKzjnBaqwrTfSdM7LrdT1gFgBwXekiEPLtrYFSwJZ5nlT0
	5PSt97/1s5Sw3KJmHQzwu48f5I4JIyNio6btIt4isx1PFmYJEzLGGzxZjpRgQXs3t1bfYGcAKo0JM
	js1m7/dA==;
Message-ID: <0914e6a51218793cca3121879ef21b39d9aac612.camel@infradead.org>
Subject: Re: [PATCH v3 01/46] net: add qemu_{configure,
 create}_nic_device(), qemu_find_nic_info()
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Strahinja
 Jankovic <strahinja.p.jankovic@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>,  =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
 <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>, Jean-Christophe
 Dubois <jcd@tribudubois.net>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Rob Herring
 <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka
 <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>, Hao Wu
 <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>, Laurent Vivier
 <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  =?ISO-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Nicholas Piggin
 <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, Harsh Prateek Bora
 <harshpb@linux.ibm.com>, Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  Eric Farman
 <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,  xen-devel@lists.xenproject.org
Date: Fri, 26 Jan 2024 14:16:08 +0000
In-Reply-To: <9218c20b-8ba8-402b-bea5-856cb51156dc@redhat.com>
References: <20240108204909.564514-1-dwmw2@infradead.org>
	 <20240108204909.564514-2-dwmw2@infradead.org>
	 <9218c20b-8ba8-402b-bea5-856cb51156dc@redhat.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-z7NOS3lipot50VpBs+fh"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-z7NOS3lipot50VpBs+fh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-01-26 at 12:10 +0100, Thomas Huth wrote:
>=20
> > +/* "Please create a device, if you have a configuration for it" */
> > +DeviceState *qemu_create_nic_device(const char *typename, bool match_d=
efault,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const ch=
ar *alias)
> > +{
> > +=C2=A0=C2=A0=C2=A0 NICInfo *nd =3D qemu_find_nic_info(typename, match_=
default, alias);
> > +=C2=A0=C2=A0=C2=A0 DeviceState *dev;
> > +
> > +=C2=A0=C2=A0=C2=A0 if (!nd) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> The qemu_check_nic_model() function that was used in some code that you=
=20
> turned into qemu_create_nic_device() used to set:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 if (!nd->model)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nd->model =3D g_strdup(d=
efault_model);
>=20
> (in the qemu_find_nic_model() function that has been called by=20
> qemu_check_nic_model())
>=20
> Should we do that also here to make sure that nd->model is not NULL after=
wards?

Good question, but I don't think we care. The qdev_set_nic_properties()
function certainly doesn't propagate nd->model to anywhere.

I renamed nd->model to nd->modelname in a patch shown below, just to be
100% sure I'm not missing any other code paths which might consume it.


diff --git a/include/net/net.h b/include/net/net.h
index 766201c62c..ad6cd5b14b 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -238,7 +238,7 @@ GPtrArray *qemu_get_nic_models(const char *device_type)=
;
=20
 struct NICInfo {
     MACAddr macaddr;
-    char *model;
+    char *modelname;
     char *name;
     char *devaddr;
     NetClientState *netdev;
diff --git a/net/net.c b/net/net.c
index 71cccb19da..ab6185b4df 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1012,7 +1012,7 @@ static int net_init_nic(const Netdev *netdev, const c=
har *name,
     }
     nd->name =3D g_strdup(name);
     if (nic->model) {
-        nd->model =3D g_strdup(nic->model);
+        nd->modelname =3D g_strdup(nic->model);
     }
     if (nic->addr) {
         nd->devaddr =3D g_strdup(nic->addr);
@@ -1142,8 +1142,8 @@ NICInfo *qemu_find_nic_info(const char *typename, boo=
l match_default,
             continue;
         }
=20
-        if ((match_default && !nd->model) || !g_strcmp0(nd->model, typenam=
e)
-            || (alias && !g_strcmp0(nd->model, alias))) {
+        if ((match_default && !nd->modelname) || !g_strcmp0(nd->modelname,=
 typename)
+            || (alias && !g_strcmp0(nd->modelname, alias))) {
             return nd;
         }
     }
@@ -1210,7 +1210,7 @@ void qemu_create_nic_bus_devices(BusState *bus, const=
 char *parent_type,
             continue;
         }
=20
-        model =3D nd->model ? nd->model : default_model;
+        model =3D nd->modelname ? nd->modelname : default_model;
         if (!model) {
             continue;
         }
@@ -1726,7 +1726,7 @@ void net_check_clients(void)
             warn_report("requested NIC (%s, model %s) "
                         "was not created (not supported by this machine?)"=
,
                         nd->name ? nd->name : "anonymous",
-                        nd->model ? nd->model : "unspecified");
+                        nd->modelname ? nd->modelname : "unspecified");
         }
     }
 }
@@ -1787,9 +1787,9 @@ static int net_param_nic(void *dummy, QemuOpts *opts,=
 Error **errp)
=20
     ni =3D &nd_table[idx];
     memset(ni, 0, sizeof(*ni));
-    ni->model =3D qemu_opt_get_del(opts, "model");
+    ni->modelname =3D qemu_opt_get_del(opts, "model");
=20
-    if (!nic_model_help && !g_strcmp0(ni->model, "help")) {
+    if (!nic_model_help && !g_strcmp0(ni->modelname, "help")) {
         nic_model_help =3D g_hash_table_new_full(g_str_hash, g_str_equal,
                                                g_free, NULL);
         return 0;


--=-z7NOS3lipot50VpBs+fh
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwMTI2MTQxNjA4WjAvBgkqhkiG9w0BCQQxIgQgQb0ttLNK
ysKXPWTpt4+aNlLnPrI4mCi3Qhm+Lj8XY04wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCXZomon4T6lUQoX6pMSusRgH/GBZKqbNH3
LT9cO6mnQvJ0c0d6we81iMH1sB01fVWhG+LAgHMDqbuZyTAtvHl1nYTcJER9OWtTHWzkBabDJrXd
VDNnOXF2ekb4RRRkyiZZEQ//rdCiLfopHWWAIZXTXYVuIqAJDMVHRj/El8FV9aSx/kyWCPpt2MKs
xqPOzBuCpdKbe/rLi5+4UqJz/qXK0s5Yz+7VRfAnRdlM/fJJFneam8NTFkE58YzTzlN87Y+PFqzz
Ppj38ePd9c70AqNAOqpQAX41J1i0tAia2X7J8bWY79Ih0y75ynLBHlftF/QRLnZgOOaGRA2weylF
r/nJ31iMk8W91efk9SgHNYcxkOf/l9+LL5T3QMNk40Do3WXSRkGJ2b78oitcUGkjwdhsURaC/Nk+
tsCtXPCNY4F8sUHWvA0hkL+E6RX6vOyqMiE3g0cyoS+zNyUpuj01dbTja0nI/4vsCWo18Zzc3MJJ
6GKYdKSqVrVG3tcH+GKtO9RFUng3oQLZO5IA2CZCiOCCLP8Euxkg0LaHchMh6ijLXmd9ZahtoFHG
EdIFZslOON7eszPahtGx9ARq3D7FMtjYuzGfVTsMepYKIYJYTXpgw4U8lxkYkbECCsj2CvVVcYoT
jhfQuRjNVdJSjns9D249Vw8YiedpaogwmUizhvO3ywAAAAAAAA==


--=-z7NOS3lipot50VpBs+fh--

