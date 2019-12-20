Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28560128183
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:37:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMBJ-0000HU-87; Fri, 20 Dec 2019 17:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiMBH-0000HP-VX
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:35:15 +0000
X-Inumbo-ID: 102f3e42-234f-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 102f3e42-234f-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576863307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mz7nvhztl5VSXMf/lORVJzUH8CjuyFpyPSn42oNYLeQ=;
 b=C8Vg9BjRffOogDAmm5FmIkUuponL1YepJa67qlTTzZZQ9uc/NYcRm71J
 0Qae3hId5+IMiW41nT4TrSxT72oimtPslalh36UGiGGhXDKXEG9N8QHpG
 YTaxnYiClW9bMGHFiM9rXz2UnbYO6I+syvQpzcUpre6xoPZO6SSR8TjVJ M=;
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
IronPort-SDR: F0HU4DPCdJJfo9DJAAyjs7kdRoB+y4d+vG/+kF8zBuCXmAviJnfXV5ZNu3jmSw9wDzbnb0P0rf
 ZB7MM8QuPT+kbJedygDlTFQhFmTtwrxkJqrSPQhfKa6kejiU6GNQvYoXHXOoIGvvfwV+py9xNS
 yu9+lrHA3Z0M6yjEtz14q6IYHcBBJA3Mj8VLy/HBCRDpTQuYCcdlQtny9rbKHbMx8izErCQLy0
 SAqSVyK4Fl1+VYAr5vaGCj8kqZ2YKm4+tUjx7Vq7APLI70dCpCKdQl9RCEqWUa3+gWO38/+Bm7
 Od0=
