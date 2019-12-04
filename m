Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC31112E24
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 16:16:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icWKt-0007vD-Db; Wed, 04 Dec 2019 15:13:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icWKs-0007v8-3z
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 15:13:02 +0000
X-Inumbo-ID: 8f6ca91e-16a8-11ea-9c09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f6ca91e-16a8-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575472381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LYlNAdMhxQZ1m+Ojk/FGSXu17tdP+HmX5ldv9W2jdd4=;
 b=HloNe0DGaS2jdmqoK5jZQRy26fqo/3eT7UEraQw5H8IwU8RvDoJoBecl
 R59ny3zemXFrSqSdyc2dPLF6SqDTttnLR7VNkKi52jz6FFwuHpJG4tAXP
 Vwyu0bpdF3h28IGuIqhi28Ng6YZtaIcxfdNHHusqHsz1hFHGNZJEUbjKt E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2PIfGPZufqSVYPQ+uy0KxtJcCeB1b2mF83VbyWKPd7fPXxhZD7A0NuXn8dyOmEXaOmcRon9Itb
 V8NbcmTTiBkGpQqS7B4RIKcjMdefAPTlnkB/koyXW/xk5uC3qa967cQmoqhKHbADy1Tq91EzVg
 nHb7lOtQ741LRyqvX3bl6wFR7YBBPfuq78e3A+kkkxTMoehZJqKMqXdL27cgzfdLmAc2R9WAbY
 6oaYe0bqR6GOT39PLWl90jT9D7K/+mpYPUqrtMKyp5Q4oHUv7Dzs40F7rfBveZ8Q1lN5DnDTWQ
 kFE=
