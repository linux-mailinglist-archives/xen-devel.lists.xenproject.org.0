Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F0974DE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsY-00029z-GJ; Wed, 21 Aug 2019 08:22:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsW-000278-DL
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:00 +0000
X-Inumbo-ID: beebc88c-c3ec-11e9-b95f-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id beebc88c-c3ec-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375720; x=1597911720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SHPtK+MdOTX0fs8ZBKKhnURnVZ/MNKl1UfFqHp7tdS8=;
 b=cQtXwOXwQPsSML/H4fYLSZ3acatzww3lQ95pCw0R5S5+Db0CJb/CD2sI
 iPZeQz4hEm5LXEqT62038blpLXR/ed8gntAKcxFj6pSsjJfqHkzNGJQAz
 VqSniENuYZdgKqmGx2oueXUDisMKFe83GMqR2Milj5P9ZMXkprv7XEvQU k=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968628"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:21:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3B4ACA1CFB; Wed, 21 Aug 2019 08:21:58 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:36 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:35 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:34 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:53 +0000
Message-ID: <20190821082056.91090-18-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 17/20] create-diff-object: Add support for
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
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
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
