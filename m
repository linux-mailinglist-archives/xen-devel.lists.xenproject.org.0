Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B759CDF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 15:21:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgqlq-0004x3-AU; Fri, 28 Jun 2019 13:18:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5nxQ=U3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgqlo-0004wy-CB
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 13:18:28 +0000
X-Inumbo-ID: 35cd61ad-99a7-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35cd61ad-99a7-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 13:18:25 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /wFqZ8w5do/F1nSoraJRdG0lrWsWdR9OY7kQkpdVFkEsMUjHM4ANQW1z1e/U5+oXJrgPxdGdjo
 w0I+/+VJQepinvPxq35yEINlOFZ0N0v7UT+CN+LqBVJSKIdWVSTkd1RTWhksM3d0KrjUwp1cAK
 ppBGg/0ot9S/+PbbFbi45H1MNYkW/xuJVN+W3iMOIFyL4Jt55S9tLMNq0VYUqWQ1G4VjN/KxzE
 e2UT5cGlJVpdwVR9y/JbTopy3hoPV2ou6nTd0eU/Q0QgCNP5Qw6mFtqRHSZf5QS0LmkLwe2vmQ
 RRc=
X-SBRS: 2.7
X-MesageID: 2352843
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,427,1557201600"; 
   d="scan'208";a="2352843"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 28 Jun 2019 14:18:21 +0100
