Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6FEB14A1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 20:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8UGB-00036A-MC; Thu, 12 Sep 2019 18:56:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8UG9-00034p-Pm
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 18:56:01 +0000
X-Inumbo-ID: f6465aaa-d58e-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6465aaa-d58e-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 18:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568314561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VXhTF/AM4h7nMLziZQXRr8jU37dX02II11U8ivOUCQc=;
 b=TP2Nvf6JwtPLAugr9eD6NW3S4HzOrGX8Og9+CM+F0UQI2uBGjVQmspdR
 1yF1v1b+tzmPUX27XP1PoKEli2qOw2ovjqDlLF6jHasz9grMkEmkKuHGb
 cMyz5dEK4wFjmYvRyD09lN5E6CLhEbhN7eZuYJb8KRaJaFW/12pOW83lh I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k1T2AQqxd7aQxzYjlWN6jW3yz/XIkERzV0DdplUlur8RTZegbTjyE5qLBrBoFVdVizGHUUcIUF
 eekj3xQZUIbUcFtwS85G+mq/i+eaSbxzz0FDFzM6Wdk+rKFz+K1gRlHjO2SDIhZchmVcxeNPWF
 wiBV1LhCTmRVE4/1SRl2+r2hCquQEQKFhF8ITYTH+LvIu2ID5F+kQz3XA6YgJWI5zzsG2BQg8v
 9+ksIQdWCZpVG03NFnLNREpLQ05l6mfll//JLng6+RLqHRQEx+Goa1ajbC7GYXNydVH7wM4Mm4
 0Ok=
X-SBRS: 2.7
X-MesageID: 5557408
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,498,1559534400"; 
   d="scan'208";a="5557408"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 19:55:56 +0100
