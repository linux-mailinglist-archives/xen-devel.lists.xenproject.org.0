Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0648C112833
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:45:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icRCP-00041v-Ov; Wed, 04 Dec 2019 09:43:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d3Le=Z2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icRCO-00041b-Pg
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:43:56 +0000
X-Inumbo-ID: 9106ff82-167a-11ea-99dd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9106ff82-167a-11ea-99dd-bc764e2007e4;
 Wed, 04 Dec 2019 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575452626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cvxmuy06uR79zSidQfxCiE2b6b+g8mWL1PVavXRL8L8=;
 b=Bb4YEMMF9eBzidp5i2s6UJvS5v9rre9XYwGt8XnMd6WjFVAMsp1j9bQl
 c69KWa5Uz7YeyQRAsSyNVR4b+LtG5fETjxpQenPHuqVPv/15OLKRSafF9
 FIcKtaLRa45GigS5ylOcsM4bUPdha3tCVH6lpXJuwj2dmlSHEEvAMpXQu w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pVfd3SMRa7BQXWoTKgZmjdhhLu9Vi+jzPNFFolxLhfz5BOGPLPNjzPmRGG1nLrPoelVdI3x37l
 omv5uWdzQWnBM74QHOnR0h1ZUS6g8gw3/Rbkw7AqTx194J98yeAMSUrdAkgYTABsyJs9DwEFVK
 OsgWDs9lInT7f+Maq0nn5001mqzQAgj7krlk23U/D8qjQKfAi9p/KnB4PChcxwMD+X9eFmsvSj
 AVmH/BaJCbxcPy04V+PvQMKfy1WBwBhV1pvXW8vYcsUXUrn3IeC5wP3ETh+vuC9rSIETIDx0GQ
 pCk=
