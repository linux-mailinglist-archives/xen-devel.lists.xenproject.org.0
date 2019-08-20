Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5952F95DAB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 13:45:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i02Xr-0002rW-Ey; Tue, 20 Aug 2019 11:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xv/m=WQ=amazon.de=prvs=128763efb=wipawel@srs-us1.protection.inumbo.net>)
 id 1i02Xp-0002qy-Om
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 11:43:21 +0000
X-Inumbo-ID: b5f4a346-c33f-11e9-b90c-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5f4a346-c33f-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566301401; x=1597837401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=GHZTOYRG1SwCtEYp/gLLJOZxpDmLHyVNXu82ygiiyac=;
 b=oEA2P0QA4qIOfGSul9oF9x7kwi6ES2dzL+EKXaQyo67fLuvPvOnnmrVY
 HvNDfRe24wmYmJwK8s14tSDd2DzndrAIKcFiziB3RiL1/jscrslaG9Fu8
 eUD8Dv+yEJ7uptCll9NHjvNnX1Io10XthHWevAoJFMmlpgz+kta934SX0 0=;
X-IronPort-AV: E=Sophos;i="5.64,408,1559520000"; d="scan'208";a="747563638"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 20 Aug 2019 11:43:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 432BAA2668; Tue, 20 Aug 2019 11:43:20 +0000 (UTC)
Received: from EX13D03EUA001.ant.amazon.com (10.43.165.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 11:43:19 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D03EUA001.ant.amazon.com (10.43.165.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 20 Aug 2019 11:43:18 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 20 Aug 2019 11:43:17 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Tue, 20 Aug 2019 11:43:07 +0000
Message-ID: <20190820114307.68018-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190808124831.10094-1-wipawel@amazon.de>
References: <20190808124831.10094-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part3 v3 2/3]
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
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com, wipawel@amazon.de,
 konrad.wilk@oracle.com
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
bWF6b24uY29tPgotLS0KdjM6CiogRml4ZWQgZm9yKCkgbG9vcCBzdHlsZQoqIENoYW5nZWQgY29t
bWVudCBhY2NvcmRpbmcgdG8gUm9zcycgcmVjb21tZW5kYXRpb24uCnYyOgoqIFJlZmFjdG9yZWQg
Y29kZSBieSBjcmVhdGluZyBhIG5ldyBmdW5jdGlvbiBrcGF0Y2hfc2VjdGlvbl9oYXNfdW5kZWZf
c3ltYm9scygpCiBmb3IgdGhlIGNvbXBsaWNhdGVkIG11bHRpLWxvb3AgY29kZSBvZiBrcGF0Y2hf
dmVyaWZ5X3BhdGNoYWJpbGl0eSgpLgogSG9wZWZ1bGx5IHRoaXMgbWFrZXMgY29kZSBtb3JlIHJl
YWRhYmxlIGFuZCBlYXNpZXIgdG8gbWFpbnRhaW4uCiogS2VwdCBsaW5lcyBsaW1pdHMgdG8gODAg
Y2hhcnMgKHdoZXJlZXZlciBwb3NzaWJsZSkKKiBEZXRlY3Rpb24gb2YgYW4gdW5kZWZpbmVkIHN5
bWJvbCBjb3VudHMgYXMgYSBzaW5nbGUgZXJyb3IKLS0tCiBjcmVhdGUtZGlmZi1vYmplY3QuYyB8
IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRp
ZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCA4ZWRkOTNiLi4zM2NmYTk1
IDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1vYmpl
Y3QuYwpAQCAtMTUzMCw2ICsxNTMwLDYxIEBAIHN0YXRpYyB2b2lkIGtwYXRjaF9wcmludF9jaGFu
Z2VzKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQogCX0KIH0KIAorc3RhdGljIGlubGluZSBpbnQg
Z2V0X3NlY3Rpb25fZW50cnlfc2l6ZShjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqc2VjLAorCQkJCQkg
c3RydWN0IGtwYXRjaF9lbGYgKmtlbGYpCit7CisJaW50IGVudHJ5X3NpemU7CisKKwkvKgorCSAq
IEJhc2Ugc2VjdGlvbnMgdHlwaWNhbGx5IGRvIG5vdCBkZWZpbmUgZml4ZWQgc2l6ZSBlbGVtZW50
cy4KKwkgKiBEZXRlY3Qgc2VjdGlvbidzIGVsZW1lbnQgc2l6ZSBpbiBjYXNlIGl0J3MgYSBzcGVj
aWFsIHNlY3Rpb24uCisJICogT3RoZXJ3aXNlLCBza2lwIGl0IGR1ZSB0byBhbiB1bmtub3duIHNo
X2VudHNpemUuCisJICovCisJZW50cnlfc2l6ZSA9IHNlYy0+c2guc2hfZW50c2l6ZTsKKwlpZiAo
ZW50cnlfc2l6ZSA9PSAwKSB7CisJCXN0cnVjdCBzcGVjaWFsX3NlY3Rpb24gKnNwZWNpYWw7CisK
KwkJLyogRmluZCBzcGVjaWFsIHNlY3Rpb24gZ3JvdXBfc2l6ZS4gKi8KKwkJZm9yIChzcGVjaWFs
ID0gc3BlY2lhbF9zZWN0aW9uczsgc3BlY2lhbC0+bmFtZTsgc3BlY2lhbCsrKSB7CisJCQlpZiAo
IXN0cmNtcChzZWMtPm5hbWUsIHNwZWNpYWwtPm5hbWUpKQorCQkJCXJldHVybiBzcGVjaWFsLT5n
cm91cF9zaXplKGtlbGYsIDApOworCQl9CisgICAgICAgIH0KKworCXJldHVybiBlbnRyeV9zaXpl
OworfQorCitzdGF0aWMgaW50IGtwYXRjaF9zZWN0aW9uX2hhc191bmRlZl9zeW1ib2xzKHN0cnVj
dCBrcGF0Y2hfZWxmICprZWxmLAorCQkJCQkgICAgY29uc3Qgc3RydWN0IHNlY3Rpb24gKnNlYykK
K3sKKwlpbnQgb2Zmc2V0LCBlbnRyeV9zaXplOworCXN0cnVjdCByZWxhICpyZWxhOworCXNpemVf
dCBkX3NpemU7CisKKwllbnRyeV9zaXplID0gZ2V0X3NlY3Rpb25fZW50cnlfc2l6ZShzZWMsIGtl
bGYpOworCWlmIChlbnRyeV9zaXplID09IDApCisJCXJldHVybiBmYWxzZTsKKworCWRfc2l6ZSA9
IHNlYy0+YmFzZS0+ZGF0YS0+ZF9zaXplOworCWZvciAob2Zmc2V0ID0gMDsgb2Zmc2V0IDwgZF9z
aXplOyBvZmZzZXQgKz0gZW50cnlfc2l6ZSkgeworCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KHJlbGEs
ICZzZWMtPnJlbGFzLCBsaXN0KSB7CisJCQlpZiAocmVsYS0+b2Zmc2V0IDwgb2Zmc2V0IHx8CisJ
CQkgICAgcmVsYS0+b2Zmc2V0ID49IG9mZnNldCArIGVudHJ5X3NpemUpIHsKKwkJCQljb250aW51
ZTsKKwkJCX0KKworCQkJaWYgKChHRUxGX1JfU1lNKHJlbGEtPnJlbGEucl9pbmZvKSA9PSBTVE5f
VU5ERUYpIHx8CisJCQkgICAgKCFyZWxhLT5zeW0tPmluY2x1ZGUgJiYgcmVsYS0+c3ltLT5zdGF0
dXMgPT0gU0FNRSkpIHsKKwkJCQlsb2dfbm9ybWFsKCJzZWN0aW9uICVzIGhhcyBhbiBlbnRyeSB3
aXRoIGFuIHVuZGVmaW5lZCBzeW1ib2w6ICVzXG4iLAorCQkJCQkgICBzZWMtPm5hbWUsIHJlbGEt
PnN5bS0+bmFtZSA/OiAibm9uZSIpOworCQkJCXJldHVybiB0cnVlOworCQkJfQorCQl9CisJfQor
CisJcmV0dXJuIGZhbHNlOworfQorCiBzdGF0aWMgdm9pZCBrcGF0Y2hfdmVyaWZ5X3BhdGNoYWJp
bGl0eShzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIHsKIAlzdHJ1Y3Qgc2VjdGlvbiAqc2VjOwpA
QCAtMTU2Miw2ICsxNjE3LDE3IEBAIHN0YXRpYyB2b2lkIGtwYXRjaF92ZXJpZnlfcGF0Y2hhYmls
aXR5KHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQogCQkJCQllcnJzKys7CiAJCQkJfQogCQkJfQor
CisJCQkvKiBDaGVjayBpZiBhIFJFTEEgc2VjdGlvbiBkb2VzIG5vdCBjb250YWluIGFueSBlbnRy
aWVzIHdpdGgKKwkJCSAqIHVuZGVmaW5lZCBzeW1ib2xzIChTVE5fVU5ERUYpLiBUaGlzIHNpdHVh
dGlvbiBjYW4gaGFwcGVuCisJCQkgKiB3aGVuIGEgc2VjdGlvbiBpcyBjb3BpZWQgb3ZlciBmcm9t
IGl0cyBvcmlnaW5hbCBvYmplY3QgdG8KKwkJCSAqIGEgcGF0Y2hlZCBvYmplY3QsIGJ1dCB2YXJp
b3VzIHN5bWJvbHMgcmVsYXRlZCB0byB0aGUgc2VjdGlvbgorCQkJICogYXJlIG5vdCBjb3BpZWQg
YWxvbmcuCisJCQkgKi8KKwkJCWlmIChpc19yZWxhX3NlY3Rpb24oc2VjKSkgeworCQkJCWlmIChr
cGF0Y2hfc2VjdGlvbl9oYXNfdW5kZWZfc3ltYm9scyhrZWxmLCBzZWMpKQorCQkJCQllcnJzKys7
CisJCQl9CiAJCX0KIAogCQkvKgotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1
ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJs
aW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
