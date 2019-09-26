Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C28CBEEF6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOe-0005iK-1b; Thu, 26 Sep 2019 09:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOc-0005gr-PC
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:49:10 +0000
X-Inumbo-ID: da9f1e5e-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id da9f1e5e-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491335; x=1601027335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=g3nBDFD3rOj2j8Dpfaejkhy+nfkyUfS2Tj2b5j5iSC8=;
 b=jjjI688CVQKTlsax/ieFOGsHYCl/4YQgypOe6ClWTKgwzlTkLYpu42GO
 iM9moHaW4j6wSvABMQbDgm31Qm/AMBNDPclbCCiQ2NJC+fJfdhxwL93Xy
 Tcone1nLXJvVLVP9U2EIT5QKLiNathmtHdiCP+BwRDNUtU8UIKHAdFrPC U=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417788324"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:48:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0D523A2A39; Thu, 26 Sep 2019 09:48:53 +0000 (UTC)
Received: from EX13D18UWA004.ant.amazon.com (10.43.160.45) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:20 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA004.ant.amazon.com (10.43.160.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:19 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:18 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:10 +0100
Message-ID: <1616300d2e376baba872b00809c500cba64787ae.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 47/84] x86_64/mm: map and unmap page tables
 in cleanup_frame_table
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MjQgKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveDg2XzY0L21t
LmMgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKaW5kZXggMGZhYzcxMzU2Yi4uYmJkZjFlZTQ3
YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfNjQvbW0uYwpAQCAtODAxLDggKzgwMSw4IEBAIHZvaWQgZnJlZV9jb21wYXRfYXJnX3hs
YXQoc3RydWN0IHZjcHUgKnYpCiBzdGF0aWMgdm9pZCBjbGVhbnVwX2ZyYW1lX3RhYmxlKHN0cnVj
dCBtZW1faG90YWRkX2luZm8gKmluZm8pCiB7CiAgICAgdW5zaWduZWQgbG9uZyBzdmEsIGV2YTsK
LSAgICBsM19wZ2VudHJ5X3QgbDNlOwotICAgIGwyX3BnZW50cnlfdCBsMmU7CisgICAgbDNfcGdl
bnRyeV90IGwzZSwgKmwzdDsKKyAgICBsMl9wZ2VudHJ5X3QgbDJlLCAqbDJ0OwogICAgIG1mbl90
IHNwZm4sIGVwZm47CiAKICAgICBzcGZuID0gX21mbihpbmZvLT5zcGZuKTsKQEAgLTgxNiw4ICs4
MTYsMTAgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9mcmFtZV90YWJsZShzdHJ1Y3QgbWVtX2hvdGFk
ZF9pbmZvICppbmZvKQogCiAgICAgd2hpbGUgKHN2YSA8IGV2YSkKICAgICB7Ci0gICAgICAgIGwz
ZSA9IGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoc3ZhKV0pWwotICAg
ICAgICAgIGwzX3RhYmxlX29mZnNldChzdmEpXTsKKyAgICAgICAgbDN0ID0gbWFwX3hlbl9wYWdl
dGFibGVfbmV3KAorICAgICAgICAgICAgbDRlX2dldF9tZm4oaWRsZV9wZ190YWJsZVtsNF90YWJs
ZV9vZmZzZXQoc3ZhKV0pKTsKKyAgICAgICAgbDNlID0gbDN0W2wzX3RhYmxlX29mZnNldChzdmEp
XTsKKyAgICAgICAgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDN0KTsKICAgICAgICAgaWYgKCAh
KGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BSRVNFTlQpIHx8CiAgICAgICAgICAgICAgKGwz
ZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdFX1BTRSkgKQogICAgICAgICB7CkBAIC04MjYsNyArODI4
LDkgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9mcmFtZV90YWJsZShzdHJ1Y3QgbWVtX2hvdGFkZF9p
bmZvICppbmZvKQogICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgIH0KIAotICAgICAgICBs
MmUgPSBsM2VfdG9fbDJlKGwzZSlbbDJfdGFibGVfb2Zmc2V0KHN2YSldOworICAgICAgICBsMnQg
PSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDNlX2dldF9tZm4obDNlKSk7CisgICAgICAgIGwyZSA9
IGwydFtsMl90YWJsZV9vZmZzZXQoc3ZhKV07CisgICAgICAgIFVOTUFQX1hFTl9QQUdFVEFCTEVf
TkVXKGwydCk7CiAgICAgICAgIEFTU0VSVChsMmVfZ2V0X2ZsYWdzKGwyZSkgJiBfUEFHRV9QUkVT
RU5UKTsKIAogICAgICAgICBpZiAoIChsMmVfZ2V0X2ZsYWdzKGwyZSkgJiAoX1BBR0VfUFJFU0VO
VCB8IF9QQUdFX1BTRSkpID09CkBAIC04NDIsOCArODQ2LDE0IEBAIHN0YXRpYyB2b2lkIGNsZWFu
dXBfZnJhbWVfdGFibGUoc3RydWN0IG1lbV9ob3RhZGRfaW5mbyAqaW5mbykKICAgICAgICAgICAg
IGNvbnRpbnVlOwogICAgICAgICB9CiAKLSAgICAgICAgQVNTRVJUKGwxZV9nZXRfZmxhZ3MobDJl
X3RvX2wxZShsMmUpW2wxX3RhYmxlX29mZnNldChzdmEpXSkgJgotICAgICAgICAgICAgICAgIF9Q
QUdFX1BSRVNFTlQpOworI2lmbmRlZiBOREVCVUcKKyAgICAgICAgeworICAgICAgICAgICAgbDFf
cGdlbnRyeV90ICpsMXQgPSBtYXBfeGVuX3BhZ2V0YWJsZV9uZXcobDJlX2dldF9tZm4obDJlKSk7
CisgICAgICAgICAgICBBU1NFUlQobDFlX2dldF9mbGFncyhsMXRbbDFfdGFibGVfb2Zmc2V0KHN2
YSldKSAmCisgICAgICAgICAgICAgICAgICAgX1BBR0VfUFJFU0VOVCk7CisgICAgICAgICAgICBV
Tk1BUF9YRU5fUEFHRVRBQkxFX05FVyhsMXQpOworICAgICAgICB9CisjZW5kaWYKICAgICAgICAg
IHN2YSA9IChzdmEgJiB+KCgxVUwgPDwgUEFHRV9TSElGVCkgLSAxKSkgKwogICAgICAgICAgICAg
ICAgICAgICAoMVVMIDw8IFBBR0VfU0hJRlQpOwogICAgIH0KLS0gCjIuMTcuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
