Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE61C8D3
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWal-0005L3-ET; Tue, 14 May 2019 12:31:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWaj-0005Kr-Vd
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:34 +0000
X-Inumbo-ID: 34e55125-7644-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 34e55125-7644-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:31:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B456815AB;
 Tue, 14 May 2019 05:31:32 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80F4A3F71E;
 Tue, 14 May 2019 05:31:31 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:14 +0100
Message-Id: <20190514123125.29086-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514123125.29086-1-julien.grall@arm.com>
References: <20190514123125.29086-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART3 v2 01/12] xen/arm: lpae: Add a macro to
 generate offsets from an address
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGZldyBwbGFjZXMgcmVxdWlyaW5nIHRvIGdlbmVyYXRlIG9mZnNldHMgZnJvbSBh
biBhZGRyZXNzLgpSYXRoZXIgdGhhbiBvcGVuLWNvZGluZyBldmVyeXdoZXJlLCB3ZSBjYW4gaW50
cm9kdWNlIGEgbWFjcm8gdG8gZG8gdGhlCmpvYiBmb3IgdXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNv
diA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAg
ICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQotLS0KIHhlbi9hcmNoL2FybS9wMm0uYyAgICAg
ICAgIHwgMjMgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vbHBh
ZS5oIHwgIDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNo
L2FybS9wMm0uYwppbmRleCA5MmMyNDEzZjIwLi4wNmZhMzQyYThmIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCkBAIC0zNjgsMTIgKzM2OCw3
IEBAIG1mbl90IHAybV9nZXRfZW50cnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgZ2ZuX3QgZ2Zu
LAogICAgIHAybV90eXBlX3QgX3Q7CiAKICAgICAvKiBDb252ZW5pZW5jZSBhbGlhc2VzICovCi0g
ICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNldHNbNF0gPSB7Ci0gICAgICAgIHplcm9ldGhfdGFi
bGVfb2Zmc2V0KGFkZHIpLAotICAgICAgICBmaXJzdF90YWJsZV9vZmZzZXQoYWRkciksCi0gICAg
ICAgIHNlY29uZF90YWJsZV9vZmZzZXQoYWRkciksCi0gICAgICAgIHRoaXJkX3RhYmxlX29mZnNl
dChhZGRyKQotICAgIH07CisgICAgREVDTEFSRV9PRkZTRVRTKG9mZnNldHMsIGFkZHIpOwogCiAg
ICAgQVNTRVJUKHAybV9pc19sb2NrZWQocDJtKSk7CiAgICAgQlVJTERfQlVHX09OKFRISVJEX01B
U0sgIT0gUEFHRV9NQVNLKTsKQEAgLTg4OCw3ICs4ODMsNiBAQCBzdGF0aWMgaW50IF9fcDJtX3Nl
dF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcDJtX3R5cGVfdCB0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2FjY2Vzc190
IGEpCiB7Ci0gICAgcGFkZHJfdCBhZGRyID0gZ2ZuX3RvX2dhZGRyKHNnZm4pOwogICAgIHVuc2ln
bmVkIGludCBsZXZlbCA9IDA7CiAgICAgdW5zaWduZWQgaW50IHRhcmdldCA9IDMgLSAocGFnZV9v
cmRlciAvIExQQUVfU0hJRlQpOwogICAgIGxwYWVfdCAqZW50cnksICp0YWJsZSwgb3JpZ19wdGU7
CkBAIC04OTcsMTIgKzg5MSw3IEBAIHN0YXRpYyBpbnQgX19wMm1fc2V0X2VudHJ5KHN0cnVjdCBw
Mm1fZG9tYWluICpwMm0sCiAgICAgYm9vbCByZW1vdmluZ19tYXBwaW5nID0gbWZuX2VxKHNtZm4s
IElOVkFMSURfTUZOKTsKIAogICAgIC8qIENvbnZlbmllbmNlIGFsaWFzZXMgKi8KLSAgICBjb25z
dCB1bnNpZ25lZCBpbnQgb2Zmc2V0c1s0XSA9IHsKLSAgICAgICAgemVyb2V0aF90YWJsZV9vZmZz
ZXQoYWRkciksCi0gICAgICAgIGZpcnN0X3RhYmxlX29mZnNldChhZGRyKSwKLSAgICAgICAgc2Vj
b25kX3RhYmxlX29mZnNldChhZGRyKSwKLSAgICAgICAgdGhpcmRfdGFibGVfb2Zmc2V0KGFkZHIp
Ci0gICAgfTsKKyAgICBERUNMQVJFX09GRlNFVFMob2Zmc2V0cywgZ2ZuX3RvX2dhZGRyKHNnZm4p
KTsKIAogICAgIEFTU0VSVChwMm1faXNfd3JpdGVfbG9ja2VkKHAybSkpOwogCkBAIC0xMTk5LDE1
ICsxMTg4LDkgQEAgYm9vbCBwMm1fcmVzb2x2ZV90cmFuc2xhdGlvbl9mYXVsdChzdHJ1Y3QgZG9t
YWluICpkLCBnZm5fdCBnZm4pCiAgICAgdW5zaWduZWQgaW50IGxldmVsID0gMDsKICAgICBib29s
IHJlc29sdmVkID0gZmFsc2U7CiAgICAgbHBhZV90IGVudHJ5LCAqdGFibGU7Ci0gICAgcGFkZHJf
dCBhZGRyID0gZ2ZuX3RvX2dhZGRyKGdmbik7CiAKICAgICAvKiBDb252ZW5pZW5jZSBhbGlhc2Vz
ICovCi0gICAgY29uc3QgdW5zaWduZWQgaW50IG9mZnNldHNbNF0gPSB7Ci0gICAgICAgIHplcm9l
dGhfdGFibGVfb2Zmc2V0KGFkZHIpLAotICAgICAgICBmaXJzdF90YWJsZV9vZmZzZXQoYWRkciks
Ci0gICAgICAgIHNlY29uZF90YWJsZV9vZmZzZXQoYWRkciksCi0gICAgICAgIHRoaXJkX3RhYmxl
X29mZnNldChhZGRyKQotICAgIH07CisgICAgREVDTEFSRV9PRkZTRVRTKG9mZnNldHMsIGdmbl90
b19nYWRkcihnZm4pKTsKIAogICAgIHAybV93cml0ZV9sb2NrKHAybSk7CiAKZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbHBhZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9scGFlLmgK
aW5kZXggNTQ1YjBjOGYyNC4uYzIyNzgwZjhmMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9scGFlLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9scGFlLmgKQEAgLTIxOCw2ICsy
MTgsMTUgQEAgVEFCTEVfT0ZGU0VUX0hFTFBFUlMoNjQpOwogI3VuZGVmIFRBQkxFX09GRlNFVAog
I3VuZGVmIFRBQkxFX09GRlNFVF9IRUxQRVJTCiAKKy8qIEdlbmVyYXRlIGFuIGFycmF5IEB2YXIg
Y29udGFpbmluZyB0aGUgb2Zmc2V0IGZvciBlYWNoIGxldmVsIGZyb20gQGFkZHIgKi8KKyNkZWZp
bmUgREVDTEFSRV9PRkZTRVRTKHZhciwgYWRkcikgICAgICAgICAgXAorICAgIGNvbnN0IHVuc2ln
bmVkIGludCB2YXJbNF0gPSB7ICAgICAgICAgICBcCisgICAgICAgIHplcm9ldGhfdGFibGVfb2Zm
c2V0KGFkZHIpLCAgICAgICAgIFwKKyAgICAgICAgZmlyc3RfdGFibGVfb2Zmc2V0KGFkZHIpLCAg
ICAgICAgICAgXAorICAgICAgICBzZWNvbmRfdGFibGVfb2Zmc2V0KGFkZHIpLCAgICAgICAgICBc
CisgICAgICAgIHRoaXJkX3RhYmxlX29mZnNldChhZGRyKSAgICAgICAgICAgIFwKKyAgICB9CisK
ICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KIAogLyoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
