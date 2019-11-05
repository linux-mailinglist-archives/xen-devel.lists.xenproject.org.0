Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C0F0649
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 20:51:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS4pI-0006Gc-62; Tue, 05 Nov 2019 19:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rgKV=Y5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iS4pG-0006GT-Jc
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 19:49:14 +0000
X-Inumbo-ID: 577c2642-0005-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 577c2642-0005-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 19:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572983353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ycOqv6kD+Z+hJnHNzSqQkOsZVZVHAO/96AIBmdOBHj4=;
 b=SbC5tPh9uhgMIfIiA8voDhDG9vgJNtmyXNRGEPKH3U1OnRMB3sn/eZha
 /lRJguxYIAqtYEUZaiifoVxOlhMaBshiP5Sir7mWQEBmWsCvi9SbfPih5
 naiQgIJN7c8pjOOAUIWTduCjKZ4vtfe9RYy6lBltLmfAQnRPbd8sOj5BK s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LLaHzHIvjFeliltcmXgNjjWUwVB7om6+Cj70cYFsARX1md26KFrM7CeaASYNI/Z+KaHlPY3jJv
 yLvdfU0aUX2Bte8ldvnzdjoPeWpKj1t4giIgUAgLVZQj/BhFyIM8o0gSO9bApaRc8rBN0+nUJZ
 uCLdzQ48VHJlKrFeZuvJxJFJ2W3kCU7FsNm9B+c11lAhibE4CVaOuqwSL6OpsJZC8ZWAyhkl9m
 riGCcp1jcafPsKJ82hXiRhmnAncfg6YgCM7Ghp+hqTqafqjSStsaosba3fvVpWJJ3456ubYHLg
 iEI=
X-SBRS: 2.7
X-MesageID: 8236833
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,271,1569297600"; 
   d="scan'208";a="8236833"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 5 Nov 2019 19:49:09 +0000
