Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2170BC3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg30-0003Pn-Km; Mon, 22 Jul 2019 21:40:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2t-00039S-6a
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:35 +0000
X-Inumbo-ID: 55bf2820-acc9-11e9-af58-9762408ddb70
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 55bf2820-acc9-11e9-af58-9762408ddb70;
 Mon, 22 Jul 2019 21:40:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B15491509;
 Mon, 22 Jul 2019 14:40:33 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B51A3F71F;
 Mon, 22 Jul 2019 14:40:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:54 +0100
Message-Id: <20190722213958.5761-32-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 31/35] xen/arm32: head: Remove 1:1 mapping as
 soon as it is not used
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIDE6MSBtYXBwaW5nIG1heSBjbGFzaCB3aXRoIG90aGVyIHBhcnRzIG9mIHRoZSBYZW4gdmly
dHVhbCBtZW1vcnkKbGF5b3V0LiBBdCB0aGUgbW9tZW50LCBYZW4gaXMgaGFuZGxpbmcgdGhlIGNs
YXNoIGJ5IG9ubHkgY3JlYXRpbmcgYQptYXBwaW5nIHRvIHRoZSBydW50aW1lIHZpcnR1YWwgYWRk
cmVzcyBiZWZvcmUgZW5hYmxpbmcgdGhlIE1NVS4KClRoZSByZXN0IG9mIHRoZSBtYXBwaW5ncyAo
c3VjaCBhcyB0aGUgZml4bWFwKSB3aWxsIGJlIG1hcHBlZCBhZnRlciB0aGUKTU1VIGlzIGVuYWJs
ZWQuIEhvd2V2ZXIsIHRoZSBjb2RlIGRvaW5nIHRoZSBtYXBwaW5nIGlzIG5vdCBzYWZlIGFzIGl0
CnJlcGxhY2UgbWFwcGluZyB3aXRob3V0IHVzaW5nIHRoZSBCcmVhay1CZWZvcmUtTWFrZSBzZXF1
ZW5jZS4KCkFzIHRoZSAxOjEgbWFwcGluZyBjYW4gYmUgYW55d2hlcmUgaW4gdGhlIG1lbW9yeSwg
aXQgaXMgZWFzaWVyIHRvIHJlbW92ZQphbGwgdGhlIGVudHJpZXMgYWRkZWQgYXMgc29vbiBhcyB0
aGUgMToxIG1hcHBpbmcgaXMgbm90IHVzZWQgcmF0aGVyIHRoYW4KYWRkaW5nIHRoZSBCcmVhay1C
ZWZvcmUtTWFrZSBzZXF1ZW5jZSBldmVyeXdoZXJlLgoKSXQgaXMgZGlmZmljdWx0IHRvIHRyYWNr
IHdoZXJlIGV4YWN0bHkgdGhlIDE6MSBtYXBwaW5nIHdhcyBjcmVhdGVkCndpdGhvdXQgYSBmdWxs
IHJld29yayBvZiBjcmVhdGVfcGFnZV90YWJsZXMoKS4gSW5zdGVhZCwgaW50cm9kdWNlIGEgbmV3
CmZ1bmN0aW9uIHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKCkgd2lsbCBsb29rIHdoZXJlIGlzIHRo
ZSB0b3AtbGV2ZWwgZW50cnkKZm9yIHRoZSAxOjEgbWFwcGluZyBhbmQgcmVtb3ZlIGl0LgoKVGhl
IG5ldyBmdW5jdGlvbiBpcyBvbmx5IGNhbGxlZCBmb3IgdGhlIGJvb3QgQ1BVLiBTZWNvbmRhcnkg
Q1BVcyB3aWxsCnN3aXRjaCBkaXJlY3RseSB0byB0aGUgcnVudGltZSBwYWdlLXRhYmxlcyBzbyB0
aGVyZSBhcmUgbm8gbmVlZCB0bwpyZW1vdmUgdGhlIDE6MSBtYXBwaW5nLiBOb3RlIHRoYXQgdGhp
cyBzdGlsbCBkb2Vzbid0IG1ha2UgdGhlIFNlY29uZGFyeQpDUFVzIHBhdGggc2FmZSBidXQgaXQg
aXMgbm90IG1ha2luZyBpdCB3b3JzdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIEl0IGlzIHZlcnkgbGlrZWx5IHdlIHdpbGwgbmVl
ZCB0byByZS1pbnRyb2R1Y2UgdGhlIDE6MSBtYXBwaW5nIHRvIGNhdGVyCiAgICBzZWNvbmRhcnkg
Q1BVcyBib290IGFuZCBzdXNwZW5kL3Jlc3VtZS4gRm9yIG5vdywgdGhlIGF0dGVtcHQgaXMgdG8g
bWFrZQogICAgYm9vdCBDUFUgcGF0aCBmdWxseSBBcm0gQXJtIGNvbXBsaWFudC4KCiAgICBDaGFu
Z2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TIHwgODAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMy
L2hlYWQuUwppbmRleCAwYTVjM2E4NTI1Li41NmUyZDA5ZWQ0IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTE1
OCw2ICsxNTgsMTMgQEAgcGFzdF96SW1hZ2U6CiAgICAgICAgIGxkciAgIHIwLCA9cHJpbWFyeV9z
d2l0Y2hlZAogICAgICAgICBtb3YgICBwYywgcjAKIHByaW1hcnlfc3dpdGNoZWQ6CisgICAgICAg
IC8qCisgICAgICAgICAqIFRoZSAxOjEgbWFwIG1heSBjbGFzaCB3aXRoIG90aGVyIHBhcnRzIG9m
IHRoZSBYZW4gdmlydHVhbCBtZW1vcnkKKyAgICAgICAgICogbGF5b3V0LiBBcyBpdCBpcyBub3Qg
dXNlZCBhbnltb3JlLCByZW1vdmUgaXQgY29tcGxldGVseSB0bworICAgICAgICAgKiBhdm9pZCBo
YXZpbmcgdG8gd29ycnkgYWJvdXQgcmVwbGFjaW5nIGV4aXN0aW5nIG1hcHBpbmcKKyAgICAgICAg
ICogYWZ0ZXJ3YXJkcy4KKyAgICAgICAgICovCisgICAgICAgIGJsICAgIHJlbW92ZV9pZGVudGl0
eV9tYXBwaW5nCiAgICAgICAgIGJsICAgIHNldHVwX2ZpeG1hcAogI2lmZGVmIENPTkZJR19FQVJM
WV9QUklOVEsKICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUg
VUFSVC4gKi8KQEAgLTQ3NCwxMiArNDgxLDYyIEBAIGVuYWJsZV9tbXU6CiAgICAgICAgIG1vdiAg
IHBjLCBscgogRU5EUFJPQyhlbmFibGVfbW11KQogCi1zZXR1cF9maXhtYXA6CisvKgorICogUmVt
b3ZlIHRoZSAxOjEgbWFwIGZvciB0aGUgcGFnZS10YWJsZXMuIEl0IGlzIG5vdCBlYXN5IHRvIGtl
ZXAgdHJhY2sKKyAqIHdoZXJlIHRoZSAxOjEgbWFwIHdhcyBtYXBwZWQsIHNvIHdlIHdpbGwgbG9v
ayBmb3IgdGhlIHRvcC1sZXZlbCBlbnRyeQorICogZXhjbHVzaXZlIHRvIHRoZSAxOjEgbWFwIGFu
ZCByZW1vdmUgaXQuCisgKgorICogSW5wdXRzOgorICogICByOSA6IHBhZGRyKHN0YXJ0KQorICoK
KyAqIENsb2JiZXJzIHIwIC0gcjMKKyAqLworcmVtb3ZlX2lkZW50aXR5X21hcHBpbmc6CisgICAg
ICAgIC8qIHIyOnIzIDo9IGludmFsaWQgcGFnZS10YWJsZSBlbnRyeSAqLworICAgICAgICBtb3Yg
ICByMiwgIzB4MAorICAgICAgICBtb3YgICByMywgIzB4MAogICAgICAgICAvKgotICAgICAgICAg
KiBOb3cgd2UgY2FuIGluc3RhbGwgdGhlIGZpeG1hcCBhbmQgZHRiIG1hcHBpbmdzLCBzaW5jZSB3
ZQotICAgICAgICAgKiBkb24ndCBuZWVkIHRoZSAxOjEgbWFwIGFueSBtb3JlCisgICAgICAgICAq
IEZpbmQgdGhlIGZpcnN0IHNsb3QgdXNlZC4gUmVtb3ZlIHRoZSBlbnRyeSBmb3IgdGhlIGZpcnN0
CisgICAgICAgICAqIHRhYmxlIGlmIHRoZSBzbG90IGlzIG5vdCAwLiBGb3Igc2xvdCAwLCB0aGUg
MToxIG1hcHBpbmcgd2FzCisgICAgICAgICAqIGRvbmUgaW4gdGhlIHNlY29uZCB0YWJsZS4KICAg
ICAgICAgICovCi0gICAgICAgIGRzYgorICAgICAgICBsc3IgICByMSwgcjksICNGSVJTVF9TSElG
VAorICAgICAgICBtb3ZfdyByMCwgTFBBRV9FTlRSWV9NQVNLCisgICAgICAgIGFuZHMgIHIxLCBy
MSwgcjAgICAgICAgICAgICAgLyogcjEgOj0gZmlyc3Qgc2xvdCAqLworICAgICAgICBiZXEgICAx
ZgorICAgICAgICAvKiBJdCBpcyBub3QgaW4gc2xvdCAwLCByZW1vdmUgdGhlIGVudHJ5ICovCisg
ICAgICAgIGxkciAgIHIwLCA9Ym9vdF9wZ3RhYmxlICAgICAgLyogcjAgOj0gcm9vdCB0YWJsZSAq
LworICAgICAgICBsc2wgICByMSwgcjEsICMzICAgICAgICAgICAgIC8qIHIxIDo9IFNsb3Qgb2Zm
c2V0ICovCisgICAgICAgIHN0cmQgIHIyLCByMywgW3IwLCByMV0KKyAgICAgICAgYiAgICAgaWRl
bnRpdHlfbWFwcGluZ19yZW1vdmVkCisKKzE6CisgICAgICAgIC8qCisgICAgICAgICAqIEZpbmQg
dGhlIHNlY29uZCBzbG90IHVzZWQuIFJlbW92ZSB0aGUgZW50cnkgZm9yIHRoZSBmaXJzdAorICAg
ICAgICAgKiB0YWJsZSBpZiB0aGUgc2xvdCBpcyBub3QgMSAocnVudGltZSBYZW4gbWFwcGluZyBp
cyAyTSAtIDRNKS4KKyAgICAgICAgICogRm9yIHNsb3QgMSwgaXQgbWVhbnMgdGhlIDE6MSBtYXBw
aW5nIHdhcyBub3QgY3JlYXRlZC4KKyAgICAgICAgICovCisgICAgICAgIGxzciAgIHIxLCByOSwg
I1NFQ09ORF9TSElGVAorICAgICAgICBtb3ZfdyByMCwgTFBBRV9FTlRSWV9NQVNLCisgICAgICAg
IGFuZCAgIHIxLCByMSwgcjAgICAgICAgICAgICAgLyogcjEgOj0gc2Vjb25kIHNsb3QgKi8KKyAg
ICAgICAgY21wICAgcjEsICMxCisgICAgICAgIGJlcSAgIGlkZW50aXR5X21hcHBpbmdfcmVtb3Zl
ZAorICAgICAgICAvKiBJdCBpcyBub3QgaW4gc2xvdCAxLCByZW1vdmUgdGhlIGVudHJ5ICovCisg
ICAgICAgIGxkciAgIHIwLCA9Ym9vdF9zZWNvbmQgICAgICAgLyogcjAgOj0gc2Vjb25kIHRhYmxl
ICovCisgICAgICAgIGxzbCAgIHIxLCByMSwgIzMgICAgICAgICAgICAgLyogcjEgOj0gU2xvdCBv
ZmZzZXQgKi8KKyAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjAsIHIxXQorCitpZGVudGl0eV9tYXBw
aW5nX3JlbW92ZWQ6CisgICAgICAgIC8qIFNlZSBhc20tYXJtL2FybTMyL2ZsdXNodGxiLmggZm9y
IHRoZSBleHBsYW5hdGlvbiBvZiB0aGUgc2VxdWVuY2UuICovCisgICAgICAgIGRzYiAgIG5zaHN0
CisgICAgICAgIG1jciAgIENQMzIocjAsIFRMQklBTExIKQorICAgICAgICBkc2IgICBuc2gKKyAg
ICAgICAgaXNiCisKKyAgICAgICAgbW92ICAgcGMsIGxyCitFTkRQUk9DKHJlbW92ZV9pZGVudGl0
eV9tYXBwaW5nKQorCitzZXR1cF9maXhtYXA6CiAjaWYgZGVmaW5lZChDT05GSUdfRUFSTFlfUFJJ
TlRLKSAvKiBGaXhtYXAgaXMgb25seSB1c2VkIGJ5IGVhcmx5IHByaW50ayAqLwogICAgICAgICAv
KiBBZGQgVUFSVCB0byB0aGUgZml4bWFwIHRhYmxlICovCiAgICAgICAgIGxkciAgIHIxLCA9eGVu
X2ZpeG1hcCAgICAgICAgLyogcjEgOj0gdmFkZHIgKHhlbl9maXhtYXApICovCkBAIC01MDEsMTkg
KzU1OCwxMCBAQCBzZXR1cF9maXhtYXA6CiAgICAgICAgIG1vdiAgIHI0LCByNCwgbHNyICMoU0VD
T05EX1NISUZUIC0gMykgICAvKiByNCA6PSBTbG90IGZvciBGSVhNQVAoMCkgKi8KICAgICAgICAg
bW92ICAgcjMsICMweDAKICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjEsIHI0XSAgICAgICAvKiBN
YXAgaXQgaW4gdGhlIGZpeG1hcCdzIHNsb3QgKi8KLSNlbmRpZgotCi0gICAgICAgIC8qCi0gICAg
ICAgICAqIEZsdXNoIHRoZSBUTEIgaW4gY2FzZSB0aGUgMToxIG1hcHBpbmcgaGFwcGVucyB0byBj
bGFzaCB3aXRoCi0gICAgICAgICAqIHRoZSB2aXJ0dWFsIGFkZHJlc3NlcyB1c2VkIGJ5IHRoZSBm
aXhtYXAgb3IgRFRCLgotICAgICAgICAgKi8KLSAgICAgICAgZHNiICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBFbnN1cmUgYW55IHBhZ2UgdGFibGUgdXBkYXRlcyBtYWRlIGFib3ZlCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogaGF2ZSBvY2N1cnJlZC4gKi8KIAot
ICAgICAgICBpc2IKLSAgICAgICAgbWNyICAgQ1AzMihyMCwgVExCSUFMTEgpICAgICAvKiBGbHVz
aCBoeXBlcnZpc29yIFRMQiAqLwotICAgICAgICBkc2IgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qIEVuc3VyZSBjb21wbGV0aW9uIG9mIFRMQiBmbHVzaCAqLwotICAgICAgICBpc2IKKyAgICAg
ICAgLyogRW5zdXJlIGFueSBwYWdlIHRhYmxlIHVwZGF0ZXMgbWFkZSBhYm92ZSBoYXZlIG9jY3Vy
cmVkLiAqLworICAgICAgICBkc2IgICBuc2hzdAorI2VuZGlmCiAgICAgICAgIG1vdiAgIHBjLCBs
cgogRU5EUFJPQyhzZXR1cF9maXhtYXApCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
