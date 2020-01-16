Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A989313F40F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:47:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isA9H-0007qP-0K; Thu, 16 Jan 2020 18:45:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M+HB=3F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isA9F-0007qI-OP
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:45:41 +0000
X-Inumbo-ID: 600e583e-3890-11ea-ac27-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 600e583e-3890-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579200333;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=PZs/R7hswsbH514hkxAkpvsMTRRpVa9bQECFXJHRXM8=;
 b=JPr3X1E5DkqepnCakXcBNGGkNs4gJRalHQVWX4vYhmUgMRtZtAHEfv/l
 ny0SBzE0MVtHuvo+FscFkJyC//fJpWhZk8DE4EcLELUDLucGEbX5F/8K0
 cZkwi+So9ogvfdvPtJBRPUmW39TNyIVeEX3qpbagQqwi/PnSsabs9GAx2 g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AXcJFEO8jx9zhFwSb3WdkAp1hUoWT2MorCjo3agxgAw+/w1rrBarnokA1g9kqaF4KYZuSC+3rh
 CIdXSypjo8eN/A5CcZrMbsR0Ht++lsNezWwayEEa7vM/E9SpTzdd1jGoHJVUNl66VBs5w/hAZ2
 E09+2wMiYXDzI6HS6MVy1rYT06ZRHtNnW/9nil/Iu1xllmxjHDgqvdcOINMJwDMhvRmUWRCTfG
 Xa106JC8rTrqVlLDVuWIJwS6JDY3Ry6NDhfLtRbaYaiiHQ24B4CYyreLnioj2RE7KcBvA3VuDz
 SqM=
X-SBRS: 2.7
X-MesageID: 11627540
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11627540"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 16 Jan 2020 18:45:27 +0000
Message-ID: <20200116184527.16193-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: Make tools/xl part of LIBXENLIGHT
 stanza
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGwgaXMgbWFpbnRhaW5lZCBpbiBwcmFjdGljZSBieSB0aGUgbGlieGwgbWFpbnRhaW5lcnMuICBU
aGUgZWZmZWN0IGlzCnNpbXBseSB0byBncmFudCBtYWludGFpbmVyc2hpcCB0byBBbnRob255LgoK
Q0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQogTUFJTlRBSU5FUlMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXgg
ZDVlZGZjMTQyYS4uOTUyYmNkMzg3YSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTI5OSw2ICsyOTksNyBAQCBNOglXZWkgTGl1IDx3bEB4ZW4ub3JnPgogTToJ
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CiBTOglTdXBwb3J0ZWQK
IEY6CXRvb2xzL2xpYnhsLworRjoJdG9vbHMveGwvCiAKIExJVkVQQVRDSAogTToJS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
