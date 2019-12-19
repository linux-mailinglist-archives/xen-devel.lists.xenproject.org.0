Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB6126893
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 19:00:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii03W-000867-UJ; Thu, 19 Dec 2019 17:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4R/5=2J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ii03V-000861-4m
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:57:45 +0000
X-Inumbo-ID: 09f746da-2289-11ea-b6f1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09f746da-2289-11ea-b6f1-bc764e2007e4;
 Thu, 19 Dec 2019 17:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576778256;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Z6eU2lTRwaAI2DPqhSLAfX6/F2VPHuG6q9E5uNWE8qk=;
 b=JlAkLGwUWeYjspU1hupLGjO+698Gg+fkg6+Q4Opyv4/ScX1kAZ9yobej
 xv562RsUWXC4t5t4XbL8feSKJ0upXsyCM3BSGgsmOmorD602+63bS4XRn
 s5Tmg+dhMznYkygKYdKXxXndywwcuHo5mbRSTxuwtr3HM22D3HBlAYIJD E=;
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
IronPort-SDR: 1TXFb/oO9IHUGw5+c+jKlYCmGoOsGAeVXIKxmHCNScxK1msVI6FnLBpPZDarhbCMN9jXKrtI//
 em00Bx3ba4EIBXUl8sb8rZT6/1XYzVuDQ+KJtXWpeHrHebifwZxSrP8dqlsS7M+vOCejIQZD8v
 AN6sXEp3HtHlBfUKcgnODt8fuQ0gO38qPUPrsLsVjrEUX82oS/KmHTs9Jz/E1u1x9c9KGlIofK
 ykOoy6N9a37kbFBTuvHINx0hMdCp0nFGfeKFT55Mj2QhWGPzP3x++MH3O2l/81yX8HnSI5GTJL
 Yv0=
X-SBRS: 2.7
X-MesageID: 10537344
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; d="scan'208";a="10537344"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Dec 2019 17:57:28 +0000
Message-ID: <20191219175730.12484-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/3] Provide
 target_install_packages_nonfree_nonconcurrent
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmlnaHQgbm93IHRoaXMgaXMgb25seSB1c2VmdWwgd2l0aCBEZWJpYW4uICBXZSB3aWxsIGNhbGwg
aXQgZnJvbQp0cy1ob3N0LWluc3RhbGwgdG8gaW5zdGFsbCB0aGUgbWljcm9jb2RlLgoKV2UgZW5h
YmxlIGFuZCB0aGVuIGRpc2FibGUgbm9uLWZyZWUgc28gdGhhdCB3ZSBkb24ndCBpbnN0YWxsIG5v
bi1mcmVlCnBhY2thZ2VzIHVuaW50ZW50aW9uYWxseS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQu
cG0gfCAxNiArKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBw
b3J0LnBtCmluZGV4IDQ0ZjAxYTg2Li42MzA4NzI2MCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0
U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC03MSw2ICs3MSw3IEBA
IEJFR0lOIHsKICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfZWRpdGZpbGVfa3ZwX3JlcGxh
Y2UKICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfcnVuX3BrZ21hbmFnZXJfaW5zdGFsbAog
ICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2VzIHRhcmdldF9pbnN0
YWxsX3BhY2thZ2VzX25vcmVjCisJCSAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2VzX25vbmZy
ZWVfbm9uY29uY3VycmVudAogICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF9qb2JkaXIgdGFy
Z2V0X2V4dHJhY3Rfam9iZGlzdHBhdGhfc3ViZGlyCiAgICAgICAgICAgICAgICAgICAgICAgdGFy
Z2V0X2V4dHJhY3Rfam9iZGlzdHBhdGggdGFyZ2V0X2V4dHJhY3RfZGlzdHBhcnQKIAkJICAgICAg
dGFyZ2V0X3RmdHBfcHJlZml4CkBAIC02MjcsNiArNjI4LDIxIEBAIHN1YiB0YXJnZXRfaW5zdGFs
bF9wYWNrYWdlc19ub3JlYyAoJEApIHsKICAgICBteSAoJGhvLCBAcGFja2FnZXMpID0gQF87CiAg
ICAgdGFyZ2V0X3J1bl9wa2dtYW5hZ2VyX2luc3RhbGwoJGhvLFxAcGFja2FnZXMsMSk7CiB9Citz
dWIgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXNfbm9uZnJlZV9ub25jb25jdXJyZW50ICgkQCkgewor
ICAgICMgaW5hZGVxdWF0ZSBsb2NraW5nLCBzaG91bGQgYmUgY2FsbGVkIGR1cmluZyBpbnN0YWxs
YXRpb24gb25seQorICAgIG15ICgkaG8sIEBwYWNrYWdlcykgPSBAXzsKKyAgICBteSAkc2xpc3Q9
ICcvZXRjL2FwdC9zb3VyY2VzLmxpc3QnOworICAgIG15ICR4c3VpdGVzPSAnY29udHJpYiBub24t
ZnJlZSc7CisgICAgdGFyZ2V0X2NtZF9yb290KCRobywgPDxFTkQsIDMwKTsKKyAgICBwZXJsIC1p
fiAtcGUgJ25leHQgdW5sZXNzIG0vXmRlYi87IHN7IG1haW5cJH17XCQmICR4c3VpdGVzfTsnICRz
bGlzdAorICAgIGFwdCB1cGRhdGUKK0VORAorICAgIHRhcmdldF9ydW5fcGtnbWFuYWdlcl9pbnN0
YWxsKCRobyxcQHBhY2thZ2VzKTsKKyAgICB0YXJnZXRfY21kX3Jvb3QoJGhvLCA8PEVORCwgMzAp
OworICAgIG12ICRzbGlzdH4gJHNsaXN0CisgICAgYXB0IHVwZGF0ZQorRU5ECit9CiAKIHN1YiB0
cGZjc19jb3JlIHsKICAgICBteSAoJHRwdXRmaWxlZiwkaG8sJHRpbWVvdXQsJGZpbGVkYXRhLCAk
cmRlc3QsJGxsZWFmKSA9IEBfOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