Message-ID: <20190912185556.22173-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190911200504.5693-1-andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0.5/8] libx86: Proactively initialise error
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
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKICogTmV3Ci0tLQogdG9vbHMv
dGVzdHMvY3B1LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYyB8IDQgKystLQogeGVuL2luY2x1ZGUv
eGVuL2xpYi94ODYvY3B1aWQuaCAgICAgICAgICB8IDYgKysrLS0tCiB4ZW4vaW5jbHVkZS94ZW4v
bGliL3g4Ni9tc3IuaCAgICAgICAgICAgIHwgNCArKy0tCiB4ZW4vbGliL3g4Ni9jcHVpZC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgNSArKysrKwogeGVuL2xpYi94ODYvbXNyLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8IDMgKysrCiA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdHMvY3B1LXBvbGljeS90ZXN0
LWNwdS1wb2xpY3kuYyBiL3Rvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvdGVzdC1jcHUtcG9saWN5LmMK
aW5kZXggZmUwMGNkNDI3Ni4uMjAxMzU4ZDIxMCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdHMvY3B1
LXBvbGljeS90ZXN0LWNwdS1wb2xpY3kuYworKysgYi90b29scy90ZXN0cy9jcHUtcG9saWN5L3Rl
c3QtY3B1LXBvbGljeS5jCkBAIC0yODMsNyArMjgzLDcgQEAgc3RhdGljIHZvaWQgdGVzdF9jcHVp
ZF9kZXNlcmlhbGlzZV9mYWlsdXJlKHZvaWQpCiAgICAgZm9yICggc2l6ZV90IGkgPSAwOyBpIDwg
QVJSQVlfU0laRSh0ZXN0cyk7ICsraSApCiAgICAgewogICAgICAgICBjb25zdCBzdHJ1Y3QgdGVz
dCAqdCA9ICZ0ZXN0c1tpXTsKLSAgICAgICAgdWludDMyX3QgZXJyX2xlYWYgPSB+MHUsIGVycl9z
dWJsZWFmID0gfjB1OworICAgICAgICB1aW50MzJfdCBlcnJfbGVhZiwgZXJyX3N1YmxlYWY7CiAg
ICAgICAgIGludCByYzsKIAogICAgICAgICAvKiBObyB3cml0ZXMgc2hvdWxkIG9jY3VyLiAgVXNl
IE5VTEwgdG8gY2F0Y2ggZXJyb3JzLiAqLwpAQCAtMzM2LDcgKzMzNiw3IEBAIHN0YXRpYyB2b2lk
IHRlc3RfbXNyX2Rlc2VyaWFsaXNlX2ZhaWx1cmUodm9pZCkKICAgICBmb3IgKCBzaXplX3QgaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKHRlc3RzKTsgKytpICkKICAgICB7CiAgICAgICAgIGNvbnN0IHN0
cnVjdCB0ZXN0ICp0ID0gJnRlc3RzW2ldOwotICAgICAgICB1aW50MzJfdCBlcnJfbXNyID0gfjB1
OworICAgICAgICB1aW50MzJfdCBlcnJfbXNyOwogICAgICAgICBpbnQgcmM7CiAKICAgICAgICAg
LyogTm8gd3JpdGVzIHNob3VsZCBvY2N1ci4gIFVzZSBOVUxMIHRvIGNhdGNoIGVycm9ycy4gKi8K
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmggYi94ZW4vaW5jbHVk
ZS94ZW4vbGliL3g4Ni9jcHVpZC5oCmluZGV4IGRmNTk0NmI2YjEuLjc5ODQwZjk5Y2UgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL2xpYi94ODYvY3B1aWQuaApAQCAtMzc2LDEzICszNzYsMTMgQEAgaW50IHg4Nl9jcHVpZF9j
b3B5X3RvX2J1ZmZlcihjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwb2xpY3ksCiAgKiBAcGFy
YW0gcG9saWN5ICAgICAgVGhlIGNwdWlkX3BvbGljeSB0byB1bnNlcmlhbGlzZSBpbnRvLgogICog
QHBhcmFtIGxlYXZlcyAgICAgIFRoZSBhcnJheSBvZiBsZWF2ZXMgdG8gdW5zZXJpYWxpc2UgZnJv
bS4KICAqIEBwYXJhbSBucl9lbnRyaWVzICBUaGUgbnVtYmVyIG9mIGVudHJpZXMgaW4gJ2xlYXZl
cycuCi0gKiBAcGFyYW0gZXJyX2xlYWYgICAgT3B0aW9uYWwgaGludCBmaWxsZWQgb24gZXJyb3Iu
Ci0gKiBAcGFyYW0gZXJyX3N1YmxlYWYgT3B0aW9uYWwgaGludCBmaWxsZWQgb24gZXJyb3IuCisg
KiBAcGFyYW0gZXJyX2xlYWYgICAgT3B0aW9uYWwgaGludCBmb3IgZXJyb3IgZGlhZ25vc3RpY3Mu
CisgKiBAcGFyYW0gZXJyX3N1YmxlYWYgT3B0aW9uYWwgaGludCBmb3IgZXJyb3IgZGlhZ25vc3Rp
Y3MuCiAgKiBAcmV0dXJucyAtZXJybm8KICAqCiAgKiBSZWFkcyBhdCBtb3N0IENQVUlEX01BWF9T
RVJJQUxJU0VEX0xFQVZFUy4gIE1heSByZXR1cm4gLUVSQU5HRSBpZiBhbgogICogaW5jb21pbmcg
bGVhZiBpcyBvdXQgb2YgcmFuZ2Ugb2YgY3B1aWRfcG9saWN5LCBpbiB3aGljaCBjYXNlIHRoZSBv
cHRpb25hbAotICogZXJyXyogcG9pbnRlcnMgYXJlIGZpbGxlZCB0byBhaWQgZGlhZ25vc3RpY3Mu
CisgKiBlcnJfKiBwb2ludGVycyB3aWxsIGlkZW50aWZ5IHRoZSBvdXQtb2YtcmFuZ2UgaW5kaWNp
ZXMuCiAgKgogICogTm8gY29udGVudCB2YWxpZGF0aW9uIG9mIGluLXJhbmdlIGxlYXZlcyBpcyBw
ZXJmb3JtZWQuICBTeW50aGVzaXNlZCBkYXRhIGlzCiAgKiByZWNhbGN1bGF0ZWQuCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9tc3IuaCBiL3hlbi9pbmNsdWRlL3hlbi9saWIv
eDg2L21zci5oCmluZGV4IGU4M2E4ZmJiMGYuLjIwM2M3MTMzMjAgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL3hlbi9saWIveDg2L21zci5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L21z
ci5oCkBAIC01NCwxNCArNTQsMTQgQEAgaW50IHg4Nl9tc3JfY29weV90b19idWZmZXIoY29uc3Qg
c3RydWN0IG1zcl9wb2xpY3kgKnBvbGljeSwKICAqIEBwYXJhbSBwb2xpY3kgICAgIFRoZSBtc3Jf
cG9saWN5IG9iamVjdCB0byB1bnNlcmlhbGlzZSBpbnRvLgogICogQHBhcmFtIG1zcnMgICAgICAg
VGhlIGFycmF5IG9mIG1zcnMgdG8gdW5zZXJpYWxpc2UgZnJvbS4KICAqIEBwYXJhbSBucl9lbnRy
aWVzIFRoZSBudW1iZXIgb2YgZW50cmllcyBpbiAnbXNycycuCi0gKiBAcGFyYW0gZXJyX21zciAg
ICBPcHRpb25hbCBoaW50IGZpbGxlZCBvbiBlcnJvci4KKyAqIEBwYXJhbSBlcnJfbXNyICAgIE9w
dGlvbmFsIGhpbnQgZm9yIGVycm9yIGRpYWdub3N0aWNzLgogICogQHJldHVybnMgLWVycm5vCiAg
KgogICogUmVhZHMgYXQgbW9zdCBNU1JfTUFYX1NFUklBTElTRURfRU5UUklFUy4gIE1heSBmYWls
IGZvciBhIG51bWJlciBvZiByZWFzb25zCiAgKiBiYXNlZCBvbiB0aGUgY29udGVudCBpbiBhbiBp
bmRpdmlkdWFsICdtc3JzJyBlbnRyeSwgaW5jbHVkaW5nIHRoZSBNU1IgaW5kZXgKICAqIG5vdCBi
ZWluZyB2YWxpZCBpbiB0aGUgcG9saWN5LCB0aGUgZmxhZ3MgZmllbGQgYmVpbmcgbm9uemVybywg
b3IgaWYgdGhlCiAgKiB2YWx1ZSBwcm92aWRlZCB3b3VsZCB0cnVuY2F0ZSB3aGVuIHN0b3JlZCBp
biB0aGUgcG9saWN5LiAgSW4gc3VjaCBjYXNlcywKLSAqIHRoZSBvcHRpb25hbCBlcnJfKiBwb2lu
dGVyIGlzIGZpbGxlZCBpbiB0byBhaWQgZGlhZ25vc3RpY3MuCisgKiB0aGUgb3B0aW9uYWwgZXJy
XyogcG9pbnRlciB3aWxsIGlkZW50aWZ5IHRoZSBwcm9ibGVtYXRpYyBNU1IuCiAgKgogICogTm8g
Y29udGVudCB2YWxpZGF0aW9uIGlzIHBlcmZvcm1lZCBvbiB0aGUgZGF0YSBzdG9yZWQgaW4gdGhl
IHBvbGljeSBvYmplY3QuCiAgKi8KZGlmZiAtLWdpdCBhL3hlbi9saWIveDg2L2NwdWlkLmMgYi94
ZW4vbGliL3g4Ni9jcHVpZC5jCmluZGV4IDI2NjA4NGU2MTMuLjc2Yjg1MTEwMzQgMTAwNjQ0Ci0t
LSBhL3hlbi9saWIveDg2L2NwdWlkLmMKKysrIGIveGVuL2xpYi94ODYvY3B1aWQuYwpAQCAtMzgx
LDYgKzM4MSwxMSBAQCBpbnQgeDg2X2NwdWlkX2NvcHlfZnJvbV9idWZmZXIoc3RydWN0IGNwdWlk
X3BvbGljeSAqcCwKICAgICB1bnNpZ25lZCBpbnQgaTsKICAgICB4ZW5fY3B1aWRfbGVhZl90IGRh
dGE7CiAKKyAgICBpZiAoIGVycl9sZWFmICkKKyAgICAgICAgKmVycl9sZWFmID0gLTE7CisgICAg
aWYgKCBlcnJfc3VibGVhZiApCisgICAgICAgICplcnJfc3VibGVhZiA9IC0xOworCiAgICAgLyoK
ICAgICAgKiBBIHdlbGwgZm9ybWVkIGNhbGxlciBpcyBleHBlY3RlZCB0byBwYXNzIGFuIGFycmF5
IHdpdGggbGVhdmVzIGluIG9yZGVyLAogICAgICAqIGFuZCB3aXRob3V0IGFueSByZXBldGl0aW9u
cy4gIEhvd2V2ZXIsIGR1ZSB0byBwZXItdmVuZG9yIGRpZmZlcmVuY2VzLApkaWZmIC0tZ2l0IGEv
eGVuL2xpYi94ODYvbXNyLmMgYi94ZW4vbGliL3g4Ni9tc3IuYwppbmRleCAyNTZiNWVjNjMyLi4x
NzFhYmY3MDA4IDEwMDY0NAotLS0gYS94ZW4vbGliL3g4Ni9tc3IuYworKysgYi94ZW4vbGliL3g4
Ni9tc3IuYwpAQCAtNTUsNiArNTUsOSBAQCBpbnQgeDg2X21zcl9jb3B5X2Zyb21fYnVmZmVyKHN0
cnVjdCBtc3JfcG9saWN5ICpwLAogICAgIHhlbl9tc3JfZW50cnlfdCBkYXRhOwogICAgIGludCBy
YzsKIAorICAgIGlmICggZXJyX21zciApCisgICAgICAgICplcnJfbXNyID0gLTE7CisKICAgICAv
KgogICAgICAqIEEgd2VsbCBmb3JtZWQgY2FsbGVyIGlzIGV4cGVjdGVkIHRvIHBhc3MgYW4gYXJy
YXkgd2l0aCBlbnRyaWVzIGluCiAgICAgICogb3JkZXIsIGFuZCB3aXRob3V0IGFueSByZXBldGl0
aW9ucy4gIEhvd2V2ZXIsIGR1ZSB0byBwZXItdmVuZG9yCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
