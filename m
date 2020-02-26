Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49316FDED
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:37:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ux5-00014y-UP; Wed, 26 Feb 2020 11:34:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6ux4-00014k-VC
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:06 +0000
X-Inumbo-ID: e1290dc2-588b-11ea-93fd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1290dc2-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TrEmM9S+ZA/KCTjEvmHrc1p0DZcJsOGD1PRU1zC8OWg=;
 b=eCkNA8nI7wnYJ0eWaZ1EbX1Sq0KjO64NildluY7+iPYoPYvNorS+7O45
 RI+0b7/nFeFnPOsW7y8XmAXGz0WbGJQI8JNNj3lgeYSpvxCdfIUKPfI/g
 +s/XMRhuBOBUKCBRbtcXsrL6cXjRWu/lisHddBr0lS/KM2nLhCU8iG2tA w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zXbEm6XMazR6Wi9VUSAR+O8oXeVXboFVhBpmQ1rBjmWytPaPet1QYvvJ7K0JftKgZtARAGV2gS
 t2FvBR4BOh4fMYElwnS2SAGHvxwQ9XFaIYqvfAmeYQrmDzJZMzlMVJ4TypW4AZT/fsWQcRN8/A
 IBgzmU4XTw+Nw2LSDVhoSUHL0Gir5imGdgOojVMMUnUMLASYJaSkgVzvZLyfVmAvcEqL7HHnB8
 jj6Bg4+7km5kJGOkDgzt3aWqQhMHDb7r3mjb89EIesycwHU44foWTm3h4y8drrdT2+2GKFu5R0
 GAI=
