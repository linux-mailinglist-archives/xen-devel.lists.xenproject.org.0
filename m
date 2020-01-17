Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6941406FD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:56:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isOJe-0007wh-UV; Fri, 17 Jan 2020 09:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isOJe-0007wJ-1q
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:53:22 +0000
X-Inumbo-ID: 2f4fce75-390f-11ea-8893-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f4fce75-390f-11ea-8893-12813bfff9fa;
 Fri, 17 Jan 2020 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579254796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wCaqkTQfHuawSxD/a+i/CF+r398ZASYyosYNgEikdi4=;
 b=S7/CPnytuCFdEBcgR0XFTkTN+gc1aCrtfEar4ZPtszs44BlOII0TeHnR
 QgBhAIWyW1jgG8Otltu8E7rYqN7wxK5iBszeiVfVT7g42dal5t8qSWvjq
 4Uu+kPC4I00zrGpEHk/M0Z8xFO/oD8yxMQAirlsQz9jJ5txqxmwwADDBY s=;
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
IronPort-SDR: WxY2CF6E7/S6n8CFNBmwpvPxRicy06PPK6B21XKpUjHaWxNiiduwWOTY42/4cvgFljdWlyxjyj
 X/OY1akIoHsm7m/hTx/MML6+vs3tW0kjNsXwd8YrbO++aAv9muFwnwXYNrRj3q4fULoEXK409e
 KE38gxm2Ht98+H9vlSea8g1hE7qEQkfsOZ+vP+a7HUxlm5/5ELjeyEjokM17PTzbsyFkt3l6/+
 4rSpKi9mrotZt6rxDZ2nwEgzM/Dm6foLjHRcWAkxV2HLwOfgJv9fRYahX0+J+fRsyqzSFcCYnH
 E5Q=
X-SBRS: 2.7
X-MesageID: 11430779
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11430779"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:52:50 +0100
Message-ID: <20200117095251.42668-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117095251.42668-1-roger.pau@citrix.com>
References: <20200117095251.42668-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] x86/smp: move and clean APIC helpers
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

