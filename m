Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865EBBEF13
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:54:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQR9-0002q3-2L; Thu, 26 Sep 2019 09:51:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQR7-0002nx-Bn
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:51:45 +0000
X-Inumbo-ID: 3d71c8d9-e043-11e9-964d-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 3d71c8d9-e043-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491502; x=1601027502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=gUmQxE1/9r+oWcjOQYQcyyS1mWBwuNCjdmshVcZJotg=;
 b=ZNXcGJTg5oQelB9faY9mTIi6pA/ByJUR6Q5opV9f48GUtZRxtzEsIlwn
 i/nh7Fjgo58xNbPCmveCHIlgP8r8bWMn+U6GmwgE/pMn4YEooTw7ZXdcm
 jeVrKOD7XvZ6zK2EIT/AVJt5YcNUj14sDg7Zk4uSWkTlpBpFTvD7TwNRg k=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836989166"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:49:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id B9086A26A7; Thu, 26 Sep 2019 09:49:41 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:22 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:21 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:17 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:32 +0100
Message-ID: <71e585138508d7d46c5349f72e1dfd3df8f2b595.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 69/84] page_alloc: comments on (un)mapping
 pages in xenheap allocations.
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
LmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwppbmRl
eCA0ZWM2Mjk5YmE4Li5hMDBkYjRjMGQ5IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxs
b2MuYworKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwpAQCAtMjIxMiw2ICsyMjEyLDEwIEBA
IHZvaWQgKmFsbG9jX3hlbmhlYXBfcGFnZXModW5zaWduZWQgaW50IG9yZGVyLCB1bnNpZ25lZCBp
bnQgbWVtZmxhZ3MpCiAgICAgICAgIHBnW2ldLmNvdW50X2luZm8gfD0gUEdDX3hlbl9oZWFwOwog
CiAgICAgcmV0ID0gcGFnZV90b192aXJ0KHBnKTsKKyAgICAvKgorICAgICAqIFRoZSBkaXJlY3Qg
bWFwIGlzIG5vdCBhbHdheXMgbWFwcGVkIG5vdy4gV2UgbmVlZCB0byBwb3B1bGF0ZSB0aGUgZGly
ZWN0CisgICAgICogbWFwIHJlZ2lvbiBvbiBkZW1hbmQgZm9yIHNlY3VyaXR5LgorICAgICAqLwog
ICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpcmV0LCBwYWdlX3RvX21mbihwZyks
CiAgICAgICAgICAgICAgICAgICAgICAxVUwgPDwgb3JkZXIsIFBBR0VfSFlQRVJWSVNPUik7CiAK
QEAgLTIyMzQsNiArMjIzOCw3IEBAIHZvaWQgZnJlZV94ZW5oZWFwX3BhZ2VzKHZvaWQgKnYsIHVu
c2lnbmVkIGludCBvcmRlcikKICAgICAgICAgcGdbaV0uY291bnRfaW5mbyAmPSB+UEdDX3hlbl9o
ZWFwOwogCiAgICAgQVNTRVJUKCh1bnNpZ25lZCBsb25nKXYgPj0gRElSRUNUTUFQX1ZJUlRfU1RB
UlQpOworICAgIC8qIFRlYXIgZG93biB0aGUgMToxIG1hcHBpbmcgaW4gdGhpcyByZWdpb24gZm9y
IG1lbW9yeSBzYWZldHkuICovCiAgICAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQgbG9uZyl2
LCBJTlZBTElEX01GTiwgMVVMIDw8IG9yZGVyLCBfUEFHRV9OT05FKTsKIAogICAgIGZyZWVfaGVh
cF9wYWdlcyhwZywgb3JkZXIsIHRydWUpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
