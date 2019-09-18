Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E4B5E35
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 09:41:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAUVM-0005LZ-KQ; Wed, 18 Sep 2019 07:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YCyf=XN=amazon.de=prvs=1574f1310=wipawel@srs-us1.protection.inumbo.net>)
 id 1iAUVK-0005LU-T8
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 07:35:59 +0000
X-Inumbo-ID: f425aae4-d9e6-11e9-b299-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f425aae4-d9e6-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 07:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568792157; x=1600328157;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=lTJmZlcrzCZECR9cZB5bPN/VI+R4g75oO1zPYrAPLQM=;
 b=WX6vQzpqAdZ7DgShmR+yK7wlfDLt+Tt03MvLk2JtWRSziTgx4Q5amQiM
 LjFmr0aGPNNOWLn1L08c2HOJLwALLFhqD1GF33HtR+hjj0kXpxr5g2sjG
 rzvIdgBJJubw52gmPvo2raQIB5NwxJ3l7adWeuAiK5cIzgHlFr2sKIpsQ Q=;
X-IronPort-AV: E=Sophos;i="5.64,519,1559520000"; d="scan'208";a="833753052"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 18 Sep 2019 07:35:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id AA1D5A0830; Wed, 18 Sep 2019 07:35:53 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 07:35:53 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 07:35:52 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 18 Sep 2019 07:35:50 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Sep 2019 07:35:38 +0000
Message-ID: <20190918073538.24707-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBuZWVkZWQgZm9yIG1vcmUgcHJlY2lzZSBwYXRjaGFiaWxpdHkgdmVyaWZpY2F0aW9u
LgpPbmx5IG5vbi1zcGVjaWFsIC5yb2RhdGEgc2VjdGlvbnMgc2hvdWxkIGJlIHN1YmplY3QKZm9y
IHN1Y2ggYSBub24tcmVmZXJlbmNlZCBjaGVjayBpbiBrcGF0Y2hfdmVyaWZ5X3BhdGNoYWJpbGl0
eSgpLgpDdXJyZW50IGNoZWNrIChub24tc3RhbmRhcmQsIG5vbi1yZWxhLCBub24tZGVidWcpIGlz
IHRvbyB3ZWFrIGFuZAphbGxvd3MgYWxzbyBub24tcm9kYXRhIHNlY3Rpb25zIHdpdGhvdXQgcmVm
ZXJlbmNlZCBzeW1ib2xzIHRvIHNsaXAKdGhyb3VnaC4KCkRldGVjdCAucm9kYXRhIHNlY3Rpb24g
YnkgY2hlY2tpbmcgc2VjdGlvbidzIHR5cGUgKFNIVF9QUk9HQklUUyksCmZsYWdzIChubyBleGVj
LCBubyB3cml0ZSkgYW5kIGZpbmFsbHkgbmFtZSBwcmVmaXguCgpTaWduZWQtb2ZmLWJ5OiBQYXdl
bCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1J
cmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4g
RG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxu
bWFudGhleUBhbWF6b24uZGU+Ci0tLQogY29tbW9uLmMgICAgICAgICAgICAgfCAgNyArKysrKysr
CiBjb21tb24uaCAgICAgICAgICAgICB8ICAxICsKIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgMTMg
KysrKysrLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbW1vbi5jIGIvY29tbW9uLmMKaW5kZXggMGRkYzlmYS4u
OGY1NTNlYSAxMDA2NDQKLS0tIGEvY29tbW9uLmMKKysrIGIvY29tbW9uLmMKQEAgLTI0OSw2ICsy
NDksMTMgQEAgaW50IGlzX3RleHRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKQogCQkoc2Vj
LT5zaC5zaF9mbGFncyAmIFNIRl9FWEVDSU5TVFIpKTsKIH0KIAoraW50IGlzX3JvZGF0YV9zZWN0
aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCit7CisJcmV0dXJuIHNlYy0+c2guc2hfdHlwZSA9PSBT
SFRfUFJPR0JJVFMgJiYKKwkgICAgICAgIShzZWMtPnNoLnNoX2ZsYWdzICYgKFNIRl9FWEVDSU5T
VFIgfCBTSEZfV1JJVEUpKSAmJgorCSAgICAgICAhc3RybmNtcChzZWMtPm5hbWUsICIucm9kYXRh
IiwgNyk7Cit9CisKIGludCBpc19kZWJ1Z19zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCiB7
CiAJY2hhciAqbmFtZTsKZGlmZiAtLWdpdCBhL2NvbW1vbi5oIGIvY29tbW9uLmgKaW5kZXggN2M2
ZmI3My4uYjY0ODlkYiAxMDA2NDQKLS0tIGEvY29tbW9uLmgKKysrIGIvY29tbW9uLmgKQEAgLTE1
OSw2ICsxNTksNyBAQCBzdHJ1Y3Qgc3ltYm9sICpmaW5kX3N5bWJvbF9ieV9pbmRleChzdHJ1Y3Qg
bGlzdF9oZWFkICpsaXN0LCBzaXplX3QgaW5kZXgpOwogc3RydWN0IHN5bWJvbCAqZmluZF9zeW1i
b2xfYnlfbmFtZShzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0LCBjb25zdCBjaGFyICpuYW1lKTsKIAog
aW50IGlzX3RleHRfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKK2ludCBpc19yb2RhdGFf
c2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2VjKTsKIGludCBpc19kZWJ1Z19zZWN0aW9uKHN0cnVj
dCBzZWN0aW9uICpzZWMpOwogaW50IGlzX3JlbGFfc2VjdGlvbihzdHJ1Y3Qgc2VjdGlvbiAqc2Vj
KTsKIGludCBpc19zdGFuZGFyZF9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpOwpkaWZmIC0t
Z2l0IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCBl
NDU5MmE2Li4yZjBlMTYyIDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9j
cmVhdGUtZGlmZi1vYmplY3QuYwpAQCAtMTY3MiwxMyArMTY3MiwxMiBAQCBzdGF0aWMgdm9pZCBr
cGF0Y2hfdmVyaWZ5X3BhdGNoYWJpbGl0eShzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZikKIAkJfQog
CiAJCWlmIChzZWMtPmluY2x1ZGUpIHsKLQkJCWlmICghaXNfc3RhbmRhcmRfc2VjdGlvbihzZWMp
ICYmICFpc19yZWxhX3NlY3Rpb24oc2VjKSAmJgotCQkJICAgICFpc19kZWJ1Z19zZWN0aW9uKHNl
YykgJiYgIWlzX3NwZWNpYWxfc2VjdGlvbihzZWMpKSB7Ci0JCQkJaWYgKCFpc19yZWZlcmVuY2Vk
X3NlY3Rpb24oc2VjLCBrZWxmKSkgewotCQkJCQlsb2dfbm9ybWFsKCJzZWN0aW9uICVzIGluY2x1
ZGVkLCBidXQgbm90IHJlZmVyZW5jZWRcbiIsCi0JCQkJCQkgICBzZWMtPm5hbWUpOwotCQkJCQll
cnJzKys7Ci0JCQkJfQorCQkJaWYgKGlzX3JvZGF0YV9zZWN0aW9uKHNlYykgJiYKKwkJCSAgICAh
aXNfc3BlY2lhbF9zZWN0aW9uKHNlYykgJiYKKwkJCSAgICAhaXNfcmVmZXJlbmNlZF9zZWN0aW9u
KHNlYywga2VsZikpIHsKKwkJCQlsb2dfbm9ybWFsKCIucm9kYXRhIHNlY3Rpb24gJXMgaW5jbHVk
ZWQsIGJ1dCBub3QgcmVmZXJlbmNlZFxuIiwKKwkJCQkJICAgc2VjLT5uYW1lKTsKKwkJCQllcnJz
Kys7CiAJCQl9CiAKIAkJCS8qIENoZWNrIGlmIGEgUkVMQSBzZWN0aW9uIGRvZXMgbm90IGNvbnRh
aW4gYW55IGVudHJpZXMgd2l0aAotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1
ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJs
aW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
