Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0B109D7E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:06:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZZf-0002IX-F3; Tue, 26 Nov 2019 12:04:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZZZe-0002IN-4p
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:04:06 +0000
X-Inumbo-ID: d6ab1fa0-1044-11ea-a39f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6ab1fa0-1044-11ea-a39f-12813bfff9fa;
 Tue, 26 Nov 2019 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574769844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/iuozQJW1O4FqIa7Nx7Z47sjsCmC5q0fa/egETCNg4=;
 b=DPuLksMhMtc0OcCt3RnoTyAk0lWzxcO6L9abpIsvCK0KLuUynrzkrXaF
 uYuoB9KU6Jy3cF39vqHucjE/0mDN/ROqp3yHMSQAhBfVtC2mEZs7MfqvT
 W67TA7pNc3C7IrgOyH7fiCGswske5/hXl7MUZ+92c3WwXZZgKOErloMDd g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vOS1mDKnpqUq8Q3PVtN6XQq/G/LQa8TQZFFs6es2KrXgmbPAZmIg8/bY0T60vnd0Ezm8KCbdNo
 hxf+QuL2tJoGriqF22iIDBTn+zhbmGJLHixWxVP2Mm9nIQBpgiM+bV48wH1WV7RfY25jW4Uzhc
 azfdziSavidJIIkRJcGATR0t60NGMcjA0wWhg7zxAIR3Yf+GmBDcSuU37WZyjCHiHXyFfSOi/i
 ybn8tV5u5ohu6W4IKynUntzroQh3RuzWHJaYlFUZf6EEW5P/+lZSJ8iZzYEI31d3Ew4sNpmTtl
 Pdk=
