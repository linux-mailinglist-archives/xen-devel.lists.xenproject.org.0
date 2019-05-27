Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE272B4A2
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 14:15:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVETj-0008Kg-1b; Mon, 27 May 2019 12:11:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVETh-0008Kb-1u
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 12:11:45 +0000
X-Inumbo-ID: 9769f7ff-8078-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9769f7ff-8078-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 12:11:43 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Gh2BTVmagKlnF8VKfwPAidsBsJ+V4TbsKvEggIXqipM0pBgr0u2Hy1UGK/AOhjyyW7F0eWEwFS
 l1NuwauKMCtOsPNepbG2tpqHjN0RKpDD+Rt+g/dI1XwCbflEBwBNljW8MPqj8onsUsv2sQIOJL
 6La4M4L8lllQGzYlTg6pfLn/axfSic+lbQNmP1nlqWye/H63rTAsuuZ9hDhbIPCacPevGpgSYa
 XMnM2B3ZdjvSAf2Z4aWOjJKH8WC38iL7vDrxqv4JNR70rMlGRSSVD+f5MBIt2g4PdNAIIv2iK6
 gOY=
X-SBRS: 2.7
X-MesageID: 925016
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="925016"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 May 2019 14:11:38 +0200
Message-ID: <20190527121138.41800-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [Xen-devel] [BACKPORT] xen/pvh: correctly setup the PV EFI
 interface for dom0
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 PGNet Dev <pgnet.dev@gmail.com>, stable@vger.kernel.org,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y29tbWl0IDcyODEzYmZiZjAyNzZhOTdjODJhZjAzOGVmYjVmMDJkY2RkOWUzMTAgdXBzdHJlYW0K
ClRoaXMgaW52b2x2ZXMgaW5pdGlhbGl6aW5nIHRoZSBib290IHBhcmFtcyBFRkkgcmVsYXRlZCBm
aWVsZHMgYW5kIHRoZQplZmkgZ2xvYmFsIHZhcmlhYmxlLgoKV2l0aG91dCB0aGlzIGZpeCBhIFBW
SCBkb20wIGRvZXNuJ3QgZGV0ZWN0IHdoZW4gYm9vdGVkIGZyb20gRUZJLCBhbmQKdGh1cyBkb2Vz
bid0IHN1cHBvcnQgYWNjZXNzaW5nIGFueSBvZiB0aGUgRUZJIHJlbGF0ZWQgZGF0YS4KClJlcG9y
dGVkLWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRldkBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogQm9y
aXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcgIyA0LjE5KwotLS0KIGFyY2gveDg2L3hlbi9lZmkuYyAgICAgICAgICAgfCAx
MiArKysrKystLS0tLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyAgfCAgMiArLQogYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdmguYyB8ICA0ICsrKysKIGFyY2gveDg2L3hlbi94ZW4tb3Bz
LmggICAgICAgfCAgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VmaS5jIGIvYXJjaC94ODYv
eGVuL2VmaS5jCmluZGV4IDE4MDRiMjdmOTYzMi4uMzBlZGI5YmM1OGUyIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni94ZW4vZWZpLmMKKysrIGIvYXJjaC94ODYveGVuL2VmaS5jCkBAIC0xNzAsNyArMTcw
LDcgQEAgc3RhdGljIGVudW0gZWZpX3NlY3VyZWJvb3RfbW9kZSB4ZW5fZWZpX2dldF9zZWN1cmVi
b290KHZvaWQpCiAJcmV0dXJuIGVmaV9zZWN1cmVib290X21vZGVfdW5rbm93bjsKIH0KIAotdm9p
ZCBfX2luaXQgeGVuX2VmaV9pbml0KHZvaWQpCit2b2lkIF9faW5pdCB4ZW5fZWZpX2luaXQoc3Ry
dWN0IGJvb3RfcGFyYW1zICpib290X3BhcmFtcykKIHsKIAllZmlfc3lzdGVtX3RhYmxlX3QgKmVm
aV9zeXN0YWJfeGVuOwogCkBAIC0xNzksMTIgKzE3OSwxMiBAQCB2b2lkIF9faW5pdCB4ZW5fZWZp
X2luaXQodm9pZCkKIAlpZiAoZWZpX3N5c3RhYl94ZW4gPT0gTlVMTCkKIAkJcmV0dXJuOwogCi0J
c3RybmNweSgoY2hhciAqKSZib290X3BhcmFtcy5lZmlfaW5mby5lZmlfbG9hZGVyX3NpZ25hdHVy
ZSwgIlhlbiIsCi0JCQlzaXplb2YoYm9vdF9wYXJhbXMuZWZpX2luZm8uZWZpX2xvYWRlcl9zaWdu
YXR1cmUpKTsKLQlib290X3BhcmFtcy5lZmlfaW5mby5lZmlfc3lzdGFiID0gKF9fdTMyKV9fcGEo
ZWZpX3N5c3RhYl94ZW4pOwotCWJvb3RfcGFyYW1zLmVmaV9pbmZvLmVmaV9zeXN0YWJfaGkgPSAo
X191MzIpKF9fcGEoZWZpX3N5c3RhYl94ZW4pID4+IDMyKTsKKwlzdHJuY3B5KChjaGFyICopJmJv
b3RfcGFyYW1zLT5lZmlfaW5mby5lZmlfbG9hZGVyX3NpZ25hdHVyZSwgIlhlbiIsCisJCQlzaXpl
b2YoYm9vdF9wYXJhbXMtPmVmaV9pbmZvLmVmaV9sb2FkZXJfc2lnbmF0dXJlKSk7CisJYm9vdF9w
YXJhbXMtPmVmaV9pbmZvLmVmaV9zeXN0YWIgPSAoX191MzIpX19wYShlZmlfc3lzdGFiX3hlbik7
CisJYm9vdF9wYXJhbXMtPmVmaV9pbmZvLmVmaV9zeXN0YWJfaGkgPSAoX191MzIpKF9fcGEoZWZp
X3N5c3RhYl94ZW4pID4+IDMyKTsKIAotCWJvb3RfcGFyYW1zLnNlY3VyZV9ib290ID0geGVuX2Vm
aV9nZXRfc2VjdXJlYm9vdCgpOworCWJvb3RfcGFyYW1zLT5zZWN1cmVfYm9vdCA9IHhlbl9lZmlf
Z2V0X3NlY3VyZWJvb3QoKTsKIAogCXNldF9iaXQoRUZJX0JPT1QsICZlZmkuZmxhZ3MpOwogCXNl
dF9iaXQoRUZJX1BBUkFWSVJULCAmZWZpLmZsYWdzKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hl
bi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCA3ODJm
OThiMzMyZjAuLjBmOGRhNGFlYmU3YiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRl
bl9wdi5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtMTM5OSw3ICsxMzk5
LDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2
b2lkKQogCS8qIFdlIG5lZWQgdGhpcyBmb3IgcHJpbnRrIHRpbWVzdGFtcHMgKi8KIAl4ZW5fc2V0
dXBfcnVuc3RhdGVfaW5mbygwKTsKIAotCXhlbl9lZmlfaW5pdCgpOworCXhlbl9lZmlfaW5pdCgm
Ym9vdF9wYXJhbXMpOwogCiAJLyogU3RhcnQgdGhlIHdvcmxkICovCiAjaWZkZWYgQ09ORklHX1g4
Nl8zMgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYyBiL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKaW5kZXggZGFiMDc4MjdkMjVlLi5mMDRkMjJiY2YwOGQgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKKysrIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdmguYwpAQCAtMTQsNiArMTQsOCBAQAogI2luY2x1ZGUgPHhlbi9pbnRlcmZh
Y2UvbWVtb3J5Lmg+CiAjaW5jbHVkZSA8eGVuL2ludGVyZmFjZS9odm0vc3RhcnRfaW5mby5oPgog
CisjaW5jbHVkZSAieGVuLW9wcy5oIgorCiAvKgogICogUFZIIHZhcmlhYmxlcy4KICAqCkBAIC03
OSw2ICs4MSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3B2aF9ib290cGFyYW1zKHZvaWQp
CiAJcHZoX2Jvb3RwYXJhbXMuaGRyLnR5cGVfb2ZfbG9hZGVyID0gKDkgPDwgNCkgfCAwOyAvKiBY
ZW4gbG9hZGVyICovCiAKIAl4ODZfaW5pdC5hY3BpLmdldF9yb290X3BvaW50ZXIgPSBwdmhfZ2V0
X3Jvb3RfcG9pbnRlcjsKKworCXhlbl9lZmlfaW5pdCgmcHZoX2Jvb3RwYXJhbXMpOwogfQogCiAv
KgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1vcHMuaCBiL2FyY2gveDg2L3hlbi94ZW4t
b3BzLmgKaW5kZXggMGU2MGJkOTE4Njk1Li4yZjExMWY0N2JhOTggMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3hlbi94ZW4tb3BzLmgKKysrIGIvYXJjaC94ODYveGVuL3hlbi1vcHMuaApAQCAtMTIyLDkg
KzEyMiw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgeGVuX2luaXRfdmdhKGNvbnN0IHN0
cnVjdCBkb20wX3ZnYV9jb25zb2xlX2luZm8gKmluZm8sCiB2b2lkIF9faW5pdCB4ZW5faW5pdF9h
cGljKHZvaWQpOwogCiAjaWZkZWYgQ09ORklHX1hFTl9FRkkKLWV4dGVybiB2b2lkIHhlbl9lZmlf
aW5pdCh2b2lkKTsKK2V4dGVybiB2b2lkIHhlbl9lZmlfaW5pdChzdHJ1Y3QgYm9vdF9wYXJhbXMg
KmJvb3RfcGFyYW1zKTsKICNlbHNlCi1zdGF0aWMgaW5saW5lIHZvaWQgX19pbml0IHhlbl9lZmlf
aW5pdCh2b2lkKQorc3RhdGljIGlubGluZSB2b2lkIF9faW5pdCB4ZW5fZWZpX2luaXQoc3RydWN0
IGJvb3RfcGFyYW1zICpib290X3BhcmFtcykKIHsKIH0KICNlbmRpZgotLSAKMi4yMC4xIChBcHBs
ZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
