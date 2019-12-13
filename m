Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E726111EAF7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:08:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqFA-000071-10; Fri, 13 Dec 2019 19:04:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqF8-00006w-RJ
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:04:50 +0000
X-Inumbo-ID: 6abe8292-1ddb-11ea-a914-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6abe8292-1ddb-11ea-a914-bc764e2007e4;
 Fri, 13 Dec 2019 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xkbOJP6fAuyas6j302ok5QU8W4tIruFk69fgVV3kLDw=;
 b=OYA9CtOtVm97FL8VAXu/Klk7iNP8tDkeMsEH/XQucmDug76W3NgvtUFJ
 +xvScMqMRPn3bgqxnpizdF8pc6+kytI+Iys0ZrnNxjXYB6+0bu2cm+sAN
 D4ABHMefiKZsaiEGGWo231242Ap+LXuTy1p7OlRMtNKoKx78Yi8J4HWoU 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B6sdGRnwAWvSkpzytoORndvvoqDgrCCPK4jjVEgpwx7Ql9O6iNme2dax8INcy2+Ij4bM42Vja8
 gRPLQ6b2h9bjeclAITS+ansqNAQc0uWFhwT9YYTNn4mq5XfqT3gK60y/TsYO6lV2VpAUgR3Wou
 th1myvYL1AN5TQtkfRD0DLpGLdA0RAFpqfVyKqwkq5meKNoYSXJFNHuXsFpyh0dxqFaYaafBC4
 9GTaeVDspDGC9ajq7FXrY4PPMnCgoHIA60dS2hk+a0mvFUlphrlI3+yW2s8tU7ofr8c+ylQX6F
 jmI=
X-SBRS: 2.7
X-MesageID: 10018946
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10018946"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:31 +0000
Message-ID: <20191213190436.24475-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/6] x86/suspend: Clarify and improve the
 behaviour of do_suspend_lowlevel()
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

