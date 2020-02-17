Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65751619E8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3lMu-0000fP-9L; Mon, 17 Feb 2020 18:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3lMs-0000f9-KR
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 18:43:42 +0000
X-Inumbo-ID: 6aef12d2-51b5-11ea-ade5-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aef12d2-51b5-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581965022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oBt5WAqvumYQnkJto8fy3gzgctQdn1+IHvv2G/Jo9h4=;
 b=NlxM6hLwCayQjM3RcEwRdZjwlYmccQBGCuARAU6PCzNI9b16jTM09OFc
 yvzWG0cI/l3lJdoJnuEuVZBWzb1kI96qKVDRF4h9onQqZ2ngu/cd2RrmU
 Qy7Lz5vVbS1uPGSIkygTSZy++qBJfTaxYu/gQW7N9HHiD4iXGdzSbpWlv I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3z3R78qobCSA01+Va69w/NR1hpSuuDAU+Nc9jLvmnAC9UsfSIKH49bJ3b4zvkQ7YRBsEmrE7FU
 6Xf3wBz4A7G4+b52AgmHnIynp30BPGtq9ipVQhju374eF1e9QOSoQIoBk3/a/BFJRSMHrBTeZS
 rRPDGIA7zCa1qA2TLvCCK3Gt2NBuHMfUG2mSILaOcjJhzSzbq1SVPXSevqAGvv2bFjKsTOgV6T
 RuNhMjaa3uxXcLxVJ73NUIaRO00oUOs61yzsyB2q8gMtj/SXUhE4s+GOclJN9pnCFKg7v1NAz8
 UdM=
X-SBRS: 2.7
X-MesageID: 12753663
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12753663"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 19:43:23 +0100
Message-ID: <20200217184324.73762-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217184324.73762-1-roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch cpumask
 in send_IPI_mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hayBpcyBub3Qgc2FmZSBiZWNhdXNl
