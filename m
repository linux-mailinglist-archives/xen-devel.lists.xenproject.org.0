Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F8164C73
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:48:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TOW-0001lR-IO; Wed, 19 Feb 2020 17:44:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4TOU-0001lJ-DI
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:44:18 +0000
X-Inumbo-ID: 70492f54-533f-11ea-83f8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70492f54-533f-11ea-83f8-12813bfff9fa;
 Wed, 19 Feb 2020 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582134254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D518PujtfB/3ccqjET6ABFUtckNCKCt2YwbPcxuJQqY=;
 b=HRu4lw3LnwvOYv1Z1ILWfxnTJcok1RryBuwf6M1aV0fHSEjVGAeSBKTt
 fZLM9yAlwyaZ9rxWbTl6UAhVFuL9Y1f2kuJoC39n51FM4BSlIZmTmJYfI
 2FJmD3F4LfkTMrd46I5ChaHeh/0SxJfhiDOrT8upLitsCix/BwoAgoZAK 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dPxeC9t3nd09ayyDXKYiX1EB0P1wj7ZdW0qvnXOJZzs8hJeRTPkpJzZt+/5Sqn2TjpsFZOh0+I
 r15ZaU26jyABlJb9eDyr3LPHg0gExe/0hSvmnz11ugxB1B/J1MVEspIxbudMPP8nIfL+WUutf4
 LsiVvNxnzRJQxY3oxGYGClyyxKT/PSj/QykC1OISH3/9a/bhrkM2xE06mF6vOwIiQApBAzAzXm
 iMxZ2ecapx8woG/073D5nFDXYxJy4lYo0BxVd7L5svmMc63L8PGfUWIroMarvLXbvVbL0Y5Loo
 lI0=
X-SBRS: 2.7
X-MesageID: 12689424
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="12689424"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 18:43:48 +0100
Message-ID: <20200219174354.84726-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219174354.84726-1-roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 1/7] x86/hvm: allow ASID flush when v !=
 current
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

