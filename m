Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CA177E6A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 19:27:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9CCh-0004vR-5j; Tue, 03 Mar 2020 18:23:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yrn2=4U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j9CCf-0004vM-UJ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 18:23:37 +0000
X-Inumbo-ID: 18a48390-5d7c-11ea-a1fa-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18a48390-5d7c-11ea-a1fa-12813bfff9fa;
 Tue, 03 Mar 2020 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583259816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0h/qH1+t9GAT/XGzup1z/T3pD9MWaTUONZ3bhNc4CCs=;
 b=Ue+nHVkZRmD2z+jUing9vox9WlE8xI7SZN0CiP410HykniqYihA4tMCb
 qu51H/mrYfJFVaQb2t5zw0tIUS0wkH3z1b5SYaF8y8met7Sc2YMe8Sx4g
 +njucxRliRSRFLdrNecS8GCs3fsXkl1/FQC6qQZSWrPQ9wb2gHzLrxeon w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ILYE7caKpX0uQD4MpcLmttzm7pRYTl7gYVwFOYtRD9JslRemYQaLsUBj8e0FDFe56f21D46Q5N
 GX3ERb5+qb2kNn2WN+Y00H40MVkSUPWQ6axDBB5CTrhQqqigbICzibZtwDC4dhgcLR3DSe9cfO
 bnNbqPma65GGilwSOztVk6z+jDVG0/4QqqVWXpBujkiL3yF/pMJTOcnYsLxXV9Moh9sGGc70R3
 /oPSGAqKQcD+Pmbup6unO5KdDOFTn+PfxaASpFivXAJcrnkPly+X/XJcQfKJebMQSeuQqdVT2b
 v0s=
X-SBRS: 2.7
X-MesageID: 13330916
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13330916"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 3 Mar 2020 18:23:26 +0000
Message-ID: <20200303182326.16739-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/libxc: Reduce feature handling complexity
 in xc_cpuid_apply_policy()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eGNfY3B1aWRfYXBwbHlfcG9saWN5KCkgaXMgZ2FpbmluZyBleHRyYSBwYXJhbWV0ZXJzIHRvIHVu
dGFuZ2xlIENQVUlECmNvbXBsZXhpdHkgaW4gWGVuLiAgV2hpbGUgYW4gaW1wcm92ZW1lbnQgaW4g
Z2VuZXJhbCwgaXQgZG9lcyBoYXZlIHRoZQp1bmZvcnR1bmF0ZSBzaWRlIGVmZmVjdCBvZiBkdXBs
aWNhdGluZyBzb21lIHNldHRpbmdzIGFjcm9zcyBtdWxpcGxlCnBhcmFtZXRlcnMuCgpSZWFycmFu
Z2UgdGhlIGxvZ2ljIHRvIG9ubHkgY29uc2lkZXIgJ3BhZScgaWYgbm8gZXhwbGljaXQgZmVhdHVy
ZXNldCBpcwpwcm92aWRlZC4gIFRoaXMgcmVkdWNlcyB0aGUgY29tcGxleGl0eSBmb3IgY2FsbGVy
cyB3aG8gaGF2ZSBhbHJlYWR5IHByb3ZpZGVkIGEKcGFlIHNldHRpbmcgaW4gdGhlIGZlYXR1cmVz
ZXQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Q0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhj
L2luY2x1ZGUveGVuY3RybC5oIHwgNiArKysrKysKIHRvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5j
ICAgIHwgNyArKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90
b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAppbmRleCBmYzZlNTdhMWEwLi44ZDEzYTdlMjBi
IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAorKysgYi90b29scy9s
aWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaApAQCAtMTc5OCw2ICsxNzk4LDEyIEBAIGludCB4Y19jcHVp
ZF9zZXQoeGNfaW50ZXJmYWNlICp4Y2gsCiAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVk
IGludCAqaW5wdXQsCiAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKipjb25maWcsCiAgICAg
ICAgICAgICAgICAgIGNoYXIgKipjb25maWdfdHJhbnNmb3JtZWQpOworLyoKKyAqIE1ha2UgYWRq
dXN0bWVudHMgdG8gdGhlIENQVUlEIHNldHRpbmdzIGZvciBhIGRvbWFpbi4KKyAqCisgKiBFaXRo
ZXIgcGFzcyBhIGZ1bGwgbmV3IEBmZWF0dXJlc2V0IChhbmQgQG5yX2ZlYXR1cmVzKSwgb3IgYWRq
dXN0IGluZGl2aWR1YWwKKyAqIGZlYXR1cmVzIChAcGFlKS4KKyAqLwogaW50IHhjX2NwdWlkX2Fw
cGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQzMl90
ICpmZWF0dXJlc2V0LApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgYi90
b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCA1Y2VkNmQxOGI5Li5mMDQ1YjAzMjIzIDEw
MDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYworKysgYi90b29scy9saWJ4Yy94
Y19jcHVpZF94ODYuYwpAQCAtNTMyLDYgKzUzMiwxMSBAQCBpbnQgeGNfY3B1aWRfYXBwbHlfcG9s
aWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKIAogICAgICAgICBjcHVpZF9m
ZWF0dXJlc2V0X3RvX3BvbGljeShmZWF0LCBwKTsKICAgICB9CisgICAgZWxzZQorICAgIHsKKyAg
ICAgICAgaWYgKCBkaS5odm0gKQorICAgICAgICAgICAgcC0+YmFzaWMucGFlID0gcGFlOworICAg
IH0KIAogICAgIGlmICggIWRpLmh2bSApCiAgICAgewpAQCAtNjE1LDggKzYyMCw2IEBAIGludCB4
Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAog
ICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KIAotICAgICAgICBwLT5iYXNpYy5wYWUgPSBw
YWU7Ci0KICAgICAgICAgLyoKICAgICAgICAgICogVGhlc2Ugc2V0dGluZ3MgYXJlIG5lY2Vzc2Fy
eSB0byBjYXVzZSBlYXJsaWVyIEhWTV9QQVJBTV9ORVNURURIVk0gLwogICAgICAgICAgKiBYRU5f
RE9NQ1RMX2Rpc2FibGVfbWlncmF0ZSBzZXR0aW5ncyB0byBiZSByZWZsZWN0ZWQgY29ycmVjdGx5
IGluCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
