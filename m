Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89F974BF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsK-0001gG-FY; Wed, 21 Aug 2019 08:21:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsI-0001bs-13
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:46 +0000
X-Inumbo-ID: b5a9e4b6-c3ec-11e9-951b-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5a9e4b6-c3ec-11e9-951b-bc764e2007e4;
 Wed, 21 Aug 2019 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375704; x=1597911704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ene8YEpKFAVTL7TWWZzKcaMBSvzYKt7uNzuNS6Kz18k=;
 b=Ckht7av161pG7AunelFjAtWLkpM+wRh+/muBgv1DGSESnCfovPtIFIwt
 zbKa9cJ6n/kjA9bRcAlWJW07NSIwIk6NdH3fPjE9jCYLej0RXw1lQOrW3
 pzAMB1NbJkjwOlxhonvgQHtKPCPvnDyDwLRGTY46U+2e0ZYz4FNDmZ5qy Y=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="822132900"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Aug 2019 08:21:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id B9759A2447; Wed, 21 Aug 2019 08:21:42 +0000 (UTC)
Received: from EX13D05EUC002.ant.amazon.com (10.43.164.231) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:29 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC002.ant.amazon.com (10.43.164.231) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:28 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:26 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:49 +0000
Message-ID: <20190821082056.91090-14-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 13/20] create-diff-object: Strip all undefined
 entires of known size
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

