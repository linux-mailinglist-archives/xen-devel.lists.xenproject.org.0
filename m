Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F01846FA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:36:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjW6-0006VO-ON; Fri, 13 Mar 2020 12:34:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AUXq=46=amazon.de=prvs=334f24509=mheyne@srs-us1.protection.inumbo.net>)
 id 1jCjVR-0006Sr-Vr
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:33:38 +0000
X-Inumbo-ID: d454c49a-6526-11ea-bec1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d454c49a-6526-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1584102804; x=1615638804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/fya+BUW395U9TLzGT2hJK0Q5V3PVgjLhCkueg8SXWM=;
 b=WHTWrSgysw5+kYDMapmP42uaipgRSLnbnVHnqTMjyES0WydlO9VB38bm
 xaOU842avfogBWPWcJIw+A9mQbv1AGyUiD7ExM3sxLik6RAtDApPDW5UD
 poAcxF+Eny0pR9yDpNFuuaDJKvgawZl91izXGfSVSpkwYFcHVF6K9kGr8 Y=;
IronPort-SDR: mY8lsV8TYLGhb+H/4UKwIj4NuZ6iv/RVBbrk7enU2Y8oUzT8CkdBubgawTIAy331gCfPgDj2O2
 UiOF40BwnDIg==
X-IronPort-AV: E=Sophos;i="5.70,548,1574121600"; d="scan'208";a="32421122"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 13 Mar 2020 12:33:21 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 0B978A2C4E; Fri, 13 Mar 2020 12:33:20 +0000 (UTC)
Received: from EX13D08EUC004.ant.amazon.com (10.43.164.176) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 13 Mar 2020 12:33:20 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D08EUC004.ant.amazon.com (10.43.164.176) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Mar 2020 12:33:19 +0000
Received: from dev-dsk-mheyne-60001.pdx1.corp.amazon.com (10.184.85.242) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Mar 2020 12:33:17 +0000
Received: by dev-dsk-mheyne-60001.pdx1.corp.amazon.com (Postfix,
 from userid 5466572)
 id 87DE1222D7; Fri, 13 Mar 2020 12:33:16 +0000 (UTC)
