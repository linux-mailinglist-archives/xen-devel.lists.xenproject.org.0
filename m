Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A4164C75
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:48:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TOy-0001u3-7g; Wed, 19 Feb 2020 17:44:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4TOx-0001tc-2q
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:44:47 +0000
X-Inumbo-ID: 7cd4959a-533f-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cd4959a-533f-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 17:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582134272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k+kFKZ4dujIcrkjaPRXOqC+t0sgVPXVwOVOrCsPeZgc=;
 b=MTZcmdplBScFpF9uZfnQeggzPXvX9x+wa9xxrot0dVNbuhAs+x7BLbIC
 DUlbryrmBNxc/vIhAJ3rfT8ZwPoBWIk3I4Z5OF8Tn4P55lcWLcx2eEoNN
 zsCqiiJcAlSIX6Hcr1Y2M1W0ioqnnxB0dovyoNrKU02NjICR9N99CrUZC Q=;
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
IronPort-SDR: RVYiFC6X6ULTUStw7QizWtEFDsI3WWheBpV/BZW9kk6lTGgZom4b1jSWrdyc/9keb5M7H8o39m
 E4Ab1qugR/FmD1qEKIj/U4/m6pezZbBp6iy2lzSQH3fe0vVg957uUBu4X4++HIVipYDLz5HFFP
 LjQbruY0uctMIr+hUSkaYUr5hqdf346cuazQ/z832nT+9N10RkQzkJ+XKTfdpSf/YUQ3pj/JLV
 +gVdslmEYw4wSumQH1uJUtFX0erFvM8Oz/cpp8LyCrBMjOXqTDpPJEoGj0zIWkyQ7BIDA0Xzl/
 plg=
X-SBRS: 2.7
X-MesageID: 13064291
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13064291"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 18:43:52 +0100
Message-ID: <20200219174354.84726-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219174354.84726-1-roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 5/7] x86/tlb: allow disabling the TLB clock
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

