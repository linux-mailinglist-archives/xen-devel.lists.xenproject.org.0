Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879914A98B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 19:15:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8rA-0007qR-0y; Mon, 27 Jan 2020 18:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw8r8-0007qJ-4M
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:11:26 +0000
X-Inumbo-ID: 6e160154-4130-11ea-aafc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e160154-4130-11ea-aafc-bc764e2007e4;
 Mon, 27 Jan 2020 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580148685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MFGFeJZY1ZM/WoB02goIPzvIhXiz2uLiYytQLUtKveA=;
 b=H/D3c0EabTY6GLQL9px5FPyQOvnBUQamrFq+00TQbyObdgjL0NkISbiH
 tL5zQrH/ndQ6ngrL2AoKRMA7K5psufF9hfxQCzS15y6Tf84BJ1iW4LKIW
 Z/AW12EuAfbaiECsylkGF8RM5/WQkQO50ZshRibKEYcqZnAPbLV+fxIow Q=;
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
IronPort-SDR: 5J5Yf5VrJ9mVhS9HZzstc7woA0Y0WrtEckZC4vn5EM6vwildFVYKQ96lXt8T6Zc9T4rxMmCUtM
 NTU8UHKgmR8he3gR3DdZpEkk7ZlF/p/z4CnhTBtC83/YjGXSMZ/HDnyOjZBTHEGlqehe3CIUlh
 8RFpUZ0T4hc6Gr7/P/4o/VusokUaOTt4L6QyN1sKLEGOML0diR/+QX+A7lqQescbjAfLNeleeo
 CCm1POWkY5yn7dmBXDBKYAkE48bHgSOX9SdBK8H364gXYfPePtDkA3unbsCJzNgy54Pd3hTKQ8
 POc=
X-SBRS: 2.7
X-MesageID: 11876067
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11876067"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 19:11:08 +0100
Message-ID: <20200127181115.82709-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/7] x86: improve assisted tlb flush and use
 it in guest mode
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBhaW1zIHRvIGltcHJvdmUgdGhlIFRMQiBmbHVz
aCB0aW1lcyB3aGVuIHJ1bm5pbmcKbmVzdGVkIFhlbiwgYW5kIGl0J3Mgc3BlY2lhbGx5IGJlbmVm
aWNpYWwgd2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZS4KCk9ubHkgdGhlIEhBUCBndWVzdCBUTEIg
Zmx1c2ggaXMgaW1wcm92ZWQsIHRoZSBzaGFkb3cgcGFnaW5nIFRMQiBmbHVzaCBpcwpsZWZ0IGFz
LWlzLCBhbmQgY2FuIGJlIGltcHJvdmVkIGxhdGVyIGlmIHRoZXJlJ3MgaW50ZXJlc3QuCgpGb3Ig
YSByZWZlcmVuY2Ugb24gdGhlIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IHNlZSBwYXRjaCAjNywg
YXMgaXQncyBhCmh1Z2UgaW5jcmVhc2Ugd2hpY2ggY2FuIGJlbmVmaXQgb3RoZXIgZ3Vlc3RzIHVz
aW5nIGFzc2lzdGVkIFRMQiBmbHVzaGVzLAphbmQgYWxzbyB0aGUgb25lcyB1c2luZyB0aGUgdmly
aWRpYW4gVExCIGZsdXNoIGFzc2lzdCAoaWU6IFdpbmRvd3MpLgoKVGhhbmtzLCBSb2dlci4KClJv
Z2VyIFBhdSBNb25uZSAoNyk6CiAgeDg2L3RsYjogZml4IE5FRURfRkxVU0ggcmV0dXJuIHR5cGUK
ICB4ODYvaHZtOiBhbGxvdyBBU0lEIGZsdXNoIHdoZW4gdiAhPSBjdXJyZW50CiAgeDg2L3BhZ2lu
ZzogYWRkIFRMQiBmbHVzaCBob29rcwogIHg4Ni9oYXA6IGltcHJvdmUgaHlwZXJ2aXNvciBhc3Np
c3RlZCBndWVzdCBUTEIgZmx1c2gKICB4ODYvdGxiOiBpbnRyb2R1Y2UgYSBmbHVzaCBndWVzdHMg
VExCIGZsYWcKICB4ODYvdGxiOiBhbGxvdyBkaXNhYmxpbmcgdGhlIFRMQiBjbG9jawogIHg4Ni90
bGI6IHVzZSBYZW4gTDAgYXNzaXN0ZWQgVExCIGZsdXNoIHdoZW4gYXZhaWxhYmxlCgogeGVuL2Fy
Y2gveDg2L2ZsdXNodGxiLmMgICAgICAgICAgICAgICAgfCAyNCArKysrKystLS0KIHhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgMTAgKysrKwogeGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi94ZW4uYyAgICAgICAgICAgfCAgNiArKysKIHhlbi9hcmNoL3g4Ni9odm0vYXNpZC5j
ICAgICAgICAgICAgICAgIHwgIDYgKy0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAg
ICAgICAgICB8IDUxICsrLS0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L21tL2hhcC9oYXAu
YyAgICAgICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L21tL3No
YWRvdy9jb21tb24uYyAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKy0tLQogeGVu
L2FyY2gveDg2L21tL3NoYWRvdy9odm0uYyAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2
L21tL3NoYWRvdy9tdWx0aS5jICAgICAgICAgfCAxNyArKystLS0KIHhlbi9hcmNoL3g4Ni9zbXAu
YyAgICAgICAgICAgICAgICAgICAgIHwgMTEgKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVz
aHRsYi5oICAgICAgICAgfCAyMSArKysrKysrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9o
eXBlcnZpc29yLmggfCAxNyArKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvaGFwLmggICAgICAg
ICAgICAgIHwgIDMgKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAgICAgICAgIHwg
MTIgKysrKysKIDE0IGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlv
bnMoLSkKCi0tIAoyLjI1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
