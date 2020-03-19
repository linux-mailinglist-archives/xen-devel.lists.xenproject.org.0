Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0E18BB20
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:29:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEx4E-0003PP-Uv; Thu, 19 Mar 2020 15:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEx4D-0003Or-H7
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:26:41 +0000
X-Inumbo-ID: 0590e394-69f6-11ea-bc31-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0590e394-69f6-11ea-bc31-12813bfff9fa;
 Thu, 19 Mar 2020 15:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584631596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gx3n03GdIkTIW+JLb46tieM2d3B+HVI3//jmwt8huEU=;
 b=g9GAj5sgOSyxA3FaXc9OQX8sdESvUycd8UxnldHOmg1nIFKH5fW2I8qz
 IZpNcsmoNiFciKfZBzomm+aEjAIqjXljAEzP7sZUpYKUItfBlw39MuStI
 xVxgPOzMnT2WXRNUOyVMtYb71cB6bq/bk8ebbzVRPhv6rFfTG480EmTN+ g=;
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
IronPort-SDR: U2+/gQ1FI8o0WpXteChVjPVyMPNkMDC+w5luN/t7292xVlIzM9iD+/HK4EpxAxK2vD02J9GH0V
 w0td7tuEJgYW6NK9HZBztQfUN9O0qVDxFXqZdQQThoAq3UadDfAlg5AYrijdQ0SORui0ZMvAYo
 CpMhVYz/hfQGSlBSfCC20hvXwQjcHDSMfwYDprDPgZb3cI9K26cgkx+DdDapu3k4ZbvhYyMbJb
 fXSXBbhmjZjKHuQNH1eZPtIUY3A6ZegnvU31EywEBubFlOf9Dtt1nalMGhLCQ6WBGCww50Dw0B
 Pbs=
X-SBRS: 2.7
X-MesageID: 14927764
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14927764"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 15:26:21 +0000
Message-ID: <20200319152622.31758-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200319152622.31758-1-andrew.cooper3@citrix.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/6] x86/ucode: Alter ops->free_patch() to free
 the entire patch
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