ZG9fc3VzcGVuZF9sb3dsZXZlbCgpIGJlaGF2ZXMgYXMgYSBmdW5jdGlvbiBjYWxsLCBldmVuIHdo
ZW4gdGhlIHRyYW1wb2xpbmUKanVtcHMgYmFjayBpbnRvIHRoZSBtaWRkbGUgb2YgaXQuICBEaXNj
dXNzIHRoaXMgcHJvcGVydHksIHdoaWxlIHJlbmFtaW5nIHRoZQpmYXItdG9vLWdlbmVyaWMgX19y
ZXRfcG9pbnQgdG8gczNfcmVzdW1lLgoKT3B0aW1pc2UgdGhlIGNhbGxpbmcgbG9naWMgZm9yIGFj
cGlfZW50ZXJfc2xlZXBfc3RhdGUoKS4gICQzIGRvZXNuJ3QgcmVxdWlyZSBhCjY0Yml0IHdyaXRl
LCBhbmQgdGhlIGZ1bmN0aW9uIGlzbid0IHZhcmlhZGljIHNvIGRvZXNuJ3QgbmVlZCB0byBzcGVj
aWZ5IHplcm8KRlBVIHJlZ2lzdGVycyBpbiB1c2UuCgpJbiB0aGUgY2FzZSBvZiBhbiBhY3BpX2Vu
dGVyX3NsZWVwX3N0YXRlKCkgZXJyb3IsIHdlIGRpZG4ndCBhY3R1YWxseSBsb3NlCnN0YXRlIHNv
IGRvbid0IG5lZWQgdG8gcmVzdG9yZSBpdC4gIEp1bXAgc3RyYWlnaHQgdG8gdGhlIGVuZC4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCAyMyArKysrKysrKysrKysrKysrLS0tLS0t
LQogeGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMgICAgICB8ICAyICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90
LlMKaW5kZXggNzQyNjFjYjRmMS4uOGM1MjVhODAyYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2FjcGkvd2FrZXVwX3Byb3QuUworKysgYi94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5T
CkBAIC00MiwxNSArNDIsMjMgQEAgRU5UUlkoZG9fc3VzcGVuZF9sb3dsZXZlbCkKIAogICAgICAg
ICBjYWxsICAgIHNhdmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUKIAotICAgICAgICBtb3YgICAgICQz
LCAlcmRpCi0gICAgICAgIHhvciAgICAgJWVheCwgJWVheAotCiAgICAgICAgIC8qIGVudGVyIHNs
ZWVwIHN0YXRlIHBoeXNpY2FsbHkgKi8KKyAgICAgICAgbW92ICAgICAkMywgJWVkaQogICAgICAg
ICBjYWxsICAgIGFjcGlfZW50ZXJfc2xlZXBfc3RhdGUKLSAgICAgICAgam1wICAgICBfX3JldF9w
b2ludAotCiAKLUVOVFJZKF9fcmV0X3BvaW50KQorICAgICAgICAvKiBJdCBzZWVtcyB3ZSBkaWRu
J3Qgc3VzcGVuZC4gIEdldCBvdXQgb2YgaGVyZS4gKi8KKyAgICAgICAgam1wICAgICAuTHN1c3Bl
bmRfZXJyCisKKyAgICAgICAgLyoKKyAgICAgICAgICogZG9fc3VzcGVuZF9sb3dsZXZlbCgpIGlz
IGFycmFuZ2VkIHRvIGJlaGF2ZSBhcyBhIHJlZ3VsYXIgZnVuY3Rpb24KKyAgICAgICAgICogY2Fs
bCwgZXZlbiBpZiBoYXJkd2FyZSBhY3R1YWxseSBnb2VzIHRvIHNsZWVwIGluIHRoZSBtaWRkbGUu
CisgICAgICAgICAqCisgICAgICAgICAqIFRoZSB0cmFtcG9saW5lIHJlLWludGVyY2VwdHMgaGVy
ZS4gIFN0YXRlIGlzOgorICAgICAgICAgKiAgLSA2NGJpdCBtb2RlCisgICAgICAgICAqCisgICAg
ICAgICAqIEV2ZXJ5dGhpbmcgZWxzZSwgaW5jbHVkaW5nIHRoZSBzdGFjaywgbmVlZHMgcmVzdG9y
aW5nLgorICAgICAgICAgKi8KK0VOVFJZKHMzX3Jlc3VtZSkKICAgICAgICAgbGdkdCAgICBib290
X2dkdHIoJXJpcCkKIAogICAgICAgICAvKiBtbXVfY3I0X2ZlYXR1cmVzIGNvbnRhaW5zIGxhdGVz
dCBjcjQgc2V0dGluZyAqLwpAQCAtOTIsNyArMTAwLDggQEAgRU5UUlkoX19yZXRfcG9pbnQpCiAg
ICAgICAgIExPQURfR1JFRygxMykKICAgICAgICAgTE9BRF9HUkVHKDE0KQogICAgICAgICBMT0FE
X0dSRUcoMTUpCi0gICAgICAgIHJldCAKKy5Mc3VzcGVuZF9lcnI6CisgICAgICAgIHJldAogCiAu
ZGF0YQogICAgICAgICAuYWxpZ24gMTYKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L3dh
a2V1cC5TIGIveGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMKaW5kZXggZmM0NzcyMWY0My4uYzE3
ZDYxM2I2MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMKKysrIGIveGVu
L2FyY2gveDg2L2Jvb3Qvd2FrZXVwLlMKQEAgLTE1MSw3ICsxNTEsNyBAQCB3YWtldXBfMzI6CiAg
ICAgICAgIC5jb2RlNjQKIHdha2V1cF82NDoKICAgICAgICAgLyogSnVtcCB0byBoaWdoIG1hcHBp
bmdzIGFuZCB0aGUgaGlnaGVyLWxldmVsIHdha2V1cCBjb2RlLiAqLwotICAgICAgICBtb3ZhYnMg
ICRfX3JldF9wb2ludCwgJXJieAorICAgICAgICBtb3ZhYnMgICRzM19yZXN1bWUsICVyYngKICAg
ICAgICAgam1wICAgICAqJXJieAogCiBib2d1c19zYXZlZF9tYWdpYzoKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
