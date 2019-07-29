Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA80679020
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82P-0002xx-OQ; Mon, 29 Jul 2019 15:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82N-0002vN-Ry
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:11 +0000
X-Inumbo-ID: a9550d88-b219-11e9-9401-4fb1de5aba37
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9550d88-b219-11e9-9401-4fb1de5aba37;
 Mon, 29 Jul 2019 15:58:10 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dcMEupTCQYbHFYV1ktcq9ee82QuNaXCdHKSkfr4Yur0Er5YJLvSrryVgAEzEGmy+6AQii9PAcg
 MYrxiPw1eXsirmYH6ScJSgRdvkzIJ4sqOY5TFE5QLbs9u6ayL1+jVhmBlsMMK5qrxg3L8+CF6E
 CPIbyT/gJEhJRGQjxEb3gIR+WgMCOqb0gPFsfKfssjkrrNKLmJVQCG75Uzby0LcmZHW542T3Fh
 EybJ0u45e7hNsXbtoBcudkbU2wMGG3LGk4KZM1AC8zg6yLgD438dhbBG/z9WZVe2WjqUmlIuY8
 +Xk=
X-SBRS: 2.7
X-MesageID: 3607276
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3607276"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:28 +0100
Message-ID: <20190729153944.24239-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 19/35] OvmfPkg/XenPlatformPei: Setup
 HyperPages earlier
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

