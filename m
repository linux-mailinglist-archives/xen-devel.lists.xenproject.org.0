Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86771C91
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 18:10:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpxIw-0001RR-EO; Tue, 23 Jul 2019 16:06:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vTna=VU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpxIu-0001Qu-JJ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 16:06:16 +0000
X-Inumbo-ID: cc927f2b-ad63-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc927f2b-ad63-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 16:06:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZlNUuxeH1saAlTLwhpthpaiwXaxB8ss+49ShkSXZoGmwrTAqif7FQJw++52tUuRezUauya0JT2
 Ei46w3yYuupqao+614NdmiCRc2Ho+ByDlub31MbOn9/G7juJY2gthjmdMIWjsPnjCSfp8sXmiT
 SpZ0G0d+EV6ocH8A/uonPmTyzbXrLUt5ib+CSiIyJZz745+3v9KwXS3ADaZs5kaT6hMCD+tMEw
 YXLtiyhDDZcE8FqtNzmucHEYzwhXUrLSIP0HJa5i4i61t6kYrrzH8KEXjGYECgPltTNf5KP0Ey
 KY0=
X-SBRS: 2.7
X-MesageID: 3410782
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3410782"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 17:06:05 +0100
Message-ID: <20190723160609.2177-3-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190723160609.2177-1-paul.durrant@citrix.com>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/6] domain: remove 'guest_type' field (and enum
 guest_type)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGVudW0gZ3Vlc3RfdHlwZSB3YXMgaW50cm9kdWNlZCBpbiBjb21taXQgNmM2NDkyNzgwZWEg
