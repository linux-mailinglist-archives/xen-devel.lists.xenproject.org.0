Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84807B2322
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8nDX-0008GO-Ad; Fri, 13 Sep 2019 15:10:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8nDV-0008G9-5t
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:10:33 +0000
X-Inumbo-ID: a0e59576-d638-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0e59576-d638-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568387432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fVtIWB8XtGXW3UOkFZ6oQfQBixo0HT+FOB0oQh+RJ3A=;
 b=T6XSWmbqzNrgAvcF1YjrXPBKWnovR1XouN5csSAu5PTHrG+eJdwsu68r
 Ip5gGdUzTEfV/jXaGEEDqDneutt6COVefGbglXkTEAe8iQZm6UrYQc9IL
 qr6gC1yKg9oJzNFpwXF2wencwfoapP/QAmpJ1y9xV0ZwfONtp5Y9oF7oI w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jKNjfD94l42Q3RU1kETUtDK3BoZfgdnGxZKNfArJEbDyFTLgaUPdTvRJiksIMPWuyRfkDwS6u/
 N8186rlpfPEy5uUT1ADwebTEFk0jTEPMykNuGAp1S63AiUtiMP1oHwZ6YELGOw1C3S9kSbnTBY
 AVxG1Qq7zdVeZ32YQeUHm/YpdQa9Byi9fNKCRnNN83+Fm0KZp2CnUbUvBesosr7d0r5FKYf2hh
 Vjup/OKT6ogjiGcd5R0bVY/JvIfm2ZND9YS0A4uWk/DMlxHhJDgSBrVSTJkLyStEQhXwtal5ro
 yG4=
