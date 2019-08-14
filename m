Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F265D8CEA7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 10:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxong-0005HR-To; Wed, 14 Aug 2019 08:38:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+akc=WK=amazon.de=prvs=1223f87df=wipawel@srs-us1.protection.inumbo.net>)
 id 1hxonf-0005HI-Dv
 for xen-devel@lists.xen.org; Wed, 14 Aug 2019 08:38:31 +0000
X-Inumbo-ID: e471010e-be6e-11e9-9f6d-272fbb2a4019
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e471010e-be6e-11e9-9f6d-272fbb2a4019;
 Wed, 14 Aug 2019 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565771910; x=1597307910;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=uNRSX4W0Ek1vQghnTrBXunrGsYYWW+wbk/mxLGKCNXg=;
 b=EYln+pHCp9lpr41gmlNnJg6h1WqZNiJyNzAIu882jqw8cDDMjLL7l8+T
 69L2PMa0spzOm/25LawTNVuih0HNFEWRhwTpaXp8/Dt+cjju7mLe6mtsZ
 wtImcVznI26gam34bhwXcLFw7fi/R6wDzgkiZEYz0JlIWTCqsH2Mc2M10 k=;
X-IronPort-AV: E=Sophos;i="5.64,384,1559520000"; d="scan'208";a="819723135"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Aug 2019 08:38:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 122CAA2542; Wed, 14 Aug 2019 08:38:24 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 14 Aug 2019 08:38:23 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 14 Aug 2019 08:38:22 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 14 Aug 2019 08:38:20 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 14 Aug 2019 08:38:15 +0000
Message-ID: <20190814083815.89086-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-hooks-2 PATCH 2/4] create-diff-object: Add
 support for applied/reverted marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com, wipawel@amazon.de,
 konrad.wilk@oracle.com
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
amVjdC5jCmluZGV4IDI2M2M3ZDIuLjUzNDUxNmIgMTAwNjQ0Ci0tLSBhL2NyZWF0ZS1kaWZmLW9i
amVjdC5jCisrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCkBAIC0yMDA5LDggKzIwMDksMTAgQEAg
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