InB2aCBwcmVwOgppbnRyb2R1Y2UgcHYgZ3Vlc3QgdHlwZSBhbmQgaGFzX2h2bV9jb250YWluZXIg
bWFjcm9zIiB0byBhbGxvdyBhIG5ldyBndWVzdAp0eXBlLCBkaXN0aW5jdCBmcm9tIGVpdGhlciBQ
ViBvciBIVk0gZ3Vlc3QgdHlwZXMsIHRvIGJlIGFkZGVkIGluIGNvbW1pdAo4MjcxZDY1MjJjNiAi
cHZoOiBpbnRyb2R1Y2UgUFZIIGd1ZXN0IHR5cGUiLiBTdWJzZXF1ZW50bHksIGNvbW1pdAozM2U1
YzMyNTU5ZSAieDg2OiByZW1vdmUgUFZIdjEgY29kZSIgcmVtb3ZlZCB0aGlzIHRoaXJkIGd1ZXN0
IHR5cGUuCgpUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIHN0cnVjdCBkb21haW4gZmllbGQgYW5kIGVu
dW1lcmF0aW9uIGFzIHRoZSBndWVzdAp0eXBlIGNhbiBub3cgYmUgdHJpdmlhbGx5IGRldGVybWlu
ZWQgZnJvbSB0aGUgJ2NyZWF0ZWZsYWdzJyBmaWVsZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
ZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KLS0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICB8ICA0IC0tLS0KIHhlbi9jb21tb24vZG9t
Y3RsLmMgICAgIHwgMTAgKy0tLS0tLS0tLQogeGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgfCAgOSAr
Ky0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMTQgKysrKy0tLS0tLS0tLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCBkNTU5
Yzg4OThlLi42ZjQwNWQyNTQxIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBi
L3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTM1NSwxMCArMzU1LDYgQEAgc3RydWN0IGRvbWFpbiAq
ZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAogICAgICAgICBoYXJkd2FyZV9kb21haW4gPSBk
OwogICAgIH0KIAotICAgIC8qIFNvcnQgb3V0IG91ciBpZGVhIG9mIGlzX3twdixodm19X2RvbWFp
bigpLiAgQWxsIHN5c3RlbSBkb21haW5zIGFyZSBQVi4gKi8KLSAgICBkLT5ndWVzdF90eXBlID0g
KChkLT5jcmVhdGVmbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCkKLSAgICAgICAgICAg
ICAgICAgICAgID8gZ3Vlc3RfdHlwZV9odm0gOiBndWVzdF90eXBlX3B2KTsKLQogICAgIFRSQUNF
XzFEKFRSQ19ET00wX0RPTV9BREQsIGQtPmRvbWFpbl9pZCk7CiAKICAgICAvKgpkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hlbi9jb21tb24vZG9tY3RsLmMKaW5kZXggNzJhNDQ5
NTNkMC4uZWY2NzE0YzBhYSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21jdGwuYworKysgYi94
ZW4vY29tbW9uL2RvbWN0bC5jCkBAIC0xODcsMTcgKzE4Nyw5IEBAIHZvaWQgZ2V0ZG9tYWluaW5m
byhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRkb21haW5pbmZvICppbmZv
KQogICAgICAgICAoZC0+Y29udHJvbGxlcl9wYXVzZV9jb3VudCA+IDAgID8gWEVOX0RPTUlORl9w
YXVzZWQgICAgOiAwKSB8CiAgICAgICAgIChkLT5kZWJ1Z2dlcl9hdHRhY2hlZCAgICAgICAgICAg
PyBYRU5fRE9NSU5GX2RlYnVnZ2VkICA6IDApIHwKICAgICAgICAgKGQtPmlzX3hlbnN0b3JlICAg
ICAgICAgICAgICAgICA/IFhFTl9ET01JTkZfeHNfZG9tYWluIDogMCkgfAorICAgICAgICAoaXNf
aHZtX2RvbWFpbihkKSAgICAgICAgICAgICAgID8gWEVOX0RPTUlORl9odm1fZ3Vlc3QgOiAwKSB8
CiAgICAgICAgIGQtPnNodXRkb3duX2NvZGUgPDwgWEVOX0RPTUlORl9zaHV0ZG93bnNoaWZ0Owog
Ci0gICAgc3dpdGNoICggZC0+Z3Vlc3RfdHlwZSApCi0gICAgewotICAgIGNhc2UgZ3Vlc3RfdHlw
ZV9odm06Ci0gICAgICAgIGluZm8tPmZsYWdzIHw9IFhFTl9ET01JTkZfaHZtX2d1ZXN0OwotICAg
ICAgICBicmVhazsKLSAgICBkZWZhdWx0OgotICAgICAgICBicmVhazsKLSAgICB9Ci0KICAgICB4
c21fc2VjdXJpdHlfZG9tYWluaW5mbyhkLCBpbmZvKTsKIAogICAgIGluZm8tPnRvdF9wYWdlcyAg
ICAgICAgID0gZC0+dG90X3BhZ2VzOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9rZXJuZWwuYyBi
L3hlbi9jb21tb24va2VybmVsLmMKaW5kZXggNjEyNTc1NDMwZi4uZjc2MjhkNzNjZSAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYworKysgYi94ZW4vY29tbW9uL2tlcm5lbC5jCkBAIC00
NzQsMTkgKzQ3NCwxNCBAQCBETyh4ZW5fdmVyc2lvbikoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh2b2lkKSBhcmcpCiAgICAgICAgICAgICBmaS5zdWJtYXAgfD0gKDFVIDw8IFhFTkZF
QVRfQVJNX1NNQ0NDX3N1cHBvcnRlZCk7CiAjZW5kaWYKICNpZmRlZiBDT05GSUdfWDg2Ci0gICAg
ICAgICAgICBzd2l0Y2ggKCBkLT5ndWVzdF90eXBlICkKLSAgICAgICAgICAgIHsKLSAgICAgICAg
ICAgIGNhc2UgZ3Vlc3RfdHlwZV9wdjoKKyAgICAgICAgICAgIGlmICggaXNfcHZfZG9tYWluKGQp
ICkKICAgICAgICAgICAgICAgICBmaS5zdWJtYXAgfD0gKDFVIDw8IFhFTkZFQVRfbW11X3B0X3Vw
ZGF0ZV9wcmVzZXJ2ZV9hZCkgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwg
WEVORkVBVF9oaWdobWVtX2Fzc2lzdCkgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
MVUgPDwgWEVORkVBVF9nbnR0YWJfbWFwX2F2YWlsX2JpdHMpOwotICAgICAgICAgICAgICAgIGJy
ZWFrOwotICAgICAgICAgICAgY2FzZSBndWVzdF90eXBlX2h2bToKKyAgICAgICAgICAgIGVsc2UK
ICAgICAgICAgICAgICAgICBmaS5zdWJtYXAgfD0gKDFVIDw8IFhFTkZFQVRfaHZtX3NhZmVfcHZj
bG9jaykgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVORkVBVF9odm1f
Y2FsbGJhY2tfdmVjdG9yKSB8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChoYXNfcGly
cShkKSA/ICgxVSA8PCBYRU5GRUFUX2h2bV9waXJxcykgOiAwKTsKLSAgICAgICAgICAgICAgICBi
cmVhazsKLSAgICAgICAgICAgIH0KICNlbmRpZgogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAg
IGRlZmF1bHQ6CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oCmluZGV4IGVkYWUzNzJjMmIuLjlhOTg4NTcyMzcgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBA
IC0zMDIsMTAgKzMwMiw2IEBAIHN0cnVjdCB2bV9ldmVudF9kb21haW4KIAogc3RydWN0IGV2dGNo
bl9wb3J0X29wczsKIAotZW51bSBndWVzdF90eXBlIHsKLSAgICBndWVzdF90eXBlX3B2LCBndWVz
dF90eXBlX2h2bQotfTsKLQogc3RydWN0IGRvbWFpbgogewogICAgIHVuc2lnbmVkIGludCAgICAg
Y3JlYXRlZmxhZ3M7CkBAIC0zNTcsOCArMzUzLDYgQEAgc3RydWN0IGRvbWFpbgogICAgIHN0cnVj
dCByYWRpeF90cmVlX3Jvb3QgcGlycV90cmVlOwogICAgIHVuc2lnbmVkIGludCAgICAgbnJfcGly
cXM7CiAKLSAgICBlbnVtIGd1ZXN0X3R5cGUgZ3Vlc3RfdHlwZTsKLQogICAgIC8qIElzIHRoaXMg
Z3Vlc3QgZHlpbmcgKGkuZS4sIGEgem9tYmllKT8gKi8KICAgICBlbnVtIHsgRE9NRFlJTkdfYWxp
dmUsIERPTURZSU5HX2R5aW5nLCBET01EWUlOR19kZWFkIH0gaXNfZHlpbmc7CiAKQEAgLTkxOCw4
ICs5MTIsOCBAQCB2b2lkIHdhdGNoZG9nX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQp
OwogCiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHZfZG9tYWluKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQpCiB7Ci0gICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX1BWKQotICAgICAgICAgICA/IGV2
YWx1YXRlX25vc3BlYyhkLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfcHYpIDogZmFsc2U7Cisg
ICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX1BWKSAmJgorICAgICAgICAhZXZhbHVhdGVfbm9z
cGVjKGQtPmNyZWF0ZWZsYWdzICYgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0KTsKIH0KIAogc3Rh
dGljIGlubGluZSBib29sIGlzX3B2X3ZjcHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCkBAIC05NTAs
OCArOTQ0LDggQEAgc3RhdGljIGlubGluZSBib29sIGlzX3B2XzY0Yml0X3ZjcHUoY29uc3Qgc3Ry
dWN0IHZjcHUgKnYpCiAjZW5kaWYKIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNv
bnN0IHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0hW
TSkKLSAgICAgICAgICAgPyBldmFsdWF0ZV9ub3NwZWMoZC0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90
eXBlX2h2bSkgOiBmYWxzZTsKKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZNKSAmJgor
ICAgICAgICBldmFsdWF0ZV9ub3NwZWMoZC0+Y3JlYXRlZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9o
dm1fZ3Vlc3QpOwogfQogCiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfaHZtX3ZjcHUoY29uc3Qgc3Ry
dWN0IHZjcHUgKnYpCi0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
