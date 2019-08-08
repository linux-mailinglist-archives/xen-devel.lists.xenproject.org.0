Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 132488623C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhqT-0005h1-Iu; Thu, 08 Aug 2019 12:48:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHrm=WE=amazon.de=prvs=1160688d3=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvhqR-0005gw-Tb
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 12:48:39 +0000
X-Inumbo-ID: d7c595f7-b9da-11e9-8980-bc764e045a96
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d7c595f7-b9da-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565268518; x=1596804518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=eAv3PQrHbGS7ayoKuo5sudyqQS72GJzUecBqKPQzui4=;
 b=Dg1VaLrLzGByeWN9lfzOhcbF3eECsVcAomOKjNOw8HEgdLZ8bMNioKpn
 0g5cKZ+c/tv8SEDaVB+4U6RQvwhe4XEfxFvD+mFmo/AFG5LBlZFP8kgFr
 kem6XQkiaL+MHgsfGJANE0HJElGlxDmSxlRBAcf1J/vyzlTPoLilVGVG+ 4=;
X-IronPort-AV: E=Sophos;i="5.64,361,1559520000"; d="scan'208";a="745774240"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 08 Aug 2019 12:48:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id 28B02A274A; Thu,  8 Aug 2019 12:48:37 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:48:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:48:35 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 8 Aug 2019 12:48:34 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Thu, 8 Aug 2019 12:48:31 +0000
Message-ID: <20190808124831.10094-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416122241.28342-2-wipawel@amazon.de>
References: <20190416122241.28342-2-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part3 v2 2/3]
 create-diff-object: Extend patchability verification: STN_UNDEF
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIHZlcmlmaWNhdGlvbiBjaGVjayBpZiBhbGwgc2VjdGlvbnMgZG8gbm90IGNvbnRhaW4g
YW55IGVudHJpZXMKd2l0aCB1bmRlZmluZWQgc3ltYm9scyAoU1ROX1VOREVGKS4gVGhpcyBzaXR1
YXRpb24gY2FuIGhhcHBlbiB3aGVuIGEKc2VjdGlvbiBpcyBjb3BpZWQgb3ZlciBmcm9tIGl0cyBv
cmlnaW5hbCBvYmplY3QgdG8gYSBwYXRjaGVkIG9iamVjdCwKYnV0IHZhcmlvdXMgc3ltYm9scyBy
ZWxhdGVkIHRvIHRoZSBzZWN0aW9uIGFyZSBub3QgY29waWVkIGFsb25nLgpUaGlzIHNjZW5hcmlv
IGhhcHBlbnMgdHlwaWNhbGx5IGR1cmluZyBzdGFja2VkIGhvdHBhdGNoZXMgY3JlYXRpb24KKGJl
dHdlZW4gMiBkaWZmZXJlbnQgaG90cGF0Y2ggbW9kdWxlcykuCgpTaWduZWQtb2ZmLWJ5OiBQYXdl
bCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4g
UG9obGFjayA8bXBvaGxhY2tAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8
ZG9lYmVsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlA
YW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0Bh
bWF6b24uY29tPgotLS0KdjI6CiogUmVmYWN0b3JlZCBjb2RlIGJ5IGNyZWF0aW5nIGEgbmV3IGZ1
bmN0aW9uIGtwYXRjaF9zZWN0aW9uX2hhc191bmRlZl9zeW1ib2xzKCkKICBmb3IgdGhlIGNvbXBs
aWNhdGVkIG11bHRpLWxvb3AgY29kZSBvZiBrcGF0Y2hfdmVyaWZ5X3BhdGNoYWJpbGl0eSgpLgog
IEhvcGVmdWxseSB0aGlzIG1ha2VzIGNvZGUgbW9yZSByZWFkYWJsZSBhbmQgZWFzaWVyIHRvIG1h
aW50YWluLgoqIEtlcHQgbGluZXMgbGltaXRzIHRvIDgwIGNoYXJzICh3aGVyZWV2ZXIgcG9zc2li
bGUpCiogRGV0ZWN0aW9uIG9mIGFuIHVuZGVmaW5lZCBzeW1ib2wgY291bnRzIGFzIGEgc2luZ2xl
IGVycm9yCi0tLQogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCA2NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jIGIvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMKaW5kZXggNDFhZGIwOS4uZTkwNTEzMSAxMDA2NDQKLS0tIGEvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKQEAgLTE1MzEsNiArMTUzMSw2
MSBAQCBzdGF0aWMgdm9pZCBrcGF0Y2hfcHJpbnRfY2hhbmdlcyhzdHJ1Y3Qga3BhdGNoX2VsZiAq
a2VsZikKIAl9CiB9CiAKK3N0YXRpYyBpbmxpbmUgaW50IGdldF9zZWN0aW9uX2VudHJ5X3NpemUo
Y29uc3Qgc3RydWN0IHNlY3Rpb24gKnNlYywKKwkJCQkJIHN0cnVjdCBrcGF0Y2hfZWxmICprZWxm
KQoreworCWludCBlbnRyeV9zaXplOworCisJLyoKKwkgKiBCYXNlIHNlY3Rpb25zIHR5cGljYWxs
eSBkbyBub3QgZGVmaW5lIGZpeGVkIHNpemUgZWxlbWVudHMuCisJICogRGV0ZWN0IHNlY3Rpb24n
cyBlbGVtZW50IHNpemUgaW4gY2FzZSBpdCdzIGEgc3BlY2lhbCBzZWN0aW9uLgorCSAqIE90aGVy
d2lzZSwgc2tpcCBpdCBkdWUgdG8gYW4gdW5rbm93biBzaF9lbnRzaXplLgorCSAqLworCWVudHJ5
X3NpemUgPSBzZWMtPnNoLnNoX2VudHNpemU7CisJaWYgKGVudHJ5X3NpemUgPT0gMCkgeworCQlz
dHJ1Y3Qgc3BlY2lhbF9zZWN0aW9uICpzcGVjaWFsOworCisJCS8qIEZpbmQgc3BlY2lhbCBzZWN0
aW9uIGdyb3VwX3NpemUuICovCisJCWZvciAoc3BlY2lhbCA9IHNwZWNpYWxfc2VjdGlvbnM7IHNw
ZWNpYWwtPm5hbWU7IHNwZWNpYWwrKykgeworCQkJaWYgKCFzdHJjbXAoc2VjLT5uYW1lLCBzcGVj
aWFsLT5uYW1lKSkKKwkJCQlyZXR1cm4gc3BlY2lhbC0+Z3JvdXBfc2l6ZShrZWxmLCAwKTsKKwkJ
fQorICAgICAgICB9CisKKwlyZXR1cm4gZW50cnlfc2l6ZTsKK30KKworc3RhdGljIGludCBrcGF0
Y2hfc2VjdGlvbl9oYXNfdW5kZWZfc3ltYm9scyhzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZiwKKwkJ
CQkJICAgIGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMpCit7CisJaW50IG9mZnNldCwgZW50cnlf
c2l6ZTsKKwlzdHJ1Y3QgcmVsYSAqcmVsYTsKKwlzaXplX3QgZF9zaXplOworCisJZW50cnlfc2l6
ZSA9IGdldF9zZWN0aW9uX2VudHJ5X3NpemUoc2VjLCBrZWxmKTsKKwlpZiAoZW50cnlfc2l6ZSA9
PSAwKQorCQlyZXR1cm4gZmFsc2U7CisKKwlkX3NpemUgPSBzZWMtPmJhc2UtPmRhdGEtPmRfc2l6
ZTsKKwlmb3IgKCBvZmZzZXQgPSAwOyBvZmZzZXQgPCBkX3NpemU7IG9mZnNldCArPSBlbnRyeV9z
aXplICkgeworCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHJlbGEsICZzZWMtPnJlbGFzLCBsaXN0KSB7
CisJCQlpZiAocmVsYS0+b2Zmc2V0IDwgb2Zmc2V0IHx8CisJCQkgICAgcmVsYS0+b2Zmc2V0ID49
IG9mZnNldCArIGVudHJ5X3NpemUpIHsKKwkJCQljb250aW51ZTsKKwkJCX0KKworCQkJaWYgKChH
RUxGX1JfU1lNKHJlbGEtPnJlbGEucl9pbmZvKSA9PSBTVE5fVU5ERUYpIHx8CisJCQkgICAgKCFy
ZWxhLT5zeW0tPmluY2x1ZGUgJiYgcmVsYS0+c3ltLT5zdGF0dXMgPT0gU0FNRSkpIHsKKwkJCQls
b2dfbm9ybWFsKCJzZWN0aW9uICVzIGhhcyBhbiBlbnRyeSB3aXRoIGEgU1ROX1VOREVGIHN5bWJv
bDogJXNcbiIsCisJCQkJCSAgIHNlYy0+bmFtZSwgcmVsYS0+c3ltLT5uYW1lID86ICJub25lIik7
CisJCQkJcmV0dXJuIHRydWU7CisJCQl9CisJCX0KKwl9CisKKwlyZXR1cm4gZmFsc2U7Cit9CisK
IHN0YXRpYyB2b2lkIGtwYXRjaF92ZXJpZnlfcGF0Y2hhYmlsaXR5KHN0cnVjdCBrcGF0Y2hfZWxm
ICprZWxmKQogewogCXN0cnVjdCBzZWN0aW9uICpzZWM7CkBAIC0xNTYzLDYgKzE2MTgsMTcgQEAg
c3RhdGljIHZvaWQga3BhdGNoX3ZlcmlmeV9wYXRjaGFiaWxpdHkoc3RydWN0IGtwYXRjaF9lbGYg
KmtlbGYpCiAJCQkJCWVycnMrKzsKIAkJCQl9CiAJCQl9CisKKwkJCS8qIENoZWNrIGlmIGEgUkVM
QSBzZWN0aW9uIGRvZXMgbm90IGNvbnRhaW4gYW55IGVudHJpZXMgd2l0aAorCQkJICogdW5kZWZp
bmVkIHN5bWJvbHMgKFNUTl9VTkRFRikuIFRoaXMgc2l0dWF0aW9uIGNhbiBoYXBwZW4KKwkJCSAq
IHdoZW4gYSBzZWN0aW9uIGlzIGNvcGllZCBvdmVyIGZyb20gaXRzIG9yaWdpbmFsIG9iamVjdCB0
bworCQkJICogYSBwYXRjaGVkIG9iamVjdCwgYnV0IHZhcmlvdXMgc3ltYm9scyByZWxhdGVkIHRv
IHRoZSBzZWN0aW9uCisJCQkgKiBhcmUgbm90IGNvcGllZCBhbG9uZy4KKwkJCSAqLworCQkJaWYg
KGlzX3JlbGFfc2VjdGlvbihzZWMpKSB7CisJCQkJaWYgKGtwYXRjaF9zZWN0aW9uX2hhc191bmRl
Zl9zeW1ib2xzKGtlbGYsIHNlYykpCisJCQkJCWVycnMrKzsKKwkJCX0KIAkJfQogCiAJCS8qCi0t
IAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVz
ZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hs
YWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRl
bmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcg
ODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
