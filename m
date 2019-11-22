Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320951077AC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 19:54:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYE2M-00085d-Oi; Fri, 22 Nov 2019 18:52:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjPq=ZO=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iYE2L-00085Y-Ja
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 18:52:09 +0000
X-Inumbo-ID: 2e9f3bb9-0d59-11ea-a361-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e9f3bb9-0d59-11ea-a361-12813bfff9fa;
 Fri, 22 Nov 2019 18:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574448728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUDsR/oxPnfzeLTLtiSBFXew6WNcQgsSOaLr09Z4Xd4=;
 b=F34BJwRMdNbIh9t7zHqvPo8WoeYNECbWV76AqX4neidjhCFKX2VlYRGp
 P6axWMQKZ7nCEp5XX0P4cw7VlbWDkHreGDKpX+jumRBY0sW6f2uLw9O8G
 Qoe5tNfK+tJ6wjbtxTv9IYtBDcXQ59icyzeyuLPnsYQ4iB2jdm3Aoo5FY 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QYzoLxQPbAYAx/sAWWKHlBZIv+ODZH5cD6BU5Gb7OuAahSLRwLwNqigpzXv7pHNgskZWTV2QUP
 tdFV3U6IUxirNpVitjlYSvfsgqdEjZU9g9ifw57/PQn43Hf0WoTeOosf1XCEqohBwO3+S7cb3o
 mz3JO8UXD7EBWE0G3Ps2mK4sDO8xqzmICSSm7mDu9eqIwlEedorRAe+AfIFuTJgDXThneKcBog
 Qg100/K3EkcT1dg1U9KCC6pr0GRQ2vLGyxM9cSjLPO9N6SBtKG2/qTPtd5116cSIVOMLrTwd9+
 jTU=
X-SBRS: 2.7
X-MesageID: 9273091
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,230,1571716800"; 
   d="scan'208";a="9273091"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 22 Nov 2019 18:52:02 +0000
