Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC2974D9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsN-0001nT-HV; Wed, 21 Aug 2019 08:21:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsM-0001ld-D4
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:50 +0000
X-Inumbo-ID: b03afb32-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b03afb32-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375694; x=1597911694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=qqeo8XhVoqzWKP+lXIzjkBD7UidvojG69bSEW5ONYfw=;
 b=S3Tes9wmXbgvR5l3FHLlt0q3Qe7QmuMhnnC9B9YaCg2LzqfIKWPMqLgb
 IkQQGOjFUZeCM2rIzSkxT4LwJSRP+LElKTzFFv+BIW+RgD/3J2byWFCKf
 hZKU+W3c49MrKYb4iG7uA57pKFdv32mYUnwVcTwcyIqizzT5/BV+19+iw k=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="410765154"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Aug 2019 08:21:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 63606A1BCD; Wed, 21 Aug 2019 08:21:33 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:17 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:17 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:15 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:43 +0000
Message-ID: <20190821082056.91090-8-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 07/20] create-diff-object: Add
 is_special_section() helper function
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

VGhpcyBmdW5jdGlvbiBkZXRlcm1pbmVzLCBiYXNlZCBvbiB0aGUgZ2l2ZW4gc2VjdGlvbiBuYW1l
LCBpZiB0aGUKc2VjdGlvbnMgYmVsb25ncyB0byB0aGUgc3BlY2lhbCBzZWN0aW9ucyBjYXRlZ29y
eS4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5k
ZT4KUmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNv
bT4KUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmlld2Vk
LWJ5OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFJv
c3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KIGNyZWF0ZS1kaWZm
LW9iamVjdC5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMKaW5kZXggNDY5OWJhMC4uMGRmM2ZlYSAxMDA2NDQKLS0tIGEvY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKQEAgLTEwNDUsNiArMTA0NSwxOCBAQCBz
dGF0aWMgc3RydWN0IHNwZWNpYWxfc2VjdGlvbiBzcGVjaWFsX3NlY3Rpb25zW10gPSB7CiAJe30s
CiB9OwogCitzdGF0aWMgaW50IGlzX3NwZWNpYWxfc2VjdGlvbihjb25zdCBzdHJ1Y3Qgc2VjdGlv
biAqc2VjKQoreworCXN0cnVjdCBzcGVjaWFsX3NlY3Rpb24gKnNwZWNpYWw7CisKKwlmb3IgKHNw
ZWNpYWwgPSBzcGVjaWFsX3NlY3Rpb25zOyBzcGVjaWFsLT5uYW1lOyBzcGVjaWFsKyspIHsKKwkJ
aWYgKCFzdHJjbXAoc2VjLT5uYW1lLCBzcGVjaWFsLT5uYW1lKSkKKwkJCXJldHVybiB0cnVlOwor
CX0KKworCXJldHVybiBmYWxzZTsKK30KKwogc3RhdGljIGludCBzaG91bGRfa2VlcF9yZWxhX2dy
b3VwKHN0cnVjdCBzZWN0aW9uICpzZWMsIGludCBzdGFydCwgaW50IHNpemUpCiB7CiAJc3RydWN0
IHJlbGEgKnJlbGE7Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
