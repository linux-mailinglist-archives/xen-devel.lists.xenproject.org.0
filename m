Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A549E30B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 10:48:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2X82-0002Ik-Tv; Tue, 27 Aug 2019 08:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvsD=WX=amazon.de=prvs=1355b64ef=wipawel@srs-us1.protection.inumbo.net>)
 id 1i2X81-0002IQ-HX
 for xen-devel@lists.xen.org; Tue, 27 Aug 2019 08:47:01 +0000
X-Inumbo-ID: 3c4a76d4-c8a7-11e9-951b-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c4a76d4-c8a7-11e9-951b-bc764e2007e4;
 Tue, 27 Aug 2019 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566895620; x=1598431620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4Ysy0qpblcEvEpZffXWxD6yTthoPZ174EIgSKUhCpcM=;
 b=euxQNA7WZu1vXsV85cVhQENrkZNwr5j7cAAXiqGd9rLXJ/SoC7+6sM03
 rBOpC7Ltno6O3zKQok8ALkkSEwKtkcEO84Bk2/wNUB7n6DLC6ry2ZjUoJ
 t20bUk02ouJFcaIoTkX9ifLgF93aphwRcy69yrunWTqxQ891YoelwsnRf 0=;
X-IronPort-AV: E=Sophos;i="5.64,436,1559520000"; d="scan'208";a="417885588"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 27 Aug 2019 08:46:59 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id A9689A2174; Tue, 27 Aug 2019 08:46:59 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:41 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 27 Aug 2019 08:46:41 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 27 Aug 2019 08:46:39 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Tue, 27 Aug 2019 08:46:15 +0000
Message-ID: <20190827084624.116917-4-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190827084624.116917-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 03/12] livepatch: Export payload structure
 via livepatch_payload.h
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>, wipawel@amazon.com, Ross
 Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBheWxvYWQgc3RydWN0dXJlIHdpbGwgYmUgdXNlZCBieSB0aGUgbmV3IGhvb2tzIGltcGxl