X-SBRS: 2.7
X-MesageID: 9195584
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9195584"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 16:12:08 +0100
Message-ID: <20191204151208.37076-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB1c2luZyBnbG9iYWwgcGFnZXMgYSBmdWxsIHRsYiBmbHVzaCBjYW4gb25seSBiZSBwZXJm
b3JtZWQgYnkKdG9nZ2xpbmcgdGhlIFBHRSBiaXQgaW4gQ1I0LCB3aGljaCBpcyB1c3VhbGx5IHF1
aXRlIGV4cGVuc2l2ZSBpbiB0ZXJtcwpvZiBwZXJmb3JtYW5jZSB3aGVuIHJ1bm5pbmcgdmlydHVh
bGl6ZWQuIFRoaXMgaXMgc3BlY2lhbGx5IHJlbGV2YW50IG9uCkFNRCBoYXJkd2FyZSwgd2hpY2gg
ZG9lc24ndCBoYXZlIHRoZSBhYmlsaXR5IHRvIGRvIHNlbGVjdGl2ZSBDUjQKdHJhcHBpbmcsIGJ1
dCBjYW4gYWxzbyBiZSByZWxldmFudCBvbiBJbnRlbCBpZiB0aGUgdW5kZXJseWluZwpoeXBlcnZp
c29yIGFsc28gdHJhcHMgYWNjZXNzZXMgdG8gdGhlIFBHRSBDUjQgYml0LgoKSW4gb3JkZXIgdG8g
YXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkbyBub3QgdXNlIGdsb2JhbCBwYWdlcwp3
aGVuIHJ1bm5pbmcgdmlydHVhbGl6ZWQgb24gQU1EIGhhcmR3YXJlLiBBIGNvbW1hbmQgbGluZSBv
cHRpb24KJ2dsb2JhbC1wYWdlcycgaXMgcHJvdmlkZWQgaW4gb3JkZXIgdG8gYWxsb3cgdGhlIHVz
ZXIgdG8gc2VsZWN0CndoZXRoZXIgZ2xvYmFsIHBhZ2VzIHdpbGwgYmUgZW5hYmxlZCBmb3IgUFYg
Z3Vlc3RzLgoKVGhlIGFib3ZlIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBzaGltIHJ1bm5pbmcgb24g
QU1EIGhhcmR3YXJlIHdpdGgKMzIgdkNQVXM6CgpQR0UgZW5hYmxlZCwgeDJBUElDIG1vZGU6Cgoo
WEVOKSBHbG9iYWwgbG9jayBmbHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YjAxYzAsIGxvY2t2
YWw9MWFkYjFhZGIsIG5vdCBsb2NrZWQKKFhFTikgICBsb2NrOjE4NDE4ODMoMTM3NTEyODk5ODU0
MyksIGJsb2NrOjE2NTg3MTYoMTAxOTMwNTQ4OTA3ODEpCgpBdmVyYWdlIGxvY2sgdGltZTogICA3
NDY1ODhucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDYxNDUxNDducwoKUEdFIGRpc2FibGVkLCB4MkFQ
SUMgbW9kZToKCihYRU4pIEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRh
ZjFjMCwgbG9ja3ZhbD1hOGJmYThiZiwgbm90IGxvY2tlZAooWEVOKSAgIGxvY2s6MjczMDE3NSg2
NTc1MDUzODk4ODYpLCBibG9jazoyMDM5NzE2KDI5NjM3NjgyNDc3MzgpCgpBdmVyYWdlIGxvY2sg
dGltZTogICAyNDA4MjlucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDE0NTMwMjlucwoKQXMgc2VlbiBm
cm9tIHRoZSBhYm92ZSBmaWd1cmVzIHRoZSBsb2NrIGFuZCBibG9jayB0aW1lIG9mIHRoZSBmbHVz
aApsb2NrIGlzIHJlZHVjZWQgdG8gYXBwcm94aW1hdGVseSAxLzMgb2YgdGhlIG9yaWdpbmFsIHZh
bHVlLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYyOgogLSBTZXQgdGhlIGRlZmF1bHQgdmFsdWUgYXQgaW5p
dCBpZiBub3Qgc3BlY2lmaWVkIGJ5IHRoZSB1c2VyLgogLSBVc2UgaW50OF90IGFuZCByZWFkX21v
c3RseSBmb3Igb3B0X2dsb2JhbF9wYWdlcy4KCkNoYW5nZXMgc2luY2UgdjE6CiAtIFByb3ZpZGUg
Y29tbWFuZCBsaW5lIG9wdGlvbiB0byBlbmFibGUvZGlzYWJsZSBQR0UuCiAtIE9ubHkgZGlzYWJs
ZSBQR0Ugb24gQU1EIGhhcmR3YXJlIHdoZW4gdmlydHVhbGl6ZWQuCiAtIERvY3VtZW50IHRoZSBn
bG9iYWwtcGFnZXMgb3B0aW9uLgotLS0KIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
YyB8IDEzICsrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9wdi9kb21haW4uYyAgICAgICAgICB8
IDE1ICsrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFu
ZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCmluZGV4IGQ5NDk1ZWY2Yjku
LjdiZTMwZjI3NjYgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
YworKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKQEAgLTEwODcsNiArMTA4
NywxOSBAQCB2YWx1ZSBzZXR0YWJsZSB2aWEgWGVuIHRvb2xzLgogCiBEb20wIGlzIHVzaW5nIHRo
aXMgdmFsdWUgZm9yIHNpemluZyBpdHMgbWFwdHJhY2sgdGFibGUuCiAKKyMjIyBnbG9iYWwtcGFn
ZXMgKHg4NikKKz4gYD0gPGJvb2xlYW4+YAorCis+IERlZmF1bHQ6IGB0cnVlYCB1bmxlc3MgcnVu
bmluZyB2aXJ0dWFsaXplZCBvbiBBTUQgaGFyZHdhcmUKKworU2V0IHdoZXRoZXIgdGhlIFBHRSBi
aXQgaW4gQ1I0IHdpbGwgYmUgZW5hYmxlZCBmb3IgUFYgZ3Vlc3RzLiBUaGlzIGNvbnRyb2xzIHRo
ZQordXNhZ2Ugb2YgZ2xvYmFsIHBhZ2VzLCBhbmQgdGh1cyB0aGUgbmVlZCB0byBwZXJmb3JtIHRs
YiBmbHVzaGVzIGJ5IHdyaXRpbmcgdG8KK0NSNC4KKworTm90ZSBpdCdzIGRpc2FibGVkIGJ5IGRl
ZmF1bHQgd2hlbiBydW5uaW5nIHZpcnR1YWxpemVkIG9uIEFNRCBoYXJkd2FyZSBzaW5jZQorQU1E
IFNWTSBkb2Vzbid0IHN1cHBvcnQgc2VsZWN0aXZlIHRyYXBwaW5nIG9mIENSNCwgc28gZ2xvYmFs
IHBhZ2VzIGFyZSBub3QKK2VuYWJsZWQgaW4gb3JkZXIgdG8gcmVkdWNlIHRoZSBvdmVyaGVhZCBv
ZiB0bGIgZmx1c2hlcy4KKwogIyMjIGd1ZXN0X2xvZ2x2bAogPiBgPSA8bGV2ZWw+Wy88cmF0ZS1s
aW1pdGVkIGxldmVsPl1gIHdoZXJlIGxldmVsIGlzIGBub25lIHwgZXJyb3IgfCB3YXJuaW5nIHwg
aW5mbyB8IGRlYnVnIHwgYWxsYAogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvZG9tYWlu
LmMgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKaW5kZXggNGI2ZjQ4ZGVhMi4uOGZmNzMzZjU2
YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9wdi9kb21haW4uYwpAQCAtMTE4LDYgKzExOCwxOSBAQCB1bnNpZ25lZCBsb25nIHB2X2ZpeHVw
X2d1ZXN0X2NyNChjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBjcjQpCiAgICAg
ICAgICAgICAobW11X2NyNF9mZWF0dXJlcyAmIFBWX0NSNF9HVUVTVF9WSVNJQkxFX01BU0spKTsK
IH0KIAorc3RhdGljIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9nbG9iYWxfcGFnZXMgPSAtMTsK
K2Jvb2xlYW5fcnVudGltZV9wYXJhbSgiZ2xvYmFsLXBhZ2VzIiwgb3B0X2dsb2JhbF9wYWdlcyk7
CisKK3N0YXRpYyBpbnQgX19pbml0IHBnZV9pbml0KHZvaWQpCit7CisgICAgaWYgKCBvcHRfZ2xv
YmFsX3BhZ2VzID09IC0xICkKKyAgICAgICAgb3B0X2dsb2JhbF9wYWdlcyA9ICFjcHVfaGFzX2h5
cGVydmlzb3IgfHwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2
X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRDsKKworICAgIHJldHVybiAwOworfQorX19pbml0Y2Fs
bChwZ2VfaW5pdCk7CisKIHVuc2lnbmVkIGxvbmcgcHZfbWFrZV9jcjQoY29uc3Qgc3RydWN0IHZj
cHUgKnYpCiB7CiAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKQEAgLTEz
MCw3ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1
ICp2KQogICAgICAqLwogICAgIGlmICggZC0+YXJjaC5wdi5wY2lkICkKICAgICAgICAgY3I0IHw9
IFg4Nl9DUjRfUENJREU7Ci0gICAgZWxzZSBpZiAoICFkLT5hcmNoLnB2LnhwdGkgKQorICAgIGVs
c2UgaWYgKCAhZC0+YXJjaC5wdi54cHRpICYmIG9wdF9nbG9iYWxfcGFnZXMgKQogICAgICAgICBj
cjQgfD0gWDg2X0NSNF9QR0U7CiAKICAgICAvKgotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
