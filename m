Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E787F0025
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 15:45:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS03A-0002Qk-9f; Tue, 05 Nov 2019 14:43:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FZ3L=Y5=vivier.eu=laurent@srs-us1.protection.inumbo.net>)
 id 1iS038-0002QM-O6
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 14:43:14 +0000
X-Inumbo-ID: 97211968-ffda-11e9-984a-bc764e2007e4
Received: from mout.kundenserver.de (unknown [212.227.126.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97211968-ffda-11e9-984a-bc764e2007e4;
 Tue, 05 Nov 2019 14:43:12 +0000 (UTC)
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqZE0-1i5upG2BIu-00mbPo; Tue, 05 Nov 2019 15:42:58 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Tue,  5 Nov 2019 15:42:45 +0100
Message-Id: <20191105144247.10301-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:L0D96drAblJ0e5CYodG0S9iuT59onHnJ0Slrv+hqH6rKd5o+myY
 mmZ4AB9u/hybpbbZ2Ui1BvYZaGmkHHRYBjFF//4qqaI/qpxjt4w1bMwDK3anqiXodn8epC6
 j+saVzYmrd4wPfoElBBOiTRuP4dIA/vJMIvF0Mv0Go4JTNym5GyH8fnWYgtYzA1H7fd69+J
 cVRaRWixqbsaw5ieGlf5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K08tChYLLIg=:38M25GKpRoC1OrLY/QzTVf
 UueeHNpRByJqajENf/AkFYd1n5DA6UZgyq0efhC0T2q0rlbcjrvJYCFp/IWpImifpMVamJqQO
 oL0heUITSvF3XbfNrx6W8AHVcV6mdls5eFR6fnfGyuRInk5Q+vL4AkEH9eW27qgs1w6kb2qO8
 MyuHTFWPQmFGMfmM1SF29ep8RMakYptJFnybUwcp2JH9PwEJoFuOfxFRbcBo607K3fRqsNltJ
 +f3SgwUN94AqAoBmoF5ZfJlOvZONGdRcc2sUjW16Dg5ewtKXqNYYEhxy4CUVvlygnv/jmVCwu
 l5ynhoADTlMtQiLyD6Yt3t5RXnvC5ZLHdZXLQrbSJFklUmwoloe2K+oauhYWwnEn051Fed/l4
 g1ezK1/d6FGpiPvcTaoPKSvO268khCULfcMQ11maybdp7kfn2cxy2WezOAE6XzlIgtWqacSwR
 736/bwyNvNiJMOB4+L+T3PXT8BksGAWQHAT1X9+x1hWwDphfCuddY7Y/U1TyzHw6GjVsBAVL+
 hTQqCX4BuHidsJU5sfjs304RpJACYm5LWTQuUNEZTH72L4wcgLSe733/o9N5tG0aSY6hny6xW
 tTyk2Nxz3ubxIX0l6vrd9JUhAqnpW63QaotnJmb0D/FlDOPGa24akh3GsKUzzrsJqzObHFsoM
 2uMBbsrAErbO1vaQniD2xUv9QzqhuvU2UOYhjvnefSS3GvwVazVLeZ+R2eMHxiWYK+cpE5zAe
 87tuOBo1ejLYN3PRS9ZS9PTfF6v6Gmz0a9V9thYO4wWFvhW7BSUSwGWKC2eZiWvEj9vL5X4Sx
 zgON+iu1SdKsNHF/IBgjW3DSHLwL6qK65CsZBdIq0//NLe89vvlDH3D69k9SmTZB4f3bvpvB1
 oyrCOw7D2x1G4Km4z4PTVzH56hxX5qVzEsv2S8qBY=
Subject: [Xen-devel] [PULL 2/4] hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiri Gaisler <jiri@gaisler.se>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKVGhlIFBs
dWcgJiBQbGF5IHJlZ2lvbiBvZiB0aGUgQUhCL0FQQiBicmlkZ2UgY2FuIGJlIGFjY2Vzc2VkCmJ5
IHZhcmlvdXMgd29yZCBzaXplLCBob3dldmVyIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBjbGVhcmx5
CnJlc3RyaWN0ZWQgdG8gMzItYml0OgoKICBzdGF0aWMgdWludDY0X3QgZ3JsaWJfYXBiX3BucF9y
ZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNldCwgdW5zaWduZWQgc2l6ZSkKICB7CiAgICAg
IEFQQlBucCAqYXBiX3BucCA9IEdSTElCX0FQQl9QTlAob3BhcXVlKTsKCiAgICAgIHJldHVybiBh
cGJfcG5wLT5yZWdzW29mZnNldCA+PiAyXTsKICB9CgpTZXQgdGhlIE1lbW9yeVJlZ2lvbk9wczo6
aW1wbCBtaW4vbWF4IGZpZWxkcyB0byAzMi1iaXQsIHNvCm1lbW9yeS5jOjphY2Nlc3Nfd2l0aF9h
ZGp1c3RlZF9zaXplKCkgY2FuIGFkanVzdCB3aGVuIHRoZQphY2Nlc3MgaXMgbm90IDMyLWJpdC4K
ClRoaXMgaXMgcmVxdWlyZWQgdG8gcnVuIFJURU1TIG9uIGxlb24zLCB0aGUgZ3JsaWIgc2Nhbm5p
bmcKZnVuY3Rpb25zIGRvIGJ5dGUgYWNjZXNzZXMuCgpSZXBvcnRlZC1ieTogSmlyaSBHYWlzbGVy
IDxqaXJpQGdhaXNsZXIuc2U+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEtPTlJBRCBGcmVkZXJpYyA8ZnJlZGVy
aWMua29ucmFkQGFkYWNvcmUuY29tPgpNZXNzYWdlLUlkOiA8MjAxOTEwMjUxMTAxMTQuMjcwOTEt
My1waGlsbWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBWaXZpZXIgPGxhdXJl
bnRAdml2aWVyLmV1PgotLS0KIGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYyB8IDQgKysrKwog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2h3L21pc2MvZ3Js
aWJfYWhiX2FwYl9wbnAuYyBiL2h3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYwppbmRleCBmM2Mw
MTVkMmMzNWYuLmUyMzBlMjUzNjM2MSAxMDA2NDQKLS0tIGEvaHcvbWlzYy9ncmxpYl9haGJfYXBi
X3BucC5jCisrKyBiL2h3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnAuYwpAQCAtMjQyLDYgKzI0Miwx
MCBAQCBzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIGdybGliX2FwYl9wbnBfb3BzID0gewog
ICAgIC5yZWFkICAgICAgID0gZ3JsaWJfYXBiX3BucF9yZWFkLAogICAgIC53cml0ZSAgICAgID0g
Z3JsaWJfYXBiX3BucF93cml0ZSwKICAgICAuZW5kaWFubmVzcyA9IERFVklDRV9CSUdfRU5ESUFO
LAorICAgIC5pbXBsID0geworICAgICAgICAubWluX2FjY2Vzc19zaXplID0gNCwKKyAgICAgICAg
Lm1heF9hY2Nlc3Nfc2l6ZSA9IDQsCisgICAgfSwKIH07CiAKIHN0YXRpYyB2b2lkIGdybGliX2Fw
Yl9wbnBfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCi0tIAoyLjIxLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
