Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46552140D84
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 16:12:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isTGI-0006xj-G2; Fri, 17 Jan 2020 15:10:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isTGH-0006xe-D5
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:10:13 +0000
X-Inumbo-ID: 703fe186-393b-11ea-8e9a-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 703fe186-393b-11ea-8e9a-bc764e2007e4;
 Fri, 17 Jan 2020 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579273804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pDEzXjk8T3Mot5vZPKOuArJvhoR2GxZqK07xT2q5ZKM=;
 b=DuRsgnl/z9U3LC/65FUv7uK2cTzv2Y206oXQe1xXLY/eCteVKZyTBNLJ
 1CXKUIwF8rryn5k5SimdXhSDH3+FhLrIt6VOQVpkEEECpLvszuF00RFGn
 P9cTkVxueJBgx+juNSVwwVHaFKaMroMd71T03PQy6fHWACne/D15ITkT0 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yMRduJW8mOGgptSXa0F7/Yi3gGbD0IM1qwo6E2KAa5oE9+poVuJacbLn7kR+DRRmCngQRC7tGJ
 acL6kja4n9xjKdVcFa/sS8m8E96N4YmtyWJV7C8Xq1j7S3oPDiJeKl5UTbiEoYDb75eXyZbOie
 w96y8fyZsd4pUqhBkB8bTTAVUufd4xEDph2PKAvztSY7VPE9NcokkDTaDbzTPAfXJn95ORZHYT
 eGMjnrWIxMFcX1j8UqCAiF+1dOhRtBe/8abI5SdjU7C0n8pdpdiRBvcOtkyBgwJzOePGpp1Ve3
 w0c=
X-SBRS: 2.7
X-MesageID: 11247065
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11247065"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 16:09:48 +0100
Message-ID: <20200117150948.45014-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEludGVsIFNETSBzdGF0ZXM6CgoiV2hlbiBhbiBpbGxlZ2FsIHZlY3RvciB2YWx1ZSAoMCB0
byAxNSkgaXMgd3JpdHRlbiB0byBhIExWVCBlbnRyeSBhbmQKdGhlIGRlbGl2ZXJ5IG1vZGUgaXMg
Rml4ZWQgKGJpdHMgOC0xMSBlcXVhbCAwKSwgdGhlIEFQSUMgbWF5IHNpZ25hbCBhbgppbGxlZ2Fs
IHZlY3RvciBlcnJvciwgd2l0aG91dCByZWdhcmQgdG8gd2hldGhlciB0aGUgbWFzayBiaXQgaXMg
c2V0IG9yCndoZXRoZXIgYW4gaW50ZXJydXB0IGlzIGFjdHVhbGx5IHNlZW4gb24gdGhlIGlucHV0
LiIKCkFuZCB0aGF0J3MgZXhhY3RseSB3aGF0J3MgY3VycmVudGx5IGRvbmUgaW4gZGlzY29ubmVj
dF9ic3BfQVBJQyB3aGVuCnZpcnRfd2lyZV9zZXR1cCBpcyB0cnVlIGFuZCBMVlQgTElOVDAgaXMg
YmVpbmcgbWFza2VkLiBCeSB3cml0aW5nIG9ubHkKQVBJQ19MVlRfTUFTS0VEIFhlbiBpcyBhY3R1
YWxseSBzZXR0aW5nIHRoZSB2ZWN0b3IgdG8gMCBhbmQgdGhlCmRlbGl2ZXJ5IG1vZGUgdG8gRml4
ZWQgKDApLCBhbmQgaGVuY2UgaXQgdHJpZ2dlcnMgYW4gQVBJQyBlcnJvciBldmVuCndoZW4gdGhl
IExWVCBlbnRyeSBpcyBtYXNrZWQuCgpUaGlzIHdvdWxkIHVzdWFsbHkgbWFuaWZlc3Qgd2hlbiBY
ZW4gaXMgYmVpbmcgc2h1dCBkb3duLCBhcyB0aGF0J3MKd2hlcmUgZGlzY29ubmVjdF9ic3BfQVBJ
QyBpcyBjYWxsZWQ6CgooWEVOKSBBUElDIGVycm9yIG9uIENQVTA6IDQwKDAwKQoKRml4IHRoaXMg
YnkgcmV1c2luZyB0aGUgY3VycmVudCBMVlQgTElOVDAgdmFsdWUgYW5kIGp1c3QgYWRkaW5nIHRo
ZQptYXNrIGJpdCB0byBpdC4KClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYXBpYy5jIHwgMyArKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvYXBpYy5jIGIveGVuL2FyY2gveDg2L2FwaWMuYwppbmRleCBhNmE3NzU0ZDc3Li5l
NDM2MzYzOWJkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9hcGljLmMKQEAgLTI4MSw3ICsyODEsOCBAQCB2b2lkIGRpc2Nvbm5lY3RfYnNwX0FQSUMo
aW50IHZpcnRfd2lyZV9zZXR1cCkKICAgICAgICAgfQogICAgICAgICBlbHNlIHsKICAgICAgICAg
ICAgIC8qIERpc2FibGUgTFZUMCAqLwotICAgICAgICAgICAgYXBpY193cml0ZShBUElDX0xWVDAs
IEFQSUNfTFZUX01BU0tFRCk7CisgICAgICAgICAgICB2YWx1ZSA9IGFwaWNfcmVhZChBUElDX0xW
VDApOworICAgICAgICAgICAgYXBpY193cml0ZShBUElDX0xWVDAsIHZhbHVlIHwgQVBJQ19MVlRf
TUFTS0VEKTsKICAgICAgICAgfQogCiAgICAgICAgIC8qIEZvciBMVlQxIG1ha2UgaXQgZWRnZSB0
cmlnZ2VyZWQsIGFjdGl2ZSBoaWdoLCBubWkgYW5kIGVuYWJsZWQgKi8KLS0gCjIuMjUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
