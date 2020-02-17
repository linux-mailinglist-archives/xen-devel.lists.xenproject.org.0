Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E13161945
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 18:59:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3keM-0003yU-1x; Mon, 17 Feb 2020 17:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATlc=4F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j3keL-0003yP-0F
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 17:57:41 +0000
X-Inumbo-ID: fcd6a1d0-51ae-11ea-ade5-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcd6a1d0-51ae-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581962259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=t8sfm2pJ5lM10hWBEcxmdSBqi3gzpblNehKlhFBxXKE=;
 b=epyNYx1IhdwJDyqqrvTyvMlWQn0RD4Ny/zQP2gWhQDhUNy2n1kh3Pmmw
 TcORvM76y9EmsetwNRrohBBt1/Bts+16xwQZHt6L15sv/607DIw1jNNNF
 s6P5R+vSJv0WUN1W7Mdhv11ES+cUwLk5zq7cZHlDUf9uGvmoJQ3OE+NQc s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OG/XVz7sgwia+EOPywWoKEJdsBji5bwwM6eXPowVc2ePJwqsp/fA8lZzpxKMOXZH2pXTHKy8XP
 wB7c+0T/U9pFGisyBnGGTdmma5G/iboTNo5lWiplhfP+EPSzY7abkAwqa6H0RuoRTRpIVulwxu
 O1bggmHns+IHrNkizn2hHnb9yQoCOG6GHWxrksJZrs813yfCv1NPrbVQ9nEBnR1HnrDqR+o+l9
 IFjqjM0faY/0DDItU/yQ/Qjb2iE7FeGnMdhad9bO9k5XoCkUmtlzPTL+KIiDXP4hbkIDAYwlpn
 y/U=