V2UgYXJlIGdvaW5nIHRvIG5lZWQgdG8gbWFrZSBhbiBoeXBlcmNhbGwgaW4gb3JkZXIgdG8gcmV0
cmVpdmUgdGhlIEU4MjAKdGFibGUgZnJvbSB0aGUgaHlwZXJ2aXNvciBiZWZvcmUgYmVlbiBhYmxl
IHRvIHNldHVwIHRoZSBtZW1vcnkuCgpDYWxsaW5nIFhlbkNvbm5lY3QgZWFybGllciB3aWxsIGFs
bG93IHRvIHNldHVwIHRoZSBYZW5IeXBlcmNhbGxMaWIKZWFybGllciB0byBhbGxvdyB0byBtYWtl
IGh5cGVyY2FsbHMuCgpXaGlsZSBoZXJlLCBhZGQgc29tZSBjb21tZW50cyBpbiBYZW5Db25uZWN0
KCkuCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQogT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oIHwgIDUgKysrKysKIE92bWZQa2cvWGVuUGxh
dGZvcm1QZWkvUGxhdGZvcm0uYyB8ICAyICsrCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5j
ICAgICAgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1BsYXRmb3JtLmggYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgK
aW5kZXggOTI1ZGYzMWY4OC4uNGE4MDA1N2JkYyAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0
Zm9ybVBlaS9QbGF0Zm9ybS5oCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0u
aApAQCAtNzksNiArNzksMTEgQEAgSW5zdGFsbENsZWFyQ2FjaGVDYWxsYmFjayAoCiAgIFZPSUQN
CiAgICk7DQogDQorRUZJX1NUQVRVUw0KK1hlbkNvbm5lY3QgKA0KKyAgVk9JRA0KKyAgKTsNCisN
CiBFRklfU1RBVFVTDQogSW5pdGlhbGl6ZVhlbiAoDQogICBWT0lEDQpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9Q
bGF0Zm9ybS5jCmluZGV4IDU4MDllYWRiMGIuLjZhYWFmYzNlZTkgMTAwNjQ0Ci0tLSBhL092bWZQ
a2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1BsYXRmb3JtLmMKQEAgLTQxNiw2ICs0MTYsOCBAQCBJbml0aWFsaXplWGVuUGxhdGZvcm0gKAog
ICAgIENwdURlYWRMb29wICgpOw0KICAgfQ0KIA0KKyAgWGVuQ29ubmVjdCAoKTsNCisNCiAgIEJv
b3RNb2RlSW5pdGlhbGl6YXRpb24gKCk7DQogICBBZGRyZXNzV2lkdGhJbml0aWFsaXphdGlvbiAo
KTsNCiANCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCAyMTA1MzA0YzQxLi4yOWI0MmI3NDZjIDEwMDY0
NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvWGVuLmMKQEAgLTcyLDE0ICs3MiwxMSBAQCBYZW5HZXRFODIwTWFwICgKIC8qKg0K
ICAgQ29ubmVjdHMgdG8gdGhlIEh5cGVydmlzb3IuDQogDQotICBAcGFyYW0gIFhlbkxlYWYgICAg
IENQVUlEIGluZGV4IHVzZWQgdG8gY29ubmVjdC4NCi0NCiAgIEByZXR1cm4gRUZJX1NUQVRVUw0K
IA0KICoqLw0KIEVGSV9TVEFUVVMNCiBYZW5Db25uZWN0ICgNCi0gIFVJTlQzMiBYZW5MZWFmDQog
ICApDQogew0KICAgVUlOVDMyIEluZGV4Ow0KQEAgLTkxLDcgKzg4LDEzIEBAIFhlbkNvbm5lY3Qg
KAogICBVSU5UMzIgKlBWSFJlc2V0VmVjdG9yRGF0YTsNCiAgIFJFVFVSTl9TVEFUVVMgU3RhdHVz
Ow0KIA0KLSAgQXNtQ3B1aWQgKFhlbkxlYWYgKyAyLCAmVHJhbnNmZXJQYWdlcywgJlRyYW5zZmVy
UmVnLCBOVUxMLCBOVUxMKTsNCisgIEFTU0VSVCAobVhlbkxlYWYgIT0gMCk7DQorDQorICAvLw0K
KyAgLy8gUHJlcGFyZSBIeXBlclBhZ2VzIHRvIGJlIGFibGUgdG8gbWFrZSBoeXBlcmNhbGxzDQor
ICAvLw0KKw0KKyAgQXNtQ3B1aWQgKG1YZW5MZWFmICsgMiwgJlRyYW5zZmVyUGFnZXMsICZUcmFu
c2ZlclJlZywgTlVMTCwgTlVMTCk7DQogICBtWGVuSW5mby5IeXBlclBhZ2VzID0gQWxsb2NhdGVQ
YWdlcyAoVHJhbnNmZXJQYWdlcyk7DQogICBpZiAoIW1YZW5JbmZvLkh5cGVyUGFnZXMpIHsNCiAg
ICAgcmV0dXJuIEVGSV9PVVRfT0ZfUkVTT1VSQ0VTOw0KQEAgLTEwMyw3ICsxMDYsMTEgQEAgWGVu
Q29ubmVjdCAoCiAgICAgICAgICAgICAgICAgICAgKEluZGV4IDw8IEVGSV9QQUdFX1NISUZUKSAr
IEluZGV4KTsNCiAgIH0NCiANCi0gIEFzbUNwdWlkIChYZW5MZWFmICsgMSwgJlhlblZlcnNpb24s
IE5VTEwsIE5VTEwsIE5VTEwpOw0KKyAgLy8NCisgIC8vIEZpbmQgb3V0IHRoZSBYZW4gdmVyc2lv
bg0KKyAgLy8NCisNCisgIEFzbUNwdWlkIChtWGVuTGVhZiArIDEsICZYZW5WZXJzaW9uLCBOVUxM
LCBOVUxMLCBOVUxMKTsNCiAgIERFQlVHICgoREVCVUdfRVJST1IsICJEZXRlY3RlZCBYZW4gdmVy
c2lvbiAlZC4lZFxuIiwNCiAgICAgICAgICAgWGVuVmVyc2lvbiA+PiAxNiwgWGVuVmVyc2lvbiAm
IDB4RkZGRikpOw0KICAgbVhlbkluZm8uVmVyc2lvbk1ham9yID0gKFVJTlQxNikoWGVuVmVyc2lv
biA+PiAxNik7DQpAQCAtMjYyLDEyICsyNjksNiBAQCBJbml0aWFsaXplWGVuICgKIHsNCiAgIFJF
VFVSTl9TVEFUVVMgUGNkU3RhdHVzOw0KIA0KLSAgaWYgKG1YZW5MZWFmID09IDApIHsNCi0gICAg
cmV0dXJuIEVGSV9OT1RfRk9VTkQ7DQotICB9DQotDQotICBYZW5Db25uZWN0IChtWGVuTGVhZik7
DQotDQogICAvLw0KICAgLy8gUmVzZXJ2ZSBhd2F5IEhWTUxPQURFUiByZXNlcnZlZCBtZW1vcnkg
WzB4RkMwMDAwMDAsMHhGRDAwMDAwMCkuDQogICAvLyBUaGlzIG5lZWRzIHRvIG1hdGNoIEhWTUxP
QURFUiBSRVNFUlZFRF9NRU1CQVNFL1JFU0VSVkVEX01FTVNJWkUuDQotLSAKQW50aG9ueSBQRVJB
UkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
