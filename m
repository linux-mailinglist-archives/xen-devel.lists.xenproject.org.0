Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D0C1F0B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt0N-0006oz-AC; Mon, 30 Sep 2019 10:34:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt0L-0006o9-QJ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:34:09 +0000
X-Inumbo-ID: d5e9f432-e36d-11e9-96cc-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id d5e9f432-e36d-11e9-96cc-12813bfff9fa;
 Mon, 30 Sep 2019 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839649; x=1601375649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=5eAgOpLk7B+gyLwhtLD5m88hf+aaR83vnf4le+j06Qo=;
 b=UU9dkwhTlpY05BPCDqiAUUgyJNDZoOrYwUlL/i4j7//lsllLV279I7ET
 BbCU1e987WLhT3V8stBUIX3k2h3zlnYw9vN3lutezVsWKfnNcgjCd0WYd
 u5rf1atMJZEjE96cXjGNfhD4gn+7B8oaozTrCrjzDAIz66uv1RsE8xXjq w=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630032"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8D1B5A20FA; Mon, 30 Sep 2019 10:34:06 +0000 (UTC)
Received: from EX13D11UEE003.ant.amazon.com (10.43.62.248) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:55 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D11UEE003.ant.amazon.com (10.43.62.248) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:33:55 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:33:54 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:32:59 +0100
Message-ID: <a75071348faa1f32d529ded7ebbd9407993aa544.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 07/55] x86/mm: add an end_of_loop label in
 map_pages_to_xen
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

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGNsZWFuIHVwIG1hcHBpbmdzIHdoZW5ldmVyIHRoZSBvdXQgbW9zdCBsb29wIGlzCmVuZGVkLiBB
ZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZhbnQgY29udGludWUncyBpbnRvIGdvdG8ncy4K
Ck5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDkgKysrKystLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggYmEzODUyNWQzNi4uMDkx
NmFhNzRhZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2
L21tLmMKQEAgLTUxMDIsNyArNTEwMiw3IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAogICAgICAg
ICAgICAgaWYgKCAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAgICAgICBt
Zm4gID0gbWZuX2FkZChtZm4sIDFVTCA8PCAoTDNfUEFHRVRBQkxFX1NISUZUIC0gUEFHRV9TSElG
VCkpOwogICAgICAgICAgICAgbnJfbWZucyAtPSAxVUwgPDwgKEwzX1BBR0VUQUJMRV9TSElGVCAt
IFBBR0VfU0hJRlQpOwotICAgICAgICAgICAgY29udGludWU7CisgICAgICAgICAgICBnb3RvIGVu
ZF9vZl9sb29wOwogICAgICAgICB9CiAKICAgICAgICAgaWYgKCAobDNlX2dldF9mbGFncyhvbDNl
KSAmIF9QQUdFX1BSRVNFTlQpICYmCkBAIC01MTI5LDcgKzUxMjksNyBAQCBpbnQgbWFwX3BhZ2Vz
X3RvX3hlbigKICAgICAgICAgICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikg
KQogICAgICAgICAgICAgICAgICAgICBtZm4gPSBtZm5fYWRkKG1mbiwgaSk7CiAgICAgICAgICAg
ICAgICAgbnJfbWZucyAtPSBpOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAg
ICAgICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwy
dCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKQEAgLTUzMTAsNyArNTMxMCw3IEBAIGludCBtYXBf
cGFnZXNfdG9feGVuKAogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgaWYg
KCBsb2NraW5nICkKICAgICAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdk
aXJfbG9jayk7Ci0gICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgICAg
ICAgICBnb3RvIGVuZF9vZl9sb29wOwogICAgICAgICAgICAgICAgIH0KIAogICAgICAgICAgICAg
ICAgIGlmICggbDJlX2dldF9mbGFncyhvbDJlKSAmIF9QQUdFX1BTRSApCkBAIC01MzY1LDcgKzUz
NjUsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbigKICAgICAgICAgICAgIHsKICAgICAgICAgICAg
ICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmbWFw
X3BnZGlyX2xvY2spOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgICAg
IGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwydCA9IGwz
ZV90b19sMmUob2wzZSk7CkBAIC01MzkwLDYgKzUzOTAsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hl
bigKICAgICAgICAgICAgIGVsc2UgaWYgKCBsb2NraW5nICkKICAgICAgICAgICAgICAgICBzcGlu
X3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwogICAgICAgICB9CisgICAgZW5kX29mX2xvb3A6Owog
ICAgIH0KIAogI3VuZGVmIGZsdXNoX2ZsYWdzCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
