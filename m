Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C9D35B17
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:17:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTsM-0002Ay-RA; Wed, 05 Jun 2019 11:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgCu=UE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYTsK-0002At-N4
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:14:36 +0000
X-Inumbo-ID: 18051000-8783-11e9-af16-3be0505c7def
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18051000-8783-11e9-af16-3be0505c7def;
 Wed, 05 Jun 2019 11:14:33 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lsRNQ2UwwlV5EBmqf0enKEF9Ymc2uERWLDFT5qC/vZp/XkjTRO7J29gwI2IIlmaeKbzTBlGDoB
 5wXyktBXOl5DJZ5XznVvr/PwdML+Bi4L95sutZFHA0uwcXMVFbwwChn75l+nQoZ8rfxswGwBqA
 f87Qx1zGYIFn5RQlIarb5nqGBUgaLWa/WEzA5lurjDJU9GLC9TYC6jqkJWeegS4YSjqqH7mVnb
 9GMrlx08xOmTy6/U8M90xO7w4QEI7ofAmEMtu4FD9QhKqOC4PA9r9lOBjBMvyJbs2oMXCL5/OW
 ZsM=
X-SBRS: 2.7
X-MesageID: 1317231
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1317231"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 5 Jun 2019 12:13:55 +0100
Message-ID: <20190605111356.10429-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 1/2] mfi-common: break out
 xenbranch_supports_livepatch
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUt
ZHVtcC1mbGlnaHQtcnVudmFycy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1maS1jb21tb24gfCAxMSArKysrKysrKystLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tZmktY29tbW9uIGIvbWZpLWNvbW1vbgppbmRleCAzMGYyNjkyZC4uYjg2ZmViZGEgMTAwNjQ0
Ci0tLSBhL21maS1jb21tb24KKysrIGIvbWZpLWNvbW1vbgpAQCAtNzIsOCArNzIsOCBAQCBicmFu
Y2hfd2FudHNfeHRmX3Rlc3RzICgpIHsKICAgZXNhYwogfQogCi1icmFuY2hfd2FudHNfbGl2ZXBh
dGNoICgpIHsKLSAgY2FzZSAiJGJyYW5jaCIgaW4KK3hlbmJyYW5jaF9zdXBwb3J0c19saXZlcGF0
Y2ggKCkgeworICBjYXNlICIkeGVuYnJhbmNoIiBpbgogICAgIHhlbi0zLiopICAgIHJldHVybiAx
OzsKICAgICB4ZW4tNC4wLXRlc3RpbmcpICAgcmV0dXJuIDE7OwogICAgIHhlbi00LjEtdGVzdGlu
ZykgICByZXR1cm4gMTs7CkBAIC04Myw2ICs4MywxMyBAQCBicmFuY2hfd2FudHNfbGl2ZXBhdGNo
ICgpIHsKICAgICB4ZW4tNC41LXRlc3RpbmcpICAgcmV0dXJuIDE7OwogICAgIHhlbi00LjYtdGVz
dGluZykgICByZXR1cm4gMTs7CiAgICAgeGVuLTQuNy10ZXN0aW5nKSAgIHJldHVybiAxOzsKKyAg
ICAqKSAgICAgIHJldHVybiAwOzsKKyAgZXNhYworfQorCiticmFuY2hfd2FudHNfbGl2ZXBhdGNo
ICgpIHsKKyAgaWYgISB4ZW5icmFuY2hfc3VwcG9ydHNfbGl2ZXBhdGNoOyB0aGVuIHJldHVybiAx
OyBmaQorICBjYXNlICIkYnJhbmNoIiBpbgogICAgIHhlbi0qKSAgICAgIHJldHVybiAwOzsKICAg
ICBvc3N0ZXN0KikgICByZXR1cm4gMDs7CiAgICAgKikgICAgICAgICAgcmV0dXJuIDE7OwotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
