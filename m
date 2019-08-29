Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AA5A1492
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:20:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GZV-0005zY-Dq; Thu, 29 Aug 2019 09:18:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HRfl=WZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i3GZT-0005z4-DT
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:18:23 +0000
X-Inumbo-ID: f14efa4a-ca3d-11e9-ae63-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f14efa4a-ca3d-11e9-ae63-12813bfff9fa;
 Thu, 29 Aug 2019 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567070300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=O7NxSRBNX0XUNAewfzHZ65B7XqwU4/eiYsXkNQ6YvNw=;
 b=IGxnq9lVHziWT1J6n3UOKidORoAk/at1E0pP/RemaHhdJthN6OIsUZsw
 8o9C3BLUn8ItXctyLRicpqtDqxs8VRuKtDFxKLz+ZMBJpWX8Ac4uZD0p4
 YKcDVygqe69LQhFy/FY8hAWDP4Ks+zBrzB12fyKgbCGw5CQpFI+C5qb29 A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: q2TmiDP+cVgXgsjXLCLeIVRgfxEeOsYFtHeKnwg5B2Q54xccrna8h/4JrB+8X+HfhRPZN1vPao
 zeSBEomTEwfkpaYhk1jDbpkaAwMZheWKQlGcbKkUbuGqcmuIT8h7rqKj09iG09hqmZOR7t21uJ
 qAowfkDWA2VqViTJckfvr//hrBvAi/sXNmdBUZEZOI7jIbbjwngM93l2qDPrP2LzU0xoBocm8B
 XuB5iinzFNfrUmt558fP2siL53sZU/BPCdimC7Imy/geXSuj6I2d3ol7mTrqajT5/wvZTyrPTT
 eno=
