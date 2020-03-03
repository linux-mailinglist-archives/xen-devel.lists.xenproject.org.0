Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A690177D4B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 18:23:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9BEC-0007QB-UN; Tue, 03 Mar 2020 17:21:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Dy3W=4U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9BEB-0007Q0-3i
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 17:21:07 +0000
X-Inumbo-ID: 5ca69b04-5d73-11ea-8adc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ca69b04-5d73-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583256064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1QAshLi++zhF5fDm/vI1ICT9O00yj9QFwHZ8PPKtRbk=;
 b=aXApbRftJsbWEPVjm7jtyd36rlH+qCjFOjd5Y2jIG5MAnsq3v/4CVk2r
 cLxzW0RaBoEQ6BXdAviyaQwGeowjKyov9bCJFw1aerDqLIPA+GhK560rL
 71Dv9rjQ5+LHawHCv338CPVHGGN1U6vvWC97u6mJmZr93BEPZe9MmKhbf k=;
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
IronPort-SDR: ZwqM2OeeTiVitwRYzVHCLR/OLxlvRyd6sN5Gt91x4E1j1mRgi+U9zZyqnRwsgeiVvyHJeUrszI
 0Axf2RPWqFAfe1sUvRBXrMndBXg27ThHZJKO1TTQI8d0qxpJH6PeAt9pdNMn38nd+kxhHpt9DG
 +0w2Zgunmtxt+mUo9aq2iopkkYhsLFzjf3GL0lCj+XubZx6wn/+sONl4Gq/WxivNAp2Ije/prN
 Y+FL5iRavqWHCgnao+4p0hK7Cl8piTSnUpXbmoljo6YioSa3Yhodf8MV/hXTZEq/doCoBy/RwJ
 Zts=
