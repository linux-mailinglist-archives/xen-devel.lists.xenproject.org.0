Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA3974D8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsX-00028k-M9; Wed, 21 Aug 2019 08:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsW-00026r-9P
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:00 +0000
X-Inumbo-ID: b4c4723c-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4c4723c-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375703; x=1597911703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/W7j3nr4ngA5/YC+oCnJXUrP5wTjAmMXZSW82JwTywk=;
 b=wCdxRaPIX7akvNAe3BL19g6C9CtNsSWoW/kEN2y7JQGuzONMHfaYfveh
 OWlimf9OibOk+x6vlz9uD6Kua8NjMpYECRDJuSf5qp5Q/b1HLM+R7O2ZZ
 lR8hautPNtgyhgyzA4tI/n/pJUYA+hH590ebZYQtjeXgucaZ8bLN0XAv1 M=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="822132867"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Aug 2019 08:21:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2B75BA0631; Wed, 21 Aug 2019 08:21:36 +0000 (UTC)
Received: from EX13D05EUC004.ant.amazon.com (10.43.164.38) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:21 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC004.ant.amazon.com (10.43.164.38) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:20 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:19 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:45 +0000
Message-ID: <20190821082056.91090-10-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 09/20] create-diff-object: Add new entries to
 special sections array
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

