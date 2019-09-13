Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0BB2616
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 21:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8rEm-0006mp-JW; Fri, 13 Sep 2019 19:28:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bj/4=XI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8rEl-0006lg-Gi
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 19:28:07 +0000
X-Inumbo-ID: 9c29c5d8-d65c-11e9-a337-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c29c5d8-d65c-11e9-a337-bc764e2007e4;
 Fri, 13 Sep 2019 19:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568402887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2KM4DZBk2g56GnnO52jzfswnVb2YplISytBcxF6k4Yk=;
 b=Ef7fBbqNc9wGCNX6nPy45zYy7/tHPMHx4gZtbE1bWu1tcMgB+IHhOpUO
 TIO3t9xGWx/vC1otvr6IZbZkceuhliOJ9tiaWtNE5WcYgPFRDawj4tY/R
 hMRiWooq1PCe+KA6taz+soPFXb08knwHrTbU4wZcQo9x6WgE9St/xbTdN E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mxHt8pHkZG+7kgqmyH+MTFHzx6DcD8D2yGTLwbCDCsfBsa6OJMdkA7HmPOb8O0IzU5TBrVdYQW
 OENFtUeAw34hihqd6kPml8mJ7OL3gBESInSON9UyVzJphPN6OtE0WvQalbJj5rXWux+wueAU65
 CvxltXPhKdZP94jwovGlstqa2zGdLHtKn84+om6+ghm5rDFBAXGJo/I5jQLdSVjGj4pnIhqD/i
 UVR2j2+/zd+U9sPL0XnRVXx2WnefDDBCU7qDFchk5Euv+3tI6/ju2pcwE1qAFs8+OkP1+/Ohs6
 uf4=
X-SBRS: 2.7
X-MesageID: 5553057
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5553057"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 20:27:51 +0100
Message-ID: <20190913192759.10795-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190913192759.10795-1-andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 02/10] libx86: Proactively initialise error
 pointers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXN1bHRzIGluIGJldHRlciBiZWhhdmlvdXIgZm9yIHRoZSBjYWxsZXIuCgpTdWdnZXN0
