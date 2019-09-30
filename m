Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E0C23CA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 16:59:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEx71-00052G-T8; Mon, 30 Sep 2019 14:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jhqc=XZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iEx70-00052B-RJ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 14:57:18 +0000
X-Inumbo-ID: 98b30502-e392-11e9-97fb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 98b30502-e392-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569855438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=se7YOI3cAhbovTRTiBSH5NWhWLms8C6UPfwUs6DySAQ=;
 b=gKO1FWrqKejQbWXX5MA3QmKpGS4AzpEjp2yPrA5DelAZLdArFZAqRdI7
 mPdkLZiqaLOyoZN/EEceBFqq2Nm+qQnsdqOHnDQ0LChffPSx6clvongrn
 5DGVv7C6/gnLbhtrEs0P+lsvpDlfJf/kGNOer620PLzYS4BIGrqkXK1KU o=;
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
IronPort-SDR: bVVyUnXNMzIjwj/jfzvcXm6oqeG86s7/1tyd9JIX/1bYFkLXACDCXvi06MheKJDUW/Mktw++uw
 66AujHWDDrYEBSTpif2rjHiRlVcGO8fO9/CGw9S7KObt4W9m0+I2dkC8MuDsk/MlauzL0PWRin
 0Iv1YlW8GwJ4VPPzwe9wM0uNLxCl53N0Qiu4uchMfMckSDNgK3eXgW+gWM0OYT/Z+SkpFrvXzI
 A9s89pNJkoqacuBqjGKqbB2D32VTnv2xF6ZMFWze8y1g6zwPQOI9PpVhJMLQa8hmz5yROASbdG
 QIc=
X-SBRS: 2.7
X-MesageID: 6608611
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6608611"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:57:12 +0100
Message-ID: <20190930145712.31389-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190930145712.31389-1-ian.jackson@eu.citrix.com>
References: <20190930145712.31389-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/2] freebsd build job bisection: add
 special case
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3RoZXJfcmV2aXNpb25fam9iX3N1ZmZpeCBjb250YWlucyBhZC1ob2MgY29kZSB3aGljaCByZXR1
cm5zIGFuCmlkZW50aWZpZXIgZGlzdGluZ3Vpc2hpbmcgY2VydGFpbiBqb2JzIHdoaWNoIGFyZSBl
eHBlY3RlZCB0byByZWZlciB0bwpkaWZmZXJlbnQgcmV2aXNpb25zIHdpdGhpbiB0aGVpciBmbGln
aHQuCgpBZGQgdGhlIHNwZWNpYWwgY2FzZSBmb3IgZnJlZWJzZGJ1aWxkam9iJ3MgcmVjdXJzaW9u
LgoKQWZ0ZXIgdGhpcyBjaGFuZ2Ugd2UgYXJlIG5vdyB3aWxsaW5nIHRvIHRvbGVyYXRlIHRoZSBm
YWN0IHRoYXQgYQpmcmVlYnNkIGJ1aWxkIGpvYiBoYXMgYXMgaW5wdXQgbXVsdGlwbGUgZGlmZmVy
ZW50IHJldmlzaW9ucyBvZgpmcmVlYnNkLgoKY3MtYmlzZWN0aW9uLXN0ZXAgaGFzIGNvZGUgdG8g
YXZvaWQgY3JlYXRpbmcgcmVjdXJzaXZlIGJ1aWxkIGpvYnM6IHRoZQpjcmVhdGVkIHRvcC1sZXZl
bCBqb2Igd2lsbCB0aGVyZWZvcmUgcmV1c2UgdGhlIHNhbWUgZnJlZWJzZGJ1aWxkam9iIGFzCnRo
ZSB0ZW1wbGF0ZS4gIEhvcGVmdWxseSB0aGF0IHdpbGwgYmUgdGhlIHByZXZpb3VzbHkgYW5vaW50
ZWQgb25lIGFuZApzdGlsbCBiZSBhdmFpbGFibGUuCgpUaGUgYmlzZWN0b3Igd2FudHMgdG8gcmVw
cm8gb24gdGhlIHNhbWUgaG9zdCBhcyBiZWZvcmUuICBUaGlzIG1lYW5zIGl0Cndvbid0IG5lY2Vz
c2FyaWx5IHVzZSB0aGUgbW9zdCByZWNlbnQgcGFzcyBhcyB0aGUgYmFzaXMgYnVpbGQuICBTbwps
b25nIGFzIHRoZSBwcmV2aW91cyBidWlsZCBoYXMgbm90IGJlZW4gZXhwaXJlZCwgdGhpcyBpcyBm
aW5lLiAgSXQKZG9lcyBpbnZvbHZlIGJ1aWxkaW5nIGFuIGVhcmxpZXIgZnJlZWJzZCBvbiBhIGxh
dGVyIG9uZSBidXQgdGhpcwpzaG91bGQgYmUgT0suCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0LnBtIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QucG0gYi9P
c3N0ZXN0LnBtCmluZGV4IDU2MWQ1ODRjLi5jMTQ1MzFlMyAxMDA2NDQKLS0tIGEvT3NzdGVzdC5w
bQorKysgYi9Pc3N0ZXN0LnBtCkBAIC0zNzksNiArMzc5LDggQEAgc3ViIG90aGVyX3JldmlzaW9u
X2pvYl9zdWZmaXggKCQkJCkgewogICAgIHJldHVybiA8PEVORAogICAgICAgKENBU0UKICAgICAg
ICBXSEVOICgkam9iZmllbGQpIExJS0UgJ2J1aWxkLSUtcHJldicgVEhFTiAnJHtzZXBhcmF0b3J9
cHJldicKKyAgICAgICBXSEVOICgoJGpvYmZpZWxkKSBMSUtFICdidWlsZC0lLWZyZWVic2QnIAor
ICAgICAgICAgICAgIEFORCAkcmVmcnVudmFyID0gJ2ZyZWVic2RidWlsZGpvYicpIFRIRU4gJyR7
c2VwYXJhdG9yfXJlY3Vyc2UnCiAgICAgICAgRUxTRSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJycKICAgICAgICBFTkQpCiBFTkQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