SGFuZGxlIC5saXZlcGF0Y2guaG9va3MqIGFuZCAuYWx0aW5zdHJfcmVwbGFjZW1lbnQgc2VjdGlv
bnMgYXMgdGhlCnNwZWNpYWwgc2VjdGlvbnMgd2l0aCBhc3NpZ25lZCBncm91cF9zaXplIHJlc29s
dXRpb24gZnVuY3Rpb24uCkJ5IGRlZmF1bHQgZWFjaCAubGl2ZXBhdGNoLmhvb2tzKiBzZWN0aW9u
cycgZW50cnkgaXMgOCBieXRlcyBsb25nIChhCnBvaW50ZXIpLiBUaGUgLmFsdGluc3RyX3JlcGxh
Y2VtZW50IHNlY3Rpb24gaGFzIHVuZGVmaW5lZCBncm91cF9zaXplLgoKQWxsb3cgdG8gc3BlY2lm
eSBkaWZmZXJlbnQgLmxpdmVwYXRjaC5ob29rcyogc2VjdGlvbiBlbnRyeSBzaXplIHVzaW5nCnNo
ZWxsIGVudmlyb25tZW50IHZhcmlhYmxlIEhPT0tfU1RSVUNUX1NJWkUuCgpBZGQgYW4gZXhwbGlj
aXQgY2hlY2sgdG8ga3BhdGNoX3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uKCkgc2tpcHBpbmcK
cmVnZW5lcmF0aW9uIG9mIHNwZWNpYWwgc2VjdGlvbnMsIHdob3NlIGdyb3VwX3NpemUgaXMgMC4K
ClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4K
UmV2aWV3ZWQtYnk6IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4K
UmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5
OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KLS0tCiBjcmVhdGUtZGlmZi1v
YmplY3QuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCBj
NjE4M2MzLi4wZDIzMWQ1IDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9j
cmVhdGUtZGlmZi1vYmplY3QuYwpAQCAtOTk1LDYgKzk5NSwyNCBAQCBzdGF0aWMgaW50IGFsdGlu
c3RydWN0aW9uc19ncm91cF9zaXplKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLCBpbnQgb2Zmc2V0
KQogCXJldHVybiBzaXplOwogfQogCitzdGF0aWMgaW50IGxpdmVwYXRjaF9ob29rc19ncm91cF9z
aXplKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLCBpbnQgb2Zmc2V0KQoreworCXN0YXRpYyBpbnQg
c2l6ZSA9IDA7CisJY2hhciAqc3RyOworCWlmICghc2l6ZSkgeworCQlzdHIgPSBnZXRlbnYoIkhP
T0tfU1RSVUNUX1NJWkUiKTsKKwkJc2l6ZSA9IHN0ciA/IGF0b2koc3RyKSA6IDg7CisJfQorCisJ
bG9nX2RlYnVnKCJsaXZlcGF0Y2hfaG9va3Nfc2l6ZT0lZFxuIiwgc2l6ZSk7CisJcmV0dXJuIHNp
emU7Cit9CisKK3N0YXRpYyBpbnQgdW5kZWZpbmVkX2dyb3VwX3NpemUoc3RydWN0IGtwYXRjaF9l
bGYgKmtlbGYsIGludCBvZmZzZXQpCit7CisJcmV0dXJuIDA7Cit9CisKIC8qCiAgKiBUaGUgcmVs
YSBncm91cHMgaW4gdGhlIC5maXh1cCBzZWN0aW9uIHZhcnkgaW4gc2l6ZS4gIFRoZSBiZWdpbm5p
bmcgb2YgZWFjaAogICogLmZpeHVwIHJlbGEgZ3JvdXAgaXMgcmVmZXJlbmNlZCBieSB0aGUgLmV4
X3RhYmxlIHNlY3Rpb24uIFRvIGZpbmQgdGhlIHNpemUKQEAgLTEwNzIsNiArMTA5MCwxOCBAQCBz
dGF0aWMgc3RydWN0IHNwZWNpYWxfc2VjdGlvbiBzcGVjaWFsX3NlY3Rpb25zW10gPSB7CiAJCS5u
YW1lCQk9ICIuYWx0aW5zdHJ1Y3Rpb25zIiwKIAkJLmdyb3VwX3NpemUJPSBhbHRpbnN0cnVjdGlv
bnNfZ3JvdXBfc2l6ZSwKIAl9LAorCXsKKwkJLm5hbWUJCT0gIi5hbHRpbnN0cl9yZXBsYWNlbWVu
dCIsCisJCS5ncm91cF9zaXplCT0gdW5kZWZpbmVkX2dyb3VwX3NpemUsCisJfSwKKwl7CisJCS5u
YW1lCQk9ICIubGl2ZXBhdGNoLmhvb2tzLmxvYWQiLAorCQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRj
aF9ob29rc19ncm91cF9zaXplLAorCX0sCisJeworCQkubmFtZQkJPSAiLmxpdmVwYXRjaC5ob29r
cy51bmxvYWQiLAorCQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplLAor
CX0sCiAJe30sCiB9OwogCkBAIC0xMTQyLDYgKzExNzIsMTUgQEAgc3RhdGljIHZvaWQga3BhdGNo
X3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLAogCiAJ
TElTVF9IRUFEKG5ld3JlbGFzKTsKIAorCXNyY19vZmZzZXQgPSAwOworCWRlc3Rfb2Zmc2V0ID0g
MDsKKwlncm91cF9zaXplID0gc3BlY2lhbC0+Z3JvdXBfc2l6ZShrZWxmLCBzcmNfb2Zmc2V0KTsK
KwlpZiAoZ3JvdXBfc2l6ZSA9PSAwKSB7CisJCWxvZ19ub3JtYWwoIlNraXBwaW5nIHJlZ2VuZXJh
dGlvbiBvZiBhIHNwZWNpYWwgc2VjdGlvbjogJXNcbiIsCisJCQkgICBzcGVjaWFsLT5uYW1lKTsK
KwkJcmV0dXJuOworCX0KKwogCXNyYyA9IHNlYy0+YmFzZS0+ZGF0YS0+ZF9idWY7CiAJLyogYWxs
b2MgYnVmZmVyIGZvciBuZXcgYmFzZSBzZWN0aW9uICovCiAJZGVzdCA9IG1hbGxvYyhzZWMtPmJh
c2UtPnNoLnNoX3NpemUpOwpAQCAtMTE1Niw5ICsxMTk1LDYgQEAgc3RhdGljIHZvaWQga3BhdGNo
X3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLAogCQl9
CiAJfQogCi0JZ3JvdXBfc2l6ZSA9IDA7Ci0Jc3JjX29mZnNldCA9IDA7Ci0JZGVzdF9vZmZzZXQg
PSAwOwogCWZvciAoIDsgc3JjX29mZnNldCA8IHNlYy0+YmFzZS0+c2guc2hfc2l6ZTsgc3JjX29m
ZnNldCArPSBncm91cF9zaXplKSB7CiAKIAkJZ3JvdXBfc2l6ZSA9IHNwZWNpYWwtPmdyb3VwX3Np
emUoa2VsZiwgc3JjX29mZnNldCk7Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBD
ZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRz
ZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4g
YW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJl
cmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
