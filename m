Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052911D420
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 18:35:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifSKK-0002TG-9G; Thu, 12 Dec 2019 17:32:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkF/=2C=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ifSKI-0002T5-Qa
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 17:32:34 +0000
X-Inumbo-ID: 5c3aaad8-1d05-11ea-8dd6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c3aaad8-1d05-11ea-8dd6-12813bfff9fa;
 Thu, 12 Dec 2019 17:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576171945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SHF9F4pwZNaZVojZjNUspgBmPNiZebNFFLw8ukzciHI=;
 b=L/YH4Gt3rpAhiFH4ayWPEDRjjPVSfvj4XVydHJ8Cud7r2WSLDZAoiZC5
 mXGfTZ7OhIHnyR0nmGPAHXrBmNnq3hMFjaZeg5icFXYVVYLPzuWFHQxvx
 yIiDWOIfFeBOai3FG2VSj0C2aR+Mw4Ztacr5KGJtN6ppLVx7AulO9ImOZ s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ounWkTLONB89HA2q4ebpPBBfynm72kdVBtbfZuorvNmDgyJSteVbfqfefdgLiCG9z16L3u6f7F
 l4GNGI86oYYRM46npiT7ZwLD2RWcAdEzS2u6HIICL+VGkNKtLqNzjVe9noQKJnstA/NY5SHMVx
 cxB6/w8V/OfTKkwnKsegZcOo4BRCY0YOWqhHd8PTGyWm8G4FsEcIxu5Rgngo6UgMG++bU0n2vI
 vcCdqCtd/bGgr7sGOV6wmtGaNVukfcIxhT2nVe7h5rGtHeLDVQyv41XUdlRrpnwXVgP9AC6mPP
 xAA=
