Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C579256D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 15:46:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzhvV-0003Aq-FK; Mon, 19 Aug 2019 13:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzhvT-0003AW-GA
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 13:42:23 +0000
X-Inumbo-ID: 2c04cf8e-c287-11e9-8bec-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c04cf8e-c287-11e9-8bec-12813bfff9fa;
 Mon, 19 Aug 2019 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566222142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vHf8WaA711QFLxi+iXstlQC4sWgRb6VLmwye9eit8v8=;
 b=gYO1ddxFe+J2i/OnngIA1Dd0eBsUPKWs9telCBUDJglh8c4MDncaa0Gk
 CmXmnD9aUJOL65h/BFsAkEW4bk2yGI/kKOZzsaT3FcjlzyxDK+RnwA+M8
 UAwacNc0pOD9rKzCsrsw0I6Q0BTQHnb8YQbCoxZUXNtVywY1SbRPLQ9jk Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bRlLJZiyo1MEWkugwWCgAiNHvp53aH6tFEQRsB+qyivZrPQBODJ6eZ25exxL8XqABWUDTmGHn6
 cxX4GNKLuh5P0QZN5GOdSDqsXF+tCZ3t4mJgy0dG64ojLbC3MNRB8agcyc/77hUkKIJG8U/24N
 Y0KSZYZedZJdTh99Ps+Bler48GnNHGnN4iW/dvAVR5RVXjiAkoVJvKAQr5c8PewDqe94S6Yypl
 zqwszHC8wwux9wEosnge5ZyAEEIPPYIieuhlKUs6zo7aCiWCFlXiHilVh3WFad7qOgggJmwL+X
 rHc=
X-SBRS: 2.7
X-MesageID: 4422955
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4422955"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 19 Aug 2019 14:42:11 +0100
Message-ID: <20190819134213.1628-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190819134213.1628-1-andrew.cooper3@citrix.com>
References: <20190819134213.1628-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Further minor GDT corrections
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

