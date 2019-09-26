Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFE0BEF0C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:54:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQQL-0001Kp-67; Thu, 26 Sep 2019 09:50:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQQE-0001Aw-VB
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:50 +0000
X-Inumbo-ID: 1eec13be-e043-11e9-964c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id 1eec13be-e043-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491449; x=1601027449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kXHcgiUvuLHbcZv8fnxbRiyV9RFWhHe9YC9kc1lD21c=;
 b=kApuKHNqTXBAwCu7gg1waklXLZqp18XaTQIAKv11IwlkUZyr8blE0GO9
 faja+14OE2cxq1OcOlCucfdrlZ6UmYwNnUDevV96AxprAUGB9ux30GrMq
 jdjg49tYtpIR3Er+BcPMItkmGJqGek3356kFOMUUuGCPlLCQ0/rIqIYds s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535511"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:50:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1A89BA1D79; Thu, 26 Sep 2019 09:50:48 +0000 (UTC)
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:10 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB003.ant.amazon.com (10.43.166.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:50:08 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:50:06 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:44 +0100
Message-ID: <08be36e125433c438191fa17bbdaed5b50088530.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 81/84] x86/mm: optimise and properly unmap
 pages in virt_to_mfn_walk().
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClRoaXMgYWxzbyByZXNvbHZl
cyBhIG1hcGNhY2hlIG92ZXJmbG93IGJ1Zy4KClNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxo
b25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tLmMgICAgICAgIHwgNTcgKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oIHwgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDIyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2
L21tLmMKaW5kZXggMzliYTlmOWJmNC4uZjNjOTA0MmJhNiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTUwNTYsNDIgKzUwNTYsNTcgQEAg
bDFfcGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KQogICAgIHJldHVy
biBwbDFlOwogfQogCisvKgorICogVW5saWtlIHZpcnRfdG9fbWZuKCkgd2hpY2gganVzdCB0cmFu
c2xhdGVzIGJldHdlZW4gdGhlIGRpcmVjdCBtYXAgYW5kIHRoZQorICogbWZuLCB0aGlzIHZlcnNp
b24gYWN0dWFsbHkgd2Fsa3MgdGhlIHBhZ2UgdGFibGUgdG8gZmluZCB0aGUgbWZuIG9mIGFueQor
ICogdmlydHVhbCBhZGRyZXNzLCBhcyBsb25nIGFzIGl0IGlzIG1hcHBlZC4gSWYgbm90LCBJTlZB
TElEX01GTiBpcyByZXR1cm5lZC4KKyAqLwogdW5zaWduZWQgbG9uZyB2aXJ0X3RvX21mbl93YWxr
KHZvaWQgKnZhKQogewogICAgIHVuc2lnbmVkIGxvbmcgcmV0OwotICAgIGwzX3BnZW50cnlfdCAq
cGwzZTsKLSAgICBsMl9wZ2VudHJ5X3QgKnBsMmU7Ci0gICAgbDFfcGdlbnRyeV90ICpwbDFlOwot
Ci0gICAgLyoKLSAgICAgKiBGSVhNRTogVGhpcyBpcyByYXRoZXIgdW5vcHRpbWlzZWQsIGJlY2F1
c2UgZS5nLiB2aXJ0X3RvX3hlbl9sMmUKLSAgICAgKiByZWNvbXB1dGVzIHZpcnRfdG9feGVuX2wz
ZSBhZ2Fpbi4gQ2xlYXJseSBvbmUgY2FuIGtlZXAgdGhlIHJlc3VsdCBhbmQKLSAgICAgKiBjYXJy
eSBvbi4KLSAgICAgKi8KKyAgICB1bnNpZ25lZCBsb25nIHYgPSAodW5zaWduZWQgbG9uZyl2YTsK
KyAgICBsM19wZ2VudHJ5X3QgKnBsM2UgPSBOVUxMOworICAgIGwyX3BnZW50cnlfdCAqcGwyZSA9
IE5VTEw7CisgICAgbDFfcGdlbnRyeV90ICpwbDFlID0gTlVMTDsKIAotICAgIHBsM2UgPSB2aXJ0
X3RvX3hlbl9sM2UoKHVuc2lnbmVkIGxvbmcpKHZhKSk7Ci0gICAgQlVHX09OKCEobDNlX2dldF9m
bGFncygqcGwzZSkgJiBfUEFHRV9QUkVTRU5UKSk7CisgICAgcGwzZSA9IHZpcnRfdG9feGVuX2wz
ZSh2KTsKKyAgICBpZiAoICFwbDNlIHx8ICEobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9Q
UkVTRU5UKSApCisgICAgeworICAgICAgICByZXQgPSBtZm5feChJTlZBTElEX01GTik7CisgICAg
ICAgIGdvdG8gb3V0OworICAgIH0KICAgICBpZiAoIGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BB
R0VfUFNFICkKICAgICB7CiAgICAgICAgIHJldCA9IGwzZV9nZXRfcGZuKCpwbDNlKTsKLSAgICAg
ICAgcmV0IHw9ICgoKHVuc2lnbmVkIGxvbmcpdmEgJiAoKDFVTCA8PCBMM19QQUdFVEFCTEVfU0hJ
RlQpLTEpKSA+PiBQQUdFX1NISUZUKTsKLSAgICAgICAgdW5tYXBfeGVuX3BhZ2V0YWJsZShwbDNl
KTsKLSAgICAgICAgcmV0dXJuIHJldDsKKyAgICAgICAgcmV0IHw9ICgodiAmICgoMVVMIDw8IEwz
X1BBR0VUQUJMRV9TSElGVCktMSkpID4+IFBBR0VfU0hJRlQpOworICAgICAgICBnb3RvIG91dDsK
ICAgICB9CiAKLSAgICBwbDJlID0gdmlydF90b194ZW5fbDJlKCh1bnNpZ25lZCBsb25nKSh2YSkp
OwotICAgIEJVR19PTighKGwyZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkpOwor
ICAgIHBsMmUgPSAobDJfcGdlbnRyeV90ICopbWFwX3hlbl9wYWdldGFibGUobDNlX2dldF9tZm4o
KnBsM2UpKQorICAgICAgICAgICAgKyBsMl90YWJsZV9vZmZzZXQodik7CisgICAgaWYgKCAhKGwy
ZV9nZXRfZmxhZ3MoKnBsMmUpICYgX1BBR0VfUFJFU0VOVCkgKQorICAgIHsKKyAgICAgICAgcmV0
ID0gbWZuX3goSU5WQUxJRF9NRk4pOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CiAgICAgaWYg
KCBsMmVfZ2V0X2ZsYWdzKCpwbDJlKSAmIF9QQUdFX1BTRSApCiAgICAgewogICAgICAgICByZXQg
PSBsMmVfZ2V0X3BmbigqcGwyZSk7Ci0gICAgICAgIHJldCB8PSAoKCh1bnNpZ25lZCBsb25nKXZh
ICYgKCgxVUwgPDwgTDJfUEFHRVRBQkxFX1NISUZUKS0xKSkgPj4gUEFHRV9TSElGVCk7Ci0gICAg
ICAgIHVubWFwX3hlbl9wYWdldGFibGUocGwyZSk7Ci0gICAgICAgIHJldHVybiByZXQ7CisgICAg
ICAgIHJldCB8PSAoKHYgJiAoKDFVTCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpLTEpKSA+PiBQQUdF
X1NISUZUKTsKKyAgICAgICAgZ290byBvdXQ7CiAgICAgfQogCi0gICAgcGwxZSA9IHZpcnRfdG9f
eGVuX2wxZSgodW5zaWduZWQgbG9uZykodmEpKTsKLSAgICBCVUdfT04oIShsMWVfZ2V0X2ZsYWdz
KCpwbDFlKSAmIF9QQUdFX1BSRVNFTlQpKTsKKyAgICBwbDFlID0gKGwxX3BnZW50cnlfdCAqKW1h
cF94ZW5fcGFnZXRhYmxlKGwyZV9nZXRfbWZuKCpwbDJlKSkKKyAgICAgICAgICAgICsgbDFfdGFi
bGVfb2Zmc2V0KHYpOworICAgIGlmICggIShsMWVfZ2V0X2ZsYWdzKCpwbDFlKSAmIF9QQUdFX1BS
RVNFTlQpICkKKyAgICB7CisgICAgICAgIHJldCA9IG1mbl94KElOVkFMSURfTUZOKTsKKyAgICAg
ICAgZ290byBvdXQ7CisgICAgfQogICAgIHJldCA9IGwxZV9nZXRfcGZuKCpwbDFlKTsKK291dDoK
KyAgICB1bm1hcF94ZW5fcGFnZXRhYmxlKHBsM2UpOworICAgIHVubWFwX3hlbl9wYWdldGFibGUo
cGwyZSk7CiAgICAgdW5tYXBfeGVuX3BhZ2V0YWJsZShwbDFlKTsKICAgICByZXR1cm4gcmV0Owog
fQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9tbS5oCmluZGV4IGU1ODE5Y2JmZGYuLjQxMTczNzIwN2YgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvbW0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L21tLmgKQEAgLTY0
NSw3ICs2NDUsOCBAQCB2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZShtZm5fdCBtZm4pOwogbDFfcGdl
bnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQgbG9uZyB2KTsKIHVuc2lnbmVkIGxvbmcg
dmlydF90b19tZm5fd2Fsayh2b2lkICp2YSk7CiBzdHJ1Y3QgcGFnZV9pbmZvICp2aXJ0X3RvX3Bh
Z2Vfd2Fsayh2b2lkICp2YSk7Ci0jZGVmaW5lIHZpcnRfdG9fbWFkZHJfd2Fsayh2YSkgbWZuX3Rv
X21hZGRyKF9tZm4odmlydF90b19tZm5fd2Fsayh2YSkpKQorI2RlZmluZSB2aXJ0X3RvX21hZGRy
X3dhbGsodmEpIChtZm5fdG9fbWFkZHIoX21mbih2aXJ0X3RvX21mbl93YWxrKHZhKSkpIHwgXAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKHVuc2lnbmVkIGxvbmcpdmEgJiAoUEFH
RV9TSVpFIC0gMSkpKQogCiBERUNMQVJFX1BFUl9DUFUobWZuX3QsIHJvb3RfcGd0X21mbik7CiAK
LS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
