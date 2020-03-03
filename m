Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171E177D55
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:24:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9BER-0007Z3-W5; Tue, 03 Mar 2020 17:21:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9BEQ-0007YH-4Y
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:21:22 +0000
X-Inumbo-ID: 61ad3036-5d73-11ea-8adc-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61ad3036-5d73-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583256073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IVP5IILU5sQfbmMewcr+q/3jYDw6BVTmyrqOXQPyUys=;
 b=behPCV7UrctgoZLRZhr/sDB5p+EAE1xBsTUcsLsK3h1a4wbROqLVEPG0
 Lh57Wi4MvYU38TaClON1nVhPNAdWxFcxYSkiSmpogqO7xNGkpGihieuYM
 lug1tdpYSpHuFViQQOE0MotN4KT7r5XuSdv5gn3ITMO12WhMFSNbD+cTj 8=;
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
IronPort-SDR: olM4GyUtK4dW851cIO7GUwcVKgkxeSPeGMQvI7vndZqLkKMDCSC6ECo+5zZ00piBf/0ej8pV0X
 oBQSTGP//fxt2NHH0L8vVW0ThaTSP2aMuTUUV9ohclI5QosPZvaOIgkkrdSRSooapY8l5iYtWG
 QU6oCJ4JXARSMS1sp8rBF5ULQOIAiNrEj4Osl9jJFcgyzS3La67Qg7odnuh3F5Fe2QN8A1QAVF
 VNGtYCVR0n2jQxYd5tMbANwmKsw5pIZpkCecqZPW5Qus43DCVqxoLLCkMHdb7ZcLDYxtrn9615
 tWQ=
