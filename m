Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F114A986
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:14:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8rD-0007rV-HE; Mon, 27 Jan 2020 18:11:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw8rB-0007r5-W3
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:11:30 +0000
X-Inumbo-ID: 705656ee-4130-11ea-8590-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 705656ee-4130-11ea-8590-12813bfff9fa;
 Mon, 27 Jan 2020 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580148690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhWh1IA1fGUc9nzSD4bHTMjNOkVF4i7SWERxNMqfkeo=;
 b=GZeuohLI0YBolqkUDXSCO058J8fqLPxyohTAdtsBsDRnHCrNjrNhDjrz
 tv3HBOp95r5DomTBMJ/2E1Cl63p0psnrN8EQ2LzieyXw0tnJsUEpeKlhz
 Otkd8Rt/iKAAgecuUkpoGy3t3zffx3s97bO6o+EWAJ3GvI92BqFLVZWp/ k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /gNN0DGm4VE9KDrL2CG59+R5mrZ7s47eF51al3RFHokK8hcOdHQzI5B6Jgt7+jOFSoWFoJJq//
 ZxsZLVNwmwnf8W9ruhVjBFEL/3DrPKMrIeTo/B5jKVg42zz7UT007JFFTkH0e2t2JSiweCbfgT
 uuypl8d9AS6c8cE+Shlktgly5jn1K3aojxu7c1KV370QEYl5ufyIIbeYPPLVCYdAbGxyyXja7Y
 zICiCq+zdJ75446GiHGj0H2UAEa9l6y6otPBEKtA1e5dvPBWhhYlUEwVWO74qMMYx3F3qQD/u1
 G/s=
