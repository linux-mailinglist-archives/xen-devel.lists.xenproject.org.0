Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93A1293EA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 11:02:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijKV3-00052b-Io; Mon, 23 Dec 2019 09:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htmo=2N=amazon.com=prvs=2537494bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijKV2-00052W-II
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 09:59:40 +0000
X-Inumbo-ID: ee7d6153-256a-11ea-96b9-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee7d6153-256a-11ea-96b9-12813bfff9fa;
 Mon, 23 Dec 2019 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577095180; x=1608631180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AXLA4oTaOxQEJPJrsHXELfBXcoU1aXhP5KDiSUct76c=;
 b=VzL6NakNmD7eUUuwec2teTcTV3pzRvnG4sYu9d5XcxZaRi9ohDDveBMp
 4HHovW5EyjTmzWbDzns/2rhCv49qR6uW+Ubian6jzgYpzwf2cMqSPIp2W
 ODhDzsfyOWCtK9QDJb2dtBqiBEsXKcVfDFN4CiSNJKqZ5w558Dj+luVb3 g=;
IronPort-SDR: rLgT1+3QwmMpnM5bGo0ssD6aR/h2FMREnjuVxYeVCxnfm9Ui3zS68hR6AN9C/j+TMaPe1k5tmu
 bj8hhWJJy1zw==
X-IronPort-AV: E=Sophos;i="5.69,347,1571702400"; d="scan'208";a="16521924"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 23 Dec 2019 09:59:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 769FAA119C; Mon, 23 Dec 2019 09:59:27 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 23 Dec 2019 09:59:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 09:59:26 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 23 Dec 2019 09:59:24 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 23 Dec 2019 09:59:23 +0000
Message-ID: <20191223095923.2458-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH net-next] xen-netback: support dynamic
 unbind/bind
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, "David S. Miller" <davem@davemloft.net>,
 Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QnkgcmUtYXR0YWNoaW5nIFJYLCBUWCwgYW5kIENUTCByaW5ncyBkdXJpbmcgY29ubmVjdCgpIHJh
