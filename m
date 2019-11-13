Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECEFB7CA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 19:39:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUxVa-00085T-TL; Wed, 13 Nov 2019 18:36:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUxVZ-00085O-4w
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 18:36:49 +0000
X-Inumbo-ID: 8c6dc686-0644-11ea-a23d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c6dc686-0644-11ea-a23d-12813bfff9fa;
 Wed, 13 Nov 2019 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573670208;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=s2umt9L7hxLKlNnW2M4n3MFgoalGuAuLHbS71nqQTDU=;
 b=BJP4JhZ/+lJ45h+W0s99UgQKcE1flOLjS6A4hlhqYE3C+VVgYC8Zvg8H
 /AmsM3anOgWYhCTIsMiGZftGQUTfGnTtNUfDdeLrbCV3uJ6oeS+SNw7AC
 J+d3cB8oH3BzfITJb7BjAHVf68yktyHVnP/7Fkncxn8rnNycCuaKNpxVA A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oMHILbXf2xgHDjiVc5DWeG1e7mvFAM9eBxiNF0fqlIKQG9YYZgbEeOJU0PMY0wPhVN7wMe+9Sw
 NljzE8EDt/P85g0pkabMmR63N0y38RZLF5ooRsFIVWoAwW8krElBRPZ4m1gd9DEj+wohKSKzg0
 X5oxPxp163vHJULklDERRRr8Sorydpcwjbzj/LtIhc4/NVrov29SOIwBKgm8mu5jBRMvOCVlog
 lQg4jqN+3l6wxz1+AmzlHs0sNbg18+OFmgyuTeu8kAFZL8Ta1CfaZGIryQdpHGsVgs75cC0bjy
 RhA=
X-SBRS: 2.7
X-MesageID: 8285313
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,301,1569297600"; 
   d="scan'208";a="8285313"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 18:36:41 +0000
