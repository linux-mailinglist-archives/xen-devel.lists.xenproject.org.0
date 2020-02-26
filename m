Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A546B170989
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:26:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73CP-0003ir-P0; Wed, 26 Feb 2020 20:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73CO-0003ih-13
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:28 +0000
X-Inumbo-ID: b4212d10-58d5-11ea-94dc-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4212d10-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xtUBUmH4EQzi1S/Wa1S08vzOPzVv8vAHSz85LL5/5ls=;
 b=c2+IAB47rqGpt2mibUZaML6JHW4WISUEKCw9JmXsywgJXZmKUJX3ry5o
 tteTvpwcV5SvSBtKOdadmtpH5zF7ps5nEk7XxK2kapL8gtOWUetbVT9fu
 MiN50ePZXq8ndTRP/GCM40a1lapYR8m26QXWTyjcjqO/dPlGPnLMARZEN U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: p7asNZjil5FEVuwRXOTwyq2ukGdfxpzxyTe52S4ZjD9Xwsb4vY9Yu4LIvs/Sj0cr75Rgzv6eMK
 9msx0szQP6obUY3aVqur3Q3TDGTjeukJF+7bJhCZQs2kBxY3VUBBupgN8PhiKK//lpQ0FUHiQo
 DEGjLF3O60As5GcArVnmLeQi7RQeEJB3tPd+GQKHRU5poESI6mw24SSo7fGL0wrk8ayQYHX6ot
 LNb48Wv2BDmiHoUfthn076RPk/03bRBXOy6QuZ7m8M+a3LSuroQarkHQroB7StkqPgrNeMDWdk
 FbA=
X-SBRS: 2.7
X-MesageID: 13496567
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13496567"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:13 +0000
Message-ID: <20200226202221.6555-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 02/10] tools/libxc: Simplify
 xc_get_static_cpu_featuremask()
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

