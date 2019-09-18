Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F76B61D1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:50:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXUi-0004L5-88; Wed, 18 Sep 2019 10:47:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cE4e=XN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAXUh-0004Kq-6t
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:47:31 +0000
X-Inumbo-ID: b662039a-da01-11e9-a337-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b662039a-da01-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568803650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hRoAFHDXUtSfi/mcnetiA3thuntP5A6mEM4YU7fmvCE=;
 b=R8qtzLA8DASeIYrfGW/XS0RxiLjeALPOLewLO5vQamPz3K3CjTZH8BM2
 mBvobYIYVi/dobdqdXbXVNQnQwGt/ROQt8gDCffmWvOQWrWch+SPmYMs3
 eOcHvKUXmWxhixrQ1gbbTMBpj4IqKtosJROI5pYofOznc5cYQ2rUnguKy w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Fp9suOGnzlPLyEjnHb1rF5wNm+aMmZIoPx7kh2fDsEM1RQ8euNYgDqIEk3wsmrydRpCnOl03bF
 HtGHYcOlapPjpUwXwDtpxBoq7AWeGEEPOT9fSxj0lHLAUIX7lil9M8/ThGEHuXGcQAHn1OqP6x
 u/1MmefCqxoz+YrBfGHRUs9eh/AK+t8A0MBmKXHisXbhAsYXscJZv8jAZ/1pJeiY+jm+pJay6i
 IWwrANwx2y94gPgFqDxSp8ZYh7nrtAi2J1KGFgX+aGqZ+CqxXItlbVZIij3S6FklvUiKVrXvco
 bU0=
X-SBRS: 2.7
X-MesageID: 5922253
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5922253"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Sep 2019 11:47:18 +0100
Message-ID: <20190918104718.3695-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH REPOST v13 3/4] tools/ocaml: abi check: Cope
 with consecutive relevant enums
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
Cc: Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJZiB0aGUgZW5k
IG9mIG9uZSBlbnVtIGlzIHRoZSBgdHlwZScgbGluZSBmb3IgdGhlIG5leHQgZW51bSwgd2Ugd291
bGQKbm90IG5vdGljZSBpdC4KCkZpeCB0aGlzIGJ5IHJlb3JkZXJpbmcgdGhlIGNvZGUsIGFuZCBn
ZXR0aW5nIHJpZCBvZiB0aGUgZWxzZTogbm93IGlmCnRoZSAid2UgYXJlIHdpdGhpbiBhbiBlbnVt
IiBicmFuY2ggZGVjaWRlcyB0aGF0IGl0J3MgdGhlIGVuZCBvZiB0aGUKZW51bSwgaXQgdW5zZXRz
ICRlaSBhbmQgd2UgdGhlbiBpbW1lZGlhdGVseSBwcm9jZXNzIHRoZSBsaW5lIGFzIGEgIm5vdAp3
aXRoaW4gYW4gZW51bSIgbGluZSAtIGllIGFzIHRoZSBzdGFydCBvZiB0aGUgbmV4dCBvbmUuCgpS
ZXBvcnRlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CkNjOiBDaHJpc3Rp
YW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+CkNjOiBEYXZpZCBTY290dCA8
ZGF2ZUByZWNvaWwub3JnPgoKdjEzOgogLSBOZXcgaW4gdGhpcyB2ZXJzaW9uCi0tLQogdG9vbHMv
b2NhbWwvbGlicy94Yy9hYmktY2hlY2sgfCAxNyArKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjayBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNr
CmluZGV4IGQ1MzJmMzcyNzEuLjNjYmRlYzU4MmYgMTAwNzU1Ci0tLSBhL3Rvb2xzL29jYW1sL2xp
YnMveGMvYWJpLWNoZWNrCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCkBAIC03
MCwxNCArNzAsNyBAQCBteSAkY3ZhbDsKICRlaSA9IHVuZGVmOwogbXkgJGJpdG51bSA9IDA7CiB3
aGlsZSAoPE9DQU1MX0ZJTEU+KSB7Ci0gICAgaWYgKCEkZWkpIHsKLSAgICAgICAgaWYgKG17XnR5
cGUgXHMrIChcdyspIFxzKiBcPSBccyogJH14ICYmICRlbnVtc3skMX0pIHsKLSAgICAgICAgICAg
IHByaW50ICIvLyBmb3VuZCBvY2FtbCB0eXBlICQxIGF0ICRvOiQuXG4iIG9yIGRpZSAkITsKLSAg
ICAgICAgICAgICRlaSA9ICRlbnVtc3skMX07Ci0gICAgICAgICAgICAkY3ZhbCA9ICcnOwotICAg
ICAgICAgICAgJGJpdG51bSA9IDA7Ci0gICAgICAgIH0KLSAgICB9IGVsc2UgeworICAgIGlmICgk
ZWkpIHsKICAgICAgICAgaWYgKG17XlxzKyBcfCBccyogJGVpLT57T1ByZWZpeH0gKFx3KykgXHMq
JH14KSB7CiAgICAgICAgICAgICAkY3ZhbCA9ICQxOwogICAgICAgICAgICAgaWYgKCRlaS0+e01h
bmdsZX0gZXEgJ2xjJykgewpAQCAtMTA0LDYgKzk3LDE0IEBAIHdoaWxlICg8T0NBTUxfRklMRT4p
IHsKICAgICAgICAgICAgIGRpZSAiJF8gPyI7CiAgICAgICAgIH0KICAgICB9CisgICAgaWYgKCEk
ZWkpIHsKKyAgICAgICAgaWYgKG17XnR5cGUgXHMrIChcdyspIFxzKiBcPSBccyogJH14ICYmICRl
bnVtc3skMX0pIHsKKyAgICAgICAgICAgIHByaW50ICIvLyBmb3VuZCBvY2FtbCB0eXBlICQxIGF0
ICRvOiQuXG4iIG9yIGRpZSAkITsKKyAgICAgICAgICAgICRlaSA9ICRlbnVtc3skMX07CisgICAg
ICAgICAgICAkY3ZhbCA9ICcnOworICAgICAgICAgICAgJGJpdG51bSA9IDA7CisgICAgICAgIH0K
KyAgICB9CiB9CiAKIGZvcmVhY2ggJGVpICh2YWx1ZXMgJWVudW1zKSB7Ci0tIAoyLjIwLjEuMi5n
YjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