X-SBRS: 2.7
X-MesageID: 13775850
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13775850"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Mar 2020 18:20:41 +0100
Message-ID: <20200303172046.50569-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200303172046.50569-1-roger.pau@citrix.com>
References: <20200303172046.50569-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 1/6] x86/hvm: allow ASID flush when v !=
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
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
IGlzCnJlcXVpcmVkLgoKQ29tcGlsZXJzIHdpbGwgbm9ybWFsbHkgZG8gc3VjaCB3cml0ZXMgYW5k
IHJlYWRzIGFzIGEgc2luZ2xlCmluc3RydWN0aW9uLCBzbyB0aGUgdXNhZ2Ugb2YgYXRvbWljIG9w
ZXJhdGlvbnMgaXMgbW9zdGx5IHVzZWQgYXMgYQpzYWZldHkgbWVhc3VyZS4KCk5vdGUgdGhlIHNh
bWUgY291bGQgYmUgYWNoaWV2ZWQgYnkgaW50cm9kdWNpbmcgYW4gZXh0cmEgZmllbGQgdG8KaHZt
X3ZjcHVfYXNpZCB0aGF0IHNpZ25hbHMgaHZtX2FzaWRfaGFuZGxlX3ZtZW50ZXIgdGhlIG5lZWQg
dG8gY2FsbApodm1fYXNpZF9mbHVzaF92Y3B1IG9uIHRoZSBnaXZlbiB2Q1BVIGJlZm9yZSB2bWVu
dHJ5LCB0aGlzIGhvd2V2ZXIKc2VlbXMgdW5uZWNlc3NhcnkgYXMgaHZtX2FzaWRfZmx1c2hfdmNw
dSBpdHNlbGYgb25seSBzZXRzIHR3byB2Q1BVCmZpZWxkcyB0byAwLCBzbyB0aGVyZSdzIG5vIG5l
ZWQgdG8gZGVsYXkgdGhpcyB0byB0aGUgdm1lbnRyeSBBU0lECmhlbHBlci4KClRoaXMgaXMgbm90
IGEgYnVnZml4IGFzIG5vIGNhbGxlcnMgdGhhdCB3b3VsZCB2aW9sYXRlIHRoZSBhc3N1bXB0aW9u
cwpsaXN0ZWQgaW4gdGhlIGZpcnN0IHBhcmFncmFwaCBoYXZlIGJlZW4gZm91bmQsIGJ1dCBhIHBy
ZXBhcmF0b3J5CmNoYW5nZSBpbiBvcmRlciB0byBhbGxvdyByZW1vdGUgZmx1c2hpbmcgb2YgSFZN
IHZDUFVzLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vYXNpZC5jIHwg
NiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMgYi94ZW4vYXJjaC94ODYvaHZt
L2FzaWQuYwppbmRleCA4ZTAwYTI4NDQzLi42M2NlNDYyZDU2IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvaHZtL2FzaWQuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2FzaWQuYwpAQCAtODMsNyAr
ODMsNyBAQCB2b2lkIGh2bV9hc2lkX2luaXQoaW50IG5hc2lkcykKIAogdm9pZCBodm1fYXNpZF9m
bHVzaF92Y3B1X2FzaWQoc3RydWN0IGh2bV92Y3B1X2FzaWQgKmFzaWQpCiB7Ci0gICAgYXNpZC0+
Z2VuZXJhdGlvbiA9IDA7CisgICAgd3JpdGVfYXRvbWljKCZhc2lkLT5nZW5lcmF0aW9uLCAwKTsK
IH0KIAogdm9pZCBodm1fYXNpZF9mbHVzaF92Y3B1KHN0cnVjdCB2Y3B1ICp2KQpAQCAtMTIxLDcg
KzEyMSw3IEBAIGJvb2xfdCBodm1fYXNpZF9oYW5kbGVfdm1lbnRlcihzdHJ1Y3QgaHZtX3ZjcHVf
YXNpZCAqYXNpZCkKICAgICAgICAgZ290byBkaXNhYmxlZDsKIAogICAgIC8qIFRlc3QgaWYgVkNQ
VSBoYXMgdmFsaWQgQVNJRC4gKi8KLSAgICBpZiAoIGFzaWQtPmdlbmVyYXRpb24gPT0gZGF0YS0+
Y29yZV9hc2lkX2dlbmVyYXRpb24gKQorICAgIGlmICggcmVhZF9hdG9taWMoJmFzaWQtPmdlbmVy
YXRpb24pID09IGRhdGEtPmNvcmVfYXNpZF9nZW5lcmF0aW9uICkKICAgICAgICAgcmV0dXJuIDA7
CiAKICAgICAvKiBJZiB0aGVyZSBhcmUgbm8gZnJlZSBBU0lEcywgbmVlZCB0byBnbyB0byBhIG5l
dyBnZW5lcmF0aW9uICovCkBAIC0xMzUsNyArMTM1LDcgQEAgYm9vbF90IGh2bV9hc2lkX2hhbmRs
ZV92bWVudGVyKHN0cnVjdCBodm1fdmNwdV9hc2lkICphc2lkKQogCiAgICAgLyogTm93IGd1YXJh
bnRlZWQgdG8gYmUgYSBmcmVlIEFTSUQuICovCiAgICAgYXNpZC0+YXNpZCA9IGRhdGEtPm5leHRf
YXNpZCsrOwotICAgIGFzaWQtPmdlbmVyYXRpb24gPSBkYXRhLT5jb3JlX2FzaWRfZ2VuZXJhdGlv
bjsKKyAgICB3cml0ZV9hdG9taWMoJmFzaWQtPmdlbmVyYXRpb24sIGRhdGEtPmNvcmVfYXNpZF9n
ZW5lcmF0aW9uKTsKIAogICAgIC8qCiAgICAgICogV2hlbiB3ZSBhc3NpZ24gQVNJRCAxLCBmbHVz
aCBhbGwgVExCIGVudHJpZXMgYXMgd2UgYXJlIHN0YXJ0aW5nIGEgbmV3Ci0tIAoyLjI1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