VGhlIFRMQiBjbG9jayBpcyBoZWxwZnVsIHdoZW4gcnVubmluZyBYZW4gb24gYmFyZSBtZXRhbCBi
ZWNhdXNlIHdoZW4KZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUgaXMgSVBJJ2VkIGFuZCBjYW4g
a2VlcCBhIHRpbWVzdGFtcCBvZiB0aGUKbGFzdCBmbHVzaC4KClRoaXMgaXMgbm90IHRoZSBjYXNl
IGhvd2V2ZXIgd2hlbiBYZW4gaXMgcnVubmluZyB2aXJ0dWFsaXplZCwgYW5kIHRoZQp1bmRlcmx5
aW5nIGh5cGVydmlzb3IgcHJvdmlkZXMgbWVjaGFuaXNtIHRvIGFzc2lzdCBpbiBwZXJmb3JtaW5n
IFRMQgpmbHVzaGVzOiBYZW4gaXRzZWxmIGZvciBleGFtcGxlIG9mZmVycyBhIEhWTU9QX2ZsdXNo
X3RsYnMgaHlwZXJjYWxsIGluCm9yZGVyIHRvIHBlcmZvcm0gYSBUTEIgZmx1c2ggd2l0aG91dCBo
YXZpbmcgdG8gSVBJIGVhY2ggQ1BVLiBXaGVuCnVzaW5nIHN1Y2ggbWVjaGFuaXNtcyBpdCdzIG5v
IGxvbmdlciBwb3NzaWJsZSB0byBrZWVwIGEgdGltZXN0YW1wIG9mCnRoZSBmbHVzaGVzIG9uIGVh
Y2ggQ1BVLCBhcyB0aGV5IGFyZSBwZXJmb3JtZWQgYnkgdGhlIHVuZGVybHlpbmcKaHlwZXJ2aXNv
ci4KCk9mZmVyIGEgYm9vbGVhbiBpbiBvcmRlciB0byBzaWduYWwgWGVuIHRoYXQgdGhlIHRpbWVz
dGFtcGVkIFRMQgpzaG91bGRuJ3QgYmUgdXNlZC4gVGhpcyBhdm9pZHMga2VlcGluZyB0aGUgdGlt
ZXN0YW1wcyBvZiB0aGUgZmx1c2hlcywKYW5kIGFsc28gZm9yY2VzIE5FRURfRkxVU0ggdG8gYWx3
YXlzIHJldHVybiB0cnVlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGFzIHRoaXMg
Y2hhbmdlIGRvZXNuJ3QgaW50cm9kdWNlIGFueQp1c2VyIHRoYXQgZGlzYWJsZXMgdGhlIHRpbWVz
dGFtcGVkIFRMQi4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB4ZW4vYXJj
aC94ODYvZmx1c2h0bGIuYyAgICAgICAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2ZsdXNodGxiLmggfCAxNyArKysrKysrKysrKysrKysrLQogMiBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9mbHVzaHRsYi5jIGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKaW5kZXggZTdj
Y2Q0ZWM3Yi4uMzY0OTkwMDc5MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMK
KysrIGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKQEAgLTMyLDYgKzMyLDkgQEAKIHUzMiB0bGJm
bHVzaF9jbG9jayA9IDFVOwogREVGSU5FX1BFUl9DUFUodTMyLCB0bGJmbHVzaF90aW1lKTsKIAor
LyogU2lnbmFscyB3aGV0aGVyIHRoZSBUTEIgZmx1c2ggY2xvY2sgaXMgaW4gdXNlLiAqLworYm9v
bCBfX3JlYWRfbW9zdGx5IHRsYl9jbGtfZW5hYmxlZCA9IHRydWU7CisKIC8qCiAgKiBwcmVfZmx1
c2goKTogSW5jcmVtZW50IHRoZSB2aXJ0dWFsIFRMQi1mbHVzaCBjbG9jay4gUmV0dXJucyBuZXcg
Y2xvY2sgdmFsdWUuCiAgKiAKQEAgLTgyLDEyICs4NSwxMyBAQCBzdGF0aWMgdm9pZCBwb3N0X2Zs
dXNoKHUzMiB0KQogc3RhdGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQpCiB7CiAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFncywgY3I0OwotICAgIHUzMiB0OworICAgIHUzMiB0ID0gMDsKIAogICAgIC8q
IFRoaXMgbm9uLXJlZW50cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVy
cnVwdCBjb250ZXh0LiAqLwogICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKIAotICAgIHQgPSBw
cmVfZmx1c2goKTsKKyAgICBpZiAoIHRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHQgPSBwcmVf
Zmx1c2goKTsKIAogICAgIGlmICggdXNlX2ludnBjaWQgKQogICAgICAgICBpbnZwY2lkX2ZsdXNo
X2FsbCgpOwpAQCAtOTksNyArMTAzLDggQEAgc3RhdGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQp
CiAgICAgZWxzZQogICAgICAgICB3cml0ZV9jcjMocmVhZF9jcjMoKSk7CiAKLSAgICBwb3N0X2Zs
dXNoKHQpOworICAgIGlmICggdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAgcG9zdF9mbHVzaCh0
KTsKIAogICAgIGxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKIH0KQEAgLTEwNyw3ICsxMTIsNyBA
QCBzdGF0aWMgdm9pZCBkb190bGJfZmx1c2godm9pZCkKIHZvaWQgc3dpdGNoX2NyM19jcjQodW5z
aWduZWQgbG9uZyBjcjMsIHVuc2lnbmVkIGxvbmcgY3I0KQogewogICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3MsIG9sZF9jcjQ7Ci0gICAgdTMyIHQ7CisgICAgdTMyIHQgPSAwOwogCiAgICAgLyogVGhy
b3VnaG91dCB0aGlzIGZ1bmN0aW9uIHdlIG1ha2UgdGhpcyBhc3N1bXB0aW9uOiAqLwogICAgIEFT
U0VSVCghKGNyNCAmIFg4Nl9DUjRfUENJREUpIHx8ICEoY3I0ICYgWDg2X0NSNF9QR0UpKTsKQEAg
LTExNSw3ICsxMjAsOCBAQCB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxvbmcgY3IzLCB1
bnNpZ25lZCBsb25nIGNyNCkKICAgICAvKiBUaGlzIG5vbi1yZWVudHJhbnQgZnVuY3Rpb24gaXMg
c29tZXRpbWVzIGNhbGxlZCBpbiBpbnRlcnJ1cHQgY29udGV4dC4gKi8KICAgICBsb2NhbF9pcnFf
c2F2ZShmbGFncyk7CiAKLSAgICB0ID0gcHJlX2ZsdXNoKCk7CisgICAgaWYgKCB0bGJfY2xrX2Vu
YWJsZWQgKQorICAgICAgICB0ID0gcHJlX2ZsdXNoKCk7CiAKICAgICBvbGRfY3I0ID0gcmVhZF9j
cjQoKTsKICAgICBBU1NFUlQoIShvbGRfY3I0ICYgWDg2X0NSNF9QQ0lERSkgfHwgIShvbGRfY3I0
ICYgWDg2X0NSNF9QR0UpKTsKQEAgLTE2Nyw3ICsxNzMsOCBAQCB2b2lkIHN3aXRjaF9jcjNfY3I0
KHVuc2lnbmVkIGxvbmcgY3IzLCB1bnNpZ25lZCBsb25nIGNyNCkKICAgICBpZiAoIGNyNCAmIFg4
Nl9DUjRfUENJREUgKQogICAgICAgICBpbnZwY2lkX2ZsdXNoX2FsbF9ub25nbG9iYWxzKCk7CiAK
LSAgICBwb3N0X2ZsdXNoKHQpOworICAgIGlmICggdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAg
cG9zdF9mbHVzaCh0KTsKIAogICAgIGxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKIH0KZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaCBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvZmx1c2h0bGIuaAppbmRleCAwN2Y5YmM2MTAzLi45NzczMDE0MzIwIDEwMDY0NAotLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9m
bHVzaHRsYi5oCkBAIC0yMSwxMCArMjEsMjEgQEAgZXh0ZXJuIHUzMiB0bGJmbHVzaF9jbG9jazsK
IC8qIFRpbWUgYXQgd2hpY2ggZWFjaCBDUFUncyBUTEIgd2FzIGxhc3QgZmx1c2hlZC4gKi8KIERF
Q0xBUkVfUEVSX0NQVSh1MzIsIHRsYmZsdXNoX3RpbWUpOwogCi0jZGVmaW5lIHRsYmZsdXNoX2N1
cnJlbnRfdGltZSgpIHRsYmZsdXNoX2Nsb2NrCisvKiBUTEIgY2xvY2sgaXMgaW4gdXNlLiAqLwor
ZXh0ZXJuIGJvb2wgdGxiX2Nsa19lbmFibGVkOworCitzdGF0aWMgaW5saW5lIHVpbnQzMl90IHRs
YmZsdXNoX2N1cnJlbnRfdGltZSh2b2lkKQoreworICAgIC8qIFJldHVybmluZyAwIGZyb20gdGxi
Zmx1c2hfY3VycmVudF90aW1lIHdpbGwgYWx3YXlzIGZvcmNlIGEgZmx1c2guICovCisgICAgcmV0
dXJuIHRsYl9jbGtfZW5hYmxlZCA/IHRsYmZsdXNoX2Nsb2NrIDogMDsKK30KIAogc3RhdGljIGlu
bGluZSB2b2lkIHBhZ2Vfc2V0X3RsYmZsdXNoX3RpbWVzdGFtcChzdHJ1Y3QgcGFnZV9pbmZvICpw
YWdlKQogeworICAgIC8qIEF2b2lkIHRoZSB3cml0ZSBpZiB0aGUgVExCIGNsb2NrIGlzIGRpc2Fi
bGVkLiAqLworICAgIGlmICggIXRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHJldHVybjsKKwog
ICAgIC8qCiAgICAgICogUHJldmVudCBzdG9yaW5nIGEgc3RhbGUgdGltZSBzdGFtcCwgd2hpY2gg
Y291bGQgaGFwcGVuIGlmIGFuIHVwZGF0ZQogICAgICAqIHRvIHRsYmZsdXNoX2Nsb2NrIHBsdXMg
YSBzdWJzZXF1ZW50IGZsdXNoIElQSSBoYXBwZW4gYmV0d2VlbiB0aGUKQEAgLTY3LDYgKzc4LDEw
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJmbHVzaF9maWx0ZXIoY3B1bWFza190ICptYXNrLCB1
aW50MzJfdCBwYWdlX3RpbWVzdGFtcCkKIHsKICAgICB1bnNpZ25lZCBpbnQgY3B1OwogCisgICAg
LyogU2hvcnQtY2lyY3VpdDogdGhlcmUncyBubyBuZWVkIHRvIGl0ZXJhdGUgaWYgdGhlIGNsb2Nr
IGlzIGRpc2FibGVkLiAqLworICAgIGlmICggIXRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHJl
dHVybjsKKwogICAgIGZvcl9lYWNoX2NwdSAoIGNwdSwgbWFzayApCiAgICAgICAgIGlmICggIU5F
RURfRkxVU0gocGVyX2NwdSh0bGJmbHVzaF90aW1lLCBjcHUpLCBwYWdlX3RpbWVzdGFtcCkgKQog
ICAgICAgICAgICAgX19jcHVtYXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwotLSAKMi4yNS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
