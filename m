Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFA979008
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82P-0002xM-Bf; Mon, 29 Jul 2019 15:58:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82N-0002v5-Pz
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:11 +0000
X-Inumbo-ID: a9d36b29-b219-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a9d36b29-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:10 +0000 (UTC)
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
IronPort-SDR: 3ARBLeNSo2mL2OkpWWqoUly+FoDdSJQxfcbCUH3/VJMvmqVRiEFTQlIBThANPKP6xjXSoCfy4C
 Z1hbFg8d/KibdeJBe86SEWlpetBDQaeD+YWoDLNUJrdaGuiibHu54Lpxg/W3LDjDwmzZ+bYSIb
 Hi8qP5977299if4r1vgl+4Ds09ZC1OZV6i4p4k9VOL9NBnjp0Nwie/6StcgTIZJfzBiaxlINlX
 D0ZlbdZv+uLIhvEgBGYi6mbb3Ez9QMb0aBi0Mwll0DSlT1+h+d/+RZ2GPwIc6liNdhflFROJH5
 POM=
X-SBRS: 2.7
X-MesageID: 3579638
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3579638"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:19 +0100
Message-ID: <20190729153944.24239-11-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 10/35] OvmfPkg/XenPlatformPei: Detect
 OVMF_INFO from hvmloader
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

