Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77456A59CE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 16:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4ney-0006My-RK; Mon, 02 Sep 2019 14:50:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4nex-0006Mp-L3
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:50:23 +0000
X-Inumbo-ID: faf7b928-cd90-11e9-aea3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faf7b928-cd90-11e9-aea3-12813bfff9fa;
 Mon, 02 Sep 2019 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567435818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s3Acy7iHRlONGYxtdfN0wWh68D8nCGDvvEpfIMeWKMg=;
 b=R66fO5j07x9juNHyNIFvRQ2UJg6Mtr4yUtCxG4IBUTf1SMbuSER9wqKQ
 yqFhCculKdmm4JJ/4hRjgNEYl6XV5zY6jUv82MHolGzoHw4QU9ewgV/Fv
 z3QJcBRIymucfcnXgXvecNOA5omCIB0k9mMwhRLLh/16hE5yc9Ew/zA7B 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: N0z24IvFZPWPtpxFjEUSwsIRpcbjYhtqkbRFFm03Z+oiIzGjWH3p4n9coqYirLc2G7wGkpmErQ
 4laFEPMy3VWgujXNVjrlkTQ0gEauUXdkMKM4DHyHhDAepIj0Iwfy7am37vtw2Gih0/BX87Zth5
 /dGMzWzPF6Nw4Gubv/+sNiXn0/dWALJQ24ZRgg+xqRAKB8OTpfjkxJa5vbngxGmkJJ4E+4wwl1
 1G48NWwbpYHbq4rqgo+//oFjJ6JQ6dJaRCPSYr1xHCfBczrNwjEaU5lPVc+5MlKT+mpH3XxhDl
 IAE=
