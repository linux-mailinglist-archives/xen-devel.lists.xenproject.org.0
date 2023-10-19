Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD17CF91C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619307.964163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSHe-0007L7-Rc; Thu, 19 Oct 2023 12:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619307.964163; Thu, 19 Oct 2023 12:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSHe-0007J0-Oo; Thu, 19 Oct 2023 12:37:50 +0000
Received: by outflank-mailman (input) for mailman id 619307;
 Thu, 19 Oct 2023 12:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9Lg=GB=casper.srs.infradead.org=BATV+06ae5fa416ae820d9d5a+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtSHa-0007He-Jk
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:37:48 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d9b5a29-6e7c-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 14:37:45 +0200 (CEST)
Received: from [2001:8b0:10b:5:583b:153f:ff9:f813]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qtSHL-0072lR-8h; Thu, 19 Oct 2023 12:37:31 +0000
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
X-Inumbo-ID: 4d9b5a29-6e7c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M8ZtQJm4spIcwBKs1cE9Y+VmbG/oqkYGXqzc+V9etOI=; b=WFM6+SLBj+2VN8uhQkj80V/C8y
	jNzHTXoblAEqfqoQUfCIAusdxj0aGNCOD03ubmu3UmcnXNebuI4KpQCF1udwMmIlYWe26n+KgfebG
	ve5jfzhtp6rDQNIneQJPIjhwHa+4xvCoIYHlV1Ism1R8mI8WSpbZ7nl4WAKWau/19Ih6N9El941LB
	g5FfivmRTOric36GQa6WlnV8TacAshTMJ/MCq+gn3lE9VxSGUMXxR3R9LyhzkNLKc0PzrnRfwlxRe
	LrHfH33lL3hXakfPivQ90UIuEaR42ILflh2zGAA6E/WrEWr6kMbqvvg+IDu5vJARSHTsbvZPO409I
	5Z/NKrGQ==;
Message-ID: <bad8f05b72710e436d01555704139839415249d6.camel@infradead.org>
Subject: Re: [PATCH v1 20/23] xen platform: unplug ahci object
From: David Woodhouse <dwmw2@infradead.org>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, Joel Upham
	 <jupham125@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
 <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
 xen-devel@lists.xenproject.org
Date: Thu, 19 Oct 2023 13:37:30 +0100
In-Reply-To: <CB4239A2-8502-406A-A594-3065C0D3B104@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
	 <9b8183903cbf20db4e2f0dafda9e0ed271a86a8e.1687278381.git.jupham125@gmail.com>
	 <CB4239A2-8502-406A-A594-3065C0D3B104@gmail.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-bRDKDojRd76wga/45xFW"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-bRDKDojRd76wga/45xFW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-06-22 at 05:40 +0000, Bernhard Beschow wrote:
> Am 20. Juni 2023 17:24:54 UTC schrieb Joel Upham <jupham125@gmail.com>:
> > This will unplug the ahci device when the Xen driver calls for an unplu=
g.
> > This has been tested to work in linux and Windows guests.
> > When q35 is detected, we will remove the ahci controller
> > with the hard disks.=C2=A0 In the libxl config, cdrom devices
> > are put on a seperate ahci controller. This allows for 6 cdrom
> > devices to be added, and 6 qemu hard disks.
>=20
> Does this also work with KVM Xen emulation? If so, the QEMU manual
> should be updated accordingly in this patch since it explicitly rules
> out Q35 due to missing AHCI unplug:
> https://gitlab.com/qemu-project/qemu/-/blob/stable-8.0/docs/system/i386/x=
en.rst?plain=3D1&ref_type=3Dheads#L51

No, it doesn't work.=C2=A0Those assumptions about the topology and which
disk/cdrom devices are attached to which AHCI device on which PCI bus,
are not valid in the general case. So if I boot an HVM guest thus...

 $ qemu-system-x86_64 -M q35 -m 1g -display none -serial mon:stdio \
     --accel kvm,xen-version=3D0x40011,kernel-irqchip=3Dsplit \
     -drive file=3D${GUEST_IMAGE},if=3Dxen=C2=A0\
     -drive file=3D${GUEST_IMAGE},file.locking=3Doff,if=3Dide

... it still sees the AHCI disk when it boots:

[root@localhost ~]# cat /proc/partitions=20
major minor  #blocks  name

 202        0   20971520 xvda
 202        1   18874368 xvda1
 202        2    2096128 xvda2
   8        0   20971520 sda
   8        1   18874368 sda1
   8        2    2096128 sda2
  11        0    1048575 sr0
[root@localhost ~]# lspci
00:00.0 Host bridge: Intel Corporation 82G33/G31/P35/P31 Express DRAM Contr=
oller
00:01.0 Unassigned class [ff80]: XenSource, Inc. Xen Platform Device (rev 0=
1)
00:02.0 VGA compatible controller: Device 1234:1111 (rev 02)
00:1f.0 ISA bridge: Intel Corporation 82801IB (ICH9) LPC Interface Controll=
er (rev 02)
00:1f.2 SATA controller: Intel Corporation 82801IR/IO/IH (ICH9R/DO/DH) 6 po=
rt SATA Controller [AHCI mode] (rev 02)
00:1f.3 SMBus: Intel Corporation 82801I (ICH9 Family) SMBus Controller (rev=
 02)

