Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560012E9CC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:14:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4xm-0003SY-5x; Thu, 02 Jan 2020 18:12:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in4xk-0003SQ-0L
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:12:48 +0000
X-Inumbo-ID: 75ddb50c-2d8b-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75ddb50c-2d8b-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577988759;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+VbXewsK1q2K+jORHbUf/wXKhwqkVz0kIC71u6YbpuQ=;
 b=SiZlDc/PJQhDnKd1TJg+8EOZKDdsp/FDvhoc6nLmatquum4vpkwGXXB0
 Dn7ZjOZrlpbheyr7Mg2WSwpWvvxPuLw6Zm34DPkE/ObsO9QgtIfflXJEu
 KOeg2BS8uYUEd7cfiF/Qvp1hEScVaOA0e9BPTFRCphJfuv/whZZJtGq7r Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2I66LNZGo3ZIjKeWaIE7lMcorhGslFwRB9W1UeOopl/SvzKHBg9KWazZsM6WMV7TRjNVgy4egu
 G8Ax+FeHwkHMNBxjkGJV9ocD7GOmOal+ujBw86S+JpBK7TpEEibmD9V8JVkA0XoQ4vI6o3lm9D
 eqSC73U76EnqOc+quzHbspY0ii2gWD+pV4BVvTR33Tll+lJq08klfRQre7JA5fcTu5Zgz4P4LG
 z8PjBb7ecd94TzLrnTBB65fj4+6Omay9NJOxLixAZDEYjl1vLvbaAn7yam5WWp4ipxtdHfRONq
 wzk=
X-SBRS: 2.7
X-MesageID: 10406298
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10406298"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.12947.939879.406757@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 18:12:35 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <20200102181146.26429-1-ian.jackson@eu.citrix.com>
References: <20200102181146.26429-1-ian.jackson@eu.citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/xl/xl_cmdtable.c: Fix a simple typo.
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
Cc: Chad Dougherty <crd@acm.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIXSB0b29scy94bC94bF9jbWR0YWJsZS5jOiBGaXgg
YSBzaW1wbGUgdHlwby4iKToKPiBGcm9tOiBDaGFkIERvdWdoZXJ0eSA8Y3JkQGFjbS5vcmc+Cj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hhZCBEb3VnaGVydHkgPGNyZEBhY20ub3JnPgo+IC0tLQo+ICB0
b29scy94bC94bF9jbWR0YWJsZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfY21kdGFi
bGUuYyBiL3Rvb2xzL3hsL3hsX2NtZHRhYmxlLmMKPiBpbmRleCA1YmFhNjAyM2FhLi4zYjMwMmIy
ZjIwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3hsL3hsX2NtZHRhYmxlLmMKPiArKysgYi90b29scy94
bC94bF9jbWR0YWJsZS5jCj4gQEAgLTUwMiw3ICs1MDIsNyBAQCBzdHJ1Y3QgY21kX3NwZWMgY21k
X3RhYmxlW10gPSB7Cj4gICAgICB9LAo+ICAgICAgeyAibG9hZHBvbGljeSIsCj4gICAgICAgICZt
YWluX2xvYWRwb2xpY3ksIDAsIDEsCj4gLSAgICAgICJMb2FkcyBhIG5ldyBwb2xpY3kgaW50IHRo
ZSBGbGFzayBYZW4gc2VjdXJpdHkgbW9kdWxlIiwKPiArICAgICAgIkxvYWRzIGEgbmV3IHBvbGlj
eSBpbnRvIHRoZSBGbGFzayBYZW4gc2VjdXJpdHkgbW9kdWxlIiwKPiAgICAgICAgIjxwb2xpY3kg
ZmlsZT4iLAo+ICAgICAgfSwKPiAgI2lmbmRlZiBMSUJYTF9IQVZFX05PX1NVU1BFTkRfUkVTVU1F
CgpJIHBvc3RlZCB0aGlzIHRvIHRoZSBsaXN0IGZvciBmb3JtJ3Mgc2FrZS4gIEkgZG9uJ3QgdGhp
bmsgd2UgbmVlZCBhbgphY2suICBJJ20gYXBwbHlpbmcgaXQgcmlnaHQgYXdheS4KCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
