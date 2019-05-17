Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35A21DE2
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 20:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRhvn-0007Zt-EV; Fri, 17 May 2019 18:50:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRhvm-0007Zo-6R
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 18:50:10 +0000
X-Inumbo-ID: 978203d1-78d4-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 978203d1-78d4-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 18:50:08 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 1KQeCDeeolCnUzrmkaecI4FbegBNN4q4iiFvlSO42zwlNBV07LV2jECCidgzDru4Z0ZTfBnHid
 l+UG4n29iKUGOJVpxaf+7m4aqX+G+adQ+ehjY7rASzmX0d1ZjYbOxKLoXNhTKSdQGlbD6WcOtG
 uXXWADDUqRaLiQ/vAdyZ1jrDZBjeQlVLiShDwk3/BNfZuwTNkM96uYOAqcRSJDn421Zd7/+wML
 K96jkvdrEFd8YPn4bRMx6byFrC05evOMx2sqfE71y6l4uMPhqRIp01o4Chg7xTSuIntg1MoXc4
 z2c=
X-SBRS: 2.7
X-MesageID: 574484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,481,1549947600"; 
   d="scan'208";a="574484"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 May 2019 19:50:05 +0100
Message-ID: <1558119005-30941-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/spec-ctrl: Knights Landing/Mill are
 retpoline-safe
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhleSBhcmUgYm90aCBBaXJtb250LWJhc2VkIGFuZCBzaG91bGQgaGF2ZSBiZWVuIGluY2x1ZGVk
IGluIGMvcyAxN2Y3NDI0MmNjZgoieDg2L3NwZWMtY3RybDogRXh0ZW5kIHJlcG9saW5lIHNhZmV5
IGNhbGN1YXRpb25zIGZvciBlSUJSUyBhbmQgQXRvbSBwYXJ0cyIuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc3BlY19jdHJsLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jIGIveGVuL2FyY2gveDg2L3Nw
ZWNfY3RybC5jCmluZGV4IDVkOThjYWMuLmU2Njg3OWYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9zcGVjX2N0cmwuYworKysgYi94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKQEAgLTUyNCw5ICs1
MjQsMTEgQEAgc3RhdGljIGJvb2wgX19pbml0IHJldHBvbGluZV9zYWZlKHVpbnQ2NF90IGNhcHMp
CiAgICAgY2FzZSAweDRkOiAvKiBBdmF0b24gLyBSYW5nZWx5IChTaWx2ZXJtb250KSAqLwogICAg
IGNhc2UgMHg0YzogLyogQ2hlcnJ5dHJhaWwgLyBCcmFzc3dlbGwgKi8KICAgICBjYXNlIDB4NGE6
IC8qIE1lcnJpZmllbGQgKi8KKyAgICBjYXNlIDB4NTc6IC8qIEtuaWdodHMgTGFuZGluZyAqLwog
ICAgIGNhc2UgMHg1YTogLyogTW9vcmVmaWVsZCAqLwogICAgIGNhc2UgMHg1YzogLyogR29sZG1v
bnQgKi8KICAgICBjYXNlIDB4NWY6IC8qIERlbnZlcnRvbiAqLworICAgIGNhc2UgMHg4NTogLyog
S25pZ2h0cyBNaWxsICovCiAgICAgICAgIHJldHVybiB0cnVlOwogCiAgICAgZGVmYXVsdDoKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
