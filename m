Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53974FC8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:41:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdy3-00007j-8R; Thu, 25 Jul 2019 13:39:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqdy1-000074-Rp
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:39:33 +0000
X-Inumbo-ID: a19c38a4-aee1-11e9-95bd-c322ae5a3fc7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a19c38a4-aee1-11e9-95bd-c322ae5a3fc7;
 Thu, 25 Jul 2019 13:39:31 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WO86rw9O8S4A4cxzCRqMWlhWMRanneWqSoJqE+CLUzT/INzAAbQE7eNxCDg28YtE982iP8EnVT
 jwe6cqpuc90foZnld73MHqvK9rPeF4Lanoi/v8c/Tv5mZ8NaUvJOYLYqWj2ZBiU5RfZxFaFxC0
 QIwJCt2e4KtpJYc9zL8QLAx+QtyygVreSMtvP7Ttr6/oZHbtxlYvHnUHyM8N6SihWcgun6nLSm
 wI0JzOGpSkSTrrUl879v92oNwzztImxV+VIduR+3Qkrw36vJCfRVrd94ekag45w1MhRKtnkPkA
 t10=
X-SBRS: 2.7
X-MesageID: 3459691
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3459691"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Jul 2019 14:39:18 +0100
Message-ID: <20190725133920.40673-5-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190725133920.40673-1-paul.durrant@citrix.com>
References: <20190725133920.40673-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUgZG9tYWluICdvcHRpb25zJyBjYW4gbm93
IGJlIHRlc3RlZApkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KLS0t
CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUg
TW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKIC0gTW92ZSBzb21lIG9mIHRoZSBo
dW5rcyBmcm9tIHBhdGNoICMzCiAtIEFsc28gdXBkYXRlIHRoZSBkZWZpbml0aW9uIG9mIHNoYWRv
d19kb21haW5faW5pdCgpIGluIG5vbmUuYwotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYyAg
ICAgICAgfCAyICstCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIHwgNSArKy0tLQog
eGVuL2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMgICB8IDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14
ODYvZG9tYWluLmggICAgfCAxIC0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmggICAgfCAy
ICstCiA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vcGFn
aW5nLmMKaW5kZXggMDk3YTI3ZjYwOC4uNjlhYTIyOGU0NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL3BhZ2luZy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwpAQCAtNjUzLDcg
KzY1Myw3IEBAIGludCBwYWdpbmdfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKICAgICBp
ZiAoIGhhcF9lbmFibGVkKGQpICkKICAgICAgICAgaGFwX2RvbWFpbl9pbml0KGQpOwogICAgIGVs
c2UKLSAgICAgICAgcmMgPSBzaGFkb3dfZG9tYWluX2luaXQoZCwgZC0+b3B0aW9ucyk7CisgICAg
ICAgIHJjID0gc2hhZG93X2RvbWFpbl9pbml0KGQpOwogCiAgICAgcmV0dXJuIHJjOwogfQpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyBiL3hlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvY29tbW9uLmMKaW5kZXggZmExOGRlMGJiNi4uOTExZDkxZTUwMiAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvbW0v
c2hhZG93L2NvbW1vbi5jCkBAIC00Niw3ICs0Niw3IEBAIHN0YXRpYyB2b2lkIHNoX2NsZWFuX2Rp
cnR5X2JpdG1hcChzdHJ1Y3QgZG9tYWluICopOwogCiAvKiBTZXQgdXAgdGhlIHNoYWRvdy1zcGVj
aWZpYyBwYXJ0cyBvZiBhIGRvbWFpbiBzdHJ1Y3QgYXQgc3RhcnQgb2YgZGF5LgogICogQ2FsbGVk
IGZvciBldmVyeSBkb21haW4gZnJvbSBhcmNoX2RvbWFpbl9jcmVhdGUoKSAqLwotaW50IHNoYWRv
d19kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgZG9tY3JfZmxhZ3Mp
CitpbnQgc2hhZG93X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBsb2dfZGlydHlfb3BzIHNoX29wcyA9IHsKICAgICAgICAgLmVuYWJsZSAg
PSBzaF9lbmFibGVfbG9nX2RpcnR5LApAQCAtNjIsNyArNjIsNiBAQCBpbnQgc2hhZG93X2RvbWFp
bl9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBkb21jcl9mbGFncykKIAogI2lm
IChTSEFET1dfT1BUSU1JWkFUSU9OUyAmIFNIT1BUX09VVF9PRl9TWU5DKQogICAgIGQtPmFyY2gu
cGFnaW5nLnNoYWRvdy5vb3NfYWN0aXZlID0gMDsKLSAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cu
b29zX29mZiA9IGRvbWNyX2ZsYWdzICYgWEVOX0RPTUNUTF9DREZfb29zX29mZjsKICNlbmRpZgog
ICAgIGQtPmFyY2gucGFnaW5nLnNoYWRvdy5wYWdldGFibGVfZHlpbmdfb3AgPSAwOwogCkBAIC0y
NTIzLDcgKzI1MjIsNyBAQCBzdGF0aWMgdm9pZCBzaF91cGRhdGVfcGFnaW5nX21vZGVzKHN0cnVj
dCB2Y3B1ICp2KQogI2lmIChTSEFET1dfT1BUSU1JWkFUSU9OUyAmIFNIT1BUX09VVF9PRl9TWU5D
KQogICAgIC8qIFdlIG5lZWQgdG8gY2hlY2sgdGhhdCBhbGwgdGhlIHZjcHVzIGhhdmUgcGFnaW5n
IGVuYWJsZWQgdG8KICAgICAgKiB1bnN5bmMgUFRzLiAqLwotICAgIGlmICggaXNfaHZtX2RvbWFp
bihkKSAmJiAhZC0+YXJjaC5wYWdpbmcuc2hhZG93Lm9vc19vZmYgKQorICAgIGlmICggaXNfaHZt
X2RvbWFpbihkKSAmJiAhKGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmKSApCiAg
ICAgewogICAgICAgICBpbnQgcGUgPSAxOwogICAgICAgICBzdHJ1Y3QgdmNwdSAqdnB0cjsKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbm9uZS5jIGIveGVuL2FyY2gveDg2L21t
L3NoYWRvdy9ub25lLmMKaW5kZXggYTcwODg4YmQ5OC4uMmZkZGY0Mjc0YyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRv
dy9ub25lLmMKQEAgLTE4LDcgKzE4LDcgQEAgc3RhdGljIHZvaWQgX2NsZWFuX2RpcnR5X2JpdG1h
cChzdHJ1Y3QgZG9tYWluICpkKQogICAgIEFTU0VSVChpc19wdl9kb21haW4oZCkpOwogfQogCi1p
bnQgc2hhZG93X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBkb21j
cl9mbGFncykKK2ludCBzaGFkb3dfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKIHsKICAg
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGxvZ19kaXJ0eV9vcHMgc2hfbm9uZV9vcHMgPSB7CiAgICAg
ICAgIC5lbmFibGUgID0gX2VuYWJsZV9sb2dfZGlydHksCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCA5
MzNiODU5MDFmLi41Zjk4OTk0NjljIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2Rv
bWFpbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKQEAgLTExNSw3ICsxMTUs
NiBAQCBzdHJ1Y3Qgc2hhZG93X2RvbWFpbiB7CiAKICAgICAvKiBPT1MgKi8KICAgICBib29sX3Qg
b29zX2FjdGl2ZTsKLSAgICBib29sX3Qgb29zX29mZjsKIAogICAgIC8qIEhhcyB0aGlzIGRvbWFp
biBldmVyIHVzZWQgSFZNT1BfcGFnZXRhYmxlX2R5aW5nPyAqLwogICAgIGJvb2xfdCBwYWdldGFi
bGVfZHlpbmdfb3A7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaAppbmRleCBmMjlmMGY2NTJiLi44ZWJiODljMDI3
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvc2hhZG93LmgKQEAgLTQ5LDcgKzQ5LDcgQEAKIAogLyogU2V0IHVwIHRoZSBz
aGFkb3ctc3BlY2lmaWMgcGFydHMgb2YgYSBkb21haW4gc3RydWN0IGF0IHN0YXJ0IG9mIGRheS4K
ICAqIENhbGxlZCBmcm9tIHBhZ2luZ19kb21haW5faW5pdCgpLiAqLwotaW50IHNoYWRvd19kb21h
aW5faW5pdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgZG9tY3JfZmxhZ3MpOworaW50
IHNoYWRvd19kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkKTsKIAogLyogU2V0dXAgdGhlIHNo
YWRvdy1zcGVjaWZpYyBwYXJ0cyBvZiBhIHZjcHUgc3RydWN0LiBJdCBpcyBjYWxsZWQgYnkKICAq
IHBhZ2luZ192Y3B1X2luaXQoKSBpbiBwYWdpbmcuYyAqLwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
