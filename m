Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A572DD620
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2019 04:07:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLe71-0001lq-CS; Sat, 19 Oct 2019 02:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cTED=YM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iLe6z-0001lj-UR
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2019 02:04:57 +0000
X-Inumbo-ID: d8ee5082-f214-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8ee5082-f214-11e9-beca-bc764e2007e4;
 Sat, 19 Oct 2019 02:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571450696;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=TxkAGDjXc3aXshCnPYV8lbHKFLiR8MStaxa8anlu3c4=;
 b=ia0YNkWKYB2LSYkQpXpZ6ta0UtjNbbGVLHhx1ej78aGdO6lUDIo3c4eG
 nzn/emvwiApCvG3r2PzEMcIfj/nHIp+YxhV3mIxEZXwEEodI+4u38OV1n
 5WHEZDdYYhfjhiOB+R/5cczGjsQG17ZdZH2xfQTFKGKv38zFX0YXkJ/jL E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i+2tUx6lf32m9T4PdVUBz6tM1AT1fzv1EIgniCaOOf8dTxAxYPXVSCFCSc9dY0q5R0p3+8OECC
 pNGQnMNdD5ViHBxGMZh1jKtUVcUkj0MeXRgq8iwPcUjlTQu71Z+XILv7XCsvsl3b/Rjsdv9gbY
 QBQGCz21uJwTmf/o76N2ku7jqH/7eD0xgkhw99ZlXliD8Y6meJxZ6/F5+qu37N/YBrWZMN32Xl
 wC9/9zpIOfesSej+bjMRi7xfbcFiGxYhCGI8bhLaWO/sBvn4dQ4RupiXvyBBXmGuL7IrXpXQx0
 M2k=
X-SBRS: 2.7
X-MesageID: 7473740
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,313,1566878400"; 
   d="scan'208";a="7473740"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Sat, 19 Oct 2019 03:04:52 +0100
Message-ID: <20191019020452.8944-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] MAINTAINERS: Switch SVM maintainership to x86
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIG5vdyBkb3duIHRvIDAgU1ZNIG1haW50YWluZXJzIHdobyBhcmUgYWN0aXZlIGFuZCB3
aXNoIHRvIGhvbGQgdGhlCnBvc2l0aW9uLiAgSW4gYWdyZWVtZW50IHdpdGggQU1ELCBKYW4gYW5k
IEkgd2lsbCB0YWtlIG92ZXIgbWFpbnRhaW5lcnNoaXAgaW4KdGhlIHNob3J0IHRlcm0uCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KLS0tCkND
OiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogTGFycyBLdXJ0aCA8bGFycy5r
dXJ0aEBjaXRyaXguY29tPgoKdjI6CiAqIEFsdGVyIGV4aXN0aW5nIG1haW50YWluZXJzaGlwIGJs
b2NrcywgcmF0aGVyIHRoYW4gZm9sZGluZyB0aGUgYmxvY2tzCiAgIGNvbXBsZXRlbHkuCi0tLQog
TUFJTlRBSU5FUlMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwpp
bmRleCA1MzNjZmRjMDhmLi5jMWI5MGM0MGNiIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysg
Yi9NQUlOVEFJTkVSUwpAQCAtMTQ4LDEzICsxNDgsMTQgQEAgRjoJeGVuL2luY2x1ZGUvYWNwaS8K
IEY6CXRvb2xzL2xpYmFjcGkvCiAKIEFNRCBJT01NVQotTToJU3VyYXZlZSBTdXRoaWt1bHBhbml0
IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KK006CUphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KK006CUFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CiBTOglNYWludGFpbmVkCiBGOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvCiAKIEFNRCBT
Vk0KLU06CUJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Ci1NOglT
dXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgorTToJ
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgorTToJQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KIFM6CVN1cHBvcnRlZAogRjoJeGVuL2FyY2gveDg2L2h2bS9z
dm0vCiBGOgl4ZW4vYXJjaC94ODYvY3B1L3ZwbXVfYW1kLmMKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
