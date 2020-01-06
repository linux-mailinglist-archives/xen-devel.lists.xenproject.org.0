Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85749131582
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:56:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUiO-0003rL-O7; Mon, 06 Jan 2020 15:54:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nws7=23=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ioUiN-0003r5-Tt
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:54:47 +0000
X-Inumbo-ID: d1c08b1d-309c-11ea-ab26-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1c08b1d-309c-11ea-ab26-12813bfff9fa;
 Mon, 06 Jan 2020 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578326070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=txX+kNmVQApOldC7zBN7Z5xlDpAhIMo8lfoF5L/PkrE=;
 b=hLDtWOEaElzYxLoLoheO38RZIPTB8WQ78RkeIR5hP/akPuIBO3nYfJCC
 yaYGL0hym7bYggb+J010F9+bsi2jGlzQuOjY/UhV1vRs3upwXr8ZxNdwb
 NxnvIRmxyqmsLBSADzAaB7N3yhHE9w4zyYHeAoISkmYlb+NlrEAxAXwBD k=;
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
IronPort-SDR: S5lUoonM/rq6AWq8txQM1THXAI6p9mnvDQr8tlBROtvupKjk4uAeyN4rf8OKAxbYqAwfGYboqc
 EPq7AROT9sAcT3dWa4Qk2KXTtsTKUau0chMW4ro922oSONP4QnchUbrhMxEo3cap6mQfG7ydeb
 mssQY5xfYuWsb6E3gadWMvmIBrlMbLS2SmaVgyTfJNkjYf420OtvVoL/QNDpP7mGA0II5IgLiv
 o1I1x7E7zVuizqMs1BfkPLBhZeiEFUMdV6YOFEKcabwYNDOHuRT4e5Kgg1k4Ab6ZNPnc6YoQ1S
 shw=
X-SBRS: 2.7
X-MesageID: 10489152
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10489152"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 6 Jan 2020 15:54:23 +0000
Message-ID: <20200106155423.9508-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200106155423.9508-1-andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/6] x86/boot: Drop INVALID_VCPU
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

