Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB733471F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 14:43:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY8k3-00025M-4f; Tue, 04 Jun 2019 12:40:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hY8k2-00025E-6r
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 12:40:38 +0000
X-Inumbo-ID: f388c54e-86c5-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f388c54e-86c5-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 12:40:36 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: iSyZ+JvwOIsFbC6ic5kUytNcmGsd1auqrxjzsz0Uy2LlVwIV6StnFeY5cJ2uL1Ae4QqeUwEgTF
 GBf33jLwJt1mw99bolE0n0WWeure+cVbek8K4LG2lCCN6nC8FGWmHWgPeCwNOis4iLa399o6kY
 mCVC9netValR/sQd9YBU+1TAGz0KMk4HIUQB6m/DIJ9eKYHN1l/H1CHcDw6wthk8TePhJvB1co
 Ls43WWYJiRsnXZpl39oZr13TiXNSX+GzjtjCh0ajKg8FlzfeeHUxUeKCfCyFgn1nvGu4FdWrWN
 DVQ=
X-SBRS: 2.7
X-MesageID: 1287738
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1287738"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 4 Jun 2019 13:40:23 +0100
Message-ID: <1559652023-26502-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/bitops: Further reduce the #ifdef-ary in
 generic_hweight64()
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

VGhpcyAjaWZkZWYtYXJ5IGlzbid0IG5lY2Vzc2FyeSwgYW5kIHRoZSBsb2dpYyBjYW4gbGl2ZSBp
biBhIHBsYWluIGlmKCkKCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2luY2x1ZGUveGVuL2Jp
dG9wcy5oIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmggYi94ZW4v
aW5jbHVkZS94ZW4vYml0b3BzLmgKaW5kZXggYjUxMjgwMC4uZGZiNzA0MSAxMDA2NDQKLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaApA
QCAtMTg0LDEwICsxODQsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZW5lcmljX2h3
ZWlnaHQ4KHVuc2lnbmVkIGludCB3KQogCiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZW5l
cmljX2h3ZWlnaHQ2NCh1aW50NjRfdCB3KQogewotI2lmIEJJVFNfUEVSX0xPTkcgPCA2NAotICAg
IHJldHVybiBnZW5lcmljX2h3ZWlnaHQzMigodW5zaWduZWQgaW50KSh3ID4+IDMyKSkgKwotICAg
ICAgICBnZW5lcmljX2h3ZWlnaHQzMigodW5zaWduZWQgaW50KXcpOwotI2Vsc2UKKyAgICBpZiAo
IEJJVFNfUEVSX0xPTkcgPCA2NCApCisgICAgICAgIHJldHVybiBnZW5lcmljX2h3ZWlnaHQzMih3
ID4+IDMyKSArIGdlbmVyaWNfaHdlaWdodDMyKHcpOworCiAgICAgdyAtPSAodyA+PiAxKSAmIDB4
NTU1NTU1NTU1NTU1NTU1NXVsOwogICAgIHcgPSAgKHcgJiAweDMzMzMzMzMzMzMzMzMzMzN1bCkg
KyAoKHcgPj4gMikgJiAweDMzMzMzMzMzMzMzMzMzMzN1bCk7CiAgICAgdyA9ICAodyArICh3ID4+
IDQpKSAmIDB4MGYwZjBmMGYwZjBmMGYwZnVsOwpAQCAtMTk5LDcgKzE5OCw2IEBAIHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgaW50IGdlbmVyaWNfaHdlaWdodDY0KHVpbnQ2NF90IHcpCiAgICAgdyAr
PSB3ID4+IDE2OwogCiAgICAgcmV0dXJuICh3ICsgKHcgPj4gMzIpKSAmIDB4RkY7Ci0jZW5kaWYK
IH0KIAogc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGh3ZWlnaHRfbG9uZyh1bnNpZ25lZCBs
b25nIHcpCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
