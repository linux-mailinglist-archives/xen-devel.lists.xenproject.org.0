Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DBF0023
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 15:45:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS035-0002PR-Iw; Tue, 05 Nov 2019 14:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS033-0002PK-Os
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 14:43:09 +0000
X-Inumbo-ID: 94dc56d6-ffda-11e9-b678-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.126.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94dc56d6-ffda-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 14:43:08 +0000 (UTC)
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1iJZpb3pFD-00RF8p; Tue, 05 Nov 2019 15:42:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue,  5 Nov 2019 15:42:44 +0100
Message-Id: <20191105144247.10301-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ml/MHDlWxXyppXpZMCGFBDj/O++YcL10kd1yqebCkUb1KJkFOVS
 lxZqglzv7krRW55VEUF8rKzJJeH8WGkLaDCt/e81/sxi5CkxuEtyq7sM5ofLr5H6/zIalIB
 iLnze1k1sKg2MMFCZZwcDgjjMvJ9BCMevYZop6WdlieYNOduUNE2tmhxm3TrqZFsuMHfiKq
 XXMUNfnZM3rRTyEbEjLWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wAwd8f1ozMU=:3tGAlFcrRzVUy4stv1h2Kj
 DOfwVb62tvFhpMbcNeMQMmnYRRpXCrgHBKbpocMPQIIJfNhFSFXnqMpE2EytXFj11gHw36Iqs
 4ExOhLmy30jCgD1gvqhHkjsfLAgqFDKuG09mC9eZqdnD7uC6la3DdV4zxOxoXPGale+2VA9wW
 cfFphRt1Y2Nh9sII63JhOb1G/zJrKdbandh6cZYyQhtcDHF6FSJGKYvGnWpQBT5ElDzzfpVRD
 nxS4Y3Nz9QFLPT80E7iq1CjyLfrACRXGNYyl4k9ulT8ZIxYisvOPsi6PWGlqamPxvgAAoPEBR
 5Yi6RUK+zY4IFnoIpgKVktwk4Aa5EdP0Efdf1rbaGN9n7MnQCWVD88sRDqhZ7+lkV2dgZa08E
 SEKOB68JmKVcow9nkvCHUHkwvgeIqoh672T2fank2pNtbIJfa9K73EnsPQXPV15gqLpQC1fzw
 vzTZnQErBvGt7TVq8AFwXpAtdXXrjHh1I3mcBTNk0uk5AyUVPl7+qum29PwyA1CeOQkTRK2t2
 nvmnxG3LC7G1O1bmtATDf/e5KB3qzrYE0RGWBy76AkZ2KIRBmuOIYrtdiO0TSh6nkWGoU9y85
 Fsgt0Kv/ZGyJ3DInGx7rvKMdiQtHEB6rqOEutG0XOjcwdloG/X8tO/rg5u9LIPqBTVfDTOUEv
 1vaoiJnulMeMFsO2v7kUFJuPDfP09PBru2EumJdm29q73lGEvEJUebE0QFKTlM0UXL4wIwyoa
 t71rYj8mpNKbWswgITuI0blS56FVzyCqugZhzS5N+TPYhmHXVtyBREjdGarv89AsNyXqxOI1H
 TQQZlM2ZJejhydPM8QDb7WwvuRN28ANscaXT7gSUYbGrgAClqjAeFPpdxrtGS1p52PHhmEBlO
 nU38rCnhbWAcbf3/vYaPi3rtE1FX7wE27Bd64jaq4=
