Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 433207206A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 22:05:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq0vn-0003HZ-Uy; Tue, 23 Jul 2019 19:58:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hq0vm-0003HS-BC
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 19:58:38 +0000
X-Inumbo-ID: 404bea12-ad84-11e9-8f0b-af4ed6feee0f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 404bea12-ad84-11e9-8f0b-af4ed6feee0f;
 Tue, 23 Jul 2019 19:58:34 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4QMu0oNow4tY0RjosWLsM1zUdyZSt7GXPUuxEyLx2RgDm9vYDeuLuu3qTBhPwIJE+vWUoamXoh
 uWjJnrotFVilEIo4VlpOixIa3a+oM9TewEFo9n0eOkfCcSg1khWB8lUC0ZC7quPmivo2AQ5dP7
 pQ8/xKSbs8NVieqIkv3QbJmrNbxXoV1JupbDfOO7J6xcH1vJf6+NAQo0BqxjOOtAfqF1NlzGIb
 CJIKwOBz6b/X0RT9aux2pgEB1Mk/5QNKPAB8eE5heQm2rVA7bcq+hoCnuQuLs6M3i3r3dmCrcb
 n+w=
X-SBRS: 2.7
X-MesageID: 3440184
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,300,1559534400"; 
   d="scan'208";a="3440184"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 23 Jul 2019 20:58:30 +0100
