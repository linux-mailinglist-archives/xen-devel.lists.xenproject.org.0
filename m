Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18F5FA7E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:01:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3CA-0006iC-47; Thu, 04 Jul 2019 14:58:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3C7-0006fb-Kn
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:43 +0000
X-Inumbo-ID: 35c78fdc-9e6c-11e9-8b8d-d7240a2baef0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35c78fdc-9e6c-11e9-8b8d-d7240a2baef0;
 Thu, 04 Jul 2019 14:58:41 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gcEoXwaMUWtg37gLBFlzaW9XkZ7W9Jfj+cHNyzSMMsBRcYKIzXVA7TPl5gHjmjSG86QKHxl2qi
 2zp4D1+uCWcqBuwXMEX7OYEpReMUX0REHVSMQNhlErnOtnssRrn5I0T0QWO9K3+0KFs441XT1w
 LfeUYPV07+ybgeJY5u+mNCq9EUVZLSOhRA5xE3ISe3mMASoUvTDIXrXS+ezWYu/WX5z5Rmmw0G
 l9/pOLtzLmOUV4R6F17o0aN28qqTF7w/5rnufdFCxidxK/xUpAqh4+8TvJUfPucwct2rNUudub
 zBw=
X-SBRS: 2.7
X-MesageID: 2650944
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2650944"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:10 +0100
Message-ID: <20190704144233.27968-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 12/35] OvmfPkg/XenPlatformPei: Grab RSDP from
 PVH guest start of day struct
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
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hlY2sgaWYgdGhlcmUncyBhIHN0YXJ0IG9mIHRoZSBkYXkgc3RydWN0IHByb3ZpZGVkIHRvIFBW
SCBndWVzdCwgc2F2ZQp0aGUgQUNQSSBSU0RQIGFkZHJlc3MgZm9yIGxhdGVyLgoKVGhpcyBwYXRj
aCBpbXBvcnQgaW1wb3J0IGFyY2gteDg2L2h2bS9zdGFydF9pbmZvLmggZnJvbSB4ZW4uZ2l0LgoK
UmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkK
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgog
ICAgdjM6CiAgICAtIHVzZSBTUERYCiAgICAtIHVzZSBTSUdOQVRVUkVfMzIKICAgIC0gZml4IGNv
ZGluZyBzdHlsZQoKIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mICAg
ICB8ICAgMyArCiBPdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZvLmggICAgICAgICAgICAgICAg
fCAgIDQgKwogLi4uL1hlbi9hcmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oICAgICAgICAgICAgIHwg
MTQzICsrKysrKysrKysrKysrKysrKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyAgICAg
ICAgICAgICAgICAgIHwgIDI1ICsrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNzUgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hl
bi9hcmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9YZW5QbGF0Zm9ybVBlaS5pbmYgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBs
YXRmb3JtUGVpLmluZgppbmRleCBkMTI2NWMzNjVhLi40ZDAwMjA2ZDA5IDEwMDY0NAotLS0gYS9P
dm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZgorKysgYi9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZgpAQCAtODQsNiArODQsOSBAQCBbUGNkXQog
ICBnRWZpU2VjdXJpdHlQa2dUb2tlblNwYWNlR3VpZC5QY2RPcHRpb25Sb21JbWFnZVZlcmlmaWNh
dGlvblBvbGljeQ0KICAgZ1VlZmlDcHVQa2dUb2tlblNwYWNlR3VpZC5QY2RDcHVMb2NhbEFwaWNC
YXNlQWRkcmVzcw0KIA0KKyAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuUHZoU3Rh
cnRPZkRheVN0cnVjdFB0cg0KKyAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuUHZo
U3RhcnRPZkRheVN0cnVjdFB0clNpemUNCisNCiBbRml4ZWRQY2RdDQogICBnRWZpTWRlUGtnVG9r
ZW5TcGFjZUd1aWQuUGNkUGNpRXhwcmVzc0Jhc2VBZGRyZXNzDQogDQpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9JbmNsdWRlL0d1aWQvWGVuSW5mby5oIGIvT3ZtZlBrZy9JbmNsdWRlL0d1aWQvWGVuSW5m
by5oCmluZGV4IGIwNTJkNjE4ZmQuLjI1NzQzYjM4ODQgMTAwNjQ0Ci0tLSBhL092bWZQa2cvSW5j
bHVkZS9HdWlkL1hlbkluZm8uaAorKysgYi9Pdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZvLmgK
QEAgLTI1LDYgKzI1LDEwIEBAIHR5cGVkZWYgc3RydWN0IHsKICAgLy8vIEh5cGVydmlzb3IgbWlu
b3IgdmVyc2lvbi4NCiAgIC8vLw0KICAgVUlOVDE2IFZlcnNpb25NaW5vcjsNCisgIC8vLw0KKyAg
Ly8vIFBvaW50ZXIgdG8gdGhlIFJTRFAgZm91bmQgaW4gdGhlIGh2bV9zdGFydF9pbmZvIHByb3Zp
ZGVkIHRvIGEgUFZIIGd1ZXN0DQorICAvLy8NCisgIFZPSUQgKlJzZHBQdmg7DQogfSBFRklfWEVO
X0lORk87DQogDQogZXh0ZXJuIEVGSV9HVUlEIGdFZmlYZW5JbmZvR3VpZDsNCmRpZmYgLS1naXQg
YS9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYvaHZtL3N0YXJ0
X2luZm8uaCBiL092bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi9hcmNoLXg4Ni9o
dm0vc3RhcnRfaW5mby5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjE1
NzA4ZDZkZDUKLS0tIC9kZXYvbnVsbAorKysgYi9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFu
ZGFyZC9YZW4vYXJjaC14ODYvaHZtL3N0YXJ0X2luZm8uaApAQCAtMCwwICsxLDE0MyBAQAorLyoN
CisgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQorICoNCisgKiBDb3B5cmlnaHQgKGMp
IDIwMTYsIENpdHJpeCBTeXN0ZW1zLCBJbmMuDQorICovDQorDQorI2lmbmRlZiBfX1hFTl9QVUJM
SUNfQVJDSF9YODZfSFZNX1NUQVJUX0lORk9fSF9fDQorI2RlZmluZSBfX1hFTl9QVUJMSUNfQVJD
SF9YODZfSFZNX1NUQVJUX0lORk9fSF9fDQorDQorLyoNCisgKiBTdGFydCBvZiBkYXkgc3RydWN0
dXJlIHBhc3NlZCB0byBQVkggZ3Vlc3RzIGFuZCB0byBIVk0gZ3Vlc3RzIGluICVlYnguDQorICoN
CisgKiBOT1RFOiBub3RoaW5nIHdpbGwgYmUgbG9hZGVkIGF0IHBoeXNpY2FsIGFkZHJlc3MgMCwg
c28gYSAwIHZhbHVlIGluIGFueQ0KKyAqIG9mIHRoZSBhZGRyZXNzIGZpZWxkcyBzaG91bGQgYmUg
dHJlYXRlZCBhcyBub3QgcHJlc2VudC4NCisgKg0KKyAqICAwICstLS0tLS0tLS0tLS0tLS0tKw0K
KyAqICAgIHwgbWFnaWMgICAgICAgICAgfCBDb250YWlucyB0aGUgbWFnaWMgdmFsdWUgWEVOX0hW
TV9TVEFSVF9NQUdJQ19WQUxVRQ0KKyAqICAgIHwgICAgICAgICAgICAgICAgfCAoInhFbjMiIHdp
dGggdGhlIDB4ODAgYml0IG9mIHRoZSAiRSIgc2V0KS4NCisgKiAgNCArLS0tLS0tLS0tLS0tLS0t
LSsNCisgKiAgICB8IHZlcnNpb24gICAgICAgIHwgVmVyc2lvbiBvZiB0aGlzIHN0cnVjdHVyZS4g
Q3VycmVudCB2ZXJzaW9uIGlzIDEuIE5ldw0KKyAqICAgIHwgICAgICAgICAgICAgICAgfCB2ZXJz
aW9ucyBhcmUgZ3VhcmFudGVlZCB0byBiZSBiYWNrd2FyZHMtY29tcGF0aWJsZS4NCisgKiAgOCAr
LS0tLS0tLS0tLS0tLS0tLSsNCisgKiAgICB8IGZsYWdzICAgICAgICAgIHwgU0lGX3h4eCBmbGFn
cy4NCisgKiAxMiArLS0tLS0tLS0tLS0tLS0tLSsNCisgKiAgICB8IG5yX21vZHVsZXMgICAgIHwg
TnVtYmVyIG9mIG1vZHVsZXMgcGFzc2VkIHRvIHRoZSBrZXJuZWwuDQorICogMTYgKy0tLS0tLS0t
LS0tLS0tLS0rDQorICogICAgfCBtb2RsaXN0X3BhZGRyICB8IFBoeXNpY2FsIGFkZHJlc3Mgb2Yg
YW4gYXJyYXkgb2YgbW9kdWxlcw0KKyAqICAgIHwgICAgICAgICAgICAgICAgfCAobGF5b3V0IG9m
IHRoZSBzdHJ1Y3R1cmUgYmVsb3cpLg0KKyAqIDI0ICstLS0tLS0tLS0tLS0tLS0tKw0KKyAqICAg
IHwgY21kbGluZV9wYWRkciAgfCBQaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBjb21tYW5kIGxpbmUs
DQorICogICAgfCAgICAgICAgICAgICAgICB8IGEgemVyby10ZXJtaW5hdGVkIEFTQ0lJIHN0cmlu
Zy4NCisgKiAzMiArLS0tLS0tLS0tLS0tLS0tLSsNCisgKiAgICB8IHJzZHBfcGFkZHIgICAgIHwg
UGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgUlNEUCBBQ1BJIGRhdGEgc3RydWN0dXJlLg0KKyAqIDQw
ICstLS0tLS0tLS0tLS0tLS0tKw0KKyAqICAgIHwgbWVtbWFwX3BhZGRyICAgfCBQaHlzaWNhbCBh
ZGRyZXNzIG9mIHRoZSAob3B0aW9uYWwpIG1lbW9yeSBtYXAuIE9ubHkNCisgKiAgICB8ICAgICAg
ICAgICAgICAgIHwgcHJlc2VudCBpbiB2ZXJzaW9uIDEgYW5kIG5ld2VyIG9mIHRoZSBzdHJ1Y3R1
cmUuDQorICogNDggKy0tLS0tLS0tLS0tLS0tLS0rDQorICogICAgfCBtZW1tYXBfZW50cmllcyB8
IE51bWJlciBvZiBlbnRyaWVzIGluIHRoZSBtZW1vcnkgbWFwIHRhYmxlLiBaZXJvDQorICogICAg
fCAgICAgICAgICAgICAgICB8IGlmIHRoZXJlIGlzIG5vIG1lbW9yeSBtYXAgYmVpbmcgcHJvdmlk
ZWQuIE9ubHkNCisgKiAgICB8ICAgICAgICAgICAgICAgIHwgcHJlc2VudCBpbiB2ZXJzaW9uIDEg
YW5kIG5ld2VyIG9mIHRoZSBzdHJ1Y3R1cmUuDQorICogNTIgKy0tLS0tLS0tLS0tLS0tLS0rDQor
ICogICAgfCByZXNlcnZlZCAgICAgICB8IFZlcnNpb24gMSBhbmQgbmV3ZXIgb25seS4NCisgKiA1
NiArLS0tLS0tLS0tLS0tLS0tLSsNCisgKg0KKyAqIFRoZSBsYXlvdXQgb2YgZWFjaCBlbnRyeSBp
biB0aGUgbW9kdWxlIHN0cnVjdHVyZSBpcyB0aGUgZm9sbG93aW5nOg0KKyAqDQorICogIDAgKy0t
LS0tLS0tLS0tLS0tLS0rDQorICogICAgfCBwYWRkciAgICAgICAgICB8IFBoeXNpY2FsIGFkZHJl
c3Mgb2YgdGhlIG1vZHVsZS4NCisgKiAgOCArLS0tLS0tLS0tLS0tLS0tLSsNCisgKiAgICB8IHNp
emUgICAgICAgICAgIHwgU2l6ZSBvZiB0aGUgbW9kdWxlIGluIGJ5dGVzLg0KKyAqIDE2ICstLS0t
LS0tLS0tLS0tLS0tKw0KKyAqICAgIHwgY21kbGluZV9wYWRkciAgfCBQaHlzaWNhbCBhZGRyZXNz
IG9mIHRoZSBjb21tYW5kIGxpbmUsDQorICogICAgfCAgICAgICAgICAgICAgICB8IGEgemVyby10
ZXJtaW5hdGVkIEFTQ0lJIHN0cmluZy4NCisgKiAyNCArLS0tLS0tLS0tLS0tLS0tLSsNCisgKiAg
ICB8IHJlc2VydmVkICAgICAgIHwNCisgKiAzMiArLS0tLS0tLS0tLS0tLS0tLSsNCisgKg0KKyAq
IFRoZSBsYXlvdXQgb2YgZWFjaCBlbnRyeSBpbiB0aGUgbWVtb3J5IG1hcCB0YWJsZSBpcyBhcyBm
b2xsb3dzOg0KKyAqDQorICogIDAgKy0tLS0tLS0tLS0tLS0tLS0rDQorICogICAgfCBhZGRyICAg
ICAgICAgICB8IEJhc2UgYWRkcmVzcw0KKyAqICA4ICstLS0tLS0tLS0tLS0tLS0tKw0KKyAqICAg
IHwgc2l6ZSAgICAgICAgICAgfCBTaXplIG9mIG1hcHBpbmcgaW4gYnl0ZXMNCisgKiAxNiArLS0t
LS0tLS0tLS0tLS0tLSsNCisgKiAgICB8IHR5cGUgICAgICAgICAgIHwgVHlwZSBvZiBtYXBwaW5n
IGFzIGRlZmluZWQgYmV0d2VlbiB0aGUgaHlwZXJ2aXNvcg0KKyAqICAgIHwgICAgICAgICAgICAg
ICAgfCBhbmQgZ3Vlc3QuIFNlZSBYRU5fSFZNX01FTU1BUF9UWVBFXyogdmFsdWVzIGJlbG93Lg0K
KyAqIDIwICstLS0tLS0tLS0tLS0tLS0tfA0KKyAqICAgIHwgcmVzZXJ2ZWQgICAgICAgfA0KKyAq
IDI0ICstLS0tLS0tLS0tLS0tLS0tKw0KKyAqDQorICogVGhlIGFkZHJlc3MgYW5kIHNpemVzIGFy
ZSBhbHdheXMgYSA2NGJpdCBsaXR0bGUgZW5kaWFuIHVuc2lnbmVkIGludGVnZXIuDQorICoNCisg
KiBOQjogWGVuIG9uIHg4NiB3aWxsIGFsd2F5cyB0cnkgdG8gcGxhY2UgYWxsIHRoZSBkYXRhIGJl
bG93IHRoZSA0R2lCDQorICogYm91bmRhcnkuDQorICoNCisgKiBWZXJzaW9uIG51bWJlcnMgb2Yg
dGhlIGh2bV9zdGFydF9pbmZvIHN0cnVjdHVyZSBoYXZlIGV2b2x2ZWQgbGlrZSB0aGlzOg0KKyAq
DQorICogVmVyc2lvbiAwOiAgSW5pdGlhbCBpbXBsZW1lbnRhdGlvbi4NCisgKg0KKyAqIFZlcnNp
b24gMTogIEFkZGVkIHRoZSBtZW1tYXBfcGFkZHIvbWVtbWFwX2VudHJpZXMgZmllbGRzIChwbHVz
IDQgYnl0ZXMgb2YNCisgKiAgICAgICAgICAgICBwYWRkaW5nKSB0byB0aGUgZW5kIG9mIHRoZSBo
dm1fc3RhcnRfaW5mbyBzdHJ1Y3QuIFRoZXNlIG5ldw0KKyAqICAgICAgICAgICAgIGZpZWxkcyBj
YW4gYmUgdXNlZCB0byBwYXNzIGEgbWVtb3J5IG1hcCB0byB0aGUgZ3Vlc3QuIFRoZQ0KKyAqICAg
ICAgICAgICAgIG1lbW9yeSBtYXAgaXMgb3B0aW9uYWwgYW5kIHNvIGd1ZXN0cyB0aGF0IHVuZGVy
c3RhbmQgdmVyc2lvbiAxDQorICogICAgICAgICAgICAgb2YgdGhlIHN0cnVjdHVyZSBtdXN0IGNo
ZWNrIHRoYXQgbWVtbWFwX2VudHJpZXMgaXMgbm9uLXplcm8NCisgKiAgICAgICAgICAgICBiZWZv
cmUgdHJ5aW5nIHRvIHJlYWQgdGhlIG1lbW9yeSBtYXAuDQorICovDQorI2RlZmluZSBYRU5fSFZN
X1NUQVJUX01BR0lDX1ZBTFVFIDB4MzM2ZWM1NzgNCisNCisvKg0KKyAqIFRoZSB2YWx1ZXMgdXNl
ZCBpbiB0aGUgdHlwZSBmaWVsZCBvZiB0aGUgbWVtb3J5IG1hcCB0YWJsZSBlbnRyaWVzIGFyZQ0K
KyAqIGRlZmluZWQgYmVsb3cgYW5kIG1hdGNoIHRoZSBBZGRyZXNzIFJhbmdlIFR5cGVzIGFzIGRl
ZmluZWQgaW4gdGhlICJTeXN0ZW0NCisgKiBBZGRyZXNzIE1hcCBJbnRlcmZhY2VzIiBzZWN0aW9u
IG9mIHRoZSBBQ1BJIFNwZWNpZmljYXRpb24uIFBsZWFzZSByZWZlciB0bw0KKyAqIHNlY3Rpb24g
MTUgaW4gdmVyc2lvbiA2LjIgb2YgdGhlIEFDUEkgc3BlYzogaHR0cDovL3VlZmkub3JnL3NwZWNp
ZmljYXRpb25zDQorICovDQorI2RlZmluZSBYRU5fSFZNX01FTU1BUF9UWVBFX1JBTSAgICAgICAx
DQorI2RlZmluZSBYRU5fSFZNX01FTU1BUF9UWVBFX1JFU0VSVkVEICAyDQorI2RlZmluZSBYRU5f
SFZNX01FTU1BUF9UWVBFX0FDUEkgICAgICAzDQorI2RlZmluZSBYRU5fSFZNX01FTU1BUF9UWVBF
X05WUyAgICAgICA0DQorI2RlZmluZSBYRU5fSFZNX01FTU1BUF9UWVBFX1VOVVNBQkxFICA1DQor
I2RlZmluZSBYRU5fSFZNX01FTU1BUF9UWVBFX0RJU0FCTEVEICA2DQorI2RlZmluZSBYRU5fSFZN
X01FTU1BUF9UWVBFX1BNRU0gICAgICA3DQorDQorLyoNCisgKiBDIHJlcHJlc2VudGF0aW9uIG9m
IHRoZSB4ODYvSFZNIHN0YXJ0IGluZm8gbGF5b3V0Lg0KKyAqDQorICogVGhlIGNhbm9uaWNhbCBk
ZWZpbml0aW9uIG9mIHRoaXMgbGF5b3V0IGlzIGFib3ZlLCB0aGlzIGlzIGp1c3QgYSB3YXkgdG8N
CisgKiByZXByZXNlbnQgdGhlIGxheW91dCBkZXNjcmliZWQgdGhlcmUgdXNpbmcgQyB0eXBlcy4N
CisgKi8NCitzdHJ1Y3QgaHZtX3N0YXJ0X2luZm8gew0KKyAgICBVSU5UMzIgbWFnaWM7ICAgICAg
ICAgICAgIC8qIENvbnRhaW5zIHRoZSBtYWdpYyB2YWx1ZSAweDMzNmVjNTc4ICAgICAgICovDQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogKCJ4RW4zIiB3aXRoIHRoZSAweDgwIGJp
dCBvZiB0aGUgIkUiIHNldCkuKi8NCisgICAgVUlOVDMyIHZlcnNpb247ICAgICAgICAgICAvKiBW
ZXJzaW9uIG9mIHRoaXMgc3RydWN0dXJlLiAgICAgICAgICAgICAgICAqLw0KKyAgICBVSU5UMzIg
ZmxhZ3M7ICAgICAgICAgICAgIC8qIFNJRl94eHggZmxhZ3MuICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICovDQorICAgIFVJTlQzMiBucl9tb2R1bGVzOyAgICAgICAgLyogTnVtYmVyIG9mIG1v
ZHVsZXMgcGFzc2VkIHRvIHRoZSBrZXJuZWwuICAgKi8NCisgICAgVUlOVDY0IG1vZGxpc3RfcGFk
ZHI7ICAgICAvKiBQaHlzaWNhbCBhZGRyZXNzIG9mIGFuIGFycmF5IG9mICAgICAgICAgICAqLw0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGh2bV9tb2RsaXN0X2VudHJ5LiAgICAg
ICAgICAgICAgICAgICAgICAgICovDQorICAgIFVJTlQ2NCBjbWRsaW5lX3BhZGRyOyAgICAgLyog
UGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgY29tbWFuZCBsaW5lLiAgICAgKi8NCisgICAgVUlOVDY0
IHJzZHBfcGFkZHI7ICAgICAgICAvKiBQaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBSU0RQIEFDUEkg
ZGF0YSAgICAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHN0cnVjdHVyZS4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICovDQorICAgIC8qIEFsbCBmb2xsb3dpbmcg
ZmllbGRzIG9ubHkgcHJlc2VudCBpbiB2ZXJzaW9uIDEgYW5kIG5ld2VyICovDQorICAgIFVJTlQ2
NCBtZW1tYXBfcGFkZHI7ICAgICAgLyogUGh5c2ljYWwgYWRkcmVzcyBvZiBhbiBhcnJheSBvZiAg
ICAgICAgICAgKi8NCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBodm1fbWVtbWFw
X3RhYmxlX2VudHJ5LiAgICAgICAgICAgICAgICAgICAqLw0KKyAgICBVSU5UMzIgbWVtbWFwX2Vu
dHJpZXM7ICAgIC8qIE51bWJlciBvZiBlbnRyaWVzIGluIHRoZSBtZW1tYXAgdGFibGUuICAgICov
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogVmFsdWUgd2lsbCBiZSB6ZXJvIGlm
IHRoZXJlIGlzIG5vIG1lbW9yeSAgKi8NCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBtYXAgYmVpbmcgcHJvdmlkZWQuICAgICAgICAgICAgICAgICAgICAgICAqLw0KKyAgICBVSU5U
MzIgcmVzZXJ2ZWQ7ICAgICAgICAgIC8qIE11c3QgYmUgemVyby4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICovDQorfTsNCisNCitzdHJ1Y3QgaHZtX21vZGxpc3RfZW50cnkgew0KKyAgICBV
SU5UNjQgcGFkZHI7ICAgICAgICAgICAgIC8qIFBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIG1vZHVs
ZS4gICAgICAgICAgICovDQorICAgIFVJTlQ2NCBzaXplOyAgICAgICAgICAgICAgLyogU2l6ZSBv
ZiB0aGUgbW9kdWxlIGluIGJ5dGVzLiAgICAgICAgICAgICAgKi8NCisgICAgVUlOVDY0IGNtZGxp
bmVfcGFkZHI7ICAgICAvKiBQaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBjb21tYW5kIGxpbmUuICAg
ICAqLw0KKyAgICBVSU5UNjQgcmVzZXJ2ZWQ7DQorfTsNCisNCitzdHJ1Y3QgaHZtX21lbW1hcF90
YWJsZV9lbnRyeSB7DQorICAgIFVJTlQ2NCBhZGRyOyAgICAgICAgICAgICAgLyogQmFzZSBhZGRy
ZXNzIG9mIHRoZSBtZW1vcnkgcmVnaW9uICAgICAgICAgKi8NCisgICAgVUlOVDY0IHNpemU7ICAg
ICAgICAgICAgICAvKiBTaXplIG9mIHRoZSBtZW1vcnkgcmVnaW9uIGluIGJ5dGVzICAgICAgICAq
Lw0KKyAgICBVSU5UMzIgdHlwZTsgICAgICAgICAgICAgIC8qIE1hcHBpbmcgdHlwZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICovDQorICAgIFVJTlQzMiByZXNlcnZlZDsgICAgICAgICAg
LyogTXVzdCBiZSB6ZXJvIGZvciBWZXJzaW9uIDEuICAgICAgICAgICAgICAgKi8NCit9Ow0KKw0K
KyNlbmRpZiAvKiBfX1hFTl9QVUJMSUNfQVJDSF9YODZfSFZNX1NUQVJUX0lORk9fSF9fICovDQpk
aWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvWGVuLmMKaW5kZXggOWMyZmY2MzI0ZC4uYzUyOTM0OThjNCAxMDA2NDQKLS0tIGEv
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1hlbi5jCkBAIC0yNSw2ICsyNSw3IEBACiAjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9FODIw
Lmg+DQogI2luY2x1ZGUgPExpYnJhcnkvUmVzb3VyY2VQdWJsaWNhdGlvbkxpYi5oPg0KICNpbmNs
dWRlIDxMaWJyYXJ5L010cnJMaWIuaD4NCisjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9YZW4v
YXJjaC14ODYvaHZtL3N0YXJ0X2luZm8uaD4NCiANCiAjaW5jbHVkZSAiUGxhdGZvcm0uaCINCiAj
aW5jbHVkZSAiWGVuLmgiDQpAQCAtODYsNiArODcsNyBAQCBYZW5Db25uZWN0ICgKICAgVUlOVDMy
IFhlblZlcnNpb247DQogICBFRklfWEVOX09WTUZfSU5GTyAqSW5mbzsNCiAgIENIQVI4IFNpZ1tz
aXplb2YgKEluZm8tPlNpZ25hdHVyZSkgKyAxXTsNCisgIFVJTlQzMiAqUFZIUmVzZXRWZWN0b3JE
YXRhOw0KIA0KICAgQXNtQ3B1aWQgKFhlbkxlYWYgKyAyLCAmVHJhbnNmZXJQYWdlcywgJlRyYW5z
ZmVyUmVnLCBOVUxMLCBOVUxMKTsNCiAgIG1YZW5JbmZvLkh5cGVyUGFnZXMgPSBBbGxvY2F0ZVBh
Z2VzIChUcmFuc2ZlclBhZ2VzKTsNCkBAIC0xMjEsNiArMTIzLDI5IEBAIFhlbkNvbm5lY3QgKAog
ICAgIG1YZW5Idm1sb2FkZXJJbmZvID0gTlVMTDsNCiAgIH0NCiANCisgIG1YZW5JbmZvLlJzZHBQ
dmggPSBOVUxMOw0KKw0KKyAgLy8NCisgIC8vIExvY2F0ZSBhbmQgdXNlIGluZm9ybWF0aW9uIGZy
b20gdGhlIHN0YXJ0IG9mIGRheSBzdHJ1Y3R1cmUgaWYgd2UgaGF2ZQ0KKyAgLy8gYm9vdGVkIHZp
YSB0aGUgUFZIIGVudHJ5IHBvaW50Lg0KKyAgLy8NCisNCisgIFBWSFJlc2V0VmVjdG9yRGF0YSA9
IChWT0lEICopKFVJTlROKSBQY2RHZXQzMiAoUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVjdFB0cik7
DQorICAvLw0KKyAgLy8gVGhhdCBtYWdpYyB2YWx1ZSBpcyB3cml0dGVuIGluIFhlblJlc2V0VmVj
dG9yL0lhMzIvWGVuUFZITWFpbi5hc20NCisgIC8vDQorICBpZiAoUFZIUmVzZXRWZWN0b3JEYXRh
WzFdID09IFNJR05BVFVSRV8zMiAoJ1gnLCAnUCcsICdWJywgJ0gnKSkgew0KKyAgICBzdHJ1Y3Qg
aHZtX3N0YXJ0X2luZm8gKkhWTVN0YXJ0SW5mbzsNCisNCisgICAgSFZNU3RhcnRJbmZvID0gKFZP
SUQgKikoVUlOVE4pIFBWSFJlc2V0VmVjdG9yRGF0YVswXTsNCisgICAgaWYgKEhWTVN0YXJ0SW5m
by0+bWFnaWMgPT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSkgew0KKyAgICAgIEFTU0VSVCAo
SFZNU3RhcnRJbmZvLT5yc2RwX3BhZGRyICE9IDApOw0KKyAgICAgIGlmIChIVk1TdGFydEluZm8t
PnJzZHBfcGFkZHIgIT0gMCkgew0KKyAgICAgICAgbVhlbkluZm8uUnNkcFB2aCA9IChWT0lEICop
KFVJTlROKUhWTVN0YXJ0SW5mby0+cnNkcF9wYWRkcjsNCisgICAgICB9DQorICAgIH0NCisgIH0N
CisNCiAgIEJ1aWxkR3VpZERhdGFIb2IgKA0KICAgICAmZ0VmaVhlbkluZm9HdWlkLA0KICAgICAm
bVhlbkluZm8sDQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