Message-ID: <20190628131821.19690-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] arm/optee: Fix arm32 build
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBUcmF2aXMgcmFuZGNvbmZpZyBidWlsZCBub3RpY2VzOgoKb3B0ZWUuYzogSW4gZnVuY3Rpb24g
4oCYYWxsb2NhdGVfYW5kX3Bpbl9zaG1fcnBj4oCZOgpvcHRlZS5jOjM4MzoxMzogZXJyb3I6IGZv
cm1hdCDigJglbHjigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlCiAgIOKAmGxvbmcgdW5zaWdu
ZWQgaW504oCZLCBidXQgYXJndW1lbnQgNSBoYXMgdHlwZSDigJh1aW50NjRfdOKAmSBbLVdlcnJv
cj1mb3JtYXQ9XQogICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJHdWVzdCB0cmllcyB0byB1
c2UgdGhlIHNhbWUgUlBDIFNITSBjb29raWUgJWx4XG4iLAogICAgICAgICAgICAgXgoKVXNlIFBS
SXg2NCBpbnN0ZWFkIG9mICVseAoKRnVsbCBsb2dzIGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9hbmR5
aGhwL3hlbi9qb2JzLzU1MTc1NDI1MwoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgotLS0K
IHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jIGIveGVuL2FyY2gvYXJtL3RlZS9vcHRlZS5jCmluZGV4
IDYxMDI5ODU1ZDQuLjFkNzljMmMxNTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS90ZWUvb3B0
ZWUuYworKysgYi94ZW4vYXJjaC9hcm0vdGVlL29wdGVlLmMKQEAgLTM4MCw3ICszODAsOCBAQCBz
dGF0aWMgc3RydWN0IHNobV9ycGMgKmFsbG9jYXRlX2FuZF9waW5fc2htX3JwYyhzdHJ1Y3Qgb3B0
ZWVfZG9tYWluICpjdHgsCiAgICAgICAgIGlmICggc2htX3JwY190bXAtPmNvb2tpZSA9PSBjb29r
aWUgKQogICAgICAgICB7CiAgICAgICAgICAgICBzcGluX3VubG9jaygmY3R4LT5sb2NrKTsKLSAg
ICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiR3Vlc3QgdHJpZXMgdG8gdXNlIHRo
ZSBzYW1lIFJQQyBTSE0gY29va2llICVseFxuIiwKKyAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19XQVJOSU5HLAorICAgICAgICAgICAgICAgICAgICAgIkd1ZXN0IHRyaWVzIHRvIHVzZSB0aGUg
c2FtZSBSUEMgU0hNIGNvb2tpZSAlIlBSSXg2NCJcbiIsCiAgICAgICAgICAgICAgICAgICAgICBj
b29raWUpOwogICAgICAgICAgICAgZ290byBlcnI7CiAgICAgICAgIH0KQEAgLTQ5Myw3ICs0OTQs
OCBAQCBzdGF0aWMgc3RydWN0IG9wdGVlX3NobV9idWYgKmFsbG9jYXRlX29wdGVlX3NobV9idWYo
c3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAogICAgICAgICBpZiAoIG9wdGVlX3NobV9idWZfdG1w
LT5jb29raWUgPT0gY29va2llICkKICAgICAgICAgewogICAgICAgICAgICAgc3Bpbl91bmxvY2so
JmN0eC0+bG9jayk7Ci0gICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywgIkd1ZXN0
IHRyaWVzIHRvIHVzZSB0aGUgc2FtZSBTSE0gYnVmZmVyIGNvb2tpZSAlbHhcbiIsCisgICAgICAg
ICAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywKKyAgICAgICAgICAgICAgICAgICAgICJHdWVz
dCB0cmllcyB0byB1c2UgdGhlIHNhbWUgU0hNIGJ1ZmZlciBjb29raWUgJSJQUkl4NjQiXG4iLAog
ICAgICAgICAgICAgICAgICAgICAgY29va2llKTsKICAgICAgICAgICAgIGVycl9jb2RlID0gLUVJ
TlZBTDsKICAgICAgICAgICAgIGdvdG8gZXJyOwpAQCAtNTc0LDcgKzU3Niw4IEBAIHN0YXRpYyB2
b2lkIGZyZWVfb3B0ZWVfc2htX2J1Zl9wZ19saXN0KHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwK
ICAgICBpZiAoIGZvdW5kICkKICAgICAgICAgZnJlZV9wZ19saXN0KG9wdGVlX3NobV9idWYpOwog
ICAgIGVsc2UKLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkNhbid0IGZpbmQgcGFnZWxp
c3QgZm9yIFNITSBidWZmZXIgd2l0aCBjb29raWUgJWx4IHRvIGZyZWUgaXRcbiIsCisgICAgICAg
IGdkcHJpbnRrKFhFTkxPR19FUlIsCisgICAgICAgICAgICAgICAgICJDYW4ndCBmaW5kIHBhZ2Vs
aXN0IGZvciBTSE0gYnVmZmVyIHdpdGggY29va2llICUiUFJJeDY0IiB0byBmcmVlIGl0XG4iLAog
ICAgICAgICAgICAgICAgICBjb29raWUpOwogfQogCkBAIC0xMDE4LDcgKzEwMjEsOCBAQCBzdGF0
aWMgaW50IGhhbmRsZV9ycGNfcmV0dXJuKHN0cnVjdCBvcHRlZV9kb21haW4gKmN0eCwKICAgICAg
ICAgICAgICAqIHdpbGwgb3ZlcndyaXRlIGl0IHdpdGggYWN0dWFsIHJlc3VsdC4gU28gd2UgY2Fu
IGp1c3QKICAgICAgICAgICAgICAqIGNvbnRpbnVlIHRoZSBjYWxsLgogICAgICAgICAgICAgICov
Ci0gICAgICAgICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJDYW4ndCBmaW5kIFNITS1SUEMgd2l0
aCBjb29raWUgJWx4XG4iLCBjb29raWUpOworICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJS
LCAiQ2FuJ3QgZmluZCBTSE0tUlBDIHdpdGggY29va2llICUiUFJJeDY0IlxuIiwKKyAgICAgICAg
ICAgICAgICAgICAgY29va2llKTsKIAogICAgICAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsKICAg
ICAgICAgfQpAQCAtMTIxOSw3ICsxMjIzLDggQEAgc3RhdGljIHZvaWQgaGFuZGxlX3JwY19jbWRf
YWxsb2Moc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4LAogICAgIGlmICggc2htX3JwYy0+eGVuX2Fy
Zy0+cGFyYW1zWzBdLmF0dHIgIT0gKE9QVEVFX01TR19BVFRSX1RZUEVfVE1FTV9PVVRQVVQgfAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9QVEVFX01TR19B
VFRSX05PTkNPTlRJRykgKQogICAgIHsKLSAgICAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcs
ICJJbnZhbGlkIGF0dHJzIGZvciBzaGFyZWQgbWVtIGJ1ZmZlcjogJWx4XG4iLAorICAgICAgICBn
ZHByaW50ayhYRU5MT0dfV0FSTklORywKKyAgICAgICAgICAgICAgICAgIkludmFsaWQgYXR0cnMg
Zm9yIHNoYXJlZCBtZW0gYnVmZmVyOiAlIlBSSXg2NCJcbiIsCiAgICAgICAgICAgICAgICAgIHNo
bV9ycGMtPnhlbl9hcmctPnBhcmFtc1swXS5hdHRyKTsKICAgICAgICAgcmV0dXJuOwogICAgIH0K
QEAgLTEyNjgsNyArMTI3Myw4IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9ycGNfY21kKHN0cnVjdCBv
cHRlZV9kb21haW4gKmN0eCwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCiAKICAgICBpZiAo
ICFzaG1fcnBjICkKICAgICB7Ci0gICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJDYW4ndCBm
aW5kIFNITS1SUEMgd2l0aCBjb29raWUgJWx4XG4iLCBjb29raWUpOworICAgICAgICBnZHByaW50
ayhYRU5MT0dfRVJSLCAiQ2FuJ3QgZmluZCBTSE0tUlBDIHdpdGggY29va2llICUiUFJJeDY0Ilxu
IiwKKyAgICAgICAgICAgICAgICAgY29va2llKTsKICAgICAgICAgcmV0dXJuOwogICAgIH0KIAot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