Message-ID: <20190723195830.4524-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/pv: Move async_exception_cleanup() into
 pv/iret.c
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIGNhbGxlcnMgYXJlIGluIHB2L2lyZXQuYy4gIE1vdmUgdGhlIGZ1bmN0aW9uIGFuZCBtYWtl
IGl0IHN0YXRpYy4KCkV2ZW4gYmVmb3JlIHRoZSBwaW5uaW5nIGNsZWFudXAsIHRoZXJlIHdhcyBu
b3RoaW5nIHdoaWNoIGlzIHNwZWNpZmljIHRvCm9wZXJhdGluZyBvbiBjdXJyLCBzbyByZW5hbWUg
dGhlIHZhcmlhYmxlIGJhY2sgdG8gdi4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpEaXNjb3ZlcmVkIHdoaWxlIHJldmlld2luZy9wcm9kZGlu
ZyBKdWVyZ2VuJ3MgcGlubmluZyByZW1vdmFsIHBhdGNoZXMuCi0tLQogeGVuL2FyY2gveDg2L3B2
L2lyZXQuYyAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQogeGVuL2FyY2gveDg2
L3RyYXBzLmMgICAgICAgIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L3RyYXBzLmggfCAgMiAtLQogMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvaXJldC5j
IGIveGVuL2FyY2gveDg2L3B2L2lyZXQuYwppbmRleCBjMzU5YTFkYmZkLi5hZTFjMzM2MTJiIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvaXJldC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9p
cmV0LmMKQEAgLTIyLDcgKzIyLDMwIEBACiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CiAKICNpbmNs
dWRlIDxhc20vY3VycmVudC5oPgotI2luY2x1ZGUgPGFzbS90cmFwcy5oPgorCitzdGF0aWMgdm9p
ZCBhc3luY19leGNlcHRpb25fY2xlYW51cChzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICB1bnNpZ25l
ZCBpbnQgdHJhcDsKKworICAgIGlmICggIXYtPmFzeW5jX2V4Y2VwdGlvbl9tYXNrICkKKyAgICAg
ICAgcmV0dXJuOworCisgICAgaWYgKCAhKHYtPmFzeW5jX2V4Y2VwdGlvbl9tYXNrICYgKHYtPmFz
eW5jX2V4Y2VwdGlvbl9tYXNrIC0gMSkpICkKKyAgICAgICAgdHJhcCA9IF9fc2NhbmJpdCh2LT5h
c3luY19leGNlcHRpb25fbWFzaywgVkNQVV9UUkFQX05PTkUpOworICAgIGVsc2UKKyAgICAgICAg
Zm9yICggdHJhcCA9IFZDUFVfVFJBUF9OT05FICsgMTsgdHJhcCA8PSBWQ1BVX1RSQVBfTEFTVDsg
Kyt0cmFwICkKKyAgICAgICAgICAgIGlmICggKHYtPmFzeW5jX2V4Y2VwdGlvbl9tYXNrIF4KKyAg
ICAgICAgICAgICAgICAgIHYtPmFzeW5jX2V4Y2VwdGlvbl9zdGF0ZSh0cmFwKS5vbGRfbWFzaykg
PT0gKDF1IDw8IHRyYXApICkKKyAgICAgICAgICAgICAgICBicmVhazsKKyAgICBpZiAoIHVubGlr
ZWx5KHRyYXAgPiBWQ1BVX1RSQVBfTEFTVCkgKQorICAgIHsKKyAgICAgICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICAvKiBSZXN0b3JlIHByZXZp
b3VzIGFzeW5jaHJvbm91cyBleGNlcHRpb24gbWFzay4gKi8KKyAgICB2LT5hc3luY19leGNlcHRp
b25fbWFzayA9IHYtPmFzeW5jX2V4Y2VwdGlvbl9zdGF0ZSh0cmFwKS5vbGRfbWFzazsKK30KIAog
dW5zaWduZWQgbG9uZyBkb19pcmV0KHZvaWQpCiB7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
dHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCmluZGV4IDA4ZDdlZGM1NjguLjM4ZDEyMDEz
ZGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni90
cmFwcy5jCkBAIC0xNTkzLDMwICsxNTkzLDYgQEAgc3RhdGljIHZvaWQgcGNpX3NlcnJfc29mdGly
cSh2b2lkKQogICAgIG91dGIoaW5iKDB4NjEpICYgMHgwYiwgMHg2MSk7IC8qIHJlLWVuYWJsZSB0
aGUgUENJIFNFUlIgZXJyb3IgbGluZS4gKi8KIH0KIAotdm9pZCBhc3luY19leGNlcHRpb25fY2xl
YW51cChzdHJ1Y3QgdmNwdSAqY3VycikKLXsKLSAgICBpbnQgdHJhcDsKLQotICAgIGlmICggIWN1
cnItPmFzeW5jX2V4Y2VwdGlvbl9tYXNrICkKLSAgICAgICAgcmV0dXJuOwotCi0gICAgaWYgKCAh
KGN1cnItPmFzeW5jX2V4Y2VwdGlvbl9tYXNrICYgKGN1cnItPmFzeW5jX2V4Y2VwdGlvbl9tYXNr
IC0gMSkpICkKLSAgICAgICAgdHJhcCA9IF9fc2NhbmJpdChjdXJyLT5hc3luY19leGNlcHRpb25f
bWFzaywgVkNQVV9UUkFQX05PTkUpOwotICAgIGVsc2UKLSAgICAgICAgZm9yICggdHJhcCA9IFZD
UFVfVFJBUF9OT05FICsgMTsgdHJhcCA8PSBWQ1BVX1RSQVBfTEFTVDsgKyt0cmFwICkKLSAgICAg
ICAgICAgIGlmICggKGN1cnItPmFzeW5jX2V4Y2VwdGlvbl9tYXNrIF4KLSAgICAgICAgICAgICAg
ICAgIGN1cnItPmFzeW5jX2V4Y2VwdGlvbl9zdGF0ZSh0cmFwKS5vbGRfbWFzaykgPT0gKDEgPDwg
dHJhcCkgKQotICAgICAgICAgICAgICAgIGJyZWFrOwotICAgIGlmICggdW5saWtlbHkodHJhcCA+
IFZDUFVfVFJBUF9MQVNUKSApCi0gICAgewotICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsK
LSAgICAgICAgcmV0dXJuOwotICAgIH0KLQotICAgIC8qIFJlc3RvcmUgcHJldmlvdXMgYXN5bmNo
cm9ub3VzIGV4Y2VwdGlvbiBtYXNrLiAqLwotICAgIGN1cnItPmFzeW5jX2V4Y2VwdGlvbl9tYXNr
ID0gY3Vyci0+YXN5bmNfZXhjZXB0aW9uX3N0YXRlKHRyYXApLm9sZF9tYXNrOwotfQotCiBzdGF0
aWMgdm9pZCBubWlfaHdkb21fcmVwb3J0KHVuc2lnbmVkIGludCByZWFzb25faWR4KQogewogICAg
IHN0cnVjdCBkb21haW4gKmQgPSBoYXJkd2FyZV9kb21haW47CmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L3RyYXBzLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3RyYXBzLmgKaW5kZXgg
Yjg4ZjJhNGYyZi4uZWMyM2QzYTcwYiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni90
cmFwcy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvdHJhcHMuaApAQCAtMTksOCArMTksNiBA
QAogI2lmbmRlZiBBU01fVFJBUF9ICiAjZGVmaW5lIEFTTV9UUkFQX0gKIAotdm9pZCBhc3luY19l
eGNlcHRpb25fY2xlYW51cChzdHJ1Y3QgdmNwdSAqKTsKLQogY29uc3QgY2hhciAqdHJhcHN0cih1
bnNpZ25lZCBpbnQgdHJhcG5yKTsKIAogI2VuZGlmIC8qIEFTTV9UUkFQX0ggKi8KLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
