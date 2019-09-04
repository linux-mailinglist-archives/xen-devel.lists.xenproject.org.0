Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA0DA8590
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5W9C-0000VH-KH; Wed, 04 Sep 2019 14:20:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mPyZ=W7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5W9B-0000VC-7z
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:20:33 +0000
X-Inumbo-ID: 2723befe-cf1f-11e9-a337-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2723befe-cf1f-11e9-a337-bc764e2007e4;
 Wed, 04 Sep 2019 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567606832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZYX6wYx4qjiZh95p+nP0xj1a/b2Xi2vHwwmYJ0nSRQM=;
 b=QvrH0Wqc47p9LauGtFEa6POt0tDtnOYeTCfj22vSiwZznrIJxuHNrOK9
 BswAIuDkhcXJOVeD3B3Uv7T+rj68b8FU5B7XRxrWrtryRLdunip19e0Y9
 l8IypwX5H7gXfkSatvEyL+5TixdMFddVyuXJf4SNmhsO//hG6MLhdzlAg k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DLwzWs2bUOUrmz+ynIBA2ytAyJN8gCbOZtLFRg+9YefDezheUMUNgQ/I99ERjQiPlHREvR91fs
 RMIhRPV/10efT2OQJwBiEW31cOtZ4DmpA3vx8pTE2CKntivsujuTicjxikV7lkPRZ1+Vpn3++d
 f3RnLqE5OEwVk6hU1jwdxOSXNaGFEoORUwHsXquNuHhW/+XpfZbdq33KkBOAjC0aWiwVFswA5b
 rl2Wxwm+6e9tTE/2sUN/7E+rVe1FObF8Nvjod90lVGQMw+E9+ove7KTVfMTfWgkyuk4j99OOBX
 d60=