TW92ZSBfX3ByZXBhcmVfSUNSezJ9LCBhcGljX3dhaXRfaWNyX2lkbGUgYW5kCl9fZGVmYXVsdF9z
ZW5kX0lQSV9zaG9ydGN1dCB0byB0aGUgdG9wIG9mIHRoZSBmaWxlLCBzaW5jZSB0aGV5IHdpbGwg
YmUKdXNlZCBieSBzZW5kX0lQSV9tYXNrIGluIGZ1dHVyZSBjaGFuZ2VzLgoKV2hpbGUgdGhlcmUs
IHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSB0aGUgbGVhZGluZyB1bmRlcnNjb3JlcywK
ZHJvcCB0aGUgaW5saW5lIGF0dHJpYnV0ZSwgZHJvcCB0aGUgZGVmYXVsdCBwcmVmaXggZnJvbSB0
aGUgc2hvcnRoYW5kCmhlbHBlciwgY2hhbmdlIHRoZSByZXR1cm4gdHlwZSBvZiB0aGUgcHJlcGFy
ZSBoZWxwZXJzIHRvIHVuc2lnbmVkIGFuZApkbyBzb21lIG1pbm9yIHN0eWxlIGNsZWFudXBzLgoK
Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIE5l
dyBpbiB0aGlzIHZlcnNpb24uCi0tLQogeGVuL2FyY2gveDg2L3NtcC5jIHwgODMgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM5
IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwppbmRleCBjOGU1OTEzZTQ3Li5jMTRmMzA0YzA5
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wLmMKKysrIGIveGVuL2FyY2gveDg2L3NtcC5j
CkBAIC0yMyw2ICsyMyw0MCBAQAogI2luY2x1ZGUgPGlycV92ZWN0b3JzLmg+CiAjaW5jbHVkZSA8
bWFjaF9hcGljLmg+CiAKKy8qIEhlbHBlciBmdW5jdGlvbnMgdG8gcHJlcGFyZSBBUElDIHJlZ2lz
dGVyIHZhbHVlcy4gKi8KK3N0YXRpYyB1bnNpZ25lZCBpbnQgcHJlcGFyZV9JQ1IodW5zaWduZWQg
aW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yKQoreworICAgIHJldHVybiBBUElDX0RNX0ZJWEVEIHwg
c2hvcnRjdXQgfCB2ZWN0b3I7Cit9CisKK3N0YXRpYyB1bnNpZ25lZCBpbnQgcHJlcGFyZV9JQ1Iy
KHVuc2lnbmVkIGludCBtYXNrKQoreworICAgIHJldHVybiBTRVRfeEFQSUNfREVTVF9GSUVMRCht
YXNrKTsKK30KKwordm9pZCBhcGljX3dhaXRfaWNyX2lkbGUodm9pZCkKK3sKKyAgICBpZiAoIHgy
YXBpY19lbmFibGVkICkKKyAgICAgICAgcmV0dXJuOworCisgICAgd2hpbGUgKCBhcGljX3JlYWQo
QVBJQ19JQ1IpICYgQVBJQ19JQ1JfQlVTWSApCisgICAgICAgIGNwdV9yZWxheCgpOworfQorCisv
KiBIZWxwZXIgZm9yIHNlbmRpbmcgQVBJQyBJUElzIHVzaW5nIGEgc2hvcnRoYW5kLiAqLworc3Rh
dGljIHZvaWQgc2VuZF9JUElfc2hvcnRjdXQodW5zaWduZWQgaW50IHNob3J0Y3V0LCBpbnQgdmVj
dG9yLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGRlc3QpCit7
CisgICAgdW5zaWduZWQgaW50IGNmZzsKKworICAgIC8qIFdhaXQgZm9yIGlkbGUuICovCisgICAg
YXBpY193YWl0X2ljcl9pZGxlKCk7CisgICAgLyogUHJlcGFyZSB0YXJnZXQgY2hpcCBmaWVsZC4g
Ki8KKyAgICBjZmcgPSBwcmVwYXJlX0lDUihzaG9ydGN1dCwgdmVjdG9yKSB8IGRlc3Q7CisgICAg
LyogU2VuZCB0aGUgSVBJLiBUaGUgd3JpdGUgdG8gQVBJQ19JQ1IgZmlyZXMgdGhpcyBvZmYuICov
CisgICAgYXBpY193cml0ZShBUElDX0lDUiwgY2ZnKTsKK30KKwogLyoKICAqIHNlbmRfSVBJX21h
c2soY3B1bWFzaywgdmVjdG9yKTogc2VuZHMgQHZlY3RvciBJUEkgdG8gQ1BVcyBpbiBAY3B1bWFz
aywKICAqIGV4Y2x1ZGluZyB0aGUgbG9jYWwgQ1BVLiBAY3B1bWFzayBtYXkgYmUgZW1wdHkuCkBA
IC04MCw0OCArMTE0LDkgQEAgdm9pZCBzZW5kX0lQSV9zZWxmKGludCB2ZWN0b3IpCiAgKiBUaGUg
Zm9sbG93aW5nIGZ1bmN0aW9ucyBkZWFsIHdpdGggc2VuZGluZyBJUElzIGJldHdlZW4gQ1BVcy4K
ICAqLwogCi1zdGF0aWMgaW5saW5lIGludCBfX3ByZXBhcmVfSUNSICh1bnNpZ25lZCBpbnQgc2hv
cnRjdXQsIGludCB2ZWN0b3IpCi17Ci0gICAgcmV0dXJuIEFQSUNfRE1fRklYRUQgfCBzaG9ydGN1
dCB8IHZlY3RvcjsKLX0KLQotc3RhdGljIGlubGluZSBpbnQgX19wcmVwYXJlX0lDUjIgKHVuc2ln
bmVkIGludCBtYXNrKQotewotICAgIHJldHVybiBTRVRfeEFQSUNfREVTVF9GSUVMRChtYXNrKTsK
LX0KLQotdm9pZCBhcGljX3dhaXRfaWNyX2lkbGUodm9pZCkKLXsKLSAgICBpZiAoIHgyYXBpY19l
bmFibGVkICkKLSAgICAgICAgcmV0dXJuOwotCi0gICAgd2hpbGUgKCBhcGljX3JlYWQoIEFQSUNf
SUNSICkgJiBBUElDX0lDUl9CVVNZICkKLSAgICAgICAgY3B1X3JlbGF4KCk7Ci19Ci0KLXN0YXRp
YyB2b2lkIF9fZGVmYXVsdF9zZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQs
IGludCB2ZWN0b3IsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgZGVzdCkKLXsKLSAgICB1bnNpZ25lZCBpbnQgY2ZnOwotCi0gICAgLyoKLSAgICAgKiBX
YWl0IGZvciBpZGxlLgotICAgICAqLwotICAgIGFwaWNfd2FpdF9pY3JfaWRsZSgpOwotCi0gICAg
LyoKLSAgICAgKiBwcmVwYXJlIHRhcmdldCBjaGlwIGZpZWxkCi0gICAgICovCi0gICAgY2ZnID0g
X19wcmVwYXJlX0lDUihzaG9ydGN1dCwgdmVjdG9yKSB8IGRlc3Q7Ci0gICAgLyoKLSAgICAgKiBT
ZW5kIHRoZSBJUEkuIFRoZSB3cml0ZSB0byBBUElDX0lDUiBmaXJlcyB0aGlzIG9mZi4KLSAgICAg
Ki8KLSAgICBhcGljX3dyaXRlKEFQSUNfSUNSLCBjZmcpOwotfQotCiB2b2lkIHNlbmRfSVBJX3Nl
bGZfbGVnYWN5KHVpbnQ4X3QgdmVjdG9yKQogewotICAgIF9fZGVmYXVsdF9zZW5kX0lQSV9zaG9y
dGN1dChBUElDX0RFU1RfU0VMRiwgdmVjdG9yLCBBUElDX0RFU1RfUEhZU0lDQUwpOworICAgIHNl
bmRfSVBJX3Nob3J0Y3V0KEFQSUNfREVTVF9TRUxGLCB2ZWN0b3IsIEFQSUNfREVTVF9QSFlTSUNB
TCk7CiB9CiAKIHZvaWQgc2VuZF9JUElfbWFza19mbGF0KGNvbnN0IGNwdW1hc2tfdCAqY3B1bWFz
aywgaW50IHZlY3RvcikKQEAgLTE0NSwxMyArMTQwLDEzIEBAIHZvaWQgc2VuZF9JUElfbWFza19m
bGF0KGNvbnN0IGNwdW1hc2tfdCAqY3B1bWFzaywgaW50IHZlY3RvcikKICAgICAvKgogICAgICAq
IHByZXBhcmUgdGFyZ2V0IGNoaXAgZmllbGQKICAgICAgKi8KLSAgICBjZmcgPSBfX3ByZXBhcmVf
SUNSMihtYXNrKTsKKyAgICBjZmcgPSBwcmVwYXJlX0lDUjIobWFzayk7CiAgICAgYXBpY193cml0
ZShBUElDX0lDUjIsIGNmZyk7CiAKICAgICAvKgogICAgICAqIHByb2dyYW0gdGhlIElDUgogICAg
ICAqLwotICAgIGNmZyA9IF9fcHJlcGFyZV9JQ1IoMCwgdmVjdG9yKSB8IEFQSUNfREVTVF9MT0dJ
Q0FMOworICAgIGNmZyA9IHByZXBhcmVfSUNSKDAsIHZlY3RvcikgfCBBUElDX0RFU1RfTE9HSUNB
TDsKIAogICAgIC8qCiAgICAgICogU2VuZCB0aGUgSVBJLiBUaGUgd3JpdGUgdG8gQVBJQ19JQ1Ig
ZmlyZXMgdGhpcyBvZmYuCkBAIC0xODEsMTMgKzE3NiwxMyBAQCB2b2lkIHNlbmRfSVBJX21hc2tf
cGh5cyhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCiAgICAgICAgIC8qCiAgICAg
ICAgICAqIHByZXBhcmUgdGFyZ2V0IGNoaXAgZmllbGQKICAgICAgICAgICovCi0gICAgICAgIGNm
ZyA9IF9fcHJlcGFyZV9JQ1IyKGNwdV9waHlzaWNhbF9pZChxdWVyeV9jcHUpKTsKKyAgICAgICAg
Y2ZnID0gcHJlcGFyZV9JQ1IyKGNwdV9waHlzaWNhbF9pZChxdWVyeV9jcHUpKTsKICAgICAgICAg
YXBpY193cml0ZShBUElDX0lDUjIsIGNmZyk7CiAKICAgICAgICAgLyoKICAgICAgICAgICogcHJv
Z3JhbSB0aGUgSUNSCiAgICAgICAgICAqLwotICAgICAgICBjZmcgPSBfX3ByZXBhcmVfSUNSKDAs
IHZlY3RvcikgfCBBUElDX0RFU1RfUEhZU0lDQUw7CisgICAgICAgIGNmZyA9IHByZXBhcmVfSUNS
KDAsIHZlY3RvcikgfCBBUElDX0RFU1RfUEhZU0lDQUw7CiAKICAgICAgICAgLyoKICAgICAgICAg
ICogU2VuZCB0aGUgSVBJLiBUaGUgd3JpdGUgdG8gQVBJQ19JQ1IgZmlyZXMgdGhpcyBvZmYuCi0t
IAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
