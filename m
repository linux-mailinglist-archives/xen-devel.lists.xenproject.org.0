Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078BE772CC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 22:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr6tI-0007Sy-V0; Fri, 26 Jul 2019 20:32:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr6tH-0007SW-HC
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 20:32:35 +0000
X-Inumbo-ID: 7e19cbc2-afe4-11e9-8917-c7450cf3864c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e19cbc2-afe4-11e9-8917-c7450cf3864c;
 Fri, 26 Jul 2019 20:32:31 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PVt+kn7h/xaBMPM/m/+Ceu4Jtz8PaUwqv88cYkgqzdoKuiH6vuKJH7dLvzewTR1c7puLNC7Th5
 PbZCoQfZLfW6SK9eEMaar3gdIJuifCVGXPvZzI+aee0fu9Hewi98r78F7xvgw5rJ0R8N/P60gM
 WUX8lKaailVDLVFmb4yMiEaVFRDSPFyspYNjeZVrNA38NK4KJvGmD5pZg7OQO7m+/MJxHye1RM
 l//fA9VsoSGUZ+yvOKRfugOZr/I0Eq3wsYSFOyj1O/fS2V6QSy+ts4kMTVXDDrhFKkOTKTm+y/
 w6k=
X-SBRS: 2.7
X-MesageID: 3595794
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,312,1559534400"; 
   d="scan'208";a="3595794"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 21:32:22 +0100