X-SBRS: 2.7
X-MesageID: 5020239
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5020239"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 15:50:09 +0100
Message-ID: <20190902145014.36442-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190902145014.36442-1-paul.durrant@citrix.com>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v8 1/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUgZG9tYWluICdvcHRpb25zJyBjYW4gbm93
IGJlIHRlc3RlZApkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOp
IiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2ODoKIC0gTW92ZSBzZXR0aW5nIENERl9vb3Nfb2Zm
IGludG8geDg2IGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpCiAtIERyb3BwZWQgSmFuJ3Mg
Ui1iIGJlY2F1c2Ugb2YgdGhlIGNoYW5nZQoKdjM6CiAtIEZvcmNlICdvb3Nfb2ZmJyB0byBiZSBz
ZXQgZm9yIFBWIGd1ZXN0cyAodG8gYXZvaWQgY2FsbCB0bwogICBpc19odm1fZG9tYWluKCkgZXhj
ZXB0IGluIEFTU0VSVCkKIC0gRHJvcHBlZCBUaW0ncyBBLWIgYmVjYXVzZSBvZiB0aGUgY2hhbmdl
Cgp2MjoKIC0gTW92ZSBzb21lIG9mIHRoZSBodW5rcyBmcm9tIHBhdGNoICMzCiAtIEFsc28gdXBk
YXRlIHRoZSBkZWZpbml0aW9uIG9mIHNoYWRvd19kb21haW5faW5pdCgpIGluIG5vbmUuYwotLS0K
IHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgfCA3ICsrKysrKysKIHhlbi9hcmNoL3g4
Ni9tbS9wYWdpbmcuYyAgICAgICAgfCAyICstCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1v
bi5jIHwgNyArKysrLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L25vbmUuYyAgIHwgMiArLQog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAgICB8IDEgLQogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9zaGFkb3cuaCAgICB8IDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4v
YXJjaC94ODYvZG9tYWluLmMKaW5kZXggMmRmMzEyMzMyZC4uZDVhMTk0MDRhNiAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAt
NDczLDYgKzQ3MywxMyBAQCBpbnQgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKHN0cnVjdCB4
ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsK
ICAgICB9CiAKKyAgICBpZiAoICEoY29uZmlnLT5mbGFncyAmIFhFTl9ET01DVExfQ0RGX2h2bV9n
dWVzdCkgKQorICAgICAgICAvKgorICAgICAgICAgKiBJdCBpcyBvbmx5IG1lYW5pbmdmdWwgZm9y
IFhFTl9ET01DVExfQ0RGX29vc19vZmYgdG8gYmUgY2xlYXIKKyAgICAgICAgICogZm9yIEhWTSBn
dWVzdHMuCisgICAgICAgICAqLworICAgICAgICBjb25maWctPmZsYWdzIHw9IFhFTl9ET01DVExf
Q0RGX29vc19vZmY7CisKICAgICByZXR1cm4gMDsKIH0KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tL3BhZ2luZy5jIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCmluZGV4IDA5N2EyN2Y2
MDguLjY5YWEyMjhlNDYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYworKysg
Yi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKQEAgLTY1Myw3ICs2NTMsNyBAQCBpbnQgcGFnaW5n
X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCiAgICAgaWYgKCBoYXBfZW5hYmxlZChkKSAp
CiAgICAgICAgIGhhcF9kb21haW5faW5pdChkKTsKICAgICBlbHNlCi0gICAgICAgIHJjID0gc2hh
ZG93X2RvbWFpbl9pbml0KGQsIGQtPm9wdGlvbnMpOworICAgICAgICByYyA9IHNoYWRvd19kb21h
aW5faW5pdChkKTsKIAogICAgIHJldHVybiByYzsKIH0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCmlu
ZGV4IGMwZDRhMjcyODcuLjk0NjM3OTQwNTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9z
aGFkb3cvY29tbW9uLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwpAQCAt
NDYsNyArNDYsNyBAQCBzdGF0aWMgdm9pZCBzaF9jbGVhbl9kaXJ0eV9iaXRtYXAoc3RydWN0IGRv
bWFpbiAqKTsKIAogLyogU2V0IHVwIHRoZSBzaGFkb3ctc3BlY2lmaWMgcGFydHMgb2YgYSBkb21h
aW4gc3RydWN0IGF0IHN0YXJ0IG9mIGRheS4KICAqIENhbGxlZCBmb3IgZXZlcnkgZG9tYWluIGZy
b20gYXJjaF9kb21haW5fY3JlYXRlKCkgKi8KLWludCBzaGFkb3dfZG9tYWluX2luaXQoc3RydWN0
IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGRvbWNyX2ZsYWdzKQoraW50IHNoYWRvd19kb21haW5f
aW5pdChzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbG9nX2Rp
cnR5X29wcyBzaF9vcHMgPSB7CiAgICAgICAgIC5lbmFibGUgID0gc2hfZW5hYmxlX2xvZ19kaXJ0
eSwKQEAgLTYyLDcgKzYyLDYgQEAgaW50IHNoYWRvd19kb21haW5faW5pdChzdHJ1Y3QgZG9tYWlu
ICpkLCB1bnNpZ25lZCBpbnQgZG9tY3JfZmxhZ3MpCiAKICNpZiAoU0hBRE9XX09QVElNSVpBVElP
TlMgJiBTSE9QVF9PVVRfT0ZfU1lOQykKICAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cub29zX2Fj
dGl2ZSA9IDA7Ci0gICAgZC0+YXJjaC5wYWdpbmcuc2hhZG93Lm9vc19vZmYgPSBkb21jcl9mbGFn
cyAmIFhFTl9ET01DVExfQ0RGX29vc19vZmY7CiAjZW5kaWYKICAgICBkLT5hcmNoLnBhZ2luZy5z
aGFkb3cucGFnZXRhYmxlX2R5aW5nX29wID0gMDsKIApAQCAtMjUyOCwxMSArMjUyNywxMyBAQCBz
dGF0aWMgdm9pZCBzaF91cGRhdGVfcGFnaW5nX21vZGVzKHN0cnVjdCB2Y3B1ICp2KQogI2lmIChT
SEFET1dfT1BUSU1JWkFUSU9OUyAmIFNIT1BUX09VVF9PRl9TWU5DKQogICAgIC8qIFdlIG5lZWQg
dG8gY2hlY2sgdGhhdCBhbGwgdGhlIHZjcHVzIGhhdmUgcGFnaW5nIGVuYWJsZWQgdG8KICAgICAg
KiB1bnN5bmMgUFRzLiAqLwotICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSAmJiAhZC0+YXJjaC5w
YWdpbmcuc2hhZG93Lm9vc19vZmYgKQorICAgIGlmICggIShkLT5vcHRpb25zICYgWEVOX0RPTUNU
TF9DREZfb29zX29mZikgKQogICAgIHsKICAgICAgICAgaW50IHBlID0gMTsKICAgICAgICAgc3Ry
dWN0IHZjcHUgKnZwdHI7CiAKKyAgICAgICAgQVNTRVJUKGlzX2h2bV9kb21haW4oZCkpOworCiAg
ICAgICAgIGZvcl9lYWNoX3ZjcHUoZCwgdnB0cikKICAgICAgICAgewogICAgICAgICAgICAgaWYg
KCAhaHZtX3BhZ2luZ19lbmFibGVkKHZwdHIpICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvbm9uZS5jIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMKaW5kZXggYTcw
ODg4YmQ5OC4uMmZkZGY0Mjc0YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9u
b25lLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMKQEAgLTE4LDcgKzE4LDcg
QEAgc3RhdGljIHZvaWQgX2NsZWFuX2RpcnR5X2JpdG1hcChzdHJ1Y3QgZG9tYWluICpkKQogICAg
IEFTU0VSVChpc19wdl9kb21haW4oZCkpOwogfQogCi1pbnQgc2hhZG93X2RvbWFpbl9pbml0KHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBkb21jcl9mbGFncykKK2ludCBzaGFkb3dfZG9t
YWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGxv
Z19kaXJ0eV9vcHMgc2hfbm9uZV9vcHMgPSB7CiAgICAgICAgIC5lbmFibGUgID0gX2VuYWJsZV9s
b2dfZGlydHksCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCA5ZjNhZmQxMmJjLi43Y2ViZmE0ZmI5IDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvZG9tYWluLmgKQEAgLTExNSw3ICsxMTUsNiBAQCBzdHJ1Y3Qgc2hhZG93X2RvbWFp
biB7CiAKICAgICAvKiBPT1MgKi8KICAgICBib29sX3Qgb29zX2FjdGl2ZTsKLSAgICBib29sX3Qg
b29zX29mZjsKIAogICAgIC8qIEhhcyB0aGlzIGRvbWFpbiBldmVyIHVzZWQgSFZNT1BfcGFnZXRh
YmxlX2R5aW5nPyAqLwogICAgIGJvb2xfdCBwYWdldGFibGVfZHlpbmdfb3A7CmRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFk
b3cuaAppbmRleCBmMjlmMGY2NTJiLi44ZWJiODljMDI3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L3NoYWRvdy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc2hhZG93LmgKQEAg
LTQ5LDcgKzQ5LDcgQEAKIAogLyogU2V0IHVwIHRoZSBzaGFkb3ctc3BlY2lmaWMgcGFydHMgb2Yg
YSBkb21haW4gc3RydWN0IGF0IHN0YXJ0IG9mIGRheS4KICAqIENhbGxlZCBmcm9tIHBhZ2luZ19k
b21haW5faW5pdCgpLiAqLwotaW50IHNoYWRvd19kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBpbnQgZG9tY3JfZmxhZ3MpOworaW50IHNoYWRvd19kb21haW5faW5pdChzdHJ1
Y3QgZG9tYWluICpkKTsKIAogLyogU2V0dXAgdGhlIHNoYWRvdy1zcGVjaWZpYyBwYXJ0cyBvZiBh
IHZjcHUgc3RydWN0LiBJdCBpcyBjYWxsZWQgYnkKICAqIHBhZ2luZ192Y3B1X2luaXQoKSBpbiBw
YWdpbmcuYyAqLwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
