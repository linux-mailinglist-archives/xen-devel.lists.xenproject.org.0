Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED733AE9F9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7etN-0007lK-Kr; Tue, 10 Sep 2019 12:05:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7etL-0007kg-JK
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:05:03 +0000
X-Inumbo-ID: 3815b160-d3c3-11e9-ac1c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3815b160-d3c3-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=sPtNd27qcB6TMmp6yZqoE+yUHBVkWI0BjraPfYgwm9Y=;
 b=ewFXQ5BflwpdrWCY2JLkbhvlQF0SVXfmgm4+ySeEmDj0Yi5BOgKRehjB
 CF0zenie/BKVCrzIcuktUiW52qu5pgmf7u4u6nWghiqynyzCWZUMNHSt8
 OkLEKT9y+mH8G1i9OQNVkiJ7xQrZ8AeWLbqwS64RI5wI/Gn5N87aADf60 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TyB1f8yPNnwMDyIKpCYljaEKi8JgXtiPDgXCE3gOc/MX8iQte6alCZ0CoyRol+0AMv5eDzynFA
 OMJOVwKyQauOvjsVa5J56rkdsTUvKtwx9FYrG4QoKOQS6EJi4KoLY3oxkffNJ+MaCCWzLpxS4U
 qJMox5Sf9nrj2ZUwvzXg9/deFrk3plynDoAVMM3Pe2eZgpy941/J+ygBwJz0l+6eTHOnwdxzzu
 vsvFGN1iSvHiUWI8C4xUphyy6FxlPyom9JEo7FjgK6iEL9Rut2MbQDEKf5kdL+cbr/jqdH9FRX
 6T8=
X-SBRS: 2.7
X-MesageID: 5650090
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5650090"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:04 +0100
Message-ID: <20190910120207.10358-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 09/12] tools/ocaml: Reformat
 domain_create_flag
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoaXMgd2ls
bCBhbGxvdyB1cyB0byBhcHBseSB0aGUgYWJpIGNoZWNrZXIgc29vbi4KCk5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sICB8IDQgKysrLQogdG9v
bHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsLm1sIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sCmluZGV4
IDA5N2YzOWQ1Y2UuLjE3MTc0ZGViYjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybC5tbAorKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwKQEAgLTU3LDcg
KzU3LDkgQEAgdHlwZSBhcmNoX2RvbWFpbmNvbmZpZyA9CiAJfCBBUk0gb2YgeGVuX2FybV9hcmNo
X2RvbWFpbmNvbmZpZwogCXwgWDg2IG9mIHhlbl94ODZfYXJjaF9kb21haW5jb25maWcKIAotdHlw
ZSBkb21haW5fY3JlYXRlX2ZsYWcgPSBDREZfSFZNIHwgQ0RGX0hBUAordHlwZSBkb21haW5fY3Jl
YXRlX2ZsYWcgPQorCXwgQ0RGX0hWTQorCXwgQ0RGX0hBUAogCiB0eXBlIGRvbWN0bF9jcmVhdGVf
Y29uZmlnID0KIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkg
Yi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpCmluZGV4IDk1N2M5ZmRjMmUuLjIyOGJj
MDBhMWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkKKysrIGIv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQpAQCAtNTAsNyArNTAsOSBAQCB0eXBlIGFy
Y2hfZG9tYWluY29uZmlnID0KICAgfCBBUk0gb2YgeGVuX2FybV9hcmNoX2RvbWFpbmNvbmZpZwog
ICB8IFg4NiBvZiB4ZW5feDg2X2FyY2hfZG9tYWluY29uZmlnCiAKLXR5cGUgZG9tYWluX2NyZWF0
ZV9mbGFnID0gQ0RGX0hWTSB8IENERl9IQVAKK3R5cGUgZG9tYWluX2NyZWF0ZV9mbGFnID0KKyAg
fCBDREZfSFZNCisgIHwgQ0RGX0hBUAogCiB0eXBlIGRvbWN0bF9jcmVhdGVfY29uZmlnID0gewog
ICBzc2lkcmVmOiBpbnQzMjsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