We probably do need to iterate over the children of the PCI device and
selectively destroy them. Which can be the *same* for IDE and AHCI.
Patch below.

It would be slightly more natural to do ide_dev_unplug() with an
'if (!idedev) return;' but I've done it this way to keep the
indentation the same, and thus highlight that it's just using the
existing blk unplug magic. I kind of hate that we *need* that magic,
shouldn't object_unparent() Just Work=E2=84=A2 and unwire everything?
(It *doesn't*; qemu later crashes. But I think it *should*).

As I'm literally about to hit send on this, I realise I messed up the
'aux' logic. But as a proof of concept for this approach, this works OK
for both pc and q35 machines with Xen emulation tested as in the above
command line. Feel free to use it as you see fit, to which end:

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -169,37 +169,49 @@ static void pci_unplug_nics(PCIBus *bus)
  *
  * [1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/misc/=
hvm-emulated-unplug.pandoc
  */
-static void pci_xen_ide_unplug(PCIDevice *d, bool aux)
+static int ide_dev_unplug(DeviceState *dev, void *opaque)
 {
-    DeviceState *dev =3D DEVICE(d);
-    PCIIDEState *pci_ide;
-    int i;
     IDEDevice *idedev;
     IDEBus *idebus;
     BlockBackend *blk;
+    int unit;
=20
-    pci_ide =3D PCI_IDE(dev);
-
-    for (i =3D aux ? 1 : 0; i < 4; i++) {
-        idebus =3D &pci_ide->bus[i / 2];
-        blk =3D idebus->ifs[i % 2].blk;
+    idedev =3D IDE_DEVICE(object_dynamic_cast(OBJECT(dev), "ide-hd"));
+    if (idedev) {
+        idebus =3D IDE_BUS(qdev_get_parent_bus(dev));
=20
-        if (blk && idebus->ifs[i % 2].drive_kind !=3D IDE_CD) {
-            if (!(i % 2)) {
-                idedev =3D idebus->master;
-            } else {
-                idedev =3D idebus->slave;
-            }
+        unit =3D (idedev =3D=3D idebus->slave);
+        assert(unit || idedev =3D=3D idebus->master);
=20
+        blk =3D idebus->ifs[unit].blk;
+        if (blk) {
             blk_drain(blk);
             blk_flush(blk);
=20
             blk_detach_dev(blk, DEVICE(idedev));
-            idebus->ifs[i % 2].blk =3D NULL;
+            idebus->ifs[unit].blk =3D NULL;
             idedev->conf.blk =3D NULL;
             monitor_remove_blk(blk);
             blk_unref(blk);
         }
+
+        object_unparent(OBJECT(dev));
+    }
+
+    return 0;
+}
+
+static void pci_xen_ide_unplug(PCIDevice *d, bool aux)
+{
+    DeviceState *dev =3D DEVICE(d);
+
+    if (!aux) {
+        IDEBus *idebus =3D IDE_BUS(qdev_get_child_bus(DEVICE(dev), "ide.0"=
));
+        if (idebus && idebus->master) {
+            ide_dev_unplug(DEVICE(idebus->master), NULL);
+        }
+    } else {
+        qdev_walk_children(dev, NULL, NULL, ide_dev_unplug, NULL, NULL);
     }
     pci_device_reset(d);
 }
@@ -216,6 +228,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void =
*opaque)
=20
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
+    case PCI_CLASS_STORAGE_SATA:
         pci_xen_ide_unplug(d, aux);
         break;
=20
--=20
2.34.1



--=-bRDKDojRd76wga/45xFW
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDE5MTIzNzMwWjAvBgkqhkiG9w0BCQQxIgQgiRU49FbN
n1S93DctcGtQGIwrVjDZZhP1gzon/qCa4Rowgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgACTUyOv0W38LyAPRHHXE5r54l0NZkUUyu9
HrlakIcoRWOSIfpiOhugdJpWjzdRYeGxZpA/LP1HGDcOSOC61mmfp+jrhKTdth1kFPwquPWQW6sI
zgaWTsY74FsMbNwIgAgyYoQSKHniF8N3sZBTC2QOQD5c8HclVcoFE3Jec19NdHECWhWwTmhWJg27
224lqu1cnnAJSPWVmy/xQnc4VOg3TvpnaadIv89r2TCz+aP12tPy6XRXtzBTJuq+pi3aH1SjlTUA
rn/lBqfI6dqmEUzsYWpyKr6jDhw9+8ayTjx4bgEXjjKPR0ccpgrdoxhJyXLgKNXWFGdM9i/YL+UL
+6/AKM+3Kkv23FzR41pNfnUCgkShh6aiB4ZqsTyp1I0XjQtsUZnmuywqj9f61SytaowY9qdlTQpj
G3BWzHdj51k2EQyxurVBPc0XpjiXjij8SUl+ZCD/JxhGTQ+zGYDRI9pw3PShjds3YlnTsL12GDXP
/tkGEived/2CiJILZA9/7gOXOPHlEnw1tELqq2LsAszyYGeYdnb58ov6TwRp1OZPR/+3R/B7wPCl
dRs+nAmXXegogL5xeP4aU6wimWhI5+2hxMWN6AmVRp5Lk+0MabIQcok/1Wa3qyw0k4QZgK5FpOkn
xSMlUxii60sJleo47/GujeGje+MbP5LwfUnghwDW2AAAAAAAAA==


--=-bRDKDojRd76wga/45xFW--