Tm93IHRoYXQgTlVMTCB3aWxsIGZhdWx0IGF0IGJvb3QsIHRoZXJlIGlzIG5vIG5lZWQgZm9yIGEg
c3BlY2lhbCBjb25zdGFudCB0bwpzaWduaWZ5ICJjdXJyZW50IG5vdCBzZXQgdXAgeWV0Ii4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jIHwgMiArLQogeGVuL2FyY2gveDg2L2RvbWFpbl9w
YWdlLmMgICAgfCAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICB8IDIgKy0KIHhl
bi9hcmNoL3g4Ni90Ym9vdC5jICAgICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9z
ZXR1cC5oICAgfCAzIC0tLQogNSBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMgYi94
ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2UuYwppbmRleCBjOGNlY2M0OTc2Li4wYzU3MmIwNGYy
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2UuYworKysgYi94ZW4vYXJj
aC94ODYvY3B1L21jaGVjay9tY2UuYwpAQCAtMjYwLDcgKzI2MCw3IEBAIHN0YXRpYyBpbnQgbWNh
X2luaXRfZ2xvYmFsKHVpbnQzMl90IGZsYWdzLCBzdHJ1Y3QgbWNpbmZvX2dsb2JhbCAqbWlnKQog
ICAgICAgICAgICAgICAgICAgICAgICAgJm1pZy0+bWNfY29yZWlkLCAmbWlnLT5tY19jb3JlX3Ro
cmVhZGlkLAogICAgICAgICAgICAgICAgICAgICAgICAgJm1pZy0+bWNfYXBpY2lkLCBOVUxMLCBO
VUxMLCBOVUxMKTsKIAotICAgIGlmICggY3VyciAhPSBJTlZBTElEX1ZDUFUgKQorICAgIGlmICgg
Y3VyciApCiAgICAgewogICAgICAgICBtaWctPm1jX2RvbWlkID0gY3Vyci0+ZG9tYWluLT5kb21h
aW5faWQ7CiAgICAgICAgIG1pZy0+bWNfdmNwdWlkID0gY3Vyci0+dmNwdV9pZDsKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9kb21haW5fcGFnZS5jIGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdl
LmMKaW5kZXggNGEwN2NmYjE4ZS4uZGQzMjcxMmQyZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2RvbWFpbl9wYWdlLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbl9wYWdlLmMKQEAgLTI5LDcg
KzI5LDcgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdmNwdSAqbWFwY2FjaGVfY3VycmVudF92Y3B1
KHZvaWQpCiAgICAgICogV2hlbiBjdXJyZW50IGlzbid0IHByb3Blcmx5IHNldCB1cCB5ZXQsIHRo
aXMgaXMgZXF1aXZhbGVudCB0bwogICAgICAqIHJ1bm5pbmcgaW4gYW4gaWRsZSB2Q1BVIChjYWxs
ZXJzIG11c3QgY2hlY2sgZm9yIE5VTEwpLgogICAgICAqLwotICAgIGlmICggdiA9PSBJTlZBTElE
X1ZDUFUgKQorICAgIGlmICggIXYgKQogICAgICAgICByZXR1cm4gTlVMTDsKIAogICAgIC8qCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmlu
ZGV4IDQ1MmY1YmRkMzcuLmE3Y2EyMjM2ZjQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1
cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC03MDUsNyArNzA1LDcgQEAgdm9pZCBf
X2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAvKiBD
cml0aWNhbCByZWdpb24gd2l0aG91dCBJRFQgb3IgVFNTLiAgQW55IGZhdWx0IGlzIGRlYWRseSEg
Ki8KIAogICAgIHNldF9wcm9jZXNzb3JfaWQoMCk7Ci0gICAgc2V0X2N1cnJlbnQoSU5WQUxJRF9W
Q1BVKTsgLyogZGVidWcgc2FuaXR5LiAqLworICAgIHNldF9jdXJyZW50KE5VTEwpOyAvKiBkZWJ1
ZyBzYW5pdHkuICovCiAgICAgaWRsZV92Y3B1WzBdID0gY3VycmVudDsKICAgICBpbml0X3NoYWRv
d19zcGVjX2N0cmxfc3RhdGUoKTsKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3Rib290LmMg
Yi94ZW4vYXJjaC94ODYvdGJvb3QuYwppbmRleCAzZTgyOGZlMjA0Li41MDIwYzRhZDQ5IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvdGJvb3QuYworKysgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwpA
QCAtMzkyLDcgKzM5Miw3IEBAIHZvaWQgdGJvb3Rfc2h1dGRvd24odWludDMyX3Qgc2h1dGRvd25f
dHlwZSkKICAgICAgKiBEdXJpbmcgZWFybHkgYm9vdCwgd2UgY2FuIGJlIGNhbGxlZCBieSBwYW5p
YyBiZWZvcmUgaWRsZV92Y3B1WzBdIGlzCiAgICAgICogc2V0dXAsIGJ1dCBpbiB0aGF0IGNhc2Ug
d2UgZG9uJ3QgbmVlZCB0byBjaGFuZ2UgcGFnZSB0YWJsZXMuCiAgICAgICovCi0gICAgaWYgKCBp
ZGxlX3ZjcHVbMF0gIT0gSU5WQUxJRF9WQ1BVICkKKyAgICBpZiAoIGlkbGVfdmNwdVswXSApCiAg
ICAgICAgIHdyaXRlX3B0YmFzZShpZGxlX3ZjcHVbMF0pOwogCiAgICAgKCh2b2lkKCopKHZvaWQp
KSh1bnNpZ25lZCBsb25nKWdfdGJvb3Rfc2hhcmVkLT5zaHV0ZG93bl9lbnRyeSkoKTsKZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
c2V0dXAuaAppbmRleCA4NjFkNDZkNmFjLi4yODI1N2JjNWM4IDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L3NldHVwLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oCkBA
IC00LDkgKzQsNiBAQAogI2luY2x1ZGUgPHhlbi9tdWx0aWJvb3QuaD4KICNpbmNsdWRlIDxhc20v
bnVtYS5oPgogCi0vKiB2Q1BVIHBvaW50ZXIgdXNlZCBwcmlvciB0byB0aGVyZSBiZWluZyBhIHZh
bGlkIG9uZSBhcm91bmQgKi8KLSNkZWZpbmUgSU5WQUxJRF9WQ1BVICgoc3RydWN0IHZjcHUgKikw
eGNjY2NjY2NjY2NjY2MwMDBVTCkKLQogZXh0ZXJuIGNvbnN0IGNoYXIgX18yTV90ZXh0X3N0YXJ0
W10sIF9fMk1fdGV4dF9lbmRbXTsKIGV4dGVybiBjb25zdCBjaGFyIF9fMk1fcm9kYXRhX3N0YXJ0
W10sIF9fMk1fcm9kYXRhX2VuZFtdOwogZXh0ZXJuIGNoYXIgX18yTV9pbml0X3N0YXJ0W10sIF9f
Mk1faW5pdF9lbmRbXTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
