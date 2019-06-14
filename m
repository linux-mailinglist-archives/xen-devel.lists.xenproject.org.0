Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8545AA5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 12:40:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbjay-0002ja-JM; Fri, 14 Jun 2019 10:38:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbjaw-0002jE-TL
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 10:38:06 +0000
X-Inumbo-ID: 7e76ebf3-8e90-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7e76ebf3-8e90-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 10:38:06 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1tgsnfHyQGwgirMTouddCj7l0PPAPe3hObdBSC8YiGEtGJE3WZTB9uCDJQTe71LWisB3kFhHmj
 +WNvMAVq2Oh+B6iR5URwHBfOftBSVMS/qcH6led3zuFvJCNy332+hq0vdHkC40lTy8PHeSEqEZ
 DdDYim/iiu6K17vk8cpHXGo7W2q3P70ehgl2m9Bn0Dc0kARmGNFfBxXOR7GQbn0nsFskU+GzvX
 B5wNix9l7XITzpKV8h4bpJv9FdsEGd0bt0qZeTVvgfABq1VlYFWiZoc13Bh0MwqTVmPBb9dMbo
 mxA=
X-SBRS: 2.7
X-MesageID: 1749155
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1749155"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 11:37:56 +0100
Message-ID: <20190614103801.22619-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614103801.22619-1-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/9] libxl: Add optimisation to ev_lock
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgd2lsbCBvZnRlbiBiZSB0aGUgY2FzZSB0aGF0IHRoZSBsb2NrIGlzIGZyZWUgdG8gZ3JhYi4g
U28gd2UgZmlyc3QKdHJ5IHRvIGdyYWIgaXQgYmVmb3JlIHdlIGhhdmUgdG8gZm9yay4gRXZlbiB0
aG91Z2ggaW4gdGhpcyBjYXNlIHRoZQpsb2NrcyBhcmUgZ3JhYmJlZCBpbiB0aGUgd3Jvbmcgb3Jk
ZXIgaW4gdGhlIGxvY2sgaGllcmFyY2h5IChldl9sb2NrCnNob3VsZCBiZSBvdXRzaWRlIG9mIENU
WF9MT0NLKSwgaXQgaXMgZmluZSB0byB0cnkgd2l0aG91dCBibG9ja2luZy4gSWYKdGhhdCBmYWls
ZWQsIHdlIHdpbGwgcmVsZWFzZSBDVFhfTE9DSyBhbmQgdHJ5IHRvIGdyYWIgYm90aCBsb2NrIGFn
YWluCmluIHRoZSByaWdodCBvcmRlci4KClRoYXQgb3B0aW1pc2F0aW9uIGlzIG9ubHkgZW5hYmxl
ZCBpbiByZWxlYXNlcyAoZGVidWc9bikgc28gdGhlIG1vcmUKY29tcGxpY2F0ZWQgY29kZSB3aXRo
IGZvcmsgaXMgYWN0dWFsbHkgZXhlcmNpc2VkLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MjoKICAgIC0g
bmV3IHBhdGNoCgogdG9vbHMvbGlieGwvTWFrZWZpbGUgICAgICAgICB8ICAzICsrKwogdG9vbHMv
bGlieGwvbGlieGxfaW50ZXJuYWwuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL01ha2Vm
aWxlIGIvdG9vbHMvbGlieGwvTWFrZWZpbGUKaW5kZXggNmZkY2JiZGRkNi4uNDU4N2E2ZmM5YyAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvTWFrZWZpbGUKKysrIGIvdG9vbHMvbGlieGwvTWFrZWZp
bGUKQEAgLTM1LDYgKzM1LDkgQEAgaWZlcSAoJChDT05GSUdfTElCTkwpLHkpCiBDRkxBR1NfTElC
WEwgKz0gJChMSUJOTDNfQ0ZMQUdTKQogZW5kaWYKIENGTEFHU19MSUJYTCArPSAtV3NoYWRvdwor
aWZlcSAoJChkZWJ1ZykseSkKK0NGTEFHU19MSUJYTCArPSAtRENPTkZJR19ERUJVRworZW5kaWYK
IAogTElCWExfTElCUy0kKENPTkZJR19BUk0pICs9IC1sZmR0CiAKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX2ludGVybmFsLmMgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jCmlu
ZGV4IDM5MDZhMDUxMmQuLmZiMWI5YmZlNTIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYwpAQCAtNjIwLDYg
KzYyMCwyNSBAQCBzdGF0aWMgdm9pZCBldl9sb2NrX3ByZXBhcmVfZm9yayhsaWJ4bF9fZWdjICpl
Z2MsIGxpYnhsX19ldl9sb2NrICpsb2NrKQogICAgIH0KICAgICBmZCA9IGxvY2stPmZkOwogCisg
ICAgLyogRW5hYmxlIHRoaXMgb3B0aW1pc2F0aW9uIG9ubHkgaW4gcmVsZWFzZXMsIHNvIHRoZSBm
b3JrIGNvZGUgaXMKKyAgICAgKiBleGVyY2lzZWQgd2hpbGUgbGlieGwgaXMgYnVpbHQgd2l0aCBk
ZWJ1Zz15LiAqLworI2lmbmRlZiBDT05GSUdfREVCVUcKKyAgICAvKgorICAgICAqIFdlIHRyeSB0
byBncmFiIHRoZSBsb2NrIGJlZm9yZSBmb3JraW5nIGFzIGl0IGlzIGxpa2VseSB0byBiZSBmcmVl
LgorICAgICAqIEV2ZW4gdGhvdWdoIHdlIGFyZSBzdXBwb3NlZCB0byBDVFhfVU5MT0NLIGJlZm9y
ZSBhdHRlbXB0aW5nIHRvIGdyYWIKKyAgICAgKiB0aGUgZXZfbG9jaywgaXQgaXMgZmluZSB0byBk
byBhIG5vbi1ibG9ja2luZyByZXF1ZXN0IG5vdyB3aXRoIHRoZQorICAgICAqIENUWF9MT0NLIGhl
bGQgYXMgaWYgdGhhdCBmYWlscyB3ZSdsbCB0cnkgYWdhaW4gaW4gYSBmb3JrIChDVFhfVU5MT0NL
CisgICAgICogd2lsbCBiZSBjYWxsZWQgaW4gbGlieGwpLCB0aGF0IHdpbGwgYXZvaWQgZGVhZGxv
Y2tzLgorICAgICAqLworICAgIGludCByID0gZmxvY2soZmQsIExPQ0tfRVggfCBMT0NLX05CKTsK
KyAgICBpZiAoIXIpIHsKKyAgICAgICAgbGlieGxfZmRfc2V0X2Nsb2V4ZWMoQ1RYLCBmZCwgMSk7
CisgICAgICAgIC8qIFdlIGhlbGQgYSBsb2NrLCBubyBuZWVkIHRvIGZvcmsgYnV0IHdlIG5lZWQg
dG8gY2hlY2sgaXQuICovCisgICAgICAgIGV2X2xvY2tfY2hpbGRfY2FsbGJhY2soZWdjLCAmbG9j
ay0+Y2hpbGQsIDAsIDApOworICAgICAgICByZXR1cm47CisgICAgfQorI2VuZGlmCisKICAgICBw
aWQgPSBsaWJ4bF9fZXZfY2hpbGRfZm9yayhnYywgJmxvY2stPmNoaWxkLCBldl9sb2NrX2NoaWxk
X2NhbGxiYWNrKTsKICAgICBpZiAocGlkIDwgMCkKICAgICAgICAgZ290byBvdXQ7Ci0tIApBbnRo
b255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
