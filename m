Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A415BDB3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 12:35:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Ck7-0006XM-QJ; Thu, 13 Feb 2020 11:33:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2Ck6-0006XH-DN
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 11:33:14 +0000
X-Inumbo-ID: 9e69e3e4-4e54-11ea-b887-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e69e3e4-4e54-11ea-b887-12813bfff9fa;
 Thu, 13 Feb 2020 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581593593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7kzGedqMxIqgf+xQy1JZROZ0ogbeuglGr0w6S3J4cIs=;
 b=D6B5knrE4nl5Rq4bBPDv62k+GIzA/rb5Xx+MsmHgBc/RSWUYMASeb3JC
 AP9eSlfafOok7WGKEwHMthhEUjHcaOs7Gn7LzDNSwYhY3u8/QKxo0+fOI
 B+52BuaIT4BJJCjEdKpYITHOv9+YSa+KGvI9PdoA81l/wAhJi9D5JpTbH I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 45RgNY8mVo3e0fZb9nV2NT3TnCjXdsZrO2yvsdAByore05oe7M6+Z/v06gJPEeZXyZ21ErBtUQ
 juvLBHvAEQZhxas34Qhpdi4u/HxMM16h0lbPaLAiFm5LT/AtwVJ5ba+s4Z0wVDALsCkAghWFKF
 LdKFOxx9rogG3yILxug/NRkXncnmHE9/Ysp9ANgXSPy6rvMFxxeN7kaovzktIPlZVYW28vDEvV
 c3JVQHrP8dGbfenXQpNtqvqDTYAxMh53wHgHwPkKD+pSmgJWqWSr1miYhWioVNJMxCtQxrdURm
 l3w=
