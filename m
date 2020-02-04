Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297C152181
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 21:33:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz4pR-0002s7-QN; Tue, 04 Feb 2020 20:29:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=30aJ=3Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iz4pQ-0002s2-6n
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 20:29:48 +0000
X-Inumbo-ID: 157d8964-478d-11ea-8396-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 157d8964-478d-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580848187;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=TTERVOZ9S/iNOlyJqrXR0pdx6zWgIYGbMEwNZesUB94=;
 b=PDuivNxnf1hLpBmL2EWLJyujqH/iPEliCsdy8WHxPeIql4LNHmJ3C4ox
 +B3Ns+YNU7dum+Q6FFAW/8OnsPxYDX+mjFTAenZqVPL0qWeZxxYL1zKId
 QEkY1rD4eHsz0x0o/z9X9stRaOu84oV+RALUITI6EsH8Yd2PQa4hEuYfY I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m48qUiOlZ8P7av1jl4GyVyrWTRdLAoNNIqxVaOgFgEH1sopO6bdzuQcFm7hqeGp+iNtmZ5YFf5
 UhDSsGEsjCBzzEVqxPBAi3c38xUkuV4Ibp+85Ia8ERQRgMaFTi3a0YYyld918yysyBXHXYSMVn
 WbfK/sKAxlZxBH+Lm3Lt0dDnRD61S3XOgkvWNpXL7rUnDiSBaa3jalfceotKG4zcork/sADPbv
 221Rv1WqQbp31yeklth0fmMvURrZWSPij/qv0ib8tVbarohggTwnETkhWCEUnx9XmeMOs+c88O
 ATc=
X-SBRS: 2.7
X-MesageID: 12560048
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,403,1574139600"; d="scan'208";a="12560048"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 20:29:38 +0000
Message-ID: <20200204202938.9605-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc/restore: Fix REC_TYPE_X86_PV_VCPU_XSAVE
 data auditing (take 2)
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
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgdHVybnMgb3V0IHRoYXQgYSBidWcgKHNpbmNlIGZvcmV2ZXIpIGluIFhlbiBjYXVzZXMgWFNB
VkUgcmVjb3JkcyB0byBoYXZlCm5vbi1hcmNoaXRlY3R1cmFsIGJlaGF2aW91ciBvbiB4c2F2ZS1j
YXBhYmxlIGhhcmR3YXJlLCB3aGVuIGEgUFYgZ3Vlc3QgaGFzIG5vdAp0b3VjaGVkIHRoZSBzdGF0
ZS4KCkluIHN1Y2ggYSBjYXNlLCB0aGUgZGF0YSByZWNvcmQgcmV0dXJuZWQgZnJvbSBYZW4gaXMg
Mip1aW50NjRfdCwgYm90aCBjbGFpbWluZwp0aGUgKGlsbGVnaXRpbWF0ZSkgc3RhdGUgb2YgJXhj
cjAgYW5kICV4Y3IwX2FjY3VtIGJlaW5nIDAuCgpBZGp1c3QgdGhlIGJvdW5kIGluIGhhbmRsZV94
ODZfcHZfdmNwdV9ibG9iKCkgdG8gY29wZSB3aXRoIHRoaXMuCgpGaXhlczogMmE2MmMyMjcxNWIg
ImxpYnhjL3Jlc3RvcmU6IEZpeCBkYXRhIGF1ZGl0aW5nIGluIGhhbmRsZV94ODZfcHZfdmNwdV9i
bG9iKCkiClJlcG9ydGVkLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4
LmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0
cml4LmNvbT4KCkknbGwgc2VlIGFib3V0IGZpeGluZyBYZW4gYXQgc29tZSBvdGhlciBwb2ludC4g
IEEgc2Vjb25kIGJ1ZyBpcyB0aGF0IHdlIGhhdmUKdHdvIGNvcGllcyBvZiBwYXJ0IG9mIHRoZSB2
Q1BVJ3MgRlBVIHN0YXRlLgotLS0KIHRvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X3B2LmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYyBiL3Rvb2xz
L2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X3B2LmMKaW5kZXggMTZlNzM4ODg0ZS4uOTA0Y2NjNDYy
YSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYworKysgYi90
b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9wdi5jCkBAIC04MjcsMTAgKzgyNywxMCBAQCBz
dGF0aWMgaW50IGhhbmRsZV94ODZfcHZfdmNwdV9ibG9iKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpj
dHgsCiAgICAgICAgIGJyZWFrOwogCiAgICAgY2FzZSBSRUNfVFlQRV9YODZfUFZfVkNQVV9YU0FW
RToKLSAgICAgICAgaWYgKCBibG9ic3ogPCAxMjggKQorICAgICAgICBpZiAoIGJsb2JzeiA8IDE2
ICkKICAgICAgICAgewogICAgICAgICAgICAgRVJST1IoIiVzIHJlY29yZCB0b28gc2hvcnQ6IG1p
biAlenUsIGdvdCAldSIsCi0gICAgICAgICAgICAgICAgICByZWNfbmFtZSwgc2l6ZW9mKCp2aGRy
KSArIDEyOCwgcmVjLT5sZW5ndGgpOworICAgICAgICAgICAgICAgICAgcmVjX25hbWUsIHNpemVv
ZigqdmhkcikgKyAxNiwgcmVjLT5sZW5ndGgpOwogICAgICAgICAgICAgZ290byBvdXQ7CiAgICAg
ICAgIH0KICAgICAgICAgYmxvYiA9ICZ2Y3B1LT54c2F2ZTsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
