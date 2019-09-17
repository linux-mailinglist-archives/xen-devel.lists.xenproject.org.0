Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A5B54D6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHkf-00054o-79; Tue, 17 Sep 2019 17:58:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlRc=XM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAHkd-00054b-Ne
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:58:55 +0000
X-Inumbo-ID: d028974a-d974-11e9-961c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d028974a-d974-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568743134;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=IcYxy1OpyBK5Gicvdbqlqj4aiODvlWL2jP1gQhxyCHo=;
 b=aDvxGzreG9xey3OQCNlJh69ogMW2XZxDIE7bbPca+vwwMF/8I9MgJSQZ
 hXjOFW+50jb7q7krJCyP2i03LqDAKAXMtpwRwpL0uhc2diAqkBsMjff48
 V3N/53Uou1FxUduUx4R/6Y9DVYTTqFV0d0XmS5w/2bfVRHiKVmj29g1GP 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pKljf8HKY6w/SRoky2J90FMRd2czn4iyQHHVioZAA9EYekNh5mKpd/O6goQcH7H+uU8fqjnSpk
 Jy2JOZNiiRoRCLrcpAkAeQSo6W8n3WRENnq+4B5WdH7AFx7rR21OnsCSuSZ9KASQwUOhxRVunk
 6LirfFUMaBuxgtkj26RF87PmbhZ1tsIddcKtmAGFbrVnPNUrXjx9KMQx3jio1xl3M+Ne4umDra
 JkBQ63UdXrhgeLT8QDF0obhF7Z/ZP5ihhAlon0vsoBq1TR3OitMA1cy2zKeQStGBt65YXt3DMl
 lhQ=
X-SBRS: 2.7
X-MesageID: 5995153
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5995153"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 17 Sep 2019 18:58:50 +0100
Message-ID: <20190917175850.14940-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libs: Fix build following c/s 56dccee3f
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJhdmlzIHJlcG9ydHM6CgogIG1ha2Ugc3ViZGlycy1pbnN0YWxsCiAgbWFrZVsyXTogRW50ZXJp
bmcgZGlyZWN0b3J5IGAvaG9tZS90cmF2aXMvYnVpbGQvYW5keWhocC94ZW4vdG9vbHMnCiAgbWFr
ZVszXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvaG9tZS90cmF2aXMvYnVpbGQvYW5keWhocC94ZW4v
dG9vbHMnCiAgbWFrZSAtQyBsaWJzIGluc3RhbGwKICBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3Rv
cnkgYC9ob21lL3RyYXZpcy9idWlsZC9hbmR5aGhwL3hlbi90b29scy9saWJzJwogIG1ha2VbNV06
IEVudGVyaW5nIGRpcmVjdG9yeSBgL2hvbWUvdHJhdmlzL2J1aWxkL2FuZHloaHAveGVuL3Rvb2xz
L2xpYnMnCiAgbWFrZSAtQyB0b29sY29yZSBpbnN0YWxsCiAgbWFrZVs2XTogRW50ZXJpbmcgZGly
ZWN0b3J5IGAvaG9tZS90cmF2aXMvYnVpbGQvYW5keWhocC94ZW4vdG9vbHMvbGlicy90b29sY29y
ZScKICBtYWtlIGxpYnMKICBtYWtlWzddOiBFbnRlcmluZyBkaXJlY3RvcnlgL2hvbWUvdHJhdmlz
L2J1aWxkL2FuZHloaHAveGVuL3Rvb2xzL2xpYnMvdG9vbGNvcmUnCiAgZm9yIGkgaW4gaW5jbHVk
ZS94ZW50b29sY29yZS5oIGluY2x1ZGUveGVudG9vbGNvcmVfaW50ZXJuYWwuaDsgZG8gXAogICAg
ICAgICAgZ2NjIC14IGMgLWFuc2kgLVdhbGwgLVdlcnJvciAtSTxzbmlwPi94ZW4vdG9vbHMvbGli
cy90b29sY29yZS8uLi8uLi8uLi90b29scy9pbmNsdWRlIFwKICAgICAgICAgICAgICAgICAgICAt
UyAtbyAvZGV2L251bGwgJGkgfHwgZXhpdCAxOyBcCiAgICAgICAgICAgICAgICAgICAgICAgIGVj
aG8gJGk7IFwKICAgICAgICAgICAgICAgICAgICAgICAgZG9uZSA+aGVhZGVycy5jaGsubmV3CiAg
aW5jbHVkZS94ZW50b29sY29yZV9pbnRlcm5hbC5oOjMwOjMxOiBmYXRhbCBlcnJvcjogX3hlbnRv
b2xjb3JlX2xpc3QuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogICAjaW5jbHVkZSAiX3hl
bnRvb2xjb3JlX2xpc3QuaCIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgogIGNv
bXBpbGF0aW9uIHRlcm1pbmF0ZWQuCiAgbWFrZVs3XTogKioqIFtoZWFkZXJzLmNoa10gRXJyb3Ig
MQoKVGhlIHByb2JsZW0gaXMgdGhhdCB4ZW50b29sY29yZV9pbnRlcm5hbC5oIGluY2x1ZGVzIF94
ZW50b29sY29yZV9saXN0Lmggd2hpY2gKaGFzbid0IGJlZW4gZ2VuZXJhdGVkIHlldC4KClRoZSB0
b29sY29yZSBoZWFkZXJzLmNoayBydWxlICh1bmxpa2UgdGhlIG90aGVyIGxpYnJhcmllcykgaGFk
IGFuIGFkZGl0aW9uYWwKZGVwZW5kZW5jeSBhZ2FpbnN0ICQoQVVUT0lOQ1MpLCB3aGljaCBmb3Jj
ZWQgdGhlIGhlYWRlcnMgdG8gYmUgZ2VuZXJhdGVkCmZpcnN0LiAgUmVwbGljYXRlIHRoaXMgaW4g
dGhlIGNvbW1vbiBsaWJzLm1rCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKSWFu
IGdhdmUgaGlzIEFjayBJUkwgYW5kIEkndmUgcHVzaGVkIHRoaXMgY29tbWl0IHRvIGZpeCB0aGUg
YnVpbGQuCi0tLQogdG9vbHMvbGlicy9saWJzLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWJz
Lm1rIGIvdG9vbHMvbGlicy9saWJzLm1rCmluZGV4IGI2ODAwODc2NTMuLjgwMjdhZTc0MDAgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnMvbGlicy5taworKysgYi90b29scy9saWJzL2xpYnMubWsKQEAg
LTQ3LDcgKzQ3LDcgQEAgYnVpbGQ6CiAuUEhPTlk6IGxpYnMKIGxpYnM6IGhlYWRlcnMuY2hrICQo
TElCKSAkKFBLR19DT05GSUdfSU5TVCkgJChQS0dfQ09ORklHX0xPQ0FMKQogCi1oZWFkZXJzLmNo
azogJCh3aWxkY2FyZCBpbmNsdWRlLyouaCkKK2hlYWRlcnMuY2hrOiAkKHdpbGRjYXJkIGluY2x1
ZGUvKi5oKSAkKEFVVE9JTkNTKQogCiBsaWJ4ZW4kKExJQk5BTUUpLmE6ICQoTElCX09CSlMpCiAJ
JChBUikgcmMgJEAgJF4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
