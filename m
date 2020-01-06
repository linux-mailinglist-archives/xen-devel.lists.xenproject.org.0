Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B6113157E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:56:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUiB-0003kW-6U; Mon, 06 Jan 2020 15:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioUi8-0003kA-Tr
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:54:32 +0000
X-Inumbo-ID: d0c5a7eb-309c-11ea-ab26-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0c5a7eb-309c-11ea-ab26-12813bfff9fa;
 Mon, 06 Jan 2020 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578326069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1QQNGdVLsqA8MSMRT0Tt/3LuVFoJTdQw8tSLXWITNY=;
 b=Plq+4N5ZuWmBRcG+h6Q2Z27yWLnhK0/2gfAEGEisBh1tw/Uy0p/fI1mw
 kXXOYXKTfbU48Vm4FP4O8vrAHcnJ8zNqO7gZA9F1VcqRP58HE+RfvoSI6
 iuHRUwxo21Yntldy6V0soXHCCCS2y53fep/KdYHidLwgkiUNUNZbKDVqX c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OvLEHby7a+9edCimvODcdR0KiS6pIqhKywKkrI8BaLp8jatGcizTf05GmFrYQYJzVDHyHoP3cK
 mTe8qKEwVc+QtNVmYx8vdMN2xCex6hf/sJZmszs8WV0GJMIN0nPRfv2Bm8vjivkFKxywmLRhhQ
 pbk6isbkTC7xGJZCKkV2kgFfJ1WgVA6WRM7DveKKBvYxKYTy4vyYMNzJF3n6duv+W7IOcDEyls
 LnvhsUVPzotDYcY3XInQ91AndvSW5361gyX2tAbn3LjSRnvj3+leNEG86Z44x2XbmJOK9zyF6u
 zxo=
X-SBRS: 2.7
X-MesageID: 10517689
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10517689"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 15:54:19 +0000
Message-ID: <20200106155423.9508-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200106155423.9508-1-andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/6] x86/boot: Map the trampoline as read-only
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

Yy9zIGVjOTJmY2QxZDA4LCB3aGljaCBjYXVzZWQgdGhlIHRyYW1wb2xpbmUgR0RUIEFjY2VzcyBi
aXRzIHRvIGJlIHNldCwKcmVtb3ZlZCB0aGUgZmluYWwgd3JpdGVzIHdoaWNoIG9jY3VycmVkIGJl
dHdlZW4gZW5hYmxpbmcgcGFnaW5nIGFuZCBzd2l0Y2hpbmcKdG8gdGhlIGhpZ2ggbWFwcGluZ3Mu
ICBUaGVyZSBkb24ndCBwbGF1c2libHkgbmVlZCB0byBiZSBhbnkgbWVtb3J5IHdyaXRlcyBpbgpm
ZXcgaW5zdHJ1Y3Rpb25zIGlzIHRha2VzIHRvIHBlcmZvcm0gdGhpcyB0cmFuc2l0aW9uLgoKQXMg
YSBjb25zZXF1ZW5jZSwgd2UgY2FuIHJlbW92ZSB0aGUgUldYIG1hcHBpbmcgb2YgdGhlIHRyYW1w
b2xpbmUuICBJdCBpcyBSWAp2aWEgaXRzIGlkZW50aXR5IG1hcHBpbmcgYmVsb3cgMU0sIGFuZCBS
VyB2aWEgdGhlIGRpcmVjdG1hcC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKVGhpcyBwcm9iYWJseSB3YW50cyBiYWNrcG9ydGluZywgYWxvbmdz
aWRlIGVjOTJmY2QxZDA4IGlmIGl0IGhhc24ndCB5ZXQuCi0tLQogeGVuL2FyY2gveDg2L3g4Nl82
NC9tbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9tbS5jCmluZGV4IDhlYTA5ZWNjMzAuLmI3Y2U4MzNmZmMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYworKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAg
LTY5OSw3ICs2OTksNyBAQCB2b2lkIF9faW5pdCB6YXBfbG93X21hcHBpbmdzKHZvaWQpCiAgICAg
LyogUmVwbGFjZSB3aXRoIG1hcHBpbmcgb2YgdGhlIGJvb3QgdHJhbXBvbGluZSBvbmx5LiAqLwog
ICAgIG1hcF9wYWdlc190b194ZW4odHJhbXBvbGluZV9waHlzLCBtYWRkcl90b19tZm4odHJhbXBv
bGluZV9waHlzKSwKICAgICAgICAgICAgICAgICAgICAgIFBGTl9VUCh0cmFtcG9saW5lX2VuZCAt
IHRyYW1wb2xpbmVfc3RhcnQpLAotICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklT
T1IpOworICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1JfUlgpOwogfQogCiBp
bnQgc2V0dXBfY29tcGF0X2FyZ194bGF0KHN0cnVjdCB2Y3B1ICp2KQotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
