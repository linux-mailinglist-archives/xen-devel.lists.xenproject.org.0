Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C3B3974
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:34:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9pEQ-0003AW-S3; Mon, 16 Sep 2019 11:31:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9pEO-00038U-4X
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:31:44 +0000
X-Inumbo-ID: 8f4355ee-d875-11e9-95e0-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f4355ee-d875-11e9-95e0-12813bfff9fa;
 Mon, 16 Sep 2019 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568633503; x=1600169503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SHPtK+MdOTX0fs8ZBKKhnURnVZ/MNKl1UfFqHp7tdS8=;
 b=gbXw11rSTKm6HNqBbTEvdq2BmGl0gi7vbblIPjEaenBRffFrhAsHfB4g
 dud5yLaIpda7CDBOkgoxaUp3JmzpLipBTA7qxv5ffqZr1G8ena08pRkl+
 brckx7z3SbixzfNMLcnmjGkmopAMe1F9hY+5JCRRgKWIV1G1uONs7eRPC Q=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="785141888"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 16 Sep 2019 11:31:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 467DDA24E0; Mon, 16 Sep 2019 11:31:40 +0000 (UTC)
Received: from EX13D03EUC004.ant.amazon.com (10.43.164.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:27 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:26 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:31:23 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 11:30:53 +0000
Message-ID: <20190916113056.16592-5-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190916113056.16592-1-wipawel@amazon.de>
References: <20190916113056.16592-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 4/7] create-diff-object: Add support for
 applied/reverted marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCB2ZXJzaW9uIDIgb2YgYSBwYXlsb2FkIHN0cnVjdHVyZSBhZGRpdGlvbmFsIGZpZWxkIGlz
IHN1cHBvcnRlZAp0byB0cmFjayB3aGV0aGVyIGdpdmVuIGZ1bmN0aW9uIGhhcyBiZWVuIGFwcGxp
ZWQgb3IgcmV2ZXJ0ZWQuClRoZXJlIGFsc28gY29tZXMgYWRkaXRpb25hbCA4LWJ5dGUgYWxpZ25t
ZW50IHBhZGRpbmcgdG8gcmVzZXJ2ZQpwbGFjZSBmb3IgZnV0dXJlIGZsYWdzIGFuZCBvcHRpb25z
LgoKVGhlIG5ldyBmaWVsZHMgYXJlIHplcm8tb3V0IHVwb24gLmxpdmVwYXRjaC5mdW5jcyBzZWN0
aW9uIGNyZWF0aW9uLgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3
ZWxAYW1hem9uLmRlPgotLS0KIGNvbW1vbi5oICAgICAgICAgICAgIHwgMiArKwogY3JlYXRlLWRp
ZmYtb2JqZWN0LmMgfCA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY29tbW9uLmggYi9jb21tb24uaAppbmRleCAwNmUx
OWU3Li5kOGNkZTM1IDEwMDY0NAotLS0gYS9jb21tb24uaAorKysgYi9jb21tb24uaApAQCAtMTI0
LDYgKzEyNCw4IEBAIHN0cnVjdCBsaXZlcGF0Y2hfcGF0Y2hfZnVuYyB7CiAJdWludDMyX3Qgb2xk
X3NpemU7CiAJdWludDhfdCB2ZXJzaW9uOwogCXVuc2lnbmVkIGNoYXIgcGFkWzMxXTsKKwl1aW50
OF90IGFwcGxpZWQ7CisJdWludDhfdCBfcGFkWzddOwogfTsKIAogc3RydWN0IHNwZWNpYWxfc2Vj
dGlvbiB7CmRpZmYgLS1naXQgYS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9i
amVjdC5jCmluZGV4IDk5MThiNmUuLmQ1MTg1MDMgMTAwNjQ0Ci0tLSBhL2NyZWF0ZS1kaWZmLW9i
amVjdC5jCisrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCkBAIC0yMDE0LDggKzIwMTQsMTAgQEAg
c3RhdGljIHZvaWQgbGl2ZXBhdGNoX2NyZWF0ZV9wYXRjaGVzX3NlY3Rpb25zKHN0cnVjdCBrcGF0
Y2hfZWxmICprZWxmLAogCQkJZnVuY3NbaW5kZXhdLm9sZF9zaXplID0gcmVzdWx0LnNpemU7CiAJ
CQlmdW5jc1tpbmRleF0ubmV3X2FkZHIgPSAwOwogCQkJZnVuY3NbaW5kZXhdLm5ld19zaXplID0g
c3ltLT5zeW0uc3Rfc2l6ZTsKLQkJCWZ1bmNzW2luZGV4XS52ZXJzaW9uID0gMTsKKwkJCWZ1bmNz
W2luZGV4XS52ZXJzaW9uID0gMjsKIAkJCW1lbXNldChmdW5jc1tpbmRleF0ucGFkLCAwLCBzaXpl
b2YgZnVuY3NbaW5kZXhdLnBhZCk7CisJCQlmdW5jc1tpbmRleF0uYXBwbGllZCA9IDA7CisJCQlt
ZW1zZXQoZnVuY3NbaW5kZXhdLl9wYWQsIDAsIHNpemVvZiBmdW5jc1tpbmRleF0uX3BhZCk7CiAK
IAkJCS8qCiAJCQkgKiBBZGQgYSByZWxvY2F0aW9uIHRoYXQgd2lsbCBwb3B1bGF0ZQotLSAKMi4x
Ni41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3Ry
LiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2Vy
LCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJn
IHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