VGhlIHBhdGNoZWQgRUxGIG9iamVjdCBmaWxlIGNvbnRhaW5zIGFsbCBzZWN0aW9ucyBhbmQgc3lt
Ym9scyBhcwpyZXN1bHRlZCBmcm9tIHRoZSBjb21waWxhdGlvbi4gSG93ZXZlciwgY2VydGFpbiBz
eW1ib2xzIG1heSBub3QgYmUKY29waWVkIG92ZXIgdG8gdGhlIHJlc3VsdGluZyBvYmplY3QgZmls
ZSwgZHVlIHRvIGJlaW5nIHVuY2hhbmdlZCBvcgpub3QgaW5jbHVkZWQgZm9yIG90aGVyIHJlYXNv
bnMuCkluIHN1Y2ggc2l0dWF0aW9uIHRoZSByZXN1bHRpbmcgb2JqZWN0IGZpbGUgaGFzIHRoZSBl
bnRpcmUgc2VjdGlvbnMKY29waWVkIGFsb25nICh3aXRoIGFsbCB0aGVpciBlbnRyaWVzIHVuY2hh
bmdlZCksIHdoaWxlIHNvbWUgb2YgdGhlCmNvcnJlc3BvbmRpbmcgc3ltYm9scyBhcmUgbm90IGNv
cGllZCBhbG9uZyBhdCBhbGwuClRoaXMgbGVhZHMgdG8gaGF2aW5nIGluY29ycmVjdCB1bmRlZmlu
ZWQgKFNUTl9VTkRFRikgZW50cmllcyBpbiB0aGUKZmluYWwgaG90cGF0Y2ggRUxGIGZpbGUuCgpU
aGUgbmV3bHkgYWRkZWQgZnVuY3Rpb24gbGl2ZXBhdGNoX3N0cmlwX3VuZGVmaW5lZF9lbGVtZW50
cygpIGRldGVjdHMKYW5kIHJlbW92ZXMgYWxsIHVuZGVmaW5lZCBSRUxBIGVudHJpZXMgYXMgd2Vs
bCBhcyB0aGVpciBjb3JyZXNwb25kaW5nClBST0dCSVRTIHNlY3Rpb24gZW50cmllcy4KU2luY2Ug
dGhlIHNlY3Rpb25zIG1heSBjb250YWluIGVsZW1lbnRzIG9mIHVua25vd24gc2l6ZSAoc2guc2hf
ZW50c2l6ZQo9PSAwKSwgcGVyZm9ybSB0aGUgc3RyaXAgb25seSBvbiBzZWN0aW9ucyB3aXRoIHdl
bGwgZGVmaW5lZCBlbnRyeQpzaXplcy4KCkFmdGVyIHJlcGxhY2luZyB0aGUgc3RyaXBwZWQgcmVs
YSBsaXN0LCBpdCBpcyBhc3N1bWVkIHRoYXQgdGhlIG5leHQKaW52b2NhdGlvbiBvZiB0aGUga3Bh
dGNoX3JlYnVpbGRfcmVsYV9zZWN0aW9uX2RhdGEoKSB3aWxsIGFkanVzdCBhbGwKc2VjdGlvbiBo
ZWFkZXIgcGFyYW1ldGVycyBhY2NvcmRpbmcgdG8gdGhlIGN1cnJlbnQgc3RhdGUuCgpUaGUgbGl2
ZXBhdGNoX3N0cmlwX3VuZGVmaW5lZF9lbGVtZW50cygpIGlzIGEgc3VwZXJzZXQgb2YgdGhlCmtw
YXRjaF9yZWdlbmVyYXRlX3NwZWNpYWxfc2VjdGlvbigpIGluIGJvdGggc2NvcGUgKGNvdmVycyBh
bGwgUkVMQQpzZWN0aW9ucyBpbnN0ZWFkIG9mIGp1c3Qgc3BlY2lhbCBzZWN0aW9ucykgYW5kIGdy
YW51bGFyaXR5IChjaGVja3MKYWxsIGVudHJpZXMgaW5zdGVhZCBvZiB3aG9sZSBncm91cHMpIG1v
ZHVsbyB0aGUgZW50cmllcyB2YWxpZGl0eQpwcmVkaWNhdGUuClVuaWZ5aW5nIHRoZSBmdW5jdGlv
bnMgcmVzdWx0cyBpbiBhIGNvbXBsaWNhdGVkIGNvZGUsIHdoaWNoIGlzIGhhcmQKdG8gcmVhc29u
IGFib3V0LiBUaHVzLCB0aGUga3BhdGNoX3JlZ2VuZXJhdGVfc3BlY2lhbF9zZWN0aW9uKCkgaXMK
a2VwdCBzZXBhcmF0ZSB3aXRoIGl0cyBvd24gcHJlZGljYXRlIGZvciBzcGVjaWFsIHNlY3Rpb25z
IG9ubHksIGFuZApsaXZlcGF0Y2hfc3RyaXBfdW5kZWZpbmVkX2VsZW1lbnRzKCkgZm9sbG93cyBm
b3IgYWxsIHNlY3Rpb25zIHdpdGgKdGhlIHVuZGVmaW5lZCBzeW1ib2wgZGV0ZWN0aW5nIHByZWRp
Y2F0ZS4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+ClJl
dmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTog
Tm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1J
cmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Ci0tLQogY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMgfCAxMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3Qu
YwppbmRleCAxYzg0ZjgxLi5mMDFmMWRhIDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3Qu
YworKysgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwpAQCAtMTU2MCw2ICsxNTYwLDEzIEBAIHN0YXRp
YyBpbmxpbmUgaW50IGdldF9zZWN0aW9uX2VudHJ5X3NpemUoY29uc3Qgc3RydWN0IHNlY3Rpb24g
KnNlYywKIAlyZXR1cm4gZW50cnlfc2l6ZTsKIH0KIAorLyogQ2hlY2sgaWYgUkVMQSBlbnRyeSBo
YXMgdW5kZWZpbmVkIG9yIHVuY2hhbmdlZC9ub3QtaW5jbHVkZWQgc3ltYm9scy4gKi8KK3N0YXRp
YyBpbmxpbmUgYm9vbCBoYXNfcmVsYV91bmRlZmluZWRfc3ltYm9sKGNvbnN0IHN0cnVjdCByZWxh
ICpyZWxhKQoreworCXJldHVybiAoR0VMRl9SX1NZTShyZWxhLT5yZWxhLnJfaW5mbykgPT0gU1RO
X1VOREVGKSB8fAorCSAgICAgICAoIXJlbGEtPnN5bS0+aW5jbHVkZSAmJiAocmVsYS0+c3ltLT5z
dGF0dXMgPT0gU0FNRSkpOworfQorCiBzdGF0aWMgaW50IGtwYXRjaF9zZWN0aW9uX2hhc191bmRl
Zl9zeW1ib2xzKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLAogCQkJCQkgICAgY29uc3Qgc3RydWN0
IHNlY3Rpb24gKnNlYykKIHsKQEAgLTE1NzksOCArMTU4Niw3IEBAIHN0YXRpYyBpbnQga3BhdGNo
X3NlY3Rpb25faGFzX3VuZGVmX3N5bWJvbHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsCiAJCQkJ
Y29udGludWU7CiAJCQl9CiAKLQkJCWlmICgoR0VMRl9SX1NZTShyZWxhLT5yZWxhLnJfaW5mbykg
PT0gU1ROX1VOREVGKSB8fAotCQkJICAgICghcmVsYS0+c3ltLT5pbmNsdWRlICYmIHJlbGEtPnN5
bS0+c3RhdHVzID09IFNBTUUpKSB7CisJCQlpZiAoaGFzX3JlbGFfdW5kZWZpbmVkX3N5bWJvbChy
ZWxhKSkgewogCQkJCWxvZ19ub3JtYWwoInNlY3Rpb24gJXMgaGFzIGFuIGVudHJ5IHdpdGggYW4g
dW5kZWZpbmVkIHN5bWJvbDogJXNcbiIsCiAJCQkJCSAgIHNlYy0+bmFtZSwgcmVsYS0+c3ltLT5u
YW1lID86ICJub25lIik7CiAJCQkJcmV0dXJuIHRydWU7CkBAIC0xOTk0LDYgKzIwMDAsMTI1IEBA
IHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9jcmVhdGVfcGF0Y2hlc19zZWN0aW9ucyhzdHJ1Y3Qga3Bh
dGNoX2VsZiAqa2VsZiwKIAogfQogCisvKgorICogVGhlIHBhdGNoZWQgRUxGIG9iamVjdCBmaWxl
IGNvbnRhaW5zIGFsbCBzZWN0aW9ucyBhbmQgc3ltYm9scyBhcyByZXN1bHRlZAorICogZnJvbSB0
aGUgY29tcGlsYXRpb24uIEhvd2V2ZXIsIGNlcnRhaW4gc3ltYm9scyBtYXkgbm90IGJlIGNvcGll
ZCBvdmVyIHRvCisgKiB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlLCBkdWUgdG8gYmVpbmcgdW5j
aGFuZ2VkIG9yIG5vdCBpbmNsdWRlZCBmb3Igb3RoZXIKKyAqIHJlYXNvbnMuCisgKiBJbiBzdWNo
IHNpdHVhdGlvbiB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlIGhhcyB0aGUgZW50aXJlIHNlY3Rp
b25zIGNvcGllZAorICogYWxvbmcgKHdpdGggYWxsIHRoZWlyIGVudHJpZXMgdW5jaGFuZ2VkKSwg
d2hpbGUgc29tZSBvZiB0aGUgY29ycmVzcG9uZGluZworICogc3ltYm9scyBhcmUgbm90IGNvcGll
ZCBhbG9uZyBhdCBhbGwuCisgKiBUaGlzIGxlYWRzIHRvIGhhdmluZyBpbmNvcnJlY3QgZHVtbXkg
KFNUTl9VTkRFRikgZW50cmllcyBpbiB0aGUgZmluYWwKKyAqIGhvdHBhdGNoIEVMRiBmaWxlLgor
ICogVGhpcyBmdW5jdGlvbnMgcmVtb3ZlcyBhbGwgdW5kZWZpbmVkIGVudHJpZXMgb2Yga25vd24g
c2l6ZSBmcm9tIGJvdGgKKyAqIFJFTEEgYW5kIFBST0dCSVRTIHNlY3Rpb25zIG9mIHRoZSBwYXRj
aGVkIGVsZiBvYmplY3QuCisgKi8KK3N0YXRpYyB2b2lkIGxpdmVwYXRjaF9zdHJpcF91bmRlZmlu
ZWRfZWxlbWVudHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYpCit7CisJc3RydWN0IHNlY3Rpb24g
KnNlYzsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkoc2VjLCAma2VsZi0+c2VjdGlvbnMsIGxpc3Qp
IHsKKwkJc3RydWN0IHJlbGEgKnJlbGEsICpzYWZlOworCQlpbnQgc3JjX29mZnNldCA9IDAsIGRz
dF9vZmZzZXQgPSAwOworCQlpbnQgZW50cnlfc2l6ZSwgYWxpZ24sIGFsaWduZWRfc2l6ZTsKKwkJ
Y2hhciAqc3JjLCAqZHN0OworCQlMSVNUX0hFQUQobmV3cmVsYXMpOworCisJCS8qIHVzZSBSRUxB
IHNlY3Rpb24gdG8gZmluZCBhbGwgaXRzIHVuZGVmaW5lZCBlbnRyaWVzICovCisJCWlmICghaXNf
cmVsYV9zZWN0aW9uKHNlYykpCisJCQljb250aW51ZTsKKworCQkvKiBvbmx5IGtub3duLCBmaXhl
ZC1zaXplIGVudHJpZXMgY2FuIGJlIHN0cmlwcGVkICovCisJCWVudHJ5X3NpemUgPSBnZXRfc2Vj
dGlvbl9lbnRyeV9zaXplKHNlYy0+YmFzZSwga2VsZik7CisJCWlmIChlbnRyeV9zaXplID09IDAp
CisJCQljb250aW51ZTsKKworCQkvKiBhbGxvYyBidWZmZXIgZm9yIG5ldyBiYXNlIHNlY3Rpb24g
Ki8KKwkJZHN0ID0gbWFsbG9jKHNlYy0+YmFzZS0+c2guc2hfc2l6ZSk7CisJCWlmICghZHN0KQor
CQkJRVJST1IoIm1hbGxvYyIpOworCisJCS8qCisJCSAqIEl0ZXJhdGUgdGhyb3VnaCBhbGwgZW50
cmllcyBvZiBhIGNvcnJlc3BvbmRpbmcgYmFzZSBzZWN0aW9uCisJCSAqIGZvciB0aGlzIFJFTEEg
c2VjdGlvbi4KKwkJICovCisJCWZvciAoIHNyYyA9IHNlYy0+YmFzZS0+ZGF0YS0+ZF9idWY7CisJ
CSAgICAgIHNyY19vZmZzZXQgPCBzZWMtPmJhc2UtPnNoLnNoX3NpemU7CisJCSAgICAgIHNyY19v
ZmZzZXQgKz0gZW50cnlfc2l6ZSApIHsKKwkJCWJvb2wgZm91bmRfdmFsaWQgPSBmYWxzZTsKKwor
CQkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHJlbGEsIHNhZmUsICZzZWMtPnJlbGFzLCBsaXN0
KSB7CisJCQkJLyoKKwkJCQkgKiBDaGVjayBhbGwgUkVMQSBlbGVtZW50cyBsb29raW5nIGZvcgor
CQkJCSAqIGNvcnJlc3BvbmRpbmcgZW50cnkgcmVmZXJlbmNlcy4KKwkJCQkgKi8KKwkJCQlpZiAo
cmVsYS0+b2Zmc2V0IDwgc3JjX29mZnNldCB8fAorCQkJCSAgICByZWxhLT5vZmZzZXQgPj0gc3Jj
X29mZnNldCArIGVudHJ5X3NpemUpIHsKKwkJCQkJY29udGludWU7CisJCQkJfQorCisJCQkJLyoK
KwkJCQkgKiBJZ25vcmUgYWxsIHVuZGVmaW5lZCAoU1ROX1VOREVGKSBvcgorCQkJCSAqIHVuY2hh
bmdlZC9ub3QtaW5jbHVkZWQgZWxlbWVudHMuCisJCQkJICovCisJCQkJaWYgKGhhc19yZWxhX3Vu
ZGVmaW5lZF9zeW1ib2wocmVsYSkpIHsKKwkJCQkJbG9nX25vcm1hbCgiRm91bmQgYSBTVE5fVU5E
RUYgc3ltYm9sICVzIGluIHNlY3Rpb24gJXNcbiIsCisJCQkJCQkgICByZWxhLT5zeW0tPm5hbWUs
IHNlYy0+bmFtZSk7CisJCQkJCWNvbnRpbnVlOworCQkJCX0KKworCQkJCS8qCisJCQkJICogQSBj
b3JyZWN0IG1hdGNoIGhhcyBiZWVuIGZvdW5kLCBzbyBtb3ZlIGl0CisJCQkJICogdG8gYSBuZXcg
bGlzdC4gT3JpZ2luYWwgbGlzdCB3aWxsIGJlIGRlc3Ryb3llZAorCQkJCSAqIGFsb25nIHdpdGgg
dGhlIGVudGlyZSBrZWxmIG9iamVjdCwgc28gdGhlCisJCQkJICogcmVmZXJlbmNlIG11c3QgYmUg
cHJlc2VydmVkLgorCQkJCSAqLworCQkJCWZvdW5kX3ZhbGlkID0gdHJ1ZTsKKwkJCQlsaXN0X2Rl
bCgmcmVsYS0+bGlzdCk7CisJCQkJbGlzdF9hZGRfdGFpbCgmcmVsYS0+bGlzdCwgJm5ld3JlbGFz
KTsKKworCQkJCXJlbGEtPm9mZnNldCAtPSBzcmNfb2Zmc2V0IC0gZHN0X29mZnNldDsKKwkJCQly
ZWxhLT5yZWxhLnJfb2Zmc2V0ID0gcmVsYS0+b2Zmc2V0OworCQkJfQorCisJCQkvKiB0aGVyZSBp
cyBhIHZhbGlkIFJFTEEgZW50cnksIHNvIGNvcHkgY3VycmVudCBlbnRyeSAqLworCQkJaWYgKGZv
dW5kX3ZhbGlkKSB7CisJCQkJLyogY29weSBiYXNlIHNlY3Rpb24gZ3JvdXAgKi8KKwkJCQltZW1j
cHkoZHN0ICsgZHN0X29mZnNldCwgc3JjICsgc3JjX29mZnNldCwgZW50cnlfc2l6ZSk7CisJCQkJ
ZHN0X29mZnNldCArPSBlbnRyeV9zaXplOworCQkJfQorCQl9CisKKwkJLyogdmVyaWZ5IHRoYXQg
ZW50cnlfc2l6ZSBpcyBhIGRpdmlzb3Igb2YgYWxpZ25lZCBzZWN0aW9uIHNpemUgKi8KKwkJYWxp
Z24gPSBzZWMtPmJhc2UtPnNoLnNoX2FkZHJhbGlnbjsKKwkJYWxpZ25lZF9zaXplID0gKChzZWMt
PmJhc2UtPnNoLnNoX3NpemUgKyBhbGlnbiAtIDEpIC8gYWxpZ24pICogYWxpZ247CisJCWlmIChz
cmNfb2Zmc2V0ICE9IGFsaWduZWRfc2l6ZSkgeworCQkJRVJST1IoImdyb3VwIHNpemUgbWlzbWF0
Y2ggZm9yIHNlY3Rpb24gJXNcbiIsCisJCQkgICAgICBzZWMtPmJhc2UtPm5hbWUpOworCQl9CisK
KwkJaWYgKCFkc3Rfb2Zmc2V0KSB7CisJCQkvKiBubyBjaGFuZ2VkIG9yIGdsb2JhbCBmdW5jdGlv
bnMgcmVmZXJlbmNlZCAqLworCQkJc2VjLT5zdGF0dXMgPSBzZWMtPmJhc2UtPnN0YXR1cyA9IFNB
TUU7CisJCQlzZWMtPmluY2x1ZGUgPSBzZWMtPmJhc2UtPmluY2x1ZGUgPSAwOworCQkJZnJlZShk
c3QpOworCQkJY29udGludWU7CisJCX0KKworCQkvKiBvdmVyd3JpdGUgd2l0aCBuZXcgcmVsYXMg
bGlzdCAqLworCQlsaXN0X3JlcGxhY2UoJm5ld3JlbGFzLCAmc2VjLT5yZWxhcyk7CisKKwkJLyoK
KwkJICogVXBkYXRlIHRleHQgc2VjdGlvbiBkYXRhIGJ1ZiBhbmQgc2l6ZS4KKwkJICoKKwkJICog
VGhlIHJlbGEgc2VjdGlvbidzIGRhdGEgYnVmIGFuZCBzaXplIHdpbGwgYmUKKwkJICogcmVnZW5l
cmF0ZWQgaW4ga3BhdGNoX3JlYnVpbGRfcmVsYV9zZWN0aW9uX2RhdGEoKS4KKwkJICovCisJCXNl
Yy0+YmFzZS0+ZGF0YS0+ZF9idWYgPSBkc3Q7CisJCXNlYy0+YmFzZS0+ZGF0YS0+ZF9zaXplID0g
ZHN0X29mZnNldDsKKwl9Cit9CisKIHN0YXRpYyBpbnQgaXNfbnVsbF9zeW0oc3RydWN0IHN5bWJv
bCAqc3ltKQogewogCXJldHVybiAhc3RybGVuKHN5bS0+bmFtZSk7CkBAIC0yMTkwLDYgKzIzMTUs
OCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCiAJbG9nX2RlYnVnKCJQcm9j
ZXNzIHNwZWNpYWwgc2VjdGlvbnNcbiIpOwogCWtwYXRjaF9wcm9jZXNzX3NwZWNpYWxfc2VjdGlv
bnMoa2VsZl9wYXRjaGVkKTsKKwlsb2dfZGVidWcoIlN0cmlwIHVuZGVmaW5lZCBlbGVtZW50cyBv
ZiBrbm93biBzaXplXG4iKTsKKwlsaXZlcGF0Y2hfc3RyaXBfdW5kZWZpbmVkX2VsZW1lbnRzKGtl
bGZfcGF0Y2hlZCk7CiAJbG9nX2RlYnVnKCJWZXJpZnkgcGF0Y2hhYmlsaXR5XG4iKTsKIAlrcGF0
Y2hfdmVyaWZ5X3BhdGNoYWJpbGl0eShrZWxmX3BhdGNoZWQpOwogCi0tIAoyLjE2LjUKCgoKCkFt
YXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3
IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVy
YnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJC
IDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
