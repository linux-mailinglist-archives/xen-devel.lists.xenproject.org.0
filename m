Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F611737E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 19:10:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieNR4-0004JP-N2; Mon, 09 Dec 2019 18:07:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieNR3-0004JK-5E
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 18:07:05 +0000
X-Inumbo-ID: b3929291-1aae-11ea-883f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3929291-1aae-11ea-883f-12813bfff9fa;
 Mon, 09 Dec 2019 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575914823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0zeRvfytI4Dzk3ZZSs+zZZe4qQ5t9nDHuodQX0YYsLA=;
 b=VWbdPbkMfMDYr3jqfuIfYCTRj9ExW5mn5aPRDl5/mrZAJppJWcsccCNI
 qaLuFcFmrv9+hiJJa91h3KBRPdYDE41saiatrEZGlC2/GcIGQTkio1mDX
 X6ewP2TbnFvCR8S4w+GS41y354UNENteUIak1dR/J0GDf0/RrLWyf4lW1 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1RaazgY9P2k0YLGdT9VwCHLiMaR2zzKXlyUqBYiDlTleCkaWiwAajGDjeWiNWYOWGL79MK0kkh
 lhNDTxh88sRmhZJFkbJfznRFadL7fMzxDna4TMgrSS46EaV2QJI4xuQbgbNJTyXVBPVjVpEH3Q
 3WxWvE17HrJkwpDgUexM/9zzTUSD8YzcTfB5Ra2uvSIFqh6/2yZvUTy8/nyK+ISki44FDA0xHf
 +HKjKaVwEaW+ICe/f2sKQ9rjWAUC4okWu0Ekjbug9t8S0akMQBdOzRg13IcBKASTuSAbYiJ/ZO
 lIc=
X-SBRS: 2.7
X-MesageID: 9972149
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9972149"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Dec 2019 19:06:38 +0100
Message-ID: <20191209180638.47305-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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

Q3VycmVudGx5IGNyNCBpcyBub3QgY2FjaGVkIGJlZm9yZSBzdXNwZW5zaW9uLCBhbmQgbW11X2Ny
NF9mZWF0dXJlcyBpcwp1c2VkIGluIG9yZGVyIHRvIHJlc3RvcmUgdGhlIGV4cGVjdGVkIGNyNCB2
YWx1ZS4gVGhpcyBpcyBjb3JyZWN0IHNvCmZhciBiZWNhdXNlIHRoZSB0YXNrbGV0IHRoYXQgZXhl
Y3V0ZXMgdGhlIHN1c3BlbmQvcmVzdW1lIGNvZGUgaXMKcnVubmluZyBpbiB0aGUgaWRsZSB2Q1BV
IGNvbnRleHQuCgpJbiBvcmRlciB0byBtYWtlIHRoZSBjb2RlIGxlc3MgZnJhZ2lsZSwgZXhwbGlj
aXRseSBzYXZlIHRoZSBjdXJyZW50CmNyNCB2YWx1ZSBiZWZvcmUgc3VzcGVuc2lvbiwgc28gdGhh
dCBpdCBjYW4gYmUgcmVzdG9yZWQgYWZ0ZXJ3YXJkcy4KVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGNy
NCB2YWx1ZSBjYWNoZWQgaW4gdGhlIGNwdV9pbmZvIGRvZXNuJ3QgZ2V0IG91dApvZiBzeW5jIGFm
dGVyIHJlc3VtZSBmcm9tIHN1c3BlbnNpb24uCgpTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyB8IDcg
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TIGIveGVuL2FyY2gv
eDg2L2FjcGkvd2FrZXVwX3Byb3QuUwppbmRleCA3NDI2MWNiNGYxLi41NzQzMWU0ZTJkIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TCisrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL3dha2V1cF9wcm90LlMKQEAgLTQwLDYgKzQwLDkgQEAgRU5UUlkoZG9fc3VzcGVuZF9s
b3dsZXZlbCkKICAgICAgICAgbW92ICAgICAlY3IzLCBHUkVHKGF4KQogICAgICAgICBtb3YgICAg
IEdSRUcoYXgpLCBSRUYoc2F2ZWRfY3IzKQogCisgICAgICAgIG1vdiAgICAgJWNyNCwgR1JFRyhh
eCkKKyAgICAgICAgbW92ICAgICBHUkVHKGF4KSwgUkVGKHNhdmVkX2NyNCkKKwogICAgICAgICBj
YWxsICAgIHNhdmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUKIAogICAgICAgICBtb3YgICAgICQzLCAl
cmRpCkBAIC01Myw4ICs1Niw3IEBAIEVOVFJZKGRvX3N1c3BlbmRfbG93bGV2ZWwpCiBFTlRSWShf
X3JldF9wb2ludCkKICAgICAgICAgbGdkdCAgICBib290X2dkdHIoJXJpcCkKIAotICAgICAgICAv
KiBtbXVfY3I0X2ZlYXR1cmVzIGNvbnRhaW5zIGxhdGVzdCBjcjQgc2V0dGluZyAqLwotICAgICAg
ICBtb3YgICAgIFJFRihtbXVfY3I0X2ZlYXR1cmVzKSwgR1JFRyhheCkKKyAgICAgICAgbW92ICAg
ICBSRUYoc2F2ZWRfY3I0KSwgR1JFRyhheCkKICAgICAgICAgbW92ICAgICBHUkVHKGF4KSwgJWNy
NAogCiAgICAgICAgIG1vdiAgICAgUkVGKHNhdmVkX2NyMyksIEdSRUcoYXgpCkBAIC0xMjQsMyAr
MTI2LDQgQEAgREVDTEFSRV9HUkVHKDE1KQogCiBzYXZlZF9jcjA6ICAgICAgLnF1YWQgICAwCiBz
YXZlZF9jcjM6ICAgICAgLnF1YWQgICAwCitzYXZlZF9jcjQ6ICAgICAgLnF1YWQgICAwCi0tIAoy
LjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
