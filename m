Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28E84B11
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKRS-0003BW-Rh; Wed, 07 Aug 2019 11:49:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Flz=WD=amazon.de=prvs=115546d28=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvKRR-0003BR-VN
 for xen-devel@lists.xen.org; Wed, 07 Aug 2019 11:49:18 +0000
X-Inumbo-ID: 61e74050-b909-11e9-aa9e-0b38ae8a4c24
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61e74050-b909-11e9-aa9e-0b38ae8a4c24;
 Wed, 07 Aug 2019 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565178555; x=1596714555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GQdefIVneOjbqb8v/0HDooKPuzARLdmj0NGoFQ+HreY=;
 b=JsRd5Y4IS/TeKgh/ecBW/2v6pvDILKoNyWpmvX9BIFZddiEQIgeiR/FN
 C3DJt4iC5LJYWVEUoWVfCdMnbP7XZm1yQH65ePjIzhjkGeKcs7dcexoWI
 d6Xagz8LsqcUAsz6alBUkW0uOZncJuuiIwZkxIKKBWmLMwenK5IbmBmaX Y=;
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="414313099"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 07 Aug 2019 11:49:14 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id E1B86A212B; Wed,  7 Aug 2019 11:49:14 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 11:49:14 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 7 Aug 2019 11:49:13 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 7 Aug 2019 11:49:12 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 7 Aug 2019 11:49:07 +0000
Message-ID: <20190807114907.74530-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416120716.26269-2-wipawel@amazon.de>
References: <20190416120716.26269-2-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part2 v2 2/6] common: Add
 is_referenced_section() helper function
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

VGhpcyBmdW5jdGlvbiBjaGVja3MgaWYgZ2l2ZW4gc2VjdGlvbiBoYXMgYW4gaW5jbHVkZWQgY29y
cmVzcG9uZGluZwpSRUxBIHNlY3Rpb24gYW5kL29yIGFueSBvZiB0aGUgc3ltYm9scyB0YWJsZSBz
eW1ib2xzIHJlZmVyZW5jZXMgdGhlCnNlY3Rpb24uIFNlY3Rpb24gYXNzb2NpYXRlZCBzeW1ib2xz
IGFyZSBpZ25vcmVkIGhlcmUgYXMgdGhlcmUgaXMKYWx3YXlzIHN1Y2ggYSBzeW1ib2wgZm9yIGV2
ZXJ5IHNlY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdl
bEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJz
QGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRl
PgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Ci0tLQp2
MjoKKiBLZWVwIGxpbmVzIHRvIDgwIGNoYXJzCi0tLQogY29tbW9uLmMgfCAyMyArKysrKysrKysr
KysrKysrKysrKysrLQogY29tbW9uLmggfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY29tbW9uLmMgYi9jb21tb24u
YwppbmRleCAxZmIwN2NiLi4wZGRjOWZhIDEwMDY0NAotLS0gYS9jb21tb24uYworKysgYi9jb21t
b24uYwpAQCAtMTUsNyArMTUsNyBAQAogCiBpbnQgaXNfcmVsYV9zZWN0aW9uKHN0cnVjdCBzZWN0
aW9uICpzZWMpCiB7Ci0JcmV0dXJuIChzZWMtPnNoLnNoX3R5cGUgPT0gU0hUX1JFTEEpOworCXJl
dHVybiBzZWMgJiYgKHNlYy0+c2guc2hfdHlwZSA9PSBTSFRfUkVMQSk7CiB9CiAKIGludCBpc19s
b2NhbF9zeW0oc3RydWN0IHN5bWJvbCAqc3ltKQpAQCAtMjcwLDYgKzI3MCwyNyBAQCBpbnQgaXNf
c3RhbmRhcmRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQogCX0KIH0KIAoraW50IGlzX3Jl
ZmVyZW5jZWRfc2VjdGlvbihjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqc2VjLAorCQkJICBjb25zdCBz
dHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKK3sKKwlzdHJ1Y3Qgc3ltYm9sICpzeW07CisKKwlpZiAo
aXNfcmVsYV9zZWN0aW9uKHNlYy0+cmVsYSkgJiYgc2VjLT5yZWxhLT5pbmNsdWRlKQorCQlyZXR1
cm4gdHJ1ZTsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkoc3ltLCAma2VsZi0+c3ltYm9scywgbGlz
dCkgeworCQlpZiAoIXN5bS0+aW5jbHVkZSB8fCAhc3ltLT5zZWMpCisJCQljb250aW51ZTsKKwkJ
LyogSWdub3JlIHNlY3Rpb24gYXNzb2NpYXRlZCBzZWN0aW9ucyAqLworCQlpZiAoc3ltLT50eXBl
ID09IFNUVF9TRUNUSU9OKQorCQkJY29udGludWU7CisJCWlmIChzeW0tPnNlYy0+aW5kZXggPT0g
c2VjLT5pbmRleCkKKwkJCXJldHVybiB0cnVlOworCX0KKworCXJldHVybiBmYWxzZTsKK30KKwog
LyogcmV0dXJucyB0aGUgb2Zmc2V0IG9mIHRoZSBzdHJpbmcgaW4gdGhlIHN0cmluZyB0YWJsZSAq
LwogaW50IG9mZnNldF9vZl9zdHJpbmcoc3RydWN0IGxpc3RfaGVhZCAqbGlzdCwgY2hhciAqbmFt
ZSkKIHsKZGlmZiAtLWdpdCBhL2NvbW1vbi5oIGIvY29tbW9uLmgKaW5kZXggY2RhNjkwZC4uMDZl
MTllNyAxMDA2NDQKLS0tIGEvY29tbW9uLmgKKysrIGIvY29tbW9uLmgKQEAgLTE1MSw2ICsxNTEs
OCBAQCBpbnQgaXNfdGV4dF9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpOwogaW50IGlzX2Rl
YnVnX3NlY3Rpb24oc3RydWN0IHNlY3Rpb24gKnNlYyk7CiBpbnQgaXNfcmVsYV9zZWN0aW9uKHN0
cnVjdCBzZWN0aW9uICpzZWMpOwogaW50IGlzX3N0YW5kYXJkX3NlY3Rpb24oc3RydWN0IHNlY3Rp
b24gKnNlYyk7CitpbnQgaXNfcmVmZXJlbmNlZF9zZWN0aW9uKGNvbnN0IHN0cnVjdCBzZWN0aW9u
ICpzZWMsCisJCQkgIGNvbnN0IHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKTsKIGludCBpc19sb2Nh
bF9zeW0oc3RydWN0IHN5bWJvbCAqc3ltKTsKIAogdm9pZCByZWxhX2luc24oc3RydWN0IHNlY3Rp
b24gKnNlYywgc3RydWN0IHJlbGEgKnJlbGEsIHN0cnVjdCBpbnNuICppbnNuKTsKLS0gCjIuMTYu
NQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4g
MzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
UmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1
bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