X-SBRS: 2.7
X-MesageID: 12823952
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12823952"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 13 Feb 2020 12:32:37 +0100
Message-ID: <20200213113237.58795-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213113237.58795-1-roger.pau@citrix.com>
References: <20200213113237.58795-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] smp: convert cpu_hotplug_begin into a
 blocking lock acquisition
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9uJ3QgYWxsb3cgY3B1X2hvdHBsdWdfYmVnaW4gdG8gZmFpbCBieSBjb252ZXJ0aW5nIHRoZSB0
cnlsb2NrIGludG8gYQpibG9ja2luZyBsb2NrIGFjcXVpc2l0aW9uLiBXcml0ZSB1c2VycyBvZiB0
aGUgY3B1X2FkZF9yZW1vdmVfbG9jayBhcmUKbGltaXRlZCB0byBDUFUgcGx1Zy91bnBsdWcgb3Bl
cmF0aW9ucywgYW5kIGNhbm5vdCBkZWFkbG9jayBiZXR3ZWVuCnRoZW1zZWx2ZXMgb3Igb3RoZXIg
dXNlcnMgdGFraW5nIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcwpjcHVfYWRkX3JlbW92ZV9sb2Nr
IGlzIGFsd2F5cyBsb2NrZWQgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQuIFRoZXJlCmFyZSBhbHNv
IG5vIG90aGVyIGxvY2tzIHRha2VuIGR1cmluZyB0aGUgcGx1Zy91bnBsdWcgb3BlcmF0aW9ucy4K
ClRoZSBleGNsdXNpdmUgbG9jayB1c2FnZSBpbiByZWdpc3Rlcl9jcHVfbm90aWZpZXIgaXMgYWxz
byBjb252ZXJ0ZWQKaW50byBhIGJsb2NraW5nIGxvY2sgYWNxdWlzaXRpb24sIGFzIGl0IHdhcyBw
cmV2aW91c2x5IG5vdCBhbGxvd2VkIHRvCmZhaWwgYW55d2F5LgoKVGhpcyBpcyBtZWFuaW5nZnVs
IHdoZW4gcnVubmluZyBYZW4gaW4gc2hpbSBtb2RlLCBzaW5jZSBWQ1BVX3t1cC9kb3dufQpoeXBl
cmNhbGxzIHVzZSBjcHUgaG90cGx1Zy91bnBsdWcgb3BlcmF0aW9ucyBpbiB0aGUgYmFja2dyb3Vu
ZCwgYW5kCmhlbmNlIGZhaWxpbmcgdG8gdGFrZSB0aGUgbG9jayByZXN1bHRzIGluIFZQQ1Vfe3Vw
L2Rvd259IGZhaWxpbmcgd2l0aAotRUJVU1ksIHdoaWNoIG1vc3QgdXNlcnMgYXJlIG5vdCBwcmVw
YXJlZCB0byBoYW5kbGUuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCkkndmUgdGVzdGVkIHRoaXMgYW5kIHNlZW1zIHRvIHdvcmsgZmlu
ZSBBRkFJQ1QgZWl0aGVyIHdoZW4gcnVubmluZyBvbgpuYXRpdmUgb3Igd2hlbiB1c2VkIGluIHRo
ZSBzaGltLiBJJ20gbm90IHN1cmUgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5nCnRoYXQgd291bGQg
cHJldmVudCB0aGUgd3JpdGUgbG9jayBhY3F1aXNpdGlvbiBmcm9tIGJlaW5nIG1hZGUKYmxvY2tp
bmcuCi0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8ICAzICstLQogeGVuL2NvbW1vbi9jcHUu
YyAgICAgICB8IDEzICsrKysrLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9jcHUuaCAgfCAgMiAr
LQogMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5j
CmluZGV4IDY3ZWU0OTBmOTQuLmNjMGQ2MmY5ZTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9z
bXBib290LmMKKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwpAQCAtMTI4Niw4ICsxMjg2LDcg
QEAgaW50IGNwdV9hZGQodWludDMyX3QgYXBpY19pZCwgdWludDMyX3QgYWNwaV9pZCwgdWludDMy
X3QgcHhtKQogICAgICAgICAgKHB4bSA+PSAyNTYpICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CiAKLSAgICBpZiAoICFjcHVfaG90cGx1Z19iZWdpbigpICkKLSAgICAgICAgcmV0dXJuIC1FQlVT
WTsKKyAgICBjcHVfaG90cGx1Z19iZWdpbigpOwogCiAgICAgLyogRGV0ZWN0IGlmIHRoZSBjcHUg
aGFzIGJlZW4gYWRkZWQgYmVmb3JlICovCiAgICAgaWYgKCB4ODZfYWNwaWlkX3RvX2FwaWNpZFth
Y3BpX2lkXSAhPSBCQURfQVBJQ0lEICkKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vY3B1LmMgYi94
ZW4vY29tbW9uL2NwdS5jCmluZGV4IDBkN2ExMDg3OGMuLjMxOTUzZjMyZTQgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vY3B1LmMKKysrIGIveGVuL2NvbW1vbi9jcHUuYwpAQCAtNTEsOSArNTEsOSBA
QCB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKQogICAgIHJlYWRfdW5sb2NrKCZjcHVfYWRkX3JlbW92
ZV9sb2NrKTsKIH0KIAotYm9vbCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKQordm9pZCBjcHVfaG90
cGx1Z19iZWdpbih2b2lkKQogewotICAgIHJldHVybiB3cml0ZV90cnlsb2NrKCZjcHVfYWRkX3Jl
bW92ZV9sb2NrKTsKKyAgICB3cml0ZV9sb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKTsKIH0KIAog
dm9pZCBjcHVfaG90cGx1Z19kb25lKHZvaWQpCkBAIC02NSw4ICs2NSw3IEBAIHN0YXRpYyBOT1RJ
RklFUl9IRUFEKGNwdV9jaGFpbik7CiAKIHZvaWQgX19pbml0IHJlZ2lzdGVyX2NwdV9ub3RpZmll
cihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKQogewotICAgIGlmICggIXdyaXRlX3RyeWxvY2so
JmNwdV9hZGRfcmVtb3ZlX2xvY2spICkKLSAgICAgICAgQlVHKCk7IC8qIFNob3VsZCBuZXZlciBm
YWlsIGFzIHdlIGFyZSBjYWxsZWQgb25seSBkdXJpbmcgYm9vdC4gKi8KKyAgICB3cml0ZV9sb2Nr
KCZjcHVfYWRkX3JlbW92ZV9sb2NrKTsKICAgICBub3RpZmllcl9jaGFpbl9yZWdpc3RlcigmY3B1
X2NoYWluLCBuYik7CiAgICAgd3JpdGVfdW5sb2NrKCZjcHVfYWRkX3JlbW92ZV9sb2NrKTsKIH0K
QEAgLTEwMCw4ICs5OSw3IEBAIGludCBjcHVfZG93bih1bnNpZ25lZCBpbnQgY3B1KQogICAgIGlu
dCBlcnI7CiAgICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiA9IE5VTEw7CiAKLSAgICBpZiAo
ICFjcHVfaG90cGx1Z19iZWdpbigpICkKLSAgICAgICAgcmV0dXJuIC1FQlVTWTsKKyAgICBjcHVf
aG90cGx1Z19iZWdpbigpOwogCiAgICAgZXJyID0gLUVJTlZBTDsKICAgICBpZiAoIChjcHUgPj0g
bnJfY3B1X2lkcykgfHwgKGNwdSA9PSAwKSApCkBAIC0xNDIsOCArMTQwLDcgQEAgaW50IGNwdV91
cCh1bnNpZ25lZCBpbnQgY3B1KQogICAgIGludCBlcnI7CiAgICAgc3RydWN0IG5vdGlmaWVyX2Js
b2NrICpuYiA9IE5VTEw7CiAKLSAgICBpZiAoICFjcHVfaG90cGx1Z19iZWdpbigpICkKLSAgICAg
ICAgcmV0dXJuIC1FQlVTWTsKKyAgICBjcHVfaG90cGx1Z19iZWdpbigpOwogCiAgICAgZXJyID0g
LUVJTlZBTDsKICAgICBpZiAoIChjcHUgPj0gbnJfY3B1X2lkcykgfHwgIWNwdV9wcmVzZW50KGNw
dSkgKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2NwdS5oIGIveGVuL2luY2x1ZGUveGVu
L2NwdS5oCmluZGV4IGU0OTE3MmY2NGMuLmU4ZWViMjE3YTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9jcHUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1LmgKQEAgLTEwLDcgKzEwLDcg
QEAgYm9vbCBnZXRfY3B1X21hcHModm9pZCk7CiB2b2lkIHB1dF9jcHVfbWFwcyh2b2lkKTsKIAog
LyogU2FmZWx5IHBlcmZvcm0gQ1BVIGhvdHBsdWcgYW5kIHVwZGF0ZSBjcHVfb25saW5lX21hcCwg
ZXRjLiAqLwotYm9vbCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKTsKK3ZvaWQgY3B1X2hvdHBsdWdf
YmVnaW4odm9pZCk7CiB2b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCk7CiAKIC8qIFJlY2VpdmUg
bm90aWZpY2F0aW9uIG9mIENQVSBob3RwbHVnIGV2ZW50cy4gKi8KLS0gCjIuMjUuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
