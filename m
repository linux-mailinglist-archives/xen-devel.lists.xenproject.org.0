Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC9916A443
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:49:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6BGd-0004vG-Fn; Mon, 24 Feb 2020 10:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6BGc-0004ui-E9
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:47:14 +0000
X-Inumbo-ID: ff593ac9-56f2-11ea-8ae3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff593ac9-56f2-11ea-8ae3-12813bfff9fa;
 Mon, 24 Feb 2020 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582541227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZGAL5hiLy9HUPmxEbmzKb3cybQ/vBg7leeFHU/gW84=;
 b=TwnI6wn9dhDFpoMzNS0MMHMnSynbIoR1dMlNn20HSFgMgGVp4fb419HM
 srEdG+0WkRZTZBwTt1zAAHWOnXUp7hXBrjbmX6iBb2P1mSK0VQhz6ffMh
 cJ9rpQ4REjtWDjSHTkBQJkXA4kVvM0Xi62GYjBtFWVe1JCLe0XwI6U7/4 I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AN9iZEfhtX8i4tJ5QYK7IOk1OXNMp5Hu6tLS9AUJjQo8NKU7/5E6prgdWvF9C8EkiTkZPaaLAr
 pDLBmbzRqiFITbnxOh37FvM2ycWbUle5Nck9rmVTJBesoOA0C/17Uq1S+OGJc/FDsxLZmob0ST
 pMyra9SdluymrJh+Fw9unlynHU30JiLWzFkU0JXIPM2F1/OK9M7KpwpuMLS2NGEX/n5JXEm0xP
 B3yUXxjSKn+a58ddiPgtwBPle4kX8SCZoR8VcUb0zmNx8pFRIkd3P+D/DGBGYcyR7XMK5R+D8C
 +vU=
