Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7F79243
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 19:41:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs9bp-0005q8-Dv; Mon, 29 Jul 2019 17:38:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs9bn-0005px-O0
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 17:38:51 +0000
X-Inumbo-ID: b881cb08-b227-11e9-98ba-7304cec94108
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b881cb08-b227-11e9-98ba-7304cec94108;
 Mon, 29 Jul 2019 17:38:48 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BFYegNC79QyB5Cbm8C5L1TwasP5ujm3DKklJwdsGvV9xdRrpL4mi/bHPZXsByB9k5dBTWXuzLH
 M64gNa1Veaes+XBMiZ1zyXAfvE7nXaRRzfxP6E/dBoqn3XRA6QNfULgqq0DCZ0qwX5PwzXeiZh
 aiBCvrG+yUU1PluVA1J/dw6YC2lXXtWbkSNwp2YrgPgVaLqMVye9/jrXz5ZDO4pKU4yQsB5sJo
 s4rDVr7PhE4YmHOAzgKb2BEmAWVo6yV9gZgn5KB62AU4W2hgxJFmdQhK1dn7167p7VZlrOCc3m
 Z7w=
X-SBRS: 2.7
X-MesageID: 3716348
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3716348"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 18:38:42 +0100
Message-ID: <20190729173843.21586-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729173843.21586-1-andrew.cooper3@citrix.com>
References: <20190729173843.21586-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnV0dXJlIGNoYW5nZXMgYXJlIGdvaW5nIHRvIG5lZWQgdG8gcGFnZSBhbGlnbiBzb21lIHBlcmNw
dSBkYXRhLgoKU2h1ZmZsZSB0aGUgZXhhY3QgbGluayBvcmRlciBvZiBpdGVtcyB3aXRoaW4gdGhl
IEJTUyB0byBnaXZlCi5ic3MucGVyY3B1LnBhZ2VfYWxpZ25lZCBhcHByb3ByaWF0ZSBhbGlnbm1l
bnQsIGV2ZW4gb24gQ1BVMCwgd2hpY2ggdXNlcwouYnNzLnBlcmNwdSBpdHNlbGYuCgpJbnNlcnQg
ZXhwbGljaXQgYWxpZ25tZW50IHN1Y2ggdGhhdCB0aGUgcmVzdWx0IGlzIHNhZmUgZXZlbiB3aXRo
IG9iamVjdHMKc2hvcnRlciB0aGFuIGEgcGFnZSBpbiBsZW5ndGguICBUaGUgUE9JTlRFUl9BTElH
TiBmb3IgX19ic3NfZW5kIGlzIHRvIGNvdmVyCnRoZSBsYWNrIG9mIFNNUF9DQUNIRV9CWVRFUyBh
bGlnbm1lbnQsIGFzIHRoZSBsb29wcyB3aGljaCB6ZXJvIHRoZSBCU1MgdXNlCnBvaW50ZXItc2l6
ZWQgc3RvcmVzIG9uIGFsbCBhcmNoaXRlY3R1cmVzLgoKSW4gYWRkaXRpb24sIHdlIG5lZWQgdG8g
YmUgYWJsZSB0byBzcGVjaWZ5IGFuIGFsaWdubWVudCBhdHRyaWJ1dGUgdG8KX19ERUZJTkVfUEVS
X0NQVSgpLiAgUmV3b3JrIGl0IHNvIHRoZSBjYWxsZXIgcGFzc2VzIGluIGFsbCBhdHRyaWJ1dGVz
LCBhbmQKYWRqdXN0IERFRklORV9QRVJfQ1BVeyxfUkVBRF9NT1NUTFl9KCkgdG8gbWF0Y2guICBU
aGlzIGhhcyB0aGUgYWRkZWQgYm9udXMKdGhhdCBpdCBpcyBub3cgcG9zc2libGUgdG8gZ3JlcCBm
b3IgLmJzcy5wZXJjcHUgYW5kIGZpbmQgYWxsIHRoZSB1c2Vycy4KCkZpbmFsbHksIGludHJvZHVj
ZSBERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQoKSB3aGljaCB1c2VzIGJvdGggc2VjdGlvbiBh
bmQKYWxpZ25tZW50IGF0dHJpYnV0ZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogVm9sb2R5bXlyIEJh
YmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgoKQSBzYW1wbGUgYnVpbGQgaW5jbHVk
aW5nIHRoZSBzdWJzZXF1ZW50IHBhdGNoIGlzIG5vdzoKCmZmZmY4MmQwODA5MmQwMDAgQiB6ZXJv
X3BhZ2UKZmZmZjgyZDA4MDkyZTAwMCBCIHBlcl9jcHVfX2luaXRfdHNzCmZmZmY4MmQwODA5MmUw
MDAgQiBfX3Blcl9jcHVfc3RhcnQKZmZmZjgyZDA4MDkyZjAwMCBCIHBlcl9jcHVfX2NwdXBvb2wK
ZmZmZjgyZDA4MDkyZjAwOCBiIHBlcl9jcHVfX2NvbnRpbnVlX2luZm8KZmZmZjgyZDA4MDkyZjAx
MCBiIHBlcl9jcHVfX2dyYW50X3J3bG9jawoKd2hpY2ggZGVtb25zdHJhdGVzIHRoZSBjb3JyZWN0
IGFsaWdubWVudCBvZiBkYXRhIGluIC5ic3MucGVyY3B1IGV2ZW4gd2hlbgpmb2xsb3dpbmcgYSBu
b24tcGFnZS1zaXplZCBvYmplY3QgaW4gLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkLgoKdjM6CiAq
IEluc2VydCBleHBsaWNpdCBhbGlnbm1lbnQuCiAqIFJlZHVjZSBfX2Jzc19lbmQncyBhbGlnbm1l
bnQgdG8ganVzdCBQT0lOVEVSX0FMSUdOLgoKdjI6CiAqIFJld29yayBfX0RFRklORV9QRVJfQ1BV
KCkgdG8gYWxsb3cgZm9yIGZ1cnRoZXIgYXR0cmlidXRlcyB0byBiZSBwYXNzZWQuCiAqIFNwZWNp
ZnkgX19hbGlnbmVkKFBBR0VfU0laRSkgYXMgcGFydCBvZiBERUZJTkVfUEVSX0NQVV9QQUdFX0FM
SUdORUQoKS4KLS0tCiB4ZW4vYXJjaC9hcm0veGVuLmxkcy5TICAgICAgIHwgIDcgKysrKystLQog
eGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgICB8ICA3ICsrKysrLS0KIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vcGVyY3B1LmggfCAgNiArKy0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcGVyY3B1Lmgg
fCAgNiArKy0tLS0KIHhlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaCAgICAgfCAxMCArKysrKysrKy0t
CiA1IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5T
CmluZGV4IDEyYzEwN2Y0NWQuLmNjMjcxMzFkNWUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS94
ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwpAQCAtMjAxLDE0ICsyMDEsMTcg
QEAgU0VDVElPTlMKICAgICAgICAqKC5ic3Muc3RhY2tfYWxpZ25lZCkKICAgICAgICAuID0gQUxJ
R04oUEFHRV9TSVpFKTsKICAgICAgICAqKC5ic3MucGFnZV9hbGlnbmVkKQotICAgICAgICooLmJz
cykKLSAgICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVTKTsKKyAgICAgICAuID0gQUxJR04o
UEFHRV9TSVpFKTsKICAgICAgICBfX3Blcl9jcHVfc3RhcnQgPSAuOworICAgICAgICooLmJzcy5w
ZXJjcHUucGFnZV9hbGlnbmVkKQorICAgICAgIC4gPSBBTElHTihQQUdFX1NJWkUpOwogICAgICAg
ICooLmJzcy5wZXJjcHUpCiAgICAgICAgLiA9IEFMSUdOKFNNUF9DQUNIRV9CWVRFUyk7CiAgICAg
ICAgKiguYnNzLnBlcmNwdS5yZWFkX21vc3RseSkKICAgICAgICAuID0gQUxJR04oU01QX0NBQ0hF
X0JZVEVTKTsKICAgICAgICBfX3Blcl9jcHVfZGF0YV9lbmQgPSAuOworICAgICAgICooLmJzcykK
KyAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7CiAgICAgICAgX19ic3NfZW5kID0gLjsK
ICAgfSA6dGV4dAogICBfZW5kID0gLiA7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxk
cy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCBhNzMxMzljZDI5Li4zYmYyMTk3NWEy
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMKQEAgLTI5MywxNCArMjkzLDE3IEBAIFNFQ1RJT05TCiAgICAgICAgX19ic3Nfc3Rh
cnQgPSAuOwogICAgICAgICooLmJzcy5zdGFja19hbGlnbmVkKQogICAgICAgICooLmJzcy5wYWdl
X2FsaWduZWQqKQotICAgICAgICooLmJzcykKLSAgICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZ
VEVTKTsKKyAgICAgICAuID0gQUxJR04oUEFHRV9TSVpFKTsKICAgICAgICBfX3Blcl9jcHVfc3Rh
cnQgPSAuOworICAgICAgICooLmJzcy5wZXJjcHUucGFnZV9hbGlnbmVkKQorICAgICAgIC4gPSBB
TElHTihQQUdFX1NJWkUpOwogICAgICAgICooLmJzcy5wZXJjcHUpCiAgICAgICAgLiA9IEFMSUdO
KFNNUF9DQUNIRV9CWVRFUyk7CiAgICAgICAgKiguYnNzLnBlcmNwdS5yZWFkX21vc3RseSkKICAg
ICAgICAuID0gQUxJR04oU01QX0NBQ0hFX0JZVEVTKTsKICAgICAgICBfX3Blcl9jcHVfZGF0YV9l
bmQgPSAuOworICAgICAgICooLmJzcykKKyAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7
CiAgICAgICAgX19ic3NfZW5kID0gLjsKICAgfSA6dGV4dAogICBfZW5kID0gLiA7CmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BlcmNwdS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9w
ZXJjcHUuaAppbmRleCA5NTg0YjgzMGQ0Li4yNjQxMjBiMTkyIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL3BlcmNwdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGVyY3B1LmgK
QEAgLTEwLDEwICsxMCw4IEBAIGV4dGVybiBjaGFyIF9fcGVyX2NwdV9zdGFydFtdLCBfX3Blcl9j
cHVfZGF0YV9lbmRbXTsKIGV4dGVybiB1bnNpZ25lZCBsb25nIF9fcGVyX2NwdV9vZmZzZXRbTlJf
Q1BVU107CiB2b2lkIHBlcmNwdV9pbml0X2FyZWFzKHZvaWQpOwogCi0vKiBTZXBhcmF0ZSBvdXQg
dGhlIHR5cGUsIHNvIChpbnRbM10sIGZvbykgd29ya3MuICovCi0jZGVmaW5lIF9fREVGSU5FX1BF
Ul9DUFUodHlwZSwgbmFtZSwgc3VmZml4KSAgICAgICAgICAgICAgICAgICAgXAotICAgIF9fc2Vj
dGlvbigiLmJzcy5wZXJjcHUiICNzdWZmaXgpICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
LSAgICBfX3R5cGVvZl9fKHR5cGUpIHBlcl9jcHVfIyNuYW1lCisjZGVmaW5lIF9fREVGSU5FX1BF
Ul9DUFUoYXR0ciwgdHlwZSwgbmFtZSkgXAorICAgIGF0dHIgX190eXBlb2ZfXyh0eXBlKSBwZXJf
Y3B1XyAjIyBuYW1lCiAKICNkZWZpbmUgcGVyX2NwdSh2YXIsIGNwdSkgIFwKICAgICAoKlJFTE9D
X0hJREUoJnBlcl9jcHVfXyMjdmFyLCBfX3Blcl9jcHVfb2Zmc2V0W2NwdV0pKQpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wZXJjcHUuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcGVy
Y3B1LmgKaW5kZXggZmYzNGRjNzg5Ny4uNWI2Y2VmMDRjNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9wZXJjcHUuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3BlcmNwdS5oCkBA
IC03LDEwICs3LDggQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX19wZXJfY3B1X29mZnNldFtOUl9D
UFVTXTsKIHZvaWQgcGVyY3B1X2luaXRfYXJlYXModm9pZCk7CiAjZW5kaWYKIAotLyogU2VwYXJh
dGUgb3V0IHRoZSB0eXBlLCBzbyAoaW50WzNdLCBmb28pIHdvcmtzLiAqLwotI2RlZmluZSBfX0RF
RklORV9QRVJfQ1BVKHR5cGUsIG5hbWUsIHN1ZmZpeCkgICAgICAgICAgICAgICAgICAgIFwKLSAg
ICBfX3NlY3Rpb24oIi5ic3MucGVyY3B1IiAjc3VmZml4KSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCi0gICAgX190eXBlb2ZfXyh0eXBlKSBwZXJfY3B1XyMjbmFtZQorI2RlZmluZSBfX0RF
RklORV9QRVJfQ1BVKGF0dHIsIHR5cGUsIG5hbWUpIFwKKyAgICBhdHRyIF9fdHlwZW9mX18odHlw
ZSkgcGVyX2NwdV8gIyMgbmFtZQogCiAvKiB2YXIgaXMgaW4gZGlzY2FyZGVkIHJlZ2lvbjogb2Zm
c2V0IHRvIHBhcnRpY3VsYXIgY29weSB3ZSB3YW50ICovCiAjZGVmaW5lIHBlcl9jcHUodmFyLCBj
cHUpICBcCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGVyY3B1LmggYi94ZW4vaW5jbHVk
ZS94ZW4vcGVyY3B1LmgKaW5kZXggYWVlYzVjMTlkNi4uNzFhMzFjYzM2MSAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaApA
QCAtOSw5ICs5LDE1IEBACiAgKiBUaGUgXyMjbmFtZSBjb25jYXRlbmF0aW9uIGlzIGJlaW5nIHVz
ZWQgaGVyZSB0byBwcmV2ZW50ICduYW1lJyBmcm9tIGdldHRpbmcKICAqIG1hY3JvIGV4cGFuZGVk
LCB3aGlsZSBzdGlsbCBhbGxvd2luZyBhIHBlci1hcmNoaXRlY3R1cmUgc3ltYm9sIG5hbWUgcHJl
Zml4LgogICovCi0jZGVmaW5lIERFRklORV9QRVJfQ1BVKHR5cGUsIG5hbWUpIF9fREVGSU5FX1BF
Ul9DUFUodHlwZSwgXyMjbmFtZSwgKQorI2RlZmluZSBERUZJTkVfUEVSX0NQVSh0eXBlLCBuYW1l
KSBcCisgICAgX19ERUZJTkVfUEVSX0NQVShfX3NlY3Rpb24oIi5ic3MucGVyY3B1IiksIHR5cGUs
IF8gIyMgbmFtZSkKKworI2RlZmluZSBERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQodHlwZSwg
bmFtZSkgXAorICAgIF9fREVGSU5FX1BFUl9DUFUoX19zZWN0aW9uKCIuYnNzLnBlcmNwdS5wYWdl
X2FsaWduZWQiKSBcCisgICAgICAgICAgICAgICAgICAgICBfX2FsaWduZWQoUEFHRV9TSVpFKSwg
dHlwZSwgXyAjIyBuYW1lKQorCiAjZGVmaW5lIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHR5
cGUsIG5hbWUpIFwKLQlfX0RFRklORV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUsIC5yZWFkX21vc3Rs
eSkKKyAgICBfX0RFRklORV9QRVJfQ1BVKF9fc2VjdGlvbigiLmJzcy5wZXJjcHUucmVhZF9tb3N0
bHkiKSwgdHlwZSwgXyAjIyBuYW1lKQogCiAjZGVmaW5lIGdldF9wZXJfY3B1X3Zhcih2YXIpICAo
cGVyX2NwdV9fIyN2YXIpCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