VGhlIGRhdGEgbGF5b3V0IGZvciBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoIGlzIGV4dHJlbWVseSBw
b29yLCBhbmQKdW5uZWNlc3NhcmlseSBjb21wbGljYXRlZC4gIEFsbW9zdCBhbGwgb2YgaXQgaXMg
b3BhcXVlIHRvIGNvcmUuYywgd2l0aCB0aGUKZXhjZXB0aW9uIG9mIGZyZWVfcGF0Y2goKS4KCk1v
dmUgdGhlIHJlc3BvbnNpYmlsaXR5IGZvciBmcmVlaW5nIHRoZSBwYXRjaCBpbnRvIHRoZSBmcmVl
X3BhdGNoKCkgaG9vaywKd2hpY2ggd2lsbCBhbGxvdyBlYWNoIGRyaXZlciB0byBkbyBhIGJldHRl
ciBqb2IuICBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBtYWtlCnRoZSBob29rcyBpZGVtcG90ZW50
LgoKTm8gcHJhY3RpY2FsIGNoYW5nZSBpbiBiZWhhdmlvdXIuCgpTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNo
IDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L21p
Y3JvY29kZS9hbWQuYyAgICAgfCAxNyArKysrKysrKysrKystLS0tLQogeGVuL2FyY2gveDg2L2Nw
dS9taWNyb2NvZGUvY29yZS5jICAgIHwgIDMgKy0tCiB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29k
ZS9pbnRlbC5jICAgfCAgOCArKysrKystLQogeGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJp
dmF0ZS5oIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvYW1kLmMg
Yi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwppbmRleCA3NjhmYmNmMzIyLi43N2U1
ODJjOGUxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYworKysg
Yi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9hbWQuYwpAQCAtMTgwLDEwICsxODAsOCBAQCBz
dGF0aWMgYm9vbCBtYXRjaF9jcHUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gp
CiAgICAgcmV0dXJuIHBhdGNoICYmIChtaWNyb2NvZGVfZml0cyhwYXRjaC0+bWNfYW1kKSA9PSBO
RVdfVUNPREUpOwogfQogCi1zdGF0aWMgdm9pZCBmcmVlX3BhdGNoKHZvaWQgKm1jKQorc3RhdGlj
IHZvaWQgZnJlZV9tY19hbWQoc3RydWN0IG1pY3JvY29kZV9hbWQgKm1jX2FtZCkKIHsKLSAgICBz
dHJ1Y3QgbWljcm9jb2RlX2FtZCAqbWNfYW1kID0gbWM7Ci0KICAgICBpZiAoIG1jX2FtZCApCiAg
ICAgewogICAgICAgICB4ZnJlZShtY19hbWQtPmVxdWl2X2NwdV90YWJsZSk7CkBAIC0xOTIsNiAr
MTkwLDE1IEBAIHN0YXRpYyB2b2lkIGZyZWVfcGF0Y2godm9pZCAqbWMpCiAgICAgfQogfQogCitz
dGF0aWMgdm9pZCBmcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQorewor
ICAgIGlmICggcGF0Y2ggKQorICAgIHsKKyAgICAgICAgZnJlZV9tY19hbWQocGF0Y2gtPm1jX2Ft
ZCk7CisgICAgICAgIHhmcmVlKHBhdGNoKTsKKyAgICB9Cit9CisKIHN0YXRpYyBlbnVtIG1pY3Jv
Y29kZV9tYXRjaF9yZXN1bHQgY29tcGFyZV9oZWFkZXIoCiAgICAgY29uc3Qgc3RydWN0IG1pY3Jv
Y29kZV9oZWFkZXJfYW1kICpuZXdfaGVhZGVyLAogICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
aGVhZGVyX2FtZCAqb2xkX2hlYWRlcikKQEAgLTU2NCwxMiArNTcxLDEyIEBAIHN0YXRpYyBzdHJ1
Y3QgbWljcm9jb2RlX3BhdGNoICpjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVm
LAogICAgICAgICAgICAgcGF0Y2gtPm1jX2FtZCA9IG1jX2FtZDsKICAgICAgICAgZWxzZQogICAg
ICAgICB7Ci0gICAgICAgICAgICBmcmVlX3BhdGNoKG1jX2FtZCk7CisgICAgICAgICAgICBmcmVl
X21jX2FtZChtY19hbWQpOwogICAgICAgICAgICAgZXJyb3IgPSAtRU5PTUVNOwogICAgICAgICB9
CiAgICAgfQogICAgIGVsc2UKLSAgICAgICAgZnJlZV9wYXRjaChtY19hbWQpOworICAgICAgICBm
cmVlX21jX2FtZChtY19hbWQpOwogCiAgIG91dDoKICAgICBpZiAoIGVycm9yICYmICFwYXRjaCAp
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9jb3JlLmMgYi94ZW4vYXJj
aC94ODYvY3B1L21pY3JvY29kZS9jb3JlLmMKaW5kZXggNjFlNGI5YjdhYi4uMzAwMTdlM2UwZiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvY29yZS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9jcHUvbWljcm9jb2RlL2NvcmUuYwpAQCAtMjQ1LDggKzI0NSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXJzZV9ibG9iKGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90
IGxlbikKIAogc3RhdGljIHZvaWQgbWljcm9jb2RlX2ZyZWVfcGF0Y2goc3RydWN0IG1pY3JvY29k
ZV9wYXRjaCAqbWljcm9jb2RlX3BhdGNoKQogewotICAgIG1pY3JvY29kZV9vcHMtPmZyZWVfcGF0
Y2gobWljcm9jb2RlX3BhdGNoLT5tYyk7Ci0gICAgeGZyZWUobWljcm9jb2RlX3BhdGNoKTsKKyAg
ICBtaWNyb2NvZGVfb3BzLT5mcmVlX3BhdGNoKG1pY3JvY29kZV9wYXRjaCk7CiB9CiAKIC8qIFJl
dHVybiB0cnVlIGlmIGNhY2hlIGdldHMgdXBkYXRlZC4gT3RoZXJ3aXNlLCByZXR1cm4gZmFsc2Ug
Ki8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMgYi94ZW4v
YXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jCmluZGV4IDQ4NTQ0ZThkNmQuLjBlNmJhNTAw
NDggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMKKysrIGIv
eGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYwpAQCAtMjQ4LDkgKzI0OCwxMyBAQCBz
dGF0aWMgYm9vbCBtYXRjaF9jcHUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gp
CiAgICAgcmV0dXJuIG1pY3JvY29kZV91cGRhdGVfbWF0Y2goJnBhdGNoLT5tY19pbnRlbC0+aGRy
KSA9PSBORVdfVUNPREU7CiB9CiAKLXN0YXRpYyB2b2lkIGZyZWVfcGF0Y2godm9pZCAqbWMpCitz
dGF0aWMgdm9pZCBmcmVlX3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQogewot
ICAgIHhmcmVlKG1jKTsKKyAgICBpZiAoIHBhdGNoICkKKyAgICB7CisgICAgICAgIHhmcmVlKHBh
dGNoLT5tY19pbnRlbCk7CisgICAgICAgIHhmcmVlKHBhdGNoKTsKKyAgICB9CiB9CiAKIHN0YXRp
YyBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgY29tcGFyZV9wYXRjaCgKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUuaCBiL3hlbi9hcmNoL3g4Ni9jcHUv
bWljcm9jb2RlL3ByaXZhdGUuaAppbmRleCBjMzJkZGM4ZDE5Li44OTdkMzJhOGU5IDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oCkBAIC0yNiw3ICsyNiw3IEBAIHN0cnVjdCBtaWNy
b2NvZGVfb3BzIHsKICAgICBpbnQgKCphcHBseV9taWNyb2NvZGUpKGNvbnN0IHN0cnVjdCBtaWNy
b2NvZGVfcGF0Y2ggKnBhdGNoKTsKICAgICBpbnQgKCpzdGFydF91cGRhdGUpKHZvaWQpOwogICAg
IHZvaWQgKCplbmRfdXBkYXRlX3BlcmNwdSkodm9pZCk7Ci0gICAgdm9pZCAoKmZyZWVfcGF0Y2gp
KHZvaWQgKm1jKTsKKyAgICB2b2lkICgqZnJlZV9wYXRjaCkoc3RydWN0IG1pY3JvY29kZV9wYXRj
aCAqcGF0Y2gpOwogICAgIGJvb2wgKCptYXRjaF9jcHUpKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKnBhdGNoKTsKICAgICBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgKCpjb21wYXJl
X3BhdGNoKSgKICAgICAgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3LCBjb25z
dCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpvbGQpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