X-SBRS: 2.7
X-MesageID: 13010820
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="13010820"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 17:57:31 +0000
Message-ID: <20200217175731.14828-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200205165056.11734-6-andrew.cooper3@citrix.com>
References: <20200205165056.11734-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 5/6] tools/libx[cl]: Don't use
 HVM_PARAM_PAE_ENABLED as a function parameter
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlzIHNldCBhbmQgY29uc3VtZWQgYnkgdGhlIHRvb2xzdGFj
ayBvbmx5LiAgSXQgaXMgaW4KcHJhY3RpY2UgYSBjb21wbGljYXRlZCBhbmQgbm9uLXN0YW5kYXJk
IHdheSBvZiBwYXNzaW5nIGEgYm9vbGVhbiBwYXJhbWV0ZXIKaW50byB4Y19jcHVpZF9hcHBseV9w
b2xpY3koKS4KClRoaXMgaXMgc2lsbHkuICBQYXNzIFBBRSBhcyBhIHJlZ3VsYXIgcGFyYW1ldGVy
IGluc3RlYWQuCgpJbiBsaWJ4bF9fY3B1aWRfbGVnYWN5KCksIGxlYXZlIGEgcmF0aGVyIGJldHRl
ciBleHBsYWluYXRpb24gb2Ygd2h5IG9ubHkgSFZNCmd1ZXN0cyBoYXZlIGEgY2hvaWNlIGluIFBB
RSBzZXR0aW5nLgoKTm8gY2hhbmdlIGluIGhvdyBhIGd1ZXN0IGlzIGNvbnN0cnVjdGVkLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0t
CkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
CnYyOgogKiBSZXdyaXRlIGNvbW1pdCBtZXNzYWdlIGFuZCBjb21tZW50cy4KLS0tCiB0b29scy9s
aWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCB8ICAyICstCiB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYu
YyAgICB8IDE1ICsrKy0tLS0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfY3B1aWQuYyAgICAg
fCAxNiArKysrKysrKysrKysrKystCiAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3Ry
bC5oIGIvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKaW5kZXggMzExZGYxZWYwZi4uNGVi
NGY0YzJjNiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKKysrIGIv
dG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgKQEAgLTE4MDcsNyArMTgwNyw3IEBAIGludCB4
Y19jcHVpZF9zZXQoeGNfaW50ZXJmYWNlICp4Y2gsCiBpbnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5
KHhjX2ludGVyZmFjZSAqeGNoLAogICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBk
b21pZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdWludDMyX3QgKmZlYXR1cmVz
ZXQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mZWF0dXJlcyk7
CisgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBucl9mZWF0dXJlcywgYm9v
bCBwYWUpOwogaW50IHhjX21jYV9vcCh4Y19pbnRlcmZhY2UgKnhjaCwgc3RydWN0IHhlbl9tYyAq
bWMpOwogaW50IHhjX21jYV9vcF9pbmplY3RfdjIoeGNfaW50ZXJmYWNlICp4Y2gsIHVuc2lnbmVk
IGludCBmbGFncywKICAgICAgICAgICAgICAgICAgICAgICAgIHhjX2NwdW1hcF90IGNwdW1hcCwg
dW5zaWduZWQgaW50IG5yX2NwdXMpOwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRf
eDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCAyNTQwYWExZTFjLi4yMWIx
NWI4NmVjIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYworKysgYi90b29s
cy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtNDU1LDcgKzQ1NSw4IEBAIGludCB4Y19jcHVpZF9z
ZXQoCiB9CiAKIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVp
bnQzMl90IGRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAq
ZmVhdHVyZXNldCwgdW5zaWduZWQgaW50IG5yX2ZlYXR1cmVzKQorICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCB1aW50MzJfdCAqZmVhdHVyZXNldCwgdW5zaWduZWQgaW50IG5yX2ZlYXR1
cmVzLAorICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHBhZSkKIHsKICAgICBpbnQgcmM7
CiAgICAgeGNfZG9taW5mb190IGRpOwpAQCAtNTc5LDggKzU4MCw2IEBAIGludCB4Y19jcHVpZF9h
cHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAogICAgIH0KICAg
ICBlbHNlCiAgICAgewotICAgICAgICB1aW50NjRfdCB2YWw7Ci0KICAgICAgICAgLyoKICAgICAg
ICAgICogVG9wb2xvZ3kgZm9yIEhWTSBndWVzdHMgaXMgZW50aXJlbHkgY29udHJvbGxlZCBieSBY
ZW4uICBGb3Igbm93LCB3ZQogICAgICAgICAgKiBoYXJkY29kZSBBUElDX0lEID0gdmNwdV9pZCAq
IDIgdG8gZ2l2ZSB0aGUgaWxsdXNpb24gb2Ygbm8gU01ULgpAQCAtNjM0LDE1ICs2MzMsNyBAQCBp
bnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21p
ZCwKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICB9CiAKLSAgICAgICAgLyoKLSAgICAgICAg
ICogSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlzIGEgcGFyYW1ldGVyIHRvIHRoaXMgZnVuY3Rpb24s
IHN0YXNoZWQgaW4KLSAgICAgICAgICogWGVuLiAgTm90aGluZyBlbHNlIGhhcyBldmVyIHRha2Vu
IG5vdGljZSBvZiB0aGUgdmFsdWUuCi0gICAgICAgICAqLwotICAgICAgICByYyA9IHhjX2h2bV9w
YXJhbV9nZXQoeGNoLCBkb21pZCwgSFZNX1BBUkFNX1BBRV9FTkFCTEVELCAmdmFsKTsKLSAgICAg
ICAgaWYgKCByYyApCi0gICAgICAgICAgICBnb3RvIG91dDsKLQotICAgICAgICBwLT5iYXNpYy5w
YWUgPSB2YWw7CisgICAgICAgIHAtPmJhc2ljLnBhZSA9IHBhZTsKIAogICAgICAgICAvKgogICAg
ICAgICAgKiBUaGVzZSBzZXR0aW5ncyBhcmUgbmVjZXNzYXJ5IHRvIGNhdXNlIGVhcmxpZXIgSFZN
X1BBUkFNX05FU1RFREhWTSAvCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcHVpZC5j
IGIvdG9vbHMvbGlieGwvbGlieGxfY3B1aWQuYwppbmRleCA0OWQzY2E1YjI2Li4wNjI3NTAxMDJl
IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcHVpZC5jCisrKyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2NwdWlkLmMKQEAgLTQxNiw4ICs0MTYsMjIgQEAgdm9pZCBsaWJ4bF9fY3B1aWRfbGVn
YWN5KGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKICAgICBsaWJ4bF9jcHVpZF9wb2xp
Y3lfbGlzdCBjcHVpZCA9IGluZm8tPmNwdWlkOwogICAgIGludCBpOwogICAgIGNoYXIgKmNwdWlk
X3Jlc1s0XTsKKyAgICBib29sIHBhZSA9IHRydWU7CisKKyAgICAvKgorICAgICAqIEZvciBQViBn
dWVzdHMsIFBBRSBpcyBYZW4tY29udHJvbGxlZCAoaXQgaXMgdGhlICdwJyB0aGF0IGRpZmZlcmVu
dGlhdGVzCisgICAgICogdGhlIHhlbi0zLjAteDg2XzMyIGFuZCB4ZW4tMy4wLXg4Nl8zMnAgQUJJ
cykuICBJdCBpcyBtYW5kYXRvcnkgYXMgWGVuCisgICAgICogaXMgNjRiaXQgb25seSB0aGVzZSBk
YXlzLgorICAgICAqCisgICAgICogRm9yIFBWSCBndWVzdHMsIHRoZXJlIGlzIG5vIHRvcC1sZXZl
bCBQQUUgY29udHJvbCBpbiB0aGUgZG9tYWluIGNvbmZpZywKKyAgICAgKiBzbyBpcyB0cmVhdGVk
IGFzIGFsd2F5cyBhdmFpbGFibGUuCisgICAgICoKKyAgICAgKiBIVk0gZ3Vlc3RzIGdldCBhIHRv
cC1sZXZlbCBjaG9pY2Ugb2Ygd2hldGhlciBQQUUgaXMgYXZhaWxhYmxlLgorICAgICAqLworICAg
IGlmIChpbmZvLT50eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTSkKKyAgICAgICAgcGFlID0g
bGlieGxfZGVmYm9vbF92YWwoaW5mby0+dS5odm0ucGFlKTsKIAotICAgIHhjX2NwdWlkX2FwcGx5
X3BvbGljeShjdHgtPnhjaCwgZG9taWQsIE5VTEwsIDApOworICAgIHhjX2NwdWlkX2FwcGx5X3Bv
bGljeShjdHgtPnhjaCwgZG9taWQsIE5VTEwsIDAsIHBhZSk7CiAKICAgICBpZiAoIWNwdWlkKQog
ICAgICAgICByZXR1cm47Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