ZWQtYnk6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKICogTmV3Ci0tLQogdG9vbHMvdGVzdHMvY3B1LXBvbGlj
eS90ZXN0LWNwdS1wb2xpY3kuYyB8IDQgKystLQogeGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1
aWQuaCAgICAgICAgICB8IDYgKysrLS0tCiB4ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9tc3IuaCAg
ICAgICAgICAgIHwgNCArKy0tCiB4ZW4vbGliL3g4Ni9jcHVpZC5jICAgICAgICAgICAgICAgICAg
ICAgIHwgNSArKysrKwogeGVuL2xpYi94ODYvbXNyLmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDMgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYyBi
L3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVzdC1jcHUtcG9saWN5LmMKaW5kZXggZmUwMGNkNDI3
Ni4uMjAxMzU4ZDIxMCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0LWNw
dS1wb2xpY3kuYworKysgYi90b29scy90ZXN0cy9jcHUtcG9saWN5L3Rlc3QtY3B1LXBvbGljeS5j
CkBAIC0yODMsNyArMjgzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9jcHVpZF9kZXNlcmlhbGlzZV9m
YWlsdXJlKHZvaWQpCiAgICAgZm9yICggc2l6ZV90IGkgPSAwOyBpIDwgQVJSQVlfU0laRSh0ZXN0
cyk7ICsraSApCiAgICAgewogICAgICAgICBjb25zdCBzdHJ1Y3QgdGVzdCAqdCA9ICZ0ZXN0c1tp
XTsKLSAgICAgICAgdWludDMyX3QgZXJyX2xlYWYgPSB+MHUsIGVycl9zdWJsZWFmID0gfjB1Owor
ICAgICAgICB1aW50MzJfdCBlcnJfbGVhZiwgZXJyX3N1YmxlYWY7CiAgICAgICAgIGludCByYzsK
IAogICAgICAgICAvKiBObyB3cml0ZXMgc2hvdWxkIG9jY3VyLiAgVXNlIE5VTEwgdG8gY2F0Y2gg
ZXJyb3JzLiAqLwpAQCAtMzM2LDcgKzMzNiw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfbXNyX2Rlc2Vy
aWFsaXNlX2ZhaWx1cmUodm9pZCkKICAgICBmb3IgKCBzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKHRlc3RzKTsgKytpICkKICAgICB7CiAgICAgICAgIGNvbnN0IHN0cnVjdCB0ZXN0ICp0ID0g
JnRlc3RzW2ldOwotICAgICAgICB1aW50MzJfdCBlcnJfbXNyID0gfjB1OworICAgICAgICB1aW50
MzJfdCBlcnJfbXNyOwogICAgICAgICBpbnQgcmM7CiAKICAgICAgICAgLyogTm8gd3JpdGVzIHNo
b3VsZCBvY2N1ci4gIFVzZSBOVUxMIHRvIGNhdGNoIGVycm9ycy4gKi8KZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmggYi94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9j
cHVpZC5oCmluZGV4IGRmNTk0NmI2YjEuLjc5ODQwZjk5Y2UgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9saWIveDg2L2NwdWlkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1
aWQuaApAQCAtMzc2LDEzICszNzYsMTMgQEAgaW50IHg4Nl9jcHVpZF9jb3B5X3RvX2J1ZmZlcihj
b25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwb2xpY3ksCiAgKiBAcGFyYW0gcG9saWN5ICAgICAg
VGhlIGNwdWlkX3BvbGljeSB0byB1bnNlcmlhbGlzZSBpbnRvLgogICogQHBhcmFtIGxlYXZlcyAg
ICAgIFRoZSBhcnJheSBvZiBsZWF2ZXMgdG8gdW5zZXJpYWxpc2UgZnJvbS4KICAqIEBwYXJhbSBu
cl9lbnRyaWVzICBUaGUgbnVtYmVyIG9mIGVudHJpZXMgaW4gJ2xlYXZlcycuCi0gKiBAcGFyYW0g
ZXJyX2xlYWYgICAgT3B0aW9uYWwgaGludCBmaWxsZWQgb24gZXJyb3IuCi0gKiBAcGFyYW0gZXJy
X3N1YmxlYWYgT3B0aW9uYWwgaGludCBmaWxsZWQgb24gZXJyb3IuCisgKiBAcGFyYW0gZXJyX2xl
YWYgICAgT3B0aW9uYWwgaGludCBmb3IgZXJyb3IgZGlhZ25vc3RpY3MuCisgKiBAcGFyYW0gZXJy
X3N1YmxlYWYgT3B0aW9uYWwgaGludCBmb3IgZXJyb3IgZGlhZ25vc3RpY3MuCiAgKiBAcmV0dXJu
cyAtZXJybm8KICAqCiAgKiBSZWFkcyBhdCBtb3N0IENQVUlEX01BWF9TRVJJQUxJU0VEX0xFQVZF
Uy4gIE1heSByZXR1cm4gLUVSQU5HRSBpZiBhbgogICogaW5jb21pbmcgbGVhZiBpcyBvdXQgb2Yg
cmFuZ2Ugb2YgY3B1aWRfcG9saWN5LCBpbiB3aGljaCBjYXNlIHRoZSBvcHRpb25hbAotICogZXJy
XyogcG9pbnRlcnMgYXJlIGZpbGxlZCB0byBhaWQgZGlhZ25vc3RpY3MuCisgKiBlcnJfKiBwb2lu
dGVycyB3aWxsIGlkZW50aWZ5IHRoZSBvdXQtb2YtcmFuZ2UgaW5kaWNpZXMuCiAgKgogICogTm8g
Y29udGVudCB2YWxpZGF0aW9uIG9mIGluLXJhbmdlIGxlYXZlcyBpcyBwZXJmb3JtZWQuICBTeW50
aGVzaXNlZCBkYXRhIGlzCiAgKiByZWNhbGN1bGF0ZWQuCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vbGliL3g4Ni9tc3IuaCBiL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L21zci5oCmluZGV4
IGU4M2E4ZmJiMGYuLjIwM2M3MTMzMjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIv
eDg2L21zci5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L21zci5oCkBAIC01NCwxNCAr
NTQsMTQgQEAgaW50IHg4Nl9tc3JfY29weV90b19idWZmZXIoY29uc3Qgc3RydWN0IG1zcl9wb2xp
Y3kgKnBvbGljeSwKICAqIEBwYXJhbSBwb2xpY3kgICAgIFRoZSBtc3JfcG9saWN5IG9iamVjdCB0
byB1bnNlcmlhbGlzZSBpbnRvLgogICogQHBhcmFtIG1zcnMgICAgICAgVGhlIGFycmF5IG9mIG1z
cnMgdG8gdW5zZXJpYWxpc2UgZnJvbS4KICAqIEBwYXJhbSBucl9lbnRyaWVzIFRoZSBudW1iZXIg
b2YgZW50cmllcyBpbiAnbXNycycuCi0gKiBAcGFyYW0gZXJyX21zciAgICBPcHRpb25hbCBoaW50
IGZpbGxlZCBvbiBlcnJvci4KKyAqIEBwYXJhbSBlcnJfbXNyICAgIE9wdGlvbmFsIGhpbnQgZm9y
IGVycm9yIGRpYWdub3N0aWNzLgogICogQHJldHVybnMgLWVycm5vCiAgKgogICogUmVhZHMgYXQg
bW9zdCBNU1JfTUFYX1NFUklBTElTRURfRU5UUklFUy4gIE1heSBmYWlsIGZvciBhIG51bWJlciBv
ZiByZWFzb25zCiAgKiBiYXNlZCBvbiB0aGUgY29udGVudCBpbiBhbiBpbmRpdmlkdWFsICdtc3Jz
JyBlbnRyeSwgaW5jbHVkaW5nIHRoZSBNU1IgaW5kZXgKICAqIG5vdCBiZWluZyB2YWxpZCBpbiB0
aGUgcG9saWN5LCB0aGUgZmxhZ3MgZmllbGQgYmVpbmcgbm9uemVybywgb3IgaWYgdGhlCiAgKiB2
YWx1ZSBwcm92aWRlZCB3b3VsZCB0cnVuY2F0ZSB3aGVuIHN0b3JlZCBpbiB0aGUgcG9saWN5LiAg
SW4gc3VjaCBjYXNlcywKLSAqIHRoZSBvcHRpb25hbCBlcnJfKiBwb2ludGVyIGlzIGZpbGxlZCBp
biB0byBhaWQgZGlhZ25vc3RpY3MuCisgKiB0aGUgb3B0aW9uYWwgZXJyXyogcG9pbnRlciB3aWxs
IGlkZW50aWZ5IHRoZSBwcm9ibGVtYXRpYyBNU1IuCiAgKgogICogTm8gY29udGVudCB2YWxpZGF0
aW9uIGlzIHBlcmZvcm1lZCBvbiB0aGUgZGF0YSBzdG9yZWQgaW4gdGhlIHBvbGljeSBvYmplY3Qu
CiAgKi8KZGlmZiAtLWdpdCBhL3hlbi9saWIveDg2L2NwdWlkLmMgYi94ZW4vbGliL3g4Ni9jcHVp
ZC5jCmluZGV4IDI2NjA4NGU2MTMuLjc2Yjg1MTEwMzQgMTAwNjQ0Ci0tLSBhL3hlbi9saWIveDg2
L2NwdWlkLmMKKysrIGIveGVuL2xpYi94ODYvY3B1aWQuYwpAQCAtMzgxLDYgKzM4MSwxMSBAQCBp
bnQgeDg2X2NwdWlkX2NvcHlfZnJvbV9idWZmZXIoc3RydWN0IGNwdWlkX3BvbGljeSAqcCwKICAg
ICB1bnNpZ25lZCBpbnQgaTsKICAgICB4ZW5fY3B1aWRfbGVhZl90IGRhdGE7CiAKKyAgICBpZiAo
IGVycl9sZWFmICkKKyAgICAgICAgKmVycl9sZWFmID0gLTE7CisgICAgaWYgKCBlcnJfc3VibGVh
ZiApCisgICAgICAgICplcnJfc3VibGVhZiA9IC0xOworCiAgICAgLyoKICAgICAgKiBBIHdlbGwg
Zm9ybWVkIGNhbGxlciBpcyBleHBlY3RlZCB0byBwYXNzIGFuIGFycmF5IHdpdGggbGVhdmVzIGlu
IG9yZGVyLAogICAgICAqIGFuZCB3aXRob3V0IGFueSByZXBldGl0aW9ucy4gIEhvd2V2ZXIsIGR1
ZSB0byBwZXItdmVuZG9yIGRpZmZlcmVuY2VzLApkaWZmIC0tZ2l0IGEveGVuL2xpYi94ODYvbXNy
LmMgYi94ZW4vbGliL3g4Ni9tc3IuYwppbmRleCAyNTZiNWVjNjMyLi4xNzFhYmY3MDA4IDEwMDY0
NAotLS0gYS94ZW4vbGliL3g4Ni9tc3IuYworKysgYi94ZW4vbGliL3g4Ni9tc3IuYwpAQCAtNTUs
NiArNTUsOSBAQCBpbnQgeDg2X21zcl9jb3B5X2Zyb21fYnVmZmVyKHN0cnVjdCBtc3JfcG9saWN5
ICpwLAogICAgIHhlbl9tc3JfZW50cnlfdCBkYXRhOwogICAgIGludCByYzsKIAorICAgIGlmICgg
ZXJyX21zciApCisgICAgICAgICplcnJfbXNyID0gLTE7CisKICAgICAvKgogICAgICAqIEEgd2Vs
bCBmb3JtZWQgY2FsbGVyIGlzIGV4cGVjdGVkIHRvIHBhc3MgYW4gYXJyYXkgd2l0aCBlbnRyaWVz
IGluCiAgICAgICogb3JkZXIsIGFuZCB3aXRob3V0IGFueSByZXBldGl0aW9ucy4gIEhvd2V2ZXIs
IGR1ZSB0byBwZXItdmVuZG9yCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