From: Maximilian Heyne <mheyne@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Mar 2020 12:33:14 +0000
Message-ID: <20200313123316.122003-2-mheyne@amazon.de>
X-Mailer: git-send-email 2.16.6
In-Reply-To: <20200313123316.122003-1-mheyne@amazon.de>
References: <20200313123316.122003-1-mheyne@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
X-Mailman-Approved-At: Fri, 13 Mar 2020 12:34:17 +0000
Subject: [Xen-devel] [PATCH 1/3] Add support for generic notifier lists
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUB1cy5pYm0uY29tPgoKTm90aWZpZXJzIGFy
ZSBkYXRhLWxlc3MgY2FsbGJhY2tzIGFuZCBhIG5vdGlmaWVyIGxpc3QgaXMgYSBsaXN0IG9mIHJl
Z2lzdGVyZWQKbm90aWZpZXJzIHRoYXQgYWxsIGFyZSBpbnRlcmVzdGVkIGluIGEgcGFydGljdWxh
ciBldmVudC4KCldlJ2xsIHVzZSB0aGlzIGluIGEgZmV3IHBhdGNoZXMgdG8gaW1wbGVtZW50IG1v
dXNlIGNoYW5nZSBub3RpZmljYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IExpZ3Vvcmkg
PGFsaWd1b3JpQHVzLmlibS5jb20+Ci0tLQp2MSAtPiB2MgogLSBEbyBub3QgZG8gbWVtb3J5IGFs
bG9jYXRpb25zIGJ5IHBsYWNpbmcgbGlzdCBub2RlcyBpbiBub3RpZmllcgoKW2NoZXJyeS1waWNr
ZWQgZnJvbSBkMWU3MGM1ZTZkMTQ3Mjg1NmM1Mjk2OTMwMTI0N2ZlOGMzYzgzODlkCiAgICBjb25m
bGljdHM6IHVzZWQgdGhlIHN5cy1xZXVlIGludGVyZmFjZSBhbmQgYWRkZWQgcmVxdWlyZWQKICAg
IExJU1RfUkVNT1ZFX1NBRkUgZnVuY3Rpb24gdG8gdGhhdF0KU2lnbmVkLW9mZi1ieTogTWF4aW1p
bGlhbiBIZXluZSA8bWhleW5lQGFtYXpvbi5kZT4KLS0tCiBNYWtlZmlsZSAgICB8ICAxICsKIG5v
dGlmeS5jICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBu
b3RpZnkuaCAgICB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHN5cy1xdWV1ZS5oIHwgIDUgKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG5vdGlmeS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgbm90
aWZ5LmgKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IDBmYmVjOTkwYi4u
ZDkyMWJjZGY4IDEwMDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtOTMsNiAr
OTMsNyBAQCBPQkpTKz1zZC5vIHNzaS1zZC5vCiBPQkpTKz1idC5vIGJ0LWhvc3QubyBidC12aGNp
Lm8gYnQtbDJjYXAubyBidC1zZHAubyBidC1oY2kubyBidC1oaWQubyB1c2ItYnQubwogT0JKUys9
YnVmZmVyZWRfZmlsZS5vIG1pZ3JhdGlvbi5vIG1pZ3JhdGlvbi10Y3AubyBuZXQubyBxZW11LXNv
Y2tldHMubwogT0JKUys9cWVtdS1jaGFyLm8gYWlvLm8gbmV0LWNoZWNrc3VtLm8gc2F2ZXZtLm8g
Y2FjaGUtdXRpbHMubworT0JKUys9bm90aWZ5Lm8KIAogaWZkZWYgQ09ORklHX0JSTEFQSQogT0JK
Uys9IGJhdW0ubwpkaWZmIC0tZ2l0IGEvbm90aWZ5LmMgYi9ub3RpZnkuYwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjU5ZTFlN2M3ZAotLS0gL2Rldi9udWxsCisrKyBiL25v
dGlmeS5jCkBAIC0wLDAgKzEsMzkgQEAKKy8qCisgKiBOb3RpZmllciBsaXN0cworICoKKyAqIENv
cHlyaWdodCBJQk0sIENvcnAuIDIwMTAKKyAqCisgKiBBdXRob3JzOgorICogIEFudGhvbnkgTGln
dW9yaSAgIDxhbGlndW9yaUB1cy5pYm0uY29tPgorICoKKyAqIFRoaXMgd29yayBpcyBsaWNlbnNl
ZCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHUEwsIHZlcnNpb24gMi4gIFNlZQorICogdGhl
IENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KKyAqCisgKi8KKworI2lu
Y2x1ZGUgInFlbXUtY29tbW9uLmgiCisjaW5jbHVkZSAibm90aWZ5LmgiCisKK3ZvaWQgbm90aWZp
ZXJfbGlzdF9pbml0KE5vdGlmaWVyTGlzdCAqbGlzdCkKK3sKKyAgICBMSVNUX0lOSVQoJmxpc3Qt
Pm5vdGlmaWVycyk7Cit9CisKK3ZvaWQgbm90aWZpZXJfbGlzdF9hZGQoTm90aWZpZXJMaXN0ICps
aXN0LCBOb3RpZmllciAqbm90aWZpZXIpCit7CisgICAgTElTVF9JTlNFUlRfSEVBRCgmbGlzdC0+
bm90aWZpZXJzLCBub3RpZmllciwgbm9kZSk7Cit9CisKK3ZvaWQgbm90aWZpZXJfbGlzdF9yZW1v
dmUoTm90aWZpZXIgKm5vdGlmaWVyKQoreworICAgIExJU1RfUkVNT1ZFKG5vdGlmaWVyLCBub2Rl
KTsKK30KKwordm9pZCBub3RpZmllcl9saXN0X25vdGlmeShOb3RpZmllckxpc3QgKmxpc3QpCit7
CisgICAgTm90aWZpZXIgKm5vdGlmaWVyLCAqbmV4dDsKKworICAgIExJU1RfRk9SRUFDSF9TQUZF
KG5vdGlmaWVyLCAmbGlzdC0+bm90aWZpZXJzLCBub2RlLCBuZXh0KSB7CisgICAgICAgIG5vdGlm
aWVyLT5ub3RpZnkobm90aWZpZXIpOworICAgIH0KK30KZGlmZiAtLWdpdCBhL25vdGlmeS5oIGIv
bm90aWZ5LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwLi4wOTNjNjNmMTkK
LS0tIC9kZXYvbnVsbAorKysgYi9ub3RpZnkuaApAQCAtMCwwICsxLDQzIEBACisvKgorICogTm90
aWZpZXIgbGlzdHMKKyAqCisgKiBDb3B5cmlnaHQgSUJNLCBDb3JwLiAyMDEwCisgKgorICogQXV0
aG9yczoKKyAqICBBbnRob255IExpZ3VvcmkgICA8YWxpZ3VvcmlAdXMuaWJtLmNvbT4KKyAqCisg
KiBUaGlzIHdvcmsgaXMgbGljZW5zZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2
ZXJzaW9uIDIuICBTZWUKKyAqIHRoZSBDT1BZSU5HIGZpbGUgaW4gdGhlIHRvcC1sZXZlbCBkaXJl
Y3RvcnkuCisgKgorICovCisKKyNpZm5kZWYgUUVNVV9OT1RJRllfSAorI2RlZmluZSBRRU1VX05P
VElGWV9ICisKKyNpbmNsdWRlICJzeXMtcXVldWUuaCIKKwordHlwZWRlZiBzdHJ1Y3QgTm90aWZp
ZXIgTm90aWZpZXI7CisKK3N0cnVjdCBOb3RpZmllcgoreworICAgIHZvaWQgKCpub3RpZnkpKE5v
dGlmaWVyICpub3RpZmllcik7CisgICAgTElTVF9FTlRSWShOb3RpZmllcikgbm9kZTsKK307CisK
K3R5cGVkZWYgc3RydWN0IE5vdGlmaWVyTGlzdAoreworICAgIExJU1RfSEVBRCgsIE5vdGlmaWVy
KSBub3RpZmllcnM7Cit9IE5vdGlmaWVyTGlzdDsKKworI2RlZmluZSBOT1RJRklFUl9MSVNUX0lO
SVRJQUxJWkVSKGhlYWQpIFwKKyAgICB7IExJU1RfSEVBRF9JTklUSUFMSVpFUigoaGVhZCkubm90
aWZpZXJzKSB9CisKK3ZvaWQgbm90aWZpZXJfbGlzdF9pbml0KE5vdGlmaWVyTGlzdCAqbGlzdCk7
CisKK3ZvaWQgbm90aWZpZXJfbGlzdF9hZGQoTm90aWZpZXJMaXN0ICpsaXN0LCBOb3RpZmllciAq
bm90aWZpZXIpOworCit2b2lkIG5vdGlmaWVyX2xpc3RfcmVtb3ZlKE5vdGlmaWVyICpub3RpZmll
cik7CisKK3ZvaWQgbm90aWZpZXJfbGlzdF9ub3RpZnkoTm90aWZpZXJMaXN0ICpsaXN0KTsKKwor
I2VuZGlmCmRpZmYgLS1naXQgYS9zeXMtcXVldWUuaCBiL3N5cy1xdWV1ZS5oCmluZGV4IDU1YzI2
ZmU3Zi4uODFhYjA0NGE4IDEwMDY0NAotLS0gYS9zeXMtcXVldWUuaAorKysgYi9zeXMtcXVldWUu
aApAQCAtMTMyLDYgKzEzMiwxMSBAQCBzdHJ1Y3QgeyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAg
KHZhcik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgICAgICAgICAgICAgKHZhcikgPSAoKHZhciktPmZpZWxkLmxlX25leHQpKQogCisjZGVm
aW5lIExJU1RfRk9SRUFDSF9TQUZFKHZhciwgaGVhZCwgZmllbGQsIG5leHRfdmFyKSAgICAgICAg
ICAgICAgICAgICBcCisgICAgICAgIGZvciAoKHZhcikgPSAoKGhlYWQpLT5saF9maXJzdCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgICAgICAgICAgKHZhcikgJiYg
KChuZXh0X3ZhcikgPSAoKHZhciktPmZpZWxkLmxlX25leHQpLCAxKTsgICAgICBcCisgICAgICAg
ICAgICAgICAgKHZhcikgPSAobmV4dF92YXIpKQorCiAvKgogICogTGlzdCBhY2Nlc3MgbWV0aG9k
cy4KICAqLwotLSAKMi4xNi42CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkg
R21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJp
c3RpYW4gU2NobGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNo
dCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDog
REUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