X-SBRS: 2.7
X-MesageID: 9723658
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9723658"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 09:43:35 +0000
Message-ID: <20191204094335.24603-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191204094335.24603-1-andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] x86/svm: Use named (bit)fields for task
 switch exit info
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50cm9kdWNlIHZtY2IuZTEuKiBhbmQgdm1jYi5lMi4qIHRvIHByb3ZpZGUgbmFtZXMgdG8gZmll
bGRzIGluIGV4aXRpbmZvezEsMn0KcmVzcGVjdGl2ZWx5LiAgSW1wbGVtZW50IHRoZSB0YXNrIHN3
aXRjaCBuYW1lcyBmb3Igbm93LCBhbmQgY2xlYW4gdXAgdGhlClRBU0tfU1dJVENIIGhhbmRsZXIu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgIHwgMjIgKysrKysrLS0tLS0tLS0t
LS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaCB8IDI2ICsrKysrKysr
KysrKysrKysrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKaW5kZXggMjYzYWUwM2JmZC4uNmM2OGJjZWU1OSAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMKQEAgLTI3NDYsMTAgKzI3NDYsNyBAQCB2b2lkIHN2bV92bWV4aXRfaGFu
ZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICAgICAgc3ZtX3ZtZXhpdF9kb19p
bnZhbGlkYXRlX2NhY2hlKHJlZ3MsIGV4aXRfcmVhc29uID09IFZNRVhJVF9JTlZEKTsKICAgICAg
ICAgYnJlYWs7CiAKLSAgICBjYXNlIFZNRVhJVF9UQVNLX1NXSVRDSDogewotICAgICAgICBlbnVt
IGh2bV90YXNrX3N3aXRjaF9yZWFzb24gcmVhc29uOwotICAgICAgICBpbnQzMl90IGVycmNvZGUg
PSAtMTsKLQorICAgIGNhc2UgVk1FWElUX1RBU0tfU1dJVENIOgogICAgICAgICAvKgogICAgICAg
ICAgKiBBbGwgVEFTS19TV0lUQ0ggaW50ZXJjZXB0cyBoYXZlIGZhdWx0LWxpa2Ugc2VtYW50aWNz
LiAgTlJJUCBpcwogICAgICAgICAgKiBuZXZlciBwcm92aWRlZCwgZXZlbiBmb3IgaW5zdHJ1Y3Rp
b24taW5kdWNlZCB0YXNrIHN3aXRjaGVzLCBidXQgd2UKQEAgLTI3OTUsMTkgKzI3OTIsMTIgQEAg
dm9pZCBzdm1fdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAg
ICAgIGlmICggaW5zbl9sZW4gPCAwICYmIChpbnNuX2xlbiA9IHN2bV9nZXRfdGFza19zd2l0Y2hf
aW5zbl9sZW4oKSkgPT0gMCApCiAgICAgICAgICAgICBnb3RvIGNyYXNoX29yX2ZhdWx0OwogCi0g
ICAgICAgIGlmICggKHZtY2ItPmV4aXRpbmZvMiA+PiAzNikgJiAxICkKLSAgICAgICAgICAgIHJl
YXNvbiA9IFRTV19pcmV0OwotICAgICAgICBlbHNlIGlmICggKHZtY2ItPmV4aXRpbmZvMiA+PiAz
OCkgJiAxICkKLSAgICAgICAgICAgIHJlYXNvbiA9IFRTV19qbXA7Ci0gICAgICAgIGVsc2UKLSAg
ICAgICAgICAgIHJlYXNvbiA9IFRTV19jYWxsX29yX2ludDsKLSAgICAgICAgaWYgKCAodm1jYi0+
ZXhpdGluZm8yID4+IDQ0KSAmIDEgKQotICAgICAgICAgICAgZXJyY29kZSA9ICh1aW50MzJfdCl2
bWNiLT5leGl0aW5mbzI7Ci0KLSAgICAgICAgaHZtX3Rhc2tfc3dpdGNoKHZtY2ItPmV4aXRpbmZv
MSwgcmVhc29uLCBlcnJjb2RlLCBpbnNuX2xlbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICh2
bWNiLT5leGl0aW5mbzIgJiAoMXVsIDw8IDQ4KSkgPyBYODZfRUZMQUdTX1JGIDogMCk7CisgICAg
ICAgIGh2bV90YXNrX3N3aXRjaCh2bWNiLT5lMS50YXNrX3N3aXRjaC5zZWwsCisgICAgICAgICAg
ICAgICAgICAgICAgICB2bWNiLT5lMi50YXNrX3N3aXRjaC5pcmV0ID8gVFNXX2lyZXQgOgorICAg
ICAgICAgICAgICAgICAgICAgICAgdm1jYi0+ZTIudGFza19zd2l0Y2guam1wICA/IFRTV19qbXAg
OiBUU1dfY2FsbF9vcl9pbnQsCisgICAgICAgICAgICAgICAgICAgICAgICB2bWNiLT5lMi50YXNr
X3N3aXRjaC5ldiA/IHZtY2ItPmUyLnRhc2tfc3dpdGNoLmVjIDogLTEsCisgICAgICAgICAgICAg
ICAgICAgICAgICBpbnNuX2xlbiwgdm1jYi0+ZTIudGFza19zd2l0Y2gucmYgPyBYODZfRUZMQUdT
X1JGIDogMCk7CiAgICAgICAgIGJyZWFrOwotICAgIH0KIAogICAgIGNhc2UgVk1FWElUX0NQVUlE
OgogICAgICAgICBpZiAoIChpbnNuX2xlbiA9IHN2bV9nZXRfaW5zbl9sZW4odiwgSU5TVFJfQ1BV
SUQpKSA9PSAwICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNi
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vdm1jYi5oCmluZGV4IGZjNjdhODg2NjAu
LjAyYjVlODZiNDkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNi
LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaApAQCAtNDE4LDggKzQx
OCwzMCBAQCBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgewogICAgIHZpbnRyX3QgX3ZpbnRyOyAgICAgICAg
ICAgICAvKiBvZmZzZXQgMHg2MCAtIGNsZWFuYml0IDMgKi8KICAgICB1NjQgaW50ZXJydXB0X3No
YWRvdzsgICAgICAgLyogb2Zmc2V0IDB4NjggKi8KICAgICB1NjQgZXhpdGNvZGU7ICAgICAgICAg
ICAgICAgLyogb2Zmc2V0IDB4NzAgKi8KLSAgICB1NjQgZXhpdGluZm8xOyAgICAgICAgICAgICAg
Lyogb2Zmc2V0IDB4NzggKi8KLSAgICB1NjQgZXhpdGluZm8yOyAgICAgICAgICAgICAgLyogb2Zm
c2V0IDB4ODAgKi8KKyAgICB1bmlvbiB7CisgICAgICAgIHU2NCBleGl0aW5mbzE7ICAgICAgICAg
IC8qIG9mZnNldCAweDc4ICovCisgICAgICAgIHVuaW9uIHsKKyAgICAgICAgICAgIHN0cnVjdCB7
CisgICAgICAgICAgICAgICAgdWludDE2X3Qgc2VsOworICAgICAgICAgICAgfSB0YXNrX3N3aXRj
aDsKKyAgICAgICAgfSBlMTsKKyAgICB9OworICAgIHVuaW9uIHsKKyAgICAgICAgdTY0IGV4aXRp
bmZvMjsgICAgICAgICAgLyogb2Zmc2V0IDB4ODAgKi8KKyAgICAgICAgdW5pb24geworICAgICAg
ICAgICAgc3RydWN0IHsKKyAgICAgICAgICAgICAgICB1aW50MzJfdCBlYzsKKyAgICAgICAgICAg
ICAgICB1aW50MzJfdCA6NDsKKyAgICAgICAgICAgICAgICBib29sICAgICBpcmV0OjE7CisgICAg
ICAgICAgICAgICAgdWludDMyX3QgOjE7CisgICAgICAgICAgICAgICAgYm9vbCAgICAgam1wOjE7
CisgICAgICAgICAgICAgICAgdWludDMyX3QgOjU7CisgICAgICAgICAgICAgICAgYm9vbCAgICAg
ZXY6MTsKKyAgICAgICAgICAgICAgICB1aW50MzJfdCA6MzsKKyAgICAgICAgICAgICAgICBib29s
ICAgICByZjoxOworICAgICAgICAgICAgfSB0YXNrX3N3aXRjaDsKKyAgICAgICAgfSBlMjsKKyAg
ICB9OwogICAgIGludGluZm9fdCBleGl0aW50aW5mbzsgICAgICAvKiBvZmZzZXQgMHg4OCAqLwog
ICAgIHU2NCBfbnBfZW5hYmxlOyAgICAgICAgICAgICAvKiBvZmZzZXQgMHg5MCAtIGNsZWFuYml0
IDQgKi8KICAgICB1NjQgcmVzMDhbMl07Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
