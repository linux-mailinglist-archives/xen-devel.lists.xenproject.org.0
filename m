Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C13DB1B91
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 12:32:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ioe-0006ua-Kd; Fri, 13 Sep 2019 10:28:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ia13=XI=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i8ioc-0006uV-UO
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 10:28:34 +0000
X-Inumbo-ID: 3ca63524-d611-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ca63524-d611-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568370513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Lv6y6dv8EoSAUWbPE/h/JiEkjjgd2IUJfKzH/LafNGI=;
 b=aL3BX4HWb2vIO4oOen5Z7r+8DUB8VAUju3LPNtlcWVYRND5ZSkA5RdRr
 w6dSPgDtFyzW4B5zr8Dcq2ARQ2F3kgt4iTQbnAegNS5S7sqcpLHmM4/J4
 jHlUhsZAqqjgsziflr/YFqBSCWNuHhfvOYXXvUGNCdu8k7QtZElhATQ9d g=;
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
IronPort-SDR: YEErOpXa0O8jSPx8WNKYOGPNSq8WfZWMpXeARa5KzriBc4YK59e0H5q17gBHJi77YIUvdljAug
 qfEnAUzq3aldKe2UNEx9cvFLp+d9GV02pT9nWDaSv5ZUA/acrzC0AS17IGZ+TZ20OVUUxIhMGp
 KdvlcT7KePktzCSTwQsq8fmRouKq14OEeIDOY4XC+mVjpMvBNumc52CVj/B3nBqevReocGS3V8
 Oz8zb8D3iTWeYYNEO7wabNzIs0/o2cXdTkpyo0OZXa+8ee19Xt24rHkP2lamIkjSmTqKMPFPQb
 0m0=
X-SBRS: 2.7
X-MesageID: 5824683
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,500,1559534400"; 
   d="scan'208";a="5824683"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 11:27:56 +0100
Message-ID: <20190913102756.6613-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190913094741.31451-7-paul.durrant@citrix.com>
References: <20190913094741.31451-7-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/ocaml: abi check: Cope with consecutive
 relevant enums
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
Cc: Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdGhlIGVuZCBvZiBvbmUgZW51bSBpcyB0aGUgYHR5cGUnIGxpbmUgZm9yIHRoZSBuZXh0IGVu
dW0sIHdlIHdvdWxkCm5vdCBub3RpY2UgaXQuCgpGaXggdGhpcyBieSByZW9yZGVyaW5nIHRoZSBj
b2RlLCBhbmQgZ2V0dGluZyByaWQgb2YgdGhlIGVsc2U6IG5vdyBpZgp0aGUgIndlIGFyZSB3aXRo
aW4gYW4gZW51bSIgYnJhbmNoIGRlY2lkZXMgdGhhdCBpdCdzIHRoZSBlbmQgb2YgdGhlCmVudW0s
IGl0IHVuc2V0cyAkZWkgYW5kIHdlIHRoZW4gaW1tZWRpYXRlbHkgcHJvY2VzcyB0aGUgbGluZSBh
cyBhICJub3QKd2l0aGluIGFuIGVudW0iIGxpbmUgLSBpZSBhcyB0aGUgc3RhcnQgb2YgdGhlIG5l
eHQgb25lLgoKUmVwb3J0ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIHRvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrIHwgMTcgKysrKysrKysrLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sgYi90b29scy9vY2FtbC9saWJz
L3hjL2FiaS1jaGVjawppbmRleCBkNTMyZjM3MjcxLi4zY2JkZWM1ODJmIDEwMDc1NQotLS0gYS90
b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjaworKysgYi90b29scy9vY2FtbC9saWJzL3hjL2Fi
aS1jaGVjawpAQCAtNzAsMTQgKzcwLDcgQEAgbXkgJGN2YWw7CiAkZWkgPSB1bmRlZjsKIG15ICRi
aXRudW0gPSAwOwogd2hpbGUgKDxPQ0FNTF9GSUxFPikgewotICAgIGlmICghJGVpKSB7Ci0gICAg
ICAgIGlmIChte150eXBlIFxzKyAoXHcrKSBccyogXD0gXHMqICR9eCAmJiAkZW51bXN7JDF9KSB7
Ci0gICAgICAgICAgICBwcmludCAiLy8gZm91bmQgb2NhbWwgdHlwZSAkMSBhdCAkbzokLlxuIiBv
ciBkaWUgJCE7Ci0gICAgICAgICAgICAkZWkgPSAkZW51bXN7JDF9OwotICAgICAgICAgICAgJGN2
YWwgPSAnJzsKLSAgICAgICAgICAgICRiaXRudW0gPSAwOwotICAgICAgICB9Ci0gICAgfSBlbHNl
IHsKKyAgICBpZiAoJGVpKSB7CiAgICAgICAgIGlmIChte15ccysgXHwgXHMqICRlaS0+e09QcmVm
aXh9IChcdyspIFxzKiR9eCkgewogICAgICAgICAgICAgJGN2YWwgPSAkMTsKICAgICAgICAgICAg
IGlmICgkZWktPntNYW5nbGV9IGVxICdsYycpIHsKQEAgLTEwNCw2ICs5NywxNCBAQCB3aGlsZSAo
PE9DQU1MX0ZJTEU+KSB7CiAgICAgICAgICAgICBkaWUgIiRfID8iOwogICAgICAgICB9CiAgICAg
fQorICAgIGlmICghJGVpKSB7CisgICAgICAgIGlmIChte150eXBlIFxzKyAoXHcrKSBccyogXD0g
XHMqICR9eCAmJiAkZW51bXN7JDF9KSB7CisgICAgICAgICAgICBwcmludCAiLy8gZm91bmQgb2Nh
bWwgdHlwZSAkMSBhdCAkbzokLlxuIiBvciBkaWUgJCE7CisgICAgICAgICAgICAkZWkgPSAkZW51
bXN7JDF9OworICAgICAgICAgICAgJGN2YWwgPSAnJzsKKyAgICAgICAgICAgICRiaXRudW0gPSAw
OworICAgICAgICB9CisgICAgfQogfQogCiBmb3JlYWNoICRlaSAodmFsdWVzICVlbnVtcykgewot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
