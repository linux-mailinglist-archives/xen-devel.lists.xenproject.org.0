Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CB16871D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 19:58:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5DSv-00086b-Ps; Fri, 21 Feb 2020 18:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hh41=4J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j5DSu-00086W-G7
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 18:55:56 +0000
X-Inumbo-ID: c95a4d86-54db-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c95a4d86-54db-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 18:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582311354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H4K9z5RmDWhaD114wYCtz6MFZ53XL5VGNcMcpyGJVlw=;
 b=XA3PArlvj++F4h+SWOTTBBMDkgXOfcOuVcU6wogeRktZIAGRpFLuipXF
 VUnykBvVLFW36cMf6BOK8sjtvX/c958ify2ug6L+jqeqYaesg46VaoGTN
 6ffw5QKGfG7WmLvtILGK6qAPK6gRrdNGTtRAlXVLm11peIDfE4WXi/gZJ A=;
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
IronPort-SDR: bvIlVCw2EO6yYzr3y3bvNgTrAUdnTzx9e4WW7/0MUZOl4NEhzjh2bxRbv2ftfjf7TNdh9rc9Hz
 C3z+nZ3gTOx1EhG+x/UcFgLSawMyXUrVU7kJA1ImsusETxHY/iiUp1UTZ+8kOypVSfNpJud4Id
 yw5sFyzQ3mKvxT/7xnCkPu2va35peywpayAes0ewrymkm9hSNxwzRyBk+95QP1rV0vxmJKwbiS
 Zhf0LZbojPaZpatuYMR7b9ro6w8Sk1xvzHGAwnoyr9Dlkeo7y2K7faeK6m/fMzrsNZ1plAGiPr
 Uys=
X-SBRS: 2.7
X-MesageID: 13192084
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,469,1574139600"; d="scan'208";a="13192084"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 21 Feb 2020 18:55:50 +0000
Message-ID: <20200221185550.30545-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/build: Fix -mskip-rax-setup handling
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHdheSAtbXNraXAtcmF4LXNldHVwIGlzIGN1cnJlbnRseSBzcGVjaWZpZWQgcmVzdWx0cyBp
biBjb21waWxlciBzdXBwb3J0CmJlaW5nIGV2YWx1YXRlZCBwZXIgdHJhbnNsYXRpb24gdW5pdCwg
cmF0aGVyIHRoYW4gcGVyIHN1YmRpci4gIFN3aXRjaCB0byB1c2luZwpjYy1hZGQtb3B0aW9uIGlu
c3RlYWQuCgpUaGlzIGRyb3BzIHRoZSBudW1iZXIgb2YgY2FsbG91dHMgZnJvbSA0MjggdG8gNjAu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhpcyBkcm9wcyBh
Ym91dCAwLjVzIGZyb20gbXkgY2NhY2hlLWFjY2VsZXJhdGVkIGJ1dCBvdGhlcndpc2UtY2xlYW4g
YnVpbGQsCmFuZCB3aWxsIGxpa2VseSBoYXZlIGEgbW9yZSBwcm9ub3VuY2VkIGRpZmZlcmVuY2Ug
b24gb2xkZXIgaGFyZHdhcmUuICBJZiBpdAp3YW50cyBiYWNrcG9ydGluZywgaXQgd2FudHMgdG8g
Z28gYmFjayBpbiB0aGlzIGZvcm0uCgpBbHRlcm5hdGl2ZWx5LCBpdCB3b3VsZCBiZSBuaWNlIHRv
IGdldCB0aGlzIG1vdmVkIHRvIEtjb25maWcgdGltZS4gIEFudGhvbnk6CkRvIHlvdSBoYXZlIGFu
eSBwYXJ0IG9mIHlvdXIgc2VyaWVzIGFscmVhZHkgZG9pbmcgdGhpcywgb3IgYW55IHN1Z2dlc3Rp
b25zIG9uCmhvdyBiZXN0IHRvIGRvIGl0IHdpdGhvdXQgY29sbGlkaW5nIHdpdGggeW91ciB3b3Jr
PwotLS0KIHhlbi9hcmNoL3g4Ni9SdWxlcy5tayB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L1J1
bGVzLm1rIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCmluZGV4IGU2OWI4ZTY5N2MuLjc4ZmEzMTJk
MzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5taworKysgYi94ZW4vYXJjaC94ODYv
UnVsZXMubWsKQEAgLTYzLDcgKzYzLDggQEAgQ0ZMQUdTICs9IC1tbm8tcmVkLXpvbmUgLWZwaWMg
LWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRhYmxlcwogCiAjIFhlbiBkb2Vzbid0IHVzZSBTU0Ug
aW50ZXJhbGx5LiAgSWYgdGhlIGNvbXBpbGVyIHN1cHBvcnRzIGl0LCBhbHNvIHNraXAgdGhlCiAj
IFNTRSBzZXR1cCBmb3IgdmFyaWFkaWMgZnVuY3Rpb24gY2FsbHMuCi1DRkxBR1MgKz0gLW1uby1z
c2UgJChjYWxsIGNjLW9wdGlvbiwkKENDKSwtbXNraXAtcmF4LXNldHVwKQorQ0ZMQUdTICs9IC1t
bm8tc3NlCiskKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLW1za2lwLXJheC1zZXR1cCkK
IAogIyBDb21waWxlIHdpdGggdGh1bmstZXh0ZXJuLCBpbmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIg
aWYgYXZhaWFibGUuCiBpZmVxICgkKENPTkZJR19JTkRJUkVDVF9USFVOSykseSkKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
