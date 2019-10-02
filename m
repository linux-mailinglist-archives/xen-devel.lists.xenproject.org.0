Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF15C8FA6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiFc-0008HM-2P; Wed, 02 Oct 2019 17:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMxB=X3=amazon.com=prvs=17142d732=hongyax@srs-us1.protection.inumbo.net>)
 id 1iFiFa-0008Gi-HY
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:17:18 +0000
X-Inumbo-ID: 7c88dc4c-e538-11e9-971c-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 7c88dc4c-e538-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 17:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1570036638; x=1601572638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=mGoiEalAlkkotdrI6fYCm5yWWMR/P1p/JssBzZjs3OE=;
 b=MfuDNpkR6IPa3OycjRAZL+SKFhil/pcKXGNV/PBbL76BwZ5iETcsnU7d
 xeXjx7+WRTKwXr5I3CVa7nCXUlD9u3MqCkEGL6b3Igo3AUNhUoPMnIIIm
 i9V+p2e+X2cPa3TnG9XmEtkFl/irgSy61ZF5JCfzZy8uUJKrGjGLvLzkZ A=;
X-IronPort-AV: E=Sophos;i="5.67,249,1566864000"; d="scan'208";a="754987328"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 02 Oct 2019 17:17:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (Postfix) with ESMTPS
 id D7FD1A2630; Wed,  2 Oct 2019 17:17:16 +0000 (UTC)