IGl0IGNhbiBiZQpjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIFhlbiB3
b3VsZCBoYXZlIHRvIG1ha2Ugc3VyZQphbGwgdGhlIHVzZXJzIG9mIHRoZSBzY3JhdGNoIGNwdW1h
c2sgZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCml0LgoKSW5zdGVhZCBpbnRyb2R1Y2Ug
YSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21hc2ssIGFuZApkaXNhYmxlIGlu
dGVycnVwdHMgd2hpbGUgdXNpbmcuCgpGaXhlczogNTUwMGQyNjVhMmE4ICgneDg2L3NtcDogdXNl
IEFQSUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykKUmVwb3J0
ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+ClNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2hhbmdl
cyBzaW5jZSB2MToKIC0gRG9uJ3QgdXNlIHRoZSBzaG9ydGhhbmQgd2hlbiBpbiAjTUMgb3IgI05N
SSBjb250ZXh0LgotLS0KIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8ICA5ICsrKysrKysrLQogMiBm
aWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwppbmRleCBjN2NhZjVi
YzI2Li4wYTlhOWU3ZjAyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wLmMKKysrIGIveGVu
L2FyY2gveDg2L3NtcC5jCkBAIC01OSw2ICs1OSw3IEBAIHN0YXRpYyB2b2lkIHNlbmRfSVBJX3No
b3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50IHZlY3RvciwKICAgICBhcGljX3dyaXRl
KEFQSUNfSUNSLCBjZmcpOwogfQogCitERUNMQVJFX1BFUl9DUFUoY3B1bWFza192YXJfdCwgc2Vu
ZF9pcGlfY3B1bWFzayk7CiAvKgogICogc2VuZF9JUElfbWFzayhjcHVtYXNrLCB2ZWN0b3IpOiBz
ZW5kcyBAdmVjdG9yIElQSSB0byBDUFVzIGluIEBjcHVtYXNrLAogICogZXhjbHVkaW5nIHRoZSBs
b2NhbCBDUFUuIEBjcHVtYXNrIG1heSBiZSBlbXB0eS4KQEAgLTY3LDcgKzY4LDIwIEBAIHN0YXRp
YyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50IHZlY3Rv
ciwKIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3Ip
CiB7CiAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwotICAgIGNwdW1hc2tfdCAqc2NyYXRj
aCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7CisgICAgY3B1bWFza190ICpzY3JhdGNoID0g
dGhpc19jcHUoc2VuZF9pcGlfY3B1bWFzayk7CisgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKKwor
ICAgIGlmICggaW5fbWMoKSB8fCBpbl9ubWkoKSApCisgICAgeworICAgICAgICAvKgorICAgICAg
ICAgKiBXaGVuIGluICNNQyBvciAjTU5JIGNvbnRleHQgWGVuIGNhbm5vdCB1c2UgdGhlIHBlci1D
UFUgc2NyYXRjaCBtYXNrCisgICAgICAgICAqIGJlY2F1c2Ugd2UgaGF2ZSBubyB3YXkgdG8gYXZv
aWQgcmVlbnRyeSwgc28gZG8gbm90IHVzZSB0aGUgQVBJQworICAgICAgICAgKiBzaG9ydGhhbmQu
CisgICAgICAgICAqLworICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJ
X21hc2ssIG1hc2ssIHZlY3Rvcik7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKIAogICAgIC8q
CiAgICAgICogVGhpcyBjYW4gb25seSBiZSBzYWZlbHkgdXNlZCB3aGVuIG5vIENQVSBob3RwbHVn
IG9yIHVucGx1ZyBvcGVyYXRpb25zCkBAIC04MSw3ICs5NSwxNSBAQCB2b2lkIHNlbmRfSVBJX21h
c2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQogICAgICAgICAgbG9jYWxfaXJx
X2lzX2VuYWJsZWQoKSAmJiAoY3B1c19sb2NrZWQgPSBnZXRfY3B1X21hcHMoKSkgJiYKICAgICAg
ICAgIChwYXJrX29mZmxpbmVfY3B1cyB8fAogICAgICAgICAgIGNwdW1hc2tfZXF1YWwoJmNwdV9v
bmxpbmVfbWFwLCAmY3B1X3ByZXNlbnRfbWFwKSkgKQorICAgIHsKKyAgICAgICAgLyoKKyAgICAg
ICAgICogc2VuZF9JUElfbWFzayBjYW4gYmUgY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQs
IGFuZCBoZW5jZSB3ZQorICAgICAgICAgKiBuZWVkIHRvIGRpc2FibGUgaW50ZXJydXB0cyBpbiBv
cmRlciB0byBwcm90ZWN0IHRoZSBwZXItY3B1CisgICAgICAgICAqIHNlbmRfaXBpX2NwdW1hc2sg
d2hpbGUgYmVpbmcgdXNlZC4KKyAgICAgICAgICovCisgICAgICAgIGxvY2FsX2lycV9zYXZlKGZs
YWdzKTsKICAgICAgICAgY3B1bWFza19vcihzY3JhdGNoLCBtYXNrLCBjcHVtYXNrX29mKHNtcF9w
cm9jZXNzb3JfaWQoKSkpOworICAgIH0KICAgICBlbHNlCiAgICAgewogICAgICAgICBpZiAoIGNw
dXNfbG9ja2VkICkKQEAgLTg5LDYgKzExMSw3IEBAIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBj
cHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCiAgICAgICAgICAgICBwdXRfY3B1X21hcHMoKTsK
ICAgICAgICAgICAgIGNwdXNfbG9ja2VkID0gZmFsc2U7CiAgICAgICAgIH0KKyAgICAgICAgbG9j
YWxfaXJxX3NhdmUoZmxhZ3MpOwogICAgICAgICBjcHVtYXNrX2NsZWFyKHNjcmF0Y2gpOwogICAg
IH0KIApAQCAtOTcsNiArMTIwLDcgQEAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tf
dCAqbWFzaywgaW50IHZlY3RvcikKICAgICBlbHNlCiAgICAgICAgIGFsdGVybmF0aXZlX3ZjYWxs
KGdlbmFwaWMuc2VuZF9JUElfbWFzaywgbWFzaywgdmVjdG9yKTsKIAorICAgIGxvY2FsX2lycV9y
ZXN0b3JlKGZsYWdzKTsKICAgICBpZiAoIGNwdXNfbG9ja2VkICkKICAgICAgICAgcHV0X2NwdV9t
YXBzKCk7CiB9CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYwppbmRleCBlODNlNDU2NGE0Li44MmU4OTIwMWIzIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTU3
LDYgKzU3LDkgQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgY3B1
X2NvcmVfbWFzayk7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShjcHVtYXNrX3Zhcl90LCBz
Y3JhdGNoX2NwdW1hc2spOwogc3RhdGljIGNwdW1hc2tfdCBzY3JhdGNoX2NwdTBtYXNrOwogCitE
RUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShjcHVtYXNrX3Zhcl90LCBzZW5kX2lwaV9jcHVtYXNr
KTsKK3N0YXRpYyBjcHVtYXNrX3Qgc2VuZF9pcGlfY3B1MG1hc2s7CisKIGNwdW1hc2tfdCBjcHVf
b25saW5lX21hcCBfX3JlYWRfbW9zdGx5OwogRVhQT1JUX1NZTUJPTChjcHVfb25saW5lX21hcCk7
CiAKQEAgLTkzMCw2ICs5MzMsOCBAQCBzdGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2ln
bmVkIGludCBjcHUsIGJvb2wgcmVtb3ZlKQogICAgICAgICBGUkVFX0NQVU1BU0tfVkFSKHBlcl9j
cHUoY3B1X2NvcmVfbWFzaywgY3B1KSk7CiAgICAgICAgIGlmICggcGVyX2NwdShzY3JhdGNoX2Nw
dW1hc2ssIGNwdSkgIT0gJnNjcmF0Y2hfY3B1MG1hc2sgKQogICAgICAgICAgICAgRlJFRV9DUFVN
QVNLX1ZBUihwZXJfY3B1KHNjcmF0Y2hfY3B1bWFzaywgY3B1KSk7CisgICAgICAgIGlmICggcGVy
X2NwdShzZW5kX2lwaV9jcHVtYXNrLCBjcHUpICE9ICZzZW5kX2lwaV9jcHUwbWFzayApCisgICAg
ICAgICAgICBGUkVFX0NQVU1BU0tfVkFSKHBlcl9jcHUoc2VuZF9pcGlfY3B1bWFzaywgY3B1KSk7
CiAgICAgfQogCiAgICAgY2xlYW51cF9jcHVfcm9vdF9wZ3QoY3B1KTsKQEAgLTEwMzQsNyArMTAz
OSw4IEBAIHN0YXRpYyBpbnQgY3B1X3NtcGJvb3RfYWxsb2ModW5zaWduZWQgaW50IGNwdSkKIAog
ICAgIGlmICggIShjb25kX3phbGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShjcHVfc2libGluZ19t
YXNrLCBjcHUpKSAmJgogICAgICAgICAgICBjb25kX3phbGxvY19jcHVtYXNrX3ZhcigmcGVyX2Nw
dShjcHVfY29yZV9tYXNrLCBjcHUpKSAmJgotICAgICAgICAgICBjb25kX2FsbG9jX2NwdW1hc2tf
dmFyKCZwZXJfY3B1KHNjcmF0Y2hfY3B1bWFzaywgY3B1KSkpICkKKyAgICAgICAgICAgY29uZF9h
bGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShzY3JhdGNoX2NwdW1hc2ssIGNwdSkpICYmCisgICAg
ICAgICAgIGNvbmRfYWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoc2VuZF9pcGlfY3B1bWFzaywg
Y3B1KSkpICkKICAgICAgICAgZ290byBvdXQ7CiAKICAgICByYyA9IDA7CkBAIC0xMTc1LDYgKzEx
ODEsNyBAQCB2b2lkIF9faW5pdCBzbXBfcHJlcGFyZV9ib290X2NwdSh2b2lkKQogICAgIGNwdW1h
c2tfc2V0X2NwdShjcHUsICZjcHVfcHJlc2VudF9tYXApOwogI2lmIE5SX0NQVVMgPiAyICogQklU
U19QRVJfTE9ORwogICAgIHBlcl9jcHUoc2NyYXRjaF9jcHVtYXNrLCBjcHUpID0gJnNjcmF0Y2hf
Y3B1MG1hc2s7CisgICAgcGVyX2NwdShzZW5kX2lwaV9jcHVtYXNrLCBjcHUpID0gJnNlbmRfaXBp
X2NwdTBtYXNrOwogI2VuZGlmCiAKICAgICBnZXRfY3B1X2luZm8oKS0+dXNlX3B2X2NyMyA9IGZh
bHNlOwotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