X-SBRS: 2.7
X-MesageID: 5392662
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5392662"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Sep 2019 16:20:26 +0200
Message-ID: <20190904142026.9946-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] p2m/ept: add _subtree suffix to
 ept_invalidate_emt
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U28gdGhhdCB0aGUgbmFtZSBpbXBsaWVzIHRoZSBmdW5jdGlvbiBpcyB1c2VkIHRvIHdhbGsgdGhl
IHBhZ2UgdGFibGUKcG9pbnRlciBwYXNzZWQgYXMgcGFyYW1ldGVyLiBEcm9wIHRoZSBwYXJlbnRf
IHByZWZpeCBmcm9tIHRoZSBsZXZlbApwYXJhbWV0ZXIsIHNpbmNlIHRoZSBsZXZlbCBwYXNzZWQg
aXMgdGhlIG9uZSBtYXRjaGluZyB0aGUgRVBUIGVudHJ5CnBhc3NlZCBpbiB0aGUgbWZuIHBhcmFt
ZXRlci4KCldoaWxlIHRoZXJlIGFsc28gY2hhbmdlIGJvb2xfdCB0byBib29sIGFuZCBhZGQgYW4g
YXNzZXJ0IHRvIG1ha2Ugc3VyZQpubyBsZXZlbCAwIGVudHJpZXMgKGllOiA0SyBFUFQgbGVhZiBl
bnRyaWVzKSBhcmUgcGFzc2VkIGFzIHBhcmFtZXRlcnMuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBp
bnRlbmRlZC4KClN1Z2dlc3RlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgfCAyNCArKysrKysrKysrKysrKystLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYvbW0vcDJt
LWVwdC5jCmluZGV4IDk1MmViYWQ4MmYuLmQwZTYyOTA1ZjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0tZXB0LmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwpAQCAtMzQ4
LDEzICszNDgsMTkgQEAgc3RhdGljIGludCBlcHRfbmV4dF9sZXZlbChzdHJ1Y3QgcDJtX2RvbWFp
biAqcDJtLCBib29sX3QgcmVhZF9vbmx5LAogICogcHJlc2VudCBlbnRyaWVzIGluIHRoZSBnaXZl
biBwYWdlIHRhYmxlLCBvcHRpb25hbGx5IG1hcmtpbmcgdGhlIGVudHJpZXMKICAqIGFsc28gZm9y
IHRoZWlyIHN1YnRyZWVzIG5lZWRpbmcgUDJNIHR5cGUgcmUtY2FsY3VsYXRpb24uCiAgKi8KLXN0
YXRpYyBib29sX3QgZXB0X2ludmFsaWRhdGVfZW10KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIG1m
bl90IG1mbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2xfdCByZWNhbGMs
IHVuc2lnbmVkIGludCBwYXJlbnRfbGV2ZWwpCitzdGF0aWMgYm9vbCBlcHRfaW52YWxpZGF0ZV9l
bXRfc3VidHJlZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBtZm5fdCBtZm4sCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHJlY2FsYywgdW5zaWduZWQgaW50IGxl
dmVsKQogewogICAgIGludCByYzsKICAgICBlcHRfZW50cnlfdCAqZXB0ZSA9IG1hcF9kb21haW5f
cGFnZShtZm4pOwogICAgIHVuc2lnbmVkIGludCBpOwotICAgIGJvb2xfdCBjaGFuZ2VkID0gMDsK
KyAgICBib29sIGNoYW5nZWQgPSBmYWxzZTsKKworICAgIGlmICggIWxldmVsICkKKyAgICB7Cisg
ICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gZmFsc2U7CisgICAg
fQogCiAgICAgZm9yICggaSA9IDA7IGkgPCBFUFRfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCiAg
ICAgewpAQCAtMzY3LDkgKzM3Myw5IEBAIHN0YXRpYyBib29sX3QgZXB0X2ludmFsaWRhdGVfZW10
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIG1mbl90IG1mbiwKICAgICAgICAgZS5lbXQgPSBNVFJS
X05VTV9UWVBFUzsKICAgICAgICAgaWYgKCByZWNhbGMgKQogICAgICAgICAgICAgZS5yZWNhbGMg
PSAxOwotICAgICAgICByYyA9IGF0b21pY193cml0ZV9lcHRfZW50cnkocDJtLCAmZXB0ZVtpXSwg
ZSwgcGFyZW50X2xldmVsIC0gMSk7CisgICAgICAgIHJjID0gYXRvbWljX3dyaXRlX2VwdF9lbnRy
eShwMm0sICZlcHRlW2ldLCBlLCBsZXZlbCAtIDEpOwogICAgICAgICBBU1NFUlQocmMgPT0gMCk7
Ci0gICAgICAgIGNoYW5nZWQgPSAxOworICAgICAgICBjaGFuZ2VkID0gdHJ1ZTsKICAgICB9CiAK
ICAgICB1bm1hcF9kb21haW5fcGFnZShlcHRlKTsKQEAgLTM3OCw3ICszODQsNyBAQCBzdGF0aWMg
Ym9vbF90IGVwdF9pbnZhbGlkYXRlX2VtdChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBtZm5fdCBt
Zm4sCiB9CiAKIC8qCi0gKiBKdXN0IGxpa2UgZXB0X2ludmFsaWRhdGVfZW10KCkgZXhjZXB0IHRo
YXQKKyAqIEp1c3QgbGlrZSBlcHRfaW52YWxpZGF0ZV9lbXRfc3VidHJlZSgpIGV4Y2VwdCB0aGF0
CiAgKiAtIG5vdCBhbGwgZW50cmllcyBhdCB0aGUgdGFyZ2V0ZWQgbGV2ZWwgbWF5IG5lZWQgcHJv
Y2Vzc2luZywKICAqIC0gdGhlIHJlLWNhbGN1bGF0aW9uIGZsYWcgZ2V0cyBhbHdheXMgc2V0Lgog
ICogVGhlIHBhc3NlZCBpbiByYW5nZSBpcyBndWFyYW50ZWVkIHRvIG5vdCBjcm9zcyBhIHBhZ2Ug
KHRhYmxlKQpAQCAtNTc0LDcgKzU4MCw3IEBAIHN0YXRpYyBpbnQgcmVzb2x2ZV9taXNjb25maWco
c3RydWN0IHAybV9kb21haW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm4pCiAgICAgICAgIGlmICgg
ZS5lbXQgPT0gTVRSUl9OVU1fVFlQRVMgKQogICAgICAgICB7CiAgICAgICAgICAgICBBU1NFUlQo
aXNfZXB0ZV9wcmVzZW50KCZlKSk7Ci0gICAgICAgICAgICBlcHRfaW52YWxpZGF0ZV9lbXQocDJt
LCBfbWZuKGUubWZuKSwgZS5yZWNhbGMsIGxldmVsKTsKKyAgICAgICAgICAgIGVwdF9pbnZhbGlk
YXRlX2VtdF9zdWJ0cmVlKHAybSwgX21mbihlLm1mbiksIGUucmVjYWxjLCBsZXZlbCk7CiAgICAg
ICAgICAgICBzbXBfd21iKCk7CiAgICAgICAgICAgICBlLmVtdCA9IDA7CiAgICAgICAgICAgICBl
LnJlY2FsYyA9IDA7CkBAIC0xMDA2LDcgKzEwMTIsNyBAQCBzdGF0aWMgdm9pZCBlcHRfY2hhbmdl
X2VudHJ5X3R5cGVfZ2xvYmFsKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCiAgICAgaWYgKCAhbWZu
ICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgaWYgKCBlcHRfaW52YWxpZGF0ZV9lbXQocDJtLCBf
bWZuKG1mbiksIDEsIHAybS0+ZXB0LndsKSApCisgICAgaWYgKCBlcHRfaW52YWxpZGF0ZV9lbXRf
c3VidHJlZShwMm0sIF9tZm4obWZuKSwgMSwgcDJtLT5lcHQud2wpICkKICAgICAgICAgZXB0X3N5
bmNfZG9tYWluKHAybSk7CiB9CiAKQEAgLTEwNjQsNyArMTA3MCw3IEBAIHN0YXRpYyB2b2lkIGVw
dF9tZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCiAgICAgaWYgKCAh
bWZuICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgaWYgKCBlcHRfaW52YWxpZGF0ZV9lbXQocDJt
LCBfbWZuKG1mbiksIDAsIHAybS0+ZXB0LndsKSApCisgICAgaWYgKCBlcHRfaW52YWxpZGF0ZV9l
bXRfc3VidHJlZShwMm0sIF9tZm4obWZuKSwgMCwgcDJtLT5lcHQud2wpICkKICAgICAgICAgZXB0
X3N5bmNfZG9tYWluKHAybSk7CiB9CiAKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