X-SBRS: 2.7
X-MesageID: 5135953
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5135953"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 29 Aug 2019 10:17:18 +0100
Message-ID: <20190829091719.25605-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190829091719.25605-1-ian.jackson@eu.citrix.com>
References: <20190829091719.25605-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/3] host properties: Firmware: Move
 default to selecthost
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCB0aGUgZXhwbGljaXQgZGVmYXVsdCBmcm9tIGFsbCB0aGUgY2FsbCBzaXRlcy4gIFRoaXMg
Y2VudHJhbGlzZXMKdGhlIGRlZmF1bHQuICBUaGlzIGlzIGdvaW5nIHRvIGJlIHRoZSBuZXcgc2No
ZW1lIGZvciBob3N0IHByb3BlcnRpZXMKaW4gZ2VuZXJhbC4KCihUd28gb2YgdGhlIGNhbGwgc2l0
ZXMgaGFkIGEgZGlmZmVyZW50IGRlZmF1bHQsICIiLCB3aGljaCBpbiB0aGVpcgpjb250ZXh0IHdh
cyBzZW1hbnRpY2FsbHkgZXF1aXZhbGVudCB0byAiYmlvcyIuKQoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4u
cG0gICAgICB8ICA0ICsrLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAxMyArKysrKysrKyst
LS0tCiB0cy14ZW4taW5zdGFsbCAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlh
bi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDkxMWQ4OTA1Li43OWFhMmQyNCAxMDA2NDQK
LS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTQ0Myw3
ICs0NDMsNyBAQCBzdWIgc2V0dXBib290X2dydWIyICgkJCQkKSB7CiAKICAgICAjIEdydWIyIG9u
IGplc3NpZS9zdHJldGNoIEFSTSogZG9lc24ndCBkbyBtdWx0aWJvb3QsIHNvIHdlIG11c3QgY2hh
aW5sb2FkLgogICAgIG15ICRuZWVkX3VlZmlfY2hhaW5sb2FkID0KLSAgICAgICAgZ2V0X2hvc3Rf
cHJvcGVydHkoJGhvLCAiZmlybXdhcmUiLCAiIikgZXEgInVlZmkiICYmCisgICAgICAgIGdldF9o
b3N0X3Byb3BlcnR5KCRobywgImZpcm13YXJlIikgZXEgInVlZmkiICYmCiAgICAgICAgICRoby0+
e1N1aXRlfSA9fiBtL2plc3NpZXxzdHJldGNoLyAmJiAkaG8tPntBcmNofSA9fiBtL15hcm0vOwog
CiAgICAgbXkgJHBhcnNlbWVudT0gc3ViIHsKQEAgLTE0OTgsNyArMTQ5OCw3IEBAIEVORAogCiAg
ICAgcHJlc2VlZF9taWNyb2NvZGUoJGhvLCRzZngpOwogCi0gICAgaWYgKGdldF9ob3N0X3Byb3Bl
cnR5KCRobywgImZpcm13YXJlIiwnJykgZXEgInVlZmkiKSB7CisgICAgaWYgKGdldF9ob3N0X3By
b3BlcnR5KCRobywgImZpcm13YXJlIikgZXEgInVlZmkiKSB7CiAJZGllIHVubGVzcyAkaG8tPntT
dWl0ZX0gPX4gbS9qZXNzaWV8c3RyZXRjaC87CiAJIyBQcmV2ZW50IGdydWItaW5zdGFsbCBmcm9t
IG1ha2luZyBhIG5ldyBEZWJpYW4gYm9vdCBlbnRyeSwgc28KIAkjIHdlIGFsd2F5cyByZWJvb3Qg
ZnJvbSB0aGUgbmV0d29yay4gRGViaWFuIGJ1ZyAjNzg5Nzk4IHByb3Bvc2VzIGEKZGlmZiAtLWdp
dCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4
IGU1NTRhZjM4Li5iNjI5ZmI3ZCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQor
KysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0xMjE4LDcgKzEyMTgsMTAgQEAgc3ViIHNl
bGVjdGhvc3QgKCQ7JCkgewogCiAgICAgIy0tLS0tIGNhbGN1bGF0aW9uIG9mIHRoZSBob3N0J3Mg
cHJvcGVydGllcyAtLS0tLQogCi0gICAgJGhvLT57UHJvcGVydGllc30gPSB7IH07CisgICAgIyBG
aXJzdGx5LCBoYXJkY29kZWQgZGVmYXVsdHMKKyAgICAkaG8tPntQcm9wZXJ0aWVzfSA9IHsKKyAg
ICAgICAgRmlybXdhcmUgPT4gJ2Jpb3MnLAorICAgIH07CiAgICAgbXkgJHNldHByb3AgPSBzdWIg
ewogCW15ICgkcG4sJHZhbCkgPSBAXzsKIAkkaG8tPntQcm9wZXJ0aWVzfXskcG59ID0gJHZhbDsK
QEAgLTEzNjMsNiArMTM2Niw4IEBAIHN1YiBwcm9wbmFtZV9jaGVjayAoJCkgewogCiAjIEl0IGlz
IGZpbmUgdG8gY2FsbCB0aGlzIG9uIGEgZ3Vlc3Qgb2JqZWN0IHRvbywgaW4gd2hpY2ggY2FzZSBp
dCB3aWxsCiAjIGFsd2F5cyByZXR1cm4gJGRlZnZhbC4KKyMgSWRlYWxseSBhbGwgdXNlcyBvZiAk
ZGVmdmFsIHdvdWxkIGJlIHJlcGxhY2VkIGJ5IGRlZmF1bHRzIGluIHRoZQorIyBpbml0aWFsIGFy
cmF5IGluIHNlbGVjdGhvc3QuCiBzdWIgZ2V0X2hvc3RfcHJvcGVydHkgKCQkOyQpIHsKICAgICBt
eSAoJGhvLCAkcHJvcCwgJGRlZnZhbCkgPSBAXzsKICAgICByZXR1cm4gJGRlZnZhbCB1bmxlc3Mg
JGhvLT57UHJvcGVydGllc307CkBAIC0yODExLDcgKzI4MTYsNyBAQCBzdWIgaG9zdF9uZXRib290
X2ZpbGUgKCQ7JCkgewogICAgICMgaW4gYXJyYXkgY29udGV4dCwgcmV0dXJucyAoZGlyLCBwYXRo
dGFpbCkKICAgICAjICB3aGVyZSBkaXIgZG9lcyBub3QgZGVwZW5kIG9uICR0ZW1wbGF0ZWtleXRh
aWwKICAgICBteSAldiA9ICVyOwotICAgIG15ICRmaXJtd2FyZSA9IGdldF9ob3N0X3Byb3BlcnR5
KCRobywgImZpcm13YXJlIiwgImJpb3MiKTsKKyAgICBteSAkZmlybXdhcmUgPSBnZXRfaG9zdF9w
cm9wZXJ0eSgkaG8sICJmaXJtd2FyZSIpOwogICAgIG15ICR0ZW1wbGF0ZWtleWJhc2UgPSAkZmly
bXdhcmUgZXEgJ3VlZmknID8gJ05ldEdydWInIDogJ1B4ZSc7CiAgICAgJHRlbXBsYXRla2V5dGFp
bCAvLz0gJ1RlbXBsYXRlcyc7CiAgICAgbXkgJHRlbXBsYXRla2V5ID0gJHRlbXBsYXRla2V5YmFz
ZS4kdGVtcGxhdGVrZXl0YWlsOwpAQCAtMjkzNyw3ICsyOTQyLDcgQEAgRU5ECiAKIHN1YiBzZXR1
cF9uZXRib290X2xvY2FsICgkKSB7CiAgICAgbXkgKCRobykgPSBAXzsKLSAgICBteSAkZmlybXdh
cmUgPSBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICJmaXJtd2FyZSIsICJiaW9zIik7CisgICAgbXkg
JGZpcm13YXJlID0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAiZmlybXdhcmUiKTsKICAgICAkZmly
bXdhcmUgPX4gcy8tL18vZzsKICAgICBubyBzdHJpY3QgcXcocmVmcyk7CiAgICAgcmV0dXJuICZ7
InNldHVwX25ldGJvb3RfbG9jYWxfJHtmaXJtd2FyZX0ifSgkaG8pOwpAQCAtMjk0NSw3ICsyOTUw
LDcgQEAgc3ViIHNldHVwX25ldGJvb3RfbG9jYWwgKCQpIHsKIAogc3ViIHNldHVwX25ldGJvb3Rf
ZGkgKCQkJCQkOyUpIHsKICAgICBteSAoJGhvLCRrZXJuLCRpbml0cmQsJGRpY21kLCRob2NtZCwl
eG9wdHMpID0gQF87Ci0gICAgbXkgJGZpcm13YXJlID0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAi
ZmlybXdhcmUiLCAiYmlvcyIpOworICAgIG15ICRmaXJtd2FyZSA9IGdldF9ob3N0X3Byb3BlcnR5
KCRobywgImZpcm13YXJlIik7CiAgICAgJGZpcm13YXJlID1+IHMvLS9fL2c7CiAgICAgbm8gc3Ry
aWN0IHF3KHJlZnMpOwogICAgIHJldHVybiAmeyJzZXR1cF9uZXRib290X2RpXyR7ZmlybXdhcmV9
In0oJGhvLCRrZXJuLCRpbml0cmQsCmRpZmYgLS1naXQgYS90cy14ZW4taW5zdGFsbCBiL3RzLXhl
bi1pbnN0YWxsCmluZGV4IDJkM2M2NDRkLi4xNTRmNzhjNyAxMDA3NTUKLS0tIGEvdHMteGVuLWlu
c3RhbGwKKysrIGIvdHMteGVuLWluc3RhbGwKQEAgLTExNCw3ICsxMTQsNyBAQCBzdWIgZXh0cmFk
ZWJzICgpIHsKICAgICBzb21lX2V4dHJhZGVicyhbICdEZWJpYW5FeHRyYVBhY2thZ2VzJywgJHN1
aXRlIF0pOwogCiAgICAgIyAkY3sgRGViaWFuRXh0cmFQYWNrYWdlc188ZmlybXdhcmU+XzxhcmNo
Pl88c3VpdGU+IH0KLSAgICBteSAkZmlybXdhcmUgPSBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICJm
aXJtd2FyZSIsICJiaW9zIik7CisgICAgbXkgJGZpcm13YXJlID0gZ2V0X2hvc3RfcHJvcGVydHko
JGhvLCAiZmlybXdhcmUiKTsKICAgICBzb21lX2V4dHJhZGVicyhbICdEZWJpYW5FeHRyYVBhY2th
Z2VzJywgJGZpcm13YXJlLCAkaG8tPntBcmNofSwgJHN1aXRlIF0pOwogfQogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