RUZJX1hFTl9PVk1GX0lORk8gaXMgb25seSB1c2VmdWwgdG8gcmV0cmlldmUgdGhlIEU4MjAgdGFi
bGUuIFRoZQptWGVuSHZtbG9hZGVySW5mbyBpc24ndCB1c2VkIHlldCwgYnV0IHdpbGwgYmUgdXNl
IGluIGEgZnVydGhlciBwYXRjaCB0bwpyZXRyaWV2ZSB0aGUgRTgyMCB0YWJsZS4KCkFsc28gcmVt
b3ZlIHRoZSB1bnVzZWQgcG9pbnRlciBmcm9tIHRoZSBYZW5JbmZvIEhPQiBhcyB0aGF0IGluZm9y
bWF0aW9uCmlzIG9ubHkgdXNlZnVsIGluIHRoZSBYZW5QbGF0Zm9ybVBlaS4KClJlZjogaHR0cHM6
Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjg5ClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTog
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KLS0tCgpOb3RlczoKICAgIHYzOgogICAg
LSBmaXggY29kaW5nIHN0eWxlCiAgICAtIGZpeCBjb21taXQgbWVzc2FnZQoKIE92bWZQa2cvSW5j
bHVkZS9HdWlkL1hlbkluZm8uaCB8ICA0IC0tLS0KIE92bWZQa2cvUGxhdGZvcm1QZWkvWGVuLmMg
ICAgICB8ICAzIC0tLQogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyAgIHwgMjUgKysrKysr
KysrKysrKysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvSW5jbHVkZS9HdWlkL1hlbkluZm8u
aCBiL092bWZQa2cvSW5jbHVkZS9HdWlkL1hlbkluZm8uaAppbmRleCAyNWQ3NmE3ODI4Li5iMDUy
ZDYxOGZkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZvLmgKKysrIGIv
T3ZtZlBrZy9JbmNsdWRlL0d1aWQvWGVuSW5mby5oCkBAIC0xOCwxMCArMTgsNiBAQCB0eXBlZGVm
IHN0cnVjdCB7CiAgIC8vLw0KICAgVk9JRCAqSHlwZXJQYWdlczsNCiAgIC8vLw0KLSAgLy8vIExv
Y2F0aW9uIG9mIHRoZSBodm1faW5mbyBwYWdlLg0KLSAgLy8vDQotICBWT0lEICpIdm1JbmZvOw0K
LSAgLy8vDQogICAvLy8gSHlwZXJ2aXNvciBtYWpvciB2ZXJzaW9uLg0KICAgLy8vDQogICBVSU5U
MTYgVmVyc2lvbk1ham9yOw0KZGlmZiAtLWdpdCBhL092bWZQa2cvUGxhdGZvcm1QZWkvWGVuLmMg
Yi9Pdm1mUGtnL1BsYXRmb3JtUGVpL1hlbi5jCmluZGV4IDg5ZGM0MTQzYjIuLjNlMTViMzJhNzMg
MTAwNjQ0Ci0tLSBhL092bWZQa2cvUGxhdGZvcm1QZWkvWGVuLmMKKysrIGIvT3ZtZlBrZy9QbGF0
Zm9ybVBlaS9YZW4uYwpAQCAtOTgsOSArOTgsNiBAQCBYZW5Db25uZWN0ICgKICAgbVhlbkluZm8u
VmVyc2lvbk1ham9yID0gKFVJTlQxNikoWGVuVmVyc2lvbiA+PiAxNik7DQogICBtWGVuSW5mby5W
ZXJzaW9uTWlub3IgPSAoVUlOVDE2KShYZW5WZXJzaW9uICYgMHhGRkZGKTsNCiANCi0gIC8qIFRC
RDogTG9jYXRlIGh2bV9pbmZvIGFuZCByZXNlcnZlIGl0IGF3YXkuICovDQotICBtWGVuSW5mby5I
dm1JbmZvID0gTlVMTDsNCi0NCiAgIEJ1aWxkR3VpZERhdGFIb2IgKA0KICAgICAmZ0VmaVhlbklu
Zm9HdWlkLA0KICAgICAmbVhlbkluZm8sDQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggZjRkMGQxYzcz
Yi4uOTk2MmZlOWZjNyAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwor
KysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCkBAIC0zMyw2ICszMywxMiBAQCBTVEFU
SUMgVUlOVDMyIG1YZW5MZWFmID0gMDsKIA0KIEVGSV9YRU5fSU5GTyBtWGVuSW5mbzsNCiANCisv
Lw0KKy8vIExvY2F0aW9uIG9mIHRoZSBmaXJtd2FyZSBpbmZvIHN0cnVjdCBzZXR1cCBieSBodm1s
b2FkZXIuDQorLy8gT25seSB0aGUgRTgyMCB0YWJsZSBpcyB1c2VkIGJ5IE9WTUYuDQorLy8NCitF
RklfWEVOX09WTUZfSU5GTyAqbVhlbkh2bWxvYWRlckluZm87DQorDQogLyoqDQogICBSZXR1cm5z
IEU4MjAgbWFwIHByb3ZpZGVkIGJ5IFhlbg0KIA0KQEAgLTc4LDYgKzg0LDggQEAgWGVuQ29ubmVj
dCAoCiAgIFVJTlQzMiBUcmFuc2ZlclJlZzsNCiAgIFVJTlQzMiBUcmFuc2ZlclBhZ2VzOw0KICAg
VUlOVDMyIFhlblZlcnNpb247DQorICBFRklfWEVOX09WTUZfSU5GTyAqSW5mbzsNCisgIENIQVI4
IFNpZ1tzaXplb2YgKEluZm8tPlNpZ25hdHVyZSkgKyAxXTsNCiANCiAgIEFzbUNwdWlkIChYZW5M
ZWFmICsgMiwgJlRyYW5zZmVyUGFnZXMsICZUcmFuc2ZlclJlZywgTlVMTCwgTlVMTCk7DQogICBt
WGVuSW5mby5IeXBlclBhZ2VzID0gQWxsb2NhdGVQYWdlcyAoVHJhbnNmZXJQYWdlcyk7DQpAQCAt
OTcsOCArMTA1LDIxIEBAIFhlbkNvbm5lY3QgKAogICBtWGVuSW5mby5WZXJzaW9uTWFqb3IgPSAo
VUlOVDE2KShYZW5WZXJzaW9uID4+IDE2KTsNCiAgIG1YZW5JbmZvLlZlcnNpb25NaW5vciA9IChV
SU5UMTYpKFhlblZlcnNpb24gJiAweEZGRkYpOw0KIA0KLSAgLyogVEJEOiBMb2NhdGUgaHZtX2lu
Zm8gYW5kIHJlc2VydmUgaXQgYXdheS4gKi8NCi0gIG1YZW5JbmZvLkh2bUluZm8gPSBOVUxMOw0K
KyAgLy8NCisgIC8vIENoZWNrIGlmIHRoZXJlIGFyZSBpbmZvcm1hdGlvbiBsZWZ0IGJ5IGh2bWxv
YWRlcg0KKyAgLy8NCisNCisgIEluZm8gPSAoRUZJX1hFTl9PVk1GX0lORk8gKikoVUlOVE4pIE9W
TUZfSU5GT19QSFlTSUNBTF9BRERSRVNTOw0KKyAgLy8NCisgIC8vIENvcHkgdGhlIHNpZ25hdHVy
ZSwgYW5kIG1ha2UgaXQgbnVsbC10ZXJtaW5hdGVkLg0KKyAgLy8NCisgIEFzY2lpU3RybkNweVMg
KFNpZywgc2l6ZW9mIChTaWcpLCAoQ0hBUjggKikgJkluZm8tPlNpZ25hdHVyZSwNCisgICAgc2l6
ZW9mIChJbmZvLT5TaWduYXR1cmUpKTsNCisgIGlmIChBc2NpaVN0ckNtcCAoU2lnLCAiWGVuSFZN
T1ZNRiIpID09IDApIHsNCisgICAgbVhlbkh2bWxvYWRlckluZm8gPSBJbmZvOw0KKyAgfSBlbHNl
IHsNCisgICAgbVhlbkh2bWxvYWRlckluZm8gPSBOVUxMOw0KKyAgfQ0KIA0KICAgQnVpbGRHdWlk
RGF0YUhvYiAoDQogICAgICZnRWZpWGVuSW5mb0d1aWQsDQotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
