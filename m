Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D10974C0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsI-0001aA-3F; Wed, 21 Aug 2019 08:21:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsF-0001VS-CU
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:43 +0000
X-Inumbo-ID: b4fd1f7e-c3ec-11e9-b95f-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4fd1f7e-c3ec-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 08:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375702; x=1597911702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7aVYeW5cNqin5qJvvkplbDWIdkv5EFumHOM5UQLhOfs=;
 b=hj++1gUrYXJol95EV07D/bztaRUABP7njql56bdhUfm9t/oKWXVHTTtI
 6abDlVAreAfDq1PhuOU8DwwTk0W5ZrYEwdSnrD6JM+0gAFHvRYPMvllMN
 UZr0yaSxiv/EQt5IVDcfHtFu3fT7LZvI07nvVXF9XflKwtRYmApTHgBqB U=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968567"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:21:42 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id D44F5A243C; Wed, 21 Aug 2019 08:21:41 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:27 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:26 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:24 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:48 +0000
Message-ID: <20190821082056.91090-13-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 12/20] create-diff-object: Extend patchability
 verification: STN_UNDEF
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
bWF6b24uY29tPgotLS0KIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgNjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9jcmVhdGUtZGlmZi1vYmplY3QuYyBiL2NyZWF0
ZS1kaWZmLW9iamVjdC5jCmluZGV4IDRlMGYzYmUuLjFjODRmODEgMTAwNjQ0Ci0tLSBhL2NyZWF0
ZS1kaWZmLW9iamVjdC5jCisrKyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCkBAIC0xNTM2LDYgKzE1
MzYsNjEgQEAgc3RhdGljIHZvaWQga3BhdGNoX3ByaW50X2NoYW5nZXMoc3RydWN0IGtwYXRjaF9l
bGYgKmtlbGYpCiAJfQogfQogCitzdGF0aWMgaW5saW5lIGludCBnZXRfc2VjdGlvbl9lbnRyeV9z
aXplKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMsCisJCQkJCSBzdHJ1Y3Qga3BhdGNoX2VsZiAq
a2VsZikKK3sKKwlpbnQgZW50cnlfc2l6ZTsKKworCS8qCisJICogQmFzZSBzZWN0aW9ucyB0eXBp
Y2FsbHkgZG8gbm90IGRlZmluZSBmaXhlZCBzaXplIGVsZW1lbnRzLgorCSAqIERldGVjdCBzZWN0
aW9uJ3MgZWxlbWVudCBzaXplIGluIGNhc2UgaXQncyBhIHNwZWNpYWwgc2VjdGlvbi4KKwkgKiBP
dGhlcndpc2UsIHNraXAgaXQgZHVlIHRvIGFuIHVua25vd24gc2hfZW50c2l6ZS4KKwkgKi8KKwll
bnRyeV9zaXplID0gc2VjLT5zaC5zaF9lbnRzaXplOworCWlmIChlbnRyeV9zaXplID09IDApIHsK
KwkJc3RydWN0IHNwZWNpYWxfc2VjdGlvbiAqc3BlY2lhbDsKKworCQkvKiBGaW5kIHNwZWNpYWwg
c2VjdGlvbiBncm91cF9zaXplLiAqLworCQlmb3IgKHNwZWNpYWwgPSBzcGVjaWFsX3NlY3Rpb25z
OyBzcGVjaWFsLT5uYW1lOyBzcGVjaWFsKyspIHsKKwkJCWlmICghc3RyY21wKHNlYy0+bmFtZSwg
c3BlY2lhbC0+bmFtZSkpCisJCQkJcmV0dXJuIHNwZWNpYWwtPmdyb3VwX3NpemUoa2VsZiwgMCk7
CisJCX0KKyAgICAgICAgfQorCisJcmV0dXJuIGVudHJ5X3NpemU7Cit9CisKK3N0YXRpYyBpbnQg
a3BhdGNoX3NlY3Rpb25faGFzX3VuZGVmX3N5bWJvbHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYs
CisJCQkJCSAgICBjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQoreworCWludCBvZmZzZXQsIGVu
dHJ5X3NpemU7CisJc3RydWN0IHJlbGEgKnJlbGE7CisJc2l6ZV90IGRfc2l6ZTsKKworCWVudHJ5
X3NpemUgPSBnZXRfc2VjdGlvbl9lbnRyeV9zaXplKHNlYywga2VsZik7CisJaWYgKGVudHJ5X3Np
emUgPT0gMCkKKwkJcmV0dXJuIGZhbHNlOworCisJZF9zaXplID0gc2VjLT5iYXNlLT5kYXRhLT5k
X3NpemU7CisJZm9yIChvZmZzZXQgPSAwOyBvZmZzZXQgPCBkX3NpemU7IG9mZnNldCArPSBlbnRy
eV9zaXplKSB7CisJCWxpc3RfZm9yX2VhY2hfZW50cnkocmVsYSwgJnNlYy0+cmVsYXMsIGxpc3Qp
IHsKKwkJCWlmIChyZWxhLT5vZmZzZXQgPCBvZmZzZXQgfHwKKwkJCSAgICByZWxhLT5vZmZzZXQg
Pj0gb2Zmc2V0ICsgZW50cnlfc2l6ZSkgeworCQkJCWNvbnRpbnVlOworCQkJfQorCisJCQlpZiAo
KEdFTEZfUl9TWU0ocmVsYS0+cmVsYS5yX2luZm8pID09IFNUTl9VTkRFRikgfHwKKwkJCSAgICAo
IXJlbGEtPnN5bS0+aW5jbHVkZSAmJiByZWxhLT5zeW0tPnN0YXR1cyA9PSBTQU1FKSkgeworCQkJ
CWxvZ19ub3JtYWwoInNlY3Rpb24gJXMgaGFzIGFuIGVudHJ5IHdpdGggYW4gdW5kZWZpbmVkIHN5
bWJvbDogJXNcbiIsCisJCQkJCSAgIHNlYy0+bmFtZSwgcmVsYS0+c3ltLT5uYW1lID86ICJub25l
Iik7CisJCQkJcmV0dXJuIHRydWU7CisJCQl9CisJCX0KKwl9CisKKwlyZXR1cm4gZmFsc2U7Cit9
CisKIHN0YXRpYyB2b2lkIGtwYXRjaF92ZXJpZnlfcGF0Y2hhYmlsaXR5KHN0cnVjdCBrcGF0Y2hf
ZWxmICprZWxmKQogewogCXN0cnVjdCBzZWN0aW9uICpzZWM7CkBAIC0xNTY4LDYgKzE2MjMsMTcg
QEAgc3RhdGljIHZvaWQga3BhdGNoX3ZlcmlmeV9wYXRjaGFiaWxpdHkoc3RydWN0IGtwYXRjaF9l
bGYgKmtlbGYpCiAJCQkJCWVycnMrKzsKIAkJCQl9CiAJCQl9CisKKwkJCS8qIENoZWNrIGlmIGEg
UkVMQSBzZWN0aW9uIGRvZXMgbm90IGNvbnRhaW4gYW55IGVudHJpZXMgd2l0aAorCQkJICogdW5k
ZWZpbmVkIHN5bWJvbHMgKFNUTl9VTkRFRikuIFRoaXMgc2l0dWF0aW9uIGNhbiBoYXBwZW4KKwkJ
CSAqIHdoZW4gYSBzZWN0aW9uIGlzIGNvcGllZCBvdmVyIGZyb20gaXRzIG9yaWdpbmFsIG9iamVj
dCB0bworCQkJICogYSBwYXRjaGVkIG9iamVjdCwgYnV0IHZhcmlvdXMgc3ltYm9scyByZWxhdGVk
IHRvIHRoZSBzZWN0aW9uCisJCQkgKiBhcmUgbm90IGNvcGllZCBhbG9uZy4KKwkJCSAqLworCQkJ
aWYgKGlzX3JlbGFfc2VjdGlvbihzZWMpKSB7CisJCQkJaWYgKGtwYXRjaF9zZWN0aW9uX2hhc191
bmRlZl9zeW1ib2xzKGtlbGYsIHNlYykpCisJCQkJCWVycnMrKzsKKwkJCX0KIAkJfQogCiAJCS8q
Ci0tIAoyLjE2LjUKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICkty
YXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxv
dHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAy
MzcgODc5CgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
