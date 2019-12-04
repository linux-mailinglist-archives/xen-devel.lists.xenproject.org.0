Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B7113092
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYCX-00044a-1M; Wed, 04 Dec 2019 17:12:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYCV-00043u-Dy
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:12:31 +0000
X-Inumbo-ID: 3ccfc3f6-16b9-11ea-8206-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ccfc3f6-16b9-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479543; x=1607015543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=LsQ2twpzgGtqXKdPEhbw1AxuIuCOiWWm1sFLJuyB5cY=;
 b=qlea50Bs2s/zilnfu/AqLaNFX1wNSmqfJ8rnzC4zBdn9zwKkWiBggQud
 64cCWcLCXhZio3yZqqSxVVZQEbGXZUxWgDaMuo+8X1krlgst7xxU88c2E
 Fn9G2heH6xvsfz2ToTRu9CGHAfR/oGeQBGIPxqHO6J2gXomXVD/lWlRG+ k=;
IronPort-SDR: EM+pNYPAiCtwzFvVVKvRgw+on+cAyTBEGvt9eDXUXvJLSPZgnA+KeZGXnLn5J0G3Z6g10RvTjf
 dgODimKpxeVg==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; d="scan'208";a="11630609"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Dec 2019 17:11:26 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 92900A2289; Wed,  4 Dec 2019 17:11:25 +0000 (UTC)