Message-ID: <20191113183641.2871-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] xen/sched: Render sibling/core masks
 with %pbl to improve 'r' debugkey
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIHN5c3RlbSB3aXRoIGxhcmdlIG51bWJlcnMgb2YgQ1BVcywgdGhlICdyJyBkZWJ1Z2tleSBp
cyB1bndpZWxkeS4gIFNpYmxpbmcKYW5kIGNvcmUgbWFza3MgYXJlIGEgc2luZ2xlIGJsb2NrIG9m
IGFkamFjZW50IGJpdHMsIHNvIGFyZSB2YXN0bHkgc2hvcnRlciB0bwpyZW5kZXIgd2l0aCAlcGJs
LgoKQmVmb3JlOgogIChYRU4pIENQVVswMF0gbnJfcnVuPTAsIHNvcnQ9MTU3LCBzaWJsaW5nPTAw
MDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAw
MDAwLDAwMDAwMDAzLCBjb3JlPTAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLGZm
ZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmCiAgKFhFTikgQ1BVWzAxXSBucl9ydW49
MCwgc29ydD0xMzc1MCwgc2libGluZz0wMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAw
MCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMywgY29yZT0wMDAwMDAwMCwwMDAw
MDAwMCwwMDAwMDAwMCwwMDAwMDAwMCxmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZm
ZgogIChYRU4pIENQVVswMl0gbnJfcnVuPTAsIHNvcnQ9MTg4LCBzaWJsaW5nPTAwMDAwMDAwLDAw
MDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAw
MDBjLCBjb3JlPTAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLGZmZmZmZmZmLGZm
ZmZmZmZmLGZmZmZmZmZmLGZmZmZmZmZmCiAgKFhFTikgQ1BVWzAzXSBucl9ydW49MCwgc29ydD0x
MzczMCwgc2libGluZz0wMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAw
MCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwYywgY29yZT0wMDAwMDAwMCwwMDAwMDAwMCwwMDAw
MDAwMCwwMDAwMDAwMCxmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZixmZmZmZmZmZgoKQWZ0ZXI6
CiAgKFhFTikgQ1BVWzAwXSBucl9ydW49MCwgc29ydD0xMTY5LCBzaWJsaW5nPXswLTF9LCBjb3Jl
PXswLTEyN30KICAoWEVOKSBDUFVbMDFdIG5yX3J1bj0wLCBzb3J0PTI0ODgsIHNpYmxpbmc9ezAt
MX0sIGNvcmU9ezAtMTI3fQogIChYRU4pIENQVVswMl0gbnJfcnVuPTAsIHNvcnQ9MTIxMCwgc2li
bGluZz17Mi0zfSwgY29yZT17MC0xMjd9CiAgKFhFTikgQ1BVWzAzXSBucl9ydW49MCwgc29ydD0y
NDc2LCBzaWJsaW5nPXsyLTN9LCBjb3JlPXswLTEyN30KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgpDQzogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4K
Q0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KCjQuMTMgbmlj
ZS10by1oYXZlLiAgTm90IHN0cmljdGx5IHJlcXVpcmVkLCBidXQgaXQgaXMgYSBsb3cgcmlzayBj
aGFuZ2Ugd2hpY2gKaW1wcm92ZXMgZGlhZ25vc3RpY3MuCi0tLQogeGVuL2NvbW1vbi9zY2hlZF9j
cmVkaXQuYyAgfCAyICstCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyB8IDIgKy0KIHhlbi9j
b21tb24vc2NoZWRfbnVsbC5jICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVk
aXQuYyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKaW5kZXggNjQ1Y2RjNWU5YS4uYWE0MWEz
MzAxYiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYworKysgYi94ZW4vY29t
bW9uL3NjaGVkX2NyZWRpdC5jCkBAIC0yMDY1LDcgKzIwNjUsNyBAQCBjc2NoZWRfZHVtcF9wY3B1
KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgaW50IGNwdSkKICAgICBzcGMgPSBDU0NIRURf
UENQVShjcHUpOwogICAgIHJ1bnEgPSAmc3BjLT5ydW5xOwogCi0gICAgcHJpbnRrKCJDUFVbJTAy
ZF0gbnJfcnVuPSVkLCBzb3J0PSVkLCBzaWJsaW5nPSUqcGIsIGNvcmU9JSpwYlxuIiwKKyAgICBw
cmludGsoIkNQVVslMDJkXSBucl9ydW49JWQsIHNvcnQ9JWQsIHNpYmxpbmc9eyUqcGJsfSwgY29y
ZT17JSpwYmx9XG4iLAogICAgICAgICAgICBjcHUsIHNwYy0+bnJfcnVubmFibGUsIHNwYy0+cnVu
cV9zb3J0X2xhc3QsCiAgICAgICAgICAgIENQVU1BU0tfUFIocGVyX2NwdShjcHVfc2libGluZ19t
YXNrLCBjcHUpKSwKICAgICAgICAgICAgQ1BVTUFTS19QUihwZXJfY3B1KGNwdV9jb3JlX21hc2ss
IGNwdSkpKTsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIGIveGVuL2Nv
bW1vbi9zY2hlZF9jcmVkaXQyLmMKaW5kZXggYWY1OGVlMTYxZC4uZjdjNDc3MDUzYyAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9j
cmVkaXQyLmMKQEAgLTM2NTgsNyArMzY1OCw3IEBAIGR1bXBfcGNwdShjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIGludCBjcHUpCiAgICAgc3RydWN0IGNzY2hlZDJfcHJpdmF0ZSAqcHJ2ID0g
Y3NjaGVkMl9wcml2KG9wcyk7CiAgICAgc3RydWN0IGNzY2hlZDJfdW5pdCAqc3ZjOwogCi0gICAg
cHJpbnRrKCJDUFVbJTAyZF0gcnVucT0lZCwgc2libGluZz0lKnBiLCBjb3JlPSUqcGJcbiIsCisg
ICAgcHJpbnRrKCJDUFVbJTAyZF0gcnVucT0lZCwgc2libGluZz17JSpwYmx9LCBjb3JlPXslKnBi
bH1cbiIsCiAgICAgICAgICAgIGNwdSwgYzJyKGNwdSksCiAgICAgICAgICAgIENQVU1BU0tfUFIo
cGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpKSwKICAgICAgICAgICAgQ1BVTUFTS19QUihw
ZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpKTsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKaW5kZXggZGEzZmUyOWYyMS4uM2Yz
NDE4YzliMSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZF9udWxsLmMKQEAgLTkyNiw3ICs5MjYsNyBAQCBzdGF0aWMgdm9pZCBudWxsX2R1
bXBfcGNwdShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIGludCBjcHUpCiAKICAgICBsb2Nr
ID0gcGNwdV9zY2hlZHVsZV9sb2NrX2lycXNhdmUoY3B1LCAmZmxhZ3MpOwogCi0gICAgcHJpbnRr
KCJDUFVbJTAyZF0gc2libGluZz0lKnBiLCBjb3JlPSUqcGIiLAorICAgIHByaW50aygiQ1BVWyUw
MmRdIHNpYmxpbmc9eyUqcGJsfSwgY29yZT17JSpwYmx9IiwKICAgICAgICAgICAgY3B1LCBDUFVN
QVNLX1BSKHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSksCiAgICAgICAgICAgIENQVU1B
U0tfUFIocGVyX2NwdShjcHVfY29yZV9tYXNrLCBjcHUpKSk7CiAgICAgaWYgKCBwZXJfY3B1KG5w
YywgY3B1KS51bml0ICE9IE5VTEwgKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