Message-ID: <20191122185202.1375312-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mm: Adjust linear uses / entries when a
 page loses validation
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IkxpbmVhciBwYWdldGFibGVzIiBpcyBhIHRlY2huaXF1ZSB3aGljaCBpbnZvbHZlcyBlaXRoZXIg
cG9pbnRpbmcgYQpwYWdldGFibGUgYXQgaXRzZWxmLCBvciB0byBhbm90aGVyIHBhZ2V0YWJsZSB0
aGUgc2FtZSBvciBoaWdoZXIgbGV2ZWwuClhlbiBoYXMgbGltaXRlZCBzdXBwb3J0IGZvciBsaW5l
YXIgcGFnZXRhYmxlczogQSBwYWdlIG1heSBlaXRoZXIgcG9pbnQKdG8gaXRzZWxmLCBvciBwb2lu
dCB0byBhbm90aGVyIHBhZ2Ugb2YgdGhlIHNhbWUgbGV2ZWwgKGkuZS4sIEwyIHRvIEwyLApMMyB0
byBMMywgYW5kIHNvIG9uKS4KClhTQS0yNDAgaW50cm9kdWNlZCBhbiBhZGRpdGlvbmFsIHJlc3Ry
aWN0aW9uIHRoYXQgbGltaXRlZCB0aGUgImRlcHRoIgpvZiBzdWNoIGNoYWlucyBieSBhbGxvd2lu
ZyBwYWdlcyB0byBlaXRoZXIgKnBvaW50IHRvKiBvdGhlciBwYWdlcyBvZgp0aGUgc2FtZSBsZXZl
bCwgb3IgKmJlIHBvaW50ZWQgdG8qIGJ5IG90aGVyIHBhZ2VzIG9mIHRoZSBzYW1lIGxldmVsLApi
dXQgbm90IGJvdGguICBUbyBpbXBsZW1lbnQgdGhpcywgd2Uga2VlcCB0cmFjayBvZiB0aGUgbnVt
YmVyIG9mCm91dHN0YW5kaW5nIHRpbWVzIGEgcGFnZSBwb2ludHMgdG8gb3IgaXMgcG9pbnRlZCB0
byBhbm90aGVyIHBhZ2UKdGFibGUsIHRvIHByZXZlbnQgYm90aCBmcm9tIGhhcHBlbmluZyBhdCB0
aGUgc2FtZSB0aW1lLgoKQWRkaXRpb25hbGx5LCBYU0EtMjk5IGludHJvZHVjZWQgYSBtb2RlIHdo
ZXJlYnkgaWYgYSBwYWdlIHdhcyBrbm93biB0bwpoYXZlIGJlZW4gb25seSBwYXJ0aWFsbHkgdmFs
aWRhdGVkLCBfcHV0X3BhZ2VfdHlwZSgpIHdvdWxkIGJlIGNhbGxlZAp3aXRoIFBURl9wYXJ0aWFs
X3NldCwgaW5kaWNhdGluZyB0aGF0IGlmIHRoZSBwYWdlIGhhZCBiZWVuCmRlLXZhbGlkYXRlZCBi
eSBzb21lb25lIGVsc2UsIHRoZSB0eXBlIGNvdW50IHNob3VsZCBiZSBsZWZ0IGFsb25lLgoKVW5m
b3J0dW5hdGVseSwgdGhpcyBjaGFuZ2UgZGlkIG5vdCBhY2NvdW50IGZvciB0aGUgcmVxdWlyZWQg
YWNjb3VudGluZwpmb3IgbGluZWFyIHBhZ2UgdGFibGUgdXNlcyBhbmQgZW50cmllczsgaW4gdGhl
IGNhc2UgdGhhdCBhIHByZXZpb3VzbHkKcGFydGlhbGx5LWRldmFsaWRhdGVkIHBhZ2V0YWJsZSB3
YXMgZnVsbHktZGV2YWxpZGF0ZWQgYnkgc29tZW9uZSBlbHNlLAp0aGUgbGluZWFyX3B0X2NvdW50
cyBhcmUgbm90IHVwZGF0ZWQuCgpUaGlzIGNvdWxkIGhhcHBlbiBpbiBvbmUgb2YgdHdvIHBsYWNl
czoKCjEuIEluIHRoZSBjYXNlIGEgcGFydGlhbGx5LWRldmFsaWRhdGVkIHBhZ2Ugd2FzIHJlLXZh
bGlkYXRlZCBieQpzb21lb25lIGVsc2UKCjIuIER1cmluZyBkb21haW4gdGVhci1kb3duLCB3aGVu
IHBhZ2VzIGFyZSBmb3JjZS1pbnZhbGlkYXRlZCB3aGlsZQpsZWF2aW5nIHRoZSB0eXBlIGNvdW50
IGludGFjdC4KClRoZSBzZWNvbmQgY291bGQgYmUgaWdub3JlZCwgc2luY2UgYXQgdGhhdCBwb2lu
dCB0aGUgcGFnZXMgY2FuIG5vCmxvbmdlciBiZSBhYnVzZWQ7IGJ1dCB0aGUgZmlyc3QgcmVxdWly
ZXMgaGFuZGxpbmcuICBOb3RlIGhvd2V2ZXIgdGhhdAp0aGlzIHdvdWxkIG5vdCBiZSBhIHNlY3Vy
aXR5IGlzc3VlOiBoYXZpbmcgdGhlIGNvdW50cyBiZSB0b28gaGlnaCBpcwpvdmVybHkgc3RyaWN0
IChpLmUuLCB3aWxsIHByZXZlbnQgYSBwYWdlIGZyb20gYmVpbmcgdXNlZCBpbiBhIHdheQp3aGlj
aCBpcyBwZXJmZWN0bHkgc2FmZSksIGJ1dCBzaG91bGRuJ3QgY2F1c2UgYW55IG90aGVyIGlzc3Vl
cy4KCkZpeCB0aGlzIGJ5IGFkanVzdGluZyB0aGUgbGluZWFyIGNvdW50cyB3aGVuIGEgcGFnZSBs
b3NlcyB2YWxpZGF0aW9uLApyZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIGRlLXZhbGlkYXRpb24g
Y29tcGxldGVkIG9yIHdhcyBvbmx5IHBhcnRpYWwuCgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Ci0tLQpSZWxlYXNlIGV4Y2VwdGlvbiBqdXN0aWZpY2F0aW9uOiBU
aGlzIGlzIGEgZml4IGZvciBhIGJ1Zy4KCkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTMg
KysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CmluZGV4IGJkODE4MmY0MGYuLjdkNGRkODBhODUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC0yNzgwLDE0ICsyNzgwLDE3IEBAIHN0YXRp
YyBpbnQgX3B1dF9maW5hbF9wYWdlX3R5cGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSwgdW5zaWdu
ZWQgbG9uZyB0eXBlLAogewogICAgIGludCByYyA9IGZyZWVfcGFnZV90eXBlKHBhZ2UsIHR5cGUs
IHByZWVtcHRpYmxlKTsKIAorICAgIGlmICggcHRwZyAmJiBQR1RfdHlwZV9lcXVhbCh0eXBlLCBw
dHBnLT51LmludXNlLnR5cGVfaW5mbykgJiYKKyAgICAgICAgICh0eXBlICYgUEdUX3ZhbGlkYXRl
ZCkgJiYgcmMgIT0gLUVJTlRSICkKKyAgICB7CisgICAgICAgIC8qIEFueSB0aW1lIHdlIGJlZ2lu
IGRlLXZhbGlkYXRpb24gb2YgYSBwYWdlLCBhZGp1c3QgbGluZWFyIGNvdW50cyAqLworICAgICAg
ICBkZWNfbGluZWFyX3VzZXMocGFnZSk7CisgICAgICAgIGRlY19saW5lYXJfZW50cmllcyhwdHBn
KTsKKyAgICB9CisKICAgICAvKiBObyBuZWVkIGZvciBhdG9taWMgdXBkYXRlIG9mIHR5cGVfaW5m
byBoZXJlOiBub29uZSBlbHNlIHVwZGF0ZXMgaXQuICovCiAgICAgaWYgKCByYyA9PSAwICkKICAg
ICB7Ci0gICAgICAgIGlmICggcHRwZyAmJiBQR1RfdHlwZV9lcXVhbCh0eXBlLCBwdHBnLT51Lmlu
dXNlLnR5cGVfaW5mbykgKQotICAgICAgICB7Ci0gICAgICAgICAgICBkZWNfbGluZWFyX3VzZXMo
cGFnZSk7Ci0gICAgICAgICAgICBkZWNfbGluZWFyX2VudHJpZXMocHRwZyk7Ci0gICAgICAgIH0K
ICAgICAgICAgQVNTRVJUKCFwYWdlLT5saW5lYXJfcHRfY291bnQgfHwgcGFnZV9nZXRfb3duZXIo
cGFnZSktPmlzX2R5aW5nKTsKICAgICAgICAgc2V0X3RsYmZsdXNoX3RpbWVzdGFtcChwYWdlKTsK
ICAgICAgICAgc21wX3dtYigpOwotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
