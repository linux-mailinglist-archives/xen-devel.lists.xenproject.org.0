Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000591805D6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 19:08:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBjGu-0002Pc-9V; Tue, 10 Mar 2020 18:06:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gi8Y=43=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jBjGs-0002PX-1j
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 18:06:26 +0000
X-Inumbo-ID: da42efdd-62f9-11ea-ae17-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da42efdd-62f9-11ea-ae17-12813bfff9fa;
 Tue, 10 Mar 2020 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583863584;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4NGHL3/oxeGQ2tolVP6w//SV2Xxy4Dx1M6XadSOxs2w=;
 b=XuW9Kp0uCLefQutHA+oMGUivvUjkKch1jNqYiWp7dyrClRABzo+iVy14
 MZKoQJRM/4vKQVCJTsSJ0Qhqpqoqaf2to4Bznxtv7ujt77iAIfQWsMw1k
 2M399a/z/r+Jsi8d0DGiY8YX0mTImoPfLGYMcToGvu5cPV8zkylDoe8Mr w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JghENT/eG6K4rEQNl3eUb6Eb0oAM4Gbe9cfgVmiG43e5iX0a+Po4B52OHqy64hLv+LjdRHR9iJ
 k1NGcsDTRbE1lGmhuLvvcwOjYiwueoCFQSDRStlAXZzuu1UO41LGKkGpvEytmVsdJkADQYX9ny
 ZbCOSjdaSwrZQ0O3j7anKMOgeMRNwQi2/p64G2oQB2jF+mnjbvmFLFxBiCZOAXK+okmDjrX5F7
 Z34tlT1DmyB1Wfi0N0Pq/OZdFNlrGmSmsZ0b1+hfJ3JfAQNPEAmTR2A2Owjr00WMFEFtTqxh/n
 N9I=