X-SBRS: 2.7
X-MesageID: 13353954
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13353954"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Mar 2020 18:20:45 +0100
Message-ID: <20200303172046.50569-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200303172046.50569-1-roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 5/6] x86/tlb: allow disabling the TLB clock
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
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZmx1c2h0bGIu
YyAgICAgICAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2Zs
dXNodGxiLmggfCAxNyArKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9mbHVz
aHRsYi5jIGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKaW5kZXggYzEzMDVjN2U2Yi4uM2E3MGI2
MzI3YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKKysrIGIveGVuL2FyY2gv
eDg2L2ZsdXNodGxiLmMKQEAgLTMyLDYgKzMyLDkgQEAKIHUzMiB0bGJmbHVzaF9jbG9jayA9IDFV
OwogREVGSU5FX1BFUl9DUFUodTMyLCB0bGJmbHVzaF90aW1lKTsKIAorLyogU2lnbmFscyB3aGV0
aGVyIHRoZSBUTEIgZmx1c2ggY2xvY2sgaXMgaW4gdXNlLiAqLworYm9vbCBfX3JlYWRfbW9zdGx5
IHRsYl9jbGtfZW5hYmxlZCA9IHRydWU7CisKIC8qCiAgKiBwcmVfZmx1c2goKTogSW5jcmVtZW50
IHRoZSB2aXJ0dWFsIFRMQi1mbHVzaCBjbG9jay4gUmV0dXJucyBuZXcgY2xvY2sgdmFsdWUuCiAg
KiAKQEAgLTgyLDEyICs4NSwxMyBAQCBzdGF0aWMgdm9pZCBwb3N0X2ZsdXNoKHUzMiB0KQogc3Rh
dGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFncywg
Y3I0OwotICAgIHUzMiB0OworICAgIHUzMiB0ID0gMDsKIAogICAgIC8qIFRoaXMgbm9uLXJlZW50
cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVycnVwdCBjb250ZXh0LiAq
LwogICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKIAotICAgIHQgPSBwcmVfZmx1c2goKTsKKyAg
ICBpZiAoIHRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHQgPSBwcmVfZmx1c2goKTsKIAogICAg
IGlmICggdXNlX2ludnBjaWQgKQogICAgICAgICBpbnZwY2lkX2ZsdXNoX2FsbCgpOwpAQCAtOTks
NyArMTAzLDggQEAgc3RhdGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQpCiAgICAgZWxzZQogICAg
ICAgICB3cml0ZV9jcjMocmVhZF9jcjMoKSk7CiAKLSAgICBwb3N0X2ZsdXNoKHQpOworICAgIGlm
ICggdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAgcG9zdF9mbHVzaCh0KTsKIAogICAgIGxvY2Fs
X2lycV9yZXN0b3JlKGZsYWdzKTsKIH0KQEAgLTEwNyw3ICsxMTIsNyBAQCBzdGF0aWMgdm9pZCBk
b190bGJfZmx1c2godm9pZCkKIHZvaWQgc3dpdGNoX2NyM19jcjQodW5zaWduZWQgbG9uZyBjcjMs
IHVuc2lnbmVkIGxvbmcgY3I0KQogewogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIG9sZF9jcjQ7
Ci0gICAgdTMyIHQ7CisgICAgdTMyIHQgPSAwOwogCiAgICAgLyogVGhyb3VnaG91dCB0aGlzIGZ1
bmN0aW9uIHdlIG1ha2UgdGhpcyBhc3N1bXB0aW9uOiAqLwogICAgIEFTU0VSVCghKGNyNCAmIFg4
Nl9DUjRfUENJREUpIHx8ICEoY3I0ICYgWDg2X0NSNF9QR0UpKTsKQEAgLTExNSw3ICsxMjAsOCBA
QCB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxvbmcgY3IzLCB1bnNpZ25lZCBsb25nIGNy
NCkKICAgICAvKiBUaGlzIG5vbi1yZWVudHJhbnQgZnVuY3Rpb24gaXMgc29tZXRpbWVzIGNhbGxl
ZCBpbiBpbnRlcnJ1cHQgY29udGV4dC4gKi8KICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7CiAK
LSAgICB0ID0gcHJlX2ZsdXNoKCk7CisgICAgaWYgKCB0bGJfY2xrX2VuYWJsZWQgKQorICAgICAg
ICB0ID0gcHJlX2ZsdXNoKCk7CiAKICAgICBvbGRfY3I0ID0gcmVhZF9jcjQoKTsKICAgICBBU1NF
UlQoIShvbGRfY3I0ICYgWDg2X0NSNF9QQ0lERSkgfHwgIShvbGRfY3I0ICYgWDg2X0NSNF9QR0Up
KTsKQEAgLTE2Nyw3ICsxNzMsOCBAQCB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxvbmcg
Y3IzLCB1bnNpZ25lZCBsb25nIGNyNCkKICAgICBpZiAoIGNyNCAmIFg4Nl9DUjRfUENJREUgKQog
ICAgICAgICBpbnZwY2lkX2ZsdXNoX2FsbF9ub25nbG9iYWxzKCk7CiAKLSAgICBwb3N0X2ZsdXNo
KHQpOworICAgIGlmICggdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAgcG9zdF9mbHVzaCh0KTsK
IAogICAgIGxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvZmx1c2h0bGIuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaApp
bmRleCA1NzlkYzU2ODAzLi43MjQ0NTVhZTBjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2ZsdXNodGxiLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oCkBAIC0y
MSwxMCArMjEsMjEgQEAgZXh0ZXJuIHUzMiB0bGJmbHVzaF9jbG9jazsKIC8qIFRpbWUgYXQgd2hp
Y2ggZWFjaCBDUFUncyBUTEIgd2FzIGxhc3QgZmx1c2hlZC4gKi8KIERFQ0xBUkVfUEVSX0NQVSh1
MzIsIHRsYmZsdXNoX3RpbWUpOwogCi0jZGVmaW5lIHRsYmZsdXNoX2N1cnJlbnRfdGltZSgpIHRs
YmZsdXNoX2Nsb2NrCisvKiBUTEIgY2xvY2sgaXMgaW4gdXNlLiAqLworZXh0ZXJuIGJvb2wgdGxi
X2Nsa19lbmFibGVkOworCitzdGF0aWMgaW5saW5lIHVpbnQzMl90IHRsYmZsdXNoX2N1cnJlbnRf
dGltZSh2b2lkKQoreworICAgIC8qIFJldHVybmluZyAwIGZyb20gdGxiZmx1c2hfY3VycmVudF90
aW1lIHdpbGwgYWx3YXlzIGZvcmNlIGEgZmx1c2guICovCisgICAgcmV0dXJuIHRsYl9jbGtfZW5h
YmxlZCA/IHRsYmZsdXNoX2Nsb2NrIDogMDsKK30KIAogc3RhdGljIGlubGluZSB2b2lkIHBhZ2Vf
c2V0X3RsYmZsdXNoX3RpbWVzdGFtcChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogeworICAgIC8q
IEF2b2lkIHRoZSB3cml0ZSBpZiB0aGUgVExCIGNsb2NrIGlzIGRpc2FibGVkLiAqLworICAgIGlm
ICggIXRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHJldHVybjsKKwogICAgIC8qCiAgICAgICog
UHJldmVudCBzdG9yaW5nIGEgc3RhbGUgdGltZSBzdGFtcCwgd2hpY2ggY291bGQgaGFwcGVuIGlm
IGFuIHVwZGF0ZQogICAgICAqIHRvIHRsYmZsdXNoX2Nsb2NrIHBsdXMgYSBzdWJzZXF1ZW50IGZs
dXNoIElQSSBoYXBwZW4gYmV0d2VlbiB0aGUKQEAgLTY3LDYgKzc4LDEwIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB0bGJmbHVzaF9maWx0ZXIoY3B1bWFza190ICptYXNrLCB1aW50MzJfdCBwYWdlX3Rp
bWVzdGFtcCkKIHsKICAgICB1bnNpZ25lZCBpbnQgY3B1OwogCisgICAgLyogU2hvcnQtY2lyY3Vp
dDogdGhlcmUncyBubyBuZWVkIHRvIGl0ZXJhdGUgaWYgdGhlIGNsb2NrIGlzIGRpc2FibGVkLiAq
LworICAgIGlmICggIXRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHJldHVybjsKKwogICAgIGZv
cl9lYWNoX2NwdSAoIGNwdSwgbWFzayApCiAgICAgICAgIGlmICggIU5FRURfRkxVU0gocGVyX2Nw
dSh0bGJmbHVzaF90aW1lLCBjcHUpLCBwYWdlX3RpbWVzdGFtcCkgKQogICAgICAgICAgICAgX19j
cHVtYXNrX2NsZWFyX2NwdShjcHUsIG1hc2spOwotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