Received: from EX13D10UEE004.ant.amazon.com (10.43.62.185) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:05 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D10UEE004.ant.amazon.com (10.43.62.185) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 2 Oct 2019 17:17:04 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 2 Oct 2019 17:17:04 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 18:16:54 +0100
Message-ID: <55b6fbdac35d5c5b299a6c19315f462308ed6f3a.1570034362.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570034362.git.hongyax@amazon.com>
References: <cover.1570034362.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 9/9] x86/mm: change pl*e to l*t in
 virt_to_xen_l*e
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgbmVlZCB0byBoYXZl
IGEgdmFyaWFibGUgbmFtZWQgcGwqZSB3aGVuIHdlIHJld3JpdGUKdmlydF90b194ZW5fbCplLiBD
aGFuZ2UgcGwqZSB0byBsKnQgdG8gcmVmbGVjdCBiZXR0ZXIgaXRzIHB1cnBvc2UuClRoaXMgd2ls
bCBtYWtlIHJldmlld2luZyBsYXRlciBwYXRjaCBlYXNpZXIuCgpObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L21tLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGQ3ZWI4MDRm
MDYuLjc5YzY1YjE1ZDUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC00OTA0LDI1ICs0OTA0LDI1IEBAIHN0YXRpYyBsM19wZ2VudHJ5X3Qg
KnZpcnRfdG9feGVuX2wzZSh1bnNpZ25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGw0ZV9nZXRfZmxh
Z3MoKnBsNGUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5n
ID0gc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwzX3BnZW50cnlfdCAq
cGwzZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3Qg
PSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAKLSAgICAgICAgaWYgKCAhcGwzZSApCisgICAgICAg
IGlmICggIWwzdCApCiAgICAgICAgICAgICByZXR1cm4gTlVMTDsKLSAgICAgICAgY2xlYXJfcGFn
ZShwbDNlKTsKKyAgICAgICAgY2xlYXJfcGFnZShsM3QpOwogICAgICAgICBpZiAoIGxvY2tpbmcg
KQogICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICgg
IShsNGVfZ2V0X2ZsYWdzKCpwbDRlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAg
ICAgICAgICAgbDRfcGdlbnRyeV90IGw0ZSA9IGw0ZV9mcm9tX3BhZGRyKF9fcGEocGwzZSksIF9f
UEFHRV9IWVBFUlZJU09SKTsKKyAgICAgICAgICAgIGw0X3BnZW50cnlfdCBsNGUgPSBsNGVfZnJv
bV9wYWRkcihfX3BhKGwzdCksIF9fUEFHRV9IWVBFUlZJU09SKTsKIAogICAgICAgICAgICAgbDRl
X3dyaXRlKHBsNGUsIGw0ZSk7CiAgICAgICAgICAgICBlZmlfdXBkYXRlX2w0X3BndGFibGUobDRf
dGFibGVfb2Zmc2V0KHYpLCBsNGUpOwotICAgICAgICAgICAgcGwzZSA9IE5VTEw7CisgICAgICAg
ICAgICBsM3QgPSBOVUxMOwogICAgICAgICB9CiAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAg
ICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwotICAgICAgICBpZiAoIHBsM2Ug
KQotICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsM2UpOworICAgICAgICBpZiAoIGwz
dCApCisgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUobDN0KTsKICAgICB9CiAKICAgICBy
ZXR1cm4gbDRlX3RvX2wzZSgqcGw0ZSkgKyBsM190YWJsZV9vZmZzZXQodik7CkBAIC00OTM5LDIy
ICs0OTM5LDIyIEBAIHN0YXRpYyBsMl9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wyZSh1bnNpZ25l
ZCBsb25nIHYpCiAgICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VO
VCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lTX1NU
QVRFX2Jvb3Q7Ci0gICAgICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IGFsbG9jX3hlbl9wYWdldGFi
bGUoKTsKKyAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7
CiAKLSAgICAgICAgaWYgKCAhcGwyZSApCisgICAgICAgIGlmICggIWwydCApCiAgICAgICAgICAg
ICByZXR1cm4gTlVMTDsKLSAgICAgICAgY2xlYXJfcGFnZShwbDJlKTsKKyAgICAgICAgY2xlYXJf
cGFnZShsMnQpOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2Nr
KCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAm
IF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAgbDNlX3dyaXRlKHBsM2Us
IGwzZV9mcm9tX3BhZGRyKF9fcGEocGwyZSksIF9fUEFHRV9IWVBFUlZJU09SKSk7Ci0gICAgICAg
ICAgICBwbDJlID0gTlVMTDsKKyAgICAgICAgICAgIGwzZV93cml0ZShwbDNlLCBsM2VfZnJvbV9w
YWRkcihfX3BhKGwydCksIF9fUEFHRV9IWVBFUlZJU09SKSk7CisgICAgICAgICAgICBsMnQgPSBO
VUxMOwogICAgICAgICB9CiAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICBzcGlu
X3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwotICAgICAgICBpZiAoIHBsMmUgKQotICAgICAgICAg
ICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsMmUpOworICAgICAgICBpZiAoIGwydCApCisgICAgICAg
ICAgICBmcmVlX3hlbl9wYWdldGFibGUobDJ0KTsKICAgICB9CiAKICAgICBCVUdfT04obDNlX2dl
dF9mbGFncygqcGwzZSkgJiBfUEFHRV9QU0UpOwpAQCAtNDk3MiwyMiArNDk3MiwyMiBAQCBsMV9w
Z2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgIHsKICAgICAgICAgYm9v
bCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwxX3Bn
ZW50cnlfdCAqcGwxZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKKyAgICAgICAgbDFfcGdlbnRy
eV90ICpsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAKLSAgICAgICAgaWYgKCAhcGwxZSAp
CisgICAgICAgIGlmICggIWwxdCApCiAgICAgICAgICAgICByZXR1cm4gTlVMTDsKLSAgICAgICAg
Y2xlYXJfcGFnZShwbDFlKTsKKyAgICAgICAgY2xlYXJfcGFnZShsMXQpOwogICAgICAgICBpZiAo
IGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAg
ICAgIGlmICggIShsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAg
ICAgewotICAgICAgICAgICAgbDJlX3dyaXRlKHBsMmUsIGwyZV9mcm9tX3BhZGRyKF9fcGEocGwx
ZSksIF9fUEFHRV9IWVBFUlZJU09SKSk7Ci0gICAgICAgICAgICBwbDFlID0gTlVMTDsKKyAgICAg
ICAgICAgIGwyZV93cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3BhKGwxdCksIF9fUEFHRV9I
WVBFUlZJU09SKSk7CisgICAgICAgICAgICBsMXQgPSBOVUxMOwogICAgICAgICB9CiAgICAgICAg
IGlmICggbG9ja2luZyApCiAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2sp
OwotICAgICAgICBpZiAoIHBsMWUgKQotICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBs
MWUpOworICAgICAgICBpZiAoIGwxdCApCisgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUo
bDF0KTsKICAgICB9CiAKICAgICBCVUdfT04obDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9Q
U0UpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
