Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E717A8D
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMYR-0000dU-QR; Wed, 08 May 2019 13:24:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Ps6=TI=citrix.com=prvs=0248bffa7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hOMYQ-0000dK-Kz
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:24:14 +0000
X-Inumbo-ID: 926dea57-7194-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 926dea57-7194-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 13:24:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,446,1549929600"; d="scan'208";a="85265437"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 8 May 2019 14:24:00 +0100
Message-ID: <20190508132403.1454-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190508132403.1454-1-paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/5] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBub3QgdmVuZG9yIHNwZWNpZmljIHNvIGl0IHNob3VsZG4ndCByZWFsbHkgYmUgdGhlcmUu
CgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgot
LS0KQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5j
b20+CkNjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KQ2M6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lv
bW11LmMgfCAzICsrLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAgICAg
ICB8IDQgLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAgICB8
IDkgKysrKysrKystCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRf
aW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKaW5k
ZXggZGJjNzFjYTdkNS4uODcyYmJlMjFjMiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvcGNpX2FtZF9pb21tdS5jCkBAIC0xODIsNyArMTgyLDggQEAgc3RhdGljIGludCBfX2luaXQg
aW92X2RldGVjdCh2b2lkKQogCiAgICAgaWYgKCAhYW1kX2lvbW11X3BlcmRldl9pbnRyZW1hcCAp
CiAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiQU1ELVZpOiBVc2luZyBnbG9iYWwgaW50
ZXJydXB0IHJlbWFwIHRhYmxlIGlzIG5vdCByZWNvbW1lbmRlZCAoc2VlIFhTQS0zNikhXG4iKTsK
LSAgICByZXR1cm4gc2Nhbl9wY2lfZGV2aWNlcygpOworCisgICAgcmV0dXJuIDA7CiB9CiAKIGlu
dCBhbWRfaW9tbXVfYWxsb2Nfcm9vdChzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCkKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMKaW5kZXggN2I5ZTA5YTA4NC4uZjljNzZmNTk0YyAxMDA2NDQK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTIzNzIsMTAgKzIzNzIsNiBAQCBzdGF0aWMg
aW50IF9faW5pdCB2dGRfc2V0dXAodm9pZCkKICAgICBQKGlvbW11X2hhcF9wdF9zaGFyZSwgIlNo
YXJlZCBFUFQgdGFibGVzIik7CiAjdW5kZWYgUAogCi0gICAgcmV0ID0gc2Nhbl9wY2lfZGV2aWNl
cygpOwotICAgIGlmICggcmV0ICkKLSAgICAgICAgZ290byBlcnJvcjsKLQogICAgIHJldCA9IGlu
aXRfdnRkX2h3KCk7CiAgICAgaWYgKCByZXQgKQogICAgICAgICBnb3RvIGVycm9yOwpkaWZmIC0t
Z2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC94ODYvaW9tbXUuYwppbmRleCAwMzRhYzkwM2RkLi44OTVjN2ZiNTY0IDEwMDY0
NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwpAQCAtMjgsNiArMjgsOCBAQCBzdHJ1Y3QgaW9t
bXVfb3BzIF9fcmVhZF9tb3N0bHkgaW9tbXVfb3BzOwogCiBpbnQgX19pbml0IGlvbW11X2hhcmR3
YXJlX3NldHVwKHZvaWQpCiB7CisgICAgaW50IHJjOworCiAgICAgaWYgKCAhaW9tbXVfaW5pdF9v
cHMgKQogICAgICAgICByZXR1cm4gLUVOT0RFVjsKIApAQCAtMzcsNyArMzksMTIgQEAgaW50IF9f
aW5pdCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQogICAgICAgICAvKiB4MmFwaWMgc2V0dXAg
bWF5IGhhdmUgcHJldmlvdXNseSBpbml0aWFsaXNlZCB0aGUgc3RydWN0LiAqLwogICAgICAgICBB
U1NFUlQoaW9tbXVfb3BzLmluaXQgPT0gaW9tbXVfaW5pdF9vcHMtPm9wcy0+aW5pdCk7CiAKLSAg
ICByZXR1cm4gaW9tbXVfaW5pdF9vcHMtPnNldHVwKCk7CisgICAgcmMgPSBpb21tdV9pbml0X29w
cy0+c2V0dXAoKTsKKworICAgIGlmICggIXJjICkKKyAgICAgICAgcmMgPSBzY2FuX3BjaV9kZXZp
Y2VzKCk7CisKKyAgICByZXR1cm4gcmM7CiB9CiAKIGludCBpb21tdV9lbmFibGVfeDJhcGljKHZv
aWQpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
