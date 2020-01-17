Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E70C140882
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:58:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGW-0004ra-5V; Fri, 17 Jan 2020 10:54:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGU-0004rV-LS
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:10 +0000
X-Inumbo-ID: ab61b1e6-3917-11ea-b833-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab61b1e6-3917-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ki2V65V0svazw26nGqu3qSzzpqihu67qyh2l2jYb0pA=;
 b=ZQ0Tb0tq+WK4vc/DEk0OC2lJykVTV/zQOS9PESiHcKkgN/hAf2RINeZN
 N8mgV5pRBokqnqwQv+yUu/9OUPOBPd5Wzz9RT8VvzbR3pAcUEwm1I4lhY
 0vxBoxIN6FXV6u4irn+qv4DzDC5H5vYYbw7IQHZ/86QfMe+faBudsOQkB k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rut13j3ksQJSgSpvikTlru35KBZgK515RCtsZe9dmDz4/5Q22yZlcEsF8zOv1cPoz1IEB330Ke
 sYg3Qut996VMIG6aRJt5UFfgXshxd4AAOZljRwK2RA4EpsLMqeA8gBzWDG+TtoHBLVkI7TmFyV
 VTSWu0bXrlgAf/vdN0IG8Eqk0aQ8AErY+Hw88zeVV4yqDwR6ZiiXkNfdCrug6SMyFyqVhRmz3D
 4L5S3r/irnYh+e3hvqvtOFsT+DbhVrjXI92fQgQnwnZCyOF1oEpWIh5nSbeNAdCl6jV4fp/WWD
 H40=
