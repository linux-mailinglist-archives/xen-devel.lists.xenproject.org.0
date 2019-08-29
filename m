Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31358A1A56
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 14:44:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3JkB-0000dN-F5; Thu, 29 Aug 2019 12:41:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HRfl=WZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i3JkA-0000dI-AK
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:41:38 +0000
X-Inumbo-ID: 571c7a34-ca5a-11e9-ae66-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 571c7a34-ca5a-11e9-ae66-12813bfff9fa;
 Thu, 29 Aug 2019 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567082497;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=2mUol2TNNZC+77DVDtvZJYDwIHZ3CQLKCyHQd3g2Xn8=;
 b=f/ZGLWAvKPKNPibpfbaUcjUjRXNX9JKEGyCrwfaB0tDtw/sphUOGCkDo
 xM8xwUCYS+qOoYQscOzecMO/z63VDz3z+GwOZy7NGWwJyw+MmKdV2ap72
 DuBrHfS8fM7WDrgp2PDhp6T6pAHkTZU8v/4KXfsW4Je5eA9CP6N85VJsU c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0XEQLVlyEf8FK9skJvGr6JW24VeYph7I6909LL4ZvkJLDjamLJrfNZBmoB+RbMzbE9p0A3408Q
 +qELwEKmPTI3j9HIuuaQAw0U93zPXPaJRuxbHdQb2+QnzbbYD02g4BORP9s46K3R32etGUV5dH
 i4nk4y64myYobRbMOwBIXNH4NJ06QkKAHRUF5/ga/Wic1BlTkMfAJNLzFdk6NTgEMUiVojrVJt
 0y2vLKmcx/8WU7CbZpa6M3AmzoRi8fhorFoPyLGcB21s3/ADof232ir5Ov/E2VB9nd9b906Vq8
 2VY=
X-SBRS: 2.7
X-MesageID: 5143102
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="5143102"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 29 Aug 2019 13:41:02 +0100
Message-ID: <20190829124102.28398-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] make-hosts-flight: Prefer stretch to
 jessie
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
Cc: Dominic Brekau <dominic.brekau@credativ.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxpc3Qgb2Ygc3VpdGVzIGluIEFMTF9TVUlURVMgaXMgaW4gZGVjcmVhc2luZyBvcmRlciBv
ZiBwcmVmZXJlbmNlOgppdCBnZXRzIHBhc3NlZCB0byBjcy1ob3N0cy1saXN0LCB3aGVyZSB0aGUg
b3JkZXIgaXMgc2lnbmlmaWNhbnQuCgpXaXRob3V0IHRoaXMgcGF0Y2gsIHdlIHRyeSB0byBjb21t
aXNzaW9uIGhvc3RzIGJ5IHJ1bm5pbmcgamVzc2llIGlmCnRoZSBob3N0IGZsYWdzIHNlZW0gdG8g
c2F5IGplc3NpZSB3b3VsZCBiZSBzdXBwb3J0ZWQuICBUaGF0J3Mgbm90CnJlYWxseSBzZW5zaWJs
ZS4KCkNDOiBEb21pbmljIEJyZWthdSA8ZG9taW5pYy5icmVrYXVAY3JlZGF0aXYuZGU+ClNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1h
a2UtaG9zdHMtZmxpZ2h0IHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tYWtlLWhvc3RzLWZsaWdodCBiL21ha2UtaG9z
dHMtZmxpZ2h0CmluZGV4IGY3NDIyOTMyLi45MmRhMWM3YyAxMDA3NTUKLS0tIGEvbWFrZS1ob3N0
cy1mbGlnaHQKKysrIGIvbWFrZS1ob3N0cy1mbGlnaHQKQEAgLTI2LDcgKzI2LDggQEAgYmxlc3Np
bmc9JDQKIGJ1aWxkZmxpZ2h0PSQ1CiAKIDogJHtBTExfQVJDSEVTOj1hbWQ2NCBpMzg2IGFybTY0
IGFybWhmfQotOiAke0FMTF9TVUlURVM6PWplc3NpZSBzdHJldGNofQorOiAke0FMTF9TVUlURVM6
PXN0cmV0Y2ggamVzc2llfQorIyBeIG1vc3QgcHJlZmVycmVkIHN1aXRlIGZpcnN0CiAKIDogJHtQ
RVJIT1NUX01BWFdBSVQ6PTIwMDAwfSAjIHNlY29uZHMKIAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
