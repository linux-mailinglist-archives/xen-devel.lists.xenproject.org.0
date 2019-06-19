Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B64B6A5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:05:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYN2-0002Eq-E6; Wed, 19 Jun 2019 11:03:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdYN1-0002EY-2P
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:03:15 +0000
X-Inumbo-ID: d322895e-9281-11e9-9683-cfe381c97655
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d322895e-9281-11e9-9683-cfe381c97655;
 Wed, 19 Jun 2019 11:03:10 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WqytGu7Pg3h0twKpEG1t+YLSJ3XAHZ1V0YgmOx1+6EInBss6bpD3Zde5bHb025d0Pcfv4hdwQi
 CtYAbBeoQstBvSn81mpK1iydnLqU4V1TIcviGd9FOJVR4kG/HRQdeHOgXDe86FfvmIET6Er/un
 qW5+8iVf85d85JhR35FQwUZAmZa81HWDIIjf6I82EK0y0gbvnDE/o3y7A97c09mXuiLs5F0ReV
 vuNyIzXhuU83T6AM84ebO/Tj7Mk48/UND8ZgAYtVCHGqkm14ZJnvKd3cQ/yRrg2+we530RKr4B
 +wk=
X-SBRS: 2.7
X-MesageID: 1926696
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1926696"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 13:02:46 +0200
Message-ID: <20190619110250.18881-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] x86: build with llvm 8 linker
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
Cc: Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpDdXJyZW50IGh5cGVydmlzb3IgY29kZS9idWlsZCBwcm9kdWNlcyBhbiBpbnZhbGlk
IGJpbmFyeSB3aGVuIGxpbmtlZAp3aXRoIGxsZCA4IChsbHZtIGxpbmtlcikuIFRoaXMgaXMgYmVj
YXVzZSBsbGQgOCBwbGFjZXMgb3JwaGFuZWQgc2VjdGlvbnMKYXQgdGhlIGJlZ2lubmluZyBvZiB0
aGUgb3V0cHV0IGZpbGUsIHRodXMgZGlzcGxhY2luZyB0aGUgbXVsdGlib290CmhlYWRlcnMuCgpJ
biBvcmRlciB0byBidWlsZCBhIGNvcnJlY3QgaW1hZ2Ugd2l0aCBsbGQgOCBtYWtlIHN1cmUgdGhl
cmUgYXJlIG5vCm9ycGhhbmVkIHNlY3Rpb25zLCBhbmQgYWxzbyBhZGQgYSBidWlsZC10aW1lIGNo
ZWNrIHRvIGFzc2VydCB0aGUKbXVsdGlib290IGhlYWRlcnMgYXJlIHByZXNlbnQgYmV0d2VlbiB0
aGUgb2Zmc2V0IGJvdW5kYXJ5IGdpdmVuIGluIHRoZQpzcGVjaWZpY2F0aW9uLgoKUm9nZXIgUGF1
IE1vbm5lICg0KToKICB4ejogdXNlIGluaXRjb25zdCBmb3IgaHlwZXJ2aXNvciBidWlsZAogIHg4
Ni9saW5rZXI6IHVzZSBERUNMX1NFQ1RJT04gdW5pZm9ybWx5CiAgeDg2L2xpbmtlcjogYWRkIGEg
cmVsb2Mgc2VjdGlvbiB0byBFTEYgYmluYXJ5CiAgeDg2OiBjaGVjayBmb3IgbXVsdGlib290ezEs
Mn0gaGVhZGVyIHByZXNlbmNlCgogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgfCAgMyArKysK
IHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAgIHwgMTQgKysrKysrKysrLS0tLS0KIHhlbi9jb21t
b24vZGVjb21wcmVzcy5oICAgIHwgIDIgKysKIHhlbi9jb21tb24veHovZGVjX2Jjai5jICAgIHwg
IDYgKysrLS0tCiB4ZW4vY29tbW9uL3h6L2RlY19zdHJlYW0uYyB8ICAyICstCiA1IGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xIChBcHBs
ZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
