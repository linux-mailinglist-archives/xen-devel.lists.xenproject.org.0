Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4D78B83
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 14:15:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs4Vg-0006cE-No; Mon, 29 Jul 2019 12:12:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hB3/=V2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hs4Vf-0006bv-7D
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 12:12:11 +0000
X-Inumbo-ID: 175a1506-b1fa-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 175a1506-b1fa-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 12:12:10 +0000 (UTC)
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
IronPort-SDR: VkmIG/zsE2itTtiAGL2m1VcRbq5d7vVg1V33C3publY1+sM9PFPcQVKul8E30OSAAP+0vQOJTZ
 A/nVMZZhmbHctGNQAdW4cwBBbDhjH1laL6nOKO3BLBor1wGFOz1D7ChVXnbuzAdRXZ3OW4VRlW
 rN6qgETf1GsL3yUoGkfN97619QGuf82ZhRtEp9EuJvUUj9/xFXr5VtNOy9Z+jR4Gg5jc3m69Hi
 eF9Yc4CkcrJsOrjQKHYxImlAZiKohXmzHdu7n+GIf+jVPVR3rRBkZ8aE/1RJExj+dnlAy6lhHx
 7NY=
X-SBRS: 2.7
X-MesageID: 3672662
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3672662"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 13:11:57 +0100
Message-ID: <20190729121204.13559-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190729121204.13559-1-andrew.cooper3@citrix.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 03/10] xen/nodemask: Drop any_online_node()
 and first_unset_node()
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