Message-ID: <20190726203222.4833-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190726203222.4833-1-andrew.cooper3@citrix.com>
References: <20190726203222.4833-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFhQVEkgd29yayByZXN0cmljdGVkIHRoZSB2aXNpYmlsaXR5IG9mIG1vc3Qgb2YgbWVtb3J5
LCBidXQgbWlzc2VkIGEgZmV3CmFzcGVjdHMgd2hlbiBpdCBjYW1lIHRvIHRoZSBUU1MuCgpHaXZl
biB0aGF0IHRoZSBUU1MgaXMganVzdCBhbiBvYmplY3QgaW4gcGVyY3B1IGRhdGEsIHRoZSA0ayBt
YXBwaW5nIGZvciBpdApjcmVhdGVkIGluIHNldHVwX2NwdV9yb290X3BndCgpIG1hcHMgYWRqYWNl
bnQgcGVyY3B1IGRhdGEsIG1ha2luZyBpdCBhbGwKbGVha2FibGUgdmlhIE1lbHRkb3duLCBldmVu
IHdoZW4gWFBUSSBpcyBpbiB1c2UuCgpGdXJ0aGVybW9yZSwgbm8gY2FyZSBpcyB0YWtlbiB0byBj
aGVjayB0aGF0IHRoZSBUU1MgZG9lc24ndCBjcm9zcyBhIHBhZ2UKYm91bmRhcnkuICBBcyBpdCB0
dXJucyBvdXQsIHN0cnVjdCB0c3Nfc3RydWN0IGlzIGFsaWduZWQgb24gaXRzIHNpemUgd2hpY2gK
ZG9lcyBwcmV2ZW50IGl0IHN0cmFkZGxpbmcgYSBwYWdlIGJvdW5kYXJ5LCBidXQgdGhpcyB3aWxs
IGNlYXNlIHRvIGJlIHRydWUKb25jZSBDRVQgYW5kIFNoYWRvdyBTdGFjayBzdXBwb3J0IGlzIGFk
ZGVkIHRvIFhlbi4KCk1vdmUgdGhlIFRTUyBpbnRvIHRoZSBwYWdlIGFsaWduZWQgcGVyY3B1IGFy
ZWEsIHNvIG5vIGFkamFjZW50IGRhdGEgY2FuIGJlCmxlYWtlZC4gIE1vdmUgdGhlIGRlZmluaXRp
b24gZnJvbSBzZXR1cC5jIHRvIHRyYXBzLmMsIHdoaWNoIGlzIGEgbW9yZQphcHByb3ByaWF0ZSBw
bGFjZSBmb3IgaXQgdG8gbGl2ZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKdjI6CiAqIFJlYmFzZSBvdmVyIGNoYW5nZXMgdG8gaW5jbHVkZSBf
X2FsaWduZWQoKSB3aXRoaW4KICAgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKCkKICogRHJv
cCBub3ctdW51c2VkIHhlbi9wZXJjcHUuaCBmcm9tIHNldHVwLmMKLS0tCiB4ZW4vYXJjaC94ODYv
c2V0dXAuYyAgICAgICAgICAgIHwgMyAtLS0KIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAg
ICAgfCA2ICsrKysrKwogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgICAgICB8IDIgKysKIHhl
bi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IGQyMDExOTEwZmEuLmY5ZDM4
MTU1ZDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCkBAIC0xNiw3ICsxNiw2IEBACiAjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+
CiAjaW5jbHVkZSA8eGVuL3ZlcnNpb24uaD4KICNpbmNsdWRlIDx4ZW4vZ2Ric3R1Yi5oPgotI2lu
Y2x1ZGUgPHhlbi9wZXJjcHUuaD4KICNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+CiAjaW5jbHVk
ZSA8eGVuL2tleWhhbmRsZXIuaD4KICNpbmNsdWRlIDx4ZW4vbnVtYS5oPgpAQCAtMTAwLDggKzk5
LDYgQEAgdW5zaWduZWQgbG9uZyBfX3JlYWRfbW9zdGx5IHhlbl9waHlzX3N0YXJ0OwogCiB1bnNp
Z25lZCBsb25nIF9fcmVhZF9tb3N0bHkgeGVuX3ZpcnRfZW5kOwogCi1ERUZJTkVfUEVSX0NQVShz
dHJ1Y3QgdHNzX3N0cnVjdCwgaW5pdF90c3MpOwotCiBjaGFyIF9fc2VjdGlvbigiLmJzcy5zdGFj
a19hbGlnbmVkIikgX19hbGlnbmVkKFNUQUNLX1NJWkUpCiAgICAgY3B1MF9zdGFja1tTVEFDS19T
SVpFXTsKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RyYXBzLmMgYi94ZW4vYXJjaC94ODYv
dHJhcHMuYwppbmRleCAzOGQxMjAxM2RiLi5kZTNhYzEzNWY1IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwpAQCAtMTA4LDYgKzEwOCwx
MiBAQCBpZHRfZW50cnlfdCBfX3NlY3Rpb24oIi5ic3MucGFnZV9hbGlnbmVkIikgX19hbGlnbmVk
KFBBR0VfU0laRSkKIC8qIFBvaW50ZXIgdG8gdGhlIElEVCBvZiBldmVyeSBDUFUuICovCiBpZHRf
ZW50cnlfdCAqaWR0X3RhYmxlc1tOUl9DUFVTXSBfX3JlYWRfbW9zdGx5OwogCisvKgorICogVGhl
IFRTUyBpcyBzbWFsbGVyIHRoYW4gYSBwYWdlLCBidXQgd2UgZ2l2ZSBpdCBhIGZ1bGwgcGFnZSB0
byBhdm9pZAorICogYWRqYWNlbnQgcGVyLWNwdSBkYXRhIGxlYWtpbmcgdmlhIE1lbHRkb3duIHdo
ZW4gWFBUSSBpcyBpbiB1c2UuCisgKi8KK0RFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05FRChzdHJ1
Y3QgdHNzX3N0cnVjdCwgaW5pdF90c3MpOworCiBib29sICgqaW9lbXVsX2hhbmRsZV9xdWlyayko
CiAgICAgdTggb3Bjb2RlLCBjaGFyICppb19lbXVsX3N0dWIsIHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKTsKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMKaW5kZXggYjhhMmVhNDI1OS4uYzgyZTFlNTA0YSAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0z
NjgsNiArMzY4LDggQEAgQVNTRVJUKElTX0FMSUdORUQoX18yTV9yd2RhdGFfZW5kLCAgIFNFQ1RJ
T05fQUxJR04pLCAiX18yTV9yd2RhdGFfZW5kIG1pc2FsaWduZWQKIAogQVNTRVJUKElTX0FMSUdO
RUQoY3B1MF9zdGFjaywgU1RBQ0tfU0laRSksICJjcHUwX3N0YWNrIG1pc2FsaWduZWQiKQogCitB
U1NFUlQoSVNfQUxJR05FRChwZXJfY3B1X19pbml0X3RzcywgUEFHRV9TSVpFKSwgInBlcl9jcHUo
aW5pdF90c3MpIG1pc2FsaWduZWQiKQorCiBBU1NFUlQoSVNfQUxJR05FRChfX2luaXRfYmVnaW4s
IFBBR0VfU0laRSksICJfX2luaXRfYmVnaW4gbWlzYWxpZ25lZCIpCiBBU1NFUlQoSVNfQUxJR05F
RChfX2luaXRfZW5kLCAgIFBBR0VfU0laRSksICJfX2luaXRfZW5kIG1pc2FsaWduZWQiKQogCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9wcm9jZXNzb3IuaAppbmRleCAyODYyMzIxZWVlLi5iNWJlZTk0OTMxIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvcHJvY2Vzc29yLmgKQEAgLTQxMSw3ICs0MTEsNyBAQCBzdGF0aWMgYWx3YXlzX2lubGlu
ZSB2b2lkIF9fbXdhaXQodW5zaWduZWQgbG9uZyBlYXgsIHVuc2lnbmVkIGxvbmcgZWN4KQogI2Rl
ZmluZSBJT0JNUF9CWVRFUyAgICAgICAgICAgICA4MTkyCiAjZGVmaW5lIElPQk1QX0lOVkFMSURf
T0ZGU0VUICAgIDB4ODAwMAogCi1zdHJ1Y3QgX19wYWNrZWQgX19jYWNoZWxpbmVfYWxpZ25lZCB0
c3Nfc3RydWN0IHsKK3N0cnVjdCBfX3BhY2tlZCB0c3Nfc3RydWN0IHsKICAgICB1aW50MzJfdCA6
MzI7CiAgICAgdWludDY0X3QgcnNwMCwgcnNwMSwgcnNwMjsKICAgICB1aW50NjRfdCA6NjQ7CkBA
IC00MjUsNiArNDI1LDcgQEAgc3RydWN0IF9fcGFja2VkIF9fY2FjaGVsaW5lX2FsaWduZWQgdHNz
X3N0cnVjdCB7CiAgICAgLyogUGFkcyB0aGUgVFNTIHRvIGJlIGNhY2hlbGluZS1hbGlnbmVkICh0
b3RhbCBzaXplIGlzIDB4ODApLiAqLwogICAgIHVpbnQ4X3QgX19jYWNoZWxpbmVfZmlsbGVyWzI0
XTsKIH07CitERUNMQVJFX1BFUl9DUFUoc3RydWN0IHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsKIAog
I2RlZmluZSBJU1RfTk9ORSAwVUwKICNkZWZpbmUgSVNUX0RGICAgMVVMCkBAIC00NjMsNyArNDY0
LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGRpc2FibGVfZWFjaF9pc3QoaWR0X2VudHJ5X3QgKmlk
dCkKIGV4dGVybiBpZHRfZW50cnlfdCBpZHRfdGFibGVbXTsKIGV4dGVybiBpZHRfZW50cnlfdCAq
aWR0X3RhYmxlc1tdOwogCi1ERUNMQVJFX1BFUl9DUFUoc3RydWN0IHRzc19zdHJ1Y3QsIGluaXRf
dHNzKTsKIERFQ0xBUkVfUEVSX0NQVShyb290X3BnZW50cnlfdCAqLCByb290X3BndCk7CiAKIGV4
dGVybiB2b2lkIHdyaXRlX3B0YmFzZShzdHJ1Y3QgdmNwdSAqdik7Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