Received: from EX13D20UWA002.ant.amazon.com (10.43.160.176) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:16 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D20UWA002.ant.amazon.com (10.43.160.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:15 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:15 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:11:01 +0000
Message-ID: <46de6a6c217fba8a8ecc8da56357716945255775.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 9/9] x86/mm: change pl*e to l*t in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
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
ZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgfCA0MiAr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGQzYjA5NTZhM2EuLjBiODk0MWNh
N2MgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CkBAIC01MDc3LDI1ICs1MDc3LDI1IEBAIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRfdG9feGVu
X2wzZSh1bnNpZ25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3MoKnBsNGUpICYg
X1BBR0VfUFJFU0VOVCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0
YXRlID4gU1lTX1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IGFsbG9j
X3hlbl9wYWdldGFibGUoKTsKKyAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBhbGxvY194ZW5f
cGFnZXRhYmxlKCk7CiAKLSAgICAgICAgaWYgKCAhcGwzZSApCisgICAgICAgIGlmICggIWwzdCAp
CiAgICAgICAgICAgICByZXR1cm4gTlVMTDsKLSAgICAgICAgY2xlYXJfcGFnZShwbDNlKTsKKyAg
ICAgICAgY2xlYXJfcGFnZShsM3QpOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAg
ICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICggIShsNGVfZ2V0X2Zs
YWdzKCpwbDRlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAgICAgICAgbDRf
cGdlbnRyeV90IGw0ZSA9IGw0ZV9mcm9tX3BhZGRyKF9fcGEocGwzZSksIF9fUEFHRV9IWVBFUlZJ
U09SKTsKKyAgICAgICAgICAgIGw0X3BnZW50cnlfdCBsNGUgPSBsNGVfZnJvbV9wYWRkcihfX3Bh
KGwzdCksIF9fUEFHRV9IWVBFUlZJU09SKTsKIAogICAgICAgICAgICAgbDRlX3dyaXRlKHBsNGUs
IGw0ZSk7CiAgICAgICAgICAgICBlZmlfdXBkYXRlX2w0X3BndGFibGUobDRfdGFibGVfb2Zmc2V0
KHYpLCBsNGUpOwotICAgICAgICAgICAgcGwzZSA9IE5VTEw7CisgICAgICAgICAgICBsM3QgPSBO
VUxMOwogICAgICAgICB9CiAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICBzcGlu
X3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwotICAgICAgICBpZiAoIHBsM2UgKQotICAgICAgICAg
ICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsM2UpOworICAgICAgICBpZiAoIGwzdCApCisgICAgICAg
ICAgICBmcmVlX3hlbl9wYWdldGFibGUobDN0KTsKICAgICB9CiAKICAgICByZXR1cm4gbDRlX3Rv
X2wzZSgqcGw0ZSkgKyBsM190YWJsZV9vZmZzZXQodik7CkBAIC01MTEyLDIyICs1MTEyLDIyIEBA
IHN0YXRpYyBsMl9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wyZSh1bnNpZ25lZCBsb25nIHYpCiAg
ICAgaWYgKCAhKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgIHsK
ICAgICAgICAgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX2Jvb3Q7Ci0g
ICAgICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKKyAgICAg
ICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAKLSAgICAgICAg
aWYgKCAhcGwyZSApCisgICAgICAgIGlmICggIWwydCApCiAgICAgICAgICAgICByZXR1cm4gTlVM
TDsKLSAgICAgICAgY2xlYXJfcGFnZShwbDJlKTsKKyAgICAgICAgY2xlYXJfcGFnZShsMnQpOwog
ICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJf
bG9jayk7CiAgICAgICAgIGlmICggIShsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BSRVNF
TlQpICkKICAgICAgICAgewotICAgICAgICAgICAgbDNlX3dyaXRlKHBsM2UsIGwzZV9mcm9tX3Bh
ZGRyKF9fcGEocGwyZSksIF9fUEFHRV9IWVBFUlZJU09SKSk7Ci0gICAgICAgICAgICBwbDJlID0g
TlVMTDsKKyAgICAgICAgICAgIGwzZV93cml0ZShwbDNlLCBsM2VfZnJvbV9wYWRkcihfX3BhKGwy
dCksIF9fUEFHRV9IWVBFUlZJU09SKSk7CisgICAgICAgICAgICBsMnQgPSBOVUxMOwogICAgICAg
ICB9CiAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFw
X3BnZGlyX2xvY2spOwotICAgICAgICBpZiAoIHBsMmUgKQotICAgICAgICAgICAgZnJlZV94ZW5f
cGFnZXRhYmxlKHBsMmUpOworICAgICAgICBpZiAoIGwydCApCisgICAgICAgICAgICBmcmVlX3hl
bl9wYWdldGFibGUobDJ0KTsKICAgICB9CiAKICAgICBCVUdfT04obDNlX2dldF9mbGFncygqcGwz
ZSkgJiBfUEFHRV9QU0UpOwpAQCAtNTE0NSwyMiArNTE0NSwyMiBAQCBsMV9wZ2VudHJ5X3QgKnZp
cnRfdG9feGVuX2wxZSh1bnNpZ25lZCBsb25nIHYpCiAgICAgaWYgKCAhKGwyZV9nZXRfZmxhZ3Mo
KnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgKQogICAgIHsKICAgICAgICAgYm9vbCBsb2NraW5nID0g
c3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX2Jvb3Q7Ci0gICAgICAgIGwxX3BnZW50cnlfdCAqcGwx
ZSA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKKyAgICAgICAgbDFfcGdlbnRyeV90ICpsMXQgPSBh
bGxvY194ZW5fcGFnZXRhYmxlKCk7CiAKLSAgICAgICAgaWYgKCAhcGwxZSApCisgICAgICAgIGlm
ICggIWwxdCApCiAgICAgICAgICAgICByZXR1cm4gTlVMTDsKLSAgICAgICAgY2xlYXJfcGFnZShw
bDFlKTsKKyAgICAgICAgY2xlYXJfcGFnZShsMXQpOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQog
ICAgICAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CiAgICAgICAgIGlmICggIShs
MmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BSRVNFTlQpICkKICAgICAgICAgewotICAgICAg
ICAgICAgbDJlX3dyaXRlKHBsMmUsIGwyZV9mcm9tX3BhZGRyKF9fcGEocGwxZSksIF9fUEFHRV9I
WVBFUlZJU09SKSk7Ci0gICAgICAgICAgICBwbDFlID0gTlVMTDsKKyAgICAgICAgICAgIGwyZV93
cml0ZShwbDJlLCBsMmVfZnJvbV9wYWRkcihfX3BhKGwxdCksIF9fUEFHRV9IWVBFUlZJU09SKSk7
CisgICAgICAgICAgICBsMXQgPSBOVUxMOwogICAgICAgICB9CiAgICAgICAgIGlmICggbG9ja2lu
ZyApCiAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwotICAgICAgICBp
ZiAoIHBsMWUgKQotICAgICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHBsMWUpOworICAgICAg
ICBpZiAoIGwxdCApCisgICAgICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUobDF0KTsKICAgICB9
CiAKICAgICBCVUdfT04obDJlX2dldF9mbGFncygqcGwyZSkgJiBfUEFHRV9QU0UpOwotLSAKMi4x
Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