VGhlc2UgaGF2ZSBuZXZlciBiZWVuIHVzZWQgaW4gWGVuLCBhbmQgaXQgaXMgdW5saWtlbHkgdGhh
dCB0aGV5IHdvdWxkIGJlCnVzZWZ1bCBpbiB0aGUgZnV0dXJlLgoKYW55X29ubGluZV9jcHUoKSB3
YXMgZHJvcHBlZCBieSBjL3MgMjJiZGNlMWMwNDggImVsaW1pbmF0ZSBmaXJzdF9jcHUoKSBldGMi
CmJ1dCB0aGUgQVBJIGNvbW1lbnQgd2FzIGxlZnQgaW4gcGxhY2UuICBEcm9wIHRoYXQgdG9vLgoK
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15
cl9CYWJjaHVrQGVwYW0uY29tPgoKdjM6CiAqIE5ldwotLS0KIHhlbi9pbmNsdWRlL3hlbi9jcHVt
YXNrLmggIHwgIDIgLS0KIHhlbi9pbmNsdWRlL3hlbi9ub2RlbWFzay5oIHwgMjAgLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUveGVuL2NwdW1hc2suaCBiL3hlbi9pbmNsdWRlL3hlbi9jcHVtYXNrLmgK
aW5kZXggNmJlOTU2N2U5ZS4uOTQ0OGY1YzZmOCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVu
L2NwdW1hc2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1bWFzay5oCkBAIC01MCw4ICs1MCw2
IEBACiAgKiBpbnQgY3B1X3Bvc3NpYmxlKGNwdSkJCUlzIHNvbWUgY3B1IHBvc3NpYmxlPwogICog
aW50IGNwdV9wcmVzZW50KGNwdSkJCQlJcyBzb21lIGNwdSBwcmVzZW50IChjYW4gc2NoZWR1bGUp
PwogICoKLSAqIGludCBhbnlfb25saW5lX2NwdShtYXNrKQkJRmlyc3Qgb25saW5lIGNwdSBpbiBt
YXNrLCBvciBOUl9DUFVTCi0gKgogICogZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkJCWZvci1s
b29wIGNwdSBvdmVyIGNwdV9wb3NzaWJsZV9tYXAKICAqIGZvcl9lYWNoX29ubGluZV9jcHUoY3B1
KQkJZm9yLWxvb3AgY3B1IG92ZXIgY3B1X29ubGluZV9tYXAKICAqIGZvcl9lYWNoX3ByZXNlbnRf
Y3B1KGNwdSkJCWZvci1sb29wIGNwdSBvdmVyIGNwdV9wcmVzZW50X21hcApkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUveGVuL25vZGVtYXNrLmggYi94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaApp
bmRleCA1ZWViYzJjNWVlLi5jMjhkZDNjNzY4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bm9kZW1hc2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vbm9kZW1hc2suaApAQCAtMzMsOCArMzMs
NiBAQAogICogaW50IGZpcnN0X25vZGUobWFzaykJCQlOdW1iZXIgbG93ZXN0IHNldCBiaXQsIG9y
IE1BWF9OVU1OT0RFUwogICogaW50IG5leHRfbm9kZShub2RlLCBtYXNrKQkJTmV4dCBub2RlIHBh
c3QgJ25vZGUnLCBvciBNQVhfTlVNTk9ERVMKICAqIGludCBsYXN0X25vZGUobWFzaykJCQlOdW1i
ZXIgaGlnaGVzdCBzZXQgYml0LCBvciBNQVhfTlVNTk9ERVMKLSAqIGludCBmaXJzdF91bnNldF9u
b2RlKG1hc2spCQlGaXJzdCBub2RlIG5vdCBzZXQgaW4gbWFzaywgb3IgCi0gKgkJCQkJTUFYX05V
TU5PREVTLgogICogaW50IGN5Y2xlX25vZGUobm9kZSwgbWFzaykJCU5leHQgbm9kZSBjeWNsaW5n
IGZyb20gJ25vZGUnLCBvcgogICoJCQkJCU1BWF9OVU1OT0RFUwogICoKQEAgLTQ5LDggKzQ3LDYg
QEAKICAqCiAgKiBpbnQgbm9kZV9vbmxpbmUobm9kZSkJCUlzIHNvbWUgbm9kZSBvbmxpbmU/CiAg
KgotICogaW50IGFueV9vbmxpbmVfbm9kZShtYXNrKQkJRmlyc3Qgb25saW5lIG5vZGUgaW4gbWFz
awotICoKICAqIG5vZGVfc2V0X29ubGluZShub2RlKQkJc2V0IGJpdCAnbm9kZScgaW4gbm9kZV9v
bmxpbmVfbWFwCiAgKiBub2RlX3NldF9vZmZsaW5lKG5vZGUpCQljbGVhciBiaXQgJ25vZGUnIGlu
IG5vZGVfb25saW5lX21hcAogICoKQEAgLTIyNCwxMyArMjIwLDYgQEAgc3RhdGljIGlubGluZSBp
bnQgX19sYXN0X25vZGUoY29uc3Qgbm9kZW1hc2tfdCAqc3JjcCwgaW50IG5iaXRzKQogCW07CQkJ
CQkJCQlcCiB9KQogCi0jZGVmaW5lIGZpcnN0X3Vuc2V0X25vZGUobWFzaykgX19maXJzdF91bnNl
dF9ub2RlKCYobWFzaykpCi1zdGF0aWMgaW5saW5lIGludCBfX2ZpcnN0X3Vuc2V0X25vZGUoY29u
c3Qgbm9kZW1hc2tfdCAqbWFza3ApCi17Ci0JcmV0dXJuIG1pbl90KGludCxNQVhfTlVNTk9ERVMs
Ci0JCQlmaW5kX2ZpcnN0X3plcm9fYml0KG1hc2twLT5iaXRzLCBNQVhfTlVNTk9ERVMpKTsKLX0K
LQogI2RlZmluZSBjeWNsZV9ub2RlKG4sIHNyYykgX19jeWNsZV9ub2RlKChuKSwgJihzcmMpLCBN
QVhfTlVNTk9ERVMpCiBzdGF0aWMgaW5saW5lIGludCBfX2N5Y2xlX25vZGUoaW50IG4sIGNvbnN0
IG5vZGVtYXNrX3QgKm1hc2twLCBpbnQgbmJpdHMpCiB7CkBAIC0yOTMsMTUgKzI4Miw2IEBAIGV4
dGVybiBub2RlbWFza190IG5vZGVfb25saW5lX21hcDsKICNkZWZpbmUgbm9kZV9vbmxpbmUobm9k
ZSkJKChub2RlKSA9PSAwKQogI2VuZGlmCiAKLSNkZWZpbmUgYW55X29ubGluZV9ub2RlKG1hc2sp
CQkJXAotKHsJCQkJCQlcCi0JaW50IG5vZGU7CQkJCVwKLQlmb3JfZWFjaF9ub2RlX21hc2sobm9k
ZSwgKG1hc2spKQlcCi0JCWlmIChub2RlX29ubGluZShub2RlKSkJCVwKLQkJCWJyZWFrOwkJCVwK
LQlub2RlOwkJCQkJXAotfSkKLQogI2RlZmluZSBub2RlX3NldF9vbmxpbmUobm9kZSkJICAgc2V0
X2JpdCgobm9kZSksIG5vZGVfb25saW5lX21hcC5iaXRzKQogI2RlZmluZSBub2RlX3NldF9vZmZs
aW5lKG5vZGUpCSAgIGNsZWFyX2JpdCgobm9kZSksIG5vZGVfb25saW5lX21hcC5iaXRzKQogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