RHJvcCBYQ19GRUFUVVJFTUFTS19ERUVQX0ZFQVRVUkVTLiAgSXQgaXNuJ3QgdXNlZCBieSBhbnkg
Y2FsbGVycywgYW5kIHVubGlrZQp0aGUgb3RoZXIgc3RhdGljIG1hc2tzLCB3b24ndCBiZSBvZiBp
bnRlcmVzdCB0byBhbnlvbmUgd2l0aG91dCBvdGhlciBwaWVjZXMgb2YKY3B1aWQtYXV0b2dlbi5o
CgpJbiB4Y19nZXRfc3RhdGljX2NwdV9mZWF0dXJlbWFzaygpLCB1c2UgYSAyZCBhcnJheSBpbnN0
ZWFkIG9mIGluZGl2aWR1YWxseQpuYW1lZCB2YXJpYWJsZXMsIGFuZCBkcm9wIHRoZSBzd2l0Y2gg
c3RhdGVtZW50IGNvbXBsZXRlbHkuCgpObyBwcmFjdGljYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGMv
aW5jbHVkZS94ZW5jdHJsLmggfCAgMSAtCiB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyAgICB8
IDQ2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0
cmwuaAppbmRleCA5OTU1MmE1ZjczLi5kZWMzYzVkZTJiIDEwMDY0NAotLS0gYS90b29scy9saWJ4
Yy9pbmNsdWRlL3hlbmN0cmwuaAorKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaApA
QCAtMjQ4OCw3ICsyNDg4LDYgQEAgZW51bSB4Y19zdGF0aWNfY3B1X2ZlYXR1cmVtYXNrIHsKICAg
ICBYQ19GRUFUVVJFTUFTS19QViwKICAgICBYQ19GRUFUVVJFTUFTS19IVk1fU0hBRE9XLAogICAg
IFhDX0ZFQVRVUkVNQVNLX0hWTV9IQVAsCi0gICAgWENfRkVBVFVSRU1BU0tfREVFUF9GRUFUVVJF
UywKIH07CiBjb25zdCB1aW50MzJfdCAqeGNfZ2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soZW51
bSB4Y19zdGF0aWNfY3B1X2ZlYXR1cmVtYXNrKTsKIApkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMv
eGNfY3B1aWRfeDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCAyMWIxNWI4
NmVjLi41M2NiNzI0MzhhIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwor
KysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtOTAsNDMgKzkwLDIzIEBAIHVpbnQz
Ml90IHhjX2dldF9jcHVfZmVhdHVyZXNldF9zaXplKHZvaWQpCiBjb25zdCB1aW50MzJfdCAqeGNf
Z2V0X3N0YXRpY19jcHVfZmVhdHVyZW1hc2soCiAgICAgZW51bSB4Y19zdGF0aWNfY3B1X2ZlYXR1
cmVtYXNrIG1hc2spCiB7Ci0gICAgY29uc3Qgc3RhdGljIHVpbnQzMl90IGtub3duW0ZFQVRVUkVT
RVRfTlJfRU5UUklFU10gPSBJTklUX0tOT1dOX0ZFQVRVUkVTLAotICAgICAgICBzcGVjaWFsW0ZF
QVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX1NQRUNJQUxfRkVBVFVSRVMsCi0gICAgICAgIHB2
W0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX1BWX0ZFQVRVUkVTLAotICAgICAgICBodm1f
c2hhZG93W0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSBJTklUX0hWTV9TSEFET1dfRkVBVFVSRVMs
Ci0gICAgICAgIGh2bV9oYXBbRkVBVFVSRVNFVF9OUl9FTlRSSUVTXSA9IElOSVRfSFZNX0hBUF9G
RUFUVVJFUywKLSAgICAgICAgZGVlcF9mZWF0dXJlc1tGRUFUVVJFU0VUX05SX0VOVFJJRVNdID0g
SU5JVF9ERUVQX0ZFQVRVUkVTOwotCi0gICAgQlVJTERfQlVHX09OKEFSUkFZX1NJWkUoa25vd24p
ICE9IEZFQVRVUkVTRVRfTlJfRU5UUklFUyk7Ci0gICAgQlVJTERfQlVHX09OKEFSUkFZX1NJWkUo
c3BlY2lhbCkgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsKLSAgICBCVUlMRF9CVUdfT04oQVJS
QVlfU0laRShwdikgIT0gRkVBVFVSRVNFVF9OUl9FTlRSSUVTKTsKLSAgICBCVUlMRF9CVUdfT04o
QVJSQVlfU0laRShodm1fc2hhZG93KSAhPSBGRUFUVVJFU0VUX05SX0VOVFJJRVMpOwotICAgIEJV
SUxEX0JVR19PTihBUlJBWV9TSVpFKGh2bV9oYXApICE9IEZFQVRVUkVTRVRfTlJfRU5UUklFUyk7
Ci0gICAgQlVJTERfQlVHX09OKEFSUkFZX1NJWkUoZGVlcF9mZWF0dXJlcykgIT0gRkVBVFVSRVNF
VF9OUl9FTlRSSUVTKTsKLQotICAgIHN3aXRjaCAoIG1hc2sgKQotICAgIHsKLSAgICBjYXNlIFhD
X0ZFQVRVUkVNQVNLX0tOT1dOOgotICAgICAgICByZXR1cm4ga25vd247Ci0KLSAgICBjYXNlIFhD
X0ZFQVRVUkVNQVNLX1NQRUNJQUw6Ci0gICAgICAgIHJldHVybiBzcGVjaWFsOwotCi0gICAgY2Fz
ZSBYQ19GRUFUVVJFTUFTS19QVjoKLSAgICAgICAgcmV0dXJuIHB2OworICAgIGNvbnN0IHN0YXRp
YyB1aW50MzJfdCBtYXNrc1tdW0ZFQVRVUkVTRVRfTlJfRU5UUklFU10gPSB7CisjZGVmaW5lIE1B
U0soeCkgW1hDX0ZFQVRVUkVNQVNLXyAjIyB4XSA9IElOSVRfICMjIHggIyMgX0ZFQVRVUkVTCiAK
LSAgICBjYXNlIFhDX0ZFQVRVUkVNQVNLX0hWTV9TSEFET1c6Ci0gICAgICAgIHJldHVybiBodm1f
c2hhZG93OworICAgICAgICBNQVNLKEtOT1dOKSwKKyAgICAgICAgTUFTSyhTUEVDSUFMKSwKKyAg
ICAgICAgTUFTSyhQViksCisgICAgICAgIE1BU0soSFZNX1NIQURPVyksCisgICAgICAgIE1BU0so
SFZNX0hBUCksCiAKLSAgICBjYXNlIFhDX0ZFQVRVUkVNQVNLX0hWTV9IQVA6Ci0gICAgICAgIHJl
dHVybiBodm1faGFwOworI3VuZGVmIE1BU0sKKyAgICB9OworICAgIEJVSUxEX0JVR19PTihBUlJB
WV9TSVpFKG1hc2tzWzBdKSAhPSBGRUFUVVJFU0VUX05SX0VOVFJJRVMpOwogCi0gICAgY2FzZSBY
Q19GRUFUVVJFTUFTS19ERUVQX0ZFQVRVUkVTOgotICAgICAgICByZXR1cm4gZGVlcF9mZWF0dXJl
czsKLQotICAgIGRlZmF1bHQ6CisgICAgaWYgKCAodW5zaWduZWQgaW50KW1hc2sgPj0gQVJSQVlf
U0laRShtYXNrcykgKQogICAgICAgICByZXR1cm4gTlVMTDsKLSAgICB9CisKKyAgICByZXR1cm4g
bWFza3NbbWFza107CiB9CiAKIGludCB4Y19nZXRfY3B1X3BvbGljeV9zaXplKHhjX2ludGVyZmFj
ZSAqeGNoLCB1aW50MzJfdCAqbnJfbGVhdmVzLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
