Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04BAFB1A5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:44:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUsu5-0001d1-KB; Wed, 13 Nov 2019 13:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUsu3-0001cw-QT
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:41:47 +0000
X-Inumbo-ID: 56091b8c-061b-11ea-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56091b8c-061b-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573652506;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=1NHJmkKKri5XHjRoHn6QO0awDGsAkqd1ScE7LqT2zbU=;
 b=debFZnj7RafZJxv4qEAd+AthNoWDNF71fb0MtmLrk6v7MWOdt3zbKlUD
 QU1SJnmsA5uGkbDtebfyrucPOWQznN60E1EupG036xBdu6k6//bScwYiQ
 rXuEwyjts+3UVP0yl/5HyxLz9ykffCUivd07wkex2hAL8uG8K54uDFpeU k=;
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
IronPort-SDR: 6XHz6LR/Att9XgCq5C61Cjf+wyjIXYck+RfIlR5GHGykI4i6i0auYyEl6ga5kPmrfDJmhN0M8L
 yfbAUbtN1L8lyGOgDTwGhomqAljSALlXjAl2owRf1X+qRNEHYzAlR5FEE+cJbS/iIpGMGQ4STE
 H/xaVP6neyWN6Z7z0dgH8x6wYlgfc9f0YWjJ82r8n43+BvtKwV0thqE4vKME1cNU9c4nnACZMY
 ZYACOHnCQ2F5IEt2M77iy4RXhCFMPqWpBk92KmL9MQWgtiHH0RllcI2MnSlC9B1KRwUeNpBZYB
 +7Q=
X-SBRS: 2.7
X-MesageID: 8673772
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8673772"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 13:41:36 +0000
Message-ID: <20191113134136.16180-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: Fix crash in 'V' debugkey
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIGJiMDM4ZjMxMTY4ICJBTUQvSU9NTVU6IHJlcGxhY2UgSU5UUkVNQVBfRU5UUklFUyIgaW50
cm9kdWNlcyBhIGNhbGwgdG8KaW50cmVtYXBfdGFibGVfZW50cmllcygpIGluIGR1bXBfaW50cmVt
YXBfdGFibGUoKSBiZWZvcmUgdGJsLnB0ciBpcyBjaGVja2VkCmZvciBOVUxMLgoKaW50cmVtYXBf
dGFibGVfZW50cmllcygpIGludGVybmFsbHkgdXNlcyB2aXJ0X3RvX3BhZ2UoKSB3aGljaCBmYWxs
cyBvdmVyCgogIEFTU0VSVCh2YSA+PSBYRU5fVklSVF9TVEFSVCk7CgppbiBfX3ZpcnRfdG9fcGFn
ZSgpLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpGb3IgNC4xMy4gIFJlZ3Jlc3Npb24gdnMgNC4xMgot
LS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMgfCA0ICsrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwppbmRleCAxZWVkNjBmMjY1Li41ZTkyYzAyM2Y4
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCisr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKQEAgLTg0NywxMSAr
ODQ3LDEzIEBAIHN0YXRpYyB2b2lkIGR1bXBfaW50cmVtYXBfdGFibGUoY29uc3Qgc3RydWN0IGFt
ZF9pb21tdSAqaW9tbXUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuaW9uIGly
dGVfY3B0ciB0YmwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBpdnJzX21hcHBpbmdzICppdnJzX21hcHBpbmcpCiB7Ci0gICAgdW5zaWduZWQgaW50IGNvdW50
LCBuciA9IGludHJlbWFwX3RhYmxlX2VudHJpZXModGJsLnB0ciwgaW9tbXUpOworICAgIHVuc2ln
bmVkIGludCBjb3VudCwgbnI7CiAKICAgICBpZiAoICF0YmwucHRyICkKICAgICAgICAgcmV0dXJu
OwogCisgICAgbnIgPSBpbnRyZW1hcF90YWJsZV9lbnRyaWVzKHRibC5wdHIsIGlvbW11KTsKKwog
ICAgIGZvciAoIGNvdW50ID0gMDsgY291bnQgPCBucjsgY291bnQrKyApCiAgICAgewogICAgICAg
ICBpZiAoIGlvbW11LT5jdHJsLmdhX2VuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