X-SBRS: 2.7
X-MesageID: 10368934
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10368934"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 17:35:02 +0000
Message-ID: <20191220173502.15615-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain types
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eDg2IFBWSCBpcyBjb21wbGV0ZWx5IG9ic29sZXRlIC0gaXQgd2FzIGludGVuZGVkIGZvciBsZWdh
Y3kgUFZIIGJlZm9yZSB0aGF0CmlkZWEgd2FzIGFiYW5kb25lZC4gIFRoZXJlIHdhcyBhbiBSRkMg
c2VyaWVzIGZvciBBUk0gaW4gMjAxNSwgYnV0IHRoZXJlIGlzCnBsZW50eSBvZiBvdXRzdGFuZGlu
ZyB3b3JrIHdoaWNoIGhhc24ndCBiZWVuIGRvbmUgeWV0LgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
ICBOZXcgdHlwZXMgY2FuIGJlIChyZSlpbnRyb2R1Y2VkIHdpdGggdGhlIGNvZGUgd2hpY2gKYWN0
dWFsbHkgaW1wbGVtZW50cyB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGV1LmNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNv
bT4KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDQzogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIGRvY3Mvc3BlY3MvbGlieGMt
bWlncmF0aW9uLXN0cmVhbS5wYW5kb2MgfCA2ICstLS0tLQogdG9vbHMvbGlieGMveGNfc3JfY29t
bW9uLmMgICAgICAgICAgICAgICB8IDIgLS0KIHRvb2xzL2xpYnhjL3hjX3NyX3N0cmVhbV9mb3Jt
YXQuaCAgICAgICAgfCAyIC0tCiB0b29scy9weXRob24veGVuL21pZ3JhdGlvbi9saWJ4Yy5weSAg
ICAgIHwgNCAtLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFu
ZG9jIGIvZG9jcy9zcGVjcy9saWJ4Yy1taWdyYXRpb24tc3RyZWFtLnBhbmRvYwppbmRleCAzMTNi
ZTNlODBkLi5hN2E4YTA4OTM2IDEwMDY0NAotLS0gYS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlv
bi1zdHJlYW0ucGFuZG9jCisrKyBiL2RvY3Mvc3BlY3MvbGlieGMtbWlncmF0aW9uLXN0cmVhbS5w
YW5kb2MKQEAgLTE2MCwxMSArMTYwLDcgQEAgdHlwZSAgICAgICAgMHgwMDAwOiBSZXNlcnZlZC4K
IAogICAgICAgICAgICAgMHgwMDAyOiB4ODYgSFZNLgogCi0gICAgICAgICAgICAweDAwMDM6IHg4
NiBQVkguCi0KLSAgICAgICAgICAgIDB4MDAwNDogQVJNLgotCi0gICAgICAgICAgICAweDAwMDUg
LSAweEZGRkZGRkZGOiBSZXNlcnZlZC4KKyAgICAgICAgICAgIDB4MDAwMyAtIDB4RkZGRkZGRkY6
IFJlc2VydmVkLgogCiBwYWdlX3NoaWZ0ICBTaXplIG9mIGEgZ3Vlc3QgcGFnZSBhcyBhIHBvd2Vy
IG9mIHR3by4KIApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uLmMgYi90b29s
cy9saWJ4Yy94Y19zcl9jb21tb24uYwppbmRleCAzNzBkOThkOTRhLi40NmZkOTI4ZGUyIDEwMDY0
NAotLS0gYS90b29scy9saWJ4Yy94Y19zcl9jb21tb24uYworKysgYi90b29scy9saWJ4Yy94Y19z
cl9jb21tb24uYwpAQCAtOCw4ICs4LDYgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmRoZHJfdHlwZXNb
XSA9CiB7CiAgICAgW0RIRFJfVFlQRV9YODZfUFZdICA9ICJ4ODYgUFYiLAogICAgIFtESERSX1RZ
UEVfWDg2X0hWTV0gPSAieDg2IEhWTSIsCi0gICAgW0RIRFJfVFlQRV9YODZfUFZIXSA9ICJ4ODYg
UFZIIiwKLSAgICBbREhEUl9UWVBFX0FSTV0gICAgID0gIkFSTSIsCiB9OwogCiBjb25zdCBjaGFy
ICpkaGRyX3R5cGVfdG9fc3RyKHVpbnQzMl90IHR5cGUpCmRpZmYgLS1naXQgYS90b29scy9saWJ4
Yy94Y19zcl9zdHJlYW1fZm9ybWF0LmggYi90b29scy9saWJ4Yy94Y19zcl9zdHJlYW1fZm9ybWF0
LmgKaW5kZXggMDUxYWZhN2RjZC4uMzdhN2RhNmVhYiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMv
eGNfc3Jfc3RyZWFtX2Zvcm1hdC5oCisrKyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3N0cmVhbV9mb3Jt
YXQuaApAQCAtNDMsOCArNDMsNiBAQCBzdHJ1Y3QgeGNfc3JfZGhkcgogCiAjZGVmaW5lIERIRFJf
VFlQRV9YODZfUFYgIDB4MDAwMDAwMDFVCiAjZGVmaW5lIERIRFJfVFlQRV9YODZfSFZNIDB4MDAw
MDAwMDJVCi0jZGVmaW5lIERIRFJfVFlQRV9YODZfUFZIIDB4MDAwMDAwMDNVCi0jZGVmaW5lIERI
RFJfVFlQRV9BUk0gICAgIDB4MDAwMDAwMDRVCiAKIC8qCiAgKiBSZWNvcmQgSGVhZGVyCmRpZmYg
LS1naXQgYS90b29scy9weXRob24veGVuL21pZ3JhdGlvbi9saWJ4Yy5weSBiL3Rvb2xzL3B5dGhv
bi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5CmluZGV4IDcwYmNiOGQxNWIuLjQzMjc1MGM5ZmEgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3B5dGhvbi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5CisrKyBiL3Rvb2xz
L3B5dGhvbi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5CkBAIC0zMiwxNCArMzIsMTAgQEAKIAogREhE
Ul9UWVBFX3g4Nl9wdiAgPSAweDAwMDAwMDAxCiBESERSX1RZUEVfeDg2X2h2bSA9IDB4MDAwMDAw
MDIKLURIRFJfVFlQRV94ODZfcHZoID0gMHgwMDAwMDAwMwotREhEUl9UWVBFX2FybSAgICAgPSAw
eDAwMDAwMDA0CiAKIGRoZHJfdHlwZV90b19zdHIgPSB7CiAgICAgREhEUl9UWVBFX3g4Nl9wdiAg
OiAieDg2IFBWIiwKICAgICBESERSX1RZUEVfeDg2X2h2bSA6ICJ4ODYgSFZNIiwKLSAgICBESERS
X1RZUEVfeDg2X3B2aCA6ICJ4ODYgUFZIIiwKLSAgICBESERSX1RZUEVfYXJtICAgICA6ICJBUk0i
LAogfQogCiAjIFJlY29yZHMKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
