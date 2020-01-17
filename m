Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A162140D0A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:50:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSub-0003Wz-3r; Fri, 17 Jan 2020 14:47:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isSuZ-0003WS-M1
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:47:47 +0000
X-Inumbo-ID: 4bc8a9bc-3938-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4bc8a9bc-3938-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579272454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=X2wy6ysk6E0gl7NDpBEXElfrRoZkazsyRAbql+jxpvI=;
 b=JCWWuOcA0qdG2GChXpwXn/S+rUcXtZZoLk80nKngrbkDBgNgw31VjWkI
 yqlW4eoZ6jMS6qUFZjFGNQDwxyldQotKp5CVT3LCDPPApoMYZplxpK5DH
 TLu10MUjF4EtUpDTePZZ7HdaKwCYDnqyi1rPHvJWxigoAZHtgoBQaC/dS w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EK7U5nGz7zhdAyd3LNMJXL6tyhUIduNnq00ZEgUJY9Mss/TJ0HcyJVpR/13UreygE9t9Bre9xc
 Yfwd+Rhj2vTyjxTIQ7ewP691XDbOst3AStgJx2fDs8ucIEPE0L+hONnq4SGnTElYxTxRiCgeej
 IC0dJZB9fCkK5OCgR4ZOEzhGlOSISPSpROGCJmfzt5JybSekbHvZRnc9QM0mWXNIqaoXrAD99m
 6sodRo5MtHyhH5AGqvjLXK4hXsQRTVG/WGs5rGJz5XmBuZ+b6QVmL49sgcwxYaamato0eR61/5
 +7U=
