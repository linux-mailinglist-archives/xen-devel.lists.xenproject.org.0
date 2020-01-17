Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21614126F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:45:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYRw-0004wt-UT; Fri, 17 Jan 2020 20:42:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J6zi=3G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isYRv-0004wO-Rs
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:42:35 +0000
X-Inumbo-ID: deefea4e-3969-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deefea4e-3969-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 20:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579293748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aaCbd9IqUu3Qqd0AvKrq0sbj/fLiW4Y6yrFMhdDy9tQ=;
 b=e1faqm3RlWsUy822wT2QSXilHQPstEzkbpspqHHwlnS025kaoQ0fou3K
 mOBLaZxqTtbAKoQ3d/6eFMYK5VAsLCwNcyyuX4FsYX1ys3tYcW9+2F0F8
 FWPtdANB1ts5ab56lWV+5Ztie3GHgEwX5HX+MQSaJJ3zcI4QyP+NO7wEt I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IuN9u8euvusJWsd6U6aMnshXDxBkqV3EGD/QluboA6QQmUoYqM2QiG2UnFimT9qDlcEkDruQ6i
 a+5Gtuoqvh3uvRBJlpY9zpOLBOLJNr/QhgqZS/qe95stXothLDrZvrVkIDV8v/6BwlQXrg6PZQ
 b0kvQ2hekyyjhrpveqlRUpnQDJzmhhp6a9GdGwppD49D5PzkfyXgxkB5631hBFrEwcllKYWN4n
 TpBYDIRahsfFM67NDMuMdyax3vbPF8s0lj0tgBX6a+UCYInPqShAJvIzn5H6bKYxicVcebfElj
 2TM=
X-SBRS: 2.7
X-MesageID: 11264485
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11264485"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 20:42:18 +0000
Message-ID: <20200117204223.30076-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/5] x86: Remove more 16M total-size
 restrictions
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGJvb3QvZGlyZWN0bWFwIHBhZ2V0YWJsZXMsIGhpZ2ggWGVuIHBhZ2V0YWJsZXMsIGFuZCB1
c2Ugb2YgQk9PVF9GUyBhbGwKY29tZSB3aXRoIGFyYml0cmFyeSBsaW1pdGF0aW9ucyB0byBYZW4n
cyB0b3RhbCBzaXplLiAgUmVtb3ZlIHRoZXNlIGxpbWl0cy4KClRlc3Rpbmcgb2YgdGhlIEVGSSBi
dWlsZCBpbmRpY2F0ZXMgdGhhdCB0aGVyZSBpcyBzdGlsbCBhbiBpc3N1ZSBsdXJraW5nCnNvbWV3
aGVyZToKCiAgKFhFTikgLS0tLVsgWGVuLTQuMTQtdW5zdGFibGUgIHg4Nl82NCAgZGVidWc9eSAg
IE5vdCB0YWludGVkIF0tLS0tCiAgKFhFTikgQ1BVOiAgICAwCiAgKFhFTikgUklQOiAgICBlMDA4
Ols8ZmZmZjgyZDA4MDI1NTdmYT5dIGRyaXZlcnMvY2hhci9uczE2NTUwLmMjbnMxNjU1MF9wb2xs
KzB4MWQvMHgyMQogIC4uLgogIChYRU4pIFhlbiBjYWxsIHRyYWNlOgogIChYRU4pICAgIFs8ZmZm
ZjgyZDA4MDI1NTdmYT5dIFIgZHJpdmVycy9jaGFyL25zMTY1NTAuYyNuczE2NTUwX3BvbGwrMHgx
ZC8weDIxCiAgKFhFTikgICAgWzxmZmZmODJkMDgwMjQ3NDQ2Pl0gRiBjb21tb24vdGltZXIuYyNl
eGVjdXRlX3RpbWVyKzB4NDkvMHg2NAogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI0N2MyND5dIEYg
Y29tbW9uL3RpbWVyLmMjdGltZXJfc29mdGlycV9hY3Rpb24rMHhhMi8weDI3NgogIChYRU4pICAg
IFs8ZmZmZjgyZDA4MDI0M2I4MT5dIEYgY29tbW9uL3NvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg3
MS8weDlhCiAgKFhFTikgICAgWzxmZmZmODJkMDgwMjQzYmRkPl0gRiBwcm9jZXNzX3BlbmRpbmdf
c29mdGlycXMrMHgzMy8weDM3CiAgKFhFTikgICAgWzxmZmZmODJkMDgxMmJkMWJlPl0gRiBfX2Nw
dV91cCsweDY1Mi8weDcxOQogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIwNDg3ND5dIEYgY3B1X3Vw
KzB4NzUvMHhlMwogIChYRU4pICAgIFs8ZmZmZjgyZDA4MTYyYWQ0Mz5dIEYgX19zdGFydF94ZW4r
MHgyNTFhLzB4MjliMQogIChYRU4pCiAgKFhFTikKICAoWEVOKSAqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCiAgKFhFTikgUGFuaWMgb24gQ1BVIDA6CiAgKFhFTikgRkFU
QUwgVFJBUDogdmVjdG9yID0gNiAoaW52YWxpZCBvcGNvZGUpCiAgKFhFTikgKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgoKd2hpY2ggaXMgcnVuX2luX2V4Y2VwdGlvbl9o
YW5kbGVyKCkgbm90IGJlaW5nIHJlY29nbmlzZWQgYXMgQlVHRlJBTUVfcnVuX2ZuLgpUaGVyZWZv
cmUsIEkndmUgbGVmdCB0aGUgbGlua2VyIGFzc2VydCBpbiBwbGFjZSBmb3Igbm93LgoKQW5kcmV3
IENvb3BlciAoNSk6CiAgeDg2L2Jvb3Q6IENyZWF0ZSB0aGUgbDJfeGVubWFwW10gbWFwcGluZ3Mg
ZHluYW1pY2FsbHkKICB4ODYvYm9vdDogU2l6ZSB0aGUgYm9vdC9kaXJlY3RtYXAgbWFwcGluZ3Mg
ZHluYW1pY2FsbHkKICB4ODYvYm9vdDogRHJvcCBleHBsaWNpdCAlZnMgdXNlcwogIHg4Ni9ib290
OiBTaW1wbGlmeSBwYWdldGFibGUgbWFuaXB1bGF0aW9uIGxvb3BzCiAgeDg2L2Jvb3Q6IERyb3Ag
c3ltX2ZzKCkKCiB4ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgICAgICAgfCAxNDUgKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9ib290L3RyYW1w
b2xpbmUuUyB8ICAgMSAtCiB4ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyAgICAgfCAgMjMgKysr
LS0tLQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oICAgIHwgIDM3ICsrKysrKysrKy0tCiB4
ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgfCAgIDMgKwogNSBmaWxlcyBjaGFuZ2VkLCAx
MjYgaW5zZXJ0aW9ucygrKSwgODMgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