X-SBRS: 2.7
X-MesageID: 13211001
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13211001"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:32 +0000
Message-ID: <20200226113355.2532224-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 00/23] xen: Build system improvements
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cmh0dHBzOi8veGVuYml0
cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQgYnIuYnVp
bGQtc3lzdGVtLXhlbi12MwoKdjM6Ci0gbmV3IHBhdGNoZXMgdGhhdCBkbyBzb21lIGNsZWFudXAg
b3IgZml4IGlzc3VlcwotIGhhdmUgcmV3b3JrIG1vc3QgcGF0Y2hlcywgdG8gaGF2ZSBiZXR0ZXIg
Y29tbWl0IG1lc3NhZ2Ugb3IgY2hhbmdlIHRoZSBjb2RpbmcKICBzdHlsZSwgb3IgZml4IGlzc3Vl
cyB0aGF0IEkndmUgc2Vlbi4gVGhlcmUgd2VyZSBzb21lIGNhc2VzIHdoZXJlIENGTEFHUyB3ZXJl
CiAgbWlzc2luZy4KICBTZWUgcGF0Y2ggbm90ZXMgZm9yIGRldGFpbHMKLSBpbnRyb2R1Y2UgaWZf
Y2hhbmdlZCouIFRoYXQgcGxlbnR5IG9mIG5ldyBwYXRjaGVzIG9uIHRvcCBvZiB3aGF0IHdlIGhh
ZCBpbiB2Mi4KICAodGhvc2UgY2hhbmdlcyBpZ25vcmUgQ09ORklHX0xUTz15LCBJJ2xsIHNlZSBh
Ym91dCBmaXhpbmcgdGhhdCBsYXRlcikKCihUaGVyZSBpcyBtb3JlIHRvIGNvbWUgaW4gb3JkZXIg
dG8gdXNlIGZpeGRlcCBmcm9tIExpbnV4LCBidXQgdGhhdCdzIG5vdCByZWFkeSkKCnYyLjE6Ci0g
c29tZSBmaXhlcwoKdjI6ClJhdGhlciB0aGFuIHRha2luZyBLYnVpbGQgYW5kIG1ha2luZyBpdCB3
b3JrIHdpdGggWGVuLCB0aGUgdjIgdGFrZXMgdGhlIG9wcG9zaXRlCmFwcHJvYWNoIG9mIHNsb3ds
eSB0cmFuc2Zvcm1pbmcgb3VyIGN1cnJlbnQgYnVpbGQgc3lzdGVtIGludG8gS2J1aWxkLiBUaGF0
IGhhdmUKdGhlIGFkdmFudGFnZSBvZiBrZWVwaW5nIGFsbCB0aGUgZmVhdHVyZSB3ZSBoYXZlIGFu
ZCBtYWtpbmcgdGhlIHBhdGNoZXMgbXVjaAplYXNpZXIgdG8gcmV2aWV3LiBLY29uZmlnIHVwZGF0
ZSBpcyBkb25lIGluIGFuIG90aGVyIHBhdGNoIHNlcmllcy4KCkhpLAoKSSBoYXZlIHdvcmsgdG93
YXJkIGJ1aWxkaW5nIFhlbiAodGhlIGh5cGVydmlzb3IpIHdpdGggTGludXgncyBidWlsZCBzeXN0
ZW0sCktidWlsZC4KClRoZSBtYWluIHJlYXNvbiBmb3IgdGhhdCBpcyB0byBiZSBhYmxlIHRvIGhh
dmUgb3V0LW9mLXRyZWUgYnVpbGQuIEl0J3MgYW5ub3lpbmcKd2hlbiBhIGJ1aWxkIGZhaWwgYmVj
YXVzZSBvZiB0aGUgcHZzaGltLiBPdGhlciBiZW5lZml0IGlzIGEgbXVjaCBmYXN0ZXIKcmVidWls
ZCwgYW5kIGBtYWtlIGNsZWFuYCBkb2Vzbid0IHRha2UgYWdlcywgYW5kIGJldHRlciBkZXBlbmRl
bmNpZXMgdG8gZmlndXJlCm91dCB3aGF0IG5lZWRzIHRvIGJlIHJlYnVpbGQuCgpTbywgd2UgYXJl
IG5vdCB0aGVyZSB5ZXQsIGJ1dCB0aGUgc2VyaWVzIGFscmVhZHkgY29udGFpbiBxdWl0ZSBhIGZl
dwppbXByb3ZlbWVudCBhbmQgY2xlYW51cC4gTW9yZSBwYXRjaGVzIGFyZSBnb2luZyB0byBiZSBh
ZGRlZCB0byB0aGUgc2VyaWVzLgoKQ2hlZXJzLAoKQW50aG9ueSBQRVJBUkQgKDIzKToKICB4ZW4v
aW5jbHVkZTogcmVtb3ZlIGluY2x1ZGUgb2YgQ29uZmlnLm1rCiAgTWFrZWZpbGU6IEZpeCBpbnN0
YWxsLXRlc3RzCiAgeGVuL2J1aWxkOiBSZW1vdmUgY29uZnVzaW5nIGNvbW1lbnQgb24gdGhlICUu
czolLlMgcnVsZQogIHhlbi9idWlsZDogcmVtb3ZlIHVzZSBvZiBBRkxBR1MteQogIHhlbi9idWls
ZDogQWxsb3cgdG8gdGVzdCBjbGFuZyAuaW5jbHVkZSB3aXRob3V0IGFzbSBzeW1saW5rCiAgeGVu
L2J1aWxkOiBGaXggc2VjdGlvbi1yZW5hbWluZyBvZiBsaWJmZHQgYW5kIGxpYmVsZgogIHhlbi9i
dWlsZDogVXNlIG9iai15ICs9IHN1YmRpci8gaW5zdGVhZCBvZiBzdWJkaXIteQogIHhlbi9idWls
ZDogdXNlICQoY2xlYW4pIHNob3J0aGFuZCBmb3IgY2xlYW4gdGFyZ2V0cwogIHhlbi9idWlsZDog
ZXh0cmFjdCBjbGVhbiB0YXJnZXQgZnJvbSBSdWxlcy5tawogIHhlbi9idWlsZDogcnVuIHRhcmdl
dHMgY3NvcGVzLHRhZ3MsLi4gd2l0aG91dCBSdWxlcy5tawogIHhlbi9idWlsZDogbWFrZSB0ZXN0
cyBpbiB0ZXN0LyBkaXJlY3RseQogIHhlbi9idWlsZDogTW92ZSBhcy1vcHRpb24tYWRkIHRvIHhl
bi8KICB4ZW4vYnVpbGQ6IGluY2x1ZGUgaW5jbHVkZS9jb25maWcvYXV0by5jb25mIGluIG1haW4g
TWFrZWZpbGUKICB4ZW4vYnVpbGQ6IHVzZSBuZXcgJChjX2ZsYWdzKSBhbmQgJChhX2ZsYWdzKSBp
bnN0ZWFkIG9mICQoQ0ZMQUdTKQogIHhlbi9idWlsZDogaGF2ZSB0aGUgcm9vdCBNYWtlZmlsZSBn
ZW5lcmF0ZXMgdGhlIENGTEFHUwogIHhlbi9idWlsZDogaW50cm9kdWNlIGlmX2NoYW5nZWQgYW5k
IGlmX2NoYW5nZWRfcnVsZQogIHhlbi9idWlsZDogU3RhcnQgdXNpbmcgaWZfY2hhbmdlZAogIHhl
bi9idWlsZDogdXNlIGlmX2NoYW5nZWQgb24gYnVpbHRfaW4ubwogIHhlbi9idWlsZDogVXNlIGlm
X2NoYW5nZWRfcnVsZXMgd2l0aCAlLm86JS5jIHRhcmdldHMKICB4ZW4vYnVpbGQ6IGZhY3Rvcmlz
ZSBnZW5lcmF0aW9uIG9mIHRoZSBsaW5rZXIgc2NyaXB0cwogIHhlbi9idWlsZDogVXNlIGlmX2No
YW5nZWQgZm9yIHByZWxpbmsqLm8KICB4ZW4sc3ltYm9sczogcmV3b3JrIGZpbGUgc3ltYm9scyBz
ZWxlY3Rpb24KICB4ZW4vYnVpbGQ6IHVzZSBpZl9jaGFuZ2VkIHRvIGJ1aWxkIGd1ZXN0XyUubwoK
IC5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBDb25maWcubWsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTcgLS0KIE1ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMjU3ICsrKysrKysrKysrKysrKysrKysrLS0tLS0KIHhlbi9SdWxlcy5tayAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDI2OSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhl
bi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAzMyArKy0tCiB4ZW4vYXJjaC9h
cm0vUnVsZXMubWsgICAgICAgICAgICAgICAgfCAgOTMgLS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0v
YXJjaC5tayAgICAgICAgICAgICAgICAgfCAgODggKysrKysrKysrCiB4ZW4vYXJjaC9hcm0vYXJt
MzIvTWFrZWZpbGUgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL2FybS9hcm02NC9NYWtlZmls
ZSAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gvYXJtL2VmaS9NYWtlZmlsZSAgICAgICAgICAg
IHwgICAyICstCiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgNTUgKysr
LS0tCiB4ZW4vYXJjaC94ODYvUnVsZXMubWsgICAgICAgICAgICAgICAgfCAgOTEgKy0tLS0tLS0t
CiB4ZW4vYXJjaC94ODYvYWNwaS9NYWtlZmlsZSAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNo
L3g4Ni9hcmNoLm1rICAgICAgICAgICAgICAgICB8ICA4NCArKysrKysrKysKIHhlbi9hcmNoL3g4
Ni9jcHUvTWFrZWZpbGUgICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L2VmaS9NYWtl
ZmlsZSAgICAgICAgICAgIHwgICA5ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUgICAg
ICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL3g4Ni9odm0vTWFrZWZpbGUgICAgICAgICAgICB8ICAg
NiArLQogeGVuL2FyY2gveDg2L21tL01ha2VmaWxlICAgICAgICAgICAgIHwgIDE5ICstCiB4ZW4v
YXJjaC94ODYvbW0vaGFwL01ha2VmaWxlICAgICAgICAgfCAgMTUgKy0KIHhlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvTWFrZWZpbGUgICAgICB8ICAxNSArLQogeGVuL2FyY2gveDg2L3g4Nl82NC9NYWtl
ZmlsZSAgICAgICAgIHwgICAyICstCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgfCAgMTAgKy0KIHhlbi9jb21tb24vbGliZWxmL01ha2VmaWxlICAgICAgICAgICB8ICAxNCAr
LQogeGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgICAgICAgICAgIHwgIDExICstCiB4ZW4vZHJp
dmVycy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgMTQgKy0KIHhlbi9kcml2ZXJzL2FjcGkv
TWFrZWZpbGUgICAgICAgICAgICB8ICAgNiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvTWFr
ZWZpbGUgICAgIHwgICA4ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvTWFrZWZpbGUg
fCAgIDIgKy0KIHhlbi9pbmNsdWRlL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgNCArLQog
eGVuL2xpYi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vc2NyaXB0
cy9LYnVpbGQuaW5jbHVkZSAgICAgICAgICAgfCAxMzQgKysrKysrKysrKysrKwogeGVuL3Njcmlw
dHMvTWFrZWZpbGUuY2xlYW4gICAgICAgICAgIHwgIDMwICsrKwogeGVuL3Rvb2xzL3N5bWJvbHMu
YyAgICAgICAgICAgICAgICAgIHwgIDIyICsrLQogeGVuL3hzbS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiB4ZW4veHNtL2ZsYXNrL01ha2VmaWxlICAgICAgICAgICAgICAg
fCAgMjEgKystCiB4ZW4veHNtL2ZsYXNrL3NzL01ha2VmaWxlICAgICAgICAgICAgfCAgIDIgKy0K
IDM4IGZpbGVzIGNoYW5nZWQsIDg3MCBpbnNlcnRpb25zKCspLCA0ODggZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2FyY2gubWsKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB4ZW4vYXJjaC94ODYvYXJjaC5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9zY3JpcHRzL01h
a2VmaWxlLmNsZWFuCgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