X-SBRS: 2.7
X-MesageID: 11498513
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11498513"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:46 +0000
Message-ID: <20200117105358.607910-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 00/12] xen: Build system improvements
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuYnVp
bGQtc3lzdGVtLXhlbi12MgoKc2VyaWVzIGlzIGJhc2VkIG9uICJbWEVOIFBBVENIIHYzIDAvNl0g
eGVuOiBLY29uZmlnIHVwZGF0ZSB3aXRoIGZldyBleHRyYSIKCnYyOgpSYXRoZXIgdGhhbiB0YWtp
bmcgS2J1aWxkIGFuZCBtYWtpbmcgaXQgd29yayB3aXRoIFhlbiwgdGhlIHYyIHRha2VzIHRoZSBv
cHBvc2l0ZQphcHByb2FjaCBvZiBzbG93bHkgdHJhbnNmb3JtaW5nIG91ciBjdXJyZW50IGJ1aWxk
IHN5c3RlbSBpbnRvIEtidWlsZC4gVGhhdCBoYXZlCnRoZSBhZHZhbnRhZ2Ugb2Yga2VlcGluZyBh
bGwgdGhlIGZlYXR1cmUgd2UgaGF2ZSBhbmQgbWFraW5nIHRoZSBwYXRjaGVzIG11Y2gKZWFzaWVy
IHRvIHJldmlldy4gS2NvbmZpZyB1cGRhdGUgaXMgZG9uZSBpbiBhbiBvdGhlciBwYXRjaCBzZXJp
ZXMuCgp2MToKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE5LTEwL21zZzAxNjA5Lmh0bWwKCkhpLAoKSSBoYXZlIHdvcmsgdG93YXJkIGJ1aWxk
aW5nIFhlbiAodGhlIGh5cGVydmlzb3IpIHdpdGggTGludXgncyBidWlsZCBzeXN0ZW0sCktidWls
ZC4KClRoZSBtYWluIHJlYXNvbiBmb3IgdGhhdCBpcyB0byBiZSBhYmxlIHRvIGhhdmUgb3V0LW9m
LXRyZWUgYnVpbGQuIEl0J3MgYW5ub3lpbmcKd2hlbiBhIGJ1aWxkIGZhaWwgYmVjYXVzZSBvZiB0
aGUgcHZzaGltLiBPdGhlciBiZW5lZml0IGlzIGEgbXVjaCBmYXN0ZXIKcmVidWlsZCwgYW5kIGBt
YWtlIGNsZWFuYCBkb2Vzbid0IHRha2UgYWdlcywgYW5kIGJldHRlciBkZXBlbmRlbmNpZXMgdG8g
ZmlndXJlCm91dCB3aGF0IG5lZWRzIHRvIGJlIHJlYnVpbGQuCgpTbywgd2UgYXJlIG5vdCB0aGVy
ZSB5ZXQsIGJ1dCB0aGUgc2VyaWVzIGFscmVhZHkgY29udGFpbiBxdWl0ZSBhIGZldwppbXByb3Zl
bWVudCBhbmQgY2xlYW51cC4gTW9yZSBwYXRjaGVzIGFyZSBnb2luZyB0byBiZSBhZGRlZCB0byB0
aGUgc2VyaWVzLgoKWFhYIEtub3duIGlzc3VlCi0gbWFrZSBkaXN0LXRlc3RzIGlzIGJyb2tlbi4g
SSdsbCBmaXggdGhhdCBsYXR0ZXIuCi0gZWZpIGJ1aWxkIG1heWJlIGJyb2tlbiAoeGVuIGRvZXNu
J3QgYm9vdCBvbiBhbGJhbmEgd2hpY2ggbG9va3MgbGlrZSB0byBiZSBvbmUKICBvZiB0aGUgdWVm
aSBob3N0KQoKQ2hlZXJzLAoKQW50aG9ueSBQRVJBUkQgKDEyKToKICB4ZW4vYnVpbGQ6IFJlbW92
ZSBsZWZ0IG92ZXIgLURNQVhfUEhZU19JUlFTCiAgeGVuL2J1aWxkOiBVc2Ugb2JqLXkgKz0gc3Vi
ZGlyLyBpbnN0ZWFkIG9mIHN1YmRpci15CiAgeGVuL2J1aWxkOiB1c2UgJChjbGVhbikgc2hvcnRo
YW5kIGZvciBjbGVhbiB0YXJnZXRzCiAgeGVuL2J1aWxkOiBleHRyYWN0IGNsZWFuIHRhcmdldCBm
cm9tIFJ1bGVzLm1rCiAgeGVuL2luY2x1ZGU6IHJlbW92ZSBpbmNsdWRlIG9mIENvbmZpZy5tawog
IHhlbi90ZXN0L2xpdmVwYXRjaDogcmVtb3ZlIGluY2x1ZGUgb2YgQ29uZmlnLm1rCiAgeGVuL2J1
aWxkOiBydW4gdGFyZ2V0cyBjc29wZXMsdGFncywuLiB3aXRob3V0IFJ1bGVzLm1rCiAgeGVuL2J1
aWxkOiBtYWtlIHRlc3RzIGluIHRlc3QvIGRpcmVjdGx5CiAgeGVuL2J1aWxkOiBpbmNsdWRlIGlu
Y2x1ZGUvY29uZmlnL2F1dG8uY29uZiBpbiBtYWluIE1ha2VmaWxlCiAgeGVuL2J1aWxkOiB1c2Ug
bmV3ICQoY19mbGFncykgYW5kICQoYV9mbGFncykgaW5zdGVhZCBvZiAkKENGTEFHUykKICB4ZW4v
YnVpbGQ6IGludHJvZHVjZSBjY2ZsYWdzLXkgYW5kIENGTEFHU18kQAogIHhlbi9idWlsZDogaGF2
ZSB0aGUgcm9vdCBNYWtlZmlsZSBnZW5lcmF0ZXMgdGhlIENGTEFHUwoKIHhlbi9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIxMSArKysrKysrKysrKysrKysrKysrKystLS0tLS0K
IHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzNSArKysrKy0tLS0tLS0t
LS0tLQogeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgIDI4ICsrLS0KIHhl
bi9hcmNoL2FybS9SdWxlcy5tayAgICAgICAgICAgICAgICB8ICA5MyAtLS0tLS0tLS0tLS0KIHhl
bi9hcmNoL2FybS9hcmNoLm1rICAgICAgICAgICAgICAgICB8ICA4OCArKysrKysrKysrKwogeGVu
L2FyY2gvYXJtL2FybTMyL01ha2VmaWxlICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC9hcm0v
YXJtNjQvTWFrZWZpbGUgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9lZmkvTWFrZWZp
bGUgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAg
ICAgIHwgIDQ2ICsrKy0tLQogeGVuL2FyY2gveDg2L1J1bGVzLm1rICAgICAgICAgICAgICAgIHwg
IDkxICstLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2FjcGkvTWFrZWZpbGUgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vYXJjaC94ODYvYXJjaC5tayAgICAgICAgICAgICAgICAgfCAgODcgKysrKysr
KysrKysKIHhlbi9hcmNoL3g4Ni9jcHUvTWFrZWZpbGUgICAgICAgICAgICB8ICAgNCArLQogeGVu
L2FyY2gveDg2L2VmaS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYv
Z3Vlc3QvTWFrZWZpbGUgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9odm0vTWFrZWZp
bGUgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L21tL01ha2VmaWxlICAgICAgICAg
ICAgIHwgIDEwICstCiB4ZW4vYXJjaC94ODYvbW0vaGFwL01ha2VmaWxlICAgICAgICAgfCAgIDYg
Ky0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvTWFrZWZpbGUgICAgICB8ICAgNiArLQogeGVuL2Fy
Y2gveDg2L3g4Nl82NC9NYWtlZmlsZSAgICAgICAgIHwgICAyICstCiB4ZW4vY29tbW9uL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIHhlbi9jb21tb24vbGliZWxmL01ha2VmaWxl
ICAgICAgICAgICB8ICAgNCArLQogeGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgICAgICAgICAg
IHwgICA0ICstCiB4ZW4vZHJpdmVycy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgMTQgKy0K
IHhlbi9kcml2ZXJzL2FjcGkvTWFrZWZpbGUgICAgICAgICAgICB8ICAgNiArLQogeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUgICAgIHwgICA4ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvTWFrZWZpbGUgfCAgIDIgKy0KIHhlbi9pbmNsdWRlL01ha2VmaWxlICAgICAgICAg
ICAgICAgICB8ICAgNCArLQogeGVuL2xpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSAgICAgICAgICAgfCAgMTAgKysKIHhl
bi9zY3JpcHRzL01ha2VmaWxlLmNsZWFuICAgICAgICAgICB8ICAzMyArKysrKwogeGVuL3Rlc3Qv
bGl2ZXBhdGNoL01ha2VmaWxlICAgICAgICAgIHwgICAyIC0KIHhlbi94c20vTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL3hzbS9mbGFzay9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICA0ICstCiB4ZW4veHNtL2ZsYXNrL3NzL01ha2VmaWxlICAgICAgICAgICAgfCAg
IDIgKy0KIDM1IGZpbGVzIGNoYW5nZWQsIDUxOSBpbnNlcnRpb25zKCspLCA0MTMgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2FyY2gubWsKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vYXJjaC94ODYvYXJjaC5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9zY3Jp
cHRzL01ha2VmaWxlLmNsZWFuCgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