X-SBRS: 2.7
X-MesageID: 11501350
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11501350"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 19:11:10 +0100
Message-ID: <20200127181115.82709-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200127181115.82709-1-roger.pau@citrix.com>
References: <20200127181115.82709-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/7] x86/hvm: allow ASID flush when v !=
 current
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBodm1fYXNpZF9mbHVzaF92Y3B1IGlzIG5vdCBzYWZl
IHRvIHVzZQp1bmxlc3MgdGhlIHRhcmdldCB2Q1BVIGlzIGVpdGhlciBwYXVzZWQgb3IgdGhlIGN1
cnJlbnRseSBydW5uaW5nIG9uZSwKYXMgaXQgbW9kaWZpZXMgdGhlIGdlbmVyYXRpb24gd2l0aG91
dCBhbnkgbG9ja2luZy4KCkZpeCB0aGlzIGJ5IHVzaW5nIGF0b21pYyBvcGVyYXRpb25zIHdoZW4g
YWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCmZpZWxkLCBib3RoIGluIGh2bV9hc2lkX2ZsdXNoX3Zj
cHVfYXNpZCBhbmQgb3RoZXIgQVNJRCBmdW5jdGlvbnMuIFRoaXMKYWxsb3dzIHRvIHNhZmVseSBm
bHVzaCB0aGUgY3VycmVudCBBU0lEIGdlbmVyYXRpb24uIE5vdGUgdGhhdCBmb3IgdGhlCmZsdXNo
IHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlzIGN1cnJlbnRseSBydW5uaW5nIGEgdm1leGl0
IGlzCnJlcXVpcmVkLgoKTm90ZSB0aGUgc2FtZSBjb3VsZCBiZSBhY2hpZXZlZCBieSBpbnRyb2R1
Y2luZyBhbiBleHRyYSBmaWVsZCB0bwpodm1fdmNwdV9hc2lkIHRoYXQgc2lnbmFscyBodm1fYXNp
ZF9oYW5kbGVfdm1lbnRlciB0aGUgbmVlZCB0byBjYWxsCmh2bV9hc2lkX2ZsdXNoX3ZjcHUgb24g
dGhlIGdpdmVuIHZDUFUgYmVmb3JlIHZtZW50cnksIHRoaXMgaG93ZXZlcgpzZWVtcyB1bm5lY2Vz
c2FyeSBhcyBodm1fYXNpZF9mbHVzaF92Y3B1IGl0c2VsZiBvbmx5IHNldHMgdHdvIHZDUFUKZmll
bGRzIHRvIDAsIHNvIHRoZXJlJ3Mgbm8gbmVlZCB0byBkZWxheSB0aGlzIHRvIHRoZSB2bWVudHJ5
IEFTSUQKaGVscGVyLgoKVGhpcyBpcyBub3QgYSBidWdmaXggYXMgbm8gY2FsbGVycyB0aGF0IHdv
dWxkIHZpb2xhdGUgdGhlIGFzc3VtcHRpb25zCmxpc3RlZCBpbiB0aGUgZmlyc3QgcGFyYWdyYXBo
IGhhdmUgYmVlbiBmb3VuZCwgYnV0IGEgcHJlcGFyYXRvcnkKY2hhbmdlIGluIG9yZGVyIHRvIGFs
bG93IHJlbW90ZSBmbHVzaGluZyBvZiBIVk0gdkNQVXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2Fz
aWQuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5jIGIveGVuL2FyY2gv
eDg2L2h2bS9hc2lkLmMKaW5kZXggOWQzYzY3MWE1Zi4uODBiNzNkYTg5YiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKQEAg
LTgyLDcgKzgyLDcgQEAgdm9pZCBodm1fYXNpZF9pbml0KGludCBuYXNpZHMpCiAKIHZvaWQgaHZt
X2FzaWRfZmx1c2hfdmNwdV9hc2lkKHN0cnVjdCBodm1fdmNwdV9hc2lkICphc2lkKQogewotICAg
IGFzaWQtPmdlbmVyYXRpb24gPSAwOworICAgIHdyaXRlX2F0b21pYygmYXNpZC0+Z2VuZXJhdGlv
biwgMCk7CiB9CiAKIHZvaWQgaHZtX2FzaWRfZmx1c2hfdmNwdShzdHJ1Y3QgdmNwdSAqdikKQEAg
LTEyMCw3ICsxMjAsNyBAQCBib29sX3QgaHZtX2FzaWRfaGFuZGxlX3ZtZW50ZXIoc3RydWN0IGh2
bV92Y3B1X2FzaWQgKmFzaWQpCiAgICAgICAgIGdvdG8gZGlzYWJsZWQ7CiAKICAgICAvKiBUZXN0
IGlmIFZDUFUgaGFzIHZhbGlkIEFTSUQuICovCi0gICAgaWYgKCBhc2lkLT5nZW5lcmF0aW9uID09
IGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uICkKKyAgICBpZiAoIHJlYWRfYXRvbWljKCZhc2lk
LT5nZW5lcmF0aW9uKSA9PSBkYXRhLT5jb3JlX2FzaWRfZ2VuZXJhdGlvbiApCiAgICAgICAgIHJl
dHVybiAwOwogCiAgICAgLyogSWYgdGhlcmUgYXJlIG5vIGZyZWUgQVNJRHMsIG5lZWQgdG8gZ28g
dG8gYSBuZXcgZ2VuZXJhdGlvbiAqLwpAQCAtMTM0LDcgKzEzNCw3IEBAIGJvb2xfdCBodm1fYXNp
ZF9oYW5kbGVfdm1lbnRlcihzdHJ1Y3QgaHZtX3ZjcHVfYXNpZCAqYXNpZCkKIAogICAgIC8qIE5v
dyBndWFyYW50ZWVkIHRvIGJlIGEgZnJlZSBBU0lELiAqLwogICAgIGFzaWQtPmFzaWQgPSBkYXRh
LT5uZXh0X2FzaWQrKzsKLSAgICBhc2lkLT5nZW5lcmF0aW9uID0gZGF0YS0+Y29yZV9hc2lkX2dl
bmVyYXRpb247CisgICAgd3JpdGVfYXRvbWljKCZhc2lkLT5nZW5lcmF0aW9uLCBkYXRhLT5jb3Jl
X2FzaWRfZ2VuZXJhdGlvbik7CiAKICAgICAvKgogICAgICAqIFdoZW4gd2UgYXNzaWduIEFTSUQg
MSwgZmx1c2ggYWxsIFRMQiBlbnRyaWVzIGFzIHdlIGFyZSBzdGFydGluZyBhIG5ldwotLSAKMi4y
NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
