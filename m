Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A1136B32
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 11:39:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iprfe-0003y7-Ve; Fri, 10 Jan 2020 10:37:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VEhH=27=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iprfd-0003y1-Co
 for xen-devel@lists.xen.org; Fri, 10 Jan 2020 10:37:37 +0000
X-Inumbo-ID: 32638d14-3395-11ea-ac27-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32638d14-3395-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578652648;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=QR1yi6CJli1sWvx0XJRETp0lksT04VhUlAGTKTMy684=;
 b=OzPvw5skVcyTDXuuL0KYkAjLmSUBtg0SUHm0X7p33R7lDHRZN5nKUsQh
 eVCR26YLsGENBLWICpePcawSdP4JoQOXDqOd0N7EFyQItT9YaKj8sNrgj
 P5v69RawTA/8oEuF6jJ9Qibm+rcjMHENJm2/2ETkVD2ecmpG8Yiib+dcW 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: R71nNg6DPzmLCjU+V2HhAZ7uapYbpJEJWTRDCwGG1WTUXVcQXde3RHGQHY4UQjS7h6wCrncoUH
 TcsZKij+NBF1glm4l/+Ffr/5WbebT0hAsRc0rt7Pcw4sXL1ofdNbBE9lMsLlz7LmQ/q9I9iU+P
 QHtfkKHXHWCxbnbaKEe3ZXDopJFYyPqvKH6yv03D/hJ4qkjJEt0WJLruz35pbS66RlLkbugJRW
 PG4yoSOACSbuosCxTcNIHhqu4ZRyuZm32e7S047Cfp1QJihldYzpqh+DG6Bxr/UAs+Q+CaOTGj
 x9s=