Z2R0X2Jvb3RfZGVzY3IgYW5kIGdkdF80OCBkaXNhZ3JlZSBvbiBob3cgbG9uZyB0cmFtcG9saW5l
X2dkdCBpcy4KCkludHJvZHVjZSBhbiBlbmQgbGFiZWwgYW5kIGhhdmUgdGhlIGxpbmtlciBjYWxj
dWxhdGUgdGhlIHNpemUsIHJhdGhlciB0aGFuCmhhcmQgY29kaW5nIGl0LgoKQWxzbywganVzdCBh
cyB3aXRoIGMvcyBhZjI5MmI0MWU5LCB0aGVyZSBpcyBubyBwb2ludCBmb3JjaW5nIHRoZSBDUFUg
dG8gc2V0CkFjY2VzcyBiaXRzLiAgRml4IGFsbCByZW1haW5pbmcgR0RUcyBpbiBYZW4uCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0K
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoZSB0cmFt
cG9saW5lIEdEVCBhY2Nlc3MgYml0cyB3ZXJlIGFjdHVhbGx5IG5vdGljZWQgd2hlbiB0cnlpbmcg
dG8gY2xlYW4gdXAKb3VyIGJvb3QgdGltZSBwYWdldGFibGVzIGFuZCBtYXAgdGhlIHRyYW1wb2xp
bmUgcmVhZC1vbmx5LgotLS0KIHhlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyAgICAgICAgICB8ICAy
ICstCiB4ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMgICAgfCAxNSArKysrKysrKy0tLS0t
LS0KIHhlbi9hcmNoL3g4Ni94ODZfNjQva2V4ZWNfcmVsb2MuUyB8ICA0ICsrLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCmluZGV4
IDI2YjY4MDUyMWQuLjlmZGI5YjM5NTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hl
YWQuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKQEAgLTEyOSw3ICsxMjksNyBAQCBt
dWx0aWJvb3QyX2hlYWRlcjoKIAogICAgICAgICAud29yZCAgIDAKIGdkdF9ib290X2Rlc2NyOgot
ICAgICAgICAud29yZCAgIDcqOC0xCisgICAgICAgIC53b3JkICAgLkx0cmFtb3BsaW5lX2dkdF9l
bmQgLSB0cmFtcG9saW5lX2dkdCAtIDEKIGdkdF9ib290X2Jhc2U6CiAgICAgICAgIC5sb25nICAg
c3ltX29mZnModHJhbXBvbGluZV9nZHQpCiAgICAgICAgIC5sb25nICAgMCAvKiBOZWVkZWQgZm9y
IDY0LWJpdCBsZ2R0ICovCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5l
LlMgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKaW5kZXggN2M2YTIzMjhkMi4uMTc2
MWZjMTIxMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCisrKyBi
L3hlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUwpAQCAtNjMsMjIgKzYzLDIzIEBAIHRyYW1w
b2xpbmVfZ2R0OgogICAgICAgICAvKiAweDAwMDA6IHVudXNlZCAqLwogICAgICAgICAucXVhZCAg
IDB4MDAwMDAwMDAwMDAwMDAwMAogICAgICAgICAvKiAweDAwMDg6IHJpbmcgMCBjb2RlLCAzMi1i
aXQgbW9kZSAqLwotICAgICAgICAucXVhZCAgIDB4MDBjZjlhMDAwMDAwZmZmZgorICAgICAgICAu
cXVhZCAgIDB4MDBjZjliMDAwMDAwZmZmZgogICAgICAgICAvKiAweDAwMTA6IHJpbmcgMCBjb2Rl
LCA2NC1iaXQgbW9kZSAqLwotICAgICAgICAucXVhZCAgIDB4MDBhZjlhMDAwMDAwZmZmZgorICAg
ICAgICAucXVhZCAgIDB4MDBhZjliMDAwMDAwZmZmZgogICAgICAgICAvKiAweDAwMTg6IHJpbmcg
MCBkYXRhICovCi0gICAgICAgIC5xdWFkICAgMHgwMGNmOTIwMDAwMDBmZmZmCisgICAgICAgIC5x
dWFkICAgMHgwMGNmOTMwMDAwMDBmZmZmCiAgICAgICAgIC8qIDB4MDAyMDogcmVhbC1tb2RlIGNv
ZGUgQCBCT09UX1RSQU1QT0xJTkUgKi8KICAgICAgICAgLmxvbmcgICAweDAwMDBmZmZmCi0gICAg
ICAgIC5sb25nICAgMHgwMDAwOWEwMAorICAgICAgICAubG9uZyAgIDB4MDAwMDliMDAKICAgICAg
ICAgLyogMHgwMDI4OiByZWFsLW1vZGUgZGF0YSBAIEJPT1RfVFJBTVBPTElORSAqLwogICAgICAg
ICAubG9uZyAgIDB4MDAwMGZmZmYKLSAgICAgICAgLmxvbmcgICAweDAwMDA5MjAwCisgICAgICAg
IC5sb25nICAgMHgwMDAwOTMwMAogICAgICAgICAvKgogICAgICAgICAgKiAweDAwMzA6IHJpbmcg
MCBYZW4gZGF0YSwgMTYgTWlCIHNpemUsIGJhc2UKICAgICAgICAgICogYWRkcmVzcyBpcyBjb21w
dXRlZCBhdCBydW50aW1lLgogICAgICAgICAgKi8KLSAgICAgICAgLnF1YWQgICAweDAwYzA5MjAw
MDAwMDBmZmYKKyAgICAgICAgLnF1YWQgICAweDAwYzA5MzAwMDAwMDBmZmYKKy5MdHJhbW9wbGlu
ZV9nZHRfZW5kOgogCiAgICAgICAgIC5wdXNoc2VjdGlvbiAudHJhbXBvbGluZV9yZWwsICJhIgog
ICAgICAgICAubG9uZyAgIHRyYW1wb2xpbmVfZ2R0ICsgQk9PVF9QU0VVRE9STV9DUyArIDIgLSAu
CkBAIC0xODIsNyArMTgzLDcgQEAgc3RhcnQ2NDoKICAgICAgICAgLndvcmQgICAwCiBpZHRfNDg6
IC53b3JkICAgMCwgMCwgMCAjIGJhc2UgPSBsaW1pdCA9IDAKICAgICAgICAgLndvcmQgICAwCi1n
ZHRfNDg6IC53b3JkICAgNio4LTEKK2dkdF80ODogLndvcmQgICAuTHRyYW1vcGxpbmVfZ2R0X2Vu
ZCAtIHRyYW1wb2xpbmVfZ2R0IC0gMQogICAgICAgICAubG9uZyAgIGJvb3RzeW1fcmVsKHRyYW1w
b2xpbmVfZ2R0LDQpCiAKIC8qIFRoZSBmaXJzdCBwYWdlIG9mIHRyYW1wb2xpbmUgaXMgcGVybWFu
ZW50LCB0aGUgcmVzdCBib290LXRpbWUgb25seS4gKi8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni94ODZfNjQva2V4ZWNfcmVsb2MuUyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQva2V4ZWNfcmVsb2Mu
UwppbmRleCA1YmY2MWQ1YzJkLi45ZTViN2E2YmExIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
eDg2XzY0L2tleGVjX3JlbG9jLlMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9rZXhlY19yZWxv
Yy5TCkBAIC0xODIsOCArMTgyLDggQEAgY29tcGF0X21vZGVfZ2R0X2Rlc2M6CiAgICAgICAgIC5h
bGlnbiA4CiBjb21wYXRfbW9kZV9nZHQ6CiAgICAgICAgIC5xdWFkIDB4MDAwMDAwMDAwMDAwMDAw
MCAgICAgLyogbnVsbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovCi0gICAgICAgIC5x
dWFkIDB4MDBjZjkyMDAwMDAwZmZmZiAgICAgLyogMHgwMDA4IHJpbmcgMCBkYXRhICAgICAgICAg
ICAgICAgICovCi0gICAgICAgIC5xdWFkIDB4MDBjZjlhMDAwMDAwZmZmZiAgICAgLyogMHgwMDEw
IHJpbmcgMCBjb2RlLCBjb21wYXRpYmlsaXR5ICovCisgICAgICAgIC5xdWFkIDB4MDBjZjkzMDAw
MDAwZmZmZiAgICAgLyogMHgwMDA4IHJpbmcgMCBkYXRhICAgICAgICAgICAgICAgICovCisgICAg
ICAgIC5xdWFkIDB4MDBjZjliMDAwMDAwZmZmZiAgICAgLyogMHgwMDEwIHJpbmcgMCBjb2RlLCBj
b21wYXRpYmlsaXR5ICovCiAKIGNvbXBhdF9tb2RlX2lkdDoKICAgICAgICAgLndvcmQgMCAgICAg
ICAgICAgICAgICAgICAgICAvKiBsaW1pdCAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