dGhlciB0aGFuCmFzc3VtaW5nIHRoZXkgYXJlIGZyZXNobHkgYWxsb2NhdGVkIChpLmUuIGFzc3Vt
aW5nIHRoZSBjb3VudGVycyBhcmUgemVybyksCmFuZCBhdm9pZGluZyBmb3JjaW5nIHN0YXRlIHRv
IENsb3NlZCBpbiBuZXRiYWNrX3JlbW92ZSgpIGl0IGlzIHBvc3NpYmxlCmZvciB2aWYgaW5zdGFu
Y2VzIHRvIGJlIHVuYm91bmQgYW5kIHJlLWJvdW5kIGZyb20gYW5kIHRvIChyZXNwZWN0aXZlbHkp
IGEKcnVubmluZyBndWVzdC4KCkR5bmFtaWMgdW5iaW5kL2JpbmQgaXMgYSBoaWdobHkgdXNlZnVs
IGZlYXR1cmUgZm9yIGEgYmFja2VuZCBtb2R1bGUgYXMgaXQKYWxsb3dzIGl0IHRvIGJlIHVubG9h
ZGVkIGFuZCByZS1sb2FkZWQgKGkuZS4gdXBkYXRlZCkgd2l0aG91dCByZXF1aXJpbmcKZG9tVXMg
dG8gYmUgaGFsdGVkLgoKVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgYnkgcnVubmluZyBpcGVyZiBhcyBh
IHNlcnZlciBpbiB0aGUgdGVzdCBWTSBhbmQKdGhlbiBydW5uaW5nIGEgY2xpZW50IGFnYWluc3Qg
aXQgaW4gYSBjb250aW51b3VzIGxvb3AsIHdoaWxzdCBhbHNvCnJ1bm5pbmc6Cgp3aGlsZSB0cnVl
OwogIGRvIGVjaG8gdmlmLSRET01JRC0kVklGID51bmJpbmQ7CiAgZWNobyBkb3duOwogIHJtbW9k
IHhlbi1uZXRiYWNrOwogIGVjaG8gdW5sb2FkZWQ7CiAgbW9kcHJvYmUgeGVuLW5ldGJhY2s7CiAg
Y2QgJChwd2QpOwogIGJyY3RsIGFkZGlmIHhlbmJyMCB2aWYkRE9NSUQuJFZJRjsKICBpcCBsaW5r
IHNldCB2aWYkRE9NSUQuJFZJRiB1cDsKICBlY2hvIHVwOwogIHNsZWVwIDU7CiAgZG9uZQoKaW4g
ZG9tMCBmcm9tIC9zeXMvYnVzL3hlbi1iYWNrZW5kL2RyaXZlcnMvdmlmIHRvIGNvbnRpbnVvdXNs
eSB1bmJpbmQsCnVubG9hZCwgcmUtbG9hZCwgcmUtYmluZCBhbmQgcmUtcGx1bWIgdGhlIGJhY2tl
bmQuCgpDbGVhcmx5IGEgcGVyZm9ybWFuY2UgZHJvcCB3YXMgc2VlbiBidXQgbm8gVENQIGNvbm5l
Y3Rpb24gcmVzZXRzIHdlcmUKb2JzZXJ2ZWQgZHVyaW5nIHRoaXMgdGVzdCBhbmQgbW9yZW92ZXIg
YSBwYXJhbGxlbCBTU0ggY29ubmVjdGlvbiBpbnRvIHRoZQpndWVzdCByZW1haW5lZCBwZXJmZWN0
bHkgdXNhYmxlIHRocm91Z2hvdXQuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+Ci0tLQpDYzogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgpDYzog
UGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CkNjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1A
ZGF2ZW1sb2Z0Lm5ldD4KLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyB8
IDEwICsrKysrKysrKy0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYyAgIHwgMjAg
KysrKysrKysrKysrKysrKystLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jICAg
IHwgIDUgKystLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYyBi
L2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2ludGVyZmFjZS5jCmluZGV4IGYxNWJhM2RlNjE5NS4u
MGM4YTAyYTFlYWQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZh
Y2UuYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYwpAQCAtNTg1LDYg
KzU4NSw3IEBAIGludCB4ZW52aWZfY29ubmVjdF9jdHJsKHN0cnVjdCB4ZW52aWYgKnZpZiwgZ3Jh
bnRfcmVmX3QgcmluZ19yZWYsCiAJc3RydWN0IG5ldF9kZXZpY2UgKmRldiA9IHZpZi0+ZGV2Owog
CXZvaWQgKmFkZHI7CiAJc3RydWN0IHhlbl9uZXRpZl9jdHJsX3NyaW5nICpzaGFyZWQ7CisJUklO
R19JRFggcnNwX3Byb2QsIHJlcV9wcm9kOwogCWludCBlcnI7CiAKIAllcnIgPSB4ZW5idXNfbWFw
X3JpbmdfdmFsbG9jKHhlbnZpZl90b194ZW5idXNfZGV2aWNlKHZpZiksCkBAIC01OTMsNyArNTk0
LDE0IEBAIGludCB4ZW52aWZfY29ubmVjdF9jdHJsKHN0cnVjdCB4ZW52aWYgKnZpZiwgZ3JhbnRf
cmVmX3QgcmluZ19yZWYsCiAJCWdvdG8gZXJyOwogCiAJc2hhcmVkID0gKHN0cnVjdCB4ZW5fbmV0
aWZfY3RybF9zcmluZyAqKWFkZHI7Ci0JQkFDS19SSU5HX0lOSVQoJnZpZi0+Y3RybCwgc2hhcmVk
LCBYRU5fUEFHRV9TSVpFKTsKKwlyc3BfcHJvZCA9IFJFQURfT05DRShzaGFyZWQtPnJzcF9wcm9k
KTsKKwlyZXFfcHJvZCA9IFJFQURfT05DRShzaGFyZWQtPnJlcV9wcm9kKTsKKworCUJBQ0tfUklO
R19BVFRBQ0goJnZpZi0+Y3RybCwgc2hhcmVkLCByc3BfcHJvZCwgWEVOX1BBR0VfU0laRSk7CisK
KwllcnIgPSAtRUlPOworCWlmIChyZXFfcHJvZCAtIHJzcF9wcm9kID4gUklOR19TSVpFKCZ2aWYt
PmN0cmwpKQorCQlnb3RvIGVycl91bm1hcDsKIAogCWVyciA9IGJpbmRfaW50ZXJkb21haW5fZXZ0
Y2huX3RvX2lycSh2aWYtPmRvbWlkLCBldnRjaG4pOwogCWlmIChlcnIgPCAwKQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jIGIvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2svbmV0YmFjay5jCmluZGV4IDAwMjBiMmU4YzI3OS4uMzE1ZGZjNmVhMjk3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMKKysrIGIvZHJpdmVycy9uZXQv
eGVuLW5ldGJhY2svbmV0YmFjay5jCkBAIC0xNDUzLDcgKzE0NTMsNyBAQCBpbnQgeGVudmlmX21h
cF9mcm9udGVuZF9kYXRhX3JpbmdzKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAogCXZvaWQg
KmFkZHI7CiAJc3RydWN0IHhlbl9uZXRpZl90eF9zcmluZyAqdHhzOwogCXN0cnVjdCB4ZW5fbmV0
aWZfcnhfc3JpbmcgKnJ4czsKLQorCVJJTkdfSURYIHJzcF9wcm9kLCByZXFfcHJvZDsKIAlpbnQg
ZXJyID0gLUVOT01FTTsKIAogCWVyciA9IHhlbmJ1c19tYXBfcmluZ192YWxsb2MoeGVudmlmX3Rv
X3hlbmJ1c19kZXZpY2UocXVldWUtPnZpZiksCkBAIC0xNDYyLDcgKzE0NjIsMTQgQEAgaW50IHhl
bnZpZl9tYXBfZnJvbnRlbmRfZGF0YV9yaW5ncyhzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwK
IAkJZ290byBlcnI7CiAKIAl0eHMgPSAoc3RydWN0IHhlbl9uZXRpZl90eF9zcmluZyAqKWFkZHI7
Ci0JQkFDS19SSU5HX0lOSVQoJnF1ZXVlLT50eCwgdHhzLCBYRU5fUEFHRV9TSVpFKTsKKwlyc3Bf
cHJvZCA9IFJFQURfT05DRSh0eHMtPnJzcF9wcm9kKTsKKwlyZXFfcHJvZCA9IFJFQURfT05DRSh0
eHMtPnJlcV9wcm9kKTsKKworCUJBQ0tfUklOR19BVFRBQ0goJnF1ZXVlLT50eCwgdHhzLCByc3Bf
cHJvZCwgWEVOX1BBR0VfU0laRSk7CisKKwllcnIgPSAtRUlPOworCWlmIChyZXFfcHJvZCAtIHJz
cF9wcm9kID4gUklOR19TSVpFKCZxdWV1ZS0+dHgpKQorCQlnb3RvIGVycjsKIAogCWVyciA9IHhl
bmJ1c19tYXBfcmluZ192YWxsb2MoeGVudmlmX3RvX3hlbmJ1c19kZXZpY2UocXVldWUtPnZpZiks
CiAJCQkJICAgICAmcnhfcmluZ19yZWYsIDEsICZhZGRyKTsKQEAgLTE0NzAsNyArMTQ3NywxNCBA
QCBpbnQgeGVudmlmX21hcF9mcm9udGVuZF9kYXRhX3JpbmdzKHN0cnVjdCB4ZW52aWZfcXVldWUg
KnF1ZXVlLAogCQlnb3RvIGVycjsKIAogCXJ4cyA9IChzdHJ1Y3QgeGVuX25ldGlmX3J4X3NyaW5n
ICopYWRkcjsKLQlCQUNLX1JJTkdfSU5JVCgmcXVldWUtPnJ4LCByeHMsIFhFTl9QQUdFX1NJWkUp
OworCXJzcF9wcm9kID0gUkVBRF9PTkNFKHJ4cy0+cnNwX3Byb2QpOworCXJlcV9wcm9kID0gUkVB
RF9PTkNFKHJ4cy0+cmVxX3Byb2QpOworCisJQkFDS19SSU5HX0FUVEFDSCgmcXVldWUtPnJ4LCBy
eHMsIHJzcF9wcm9kLCBYRU5fUEFHRV9TSVpFKTsKKworCWVyciA9IC1FSU87CisJaWYgKHJlcV9w
cm9kIC0gcnNwX3Byb2QgPiBSSU5HX1NJWkUoJnF1ZXVlLT5yeCkpCisJCWdvdG8gZXJyOwogCiAJ
cmV0dXJuIDA7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5j
IGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMKaW5kZXggMTdiNDk1MGVjMDUxLi4y
ODYwNTRiNjBkNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5j
CisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jCkBAIC05NTQsMTIgKzk1NCwx
MCBAQCBzdGF0aWMgaW50IG5ldGJhY2tfcmVtb3ZlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYp
CiB7CiAJc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUgPSBkZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2
KTsKIAotCXNldF9iYWNrZW5kX3N0YXRlKGJlLCBYZW5idXNTdGF0ZUNsb3NlZCk7Ci0KIAl1bnJl
Z2lzdGVyX2hvdHBsdWdfc3RhdHVzX3dhdGNoKGJlKTsKIAlpZiAoYmUtPnZpZikgewogCQlrb2Jq
ZWN0X3VldmVudCgmZGV2LT5kZXYua29iaiwgS09CSl9PRkZMSU5FKTsKLQkJeGVuX3VucmVnaXN0
ZXJfd2F0Y2hlcnMoYmUtPnZpZik7CisJCWJhY2tlbmRfZGlzY29ubmVjdChiZSk7CiAJCXhlbnZp
Zl9mcmVlKGJlLT52aWYpOwogCQliZS0+dmlmID0gTlVMTDsKIAl9CkBAIC0xMTMxLDYgKzExMjks
NyBAQCBzdGF0aWMgc3RydWN0IHhlbmJ1c19kcml2ZXIgbmV0YmFja19kcml2ZXIgPSB7CiAJLnJl
bW92ZSA9IG5ldGJhY2tfcmVtb3ZlLAogCS51ZXZlbnQgPSBuZXRiYWNrX3VldmVudCwKIAkub3Ro
ZXJlbmRfY2hhbmdlZCA9IGZyb250ZW5kX2NoYW5nZWQsCisJLmFsbG93X3JlYmluZCA9IHRydWUs
CiB9OwogCiBpbnQgeGVudmlmX3hlbmJ1c19pbml0KHZvaWQpCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