X-SBRS: 2.7
X-MesageID: 8964952
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="8964952"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:03:55 +0000
Message-ID: <20191126120357.13398-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191126120357.13398-1-andrew.cooper3@citrix.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/3] x86/vtx: Fix fault semantics for early
 task switch failures
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFZULXggdGFzayBzd2l0Y2ggaGFuZGxlciBhZGRzIGluc3RfbGVuIHRvICVyaXAgYmVmb3Jl
IGNhbGxpbmcKaHZtX3Rhc2tfc3dpdGNoKCksIHdoaWNoIGlzIHByb2JsZW1hdGljIGluIHR3byB3
YXlzOgoKIDEpIEVhcmx5IGZhdWx0cyAoaS5lLiBvbmVzIGRlbGl2ZXJlZCBpbiB0aGUgY29udGV4
dCBvZiB0aGUgb2xkIHRhc2spIGdldAogICAgZGVsaXZlcmVkIHdpdGggdHJhcCBzZW1hbnRpY3Ms
IGFuZCBicmVhayByZXN0YXJ0aWJpbGl0eS4KCiAyKSBUaGUgYWRkaXRpb24gaXNuJ3QgdHJ1bmNh
dGVkIHRvIDMyIGJpdHMuICBJbiB0aGUgY29ybmVyIGNhc2Ugb2YgYSB0YXNrCiAgICBzd2l0Y2gg
aW5zdHJ1Y3Rpb24gY3Jvc3NpbmcgdGhlIDRHLT4wIGJvdW5kYXJ5IHRha2luZyBhbiBlYXJseSBm
YXVsdCAod2l0aAogICAgdHJhcCBzZW1hbnRpY3MpLCBhIFZNRW50cnkgZmFpbHVyZSB3aWxsIG9j
Y3VyIGR1ZSB0byAlcmlwIGJlaW5nIG91dCBvZgogICAgcmFuZ2UuCgpJbnN0ZWFkLCBwYXNzIHRo
ZSBpbnN0cnVjdGlvbiBsZW5ndGggaW50byBodm1fdGFza19zd2l0Y2goKSBhbmQgd3JpdGUgaXQg
aW50bwp0aGUgb3V0Z29pbmcgVFNTIG9ubHksIGxlYXZpbmcgJXJpcCBpbiBpdHMgb3JpZ2luYWwg
bG9jYXRpb24uCgpGb3Igbm93LCBwYXNzIDAgb24gdGhlIFNWTSBzaWRlLiAgVGhpcyBoaWdobGln
aHRzIGEgc2VwYXJhdGUgcHJlZXhpc3RpbmcgYnVnCndoaWNoIHdpbGwgYmUgYWRkcmVzc2VkIGlu
IHRoZSBmb2xsb3dpbmcgcGF0Y2guCgpXaGlsZSBhZGp1c3RpbmcgY2FsbCBzaXRlcywgZHJvcCB0
aGUgdW5uZWNlc3NhcnkgdWludDE2X3QgY2FzdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgIHwgNCArKy0tCiB4ZW4vYXJjaC94
ODYvaHZtL3N2bS9zdm0uYyAgICB8IDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAg
IHwgNCArKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCB8IDIgKy0KIDQgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDgxOGU3
MDVmZDEuLjdmNTU2MTcxYmQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysr
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMjkxMyw3ICsyOTEzLDcgQEAgdm9pZCBodm1f
cHJlcGFyZV92bTg2X3RzcyhzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgYmFzZSwgdWludDMyX3Qg
bGltaXQpCiAKIHZvaWQgaHZtX3Rhc2tfc3dpdGNoKAogICAgIHVpbnQxNl90IHRzc19zZWwsIGVu
dW0gaHZtX3Rhc2tfc3dpdGNoX3JlYXNvbiB0YXNrc3dpdGNoX3JlYXNvbiwKLSAgICBpbnQzMl90
IGVycmNvZGUpCisgICAgaW50MzJfdCBlcnJjb2RlLCB1bnNpZ25lZCBpbnQgaW5zbl9sZW4pCiB7
CiAgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50OwogICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzID0gZ3Vlc3RfY3B1X3VzZXJfcmVncygpOwpAQCAtMjk4Nyw3ICsyOTg3LDcgQEAgdm9p
ZCBodm1fdGFza19zd2l0Y2goCiAgICAgaWYgKCB0YXNrc3dpdGNoX3JlYXNvbiA9PSBUU1dfaXJl
dCApCiAgICAgICAgIGVmbGFncyAmPSB+WDg2X0VGTEFHU19OVDsKIAotICAgIHRzcy5laXAgICAg
PSByZWdzLT5laXA7CisgICAgdHNzLmVpcCAgICA9IHJlZ3MtPmVpcCArIGluc25fbGVuOwogICAg
IHRzcy5lZmxhZ3MgPSBlZmxhZ3M7CiAgICAgdHNzLmVheCAgICA9IHJlZ3MtPmVheDsKICAgICB0
c3MuZWN4ICAgID0gcmVncy0+ZWN4OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0v
c3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwppbmRleCA0ZWI2YjBlNGM3Li4wNDli
ODAwZTIwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL3N2bS9zdm0uYwpAQCAtMjc5NCw3ICsyNzk0LDcgQEAgdm9pZCBzdm1fdm1l
eGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgICAgICAqLwogICAg
ICAgICB2bWNiLT5ldmVudGluai5ieXRlcyA9IDA7CiAKLSAgICAgICAgaHZtX3Rhc2tfc3dpdGNo
KCh1aW50MTZfdCl2bWNiLT5leGl0aW5mbzEsIHJlYXNvbiwgZXJyY29kZSk7CisgICAgICAgIGh2
bV90YXNrX3N3aXRjaCh2bWNiLT5leGl0aW5mbzEsIHJlYXNvbiwgZXJyY29kZSwgMCk7CiAgICAg
ICAgIGJyZWFrOwogICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCBhNzFkZjcxYmMxLi43NDUwY2Jl
NDBkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYworKysgYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYwpAQCAtMzk2Miw4ICszOTYyLDggQEAgdm9pZCB2bXhfdm1leGl0
X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgICAgICAgICBfX3ZtcmVh
ZChJRFRfVkVDVE9SSU5HX0VSUk9SX0NPREUsICZlY29kZSk7CiAgICAgICAgIGVsc2UKICAgICAg
ICAgICAgICBlY29kZSA9IC0xOwotICAgICAgICByZWdzLT5yaXAgKz0gaW5zdF9sZW47Ci0gICAg
ICAgIGh2bV90YXNrX3N3aXRjaCgodWludDE2X3QpZXhpdF9xdWFsaWZpY2F0aW9uLCByZWFzb25z
W3NvdXJjZV0sIGVjb2RlKTsKKworICAgICAgICBodm1fdGFza19zd2l0Y2goZXhpdF9xdWFsaWZp
Y2F0aW9uLCByZWFzb25zW3NvdXJjZV0sIGVjb2RlLCBpbnN0X2xlbik7CiAgICAgICAgIGJyZWFr
OwogICAgIH0KICAgICBjYXNlIEVYSVRfUkVBU09OX0NQVUlEOgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaApp
bmRleCBmODZhZjA5ODk4Li40Y2NlNTliYjMxIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9odm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaApAQCAtMjk3
LDcgKzI5Nyw3IEBAIHZvaWQgaHZtX3NldF9yZHRzY19leGl0aW5nKHN0cnVjdCBkb21haW4gKmQs
IGJvb2xfdCBlbmFibGUpOwogZW51bSBodm1fdGFza19zd2l0Y2hfcmVhc29uIHsgVFNXX2ptcCwg
VFNXX2lyZXQsIFRTV19jYWxsX29yX2ludCB9Owogdm9pZCBodm1fdGFza19zd2l0Y2goCiAgICAg
dWludDE2X3QgdHNzX3NlbCwgZW51bSBodm1fdGFza19zd2l0Y2hfcmVhc29uIHRhc2tzd2l0Y2hf
cmVhc29uLAotICAgIGludDMyX3QgZXJyY29kZSk7CisgICAgaW50MzJfdCBlcnJjb2RlLCB1bnNp
Z25lZCBpbnQgaW5zbl9sZW4pOwogCiBlbnVtIGh2bV9hY2Nlc3NfdHlwZSB7CiAgICAgaHZtX2Fj
Y2Vzc19pbnNuX2ZldGNoLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