X-SBRS: 2.7
X-MesageID: 5543184
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5543184"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Fri, 13 Sep 2019 15:50:59 +0100
Message-ID: <20190913145100.303433-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913145100.303433-1-anthony.perard@citrix.com>
References: <20190913145100.303433-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 10/11] OvmfPkg/XenPvBlkDxe: Use
 XenBusIo->RegisterExitCallback
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byByZXNldCB0aGUgYmFja2VuZCBiZWZvcmUgaGFuZGluZyBp
dCB0byB0aGUgbmV4dApvcGVyYXRpbmcgc3lzdGVtLCBpdCBzaG91bGQgYmUgcmVzZXQgcHJvcGVy
bHkuIFRoaXMgcGF0Y2ggcmVnaXN0ZXIgYQpjYWxsYmFjayBmdW5jdGlvbiB0byBiZSBjYWxsZWQg
YnkgWGVuQnVzRHhlIGR1cmluZyB0aGUKRXhpdEJvb3RTZXJ2aWNlcyBldmVudC4KClJlZjogaHR0
cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTkwClNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIE92
bWZQa2cvWGVuUHZCbGtEeGUvQmxvY2tGcm9udC5jICB8IDM3ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0KIE92bWZQa2cvWGVuUHZCbGtEeGUvQmxvY2tGcm9udC5oICB8IDEyICsrKysr
KysrKy0KIE92bWZQa2cvWGVuUHZCbGtEeGUvWGVuUHZCbGtEeGUuYyB8ICA0ICsrLS0KIDMgZmls
ZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9Pdm1mUGtnL1hlblB2QmxrRHhlL0Jsb2NrRnJvbnQuYyBiL092bWZQa2cvWGVuUHZCbGtEeGUv
QmxvY2tGcm9udC5jCmluZGV4IDI1YTM5OGNjYzQuLjdjMTY2ODg4YmQgMTAwNjQ0Ci0tLSBhL092
bWZQa2cvWGVuUHZCbGtEeGUvQmxvY2tGcm9udC5jCisrKyBiL092bWZQa2cvWGVuUHZCbGtEeGUv
QmxvY2tGcm9udC5jCkBAIC0zMDksNiArMzA5LDggQEAgWGVuUHZCbG9ja0Zyb250SW5pdGlhbGl6
YXRpb24gKAogICAgICAgICAgIERldi0+TWVkaWFJbmZvLlNlY3RvcnMsIERldi0+TWVkaWFJbmZv
LlNlY3RvclNpemUpKTsNCiANCiAgICpEZXZQdHIgPSBEZXY7DQorDQorICBYZW5CdXNJby0+UmVn
aXN0ZXJFeGl0Q2FsbGJhY2sgKFhlbkJ1c0lvLCBYZW5QdkJsb2NrRnJvbnRSZXNldCwgRGV2KTsN
CiAgIHJldHVybiBFRklfU1VDQ0VTUzsNCiANCiBFcnJvcjI6DQpAQCAtMzI2LDEzICszMjgsMTYg
QEAgWGVuUHZCbG9ja0Zyb250SW5pdGlhbGl6YXRpb24gKAogDQogVk9JRA0KIFhlblB2QmxvY2tG
cm9udFNodXRkb3duICgNCi0gIElOIFhFTl9CTE9DS19GUk9OVF9ERVZJQ0UgKkRldg0KKyAgSU4g
WEVOX0JMT0NLX0ZST05UX0RFVklDRSAqRGV2LA0KKyAgSU4gQk9PTEVBTiAgICAgICAgICAgICAg
ICBSZXNldE9ubHkNCiAgICkNCiB7DQogICBYRU5CVVNfUFJPVE9DT0wgKlhlbkJ1c0lvID0gRGV2
LT5YZW5CdXNJbzsNCiAgIFhFTlNUT1JFX1NUQVRVUyBTdGF0dXM7DQogICBVSU5UNjQgVmFsdWU7
DQogDQorICBYZW5CdXNJby0+UmVnaXN0ZXJFeGl0Q2FsbGJhY2sgKFhlbkJ1c0lvLCBOVUxMLCBO
VUxMKTsNCisNCiAgIFhlblB2QmxvY2tTeW5jIChEZXYpOw0KIA0KICAgU3RhdHVzID0gWGVuQnVz
SW8tPlNldFN0YXRlIChYZW5CdXNJbywgWFNUX05JTCwgWGVuYnVzU3RhdGVDbG9zaW5nKTsNCkBA
IC0zOTMsMTIgKzM5OCwzOCBAQCBYZW5QdkJsb2NrRnJvbnRTaHV0ZG93biAoCiAgIH0NCiANCiBD
bG9zZToNCi0gIFhlbkJ1c0lvLT5VbnJlZ2lzdGVyV2F0Y2ggKFhlbkJ1c0lvLCBEZXYtPlN0YXRl
V2F0Y2hUb2tlbik7DQorICBpZiAoIVJlc2V0T25seSkgew0KKyAgICBYZW5CdXNJby0+VW5yZWdp
c3RlcldhdGNoIChYZW5CdXNJbywgRGV2LT5TdGF0ZVdhdGNoVG9rZW4pOw0KKyAgfQ0KICAgWGVu
QnVzSW8tPlhzUmVtb3ZlIChYZW5CdXNJbywgWFNUX05JTCwgInJpbmctcmVmIik7DQogICBYZW5C
dXNJby0+WHNSZW1vdmUgKFhlbkJ1c0lvLCBYU1RfTklMLCAiZXZlbnQtY2hhbm5lbCIpOw0KICAg
WGVuQnVzSW8tPlhzUmVtb3ZlIChYZW5CdXNJbywgWFNUX05JTCwgInByb3RvY29sIik7DQogDQot
ICBYZW5QdkJsb2NrRnJlZSAoRGV2KTsNCisgIGlmIChSZXNldE9ubHkpIHsNCisgICAgWGVuQnVz
SW8tPkdyYW50RW5kQWNjZXNzIChYZW5CdXNJbywgRGV2LT5SaW5nUmVmKTsNCisgICAgWGVuQnVz
SW8tPkV2ZW50Q2hhbm5lbENsb3NlIChYZW5CdXNJbywgRGV2LT5FdmVudENoYW5uZWwpOw0KKyAg
fSBlbHNlIHsNCisgICAgWGVuUHZCbG9ja0ZyZWUgKERldik7DQorICB9DQorfQ0KKw0KKy8qKg0K
KyAgVG8gYmUgY2FsbGVkIHdoZW4gRXhpdEJvb3RTZXJ2aWNlcyBoYXMgYmVlbiBjYWxsZWQuDQor
DQorICBUaGlzIHNob3VsZCByZXNldCB0aGUgUFYgYmFja2VuZCB3aXRob3V0IHVzaW5nIG1lbW9y
eSBhbGxvY2F0aW9uDQorICBzZXJ2aWNlcy4NCisqKi8NCitWT0lEDQorRUZJQVBJDQorWGVuUHZC
bG9ja0Zyb250UmVzZXQgKA0KKyAgSU4gVk9JRCAqQ29udGV4dA0KKyAgKQ0KK3sNCisgIFhFTl9C
TE9DS19GUk9OVF9ERVZJQ0UgKkRldjsNCisNCisgIERldiA9IENvbnRleHQ7DQorDQorICBYZW5Q
dkJsb2NrRnJvbnRTaHV0ZG93biAoRGV2LCBUUlVFKTsNCiB9DQogDQogU1RBVElDDQpkaWZmIC0t
Z2l0IGEvT3ZtZlBrZy9YZW5QdkJsa0R4ZS9CbG9ja0Zyb250LmggYi9Pdm1mUGtnL1hlblB2Qmxr
RHhlL0Jsb2NrRnJvbnQuaAppbmRleCA3YzJkN2YyYzllLi5lYmNlNGZlNDM0IDEwMDY0NAotLS0g
YS9Pdm1mUGtnL1hlblB2QmxrRHhlL0Jsb2NrRnJvbnQuaAorKysgYi9Pdm1mUGtnL1hlblB2Qmxr
RHhlL0Jsb2NrRnJvbnQuaApAQCAtNjcsOSArNjcsMTkgQEAgWGVuUHZCbG9ja0Zyb250SW5pdGlh
bGl6YXRpb24gKAogICBPVVQgWEVOX0JMT0NLX0ZST05UX0RFVklDRSAqKkRldlB0cg0KICAgKTsN
CiANCisvKioNCisgIEBwYXJhbSBSZXNldE9ubHkgICAgICBTZXQgdG8gVFJVRSB3aGVuIGNhbGxl
ZCBkdXJpbmcgdGhlIEV4aXRCb290U2VydmljZXMuDQorKiovDQogVk9JRA0KIFhlblB2QmxvY2tG
cm9udFNodXRkb3duICgNCi0gIElOIFhFTl9CTE9DS19GUk9OVF9ERVZJQ0UgKkRldg0KKyAgSU4g
WEVOX0JMT0NLX0ZST05UX0RFVklDRSAqRGV2LA0KKyAgSU4gQk9PTEVBTiAgICAgICAgICAgICAg
ICBSZXNldE9ubHkNCisgICk7DQorDQorVk9JRA0KK0VGSUFQSQ0KK1hlblB2QmxvY2tGcm9udFJl
c2V0ICgNCisgIElOIFZPSUQgKkNvbnRleHQNCiAgICk7DQogDQogVk9JRA0KZGlmZiAtLWdpdCBh
L092bWZQa2cvWGVuUHZCbGtEeGUvWGVuUHZCbGtEeGUuYyBiL092bWZQa2cvWGVuUHZCbGtEeGUv
WGVuUHZCbGtEeGUuYwppbmRleCBiZmU3YjFhNzU0Li4zMDMxNDA2OTgwIDEwMDY0NAotLS0gYS9P
dm1mUGtnL1hlblB2QmxrRHhlL1hlblB2QmxrRHhlLmMKKysrIGIvT3ZtZlBrZy9YZW5QdkJsa0R4
ZS9YZW5QdkJsa0R4ZS5jCkBAIC0zMTIsNyArMzEyLDcgQEAgWGVuUHZCbGtEeGVEcml2ZXJCaW5k
aW5nU3RhcnQgKAogDQogVW5pbml0QmxvY2tGcm9udDoNCiAgIEZyZWVQb29sIChNZWRpYSk7DQot
ICBYZW5QdkJsb2NrRnJvbnRTaHV0ZG93biAoRGV2KTsNCisgIFhlblB2QmxvY2tGcm9udFNodXRk
b3duIChEZXYsIEZBTFNFKTsNCiBDbG9zZVByb3RvY29sOg0KICAgZ0JTLT5DbG9zZVByb3RvY29s
IChDb250cm9sbGVySGFuZGxlLCAmZ1hlbkJ1c1Byb3RvY29sR3VpZCwNCiAgICAgICAgICAgICAg
ICAgICAgICAgVGhpcy0+RHJpdmVyQmluZGluZ0hhbmRsZSwgQ29udHJvbGxlckhhbmRsZSk7DQpA
QCAtMzc3LDcgKzM3Nyw3IEBAIFhlblB2QmxrRHhlRHJpdmVyQmluZGluZ1N0b3AgKAogDQogICBN
ZWRpYSA9IEJsb2NrSW8tPk1lZGlhOw0KICAgRGV2ID0gWEVOX0JMT0NLX0ZST05UX0ZST01fQkxP
Q0tfSU8gKEJsb2NrSW8pOw0KLSAgWGVuUHZCbG9ja0Zyb250U2h1dGRvd24gKERldik7DQorICBY
ZW5QdkJsb2NrRnJvbnRTaHV0ZG93biAoRGV2LCBGQUxTRSk7DQogDQogICBGcmVlUG9vbCAoTWVk
aWEpOw0KIA0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
