Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36EE113090
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:14:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYBY-0003eR-89; Wed, 04 Dec 2019 17:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYBW-0003dl-Vk
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:11:31 +0000
X-Inumbo-ID: 1ad1e3a6-16b9-11ea-99dd-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ad1e3a6-16b9-11ea-99dd-bc764e2007e4;
 Wed, 04 Dec 2019 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479487; x=1607015487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EYfCIj2Gqtk8HkH0KYoxsuNrgK9hmsX7lSjIby5tXNY=;
 b=E7sgft8o7qJV9zBvwy7CAxzTbb1g4OM+sLlIMU7D3FyFEoigRmlJb93k
 d3SNZ48fpv7bX4cUV9QWGATsbexUL9QIB3PmdS/INIMb6ESAE7Zk+SHIn
 dFhAbk0NywJ+0UelQZJSRjZ0Qq+ye01FhvaHXF1evLS4Gqph9t9KyxW6b k=;
IronPort-SDR: 1lPP7fEz9k7IepBAekmxDqvb1GVa+sETliCxJSX1Z7kKiOjDMqEdid2i4oLTZIr9yhvckSbnd1
 24e78wxvshWg==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="7655312"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Dec 2019 17:11:26 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 85206A2111; Wed,  4 Dec 2019 17:11:24 +0000 (UTC)
Received: from EX13D03UWA003.ant.amazon.com (10.43.160.39) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03UWA003.ant.amazon.com (10.43.160.39) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:14 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:13 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:11:00 +0000
Message-ID: <1f413130d6ab27ab5f7754606ffed38bdff0829c.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 8/9] x86/mm: add an end_of_loop label in
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
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
aXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDRjNjU5YzI4
ZDguLmQzYjA5NTZhM2EgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9tbS5jCkBAIC01NjA0LDcgKzU2MDQsNyBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5n
cyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQogCiAg
ICAgICAgICAgICB2ICs9IDFVTCA8PCBMM19QQUdFVEFCTEVfU0hJRlQ7CiAgICAgICAgICAgICB2
ICY9IH4oKDFVTCA8PCBMM19QQUdFVEFCTEVfU0hJRlQpIC0gMSk7Ci0gICAgICAgICAgICBjb250
aW51ZTsKKyAgICAgICAgICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgIH0KIAogICAgICAg
ICBpZiAoIGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFICkKQEAgLTU2MjIsNyArNTYy
Miw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQg
bG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAKICAgICAgICAgICAgICAgICBsM2Vfd3JpdGVfYXRv
bWljKHBsM2UsIG5sM2UpOwogICAgICAgICAgICAgICAgIHYgKz0gMVVMIDw8IEwzX1BBR0VUQUJM
RV9TSElGVDsKLSAgICAgICAgICAgICAgICBjb250aW51ZTsKKyAgICAgICAgICAgICAgICBnb3Rv
IGVuZF9vZl9sb29wOwogICAgICAgICAgICAgfQogCiAgICAgICAgICAgICAvKiBQQUdFMUdCOiBz
aGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIGZhbGwgdGhyb3VnaC4gKi8KQEAgLTU2NjMsNyArNTY2
Myw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQg
bG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAKICAgICAgICAgICAgIHYgKz0gMVVMIDw8IEwyX1BB
R0VUQUJMRV9TSElGVDsKICAgICAgICAgICAgIHYgJj0gfigoMVVMIDw8IEwyX1BBR0VUQUJMRV9T
SElGVCkgLSAxKTsKLSAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAgZ290byBlbmRf
b2ZfbG9vcDsKICAgICAgICAgfQogCiAgICAgICAgIGlmICggbDJlX2dldF9mbGFncygqcGwyZSkg
JiBfUEFHRV9QU0UgKQpAQCAtNTczNCw3ICs1NzM0LDcgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGlu
Z3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAg
ICAgICAgICAgICAqIHNraXAgdGhlIGVtcHR5JmZyZWUgY2hlY2suCiAgICAgICAgICAgICAgKi8K
ICAgICAgICAgICAgIGlmICggKG5mICYgX1BBR0VfUFJFU0VOVCkgfHwgKCh2ICE9IGUpICYmIChs
MV90YWJsZV9vZmZzZXQodikgIT0gMCkpICkKLSAgICAgICAgICAgICAgICBjb250aW51ZTsKKyAg
ICAgICAgICAgICAgICBnb3RvIGVuZF9vZl9sb29wOwogICAgICAgICAgICAgaWYgKCBsb2NraW5n
ICkKICAgICAgICAgICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKIApAQCAtNTc1
Myw3ICs1NzUzLDcgQEAgaW50IG1vZGlmeV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1
bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBuZikKICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygm
bWFwX3BnZGlyX2xvY2spOwotICAgICAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICAgICAg
ICAgIGdvdG8gZW5kX29mX2xvb3A7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAgIGwxdCA9
IGwyZV90b19sMWUoKnBsMmUpOwpAQCAtNTc4MCw3ICs1NzgwLDcgQEAgaW50IG1vZGlmeV94ZW5f
bWFwcGluZ3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBu
ZikKICAgICAgICAgICovCiAgICAgICAgIGlmICggKG5mICYgX1BBR0VfUFJFU0VOVCkgfHwKICAg
ICAgICAgICAgICAoKHYgIT0gZSkgJiYgKGwyX3RhYmxlX29mZnNldCh2KSArIGwxX3RhYmxlX29m
ZnNldCh2KSAhPSAwKSkgKQotICAgICAgICAgICAgY29udGludWU7CisgICAgICAgICAgICBnb3Rv
IGVuZF9vZl9sb29wOwogICAgICAgICBpZiAoIGxvY2tpbmcgKQogICAgICAgICAgICAgc3Bpbl9s
b2NrKCZtYXBfcGdkaXJfbG9jayk7CiAKQEAgLTU3OTMsNyArNTc5Myw3IEBAIGludCBtb2RpZnlf
eGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBp
bnQgbmYpCiAgICAgICAgIHsKICAgICAgICAgICAgIGlmICggbG9ja2luZyApCiAgICAgICAgICAg
ICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKLSAgICAgICAgICAgIGNvbnRpbnVl
OworICAgICAgICAgICAgZ290byBlbmRfb2ZfbG9vcDsKICAgICAgICAgfQogCiAgICAgICAgIHsK
QEAgLTU4MTUsNiArNTgxNSw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxv
bmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAgICAgICBlbHNl
IGlmICggbG9ja2luZyApCiAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9s
b2NrKTsKICAgICAgICAgfQorICAgIGVuZF9vZl9sb29wOjsKICAgICB9CiAKICAgICBmbHVzaF9h
cmVhKE5VTEwsIEZMVVNIX1RMQl9HTE9CQUwpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
