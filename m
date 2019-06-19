Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BE4C22B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 22:15:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdgvk-0002hT-Sr; Wed, 19 Jun 2019 20:11:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdgvj-0002hL-Ke
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 20:11:39 +0000
X-Inumbo-ID: 71caa132-92ce-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 71caa132-92ce-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 20:11:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VXzA7aOTz80s8bo+Rql/Et+wTjDPiMWoFt+2Z7ic71YvYxDms1vmkqvDHoJLTXX3BJqnOshr4/
 5JkliV6D2mDehWUFhZbR7/QFhQdCUW6CY5p4mPYbWDkDnzwRZWamBno+Ic5SpI1BsRHz4sayoE
 onGTMBtRRRuMr8U3Hy7dQLFGag0mAOLbCBxRt3RLtv7qFHoHlofdDSPHwBjaYdRNC0LV90pncs
 x0ccGX1g3wZDeZTxlc3iCPOBKSioUe129WZN1I1W4f4fF1tHpS+Ix1mwXaN9tGrn0iYF8Wj6Hj
 /EE=
X-SBRS: 2.7
X-MesageID: 1968182
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,394,1557201600"; 
   d="scan'208";a="1968182"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 21:11:26 +0100
Message-ID: <1560975087-25632-4-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] xen/link: Fold .data.read_mostly into .data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LmRhdGEucmVhZF9tb3N0bHkgb25seSBuZWVkcyBzZXBhcmF0aW5nIGZyb20gYWRqYWNlbnQgZGF0
YSBieSBvbmUgY2FjaGUgbGluZQp0byBiZSBlZmZlY3RpdmUsIGFuZCBwbGFjaW5nIGl0IGFkamFj
ZW50IHRvIC5kYXRhLnBhZ2VfYWxpZ25lZCBmdWxmaWxscyB0aGlzCnJlcXVpcmVtZW50LgoKRm9y
IEFSTSwgLmV4X3RhYmxlIGFwcGVhcnMgdG8gYmUgYSB2ZXN0aWdpYWwgcmVtbmFudC4gIE5vdGhp
bmcgaW4gdGhlCnJlc3VsdGluZyBidWlsZCBldmVyIGluc3BlY3RzIG9yIGFjdHMgb24gdGhlIGNv
bnRlbnRzIG9mIHRoZSB0YWJsZS4gIFRoZSBhcm0zMgpidWlsZCBkb2VzIGhvd2V2ZXIgaGF2ZSBz
b21lIGFzc2VtYmx5IHJvdXRpbmVzIHdoaWNoIGZpbGwgLmV4X3RhYmxlLgoKRHJvcCBhbGwgb2Yg
QVJNJ3MgLmV4X3RhYmxlIGluZnJhc3RydWN0dXJlLCB0byByZWR1Y2UgdGhlIHNpemUgb2YgdGhl
IGNvbXBpbGVkCmJpbmFyeSwgYW5kIGF2b2lkIGdpdmluZyB0aGUgaWxsdXNpb24gb2YgZXhjZXB0
aW9uIGhhbmRsaW5nIHdvcmtpbmcuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpPbmx5IGNv
bXBpbGUgdGVzdGVkIG9uIEFSTS4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvbGliL2Fzc2VtYmxl
ci5oIHwgMTkgKystLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgICAg
ICAgICAgICB8IDE2ICstLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAg
ICAgICAgICAgfCAgNyArKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MzcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2xpYi9hc3Nl
bWJsZXIuaCBiL3hlbi9hcmNoL2FybS9hcm0zMi9saWIvYXNzZW1ibGVyLmgKaW5kZXggNmRlMjYz
OC4uNDJlYWFiYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2xpYi9hc3NlbWJsZXIu
aAorKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvbGliL2Fzc2VtYmxlci5oCkBAIC0xNjAsMTMgKzE2
MCw2IEBACiAJcmVzdG9yZV9pcnFzX25vdHJhY2UgXG9sZGNwc3IKIAkuZW5kbQogCi0jZGVmaW5l
IFVTRVIoeC4uLikJCQkJXAotOTk5OToJeDsJCQkJCVwKLQkucHVzaHNlY3Rpb24gX19leF90YWJs
ZSwiYSI7CQlcCi0JLmFsaWduCTM7CQkJCVwKLQkubG9uZwk5OTk5Yiw5MDAxZjsJCQlcCi0JLnBv
cHNlY3Rpb24KLQogI2lmZGVmIENPTkZJR19TTVAKICNkZWZpbmUgQUxUX1NNUChpbnN0ci4uLikJ
CQkJCVwKIDk5OTg6CWluc3RyCkBAIC0yNDcsNyArMjQwLDcgQEAKICNpZmRlZiBDT05GSUdfVEhV
TUIyX0tFUk5FTAogCiAJLm1hY3JvCXVzcmFjY29mZiwgaW5zdHIsIHJlZywgcHRyLCBpbmMsIG9m
ZiwgY29uZCwgYWJvcnQsIHQ9VCgpCi05OTk5OgorCiAJLmlmCVxpbmMgPT0gMQogCVxpbnN0clxj
b25kXCgpYlwoKVx0XCgpLncgXHJlZywgW1xwdHIsICNcb2ZmXQogCS5lbHNlaWYJXGluYyA9PSA0
CkBAIC0yNTYsMTAgKzI0OSw2IEBACiAJLmVycm9yCSJVbnN1cHBvcnRlZCBpbmMgbWFjcm8gYXJn
dW1lbnQiCiAJLmVuZGlmCiAKLQkucHVzaHNlY3Rpb24gX19leF90YWJsZSwiYSIKLQkuYWxpZ24J
MwotCS5sb25nCTk5OTliLCBcYWJvcnQKLQkucG9wc2VjdGlvbgogCS5lbmRtCiAKIAkubWFjcm8J
dXNyYWNjLCBpbnN0ciwgcmVnLCBwdHIsIGluYywgY29uZCwgcmVwdCwgYWJvcnQKQEAgLTI4OCw3
ICsyNzcsNyBAQAogCiAJLm1hY3JvCXVzcmFjYywgaW5zdHIsIHJlZywgcHRyLCBpbmMsIGNvbmQs
IHJlcHQsIGFib3J0LCB0PVQoKQogCS5yZXB0CVxyZXB0Ci05OTk5OgorCiAJLmlmCVxpbmMgPT0g
MQogCVxpbnN0clxjb25kXCgpYlwoKVx0IFxyZWcsIFtccHRyXSwgI1xpbmMKIAkuZWxzZWlmCVxp
bmMgPT0gNApAQCAtMjk3LDEwICsyODYsNiBAQAogCS5lcnJvcgkiVW5zdXBwb3J0ZWQgaW5jIG1h
Y3JvIGFyZ3VtZW50IgogCS5lbmRpZgogCi0JLnB1c2hzZWN0aW9uIF9fZXhfdGFibGUsImEiCi0J
LmFsaWduCTMKLQkubG9uZwk5OTk5YiwgXGFib3J0Ci0JLnBvcHNlY3Rpb24KIAkuZW5kcgogCS5l
bmRtCiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0v
eGVuLmxkcy5TCmluZGV4IDJiNDRlNWQuLjNkYzUxMTcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwpAQCAtOTQsMjcgKzk0LDEz
IEBAIFNFQ1RJT05TCiAgIF9lcm9kYXRhID0gLjsgICAgICAgICAgICAgICAgLyogRW5kIG9mIHJl
YWQtb25seSBkYXRhICovCiAKICAgLmRhdGEgOiB7ICAgICAgICAgICAgICAgICAgICAvKiBEYXRh
ICovCisgICAgICAgKiguZGF0YS5yZWFkX21vc3RseSkKICAgICAgICAuID0gQUxJR04oUEFHRV9T
SVpFKTsKICAgICAgICAqKC5kYXRhLnBhZ2VfYWxpZ25lZCkKICAgICAgICAqKC5kYXRhKQogICAg
ICAgICooLmRhdGEuKikKICAgfSA6dGV4dAogCi0gIC4gPSBBTElHTihTTVBfQ0FDSEVfQllURVMp
OwotICAuZGF0YS5yZWFkX21vc3RseSA6IHsKLSAgICAgICAvKiBFeGNlcHRpb24gdGFibGUgKi8K
LSAgICAgICBfX3N0YXJ0X19fZXhfdGFibGUgPSAuOwotICAgICAgICooLmV4X3RhYmxlKQotICAg
ICAgIF9fc3RvcF9fX2V4X3RhYmxlID0gLjsKLQotICAgICAgIC8qIFByZS1leGNlcHRpb24gdGFi
bGUgKi8KLSAgICAgICBfX3N0YXJ0X19fcHJlX2V4X3RhYmxlID0gLjsKLSAgICAgICAqKC5leF90
YWJsZS5wcmUpCi0gICAgICAgX19zdG9wX19fcHJlX2V4X3RhYmxlID0gLjsKLQotICAgICAgICoo
LmRhdGEucmVhZF9tb3N0bHkpCi0gIH0gOnRleHQKLQogICAuID0gQUxJR04oOCk7CiAgIC5hcmNo
LmluZm8gOiB7CiAgICAgICBfc3BsYXRmb3JtID0gLjsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCmluZGV4IDlmYTZjOTkuLmVmMTE5
NDkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gveDg2
L3hlbi5sZHMuUwpAQCAtMjY0LDEyICsyNjQsOSBAQCBTRUNUSU9OUwogICBfXzJNX2luaXRfZW5k
ID0gLjsKIAogICBfXzJNX3J3ZGF0YV9zdGFydCA9IC47ICAgICAgIC8qIFN0YXJ0IG9mIDJNIHN1
cGVycGFnZXMsIG1hcHBlZCBSVy4gKi8KLSAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7Ci0g
IERFQ0xfU0VDVElPTiguZGF0YS5yZWFkX21vc3RseSkgewotICAgICAgICooLmRhdGEucmVhZF9t
b3N0bHkpCi0gIH0gOnRleHQKLQogICBERUNMX1NFQ1RJT04oLmRhdGEpIHsKKyAgICAgICAqKC5k
YXRhLnJlYWRfbW9zdGx5KQorICAgICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwogICAgICAgICoo
LmRhdGEucGFnZV9hbGlnbmVkKQogICAgICAgICooLmRhdGEpCiAgICAgICAgKiguZGF0YS4qKQot
LSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