X-SBRS: 2.7
X-MesageID: 9961411
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9961411"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 17:32:02 +0000
Message-ID: <20191212173203.1692762-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212173203.1692762-1-george.dunlap@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] x86/mm: Use a more descriptive name for
 pagetable mfns
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gbWFueSBwbGFjZXMsIGEgUFRFIGJlaW5nIG1vZGlmaWVkIGlzIGFjY29tcGFuaWVkIGJ5IHRo
ZSBwYWdldGFibGUKbWZuIHdoaWNoIGNvbnRhaW5zIHRoZSBQVEUgKHByaW1hcmlseSBpbiBvcmRl
ciB0byBiZSBhYmxlIHRvIG1haW50YWluCmxpbmVhciBtYXBwaW5nIGNvdW50cykuICBJbiBtYW55
IGNhc2VzLCB0aGlzIG1mbiBpcyBzdG9yZWQgaW4gdGhlCm5vbi1kZXNjcmlwdCB2YXJpYWJsZSAo
b3IgYXJnZW1lbnQpICJwZm4iLgoKUmVwbGFjZSB0aGVzZSBuYW1lcyB3aXRoIGxObWZuLCB0byBp
bmRpY2F0ZSB0aGF0IDEpIHRoaXMgaXMgYQpwYWdldGFibGUgbWZuLCBhbmQgMikgdGhhdCBpdCBp
cyB0aGUgc2FtZSBsZXZlbCBhcyB0aGUgUFRFIGluCnF1ZXN0aW9uLiAgVGhpcyBzaG91bGQgYmUg
ZW5vdWdoIHRvIHJlbWluZCByZWFkZXJzIHRoYXQgaXQncyB0aGUgbWZuCmNvbnRhaW5pbmcgdGhl
IFBURS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDI1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gv
eDg2L21tLmMKaW5kZXggYzA1MDM5YWIyMS4uNTRiNDEwMGQ1NSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTExNDEsNyArMTE0MSw3IEBA
IHN0YXRpYyBpbnQgZ2V0X3BhZ2VfYW5kX3R5cGVfZnJvbV9tZm4oCiBkZWZpbmVfZ2V0X2xpbmVh
cl9wYWdldGFibGUobDIpOwogc3RhdGljIGludAogZ2V0X3BhZ2VfZnJvbV9sMmUoCi0gICAgbDJf
cGdlbnRyeV90IGwyZSwgdW5zaWduZWQgbG9uZyBwZm4sIHN0cnVjdCBkb21haW4gKmQsIHVuc2ln
bmVkIGludCBmbGFncykKKyAgICBsMl9wZ2VudHJ5X3QgbDJlLCB1bnNpZ25lZCBsb25nIGwybWZu
LCBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CiAgICAgdW5zaWduZWQg
bG9uZyBtZm4gPSBsMmVfZ2V0X3BmbihsMmUpOwogICAgIGludCByYzsKQEAgLTExNTYsNyArMTE1
Niw3IEBAIGdldF9wYWdlX2Zyb21fbDJlKAogICAgIEFTU0VSVCghKGZsYWdzICYgUFRGX3ByZWVt
cHRpYmxlKSk7CiAKICAgICByYyA9IGdldF9wYWdlX2FuZF90eXBlX2Zyb21fbWZuKF9tZm4obWZu
KSwgUEdUX2wxX3BhZ2VfdGFibGUsIGQsIGZsYWdzKTsKLSAgICBpZiAoIHVubGlrZWx5KHJjID09
IC1FSU5WQUwpICYmIGdldF9sMl9saW5lYXJfcGFnZXRhYmxlKGwyZSwgcGZuLCBkKSApCisgICAg
aWYgKCB1bmxpa2VseShyYyA9PSAtRUlOVkFMKSAmJiBnZXRfbDJfbGluZWFyX3BhZ2V0YWJsZShs
MmUsIGwybWZuLCBkKSApCiAgICAgICAgIHJjID0gMDsKIAogICAgIHJldHVybiByYzsKQEAgLTEx
NjUsNyArMTE2NSw3IEBAIGdldF9wYWdlX2Zyb21fbDJlKAogZGVmaW5lX2dldF9saW5lYXJfcGFn
ZXRhYmxlKGwzKTsKIHN0YXRpYyBpbnQKIGdldF9wYWdlX2Zyb21fbDNlKAotICAgIGwzX3BnZW50
cnlfdCBsM2UsIHVuc2lnbmVkIGxvbmcgcGZuLCBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCisgICAgbDNfcGdlbnRyeV90IGwzZSwgdW5zaWduZWQgbG9uZyBsM21mbiwgc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGZsYWdzKQogewogICAgIGludCByYzsKIApAQCAt
MTE4MCw3ICsxMTgwLDcgQEAgZ2V0X3BhZ2VfZnJvbV9sM2UoCiAgICAgICAgIGwzZV9nZXRfbWZu
KGwzZSksIFBHVF9sMl9wYWdlX3RhYmxlLCBkLCBmbGFncyB8IFBURl9wcmVlbXB0aWJsZSk7CiAg
ICAgaWYgKCB1bmxpa2VseShyYyA9PSAtRUlOVkFMKSAmJgogICAgICAgICAgIWlzX3B2XzMyYml0
X2RvbWFpbihkKSAmJgotICAgICAgICAgZ2V0X2wzX2xpbmVhcl9wYWdldGFibGUobDNlLCBwZm4s
IGQpICkKKyAgICAgICAgIGdldF9sM19saW5lYXJfcGFnZXRhYmxlKGwzZSwgbDNtZm4sIGQpICkK
ICAgICAgICAgcmMgPSAwOwogCiAgICAgcmV0dXJuIHJjOwpAQCAtMTE4OSw3ICsxMTg5LDcgQEAg
Z2V0X3BhZ2VfZnJvbV9sM2UoCiBkZWZpbmVfZ2V0X2xpbmVhcl9wYWdldGFibGUobDQpOwogc3Rh
dGljIGludAogZ2V0X3BhZ2VfZnJvbV9sNGUoCi0gICAgbDRfcGdlbnRyeV90IGw0ZSwgdW5zaWdu
ZWQgbG9uZyBwZm4sIHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBmbGFncykKKyAgICBs
NF9wZ2VudHJ5X3QgbDRlLCB1bnNpZ25lZCBsb25nIGw0bWZuLCBzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CiAgICAgaW50IHJjOwogCkBAIC0xMjAyLDcgKzEyMDIsNyBA
QCBnZXRfcGFnZV9mcm9tX2w0ZSgKIAogICAgIHJjID0gZ2V0X3BhZ2VfYW5kX3R5cGVfZnJvbV9t
Zm4oCiAgICAgICAgIGw0ZV9nZXRfbWZuKGw0ZSksIFBHVF9sM19wYWdlX3RhYmxlLCBkLCBmbGFn
cyB8IFBURl9wcmVlbXB0aWJsZSk7Ci0gICAgaWYgKCB1bmxpa2VseShyYyA9PSAtRUlOVkFMKSAm
JiBnZXRfbDRfbGluZWFyX3BhZ2V0YWJsZShsNGUsIHBmbiwgZCkgKQorICAgIGlmICggdW5saWtl
bHkocmMgPT0gLUVJTlZBTCkgJiYgZ2V0X2w0X2xpbmVhcl9wYWdldGFibGUobDRlLCBsNG1mbiwg
ZCkgKQogICAgICAgICByYyA9IDA7CiAKICAgICByZXR1cm4gcmM7CkBAIC0xNDYwLDEzICsxNDYw
LDEzIEBAIHN0YXRpYyBpbnQgY3JlYXRlX3BhZV94ZW5fbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAq
ZCwgbDNfcGdlbnRyeV90ICpwbDNlKQogc3RhdGljIGludCBhbGxvY19sMl90YWJsZShzdHJ1Y3Qg
cGFnZV9pbmZvICpwYWdlLCB1bnNpZ25lZCBsb25nIHR5cGUpCiB7CiAgICAgc3RydWN0IGRvbWFp
biAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOwotICAgIHVuc2lnbmVkIGxvbmcgIHBmbiA9IG1m
bl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKKyAgICB1bnNpZ25lZCBsb25nICBsMm1mbiA9IG1mbl94
KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKICAgICBsMl9wZ2VudHJ5X3QgICpwbDJlOwogICAgIHVuc2ln
bmVkIGludCAgIGk7CiAgICAgaW50ICAgICAgICAgICAgcmMgPSAwOwogICAgIHVuc2lnbmVkIGlu
dCAgIHBhcnRpYWxfZmxhZ3MgPSBwYWdlLT5wYXJ0aWFsX2ZsYWdzOwogCi0gICAgcGwyZSA9IG1h
cF9kb21haW5fcGFnZShfbWZuKHBmbikpOworICAgIHBsMmUgPSBtYXBfZG9tYWluX3BhZ2UoX21m
bihsMm1mbikpOwogCiAgICAgLyoKICAgICAgKiBOQiB0aGF0IGFsbG9jX2wyX3RhYmxlIHdpbGwg
bmV2ZXIgc2V0IHBhcnRpYWxfcHRlIG9uIGFuIGwyOyBidXQKQEAgLTE0OTIsNyArMTQ5Miw3IEBA
IHN0YXRpYyBpbnQgYWxsb2NfbDJfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgdW5zaWdu
ZWQgbG9uZyB0eXBlKQogICAgICAgICAgICAgcmMgPSAtRUlOVFI7CiAgICAgICAgIH0KICAgICAg
ICAgZWxzZQotICAgICAgICAgICAgcmMgPSBnZXRfcGFnZV9mcm9tX2wyZShsMmUsIHBmbiwgZCwg
cGFydGlhbF9mbGFncyk7CisgICAgICAgICAgICByYyA9IGdldF9wYWdlX2Zyb21fbDJlKGwyZSwg
bDJtZm4sIGQsIHBhcnRpYWxfZmxhZ3MpOwogCiAgICAgICAgIC8qCiAgICAgICAgICAqIEl0IHNo
b3VsZG4ndCBiZSBwb3NzaWJsZSBmb3IgZ2V0X3BhZ2VfZnJvbV9sMmUgdG8gcmV0dXJuCkBAIC0x
NTU5LDE0ICsxNTU5LDE0IEBAIHN0YXRpYyBpbnQgYWxsb2NfbDJfdGFibGUoc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZSwgdW5zaWduZWQgbG9uZyB0eXBlKQogc3RhdGljIGludCBhbGxvY19sM190YWJs
ZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogewogICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdl
X2dldF9vd25lcihwYWdlKTsKLSAgICB1bnNpZ25lZCBsb25nICBwZm4gPSBtZm5feChwYWdlX3Rv
X21mbihwYWdlKSk7CisgICAgdW5zaWduZWQgbG9uZyAgbDNtZm4gPSBtZm5feChwYWdlX3RvX21m
bihwYWdlKSk7CiAgICAgbDNfcGdlbnRyeV90ICAqcGwzZTsKICAgICB1bnNpZ25lZCBpbnQgICBp
OwogICAgIGludCAgICAgICAgICAgIHJjID0gMDsKICAgICB1bnNpZ25lZCBpbnQgICBwYXJ0aWFs
X2ZsYWdzID0gcGFnZS0+cGFydGlhbF9mbGFnczsKICAgICBsM19wZ2VudHJ5X3QgICBsM2UgPSBs
M2VfZW1wdHkoKTsKIAotICAgIHBsM2UgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihwZm4pKTsKKyAg
ICBwbDNlID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obDNtZm4pKTsKIAogICAgIC8qCiAgICAgICog
UEFFIGd1ZXN0cyBhbGxvY2F0ZSBmdWxsIHBhZ2VzLCBidXQgYXJlbid0IHJlcXVpcmVkIHRvIGlu
aXRpYWxpemUKQEAgLTE2MDMsNyArMTYwMyw3IEBAIHN0YXRpYyBpbnQgYWxsb2NfbDNfdGFibGUo
c3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKICAgICAgICAgICAgIHJjID0gLUVJTlRSOwogICAgICAg
ICB9CiAgICAgICAgIGVsc2UKLSAgICAgICAgICAgIHJjID0gZ2V0X3BhZ2VfZnJvbV9sM2UobDNl
LCBwZm4sIGQsCisgICAgICAgICAgICByYyA9IGdldF9wYWdlX2Zyb21fbDNlKGwzZSwgbDNtZm4s
IGQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcnRpYWxfZmxhZ3MgfCBQ
VEZfcmV0YWluX3JlZl9vbl9yZXN0YXJ0KTsKIAogICAgICAgICBpZiAoIHJjID09IC1FUkVTVEFS
VCApCkBAIC0xNzg2LDggKzE3ODYsOCBAQCB2b2lkIHphcF9yb19tcHQobWZuX3QgbWZuKQogc3Rh
dGljIGludCBhbGxvY19sNF90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogewogICAgIHN0
cnVjdCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihwYWdlKTsKLSAgICB1bnNpZ25lZCBsb25n
ICBwZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7Ci0gICAgbDRfcGdlbnRyeV90ICAqcGw0
ZSA9IG1hcF9kb21haW5fcGFnZShfbWZuKHBmbikpOworICAgIHVuc2lnbmVkIGxvbmcgIGw0bWZu
ID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOworICAgIGw0X3BnZW50cnlfdCAgKnBsNGUgPSBt
YXBfZG9tYWluX3BhZ2UoX21mbihsNG1mbikpOwogICAgIHVuc2lnbmVkIGludCAgIGk7CiAgICAg
aW50ICAgICAgICAgICAgcmMgPSAwOwogICAgIHVuc2lnbmVkIGludCAgIHBhcnRpYWxfZmxhZ3Mg
PSBwYWdlLT5wYXJ0aWFsX2ZsYWdzOwpAQCAtMTgwOSw3ICsxODA5LDcgQEAgc3RhdGljIGludCBh
bGxvY19sNF90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogICAgICAgICAgICAgcmMgPSAt
RUlOVFI7CiAgICAgICAgIH0KICAgICAgICAgZWxzZQotICAgICAgICAgICAgcmMgPSBnZXRfcGFn
ZV9mcm9tX2w0ZShsNGUsIHBmbiwgZCwKKyAgICAgICAgICAgIHJjID0gZ2V0X3BhZ2VfZnJvbV9s
NGUobDRlLCBsNG1mbiwgZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFy
dGlhbF9mbGFncyB8IFBURl9yZXRhaW5fcmVmX29uX3Jlc3RhcnQpOwogCiAgICAgICAgIGlmICgg
cmMgPT0gLUVSRVNUQVJUICkKQEAgLTE4NjksNyArMTg2OSw3IEBAIHN0YXRpYyBpbnQgYWxsb2Nf
bDRfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKIAogICAgIGlmICggIXJjICkKICAgICB7
Ci0gICAgICAgIGluaXRfeGVuX2w0X3Nsb3RzKHBsNGUsIF9tZm4ocGZuKSwKKyAgICAgICAgaW5p
dF94ZW5fbDRfc2xvdHMocGw0ZSwgX21mbihsNG1mbiksCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGQsIElOVkFMSURfTUZOLCBWTV9BU1NJU1QoZCwgbTJwX3N0cmljdCkpOwogICAgICAgICBh
dG9taWNfaW5jKCZkLT5hcmNoLnB2Lm5yX2w0X3BhZ2VzKTsKICAgICB9CkBAIC0xODk2LDE4ICsx
ODk2LDE4IEBAIHN0YXRpYyB2b2lkIGZyZWVfbDFfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSkKIHN0YXRpYyBpbnQgZnJlZV9sMl90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogewog
ICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihwYWdlKTsKLSAgICB1bnNpZ25l
ZCBsb25nIHBmbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKKyAgICB1bnNpZ25lZCBsb25n
IGwybWZuID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwogICAgIGwyX3BnZW50cnlfdCAqcGwy
ZTsKICAgICBpbnQgcmMgPSAwOwogICAgIHVuc2lnbmVkIGludCBwYXJ0aWFsX2ZsYWdzID0gcGFn
ZS0+cGFydGlhbF9mbGFncywKICAgICAgICAgaSA9IHBhZ2UtPm5yX3ZhbGlkYXRlZF9wdGVzIC0g
IShwYXJ0aWFsX2ZsYWdzICYgUFRGX3BhcnRpYWxfc2V0KTsKIAotICAgIHBsMmUgPSBtYXBfZG9t
YWluX3BhZ2UoX21mbihwZm4pKTsKKyAgICBwbDJlID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4obDJt
Zm4pKTsKIAogICAgIGZvciAoIDsgOyApCiAgICAgewogICAgICAgICBpZiAoIGlzX2d1ZXN0X2wy
X3Nsb3QoZCwgcGFnZS0+dS5pbnVzZS50eXBlX2luZm8sIGkpICkKLSAgICAgICAgICAgIHJjID0g
cHV0X3BhZ2VfZnJvbV9sMmUocGwyZVtpXSwgcGZuLCBwYXJ0aWFsX2ZsYWdzKTsKKyAgICAgICAg
ICAgIHJjID0gcHV0X3BhZ2VfZnJvbV9sMmUocGwyZVtpXSwgbDJtZm4sIHBhcnRpYWxfZmxhZ3Mp
OwogICAgICAgICBpZiAoIHJjIDwgMCApCiAgICAgICAgICAgICBicmVhazsKIApAQCAtMTk0OCwx
NyArMTk0OCwxNyBAQCBzdGF0aWMgaW50IGZyZWVfbDJfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAq
cGFnZSkKIHN0YXRpYyBpbnQgZnJlZV9sM190YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQog
ewogICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihwYWdlKTsKLSAgICB1bnNp
Z25lZCBsb25nIHBmbiA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKKyAgICB1bnNpZ25lZCBs
b25nIGwzbWZuID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwogICAgIGwzX3BnZW50cnlfdCAq
cGwzZTsKICAgICBpbnQgcmMgPSAwOwogICAgIHVuc2lnbmVkIGludCBwYXJ0aWFsX2ZsYWdzID0g
cGFnZS0+cGFydGlhbF9mbGFncywKICAgICAgICAgaSA9IHBhZ2UtPm5yX3ZhbGlkYXRlZF9wdGVz
IC0gIShwYXJ0aWFsX2ZsYWdzICYgUFRGX3BhcnRpYWxfc2V0KTsKIAotICAgIHBsM2UgPSBtYXBf
ZG9tYWluX3BhZ2UoX21mbihwZm4pKTsKKyAgICBwbDNlID0gbWFwX2RvbWFpbl9wYWdlKF9tZm4o
bDNtZm4pKTsKIAogICAgIGZvciAoIDsgOyApCiAgICAgewotICAgICAgICByYyA9IHB1dF9wYWdl
X2Zyb21fbDNlKHBsM2VbaV0sIHBmbiwgcGFydGlhbF9mbGFncyk7CisgICAgICAgIHJjID0gcHV0
X3BhZ2VfZnJvbV9sM2UocGwzZVtpXSwgbDNtZm4sIHBhcnRpYWxfZmxhZ3MpOwogICAgICAgICBp
ZiAoIHJjIDwgMCApCiAgICAgICAgICAgICBicmVhazsKIApAQCAtMTk5NSwxNSArMTk5NSwxNSBA
QCBzdGF0aWMgaW50IGZyZWVfbDNfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKIHN0YXRp
YyBpbnQgZnJlZV9sNF90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogewogICAgIHN0cnVj
dCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihwYWdlKTsKLSAgICB1bnNpZ25lZCBsb25nIHBm
biA9IG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKTsKLSAgICBsNF9wZ2VudHJ5X3QgKnBsNGUgPSBt
YXBfZG9tYWluX3BhZ2UoX21mbihwZm4pKTsKKyAgICB1bnNpZ25lZCBsb25nIGw0bWZuID0gbWZu
X3gocGFnZV90b19tZm4ocGFnZSkpOworICAgIGw0X3BnZW50cnlfdCAqcGw0ZSA9IG1hcF9kb21h
aW5fcGFnZShfbWZuKGw0bWZuKSk7CiAgICAgaW50IHJjID0gMDsKICAgICB1bnNpZ25lZCBwYXJ0
aWFsX2ZsYWdzID0gcGFnZS0+cGFydGlhbF9mbGFncywKICAgICAgICAgaSA9IHBhZ2UtPm5yX3Zh
bGlkYXRlZF9wdGVzIC0gIShwYXJ0aWFsX2ZsYWdzICYgUFRGX3BhcnRpYWxfc2V0KTsKIAogICAg
IGRvIHsKICAgICAgICAgaWYgKCBpc19ndWVzdF9sNF9zbG90KGQsIGkpICkKLSAgICAgICAgICAg
IHJjID0gcHV0X3BhZ2VfZnJvbV9sNGUocGw0ZVtpXSwgcGZuLCBwYXJ0aWFsX2ZsYWdzKTsKKyAg
ICAgICAgICAgIHJjID0gcHV0X3BhZ2VfZnJvbV9sNGUocGw0ZVtpXSwgbDRtZm4sIHBhcnRpYWxf
ZmxhZ3MpOwogICAgICAgICBpZiAoIHJjIDwgMCApCiAgICAgICAgICAgICBicmVhazsKICAgICAg
ICAgcGFydGlhbF9mbGFncyA9IDA7Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
