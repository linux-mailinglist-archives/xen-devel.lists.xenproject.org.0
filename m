Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E3BEF10
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:54:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQRP-0003Cy-Ub; Thu, 26 Sep 2019 09:52:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQRP-0003C3-0u
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:52:03 +0000
X-Inumbo-ID: 49a35e3d-e043-11e9-964d-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 49a35e3d-e043-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491522; x=1601027522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0ZRTMVyTxhD3UAeSMOjD2jf6Xx+XUFYSwEDGxF69GA4=;
 b=klB5hPvPOZyF0u6evgDbtwEM+jan6klo47etBMPz5hJAi/hGWTOv8lTt
 nvlnUstQZEQTAaj6MVHvtfsTxqEY7f8bz/wShi8aHiONpExUj0PXJS5HQ
 GHCrE1CxYMCewjoSSLSYfIJHSjFaz7LfU0FgR8yloQ5Wk+4+DCHGC84S8 Q=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637566"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:49:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 75CDEA21D2; Thu, 26 Sep 2019 09:49:38 +0000 (UTC)
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:17 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB003.ant.amazon.com (10.43.166.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:16 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:13 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:31 +0100
Message-ID: <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 68/84] page_alloc: actually do the mapping
 and unmapping on xenheap.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyax@amazon.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KClNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQogeGVuL2NvbW1vbi9wYWdlX2FsbG9j
LmMgfCAxOCArKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5j
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKaW5kZXggN2NiMWJkMzY4Yi4uNGVjNjI5OWJhOCAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMKQEAgLTIxNDMsNiArMjE0Myw3IEBAIHZvaWQgaW5pdF94ZW5oZWFwX3BhZ2VzKHBh
ZGRyX3QgcHMsIHBhZGRyX3QgcGUpCiB2b2lkICphbGxvY194ZW5oZWFwX3BhZ2VzKHVuc2lnbmVk
IGludCBvcmRlciwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQogewogICAgIHN0cnVjdCBwYWdlX2lu
Zm8gKnBnOworICAgIHZvaWQgKnJldDsKIAogICAgIEFTU0VSVCghaW5faXJxKCkpOwogCkBAIC0y
MTUxLDcgKzIxNTIsMTAgQEAgdm9pZCAqYWxsb2NfeGVuaGVhcF9wYWdlcyh1bnNpZ25lZCBpbnQg
b3JkZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykKICAgICBpZiAoIHVubGlrZWx5KHBnID09IE5V
TEwpICkKICAgICAgICAgcmV0dXJuIE5VTEw7CiAKLSAgICBtZW1ndWFyZF91bmd1YXJkX3Jhbmdl
KHBhZ2VfdG9fdmlydChwZyksIDEgPDwgKG9yZGVyICsgUEFHRV9TSElGVCkpOworICAgIHJldCA9
IHBhZ2VfdG9fdmlydChwZyk7CisgICAgbWVtZ3VhcmRfdW5ndWFyZF9yYW5nZShyZXQsIDEgPDwg
KG9yZGVyICsgUEFHRV9TSElGVCkpOworICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxv
bmcpcmV0LCBwYWdlX3RvX21mbihwZyksCisgICAgICAgICAgICAgICAgICAgICAxVUwgPDwgb3Jk
ZXIsIFBBR0VfSFlQRVJWSVNPUik7CiAKICAgICByZXR1cm4gcGFnZV90b192aXJ0KHBnKTsKIH0K
QEAgLTIxNjUsNiArMjE2OSw4IEBAIHZvaWQgZnJlZV94ZW5oZWFwX3BhZ2VzKHZvaWQgKnYsIHVu
c2lnbmVkIGludCBvcmRlcikKICAgICAgICAgcmV0dXJuOwogCiAgICAgbWVtZ3VhcmRfZ3VhcmRf
cmFuZ2UodiwgMSA8PCAob3JkZXIgKyBQQUdFX1NISUZUKSk7CisgICAgQVNTRVJUKCh1bnNpZ25l
ZCBsb25nKXYgPj0gRElSRUNUTUFQX1ZJUlRfU1RBUlQpOworICAgIG1hcF9wYWdlc190b194ZW4o
KHVuc2lnbmVkIGxvbmcpdiwgSU5WQUxJRF9NRk4sIDFVTCA8PCBvcmRlciwgX1BBR0VfTk9ORSk7
CiAKICAgICBmcmVlX2hlYXBfcGFnZXModmlydF90b19wYWdlKHYpLCBvcmRlciwgZmFsc2UpOwog
fQpAQCAtMjE4OSw2ICsyMTk1LDcgQEAgdm9pZCAqYWxsb2NfeGVuaGVhcF9wYWdlcyh1bnNpZ25l
ZCBpbnQgb3JkZXIsIHVuc2lnbmVkIGludCBtZW1mbGFncykKIHsKICAgICBzdHJ1Y3QgcGFnZV9p
bmZvICpwZzsKICAgICB1bnNpZ25lZCBpbnQgaTsKKyAgICB2b2lkICpyZXQ7CiAKICAgICBBU1NF
UlQoIWluX2lycSgpKTsKIApAQCAtMjIwNCw3ICsyMjExLDExIEBAIHZvaWQgKmFsbG9jX3hlbmhl
YXBfcGFnZXModW5zaWduZWQgaW50IG9yZGVyLCB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpCiAgICAg
Zm9yICggaSA9IDA7IGkgPCAoMXUgPDwgb3JkZXIpOyBpKysgKQogICAgICAgICBwZ1tpXS5jb3Vu
dF9pbmZvIHw9IFBHQ194ZW5faGVhcDsKIAotICAgIHJldHVybiBwYWdlX3RvX3ZpcnQocGcpOwor
ICAgIHJldCA9IHBhZ2VfdG9fdmlydChwZyk7CisgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWdu
ZWQgbG9uZylyZXQsIHBhZ2VfdG9fbWZuKHBnKSwKKyAgICAgICAgICAgICAgICAgICAgIDFVTCA8
PCBvcmRlciwgUEFHRV9IWVBFUlZJU09SKTsKKworICAgIHJldHVybiByZXQ7CiB9CiAKIHZvaWQg
ZnJlZV94ZW5oZWFwX3BhZ2VzKHZvaWQgKnYsIHVuc2lnbmVkIGludCBvcmRlcikKQEAgLTIyMjIs
NiArMjIzMyw5IEBAIHZvaWQgZnJlZV94ZW5oZWFwX3BhZ2VzKHZvaWQgKnYsIHVuc2lnbmVkIGlu
dCBvcmRlcikKICAgICBmb3IgKCBpID0gMDsgaSA8ICgxdSA8PCBvcmRlcik7IGkrKyApCiAgICAg
ICAgIHBnW2ldLmNvdW50X2luZm8gJj0gflBHQ194ZW5faGVhcDsKIAorICAgIEFTU0VSVCgodW5z
aWduZWQgbG9uZyl2ID49IERJUkVDVE1BUF9WSVJUX1NUQVJUKTsKKyAgICBtYXBfcGFnZXNfdG9f
eGVuKCh1bnNpZ25lZCBsb25nKXYsIElOVkFMSURfTUZOLCAxVUwgPDwgb3JkZXIsIF9QQUdFX05P
TkUpOworCiAgICAgZnJlZV9oZWFwX3BhZ2VzKHBnLCBvcmRlciwgdHJ1ZSk7CiB9CiAKLS0gCjIu
MTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
