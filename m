Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F042BEF0A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQRE-0002yD-HB; Thu, 26 Sep 2019 09:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQRC-0002ve-EE
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:51:50 +0000
X-Inumbo-ID: 4202aa34-e043-11e9-964d-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 4202aa34-e043-11e9-964d-12813bfff9fa;
 Thu, 26 Sep 2019 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491509; x=1601027509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ekZ3PcHMk4uKY0DEmsTYP5mEVLITbkETFNx6DlWLxjQ=;
 b=PjKzf6xXRJUcIM0AiOLpftMiYvvlVf+qFZNnPFgZ19LehZRb5kGEHmU7
 5E8GXzF7PhydhDHXok+4zFDDhyr2kwvQ+JkUCk1DTKl7apX7mwqsCq+Dn
 rGFx5tQwxOqRkFm7ry8Q+M8Qh2bk1WwXW2Hpu2AejeOZjAuT60mAw32v6 M=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="704637681"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 26 Sep 2019 09:50:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id C1A52A2840; Thu, 26 Sep 2019 09:50:21 +0000 (UTC)
Received: from EX13D28EUB002.ant.amazon.com (10.43.166.97) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:57 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB002.ant.amazon.com (10.43.166.97) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:56 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:49:53 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:41 +0100
Message-ID: <efa85559fd4972ae664b36683cd9ece6950f2aa1.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 78/84] Revert "x86/smpboot: use xenheap
 pages for rpts in smpboot."
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

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCldlIGhhdmUgcHJvcGVybHkg
aGFuZGxlZCAodW4pbWFwcGluZyBvZiBwYWdlcyBpbiByZXN0b3JlX2FsbF9ndWVzdHMuClRoaXMg
aGFjayBpcyBubyBsb25nZXIgcmVxdWlyZWQuCgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8
aG9uZ3lheEBhbWF6b24uY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgfCAxOSArKysr
KysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYwppbmRleCA3MDM0YzY5OWQ2Li41M2Y5MTczZjM3IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTgz
MiwyMCArODMyLDE0IEBAIHN0YXRpYyBpbnQgc2V0dXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmVkIGlu
dCBjcHUpCiAgICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAotICAgIC8qCi0gICAgICogVW5mb3J0
dW5hdGVseSwgc29tZSBjb2RlIChlc3BlY2lhbGx5IGluIGFzc2VtYmx5KSBhc3N1bWVzIHRoZSBy
cHQgaXMgaW4KLSAgICAgKiB0aGUgRElSRUNUTUFQIHJlZ2lvbiBhbmQgaXMgYWx3YXlzIG1hcHBl
ZC4gTWFraW5nIGFsbCBvZiB0aGVtIGFkYXB0IHRvCi0gICAgICogdGhlIG5ldyBwYWdlIHRhYmxl
IEFQSXMgaXMgbm9uLXRyaXZpYWwuIEZvciBub3csIG1ha2UgaXQgYWx3YXlzIG1hcHBlZAotICAg
ICAqIG9uIHRoZSB4ZW5oZWFwLgotICAgICAqLwotICAgIHJwdCA9IGFsbG9jX3hlbmhlYXBfcGFn
ZSgpOwotICAgIGlmICggIXJwdCApCisgICAgcnB0X21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGUo
KTsKKyAgICBpZiAoIG1mbl9lcShycHRfbWZuLCBJTlZBTElEX01GTikgKQogICAgIHsKICAgICAg
ICAgcmMgPSAtRU5PTUVNOwogICAgICAgICBnb3RvIG91dDsKICAgICB9CiAKLSAgICBycHRfbWZu
ID0gX21mbih2aXJ0X3RvX21mbihycHQpKTsKKyAgICBycHQgPSBtYXBfeGVuX3BhZ2V0YWJsZShy
cHRfbWZuKTsKICAgICBjbGVhcl9wYWdlKHJwdCk7CiAgICAgcGVyX2NwdShyb290X3BndF9tZm4s
IGNwdSkgPSBycHRfbWZuOwogCkBAIC04OTAsNiArODg0LDcgQEAgc3RhdGljIGludCBzZXR1cF9j
cHVfcm9vdF9wZ3QodW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgcmMgPSBjbG9uZV9tYXBwaW5n
KCh2b2lkICopcGVyX2NwdShzdHVicy5hZGRyLCBjcHUpLCBycHQpOwogCiAgb3V0OgorICAgIFVO
TUFQX1hFTl9QQUdFVEFCTEUocnB0KTsKICAgICByZXR1cm4gcmM7CiB9CiAKQEAgLTkwNSw3ICs5
MDAsNyBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwX2NwdV9yb290X3BndCh1bnNpZ25lZCBpbnQgY3B1
KQogCiAgICAgcGVyX2NwdShyb290X3BndF9tZm4sIGNwdSkgPSBJTlZBTElEX01GTjsKIAotICAg
IHJwdCA9IG1mbl90b192aXJ0KG1mbl94KHJwdF9tZm4pKTsKKyAgICBycHQgPSBtYXBfeGVuX3Bh
Z2V0YWJsZShycHRfbWZuKTsKIAogICAgIGZvciAoIHIgPSByb290X3RhYmxlX29mZnNldChESVJF
Q1RNQVBfVklSVF9TVEFSVCk7CiAgICAgICAgICAgciA8IHJvb3RfdGFibGVfb2Zmc2V0KEhZUEVS
VklTT1JfVklSVF9FTkQpOyArK3IgKQpAQCAtOTUwLDggKzk0NSw4IEBAIHN0YXRpYyB2b2lkIGNs
ZWFudXBfY3B1X3Jvb3RfcGd0KHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgIGZyZWVfeGVuX3Bh
Z2V0YWJsZShsM3RfbWZuKTsKICAgICB9CiAKLSAgICAvKiBVbmxpa2Ugb3RoZXIgbGV2ZWxzLCB0
aGUgcm9vdCBsZXZlbCBpcyBhIHhlbmhlYXAgcGFnZS4gKi8KLSAgICBmcmVlX3hlbmhlYXBfcGFn
ZShycHQpOworICAgIFVOTUFQX1hFTl9QQUdFVEFCTEUocnB0KTsKKyAgICBmcmVlX3hlbl9wYWdl
dGFibGUocnB0X21mbik7CiAKICAgICAvKiBBbHNvIHphcCB0aGUgc3R1YiBtYXBwaW5nIGZvciB0
aGlzIENQVS4gKi8KICAgICBpZiAoIHN0dWJfbGluZWFyICkKLS0gCjIuMTcuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