Q3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBodm1fYXNpZF9mbHVzaF92Y3B1IGlzIG5vdCBzYWZl
IHRvIHVzZQp1bmxlc3MgdGhlIHRhcmdldCB2Q1BVIGlzIGVpdGhlciBwYXVzZWQgb3IgdGhlIGN1
cnJlbnRseSBydW5uaW5nIG9uZSwKYXMgaXQgbW9kaWZpZXMgdGhlIGdlbmVyYXRpb24gd2l0aG91
dCBhbnkgbG9ja2luZy4KCkZpeCB0aGlzIGJ5IHVzaW5nIGF0b21pYyBvcGVyYXRpb25zIHdoZW4g
YWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCmZpZWxkLCBib3RoIGluIGh2bV9hc2lkX2ZsdXNoX3Zj
cHVfYXNpZCBhbmQgb3RoZXIgQVNJRCBmdW5jdGlvbnMuIFRoaXMKYWxsb3dzIHRvIHNhZmVseSBm
bHVzaCB0aGUgY3VycmVudCBBU0lEIGdlbmVyYXRpb24uIE5vdGUgdGhhdCBmb3IgdGhlCmZsdXNo
IHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlzIGN1cnJlbnRseSBydW5uaW5nIGEgdm1leGl0
IGlzCnJlcXVpcmVkLgoKTm90ZSB0aGUgc2FtZSBjb3VsZCBiZSBhY2hpZXZlZCBieSBpbnRyb2R1
Y2luZyBhbiBleHRyYSBmaWVsZCB0bwpodm1fdmNwdV9hc2lkIHRoYXQgc2lnbmFscyBodm1fYXNp
ZF9oYW5kbGVfdm1lbnRlciB0aGUgbmVlZCB0byBjYWxsCmh2bV9hc2lkX2ZsdXNoX3ZjcHUgb24g
dGhlIGdpdmVuIHZDUFUgYmVmb3JlIHZtZW50cnksIHRoaXMgaG93ZXZlcgpzZWVtcyB1bm5lY2Vz
c2FyeSBhcyBodm1fYXNpZF9mbHVzaF92Y3B1IGl0c2VsZiBvbmx5IHNldHMgdHdvIHZDUFUKZmll
bGRzIHRvIDAsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBkZWxheSB0aGlzIHRvIHRoZSB2bWVudHJ5
IEFTSUQKaGVscGVyLgoKVGhpcyBpcyBub3QgYSBidWdmaXggYXMgbm8gY2FsbGVycyB0aGF0IHdv
dWxkIHZpb2xhdGUgdGhlIGFzc3VtcHRpb25zCmxpc3RlZCBpbiB0aGUgZmlyc3QgcGFyYWdyYXBo
IGhhdmUgYmVlbiBmb3VuZCwgYnV0IGEgcHJlcGFyYXRvcnkKY2hhbmdlIGluIG9yZGVyIHRvIGFs
bG93IHJlbW90ZSBmbHVzaGluZyBvZiBIVk0gdkNQVXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHds
QHhlbi5vcmc+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9hc2lkLmMgfCA2ICsrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2FzaWQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5jCmluZGV4IDhl
MDBhMjg0NDMuLjYzY2U0NjJkNTYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5jCkBAIC04Myw3ICs4Myw3IEBAIHZvaWQgaHZt
X2FzaWRfaW5pdChpbnQgbmFzaWRzKQogCiB2b2lkIGh2bV9hc2lkX2ZsdXNoX3ZjcHVfYXNpZChz
dHJ1Y3QgaHZtX3ZjcHVfYXNpZCAqYXNpZCkKIHsKLSAgICBhc2lkLT5nZW5lcmF0aW9uID0gMDsK
KyAgICB3cml0ZV9hdG9taWMoJmFzaWQtPmdlbmVyYXRpb24sIDApOwogfQogCiB2b2lkIGh2bV9h
c2lkX2ZsdXNoX3ZjcHUoc3RydWN0IHZjcHUgKnYpCkBAIC0xMjEsNyArMTIxLDcgQEAgYm9vbF90
IGh2bV9hc2lkX2hhbmRsZV92bWVudGVyKHN0cnVjdCBodm1fdmNwdV9hc2lkICphc2lkKQogICAg
ICAgICBnb3RvIGRpc2FibGVkOwogCiAgICAgLyogVGVzdCBpZiBWQ1BVIGhhcyB2YWxpZCBBU0lE
LiAqLwotICAgIGlmICggYXNpZC0+Z2VuZXJhdGlvbiA9PSBkYXRhLT5jb3JlX2FzaWRfZ2VuZXJh
dGlvbiApCisgICAgaWYgKCByZWFkX2F0b21pYygmYXNpZC0+Z2VuZXJhdGlvbikgPT0gZGF0YS0+
Y29yZV9hc2lkX2dlbmVyYXRpb24gKQogICAgICAgICByZXR1cm4gMDsKIAogICAgIC8qIElmIHRo
ZXJlIGFyZSBubyBmcmVlIEFTSURzLCBuZWVkIHRvIGdvIHRvIGEgbmV3IGdlbmVyYXRpb24gKi8K
QEAgLTEzNSw3ICsxMzUsNyBAQCBib29sX3QgaHZtX2FzaWRfaGFuZGxlX3ZtZW50ZXIoc3RydWN0
IGh2bV92Y3B1X2FzaWQgKmFzaWQpCiAKICAgICAvKiBOb3cgZ3VhcmFudGVlZCB0byBiZSBhIGZy
ZWUgQVNJRC4gKi8KICAgICBhc2lkLT5hc2lkID0gZGF0YS0+bmV4dF9hc2lkKys7Ci0gICAgYXNp
ZC0+Z2VuZXJhdGlvbiA9IGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uOworICAgIHdyaXRlX2F0
b21pYygmYXNpZC0+Z2VuZXJhdGlvbiwgZGF0YS0+Y29yZV9hc2lkX2dlbmVyYXRpb24pOwogCiAg
ICAgLyoKICAgICAgKiBXaGVuIHdlIGFzc2lnbiBBU0lEIDEsIGZsdXNoIGFsbCBUTEIgZW50cmll
cyBhcyB3ZSBhcmUgc3RhcnRpbmcgYSBuZXcKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