Message-ID: <20191105194909.32234-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191105194317.16232-3-andrew.cooper3@citrix.com>
References: <20191105194317.16232-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1.5] x86/livepatch: Prevent patching with
 active waitqueues
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
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNhZmV0eSBvZiBsaXZlcGF0Y2hpbmcgZGVwZW5kcyBvbiBldmVyeSBzdGFjayBoYXZpbmcg
YmVlbiB1bndvdW5kLCBidXQKdGhlcmUgaXMgb25lIGNvcm5lciBjYXNlIHdoZXJlIHRoaXMgaXMg
bm90IHRydWUuICBUaGUgU2hhcmluZy9QYWdpbmcvTW9uaXRvcgppbmZyYXN0cnVjdHVyZSBtYXkg
dXNlIHdhaXRxdWV1ZXMsIHdoaWNoIGNvcHkgdGhlIHN0YWNrIGZyYW1lIHNpZGV3YXlzIGFuZAps
b25nam1wKCkgdG8gYSBkaWZmZXJlbnQgdmNwdS4KClRoaXMgY2FzZSBpcyByYXJlLCBhbmQgY2Fu
IGJlIHdvcmtlZCBhcm91bmQgYnkgcGF1c2luZyB0aGUgb2ZmZW5kaW5nCmRvbWFpbihzKSwgd2Fp
dGluZyBmb3IgdGhlaXIgcmluZ3MgdG8gZHJhaW4sIHRoZW4gcGVyZm9ybWluZyBhIGxpdmVwYXRj
aC4KCkluIHRoZSBjYXNlIHRoYXQgdGhlcmUgaXMgYW4gYWN0aXZlIHdhaXRxdWV1ZSwgZmFpbCB0
aGUgbGl2ZXBhdGNoIGF0dGVtcHQgd2l0aAotRUJVU1ksIHdoaWNoIGlzIHByZWZvcmFibGUgdG8g
dGhlIGZpcmV3b3JrcyB3aGljaCBvY2N1ciBmcm9tIHRyeWluZyB0byB1bndpbmQKdGhlIG9sZCBz
dGFjayBmcmFtZSBhdCBhIGxhdGVyIHBvaW50LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClRo
aXMgZml4IHdhbnRzIGJhY2twb3J0aW5nLCBhbmQgaXMgbG9uZyBvdmVyZHVlIGZvciBwb3N0aW5n
IHVwc3RyZWFtLgoKdjEuNToKICogU2VuZCBvdXQgYSBub24tc3RhbGUgcGF0Y2ggdGhpcyB0aW1l
LgotLS0KIHhlbi9hcmNoL2FybS9saXZlcGF0Y2guYyAgICB8ICA1ICsrKysrCiB4ZW4vYXJjaC94
ODYvbGl2ZXBhdGNoLmMgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiB4ZW4vY29tbW9uL2xpdmVwYXRjaC5jICAgICAgfCAgOCArKysrKysrKwogeGVuL2lu
Y2x1ZGUveGVuL2xpdmVwYXRjaC5oIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jIGIveGVuL2FyY2gv
YXJtL2xpdmVwYXRjaC5jCmluZGV4IDAwYzVlMmJjNDUuLjkxNWU5ZDkyNmEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS9saXZlcGF0Y2guYworKysgYi94ZW4vYXJjaC9hcm0vbGl2ZXBhdGNoLmMK
QEAgLTE4LDYgKzE4LDExIEBACiAKIHZvaWQgKnZtYXBfb2ZfeGVuX3RleHQ7CiAKK2ludCBhcmNo
X2xpdmVwYXRjaF9zYWZldHlfY2hlY2sodm9pZCkKK3sKKyAgICByZXR1cm4gMDsKK30KKwogaW50
IGFyY2hfbGl2ZXBhdGNoX3F1aWVzY2Uodm9pZCkKIHsKICAgICBtZm5fdCB0ZXh0X21mbjsKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYyBiL3hlbi9hcmNoL3g4Ni9saXZlcGF0
Y2guYwppbmRleCBjODJjZjUzYjllLi4yNzQ5Y2JjNWNmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvbGl2ZXBhdGNoLmMKKysrIGIveGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jCkBAIC0xMCwxMCAr
MTAsNTAgQEAKICNpbmNsdWRlIDx4ZW4vdm1hcC5oPgogI2luY2x1ZGUgPHhlbi9saXZlcGF0Y2hf
ZWxmLmg+CiAjaW5jbHVkZSA8eGVuL2xpdmVwYXRjaC5oPgorI2luY2x1ZGUgPHhlbi9zY2hlZC5o
PgogCiAjaW5jbHVkZSA8YXNtL25taS5oPgogI2luY2x1ZGUgPGFzbS9saXZlcGF0Y2guaD4KIAor
c3RhdGljIGJvb2wgaGFzX2FjdGl2ZV93YWl0cXVldWUoY29uc3Qgc3RydWN0IHZtX2V2ZW50X2Rv
bWFpbiAqdmVkKQoreworICAgIC8qIHZlZCBtYXkgYmUgeHphbGxvYygpJ2Qgd2l0aG91dCBJTklU
X0xJU1RfSEVBRCgpIHlldC4gKi8KKyAgICByZXR1cm4gKHZlZCAmJiAhbGlzdF9oZWFkX2lzX251
bGwoJnZlZC0+d3EubGlzdCkgJiYKKyAgICAgICAgICAgICFsaXN0X2VtcHR5KCZ2ZWQtPndxLmxp
c3QpKTsKK30KKworLyoKKyAqIHg4NidzIGltcGxlbWVudGF0aW9uIG9mIHdhaXRxdWV1ZSB2aW9s
YXRlcyB0aGUgbGl2ZXBhdGNoaW5nIHNhZmV5IHByaW5jaXBsZQorICogb2YgaGF2aW5nIHVud291
bmQgZXZlcnkgQ1BVcyBzdGFjayBiZWZvcmUgbW9kaWZ5aW5nIGxpdmUgY29udGVudC4KKyAqCisg
KiBTZWFyY2ggdGhyb3VnaCBldmVyeSBkb21haW4gYW5kIGNoZWNrIHRoYXQgbm8gdkNQVXMgaGF2
ZSBhbiBhY3RpdmUKKyAqIHdhaXRxdWV1ZS4KKyAqLworaW50IGFyY2hfbGl2ZXBhdGNoX3NhZmV0
eV9jaGVjayh2b2lkKQoreworICAgIHN0cnVjdCBkb21haW4gKmQ7CisKKyAgICBmb3JfZWFjaF9k
b21haW4gKCBkICkKKyAgICB7CisjaWZkZWYgQ09ORklHX01FTV9TSEFSSU5HCisgICAgICAgIGlm
ICggaGFzX2FjdGl2ZV93YWl0cXVldWUoZC0+dm1fZXZlbnRfc2hhcmUpICkKKyAgICAgICAgICAg
IGdvdG8gZmFpbDsKKyNlbmRpZgorI2lmZGVmIENPTkZJR19NRU1fUEFHSU5HCisgICAgICAgIGlm
ICggaGFzX2FjdGl2ZV93YWl0cXVldWUoZC0+dm1fZXZlbnRfcGFnaW5nKSApCisgICAgICAgICAg
ICBnb3RvIGZhaWw7CisjZW5kaWYKKyAgICAgICAgaWYgKCBoYXNfYWN0aXZlX3dhaXRxdWV1ZShk
LT52bV9ldmVudF9tb25pdG9yKSApCisgICAgICAgICAgICBnb3RvIGZhaWw7CisgICAgfQorCisg
ICAgcmV0dXJuIDA7CisKKyBmYWlsOgorICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAi
JXBkIGZvdW5kIHdpdGggYWN0aXZlIHdhaXRxdWV1ZVxuIiwgZCk7CisgICAgcmV0dXJuIC1FQlVT
WTsKK30KKwogaW50IGFyY2hfbGl2ZXBhdGNoX3F1aWVzY2Uodm9pZCkKIHsKICAgICAvKiBEaXNh
YmxlIFdQIHRvIGFsbG93IGNoYW5nZXMgdG8gcmVhZC1vbmx5IHBhZ2VzLiAqLwpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKaW5kZXgg
OTYyNjQ3NjE2YS4uODM4NmU2MTFmMiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2gu
YworKysgYi94ZW4vY29tbW9uL2xpdmVwYXRjaC5jCkBAIC0xMDYwLDYgKzEwNjAsMTQgQEAgc3Rh
dGljIGludCBhcHBseV9wYXlsb2FkKHN0cnVjdCBwYXlsb2FkICpkYXRhKQogICAgIHVuc2lnbmVk
IGludCBpOwogICAgIGludCByYzsKIAorICAgIHJjID0gYXJjaF9saXZlcGF0Y2hfc2FmZXR5X2No
ZWNrKCk7CisgICAgaWYgKCByYyApCisgICAgeworICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBM
SVZFUEFUQ0ggIiVzOiBTYWZldHkgY2hlY2tzIGZhaWxlZDogJWRcbiIsCisgICAgICAgICAgICAg
ICBkYXRhLT5uYW1lLCByYyk7CisgICAgICAgIHJldHVybiByYzsKKyAgICB9CisKICAgICBwcmlu
dGsoWEVOTE9HX0lORk8gTElWRVBBVENIICIlczogQXBwbHlpbmcgJXUgZnVuY3Rpb25zXG4iLAog
ICAgICAgICAgICAgZGF0YS0+bmFtZSwgZGF0YS0+bmZ1bmNzKTsKIApkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCmlu
ZGV4IDFiMTgxN2NhMGQuLjY5ZWRlNzVkMjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9s
aXZlcGF0Y2guaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKQEAgLTEwNCw2ICsx
MDQsNyBAQCBzdGF0aWMgaW5saW5lIGludCBsaXZlcGF0Y2hfdmVyaWZ5X2Rpc3RhbmNlKGNvbnN0
IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYykKICAqIFRoZXNlIGZ1bmN0aW9ucyBhcmUgY2Fs
bGVkIGFyb3VuZCB0aGUgY3JpdGljYWwgcmVnaW9uIHBhdGNoaW5nIGxpdmUgY29kZSwKICAqIGZv
ciBhbiBhcmNoaXRlY3R1cmUgdG8gdGFrZSBtYWtlIGFwcHJvcHJhdGllIGdsb2JhbCBzdGF0ZSBh
ZGp1c3RtZW50cy4KICAqLworaW50IGFyY2hfbGl2ZXBhdGNoX3NhZmV0eV9jaGVjayh2b2lkKTsK
IGludCBhcmNoX2xpdmVwYXRjaF9xdWllc2NlKHZvaWQpOwogdm9pZCBhcmNoX2xpdmVwYXRjaF9y
ZXZpdmUodm9pZCk7CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
