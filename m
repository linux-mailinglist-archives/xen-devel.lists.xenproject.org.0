Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC60A83C5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VKS-0001Zm-BT; Wed, 04 Sep 2019 13:28:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5VKR-0001ZR-01
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:28:07 +0000
X-Inumbo-ID: d35957b8-cf17-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d35957b8-cf17-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 13:28:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93F93B0E5;
 Wed,  4 Sep 2019 13:28:04 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <050de29e-5a10-8b4a-44f1-0241f4b33ee2@suse.com>
Message-ID: <959e3395-4637-6e9b-74dc-9982acf10dec@suse.com>
Date: Wed, 4 Sep 2019 15:28:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <050de29e-5a10-8b4a-44f1-0241f4b33ee2@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/3] VT-d/ATS: tidy device_in_domain()
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIGFwcHJvcHJpYXRlIHR5cGVzLiBEcm9wIHVubmVjZXNzYXJ5IGNhc3RzLiBDaGVjayBmb3Ig
ZmFpbHVyZXMgd2hpY2gKY2FuIChhdCBsZWFzdCBpbiB0aGVvcnkgYmVjYXVzZSBvZiBub24tb2J2
aW91cyBicmVha2FnZSBlbHNld2hlcmUpCm9jY3VyLCBpbnN0ZWFkIG9mIG9uZXMgd2hpY2ggcmVh
bGx5IGNhbid0IChtYXBfZG9tYWluX3BhZ2UoKSB3b24ndApyZXR1cm4gTlVMTCkuCgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQveDg2L2F0cy5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC94ODYvYXRzLmMKQEAgLTcxLDIzICs3MSwyNSBAQCBpbnQgYXRzX2RldmljZShjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRlCiAgICAgcmV0dXJuIHBvczsKIH0KIAotc3RhdGljIGludCBkZXZp
Y2VfaW5fZG9tYWluKGNvbnN0IHN0cnVjdCBpb21tdSAqaW9tbXUsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHUxNiBkaWQpCitzdGF0aWMg
Ym9vbCBkZXZpY2VfaW5fZG9tYWluKGNvbnN0IHN0cnVjdCBpb21tdSAqaW9tbXUsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZf
dCBkaWQpCiB7Ci0gICAgc3RydWN0IHJvb3RfZW50cnkgKnJvb3RfZW50cnkgPSBOVUxMOworICAg
IHN0cnVjdCByb290X2VudHJ5ICpyb290X2VudHJ5OwogICAgIHN0cnVjdCBjb250ZXh0X2VudHJ5
ICpjdHh0X2VudHJ5ID0gTlVMTDsKLSAgICBpbnQgdHQsIGZvdW5kID0gMDsKKyAgICB1bnNpZ25l
ZCBpbnQgdHQ7CisgICAgYm9vbCBmb3VuZCA9IGZhbHNlOwogCi0gICAgcm9vdF9lbnRyeSA9IChz
dHJ1Y3Qgcm9vdF9lbnRyeSAqKSBtYXBfdnRkX2RvbWFpbl9wYWdlKGlvbW11LT5yb290X21hZGRy
KTsKLSAgICBpZiAoICFyb290X2VudHJ5IHx8ICFyb290X3ByZXNlbnQocm9vdF9lbnRyeVtwZGV2
LT5idXNdKSApCi0gICAgICAgIGdvdG8gb3V0OwotCi0gICAgY3R4dF9lbnRyeSA9IChzdHJ1Y3Qg
Y29udGV4dF9lbnRyeSAqKQotICAgICAgICAgICAgICAgICBtYXBfdnRkX2RvbWFpbl9wYWdlKHJv
b3RfZW50cnlbcGRldi0+YnVzXS52YWwpOworICAgIGlmICggdW5saWtlbHkoIWlvbW11LT5yb290
X21hZGRyKSApCisgICAgeworICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAgICAgICAg
cmV0dXJuIGZhbHNlOworICAgIH0KIAotICAgIGlmICggY3R4dF9lbnRyeSA9PSBOVUxMICkKKyAg
ICByb290X2VudHJ5ID0gbWFwX3Z0ZF9kb21haW5fcGFnZShpb21tdS0+cm9vdF9tYWRkcik7Cisg
ICAgaWYgKCAhcm9vdF9wcmVzZW50KHJvb3RfZW50cnlbcGRldi0+YnVzXSkgKQogICAgICAgICBn
b3RvIG91dDsKIAorICAgIGN0eHRfZW50cnkgPSBtYXBfdnRkX2RvbWFpbl9wYWdlKHJvb3RfZW50
cnlbcGRldi0+YnVzXS52YWwpOwogICAgIGlmICggY29udGV4dF9kb21haW5faWQoY3R4dF9lbnRy
eVtwZGV2LT5kZXZmbl0pICE9IGRpZCApCiAgICAgICAgIGdvdG8gb3V0OwogCkBAIC05NSw3ICs5
Nyw3IEBAIHN0YXRpYyBpbnQgZGV2aWNlX2luX2RvbWFpbihjb25zdCBzdHJ1Y3QKICAgICBpZiAo
IHR0ICE9IENPTlRFWFRfVFRfREVWX0lPVExCICkKICAgICAgICAgZ290byBvdXQ7CiAKLSAgICBm
b3VuZCA9IDE7CisgICAgZm91bmQgPSB0cnVlOwogb3V0OgogICAgIGlmICggcm9vdF9lbnRyeSAp
CiAgICAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShyb290X2VudHJ5KTsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
