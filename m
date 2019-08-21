Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5DF974CB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lsd-0002K0-JK; Wed, 21 Aug 2019 08:22:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lsb-0002Gg-98
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:05 +0000
X-Inumbo-ID: b5db70b2-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5db70b2-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375704; x=1597911704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=crehptxpzZcn/w9rVVjYZL9Nt7ha3q+3YwrmhUOuDNo=;
 b=RiWIzlAriqWHvkWMKXoBDBz4B8fEtVDbzc2jTDSdsjzLXmlPxjw+hzb7
 jIag+ny+MVmMFeYpeGB1zwpTCcAGUTK1SqH6nbhSWDo213eO2764TRsg8
 SKveV7Tic8iBQpJV1A8bKvCwyEPGnNhV2mCRjUHeLUoode8TxXyV4/AsI k=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="822132882"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Aug 2019 08:21:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id E2F6CA2460; Wed, 21 Aug 2019 08:21:39 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:25 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:24 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:22 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:47 +0000
Message-ID: <20190821082056.91090-12-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 11/20] create-diff-object: Do not create empty
 .livepatch.funcs section
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

V2hlbiB0aGVyZSBpcyBubyBjaGFuZ2VkIGZ1bmN0aW9uIGluIHRoZSBnZW5lcmF0ZWQgcGF5bG9h
ZCwgZG8gbm90CmNyZWF0ZSBhbiBlbXB0eSAubGl2ZXBhdGNoLmZ1bmNzIHNlY3Rpb24uIEh5cGVy
dmlzb3IgY29kZSBjb25zaWRlcnMKc3VjaCBwYXlsb2FkcyBhcyBicm9rZW4gYW5kIHJlamVjdHMg
dG8gbG9hZCB0aGVtLgoKU3VjaCBwYXlsb2FkcyB3aXRob3V0IGFueSBjaGFuZ2VkIGZ1bmN0aW9u
cyBtYXkgYXBwZWFyIHdoZW4gb25seQpob29rcyBhcmUgc3BlY2lmaWVkLgoKU2lnbmVkLW9mZi1i
eTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTog
TWFydGluIE1hemVpbiA8YW1hemVpbkBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gUG9o
bGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgotLS0KIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NyZWF0
ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKaW5kZXggYTkwY2YzNy4uNGUw
ZjNiZSAxMDA2NDQKLS0tIGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYt
b2JqZWN0LmMKQEAgLTE4NDMsNiArMTg0MywxMSBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hfY3Jl
YXRlX3BhdGNoZXNfc2VjdGlvbnMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsCiAJCWlmIChzeW0t
PnR5cGUgPT0gU1RUX0ZVTkMgJiYgc3ltLT5zdGF0dXMgPT0gQ0hBTkdFRCkKIAkJCW5yKys7CiAK
KwlpZiAobnIgPT0gMCkgeworCQlsb2dfZGVidWcoIk5vIGNoYW5nZWQgZnVuY3Rpb25zIGZvdW5k
LiBTa2lwcGluZyAubGl2ZXBhdGNoLmZ1bmNzIHNlY3Rpb24gY3JlYXRpb25cbiIpOworCQlyZXR1
cm47CisJfQorCiAJLyogY3JlYXRlIHRleHQvcmVsYSBzZWN0aW9uIHBhaXIgKi8KIAlzZWMgPSBj
cmVhdGVfc2VjdGlvbl9wYWlyKGtlbGYsICIubGl2ZXBhdGNoLmZ1bmNzIiwgc2l6ZW9mKCpmdW5j
cyksIG5yKTsKIAlyZWxhc2VjID0gc2VjLT5yZWxhOwotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2
ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4K
R2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVp
bmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMg
QgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