Subject: [Xen-devel] [PULL 1/4] hw/misc/grlib_ahb_apb_pnp: Avoid crash when
 writing to PnP registers
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 Claudio Fontana <claudio.fontana@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKR3Vlc3Rz
IGNhbiBjcmFzaCBRRU1VIHdoZW4gd3JpdHRpbmcgdG8gUG5QIHJlZ2lzdGVyczoKCiAgJCBlY2hv
ICd3cml0ZWIgMHg4MDBmZjA0MiA2OScgfCBxZW11LXN5c3RlbS1zcGFyYyAtTSBsZW9uM19nZW5l
cmljIC1TIC1iaW9zIC9ldGMvbWFnaWMgLXF0ZXN0IHN0ZGlvCiAgW0kgMTU3MTkzODMwOS45MzIy
NTVdIE9QRU5FRAogIFtSICswLjA2MzQ3NF0gd3JpdGViIDB4ODAwZmYwNDIgNjkKICBTZWdtZW50
YXRpb24gZmF1bHQgKGNvcmUgZHVtcGVkKQoKICAoZ2RiKSBidAogICMwICAweDAwMDAwMDAwMDAw
MDAwMDAgaW4gICgpCiAgIzEgIDB4MDAwMDU1NWY0YmNkZjBiYyBpbiBtZW1vcnlfcmVnaW9uX3dy
aXRlX3dpdGhfYXR0cnNfYWNjZXNzb3IgKG1yPTB4NTU1ZjRkN2JlOGMwLCBhZGRyPTY2LCB2YWx1
ZT0weDdmZmYwN2QwMGYwOCwgc2l6ZT0xLCBzaGlmdD0wLCBtYXNrPTI1NSwgYXR0cnM9Li4uKSBh
dCBtZW1vcnkuYzo1MDMKICAjMiAgMHgwMDAwNTU1ZjRiY2RmMTg1IGluIGFjY2Vzc193aXRoX2Fk
anVzdGVkX3NpemUgKGFkZHI9NjYsIHZhbHVlPTB4N2ZmZjA3ZDAwZjA4LCBzaXplPTEsIGFjY2Vz
c19zaXplX21pbj0xLCBhY2Nlc3Nfc2l6ZV9tYXg9NCwgYWNjZXNzX2ZuPTB4NTU1ZjRiY2RlZmY0
IDxtZW1vcnlfcmVnaW9uX3dyaXRlX3dpdGhfYXR0cnNfYWNjZXNzb3I+LCBtcj0weDU1NWY0ZDdi
ZThjMCwgYXR0cnM9Li4uKSBhdCBtZW1vcnkuYzo1MzkKICAjMyAgMHgwMDAwNTU1ZjRiY2UyMjQz
IGluIG1lbW9yeV9yZWdpb25fZGlzcGF0Y2hfd3JpdGUgKG1yPTB4NTU1ZjRkN2JlOGMwLCBhZGRy
PTY2LCBkYXRhPTY5LCBvcD1NT184LCBhdHRycz0uLi4pIGF0IG1lbW9yeS5jOjE0ODkKICAjNCAg
MHgwMDAwNTU1ZjRiYzgwYjIwIGluIGZsYXR2aWV3X3dyaXRlX2NvbnRpbnVlIChmdj0weDU1NWY0
ZDkyYzQwMCwgYWRkcj0yMTQ4NTI4MTk0LCBhdHRycz0uLi4sIGJ1Zj0weDdmZmYwN2QwMTEyMCAi
RSIsIGxlbj0xLCBhZGRyMT02NiwgbD0xLCBtcj0weDU1NWY0ZDdiZThjMCkgYXQgZXhlYy5jOjMx
NjEKICAjNSAgMHgwMDAwNTU1ZjRiYzgwYzY1IGluIGZsYXR2aWV3X3dyaXRlIChmdj0weDU1NWY0
ZDkyYzQwMCwgYWRkcj0yMTQ4NTI4MTk0LCBhdHRycz0uLi4sIGJ1Zj0weDdmZmYwN2QwMTEyMCAi
RSIsIGxlbj0xKSBhdCBleGVjLmM6MzIwMQogICM2ICAweDAwMDA1NTVmNGJjODBmYjAgaW4gYWRk
cmVzc19zcGFjZV93cml0ZSAoYXM9MHg1NTVmNGQ3YWE0NjAsIGFkZHI9MjE0ODUyODE5NCwgYXR0
cnM9Li4uLCBidWY9MHg3ZmZmMDdkMDExMjAgIkUiLCBsZW49MSkgYXQgZXhlYy5jOjMyOTEKICAj
NyAgMHgwMDAwNTU1ZjRiYzgxMDFkIGluIGFkZHJlc3Nfc3BhY2VfcncgKGFzPTB4NTU1ZjRkN2Fh
NDYwLCBhZGRyPTIxNDg1MjgxOTQsIGF0dHJzPS4uLiwgYnVmPTB4N2ZmZjA3ZDAxMTIwICJFIiwg
bGVuPTEsIGlzX3dyaXRlPXRydWUpIGF0IGV4ZWMuYzozMzAxCiAgIzggIDB4MDAwMDU1NWY0YmNk
YjM4OCBpbiBxdGVzdF9wcm9jZXNzX2NvbW1hbmQgKGNocj0weDU1NWY0YzJlZDdlMCA8cXRlc3Rf
Y2hyPiwgd29yZHM9MHg1NTVmNGRiMGM1ZDApIGF0IHF0ZXN0LmM6NDMyCgpJbnN0ZWFkIG9mIGNy
YXNoaW5nLCBsb2cgdGhlIGFjY2VzcyBhcyB1bmltcGxlbWVudGVkLgoKU2lnbmVkLW9mZi1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTog
S09OUkFEIEZyZWRlcmljIDxmcmVkZXJpYy5rb25yYWRAYWRhY29yZS5jb20+Ck1lc3NhZ2UtSWQ6
IDwyMDE5MTAyNTExMDExNC4yNzA5MS0yLXBoaWxtZEByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+Ci0tLQogaHcvbWlzYy9ncmxpYl9h
aGJfYXBiX3BucC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2h3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYyBiL2h3L21pc2MvZ3Js
aWJfYWhiX2FwYl9wbnAuYwppbmRleCA3MzM4NDYxNjk0YzkuLmYzYzAxNWQyYzM1ZiAxMDA2NDQK
LS0tIGEvaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucC5jCisrKyBiL2h3L21pc2MvZ3JsaWJfYWhi
X2FwYl9wbnAuYwpAQCAtMjIsNiArMjIsNyBAQAogICovCiAKICNpbmNsdWRlICJxZW11L29zZGVw
LmgiCisjaW5jbHVkZSAicWVtdS9sb2cuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNs
dWRlICJody9taXNjL2dybGliX2FoYl9hcGJfcG5wLmgiCiAKQEAgLTIzMSw4ICsyMzIsMTUgQEAg
c3RhdGljIHVpbnQ2NF90IGdybGliX2FwYl9wbnBfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBv
ZmZzZXQsIHVuc2lnbmVkIHNpemUpCiAgICAgcmV0dXJuIGFwYl9wbnAtPnJlZ3Nbb2Zmc2V0ID4+
IDJdOwogfQogCitzdGF0aWMgdm9pZCBncmxpYl9hcGJfcG5wX3dyaXRlKHZvaWQgKm9wYXF1ZSwg
aHdhZGRyIGFkZHIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHZh
bCwgdW5zaWduZWQgc2l6ZSkKK3sKKyAgICBxZW11X2xvZ19tYXNrKExPR19VTklNUCwgIiVzIG5v
dCBpbXBsZW1lbnRlZFxuIiwgX19mdW5jX18pOworfQorCiBzdGF0aWMgY29uc3QgTWVtb3J5UmVn
aW9uT3BzIGdybGliX2FwYl9wbnBfb3BzID0gewogICAgIC5yZWFkICAgICAgID0gZ3JsaWJfYXBi
X3BucF9yZWFkLAorICAgIC53cml0ZSAgICAgID0gZ3JsaWJfYXBiX3BucF93cml0ZSwKICAgICAu
ZW5kaWFubmVzcyA9IERFVklDRV9CSUdfRU5ESUFOLAogfTsKIAotLSAKMi4yMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