bWVudGF0aW9uIGFuZAp0aGVyZWZvcmUgaXRzIGRlZmluaXRpb24gaGFzIHRvIGJlIGV4cG9ydGVk
IHZpYSB0aGUgbGl2ZXBhdGNoX3BheWxvYWQKaGVhZGVyLgpUaGUgbmV3IGhvb2tzIHdpbGwgbWFr
ZSB1c2Ugb2YgdGhlIHBheWxvYWQgc3RydWN0dXJlIGZpZWxkcyBhbmQgdGhlCmhvb2tzJyBwb2lu
dGVycyB3aWxsIGFsc28gYmUgZGVmaW5lZCBpbiB0aGUgcGF5bG9hZCBzdHJ1Y3R1cmUsIHNvCnRo
ZSBzdHJ1Y3R1cmUgYWxvbmcgd2l0aCBhbGwgZmllbGQgZGVmaW5pdGlvbnMgbmVlZHMgdG8gYmUg
YXZhaWxhYmxlCnRvIHRoZSBjb2RlIGJlaW5nIHBhdGNoZWQgaW4uCgpTaWduZWQtb2ZmLWJ5OiBQ
YXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRy
YS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBFc2xh
bSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTGVvbmFyZCBGb2Vy
c3RlciA8Zm9lcnNsZW9AYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIFBvaGxhY2sgPG1w
b2hsYWNrQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPgotLS0KIHhlbi9jb21tb24vbGl2ZXBhdGNoLmMgICAgICAgICAgICAg
IHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVu
L2xpdmVwYXRjaF9wYXlsb2FkLmggfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMgYi94ZW4vY29tbW9uL2xpdmVw
YXRjaC5jCmluZGV4IGM1NjU1YTQzZDIuLmIzYTJiOWZhZmQgMTAwNjQ0Ci0tLSBhL3hlbi9jb21t
b24vbGl2ZXBhdGNoLmMKKysrIGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwpAQCAtNDUsNDMgKzQ1
LDYgQEAgc3RhdGljIExJU1RfSEVBRChhcHBsaWVkX2xpc3QpOwogc3RhdGljIHVuc2lnbmVkIGlu
dCBwYXlsb2FkX2NudDsKIHN0YXRpYyB1bnNpZ25lZCBpbnQgcGF5bG9hZF92ZXJzaW9uID0gMTsK
IAotLyogVG8gY29udGFpbiB0aGUgRUxGIE5vdGUgaGVhZGVyLiAqLwotc3RydWN0IGxpdmVwYXRj
aF9idWlsZF9pZCB7Ci0gICBjb25zdCB2b2lkICpwOwotICAgdW5zaWduZWQgaW50IGxlbjsKLX07
Ci0KLXN0cnVjdCBwYXlsb2FkIHsKLSAgICB1aW50MzJfdCBzdGF0ZTsgICAgICAgICAgICAgICAg
ICAgICAgLyogT25lIG9mIHRoZSBMSVZFUEFUQ0hfU1RBVEVfKi4gKi8KLSAgICBpbnQzMl90IHJj
OyAgICAgICAgICAgICAgICAgICAgICAgICAgLyogMCBvciAtWEVOX0VYWC4gKi8KLSAgICBib29s
IHJldmVydGVkOyAgICAgICAgICAgICAgICAgICAgICAgLyogV2hldGhlciBpdCB3YXMgcmV2ZXJ0
ZWQuICovCi0gICAgYm9vbCBzYWZlX3RvX3JlYXBwbHk7ICAgICAgICAgICAgICAgIC8qIENhbiBh
cHBseSBzYWZlbHkgYWZ0ZXIgcmV2ZXJ0LiAqLwotICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsg
ICAgICAgICAgICAgICAvKiBMaW5rZWQgdG8gJ3BheWxvYWRfbGlzdCcuICovCi0gICAgY29uc3Qg
dm9pZCAqdGV4dF9hZGRyOyAgICAgICAgICAgICAgIC8qIFZpcnR1YWwgYWRkcmVzcyBvZiAudGV4
dC4gKi8KLSAgICBzaXplX3QgdGV4dF9zaXplOyAgICAgICAgICAgICAgICAgICAgLyogLi4gYW5k
IGl0cyBzaXplLiAqLwotICAgIGNvbnN0IHZvaWQgKnJ3X2FkZHI7ICAgICAgICAgICAgICAgICAv
KiBWaXJ0dWFsIGFkZHJlc3Mgb2YgLmRhdGEuICovCi0gICAgc2l6ZV90IHJ3X3NpemU7ICAgICAg
ICAgICAgICAgICAgICAgIC8qIC4uIGFuZCBpdHMgc2l6ZSAoaWYgYW55KS4gKi8KLSAgICBjb25z
dCB2b2lkICpyb19hZGRyOyAgICAgICAgICAgICAgICAgLyogVmlydHVhbCBhZGRyZXNzIG9mIC5y
b2RhdGEuICovCi0gICAgc2l6ZV90IHJvX3NpemU7ICAgICAgICAgICAgICAgICAgICAgIC8qIC4u
IGFuZCBpdHMgc2l6ZSAoaWYgYW55KS4gKi8KLSAgICB1bnNpZ25lZCBpbnQgcGFnZXM7ICAgICAg
ICAgICAgICAgICAgLyogVG90YWwgcGFnZXMgZm9yIFt0ZXh0LHJ3LHJvXV9hZGRyICovCi0gICAg
c3RydWN0IGxpc3RfaGVhZCBhcHBsaWVkX2xpc3Q7ICAgICAgIC8qIExpbmtlZCB0byAnYXBwbGll
ZF9saXN0Jy4gKi8KLSAgICBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1bmNzOyAgICAgICAgLyog
VGhlIGFycmF5IG9mIGZ1bmN0aW9ucyB0byBwYXRjaC4gKi8KLSAgICB1bnNpZ25lZCBpbnQgbmZ1
bmNzOyAgICAgICAgICAgICAgICAgLyogTnIgb2YgZnVuY3Rpb25zIHRvIHBhdGNoLiAqLwotICAg
IGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfc3ltYm9sICpzeW10YWI7IC8qIEFsbCBzeW1ib2xzLiAq
LwotICAgIGNvbnN0IGNoYXIgKnN0cnRhYjsgICAgICAgICAgICAgICAgICAvKiBQb2ludGVyIHRv
IC5zdHJ0YWIuICovCi0gICAgc3RydWN0IHZpcnR1YWxfcmVnaW9uIHJlZ2lvbjsgICAgICAgIC8q
IHN5bWJvbCwgYnVnLmZyYW1lIHBhdGNoaW5nIGFuZAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBleGNlcHRpb24gdGFibGUgKHg4NikuICovCi0gICAgdW5zaWdu
ZWQgaW50IG5zeW1zOyAgICAgICAgICAgICAgICAgIC8qIE5yIG9mIGVudHJpZXMgaW4gLnN0cnRh
YiBhbmQgc3ltYm9scy4gKi8KLSAgICBzdHJ1Y3QgbGl2ZXBhdGNoX2J1aWxkX2lkIGlkOyAgICAg
ICAgLyogRUxGTk9URV9ERVNDKC5ub3RlLmdudS5idWlsZC1pZCkgb2YgdGhlIHBheWxvYWQuICov
Ci0gICAgc3RydWN0IGxpdmVwYXRjaF9idWlsZF9pZCBkZXA7ICAgICAgIC8qIEVMRk5PVEVfREVT
QygubGl2ZXBhdGNoLmRlcGVuZHMpLiAqLwotICAgIHN0cnVjdCBsaXZlcGF0Y2hfYnVpbGRfaWQg
eGVuX2RlcDsgICAvKiBFTEZOT1RFX0RFU0MoLmxpdmVwYXRjaC54ZW5fZGVwZW5kcykuICovCi0g
ICAgbGl2ZXBhdGNoX2xvYWRjYWxsX3QgKmNvbnN0ICpsb2FkX2Z1bmNzOyAgIC8qIFRoZSBhcnJh
eSBvZiBmdW5jcyB0byBjYWxsIGFmdGVyICovCi0gICAgbGl2ZXBhdGNoX3VubG9hZGNhbGxfdCAq
Y29uc3QgKnVubG9hZF9mdW5jczsvKiBsb2FkIGFuZCB1bmxvYWQgb2YgdGhlIHBheWxvYWQuICov
Ci0gICAgdW5zaWduZWQgaW50IG5fbG9hZF9mdW5jczsgICAgICAgICAgIC8qIE5yIG9mIHRoZSBm
dW5jcyB0byBsb2FkIGFuZCBleGVjdXRlLiAqLwotICAgIHVuc2lnbmVkIGludCBuX3VubG9hZF9m
dW5jczsgICAgICAgICAvKiBOciBvZiBmdW5jcyB0byBjYWxsIGR1cnVuZyB1bmxvYWQuICovCi0g
ICAgY2hhciBuYW1lW1hFTl9MSVZFUEFUQ0hfTkFNRV9TSVpFXTsgIC8qIE5hbWUgb2YgaXQuICov
Ci19OwotCiAvKiBEZWZpbmVzIGFuIG91dHN0YW5kaW5nIHBhdGNoaW5nIGFjdGlvbi4gKi8KIHN0
cnVjdCBsaXZlcGF0Y2hfd29yawogewpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpdmVw
YXRjaF9wYXlsb2FkLmggYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaAppbmRl
eCA0YTFhOTZkMDU0Li45OTYxM2FmMmRiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGl2
ZXBhdGNoX3BheWxvYWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQu
aApAQCAtNCw2ICs0LDE1IEBACiAKICNpZm5kZWYgX19YRU5fTElWRVBBVENIX1BBWUxPQURfSF9f
CiAjZGVmaW5lIF9fWEVOX0xJVkVQQVRDSF9QQVlMT0FEX0hfXworI2luY2x1ZGUgPHhlbi92aXJ0
dWFsX3JlZ2lvbi5oPgorCisvKiBUbyBjb250YWluIHRoZSBFTEYgTm90ZSBoZWFkZXIuICovCitz
dHJ1Y3QgbGl2ZXBhdGNoX2J1aWxkX2lkIHsKKyAgIGNvbnN0IHZvaWQgKnA7CisgICB1bnNpZ25l
ZCBpbnQgbGVuOworfTsKKwordHlwZWRlZiBzdHJ1Y3QgcGF5bG9hZCBsaXZlcGF0Y2hfcGF5bG9h
ZF90OwogCiAvKgogICogVGhlIGZvbGxvd2luZyBkZWZpbml0aW9ucyBhcmUgdG8gYmUgdXNlZCBp
biBwYXRjaGVzLiBUaGV5IGFyZSB0YWtlbgpAQCAtMTIsNiArMjEsMzcgQEAKIHR5cGVkZWYgdm9p
ZCBsaXZlcGF0Y2hfbG9hZGNhbGxfdCh2b2lkKTsKIHR5cGVkZWYgdm9pZCBsaXZlcGF0Y2hfdW5s
b2FkY2FsbF90KHZvaWQpOwogCitzdHJ1Y3QgcGF5bG9hZCB7CisgICAgdWludDMyX3Qgc3RhdGU7
ICAgICAgICAgICAgICAgICAgICAgIC8qIE9uZSBvZiB0aGUgTElWRVBBVENIX1NUQVRFXyouICov
CisgICAgaW50MzJfdCByYzsgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIDAgb3IgLVhFTl9F
WFguICovCisgICAgYm9vbCByZXZlcnRlZDsgICAgICAgICAgICAgICAgICAgICAgIC8qIFdoZXRo
ZXIgaXQgd2FzIHJldmVydGVkLiAqLworICAgIGJvb2wgc2FmZV90b19yZWFwcGx5OyAgICAgICAg
ICAgICAgICAvKiBDYW4gYXBwbHkgc2FmZWx5IGFmdGVyIHJldmVydC4gKi8KKyAgICBzdHJ1Y3Qg
bGlzdF9oZWFkIGxpc3Q7ICAgICAgICAgICAgICAgLyogTGlua2VkIHRvICdwYXlsb2FkX2xpc3Qn
LiAqLworICAgIGNvbnN0IHZvaWQgKnRleHRfYWRkcjsgICAgICAgICAgICAgICAvKiBWaXJ0dWFs
IGFkZHJlc3Mgb2YgLnRleHQuICovCisgICAgc2l6ZV90IHRleHRfc2l6ZTsgICAgICAgICAgICAg
ICAgICAgIC8qIC4uIGFuZCBpdHMgc2l6ZS4gKi8KKyAgICBjb25zdCB2b2lkICpyd19hZGRyOyAg
ICAgICAgICAgICAgICAgLyogVmlydHVhbCBhZGRyZXNzIG9mIC5kYXRhLiAqLworICAgIHNpemVf
dCByd19zaXplOyAgICAgICAgICAgICAgICAgICAgICAvKiAuLiBhbmQgaXRzIHNpemUgKGlmIGFu
eSkuICovCisgICAgY29uc3Qgdm9pZCAqcm9fYWRkcjsgICAgICAgICAgICAgICAgIC8qIFZpcnR1
YWwgYWRkcmVzcyBvZiAucm9kYXRhLiAqLworICAgIHNpemVfdCByb19zaXplOyAgICAgICAgICAg
ICAgICAgICAgICAvKiAuLiBhbmQgaXRzIHNpemUgKGlmIGFueSkuICovCisgICAgdW5zaWduZWQg
aW50IHBhZ2VzOyAgICAgICAgICAgICAgICAgIC8qIFRvdGFsIHBhZ2VzIGZvciBbdGV4dCxydyxy
b11fYWRkciAqLworICAgIHN0cnVjdCBsaXN0X2hlYWQgYXBwbGllZF9saXN0OyAgICAgICAvKiBM
aW5rZWQgdG8gJ2FwcGxpZWRfbGlzdCcuICovCisgICAgc3RydWN0IGxpdmVwYXRjaF9mdW5jICpm
dW5jczsgICAgICAgIC8qIFRoZSBhcnJheSBvZiBmdW5jdGlvbnMgdG8gcGF0Y2guICovCisgICAg
dW5zaWduZWQgaW50IG5mdW5jczsgICAgICAgICAgICAgICAgIC8qIE5yIG9mIGZ1bmN0aW9ucyB0
byBwYXRjaC4gKi8KKyAgICBjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX3N5bWJvbCAqc3ltdGFiOyAv
KiBBbGwgc3ltYm9scy4gKi8KKyAgICBjb25zdCBjaGFyICpzdHJ0YWI7ICAgICAgICAgICAgICAg
ICAgLyogUG9pbnRlciB0byAuc3RydGFiLiAqLworICAgIHN0cnVjdCB2aXJ0dWFsX3JlZ2lvbiBy
ZWdpb247ICAgICAgICAvKiBzeW1ib2wsIGJ1Zy5mcmFtZSBwYXRjaGluZyBhbmQKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXhjZXB0aW9uIHRhYmxlICh4ODYp
LiAqLworICAgIHVuc2lnbmVkIGludCBuc3ltczsgICAgICAgICAgICAgICAgICAvKiBOciBvZiBl
bnRyaWVzIGluIC5zdHJ0YWIgYW5kIHN5bWJvbHMuICovCisgICAgc3RydWN0IGxpdmVwYXRjaF9i
dWlsZF9pZCBpZDsgICAgICAgIC8qIEVMRk5PVEVfREVTQygubm90ZS5nbnUuYnVpbGQtaWQpIG9m
IHRoZSBwYXlsb2FkLiAqLworICAgIHN0cnVjdCBsaXZlcGF0Y2hfYnVpbGRfaWQgZGVwOyAgICAg
ICAvKiBFTEZOT1RFX0RFU0MoLmxpdmVwYXRjaC5kZXBlbmRzKS4gKi8KKyAgICBzdHJ1Y3QgbGl2
ZXBhdGNoX2J1aWxkX2lkIHhlbl9kZXA7ICAgLyogRUxGTk9URV9ERVNDKC5saXZlcGF0Y2gueGVu
X2RlcGVuZHMpLiAqLworICAgIGxpdmVwYXRjaF9sb2FkY2FsbF90ICpjb25zdCAqbG9hZF9mdW5j
czsgICAvKiBUaGUgYXJyYXkgb2YgZnVuY3MgdG8gY2FsbCBhZnRlciAqLworICAgIGxpdmVwYXRj
aF91bmxvYWRjYWxsX3QgKmNvbnN0ICp1bmxvYWRfZnVuY3M7LyogbG9hZCBhbmQgdW5sb2FkIG9m
IHRoZSBwYXlsb2FkLiAqLworICAgIHVuc2lnbmVkIGludCBuX2xvYWRfZnVuY3M7ICAgICAgICAg
ICAvKiBOciBvZiB0aGUgZnVuY3MgdG8gbG9hZCBhbmQgZXhlY3V0ZS4gKi8KKyAgICB1bnNpZ25l
ZCBpbnQgbl91bmxvYWRfZnVuY3M7ICAgICAgICAgLyogTnIgb2YgZnVuY3MgdG8gY2FsbCBkdXJ1
bmcgdW5sb2FkLiAqLworICAgIGNoYXIgbmFtZVtYRU5fTElWRVBBVENIX05BTUVfU0laRV07ICAv
KiBOYW1lIG9mIGl0LiAqLworfTsKKwogLyoKICAqIExJVkVQQVRDSF9MT0FEX0hPT0sgbWFjcm8K
ICAqCi0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJI
CktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlh
biBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hh
cmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4
OSAyMzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