X-SBRS: 2.7
X-MesageID: 11165651
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,416,1571716800"; d="scan'208";a="11165651"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Fri, 10 Jan 2020 10:37:23 +0000
Message-ID: <20200110103723.29538-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhl
IHJ1bm5pbmcgWGVuCmJpbmFyeSB2ZXJzaW9uOiBYRU5WRVJfZXh0cmF2ZXJzaW9uLCBYRU5WRVJf
Y29tcGlsZV9pbmZvLCBYRU5WRVJfY2hhbmdlc2V0LgpBZGQgZXhwbGljaXQgY2FzZXMgZm9yIFhF
TlZFUl9jb21tYW5kbGluZSBhbmQgWEVOVkVSX2J1aWxkX2lkIGFzIHdlbGwuCgpJbnRyb2R1Y2Ug
eHNtX2ZpbHRlcl9kZW5pZWQoKSB0byBodm1sb2FkZXIgdG8gcmVtb3ZlICI8ZGVuaWVkPiIgc3Ry
aW5nCmZyb20gZ3Vlc3QncyBETUkgdGFibGVzIHRoYXQgb3RoZXJ3aXNlIHdvdWxkIGJlIHNob3du
IGluIHRvb2xzIGxpa2UKZG1pZGVjb2RlLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8
c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KdjEgLS0+IHYyOgotIEFkZGVkIHhzbV9maWx0
ZXJfZGVuaWVkKCkgdG8gaHZtbG9hZGVyIGluc3RlYWQgb2YgbW9kaWZ5aW5nIHhlbl9kZW55KCkK
LSBNYWRlIGJlaGF2aW91ciB0aGUgc2FtZSBmb3IgYm90aCBSZWxlYXNlIGFuZCBEZWJ1ZyBidWls
ZHMKLSBYRU5WRVJfY2FwYWJpbGl0aWVzIGlzIG5vIGxvbmdlciBoaWRlZAoKQ0M6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJh
ZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogRGFuaWVsIERlIEdyYWFmIDxk
Z2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+Ci0tLQogdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxv
YWRlci5jIHwgMSArCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvc21iaW9zLmMgICAgfCAxICsK
IHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMgICAgICB8IDYgKysrKysrCiB0b29scy9m
aXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oICAgICAgfCAyICsrCiB4ZW4vaW5jbHVkZS94c20vZHVt
bXkuaCAgICAgICAgICAgICAgfCA5ICsrKysrKy0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci9odm1sb2FkZXIuYyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIu
YwppbmRleCA1OThhMjI2Mjc4Li5lNzYwZWQ1ZmE2IDEwMDY0NAotLS0gYS90b29scy9maXJtd2Fy
ZS9odm1sb2FkZXIvaHZtbG9hZGVyLmMKKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2
bWxvYWRlci5jCkBAIC0xNDcsNiArMTQ3LDcgQEAgc3RhdGljIHZvaWQgaW5pdF9oeXBlcmNhbGxz
KHZvaWQpCiAgICAgLyogUHJpbnQgdmVyc2lvbiBpbmZvcm1hdGlvbi4gKi8KICAgICBjcHVpZChi
YXNlICsgMSwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7CiAgICAgaHlwZXJjYWxsX3hlbl92ZXJz
aW9uKFhFTlZFUl9leHRyYXZlcnNpb24sIGV4dHJhdmVyc2lvbik7CisgICAgeHNtX2ZpbHRlcl9k
ZW5pZWQoZXh0cmF2ZXJzaW9uLCBzaXplb2YoZXh0cmF2ZXJzaW9uKSk7CiAgICAgcHJpbnRmKCJE
ZXRlY3RlZCBYZW4gdiV1LiV1JXNcbiIsIGVheCA+PiAxNiwgZWF4ICYgMHhmZmZmLCBleHRyYXZl
cnNpb24pOwogfQogCmRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvc21iaW9z
LmMgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvc21iaW9zLmMKaW5kZXggOTdhMDU0ZTllMy4u
MWJhMzUyZWQyYyAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3NtYmlvcy5j
CisrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9zbWJpb3MuYwpAQCAtMjc1LDYgKzI3NSw3
IEBAIGh2bV93cml0ZV9zbWJpb3NfdGFibGVzKAogICAgIHhlbl9taW5vcl92ZXJzaW9uID0gKHVp
bnQxNl90KSB4ZW5fdmVyc2lvbjsKIAogICAgIGh5cGVyY2FsbF94ZW5fdmVyc2lvbihYRU5WRVJf
ZXh0cmF2ZXJzaW9uLCB4ZW5fZXh0cmFfdmVyc2lvbik7CisgICAgeHNtX2ZpbHRlcl9kZW5pZWQo
eGVuX2V4dHJhX3ZlcnNpb24sIHNpemVvZih4ZW5fZXh0cmFfdmVyc2lvbikpOwogCiAgICAgLyog
YnVpbGQgdXAgaHVtYW4tcmVhZGFibGUgWGVuIHZlcnNpb24gc3RyaW5nICovCiAgICAgcCA9IHhl
bl92ZXJzaW9uX3N0cjsKZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGls
LmMgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jCmluZGV4IDBjM2YyZDI0Y2QuLjA5
ZTM1NWZhM2QgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMKKysr
IGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuYwpAQCAtOTk1LDYgKzk5NSwxMiBAQCB2
b2lkIGh2bWxvYWRlcl9hY3BpX2J1aWxkX3RhYmxlcyhzdHJ1Y3QgYWNwaV9jb25maWcgKmNvbmZp
ZywKICAgICBodm1fcGFyYW1fc2V0KEhWTV9QQVJBTV9WTV9HRU5FUkFUSU9OX0lEX0FERFIsIGNv
bmZpZy0+dm1fZ2lkX2FkZHIpOwogfQogCit2b2lkIHhzbV9maWx0ZXJfZGVuaWVkKGNoYXIgKnN0
ciwgc2l6ZV90IGxlbikKK3sKKyAgICBpZiAoIHN0cmNtcChzdHIsICI8ZGVuaWVkPiIpID09IDAg
KQorICAgICAgICBtZW1zZXQoc3RyLCAwLCBsZW4pOworfQorCiAvKgogICogTG9jYWwgdmFyaWFi
bGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0
aWwuaCBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmgKaW5kZXggN2JjYTY0MThkMi4u
ZjdkOTA3Y2EwMCAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuaAor
KysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5oCkBAIC0yODYsNiArMjg2LDggQEAg
c3RydWN0IGFjcGlfY29uZmlnOwogdm9pZCBodm1sb2FkZXJfYWNwaV9idWlsZF90YWJsZXMoc3Ry
dWN0IGFjcGlfY29uZmlnICpjb25maWcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgcGh5c2ljYWwpOwogCit2b2lkIHhzbV9maWx0ZXJfZGVuaWVkKGNoYXIg
KnN0ciwgc2l6ZV90IGxlbik7CisKICNlbmRpZiAvKiBfX0hWTUxPQURFUl9VVElMX0hfXyAqLwog
CiAvKgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveHNtL2R1bW15LmggYi94ZW4vaW5jbHVkZS94
c20vZHVtbXkuaAppbmRleCBiOGUxODVlNmZhLi5kMTViMDc4ZjEwIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS94c20vZHVtbXkuaAorKysgYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaApAQCAtNzUw
LDE0ICs3NTAsMTcgQEAgc3RhdGljIFhTTV9JTkxJTkUgaW50IHhzbV94ZW5fdmVyc2lvbiAoWFNN
X0RFRkFVTFRfQVJHIHVpbnQzMl90IG9wKQogICAgIGNhc2UgWEVOVkVSX2dldF9mZWF0dXJlczoK
ICAgICAgICAgLyogVGhlc2Ugc3ViLW9wcyBpZ25vcmUgdGhlIHBlcm1pc3Npb24gY2hlY2tzIGFu
ZCByZXR1cm4gZGF0YS4gKi8KICAgICAgICAgcmV0dXJuIDA7Ci0gICAgY2FzZSBYRU5WRVJfZXh0
cmF2ZXJzaW9uOgotICAgIGNhc2UgWEVOVkVSX2NvbXBpbGVfaW5mbzoKICAgICBjYXNlIFhFTlZF
Ul9jYXBhYmlsaXRpZXM6Ci0gICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0OgogICAgIGNhc2UgWEVO
VkVSX3BhZ2VzaXplOgogICAgIGNhc2UgWEVOVkVSX2d1ZXN0X2hhbmRsZToKICAgICAgICAgLyog
VGhlc2UgTVVTVCBhbHdheXMgYmUgYWNjZXNzaWJsZSB0byBhbnkgZ3Vlc3QgYnkgZGVmYXVsdC4g
Ki8KICAgICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fSE9PSywgY3VycmVudC0+
ZG9tYWluLCBOVUxMKTsKKworICAgIGNhc2UgWEVOVkVSX2V4dHJhdmVyc2lvbjoKKyAgICBjYXNl
IFhFTlZFUl9jb21waWxlX2luZm86CisgICAgY2FzZSBYRU5WRVJfY2hhbmdlc2V0OgorICAgIGNh
c2UgWEVOVkVSX2NvbW1hbmRsaW5lOgorICAgIGNhc2UgWEVOVkVSX2J1aWxkX2lkOgogICAgIGRl
ZmF1bHQ6CiAgICAgICAgIHJldHVybiB4c21fZGVmYXVsdF9hY3Rpb24oWFNNX1BSSVYsIGN1cnJl
bnQtPmRvbWFpbiwgTlVMTCk7CiAgICAgfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
