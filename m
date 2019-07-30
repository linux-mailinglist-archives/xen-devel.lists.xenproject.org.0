Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7062A7AB50
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 16:47:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsTLE-0002IT-81; Tue, 30 Jul 2019 14:43:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsTLC-0002IO-MX
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 14:43:02 +0000
X-Inumbo-ID: 52c0f792-b2d8-11e9-bc9c-d39caf7c6a82
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52c0f792-b2d8-11e9-bc9c-d39caf7c6a82;
 Tue, 30 Jul 2019 14:42:59 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Kh0OAuT9qdWKMisAP1QEoIH9GwQEdv6ypcTTpxrDH/KFjQ/o5bn4P6jpghyrRtfSV2wh+KSosl
 lyabAF/bYuE1FN0mVU+ZXa524cvOmfm6UeR8j8nLDUIr6WO9/f3uJIN+J9zmYDtW2XivBLSiAc
 Bci64Y4iUAT199Hl8oDDw/QHDJLotnOONZ2ScUny0zQouoseLl2Soc800xQ+szWYLJiXO3Zig8
 2/fuo2940/a+wepzQ1E3iUFdIEDFX10PUytbDfyOx/JTIxagQJfUu4f0MlUpeXMyk0a6SKZruw
 6oA=
X-SBRS: 2.7
X-MesageID: 3745848
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3745848"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 15:42:55 +0100
Message-ID: <20190730144255.6126-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vvmx: Fix nested virt on VMCS-Shadow
 capable hardware
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIGU5OTg2YjBkZCAieDg2L3Z2bXg6IFNpbXBsaWZ5IHBlci1DUFUgbWVtb3J5IGFsbG9jYXRp
b25zIiBoYWQgdGhlIHdyb25nCmluZGlyZWN0aW9uIG9uIGl0cyBwb2ludGVyIGNoZWNrIGluIG52
bXhfY3B1X3VwX3ByZXBhcmUoKSwgY2F1c2luZyB0aGUKVk1DUy1zaGFkb3dpbmcgYnVmZmVyIG5l
dmVyIGJlIGFsbG9jYXRlZC4gIEZpeCBpdC4KClRoaXMgaW4gdHVybiByZXN1bHRzIGluIGEgbWFz
c2l2ZSBxdWFudGl0eSBvZiBsb2dzcGFtLCBhcyBldmVyeSB2aXJ0dWFsCnZtZW50cnkvZXhpdCBo
aXRzIGJvdGggZ2RwcmludGsoKXMgaW4gdGhlICpfYnVsaygpIGZ1bmN0aW9ucy4KClN3aXRjaCB0
aGVzZSB0byB1c2luZyBwcmludGtfb25jZSgpLiAgVGhlIHNpemUgb2YgdGhlIGJ1ZmZlciBpcyBj
aG9zZW4gYXQKY29tcGlsZSB0aW1lLCBzbyBjb21wbGFpbmluZyBhYm91dCBpdCByZXBlYXRlZGx5
IGlzIG9mIG5vIGJlbmVmaXQuCgpGaW5hbGx5LCBkcm9wIHRoZSBydW50aW1lIE5VTEwgcG9pbnRl
ciBjaGVja3MuICBJdCBpcyBub3QgdGVycmlibHkgYXBwcm9wcmlhdGUKdG8gYmUgcmVwZWF0ZWRs
eSBjaGVja2luZyBpbmZyYXN0cnVjdHVyZSB3aGljaCBpcyBzZXQgdXAgZnJvbSBzdGFydC1vZi1k
YXksCmFuZCBpbiB0aGlzIGNhc2UsIGFjdHVhbGx5IGhpZCB0aGUgYWJvdmUgYnVnLgoKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBKdW4gTmFr
YWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCAxNiArKysrKysr
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3Z2bXguYwppbmRleCAzMzI2MjNkMDA2Li5mMzhmM2E5OTMwIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgv
dnZteC5jCkBAIC00Myw3ICs0Myw3IEBAIGludCBudm14X2NwdV91cF9wcmVwYXJlKHVuc2lnbmVk
IGludCBjcHUpCiAgICAgdWludDY0X3QgKip2dm1jc19idWY7CiAKICAgICBpZiAoIGNwdV9oYXNf
dm14X3ZtY3Nfc2hhZG93aW5nICYmCi0gICAgICAgICAodnZtY3NfYnVmID0gJnBlcl9jcHUodnZt
Y3NfYnVmLCBjcHUpKSA9PSBOVUxMICkKKyAgICAgICAgICoodnZtY3NfYnVmID0gJnBlcl9jcHUo
dnZtY3NfYnVmLCBjcHUpKSA9PSBOVUxMICkKICAgICB7CiAgICAgICAgIHZvaWQgKnB0ciA9IHh6
YWxsb2NfYXJyYXkodWludDY0X3QsIFZNQ1NfQlVGX1NJWkUpOwogCkBAIC05MjIsMTEgKzkyMiwx
MCBAQCBzdGF0aWMgdm9pZCB2dm1jc190b19zaGFkb3dfYnVsayhzdHJ1Y3QgdmNwdSAqdiwgdW5z
aWduZWQgaW50IG4sCiAgICAgaWYgKCAhY3B1X2hhc192bXhfdm1jc19zaGFkb3dpbmcgKQogICAg
ICAgICBnb3RvIGZhbGxiYWNrOwogCi0gICAgaWYgKCAhdmFsdWUgfHwgbiA+IFZNQ1NfQlVGX1NJ
WkUgKQorICAgIGlmICggbiA+IFZNQ1NfQlVGX1NJWkUgKQogICAgIHsKLSAgICAgICAgZ2Rwcmlu
dGsoWEVOTE9HX0RFQlVHLCAidm1jcyBzeW5jIGZhbGwgYmFjayB0byBub24tYnVsayBtb2RlLCAi
Ci0gICAgICAgICAgICAgICAgICJidWZmZXI6ICVwLCBidWZmZXIgc2l6ZTogJWQsIGZpZWxkcyBu
dW1iZXI6ICVkLlxuIiwKLSAgICAgICAgICAgICAgICAgdmFsdWUsIFZNQ1NfQlVGX1NJWkUsIG4p
OworICAgICAgICBwcmludGtfb25jZShYRU5MT0dfRVJSICIlcHYgVk1DUyBzeW5jIHRvbyBtYW55
IGZpZWxkcyAldVxuIiwKKyAgICAgICAgICAgICAgICAgICAgdiwgbik7CiAgICAgICAgIGdvdG8g
ZmFsbGJhY2s7CiAgICAgfQogCkBAIC05NjIsMTEgKzk2MSwxMCBAQCBzdGF0aWMgdm9pZCBzaGFk
b3dfdG9fdnZtY3NfYnVsayhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IG4sCiAgICAgaWYg
KCAhY3B1X2hhc192bXhfdm1jc19zaGFkb3dpbmcgKQogICAgICAgICBnb3RvIGZhbGxiYWNrOwog
Ci0gICAgaWYgKCAhdmFsdWUgfHwgbiA+IFZNQ1NfQlVGX1NJWkUgKQorICAgIGlmICggbiA+IFZN
Q1NfQlVGX1NJWkUgKQogICAgIHsKLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLCAidm1j
cyBzeW5jIGZhbGwgYmFjayB0byBub24tYnVsayBtb2RlLCAiCi0gICAgICAgICAgICAgICAgICJi
dWZmZXI6ICVwLCBidWZmZXIgc2l6ZTogJWQsIGZpZWxkcyBudW1iZXI6ICVkLlxuIiwKLSAgICAg
ICAgICAgICAgICAgdmFsdWUsIFZNQ1NfQlVGX1NJWkUsIG4pOworICAgICAgICBwcmludGtfb25j
ZShYRU5MT0dfRVJSICIlcHYgVk1DUyBzeW5jIHRvbyBtYW55IGZpZWxkcyAldVxuIiwKKyAgICAg
ICAgICAgICAgICAgICAgdiwgbik7CiAgICAgICAgIGdvdG8gZmFsbGJhY2s7CiAgICAgfQogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
