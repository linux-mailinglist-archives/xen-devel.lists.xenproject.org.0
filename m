Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6448BEED9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQOF-00052Q-9E; Thu, 26 Sep 2019 09:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQOD-00050b-Qg
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:45 +0000
X-Inumbo-ID: d3402a68-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id d3402a68-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491324; x=1601027324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=swDCRUW0LzPuFtPbYgjWPDHeLL7krWJ7Ji5Wu5oJhuE=;
 b=G8ovb6z/lCDMk6fSCtHj3t3IzZU2Qz4L1jdQdp57eWvJbXhQfHAkyJZw
 IvvnY55tdaVQnYibH4/dnkjZnRWtUcdYPqTPXGCqXJ8+/TsMiIrDCVErv
 5B6JIx6OBzdCGDe6EWrpVlI8UbhIObPuGTd754BudMw7qru1s5l4xfRrf s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836988696"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:47:51 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 82EBBA2376; Thu, 26 Sep 2019 09:47:39 +0000 (UTC)
Received: from EX13D06UWA003.ant.amazon.com (10.43.160.13) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:10 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D06UWA003.ant.amazon.com (10.43.160.13) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:10 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:08 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:32 +0100
Message-ID: <75febda9a3f5b8263df37cc09e8a1bda409d48b9.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 09/84] x86/mm: add an end_of_loop label in
 modify_xen_mappings
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVyIHRoZSBvdXQgbW9zdCBsb29wCmlzIGVuZGVkLiBB
ZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZhbnQgY29udGludWUncyBpbnRvIGdvdG8ncy4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDE1ICsrKysrKysrLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDNhNzk5ZTE3
ZTQuLmIyMGQ0MTdmZWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC01NDQ1LDcgKzU0NDUsNyBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5n
cyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogCiAg
ICAgICAgICAgICB2ICs9IDFVTCA8PCBMM19QQUdFVEFCTEVfU0hJRlQ7CiAgICAgICAgICAgICB2
ICY9IH4oKDFVTCA8PCBMM19QQUdFVEFCTEVfU0hJRlQpIC0gMSk7Ci0gICAgICAgICAgICBjb250
aW51ZTsKKyAgICAgICAgICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgIH0KIAogICAgICAg
ICBpZiAoIGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFICkKQEAgLTU0NjMsNyArNTQ2
Myw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQg
bG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAKICAgICAgICAgICAgICAgICBsM2Vfd3JpdGVfYXRv
bWljKHBsM2UsIG5sM2UpOwogICAgICAgICAgICAgICAgIHYgKz0gMVVMIDw8IEwzX1BBR0VUQUJM
RV9TSElGVDsKLSAgICAgICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgICAgICAgICBnb3Rv
IGVuZF9vZl9sb29wOwogICAgICAgICAgICAgfQogCiAgICAgICAgICAgICAvKiBQQUdFMUdCOiBz
aGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KQEAgLTU1MDcsNyArNTUw
Nyw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQg
bG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAKICAgICAgICAgICAgIHYgKz0gMVVMIDw8IEwyX1BB
R0VUQUJMRV9TSElGVDsKICAgICAgICAgICAgIHYgJj0gfigoMVVMIDw8IEwyX1BBR0VUQUJMRV9T
SElGVCkgLSAxKTsKLSAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgZ290byBlbmRf
b2ZfbG9vcDsKICAgICAgICAgfQogCiAgICAgICAgIGlmICggbDJlX2dldF9mbGFncygqcGwyZSkg
JiBfUEFHRV9QU0UgKQpAQCAtNTU4MSw3ICs1NTgxLDcgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGlu
Z3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAg
ICAgICAgICAgICAqIHNraXAgdGhlIGVtcHR5JmZyZWUgY2hlY2suCiAgICAgICAgICAgICAgKi8K
ICAgICAgICAgICAgIGlmICggKG5mICYgX1BBR0VfUFJFU0VOVCkgfHwgKCh2ICE9IGUpICYmIChs
MV90YWJsZV9vZmZzZXQodikgIT0gMCkpICkKLSAgICAgICAgICAgICAgICBjb250aW51ZTsKKyAg
ICAgICAgICAgICAgICBnb3RvIGVuZF9vZl9sb29wOwogICAgICAgICAgICAgaWYgKCBsb2NraW5n
ICkKICAgICAgICAgICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKIApAQCAtNTYw
MCw3ICs1NjAwLDcgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1
bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygm
bWFwX3BnZGlyX2xvY2spOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAg
ICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwxdCA9
IGwyZV90b19sMWUoKnBsMmUpOwpAQCAtNTYyNyw3ICs1NjI3LDcgQEAgaW50IG1vZGlmeV94ZW5f
bWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBu
ZikKICAgICAgICAgICovCiAgICAgICAgIGlmICggKG5mICYgX1BBR0VfUFJFU0VOVCkgfHwKICAg
ICAgICAgICAgICAoKHYgIT0gZSkgJiYgKGwyX3RhYmxlX29mZnNldCh2KSArIGwxX3RhYmxlX29m
ZnNldCh2KSAhPSAwKSkgKQotICAgICAgICAgICAgY29udGludWU7CisgICAgICAgICAgICBnb3Rv
IGVuZF9vZl9sb29wOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9s
b2NrKCZtYXBfcGdkaXJfbG9jayk7CiAKQEAgLTU2NDAsNyArNTY0MCw3IEBAIGludCBtb2RpZnlf
eGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBp
bnQgbmYpCiAgICAgICAgIHsKICAgICAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAg
ICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgICAgIGNvbnRpbnVl
OworICAgICAgICAgICAgZ290byBlbmRfb2ZfbG9vcDsKICAgICAgICAgfQogCiAgICAgICAgIHsK
QEAgLTU2NjIsNiArNTY2Miw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxv
bmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAgICAgICBlbHNl
IGlmICggbG9ja2luZyApCiAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9s
b2NrKTsKICAgICAgICAgfQorICAgIGVuZF9vZl9sb29wOjsKICAgICB9CiAKICAgICBmbHVzaF9h
cmVhKE5VTEwsIEZMVVNIX1RMQl9HTE9CQUwpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
