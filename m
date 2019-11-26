Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B6109DF0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:28:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuf-0004a6-RT; Tue, 26 Nov 2019 12:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZue-0004ZH-2S
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:48 +0000
X-Inumbo-ID: da0951fa-1047-11ea-83b8-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da0951fa-1047-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771138; x=1606307138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FaiVGswvoyzVT2k8JNXfrHofMW8iQRHNbkD2nK28OcE=;
 b=s9lwbRlbl8IcXqJWZptzV74BWeWYxQbLlpsT3+HU9ej41No/G+XoLCoI
 /gxOGygiVl4htZhrdwW6uqJzQo58NMY+wnDqfhrlP6BJAYQX1PCw1N4/j
 BkLafwqlCjbtCJKg0QP52jPq1/jReBEsFedjHTTimJIxwsbrNCOh5dgXb 0=;
IronPort-SDR: dAZ8QvixlXia8oISNQPS2vmsKH59axqyxqCUO99jX6WaByoDBgSAFmuPF8qDw/4lxWBoDJzsmM
 BCBR5S7/wmVQ==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="4943797"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Nov 2019 12:25:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 005B1A1793; Tue, 26 Nov 2019 12:25:34 +0000 (UTC)
Received: from EX13D03EUC001.ant.amazon.com (10.43.164.245) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:34 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUC001.ant.amazon.com (10.43.164.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 04:25:33 -0800
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:31 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:09 +0000
Message-ID: <20191126122511.7409-6-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 5/7] create-diff-object: Add support for
 expectations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIGxpdmVwYXRjaF9wYXRjaF9mdW5jIHRvIHN1cHBvcnQgYSBuZXcgZmllbGQ6IGV4cGVj
dC4gVGhpcyBuZXcKZmllbGQgZGVzY3JpYmVzIHRoZSBleHBlY3RlZCBkYXRhLCBpdHMgbGVuZ3Ro
IGFuZCB3aGV0aGVyIGV4cGVjdGF0aW9uCmlzIGVuYWJsZWQuIFRoZSBleHBlY3RhdGlvbidzIGRh
dGEgaXMgb2Ygb3BhcXVlIHBhZGRpbmcgc2l6ZS4KCkJ5IGRlZmF1bHQgdGhlIGV4cGVjdGF0aW9u
IGZpZWxkIGlzIHplcm8tb3V0IGFuZCB0aGUgZXhwZWN0YXRpb24gaXMKZGlzYWJsZWQgdW5sZXNz
IGV4cGxpY2l0bHkgc3BlY2lmaWVkIGluIHRoZSBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFBhd2Vs
IFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFJvc3MgTGFn
ZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KQ2hhbmdlZCBzaW5jZSB2MToK
ICAqIERvIG5vdCBidW1wIHRoZSBwYXlsb2FkIHZlcnNpb24gYWdhaW4uCi0tLQogY29tbW9uLmgg
ICAgICAgICAgICAgfCAxMSArKysrKysrKysrLQogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9jb21tb24uaCBiL2NvbW1vbi5oCmluZGV4IDlmOWNiN2IuLmI2NDg5ZGIgMTAwNjQ0
Ci0tLSBhL2NvbW1vbi5oCisrKyBiL2NvbW1vbi5oCkBAIC0xMTUsNiArMTE1LDE0IEBAIHN0cnVj
dCBrcGF0Y2hfZWxmIHsKIH07CiAKICNkZWZpbmUgUEFUQ0hfSU5TTl9TSVpFIDUKKyNkZWZpbmUg
TUFYX1JFUExBQ0VNRU5UX1NJWkUgMzEKK3N0cnVjdCBsaXZlcGF0Y2hfZXhwZWN0YXRpb24gewor
CXVpbnQ4X3QgZW5hYmxlZCA6IDE7CisJdWludDhfdCBsZW4gOiA1OworCXVpbnQ4X3QgcGFkIDog
MjsKKwl1aW50OF90IGRhdGFbTUFYX1JFUExBQ0VNRU5UX1NJWkVdOworfTsKK3R5cGVkZWYgc3Ry
dWN0IGxpdmVwYXRjaF9leHBlY3RhdGlvbiBsaXZlcGF0Y2hfZXhwZWN0YXRpb25fdDsKIAogc3Ry
dWN0IGxpdmVwYXRjaF9wYXRjaF9mdW5jIHsKIAljaGFyICpuYW1lOwpAQCAtMTIzLDkgKzEzMSwx
MCBAQCBzdHJ1Y3QgbGl2ZXBhdGNoX3BhdGNoX2Z1bmMgewogCXVpbnQzMl90IG5ld19zaXplOwog
CXVpbnQzMl90IG9sZF9zaXplOwogCXVpbnQ4X3QgdmVyc2lvbjsKLQl1bnNpZ25lZCBjaGFyIHBh
ZFszMV07CisJdW5zaWduZWQgY2hhciBwYWRbTUFYX1JFUExBQ0VNRU5UX1NJWkVdOwogCXVpbnQ4
X3QgYXBwbGllZDsKIAl1aW50OF90IF9wYWRbN107CisJbGl2ZXBhdGNoX2V4cGVjdGF0aW9uX3Qg
ZXhwZWN0OwogfTsKIAogc3RydWN0IHNwZWNpYWxfc2VjdGlvbiB7CmRpZmYgLS1naXQgYS9jcmVh
dGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCmluZGV4IGU4ODZkNGMuLmFi
ZjNjYzcgMTAwNjQ0Ci0tLSBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jCisrKyBiL2NyZWF0ZS1kaWZm
LW9iamVjdC5jCkBAIC0yMDE3LDYgKzIwMTcsNyBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hfY3Jl
YXRlX3BhdGNoZXNfc2VjdGlvbnMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsCiAJCQltZW1zZXQo
ZnVuY3NbaW5kZXhdLnBhZCwgMCwgc2l6ZW9mIGZ1bmNzW2luZGV4XS5wYWQpOwogCQkJZnVuY3Nb
aW5kZXhdLmFwcGxpZWQgPSAwOwogCQkJbWVtc2V0KGZ1bmNzW2luZGV4XS5fcGFkLCAwLCBzaXpl
b2YgZnVuY3NbaW5kZXhdLl9wYWQpOworCQkJbWVtc2V0KCZmdW5jc1tpbmRleF0uZXhwZWN0LCAw
LCBzaXplb2YgZnVuY3NbaW5kZXhdLmV4cGVjdCk7CiAKIAkJCS8qCiAJCQkgKiBBZGQgYSByZWxv
Y2F0aW9uIHRoYXQgd2lsbCBwb3B1bGF0ZQotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
