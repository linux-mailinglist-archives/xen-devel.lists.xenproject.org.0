Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CC3B7880
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:30:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAubr-0000AP-UC; Thu, 19 Sep 2019 11:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAubr-0000AF-23
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:28:27 +0000
X-Inumbo-ID: 989774ec-dad0-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 989774ec-dad0-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568892506;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=jw8d079NCjg5qiQwuTat6YMPOEJYm1mKGkRhC5tl16Y=;
 b=YfCKlzfsRiCqfLU+wegGOuJIhyFmJBaQKdUuuQWXM8Qx9+uXhF+tLDUN
 wiDqxhpnBrXRYE4WBEyEBQ89Qbm/m9ouwW253NZUAfiu/4MMq3FxZ3UU4
 x57R4iyitT5dU7hZbYkN6C6RqJJGP5e+BY/gnCrurWYkomchqM/bt5jdi Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S4U79tNbDQM5DjMdmK4N1TROKbXcaUd2evm//5jwNd+YzTekty7lrQnkz27zCPtdKRKyulpTxi
 d74+NCl13wrHjZrdPnOog7fB1MAFy7TzQUoW4MNa6ywbrg782zzbQzBfzpzRSfVVzD3K36rTvx
 LhLkN692m92/gZqALk1EiE53je9rc30C1h9sfzzSRakpZIPkVamt75IpwLeHAHUE6hgAVPMgDb
 vLIwcvPuAgrYzXZzwIOP3OpoVQE3lIIM2xAdBgIvyRkX/W6dc/2CrWQ0pToUdNNEQXJUGrK5o3
 OOA=
X-SBRS: 2.7
X-MesageID: 5840972
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5840972"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.26199.62169.927294@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 12:28:23 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <CAK9nU=oUVsbJN28BmJ=aHR5UEBNv4CAxLO8xTUqY+__czX40CA@mail.gmail.com>
References: <20190919111722.iajioonuzqfharaf@debian>
 <CAK9nU=oUVsbJN28BmJ=aHR5UEBNv4CAxLO8xTUqY+__czX40CA@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13] configure: fix print syntax for
 python 3
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEzXSBjb25maWd1cmU6IGZpeCBwcmlu
dCBzeW50YXggZm9yIHB5dGhvbiAzIik6Cj4gT24gVGh1LCAxOSBTZXAgMjAxOSBhdCAxMjoxNywg
V2VpIExpdSA8d2xAeGVuLm9yZz4gd3JvdGU6Cj4gPgo+ID4gMTZjYzMzNjJhIG1pc3NlZCBvbmUg
cHJpbnQgc3RhdGVtZW50Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gPiAtLS0KPiA+ICBtNC9weXRob25fZGV2ZWwubTQgfCAyICstCj4gPiAgdG9vbHMvY29u
ZmlndXJlICAgIHwgMiArLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tNC9weXRob25fZGV2ZWwubTQgYi9t
NC9weXRob25fZGV2ZWwubTQKPiA+IGluZGV4IDdmMjYzODEzNzYuLmUzNjVjZDY1OGUgMTAwNjQ0
Cj4gPiAtLS0gYS9tNC9weXRob25fZGV2ZWwubTQKPiA+ICsrKyBiL200L3B5dGhvbl9kZXZlbC5t
NAo+ID4gQEAgLTYsNyArNiw3IEBAIEFDX1BBVEhfUFJPRyhbcHljb25maWddLCBbJFBZVEhPTi1j
b25maWddLCBbbm9dKQo+ID4gIEFTX0lGKFt0ZXN0IHgiJHB5Y29uZmlnIiA9IHgibm8iXSwgWwo+
ID4gICAgICBkbmwgRm9yIHRob3NlIHRoYXQgZG9uJ3QgaGF2ZSBweXRob24tY29uZmlnCj4gPiAg
ICAgIENQUEZMQUdTPSIkQ0ZMQUdTIGAkUFlUSE9OIC1jICdpbXBvcnQgZGlzdHV0aWxzLnN5c2Nv
bmZpZzsgXAo+ID4gLSAgICAgICAgcHJpbnQgIi1JIiArIGRpc3R1dGlscy5zeXNjb25maWcuZ2V0
X2NvbmZpZ192YXIoIklOQ0xVREVQWSIpJ2AiCj4gPiArICAgICAgICBwcmludCgiLUkiICsKPiA+
IGRpc3R1dGlscy5zeXNjb25maWcuZ2V0X2NvbmZpZ192YXIoIklOQ0xVREVQWSIpKSdgIgo+IAo+
IFVyZ2guIFRoaXMgaGFzIGJlZW4gbWFuZ2xlZC4gSG9wZSB5b3UgZ2V0IHRoZSBpZGVhLi4uCgpN
eSBwcmV2aW91cyByZXBseSBib3VuY2VkIGR1ZSB0byBoZWFkZXIgbWFuZ2xpbmcgaW4geW91ciBm
aXJzdCBtYWlsLgpMZXQgbWUgdHJ5IGFnYWluOgoKVGhpcyBpcyBnb29kIGluIHByaW5jaXBsZSBi
dXQ6CgpDYW4geW91IHByb3ZpZGUgYXMgYSBnaXQgYnJhbmNoID8gIFRoZW4gSSB3aWxsIGdldCB0
aGUgdW5tYW5nbGVkCnZlcnNpb24gYW5kIGJlIGFibGUgdG8gdHJ5IGl0IG91dC4KCklhbi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