X-SBRS: 2.7
X-MesageID: 11669886
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11669886"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 14:47:19 +0000
Message-ID: <20200117144726.582-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117144726.582-1-ian.jackson@eu.citrix.com>
References: <20200117144726.582-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 03/10] libxl: event: Introduce
 CTX_UNLOCK_EGC_FREE
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHZlcnkgY29tbW9uIGV4aXQgcGF0dGVybi4gIFdlIGFyZSBnb2luZyB0byB3YW50
IHRvIGNoYW5nZQp0aGlzIHBhdHRlcm4uICBTbyB3ZSBzaG91bGQgbWFrZSBpdCBpbnRvIGEgbWFj
cm8gb2YgaXRzIG93bi4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClRlc3RlZC1ieTogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2V2ZW50
LmMgICAgfCAxOCArKysrKystLS0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYyAg
ICAgfCAgNiArKy0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgMiArKwogMyBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9ldmVudC5jIGIvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQu
YwppbmRleCA1YjEyYTQ1ZTcwLi5iZTM3ZTEyYmIwIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9ldmVudC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2V2ZW50LmMKQEAgLTExNTIsOCAr
MTE1Miw3IEBAIGludCBsaWJ4bF9vc2V2ZW50X2JlZm9yZXBvbGwobGlieGxfY3R4ICpjdHgsIGlu
dCAqbmZkc19pbywKICAgICBDVFhfTE9DSzsKICAgICBpbnQgcmMgPSBiZWZvcmVwb2xsX2ludGVy
bmFsKGdjLCBjdHgtPnBvbGxlcl9hcHAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBuZmRzX2lvLCBmZHMsIHRpbWVvdXRfdXBkLCBub3cpOwotICAgIENUWF9VTkxPQ0s7Ci0gICAg
RUdDX0ZSRUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKICAgICByZXR1cm4gcmM7CiB9CiAK
QEAgLTEzMDUsOCArMTMwNCw3IEBAIHZvaWQgbGlieGxfb3NldmVudF9hZnRlcnBvbGwobGlieGxf
Y3R4ICpjdHgsIGludCBuZmRzLCBjb25zdCBzdHJ1Y3QgcG9sbGZkICpmZHMsCiAgICAgRUdDX0lO
SVQoY3R4KTsKICAgICBDVFhfTE9DSzsKICAgICBhZnRlcnBvbGxfaW50ZXJuYWwoZWdjLCBjdHgt
PnBvbGxlcl9hcHAsIG5mZHMsIGZkcywgbm93KTsKLSAgICBDVFhfVU5MT0NLOwotICAgIEVHQ19G
UkVFOworICAgIENUWF9VTkxPQ0tfRUdDX0ZSRUU7CiB9CiAKIC8qCkBAIC0xMzQyLDggKzEzNDAs
NyBAQCB2b2lkIGxpYnhsX29zZXZlbnRfb2NjdXJyZWRfZmQobGlieGxfY3R4ICpjdHgsIHZvaWQg
KmZvcl9saWJ4bCwKICAgICBmZF9vY2N1cnMoZWdjLCBldiwgcmV2ZW50c19pZ24pOwogCiAgb3V0
OgotICAgIENUWF9VTkxPQ0s7Ci0gICAgRUdDX0ZSRUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJF
RTsKIH0KIAogdm9pZCBsaWJ4bF9vc2V2ZW50X29jY3VycmVkX3RpbWVvdXQobGlieGxfY3R4ICpj
dHgsIHZvaWQgKmZvcl9saWJ4bCkKQEAgLTEzNjUsOCArMTM2Miw3IEBAIHZvaWQgbGlieGxfb3Nl
dmVudF9vY2N1cnJlZF90aW1lb3V0KGxpYnhsX2N0eCAqY3R4LCB2b2lkICpmb3JfbGlieGwpCiAg
ICAgdGltZV9vY2N1cnMoZWdjLCBldiwgRVJST1JfVElNRURPVVQpOwogCiAgb3V0OgotICAgIENU
WF9VTkxPQ0s7Ci0gICAgRUdDX0ZSRUU7CisgICAgQ1RYX1VOTE9DS19FR0NfRlJFRTsKIH0KIAog
dm9pZCBsaWJ4bF9fZXZlbnRfZGlzYXN0ZXIobGlieGxfX2VnYyAqZWdjLCBjb25zdCBjaGFyICpt
c2csIGludCBlcnJub3ZhbCwKQEAgLTE1NDYsOCArMTU0Miw3IEBAIGludCBsaWJ4bF9ldmVudF9j
aGVjayhsaWJ4bF9jdHggKmN0eCwgbGlieGxfZXZlbnQgKipldmVudF9yLAogICAgIEVHQ19JTklU
KGN0eCk7CiAgICAgQ1RYX0xPQ0s7CiAgICAgaW50IHJjID0gZXZlbnRfY2hlY2tfaW50ZXJuYWwo
ZWdjLCBldmVudF9yLCB0eXBlbWFzaywgcHJlZCwgcHJlZF91c2VyKTsKLSAgICBDVFhfVU5MT0NL
OwotICAgIEVHQ19GUkVFOworICAgIENUWF9VTkxPQ0tfRUdDX0ZSRUU7CiAgICAgcmV0dXJuIHJj
OwogfQogCkBAIC0xNzcyLDggKzE3NjcsNyBAQCBpbnQgbGlieGxfZXZlbnRfd2FpdChsaWJ4bF9j
dHggKmN0eCwgbGlieGxfZXZlbnQgKipldmVudF9yLAogIG91dDoKICAgICBsaWJ4bF9fcG9sbGVy
X3B1dChjdHgsIHBvbGxlcik7CiAKLSAgICBDVFhfVU5MT0NLOwotICAgIEVHQ19GUkVFOworICAg
IENUWF9VTkxPQ0tfRUdDX0ZSRUU7CiAgICAgcmV0dXJuIHJjOwogfQogCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9mb3JrLmMgYi90b29scy9saWJ4bC9saWJ4bF9mb3JrLmMKaW5kZXgg
MGYxYjZiNTE4Yy4uY2YxNzBiOTA4NSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZm9y
ay5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ZvcmsuYwpAQCAtNDgzLDggKzQ4Myw3IEBAIGlu
dCBsaWJ4bF9jaGlsZHByb2NfcmVhcGVkKGxpYnhsX2N0eCAqY3R4LCBwaWRfdCBwaWQsIGludCBz
dGF0dXMpCiAgICAgYXNzZXJ0KENUWC0+Y2hpbGRwcm9jX2hvb2tzLT5jaGxkb3duZXIKICAgICAg
ICAgICAgPT0gbGlieGxfc2lnY2hsZF9vd25lcl9tYWlubG9vcCk7CiAgICAgaW50IHJjID0gY2hp
bGRwcm9jX3JlYXBlZChlZ2MsIHBpZCwgc3RhdHVzKTsKLSAgICBDVFhfVU5MT0NLOwotICAgIEVH
Q19GUkVFOworICAgIENUWF9VTkxPQ0tfRUdDX0ZSRUU7CiAgICAgcmV0dXJuIHJjOwogfQogCkBA
IC01MjksOCArNTI4LDcgQEAgdm9pZCBsaWJ4bF9jaGlsZHByb2Nfc2lnY2hsZF9vY2N1cnJlZChs
aWJ4bF9jdHggKmN0eCkKICAgICBhc3NlcnQoQ1RYLT5jaGlsZHByb2NfaG9va3MtPmNobGRvd25l
cgogICAgICAgICAgICA9PSBsaWJ4bF9zaWdjaGxkX293bmVyX21haW5sb29wKTsKICAgICBjaGls
ZHByb2NfY2hlY2thbGwoZWdjKTsKLSAgICBDVFhfVU5MT0NLOwotICAgIEVHQ19GUkVFOworICAg
IENUWF9VTkxPQ0tfRUdDX0ZSRUU7CiB9CiAKIHN0YXRpYyB2b2lkIHNpZ2NobGRfc2VsZnBpcGVf
aGFuZGxlcihsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9mZCAqZXYsCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aAppbmRleCA1ODFkNjRiOTljLi45ODNmZmZhYzdhIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTIz
NjMsNiArMjM2Myw4IEBAIF9oaWRkZW4gdm9pZCBsaWJ4bF9fZWdjX2NsZWFudXAobGlieGxfX2Vn
YyAqZWdjKTsKIAogI2RlZmluZSBFR0NfRlJFRSAgICAgICAgICAgbGlieGxfX2VnY19jbGVhbnVw
KGVnYykKIAorI2RlZmluZSBDVFhfVU5MT0NLX0VHQ19GUkVFICBkb3sgQ1RYX1VOTE9DSzsgRUdD
X0ZSRUU7IH13aGlsZSgwKQorCiAKIC8qCiAgKiBNYWNoaW5lcnkgZm9yIGFzeW5jaHJvbm91cyBv
cGVyYXRpb25zICgiYW8iKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
