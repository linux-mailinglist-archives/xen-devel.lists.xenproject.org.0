Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEDE81F85
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:52:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hueIW-0002hI-8R; Mon, 05 Aug 2019 14:49:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hueIU-0002h9-Er
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:49:14 +0000
X-Inumbo-ID: 30a9498f-b790-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30a9498f-b790-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 14:49:13 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xM+VGtOjSMzgyRP0EzrooL/V1q4hGZT+qmT97VIgxI36QcHo+4SCPXbxkjZOMbwytIK2znrK4n
 1Py3aSmTPsZKLWX5U7KAg9TisJiluxPmgn/3XQU0NfP06DdX+dTd72MXyYHPA+tkatwY580rgA
 brwyr1qI0K82yyIJsEqrM/sBb8lnIwMpvRyol867mjepyo5hil9lbIpJRP6PFqWIT3rsbxXSKb
 j8VPVo1t7AFcFFpzpLwi3T6WwlUhivtN8InBSMEaAwRlFUZRq9Uc5wFS0wvFQcBcioCHY2Gmwp
 WRg=
X-SBRS: 2.7
X-MesageID: 3994298
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3994298"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 15:49:10 +0100
Message-ID: <20190805144910.20223-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/xl: Make extra= usable in combination
 with cmdline=
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Yy9zIDk4NmFlYTdmYmUgInhsLmNmZzogYWRkICdjbWRsaW5lJyBpbiBjb25maWcgZmlsZSIgaW50
cm9kdWNlZCBjbWRsaW5lPSBhbmQKbWFrZSBleHRyYT0gYW5kIHJvb3Q9IHVudXNhYmxlIGlmIGNt
ZGxpbmU9IHdhcyBwcmVzZW50LgoKRm9yIHRoZSB2bS5jZmcgZmlsZSBpdHNlbGYsIHRoaXMgbWFr
ZXMgc2Vuc2UuICBIb3dldmVyLCBmb3IgZGV2ZWxvcG1lbnQKcHVycG9zZXMgaXQgaXMgdmVyeSBj
b252ZW5pZW50IHRvIGhhdmUgYSBjbWRsaW5lPSBpbiB0aGUgY2ZnIGZpbGUsIGFuZCBzcGVjaWZ5
CmV4dHJhPSBvbiB0aGUgYHhsIGNyZWF0ZWAgY29tbWFuZCBsaW5lLgoKV2hpbGUgdXBkYXRpbmcg
dGhlIG1hbnBhZ2UsIGNvcnJlY3QgdGhlIGVudHJ5IGZvciBjbWRsaW5lPS4gIFRoZXJlIGlzIG5l
dmVyCmFueSBhcHBlbmRpbmcgd2hpY2ggZ29lcyBvbiB3aXRoIHRoaXMgb3B0aW9uLCBidXQgYWZ0
ZXIgdGhpcyBjaGFuZ2UgZXh0cmE9IG1heQpiZSBhcHBlbmRlZCB0byBjbWRsaW5lPS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
QzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpJ
biBwYXJ0aWN1bGFyLCB0aGlzIGlzIHVzZWZ1bCBmb3IgdGVzdGluZyBYZW4gYXMgYSBQVkggZ3Vl
c3QsIHdoZXJlIHN3aXRjaGluZwpiZXR3ZWVuIGEgUFYgYW5kIFBWSCBkb20wIGludm9sdmVzIGFk
ZGluZyAiZG9tMD1wdmggZG9tMC1pb21tdT1ub25lIiB0bwpjb21tYW5kIGxpbmUuICBOb3csIGdp
dmVuIGEgc2luZ2xlIGJ1aWxkIG9mIFhlbiB1bmRlciB0ZXN0LCB0d28gdGVzdHMgY2FuIGJlCnJ1
biB3aXRoIGp1c3QKCiAjIHhsIGNyZWF0ZSBzaGltLmNmZyByYW1kaXNrPVwidGVzdC1wdjY0LWV4
YW1wbGVcIgoKYW5kCgogIyB4bCBjcmVhdGUgc2hpbS5jZmcgcmFtZGlzaz1cInRlc3QtaHZtNjQt
ZXhhbXBsZVwiIGV4dHJhPVwiZG9tMD1wdmhcIGRvbTAtaW9tbXU9bm9uZVwiCgp3aXRob3V0IG5l
ZWRpbmcgdG8gZWRpdCBzaGltLmNmZyBpbmJldHdlZW4uCi0tLQogZG9jcy9tYW4veGwuY2ZnLjUu
cG9kLmluIHwgMTQgKysrKysrKysrKy0tLS0KIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICB8IDEy
ICsrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiBiL2RvY3MvbWFu
L3hsLmNmZy41LnBvZC5pbgppbmRleCBjOTlkNDAzMDdlLi5jYTM0ZjNjNjIzIDEwMDY0NAotLS0g
YS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KKysrIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmlu
CkBAIC00MzEsMTggKzQzMSwyNCBAQCBMb2FkIHRoZSBzcGVjaWZpZWQgZmlsZSBhcyB0aGUgcmFt
ZGlzay4KIAogPWl0ZW0gQjxjbWRsaW5lPSJTVFJJTkciPgogCi1BcHBlbmQgQjxTVFJJTkc+IHRv
IHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lLiAoTm90ZTogdGhlIG1lYW5pbmcgb2YKLXRoaXMgaXMg
Z3Vlc3Qgc3BlY2lmaWMpLiBJdCBjYW4gcmVwbGFjZSBCPHJvb3Q9IlNUUklORyI+Ci1hbG9uZyB3
aXRoIEI8ZXh0cmE9IlNUUklORyI+IGFuZCBpcyBwcmVmZXJyZWQuIFdoZW4gQjxjbWRsaW5lPSJT
VFJJTkciPiBpcyBzZXQsCi1CPHJvb3Q9IlNUUklORyI+IGFuZCBCPGV4dHJhPSJTVFJJTkciPiB3
aWxsIGJlIGlnbm9yZWQuCitVc2UgQjxTVFJJTkc+IGFzIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5l
LiAoTm90ZTogdGhlIG1lYW5pbmcgb2YgdGhpcyBpcyBndWVzdAorc3BlY2lmaWMpLgorCitXaGVu
IHRoaXMgb3B0aW9uIGlzIHNwZWNpZmllZCwgQjxyb290PSJTVFJJTkciPiB3aWxsIGJlIGlnbm9y
ZWQuCiAKID1pdGVtIEI8cm9vdD0iU1RSSU5HIj4KIAorVGhpcyBvcHRpb24gaXMgZGVwcmVjYXRl
ZCBhbmQgaXRzIHVzZSBpcyBkaXNjb3VyYWdlZC4gIEl0IHdpbGwgYmUgaWdub3JlZCBpZgorQjxj
bWRsaW5lPT4gaXMgc3BlY2lmaWVkLgorCiBBcHBlbmQgQjxyb290PVNUUklORz4gdG8gdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUgKE5vdGU6IHRoZSBtZWFuaW5nIG9mIHRoaXMKIGlzIGd1ZXN0IHNw
ZWNpZmljKS4KIAogPWl0ZW0gQjxleHRyYT0iU1RSSU5HIj4KIAorVGhpcyBvcHRpb24gaXMgZGVw
cmVjYXRlZCBhbmQgaXRzIHVzZSBpbiBjb25maWd1cmF0aW9uIGZpbGVzIGlzIGRpc2NvdXJhZ2Vk
LgorSXQgbWF5IGhvd2V2ZXIgYmUgdXNlZnVsIHRvIHVzZSBvbiB0aGUgY29tbWFuZCBsaW5lIGZv
ciBCPHhsIGNyZWF0ZT4uCisKIEFwcGVuZCBCPFNUUklORz4gdG8gdGhlIGtlcm5lbCBjb21tYW5k
IGxpbmUuIChOb3RlOiB0aGUgbWVhbmluZyBvZiB0aGlzCiBpcyBndWVzdCBzcGVjaWZpYykuCiAK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMgYi90b29scy94bC94bF9wYXJzZS5jCmlu
ZGV4IGUxMDViZGEyYmIuLjJjYWQ1YzZlMDggMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNl
LmMKKysrIGIvdG9vbHMveGwveGxfcGFyc2UuYwpAQCAtMjg3LDEwICsyODcsMTQgQEAgc3RhdGlj
IGNoYXIgKnBhcnNlX2NtZGxpbmUoWExVX0NvbmZpZyAqY29uZmlnKQogICAgIHhsdV9jZmdfZ2V0
X3N0cmluZyAoY29uZmlnLCAiZXh0cmEiLCAmZXh0cmEsIDApOwogCiAgICAgaWYgKGJ1Zikgewot
ICAgICAgICBjbWRsaW5lID0gc3RyZHVwKGJ1Zik7Ci0gICAgICAgIGlmIChyb290IHx8IGV4dHJh
KQotICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJXYXJuaW5nOiBpZ25vcmluZyByb290PSBh
bmQgZXh0cmE9ICIKLSAgICAgICAgICAgICAgICAgICAgImluIGZhdm91ciBvZiBjbWRsaW5lPVxu
Iik7CisgICAgICAgIGlmIChyb290KQorICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJXYXJu
aW5nOiBpZ25vcmluZyByb290PSBpbiBmYXZvdXIgb2YgY21kbGluZT1cbiIpOworCisgICAgICAg
IGlmIChleHRyYSkgeworICAgICAgICAgICAgeGFzcHJpbnRmKCZjbWRsaW5lLCAiJXMgJXMiLCBi
dWYsIGV4dHJhKTsKKyAgICAgICAgfSBlbHNlIHsKKyAgICAgICAgICAgIGNtZGxpbmUgPSBzdHJk
dXAoYnVmKTsKKyAgICAgICAgfQogICAgIH0gZWxzZSB7CiAgICAgICAgIGlmIChyb290ICYmIGV4
dHJhKSB7CiAgICAgICAgICAgICB4YXNwcmludGYoJmNtZGxpbmUsICJyb290PSVzICVzIiwgcm9v
dCwgZXh0cmEpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