X-SBRS: 2.7
X-MesageID: 13255827
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13255827"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 11:46:42 +0100
Message-ID: <20200224104645.96381-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224104645.96381-1-roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/5] x86: track when in #NMI context
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBydW5uaW5nIGluICNOTUkgY29udGV4dC4gVGhpcyBp
cyBtb2RlbGVkCmFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4KClRoZSBTRE0gc3RhdGVzIHRoYXQg
bm8gI05NSSBjYW4gYmUgZGVsaXZlcmVkIHdoaWxlIGhhbmRsaW5nIGEgI05NSQp1bnRpbCB0aGUg
cHJvY2Vzc29yIGhhcyBleGVjdXRlZCBhbiBpcmV0IGluc3RydWN0aW9uLiBJdCdzIHBvc3NpYmxl
Cmhvd2V2ZXIgdGhhdCBhbm90aGVyIGZhdWx0IGlzIHJlY2VpdmVkIHdoaWxlIGhhbmRsaW5nIHRo
ZSAjTk1JIChhICNNQwpmb3IgZXhhbXBsZSksIGFuZCB0aHVzIHRoZSBpcmV0IGZyb20gdGhhdCBm
YXVsdCB3b3VsZCBhbGxvdyBmdXJ0aGVyCiNOTUlzIHRvIGJlIGluamVjdGVkIHdoaWxlIHN0aWxs
IHByb2Nlc3NpbmcgdGhlIHByZXZpb3VzIG9uZSwgYW5kCmhlbmNlIGFuIGludGVnZXIgaXMgbmVl
ZGVkIGluIG9yZGVyIHRvIGtlZXAgdHJhY2sgb2YgaW4gc2VydmljZSAjTk1Jcy4KCldoaWxlIHRo
ZXJlIG1vdmUgbm1pX2NvdW50KCkgaW50byBhIHg4NiBzcGVjaWZpYyBoZWFkZXIgYW5kIGRyb3Ag
dGhlCmxlYWRpbmcgdW5kZXJzY29yZXMgZnJvbSBfX25taV9jb3VudCBmaWVsZC4KCk5vdGUgdGhh
dCB0aGVyZSBhcmUgbm8gdXNlcnMgb2YgaW5fbm1pKCkgaW50cm9kdWNlZCBieSB0aGUgY2hhbmdl
LApmdXJ0aGVyIHVzZXJzIHdpbGwgYmUgYWRkZWQgYnkgZm9sbG93dXAgY2hhbmdlcy4KClNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2hh
bmdlcyBzaW5jZSB2MjoKIC0gVXNlIGFuIGludGVnZXIgaW5zdGVhZCBvZiBhIGJvb2xlYW4gdG8g
a2VlcCB0cmFjayBvZiBpbiBzZXJ2aWNlCiAgICNOTUlzLgogLSBNb3ZlIG5taV9jb3VudCBpbnRv
IHg4NiBzcGVjaWZpYyBoZWFkZXIuCiAtIERyb3AgbGVhZGluZyB1bmRlcnNjb3JlcyBmcm9tIF9f
bm1pX2NvdW50IGZpZWxkLgotLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgIHwgNiAr
KysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGlycS5oIHwgNyArKysrKystCiB4ZW4vaW5j
bHVkZS94ZW4vaXJxX2NwdXN0YXQuaCB8IDEgLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5j
IGIveGVuL2FyY2gveDg2L3RyYXBzLmMKaW5kZXggM2RiYzY2YmI2NC4uZjRmMmMxM2FlOSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMK
QEAgLTE2OTIsOSArMTY5MiwxMyBAQCB2b2lkIGRvX25taShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykKICAgICBib29sIGhhbmRsZV91bmtub3duID0gZmFsc2U7CiAKICAgICB0aGlz
X2NwdShubWlfY291bnQpKys7CisgICAgbm1pX2VudGVyKCk7CiAKICAgICBpZiAoIG5taV9jYWxs
YmFjayhyZWdzLCBjcHUpICkKKyAgICB7CisgICAgICAgIG5taV9leGl0KCk7CiAgICAgICAgIHJl
dHVybjsKKyAgICB9CiAKICAgICAvKgogICAgICAqIEFjY2Vzc2luZyBwb3J0IDB4NjEgbWF5IHRy
YXAgdG8gU01NIHdoaWNoIGhhcyBiZWVuIGFjdHVhbGx5CkBAIC0xNzIwLDYgKzE3MjQsOCBAQCB2
b2lkIGRvX25taShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICAgICAgaWYg
KCAhKHJlYXNvbiAmIDB4YzApICYmIGhhbmRsZV91bmtub3duICkKICAgICAgICAgICAgIHVua25v
d25fbm1pX2Vycm9yKHJlZ3MsIHJlYXNvbik7CiAgICAgfQorCisgICAgbm1pX2V4aXQoKTsKIH0K
IAogbm1pX2NhbGxiYWNrX3QgKnNldF9ubWlfY2FsbGJhY2sobm1pX2NhbGxiYWNrX3QgKmNhbGxi
YWNrKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmggYi94ZW4vaW5j
bHVkZS9hc20teDg2L2hhcmRpcnEuaAppbmRleCAzNGUxYjQ5MjYwLi42Y2NjZTc1ODgxIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaAorKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2hhcmRpcnEuaApAQCAtNyw3ICs3LDcgQEAKIHR5cGVkZWYgc3RydWN0IHsKIAl1bnNp
Z25lZCBpbnQgX19zb2Z0aXJxX3BlbmRpbmc7CiAJdW5zaWduZWQgaW50IF9fbG9jYWxfaXJxX2Nv
dW50OwotCXVuc2lnbmVkIGludCBfX25taV9jb3VudDsKKwl1bnNpZ25lZCBpbnQgbm1pX2NvdW50
OwogCWJvb2xfdCBfX213YWl0X3dha2V1cDsKIH0gX19jYWNoZWxpbmVfYWxpZ25lZCBpcnFfY3B1
c3RhdF90OwogCkBAIC0xOCw2ICsxOCwxMSBAQCB0eXBlZGVmIHN0cnVjdCB7CiAjZGVmaW5lIGly
cV9lbnRlcigpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQogI2RlZmlu
ZSBpcnFfZXhpdCgpCShsb2NhbF9pcnFfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQogCisj
ZGVmaW5lIG5taV9jb3VudChjcHUpCV9fSVJRX1NUQVQoKGNwdSksIG5taV9jb3VudCkKKyNkZWZp
bmUgaW5fbm1pKCkJKG5taV9jb3VudChzbXBfcHJvY2Vzc29yX2lkKCkpICE9IDApCisjZGVmaW5l
IG5taV9lbnRlcigpCShubWlfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKSsrKQorI2RlZmluZSBu
bWlfZXhpdCgpCShubWlfY291bnQoc21wX3Byb2Nlc3Nvcl9pZCgpKS0tKQorCiB2b2lkIGFja19i
YWRfaXJxKHVuc2lnbmVkIGludCBpcnEpOwogCiBleHRlcm4gdm9pZCBhcGljX2ludHJfaW5pdCh2
b2lkKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pcnFfY3B1c3RhdC5oIGIveGVuL2lu
Y2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKaW5kZXggNzM2MjlmNmVjOC4uYjk2MjlmMjVjMiAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2lycV9jcHVzdGF0LmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL2lycV9jcHVzdGF0LmgKQEAgLTI0LDcgKzI0LDYgQEAgZXh0ZXJuIGlycV9jcHVzdGF0X3Qg
aXJxX3N0YXRbXTsKICAgLyogYXJjaCBpbmRlcGVuZGVudCBpcnFfc3RhdCBmaWVsZHMgKi8KICNk
ZWZpbmUgc29mdGlycV9wZW5kaW5nKGNwdSkJX19JUlFfU1RBVCgoY3B1KSwgX19zb2Z0aXJxX3Bl
bmRpbmcpCiAjZGVmaW5lIGxvY2FsX2lycV9jb3VudChjcHUpCV9fSVJRX1NUQVQoKGNwdSksIF9f
bG9jYWxfaXJxX2NvdW50KQotI2RlZmluZSBubWlfY291bnQoY3B1KQkJX19JUlFfU1RBVCgoY3B1
KSwgX19ubWlfY291bnQpCiAjZGVmaW5lIG13YWl0X3dha2V1cChjcHUpCV9fSVJRX1NUQVQoKGNw
dSksIF9fbXdhaXRfd2FrZXVwKQogCiAjZW5kaWYJLyogX19pcnFfY3B1c3RhdF9oICovCi0tIAoy
LjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