X-SBRS: 2.7
X-MesageID: 14346329
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="14346329"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 18:06:18 +0000
Message-ID: <1583863578-18063-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4] x86/cpu: Sync any remaining RCU callbacks
 before CPU up/down
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 sstabellini@kernel.org, julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIENQVSBkb3duIG9wZXJhdGlvbiBSQ1UgY2FsbGJhY2tzIGFyZSBzY2hlZHVsZWQgdG8g
ZmluaXNoCm9mZiBzb21lIGFjdGlvbnMgbGF0ZXIgYXMgc29vbiBhcyBDUFUgaXMgZnVsbHkgZGVh
ZCAodGhlIHNhbWUgYXBwbGllcwp0byBDUFUgdXAgb3BlcmF0aW9uIGluIGNhc2UgZXJyb3IgcGF0
aCBpcyB0YWtlbikuIElmIGluIHRoZSBzYW1lIGdyYWNlCnBlcmlvZCBhbm90aGVyIENQVSB1cCBv
cGVyYXRpb24gaXMgcGVyZm9ybWVkIG9uIHRoZSBzYW1lIENQVSwgUkNVIGNhbGxiYWNrCndpbGwg
YmUgY2FsbGVkIGxhdGVyIG9uIGEgQ1BVIGluIGEgcG90ZW50aWFsbHkgd3JvbmcgKGFscmVhZHkg
dXAgYWdhaW4KaW5zdGVhZCBvZiBzdGlsbCBiZWluZyBkb3duKSBzdGF0ZSBsZWFkaW5nIHRvIGV2
ZW50dWFsIHN0YXRlIGluY29uc2lzdGVuY3kKYW5kL29yIGNyYXNoLgoKSW4gb3JkZXIgdG8gYXZv
aWQgaXQgLSBmbHVzaCBSQ1UgY2FsbGJhY2tzIGV4cGxpY2l0bHkgYmVmb3JlIHN0YXJ0aW5nIHRo
ZQpuZXh0IENQVSB1cC9kb3duIG9wZXJhdGlvbi4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRy
dXpoaW5pbkBjaXRyaXguY29tPgotLS0KVGhpcyBnb3QgZGlzY292ZXJlZCB0cnlpbmcgdG8gcmVz
dW1lIFBWIHNoaW0gd2l0aCBtdWx0aXBsZSB2Q1BVcyBvbiBBTUQKbWFjaGluZSAod2hlcmUgcGFy
a19vZmZsaW5lX2NwdXMgPT0gMCkuIFJDVSBjYWxsYmFjayByZXNwb25zaWJsZSBmb3IKZnJlZWlu
ZyBwZXJjcHUgYXJlYSBvbiBDUFUgb2ZmbGluZSBnb3QgZmluYWxseSBjYWxsZWQgYWZ0ZXIgQ1BV
IHdlbnQKb25saW5lIGFnYWluIGFzIHRoZSBndWVzdCBwZXJmb3JtZWQgcmVndWxhciB2Q1BVIG9m
ZmxpbmUvb25saW5lIG9wZXJhdGlvbnMKb24gcmVzdW1lLgoKTm90ZTogdGhpcyBwYXRjaCByZXF1
aXJlcyBSQ1Ugc2VyaWVzIHY0IGZyb20gSnVlcmdlbiB0byBiZSBhcHBsaWVkIC0KaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAzL21zZzAw
NjY4Lmh0bWwKCnYyOiBjaGFuZ2VkIHJjdV9iYXJyaWVyKCkgcG9zaXRpb24sIHVwZGF0ZWQgZGVz
Y3JpcHRpb24KdjM6IG1vdmVkIHJjdV9iYXJyaWVyKCkgdG8gY29tbW9uIGNwdV91cC9jcHVfZG93
biBjb2RlIHRvIGNvdmVyIG1vcmUgY2FzZXMKdjQ6IGtlcHQgZXhpc3RpbmcgY29tbWVudHMgaW4g
bW9kaWZpZWQgZm9ybQotLS0KIHhlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgfCAgMSAtCiB4ZW4v
YXJjaC94ODYvc3lzY3RsLmMgICAgIHwgMTAgKystLS0tLS0tLQogeGVuL2NvbW1vbi9jcHUuYyAg
ICAgICAgICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2Fy
Y2gveDg2L2FjcGkvcG93ZXIuYwppbmRleCBiNWRmMDBiLi44NDdjMjczIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMK
QEAgLTMwNSw3ICszMDUsNiBAQCBzdGF0aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkKICAg
ICBjcHVmcmVxX2FkZF9jcHUoMCk7CiAKICBlbmFibGVfY3B1OgotICAgIHJjdV9iYXJyaWVyKCk7
CiAgICAgbXRycl9hcHNfc3luY19iZWdpbigpOwogICAgIGVuYWJsZV9ub25ib290X2NwdXMoKTsK
ICAgICBtdHJyX2Fwc19zeW5jX2VuZCgpOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3N5c2N0
bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCmluZGV4IGE5NTkyM2UuLmIwY2IxYjUgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4vYXJjaC94ODYvc3lzY3RsLmMK
QEAgLTg0LDEyICs4NCw5IEBAIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKQogICAgIHVu
c2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQgbG9uZylkYXRhOwogICAgIGludCByZXQgPSBjcHVf
dXAoY3B1KTsKIAorICAgIC8qIEhhdmUgb25lIG1vcmUgZ28gb24gRUJVU1kuICovCiAgICAgaWYg
KCByZXQgPT0gLUVCVVNZICkKLSAgICB7Ci0gICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ug
d29yayBhbmQgaGF2ZSBvbmUgbW9yZSBnby4gKi8KLSAgICAgICAgcmN1X2JhcnJpZXIoKTsKICAg
ICAgICAgcmV0ID0gY3B1X3VwKGNwdSk7Ci0gICAgfQogCiAgICAgaWYgKCAhcmV0ICYmICFvcHRf
c210ICYmCiAgICAgICAgICBjcHVfZGF0YVtjcHVdLmNvbXB1dGVfdW5pdF9pZCA9PSBJTlZBTElE
X0NVSUQgJiYKQEAgLTEwOSwxMiArMTA2LDkgQEAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAq
ZGF0YSkKIHsKICAgICBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKICAgICBpbnQgcmV0
ID0gY3B1X2Rvd24oY3B1KTsKKyAgICAvKiBIYXZlIG9uZSBtb3JlIGdvIG9uIEVCVVNZLiAqLwog
ICAgIGlmICggcmV0ID09IC1FQlVTWSApCi0gICAgewotICAgICAgICAvKiBPbiBFQlVTWSwgZmx1
c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1vcmUgZ28uICovCi0gICAgICAgIHJjdV9iYXJyaWVy
KCk7CiAgICAgICAgIHJldCA9IGNwdV9kb3duKGNwdSk7Ci0gICAgfQogICAgIHJldHVybiByZXQ7
CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1LmMgYi94ZW4vY29tbW9uL2NwdS5jCmlu
ZGV4IDMxOTUzZjMuLjFmOTc2ZGIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vY3B1LmMKKysrIGIv
eGVuL2NvbW1vbi9jcHUuYwpAQCAtNCw2ICs0LDcgQEAKICNpbmNsdWRlIDx4ZW4vaW5pdC5oPgog
I2luY2x1ZGUgPHhlbi9zY2hlZC5oPgogI2luY2x1ZGUgPHhlbi9zdG9wX21hY2hpbmUuaD4KKyNp
bmNsdWRlIDx4ZW4vcmN1cGRhdGUuaD4KIAogdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbnJf
Y3B1X2lkcyA9IE5SX0NQVVM7CiAjaWZuZGVmIG5yX2NwdW1hc2tfYml0cwpAQCAtNTMsNiArNTQs
NyBAQCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKQogCiB2b2lkIGNwdV9ob3RwbHVnX2JlZ2luKHZv
aWQpCiB7CisgICAgcmN1X2JhcnJpZXIoKTsKICAgICB3cml0ZV9sb2NrKCZjcHVfYWRkX3JlbW92
ZV9sb2NrKTsKIH0KIAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
