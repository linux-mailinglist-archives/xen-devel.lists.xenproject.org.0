Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726ABBFBB3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 01:15:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDcvZ-0004lB-M2; Thu, 26 Sep 2019 23:12:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDcvX-0004jj-U2
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 23:11:59 +0000
X-Inumbo-ID: 05517532-e0b3-11e9-9665-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 05517532-e0b3-11e9-9665-12813bfff9fa;
 Thu, 26 Sep 2019 23:11:50 +0000 (UTC)
Received: from localhost.localdomain (c-67-164-102-47.hsd1.ca.comcast.net
 [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADC25208C3;
 Thu, 26 Sep 2019 23:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569539510;
 bh=oG0T9Vx5x/5R795OokcFHqDSkdTq3KNQFmwl1d1MI2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0KpEi38tIf9jIu0namAvzdTpw0HNjuih6FFK2UKBZLY7FZwYocjFnf1Cb5juCP5SK
 gXj8Zcq8j/ioOz1t7GYqigWzbqAeq/EFwtoDWWX5mvz4Azq8yDvmBaeR4rOwb5TKj4
 AZgwGEnsSXQb4U7VJNGWFtslJxMrfdqgQUhRMKQ0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Thu, 26 Sep 2019 16:11:40 -0700
Message-Id: <20190926231144.16297-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v6 4/8] xen/arm: copy dtb fragment to guest dtb
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 andrii_anisov@epam.com, Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVhZCB0aGUgZHRiIGZyYWdtZW50IGNvcnJlc3BvbmRpbmcgdG8gYSBwYXNzdGhyb3VnaCBkZXZp
Y2UgZnJvbSBtZW1vcnkKYXQgdGhlIGxvY2F0aW9uIHJlZmVycmVkIHRvIGJ5IHRoZSAibXVsdGli
b290LGRldmljZS10cmVlIiBjb21wYXRpYmxlCm5vZGUuCgpBZGQgYSBuZXcgZmllbGQgbmFtZWQg
ZHRiX2Jvb3Rtb2R1bGUgdG8gc3RydWN0IGtlcm5lbF9pbmZvIHRvIGtlZXAgdHJhY2sKb2YgdGhl
IGR0YiBmcmFnbWVudCBsb2NhdGlvbi4KCkNvcHkgdGhlIGZyYWdtZW50IHRvIHRoZSBndWVzdCBk
dGIgKG9ubHkgL2FsaWFzZXMgYW5kIC9wYXNzdGhyb3VnaCkuCgpTZXQga2luZm8tPnBoYW5kbGVf
Z2ljIGJhc2VkIG9uIHRoZSBwaGFuZGxlIG9mIHRoZSBzcGVjaWFsICIvZ2ljIgpub2RlIGluIHRo
ZSBkZXZpY2UgdHJlZSBmcmFnbWVudC4gIi9naWMiIGlzIGEgZHVtbXkgbm9kZSBpbiB0aGUgZHRi
CmZyYWdtZW50IHRoYXQgcmVwcmVzZW50cyB0aGUgZ2ljIGludGVycnVwdCBjb250cm9sbGVyLiBP
dGhlciBwcm9wZXJ0aWVzCmluIHRoZSBkdGIgZnJhZ21lbnQgbWlnaHQgcmVmZXIgdG8gaXQgKGZv
ciBpbnN0YW5jZSBpbnRlcnJ1cHQtcGFyZW50IG9mCmEgZGV2aWNlIG5vZGUpLiBXZSByZXVzZSB0
aGUgcGhhbmRsZSBvZiAiL2dpYyIgZnJvbSB0aGUgZHRiIGZyYWdtZW50IGFzCnRoZSBwaGFuZGxl
IG9mIHRoZSBmdWxsIEdJQyBub2RlIHRoYXQgd2lsbCBiZSBjcmVhdGVkIGZvciB0aGUgZ3Vlc3QK
ZGV2aWNlIHRyZWUuIFRoYXQgd2F5LCB3aGVuIHdlIGNvcHkgcHJvcGVydGllcyBmcm9tIHRoZSBk
ZXZpY2UgdHJlZQpmcmFnbWVudCB0byB0aGUgZG9tVSBkZXZpY2UgdHJlZSB0aGUgbGlua3MgcmVt
YWluIHVuYnJva2VuLgoKc2Nhbl9wYXNzdGhyb3VnaF9wcm9wIGlzIGludHJvZHVjZWQgaGVyZSBh
bmQgbm90IHVzZWQgaW4gdGhpcyBwYXRjaCBidXQKaXQgd2lsbCBiZSB1c2VkIGJ5IGxhdGVyIHBh
dGNoZXMuCgpTb21lIG9mIHRoZSBjb2RlIGJlbG93IGlzIHRha2VuIGZyb20gdG9vbHMvbGlieGwv
bGlieGxfYXJtLmMuIE5vdGUgdGhhdAppdCBpcyBPSyB0byB0YWtlIExHUEwgMi4xIGNvZGUgYW5k
IGluY2x1ZGluZyBpdCBpbnRvIGEgR1BMdjIgY29kZSBiYXNlLgpUaGUgcmVzdWx0IGlzIEdQTHYy
IGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlu
eC5jb20+CgotLS0tCkNoYW5nZXMgaW4gdjY6Ci0gY29kZSBzdHlsZQotIGluLWNvZGUgY29tbWVu
dAotIGNvbW1pdCBtZXNzYWdlIGltcHJvdmVtZW50cwoKQ2hhbmdlcyBpbiB2NToKLSBjb2RlIHN0
eWxlCi0gaW4tY29kZSBjb21tZW50Ci0gcmVtb3ZlIGRlcHRoIHBhcmFtZXRlciBmcm9tIHNjYW5f
cGZkdF9ub2RlCi0gZm9yIGluc3RlYWQgb2YgbG9vcCBpbiBkb21haW5faGFuZGxlX2R0Yl9ib290
bW9kdWxlCi0gbW92ZSAiZ2ljIiBjaGVjayB0byBkb21haW5faGFuZGxlX2R0Yl9ib290bW9kdWxl
Ci0gYWRkIGNoZWNrX3BhcnRpYWxfZmR0Ci0gdXNlIERUX1JPT1RfTk9ERV9BRERSL1NJWkVfQ0VM
TFNfREVGQVVMVAotIGFkZCBzY2FuX3Bhc3N0aHJvdWdoX3Byb3AgcGFyYW1ldGVyLCBzZXQgaXQg
dG8gZmFsc2UgZm9yICIvYWxpYXNlcyIKCkNoYW5nZXMgaW4gdjQ6Ci0gdXNlIHJlY3Vyc2lvbiBp
biB0aGUgaW1wbGVtZW50YXRpb24KLSByZW5hbWUgaGFuZGxlX3Byb3BlcnRpZXMgdG8gaGFuZGxl
X3Byb3BfcGZkdAotIHJlbmFtZSBzY2FuX3B0X25vZGUgdG8gc2Nhbl9wZmR0X25vZGUKLSBwYXNz
IGtpbmZvIHRvIGhhbmRsZV9wcm9wZXJ0aWVzCi0gdXNlIHVpbnQzMl90IGluc3RlYWQgb2YgdTMy
Ci0gcmVuYW1lIHIgdG8gcmVzCi0gYWRkICJwYXNzdGhyb3VnaCIgYW5kICJhbGlhc2VzIiBjaGVj
awotIGFkZCBhIG5hbWUgPT0gTlVMTCBjaGVjawotIGNvZGUgc3R5bGUKLSBtb3ZlIERUQiBmcmFn
bWVudCBzY2FubmluZyBlYXJsaWVyLCBiZWZvcmUgRG9tVSBHSUMgbm9kZSBjcmVhdGlvbgotIHNl
dCBndWVzdF9waGFuZGxlX2dpYyBiYXNlZCBvbiAiL2dpYyIKLSBpbi1jb2RlIGNvbW1lbnQKCkNo
YW5nZXMgaW4gdjM6Ci0gc3dpdGNoIHRvIHVzaW5nIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUg
Zm9yIHRoZSBjb3B5CgpDaGFuZ2VzIGluIHYyOgotIGFkZCBhIG5vdGUgYWJvdXQgdGhlIGNvZGUg
Y29taW5nIGZyb20gbGlieGwgaW4gdGhlIGNvbW1pdCBtZXNzYWdlCi0gY29weSAvYWxpYXNlcwot
IGNvZGUgc3R5bGUKLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgIHwgMTY0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5l
bC5oIHwgICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDE2NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IGIyNWFiZThkMDguLjA4ZDZkMjM4ZTMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKQEAgLTE0LDYgKzE0LDcgQEAKICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNz
Lmg+CiAjaW5jbHVkZSA8eGVuL2lvY2FwLmg+CiAjaW5jbHVkZSA8eGVuL2FjcGkuaD4KKyNpbmNs
dWRlIDx4ZW4vdm1hcC5oPgogI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+CiAjaW5jbHVkZSA8YWNw
aS9hY3RhYmxlcy5oPgogI2luY2x1ZGUgPGFzbS9kZXZpY2UuaD4KQEAgLTE2OTgsNiArMTY5OSwx
NTcgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92cGwwMTFfdWFydF9ub2RlKHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8pCiB9CiAjZW5kaWYKIAorc3RhdGljIGludCBfX2luaXQgaGFuZGxlX3By
b3BfcGZkdChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCB2b2lkICpwZmR0LCBpbnQgbm9kZW9mZiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgYWRkcmVzc19jZWxscywgdWludDMyX3Qg
c2l6ZV9jZWxscywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBzY2Fu
X3Bhc3N0aHJvdWdoX3Byb3ApCit7CisgICAgdm9pZCAqZmR0ID0ga2luZm8tPmZkdDsKKyAgICBp
bnQgcHJvcG9mZiwgbmFtZW9mZiwgcmVzOworICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkg
KnByb3A7CisKKyAgICBmb3IgKCBwcm9wb2ZmID0gZmR0X2ZpcnN0X3Byb3BlcnR5X29mZnNldChw
ZmR0LCBub2Rlb2ZmKTsKKyAgICAgICAgICBwcm9wb2ZmID49IDA7CisgICAgICAgICAgcHJvcG9m
ZiA9IGZkdF9uZXh0X3Byb3BlcnR5X29mZnNldChwZmR0LCBwcm9wb2ZmKSApCisgICAgeworICAg
ICAgICBpZiAoICEocHJvcCA9IGZkdF9nZXRfcHJvcGVydHlfYnlfb2Zmc2V0KHBmZHQsIHByb3Bv
ZmYsIE5VTEwpKSApCisgICAgICAgICAgICByZXR1cm4gLUZEVF9FUlJfSU5URVJOQUw7CisKKyAg
ICAgICAgbmFtZW9mZiA9IGZkdDMyX3RvX2NwdShwcm9wLT5uYW1lb2ZmKTsKKyAgICAgICAgcmVz
ID0gZmR0X3Byb3BlcnR5KGZkdCwgZmR0X3N0cmluZyhwZmR0LCBuYW1lb2ZmKSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHByb3AtPmRhdGEsIGZkdDMyX3RvX2NwdShwcm9wLT5sZW4pKTsK
KyAgICAgICAgaWYgKCByZXMgKQorICAgICAgICAgICAgcmV0dXJuIHJlczsKKyAgICB9CisKKyAg
ICAvKiBGRFRfRVJSX05PVEZPVU5EID0+IFRoZXJlIGlzIG5vIG1vcmUgcHJvcGVydGllcyBmb3Ig
dGhpcyBub2RlICovCisgICAgcmV0dXJuICggcHJvcG9mZiAhPSAtRkRUX0VSUl9OT1RGT1VORCAp
ID8gcHJvcG9mZiA6IDA7Cit9CisKK3N0YXRpYyBpbnQgX19pbml0IHNjYW5fcGZkdF9ub2RlKHN0
cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sIGNvbnN0IHZvaWQgKnBmZHQsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgbm9kZW9mZiwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IGFkZHJlc3NfY2VsbHMsIHVpbnQzMl90IHNpemVfY2VsbHMsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHNjYW5fcGFzc3Rocm91Z2hfcHJv
cCkKK3sKKyAgICBpbnQgcmMgPSAwOworICAgIHZvaWQgKmZkdCA9IGtpbmZvLT5mZHQ7CisgICAg
aW50IG5vZGVfbmV4dDsKKworICAgIHJjID0gZmR0X2JlZ2luX25vZGUoZmR0LCBmZHRfZ2V0X25h
bWUocGZkdCwgbm9kZW9mZiwgTlVMTCkpOworICAgIGlmICggcmMgKQorICAgICAgICByZXR1cm4g
cmM7CisKKyAgICByYyA9IGhhbmRsZV9wcm9wX3BmZHQoa2luZm8sIHBmZHQsIG5vZGVvZmYsIGFk
ZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsCisgICAgICAgICAgICAgICAgICAgICAgICAgIHNjYW5f
cGFzc3Rocm91Z2hfcHJvcCk7CisgICAgaWYgKCByYyApCisgICAgICAgIHJldHVybiByYzsKKwor
ICAgIGFkZHJlc3NfY2VsbHMgPSBkZXZpY2VfdHJlZV9nZXRfdTMyKHBmZHQsIG5vZGVvZmYsICIj
YWRkcmVzcy1jZWxscyIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RFRfUk9PVF9OT0RFX0FERFJfQ0VMTFNfREVGQVVMVCk7CisgICAgc2l6ZV9jZWxscyA9IGRldmlj
ZV90cmVlX2dldF91MzIocGZkdCwgbm9kZW9mZiwgIiNzaXplLWNlbGxzIiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEVF9ST09UX05PREVfU0laRV9DRUxMU19ERUZBVUxU
KTsKKworICAgIG5vZGVfbmV4dCA9IGZkdF9maXJzdF9zdWJub2RlKHBmZHQsIG5vZGVvZmYpOwor
ICAgIHdoaWxlICggbm9kZV9uZXh0ID4gMCApCisgICAgeworICAgICAgICBzY2FuX3BmZHRfbm9k
ZShraW5mbywgcGZkdCwgbm9kZV9uZXh0LCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLAorICAg
ICAgICAgICAgICAgICAgICAgICBzY2FuX3Bhc3N0aHJvdWdoX3Byb3ApOworICAgICAgICBub2Rl
X25leHQgPSBmZHRfbmV4dF9zdWJub2RlKHBmZHQsIG5vZGVfbmV4dCk7CisgICAgfQorCisgICAg
cmV0dXJuIGZkdF9lbmRfbm9kZShmZHQpOworfQorCitzdGF0aWMgaW50IF9faW5pdCBjaGVja19w
YXJ0aWFsX2ZkdCh2b2lkICpwZmR0LCBzaXplX3Qgc2l6ZSkKK3sKKyAgICBpbnQgcmVzOworCisg
ICAgaWYgKCBmZHRfbWFnaWMocGZkdCkgIT0gRkRUX01BR0lDICkKKyAgICB7CisgICAgICAgIGRw
cmludGsoWEVOTE9HX0VSUiwgIlBhcnRpYWwgRkRUIGlzIG5vdCBhIHZhbGlkIEZsYXQgRGV2aWNl
IFRyZWUiKTsKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQorCisgICAgcmVzID0gZmR0
X2NoZWNrX2hlYWRlcihwZmR0KTsKKyAgICBpZiAoIHJlcyApCisgICAgeworICAgICAgICBkcHJp
bnRrKFhFTkxPR19FUlIsICJGYWlsZWQgdG8gY2hlY2sgdGhlIHBhcnRpYWwgRkRUICglZCkiLCBy
ZXMpOworICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKKyAgICBpZiAoIGZkdF90b3Rh
bHNpemUocGZkdCkgPiBzaXplICkKKyAgICB7CisgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwg
IlBhcnRpYWwgRkRUIHRvdGFsc2l6ZSBpcyB0b28gYmlnIik7CisgICAgICAgIHJldHVybiAtRUlO
VkFMOworICAgIH0KKworICAgIHJldHVybiAwOworfQorCitzdGF0aWMgaW50IF9faW5pdCBkb21h
aW5faGFuZGxlX2R0Yl9ib290bW9kdWxlKHN0cnVjdCBkb21haW4gKmQsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2lu
Zm8pCit7CisgICAgdm9pZCAqcGZkdDsKKyAgICBpbnQgcmVzLCBub2RlX25leHQ7CisKKyAgICBw
ZmR0ID0gaW9yZW1hcF9jYWNoZShraW5mby0+ZHRiX2Jvb3Rtb2R1bGUtPnN0YXJ0LAorICAgICAg
ICAgICAgICAgICAgICAgICAgIGtpbmZvLT5kdGJfYm9vdG1vZHVsZS0+c2l6ZSk7CisgICAgaWYg
KCBwZmR0ID09IE5VTEwgKQorICAgICAgICByZXR1cm4gLUVGQVVMVDsKKworICAgIHJlcyA9IGNo
ZWNrX3BhcnRpYWxfZmR0KHBmZHQsIGtpbmZvLT5kdGJfYm9vdG1vZHVsZS0+c2l6ZSk7CisgICAg
aWYgKCByZXMgPCAwICkKKyAgICAgICAgcmV0dXJuIHJlczsKKworICAgIGZvciAoIG5vZGVfbmV4
dCA9IGZkdF9maXJzdF9zdWJub2RlKHBmZHQsIDApOyAKKyAgICAgICAgICBub2RlX25leHQgPiAw
OworICAgICAgICAgIG5vZGVfbmV4dCA9IGZkdF9uZXh0X3N1Ym5vZGUocGZkdCwgbm9kZV9uZXh0
KSApCisgICAgeworICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gZmR0X2dldF9uYW1lKHBmZHQs
IG5vZGVfbmV4dCwgTlVMTCk7CisKKyAgICAgICAgaWYgKCBuYW1lID09IE5VTEwgKQorICAgICAg
ICAgICAgY29udGludWU7CisKKyAgICAgICAgLyoKKyAgICAgICAgICogT25seSBzY2FuIC9naWMg
L2FsaWFzZXMgL3Bhc3N0aHJvdWdoLCBpZ25vcmUgdGhlIHJlc3QuCisgICAgICAgICAqIFRoZXkg
ZG9uJ3QgaGF2ZSB0byBiZSBwYXJzZWQgaW4gb3JkZXIuCisgICAgICAgICAqCisgICAgICAgICAq
IFRha2UgdGhlIEdJQyBwaGFuZGxlIHZhbHVlIGZyb20gdGhlIHNwZWNpYWwgL2dpYyBub2RlIGlu
IHRoZQorICAgICAgICAgKiBEVEIgZnJhZ21lbnQuCisgICAgICAgICAqLworICAgICAgICBpZiAo
IGR0X25vZGVfY21wKG5hbWUsICJnaWMiKSA9PSAwICkKKyAgICAgICAgeworICAgICAgICAgICAg
a2luZm8tPnBoYW5kbGVfZ2ljID0gZmR0X2dldF9waGFuZGxlKHBmZHQsIG5vZGVfbmV4dCk7Cisg
ICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgfQorCisgICAgICAgIGlmICggZHRfbm9kZV9j
bXAobmFtZSwgImFsaWFzZXMiKSA9PSAwICkKKyAgICAgICAgeworICAgICAgICAgICAgcmVzID0g
c2Nhbl9wZmR0X25vZGUoa2luZm8sIHBmZHQsIG5vZGVfbmV4dCwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIERUX1JPT1RfTk9ERV9BRERSX0NFTExTX0RFRkFVTFQsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEVF9ST09UX05PREVfU0laRV9DRUxMU19ERUZBVUxU
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFsc2UpOworICAgICAgICAgICAg
aWYgKCByZXMgKQorICAgICAgICAgICAgICAgIHJldHVybiByZXM7CisgICAgICAgICAgICBjb250
aW51ZTsKKyAgICAgICAgfQorICAgICAgICBpZiAoIGR0X25vZGVfY21wKG5hbWUsICJwYXNzdGhy
b3VnaCIpID09IDAgKQorICAgICAgICB7CisgICAgICAgICAgICByZXMgPSBzY2FuX3BmZHRfbm9k
ZShraW5mbywgcGZkdCwgbm9kZV9uZXh0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgRFRfUk9PVF9OT0RFX0FERFJfQ0VMTFNfREVGQVVMVCwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIERUX1JPT1RfTk9ERV9TSVpFX0NFTExTX0RFRkFVTFQsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0cnVlKTsKKyAgICAgICAgICAgIGlmICggcmVzICkKKyAg
ICAgICAgICAgICAgICByZXR1cm4gcmVzOworICAgICAgICAgICAgY29udGludWU7CisgICAgICAg
IH0KKyAgICB9CisKKyAgICBpb3VubWFwKHBmZHQpOworCisgICAgcmV0dXJuIHJlczsKK30KKwog
LyoKICAqIFRoZSBtYXggc2l6ZSBmb3IgRFQgaXMgMk1CLiBIb3dldmVyLCB0aGUgZ2VuZXJhdGVk
IERUIGlzIHNtYWxsLCA0S0IKICAqIGFyZSBlbm91Z2ggZm9yIG5vdywgYnV0IHdlIG1pZ2h0IGhh
dmUgdG8gaW5jcmVhc2UgaXQgaW4gdGhlIGZ1dHVyZS4KQEAgLTE3NTMsNiArMTkwNSwxOCBAQCBz
dGF0aWMgaW50IF9faW5pdCBwcmVwYXJlX2R0Yl9kb21VKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBrZXJuZWxfaW5mbyAqa2luZm8pCiAgICAgaWYgKCByZXQgKQogICAgICAgICBnb3RvIGVycjsK
IAorICAgIC8qCisgICAgICogZG9tYWluX2hhbmRsZV9kdGJfYm9vdG1vZHVsZSBoYXMgdG8gYmUg
Y2FsbGVkIGJlZm9yZSB0aGUgcmVzdCBvZgorICAgICAqIHRoZSBkZXZpY2UgdHJlZSBpcyBnZW5l
cmF0ZWQgYmVjYXVzZSBpdCBkZXBlbmRzIG9uIHRoZSB2YWx1ZSBvZgorICAgICAqIHRoZSBmaWVs
ZCBwaGFuZGxlX2dpYy4KKyAgICAgKi8KKyAgICBpZiAoIGtpbmZvLT5kdGJfYm9vdG1vZHVsZSAp
CisgICAgeworICAgICAgICByZXQgPSBkb21haW5faGFuZGxlX2R0Yl9ib290bW9kdWxlKGQsIGtp
bmZvKTsKKyAgICAgICAgaWYgKCByZXQgKQorICAgICAgICAgICAgcmV0dXJuIHJldDsKKyAgICB9
CisKICAgICByZXQgPSBtYWtlX2dpY19kb21VX25vZGUoa2luZm8pOwogICAgIGlmICggcmV0ICkK
ICAgICAgICAgZ290byBlcnI7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5l
bC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaAppbmRleCA0M2ZhODc1NDVlLi44NzRh
YTEwOGE3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5lbC5oCisrKyBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmgKQEAgLTI4LDcgKzI4LDcgQEAgc3RydWN0IGtlcm5l
bF9pbmZvIHsKICAgICBwYWRkcl90IGdudHRhYl9zaXplOwogCiAgICAgLyogYm9vdCBibG9iIGxv
YWQgYWRkcmVzc2VzICovCi0gICAgY29uc3Qgc3RydWN0IGJvb3Rtb2R1bGUgKmtlcm5lbF9ib290
bW9kdWxlLCAqaW5pdHJkX2Jvb3Rtb2R1bGU7CisgICAgY29uc3Qgc3RydWN0IGJvb3Rtb2R1bGUg
Kmtlcm5lbF9ib290bW9kdWxlLCAqaW5pdHJkX2Jvb3Rtb2R1bGUsICpkdGJfYm9vdG1vZHVsZTsK
ICAgICBjb25zdCBjaGFyKiBjbWRsaW5lOwogICAgIHBhZGRyX3QgZHRiX3BhZGRyOwogICAgIHBh
ZGRyX3QgaW5pdHJkX3BhZGRyOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
