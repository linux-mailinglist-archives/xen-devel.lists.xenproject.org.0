Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7F04EA8B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:26:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKSc-0008Ff-2n; Fri, 21 Jun 2019 14:24:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKSa-0008FJ-DM
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:24:12 +0000
X-Inumbo-ID: 3cd09e26-9430-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3cd09e26-9430-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:24:11 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S/MP1bsxVWJTRNJS/9/40pVrjn8I/1YkAy965baEct3whNqluVgU6ySQIxssFyekraOHt3EcWj
 7R5Z61tX1GdPKnwOtFxIXe+FNyu/Ld38Mit1SefOIDa5yIH5unhsDpMTUFYSKf49Uer4d+LrYh
 Ir8lUBYrkVYe1PihubSypz3WwikrQJOIcSm/4HmoubYbFdMhekC6IT7xCdG2kfA0FcVNnrNo61
 MEhEdXyK+8HiAHlMu8tJMuoSg6VbwsuXMCTK/oHaEIwCjpTV/nulG7q4VZzHA0UZ26I+nn3wWM
 k4o=
X-SBRS: 2.7
X-MesageID: 2062672
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2062672"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:52 +0100
Message-ID: <20190621142258.1543-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
References: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 2/8] mg-transient-task: Put the ownd
 fd on a high fd, say, 114
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhdm9pZHMgY2xhc2hlcyB3aXRoIG90aGVyIHNoZWxsIHNjcmlwdHMnIGV0Yy4gZmRzLgoK
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQp2MjogTmV3IHBhdGNoCi0tLQogbWctdHJhbnNpZW50LXRhc2sgICAgICAgfCA1ICsrKystCiB0
Y2wvSm9iREItRXhlY3V0aXZlLnRjbCB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZy10cmFuc2llbnQtdGFzayBiL21n
LXRyYW5zaWVudC10YXNrCmluZGV4IDJiM2IzMTVlLi5jZTUxODBmZiAxMDA3NTUKLS0tIGEvbWct
dHJhbnNpZW50LXRhc2sKKysrIGIvbWctdHJhbnNpZW50LXRhc2sKQEAgLTIyLDcgKzIyLDEwIEBA
IHBhY2thZ2UgcmVxdWlyZSBUY2x4CiAKIHNvdXJjZSAuL3RjbC9kYWVtb25saWIudGNsCiAKLWpv
YmRiOjpiZWNvbWUtdGFzayBbc3RyaW5nIHJhbmdlICIkYXJndiIgMCA1MF0KK3NldCBvd25lcnF1
ZXVlIFtqb2JkYjo6YmVjb21lLXRhc2sgW3N0cmluZyByYW5nZSAiJGFyZ3YiIDAgNTBdXQorZHVw
ICRvd25lcnF1ZXVlIGZpbGUxMTQKK2Nsb3NlICRvd25lcnF1ZXVlCisKIGV4ZWMgMj5AIHN0ZGVy
ciBwZXJsIC1JLiAtZSB7CiAgICAgICAgIHVzZSBPc3N0ZXN0OwogICAgICAgICB1c2UgT3NzdGVz
dDo6RXhlY3V0aXZlOwpkaWZmIC0tZ2l0IGEvdGNsL0pvYkRCLUV4ZWN1dGl2ZS50Y2wgYi90Y2wv
Sm9iREItRXhlY3V0aXZlLnRjbAppbmRleCA0ZjM0MDlhOS4uNTZiNjE4MjUgMTAwNjQ0Ci0tLSBh
L3RjbC9Kb2JEQi1FeGVjdXRpdmUudGNsCisrKyBiL3RjbC9Kb2JEQi1FeGVjdXRpdmUudGNsCkBA
IC00MzUsNiArNDM1LDcgQEAgcHJvYyBiZWNvbWUtdGFzayB7Y29tbWVudH0gewogICAgICAgICAg
ICAgICAgQU5EIHJlZmtleSA9IFtwZ19xdW90ZSBbbGluZGV4ICRyZWZpbmZvIDFdXQogICAgICAg
ICAiCiAgICAgfQorICAgIHJldHVybiAkb3duZXJxdWV1ZQogfQogCiBwcm9jIHByZXNlcnZlLXRh
c2sge3NlY29uZHN9IHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
