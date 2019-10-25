Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E806E50FE
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 18:16:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO2EU-00046R-V5; Fri, 25 Oct 2019 16:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO2ET-00046K-BF
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 16:14:33 +0000
X-Inumbo-ID: 875c86a2-f742-11e9-a531-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 875c86a2-f742-11e9-a531-bc764e2007e4;
 Fri, 25 Oct 2019 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572020073;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=f/d5wgtSAmAxExmh322raKLDhiQLXt0OxW+tyXdpIao=;
 b=WeSRCcbMT597sZbkZosVi5k+5tEPrSiLfcn6hR+QRZdjFoSsgVH8diRO
 mVbou0E2OcnkEgQA19RllR7E/5cardeTqHKfjcyrkTQnGkBU7Ud8qV1+9
 q8K8U/7KlIq1tFTseVs8oSBtl1SFNL+R83Fi8JjUY8GY1wuBYWCdc+iL1 Q=;
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
IronPort-SDR: pzimoxDoLfEkc5G8K6htF64OmK1bPcD7m+FAkxdPT8umluWPJRgP0rday+IY3C9NTSbgSXRv1d
 4ie7GBEeNM5aRASPESALw/ftxYhxyCjbhH5CacoHVTjomyoz6uOu67p3/DYjtyTXYtLov9aTH9
 +F5HvoD6dnEo8F9yw9uDxM7b5J/cX07NwpwzapcMQhmY+g4+D0xcPG/qVuLXvgQJZQ2YPMRAAg
 FOBD2ae5lR6/ZCPiYTp9Gbte+CTLnWaniIjqkyacsFUYE7abEsjjA3FnQJY6kNji3Zh623TXr1
 vWk=
X-SBRS: 2.7
X-MesageID: 7440433
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7440433"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23987.8037.240827.564234@mariner.uk.xensource.com>
Date: Fri, 25 Oct 2019 17:14:29 +0100
To: Roger Pau Monne <roger.pau@citrix.com>, =?iso-8859-1?Q?J=FCrgen_Gro=DF?=
 <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
In-Reply-To: <23985.32940.80514.935491@mariner.uk.xensource.com>,
 <osstest-143128-mainreport@xen.org>
References: <osstest-143128-mainreport@xen.org>
 <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <20191024072847.GU17494@Air-de-Roger>
 <23985.32940.80514.935491@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] italia1 Re: [xen-unstable test] 143061: regressions -
 trouble: broken/fail/pass [and 1 more messages]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltsaW51eC1saW51cyB0ZXN0XSAxNDMxMjg6
IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogYnJva2VuL2ZhaWwvcGFzcyIpOgo+IGZsaWdodCAxNDMx
MjggbGludXgtbGludXMgcmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQzMTI4Lwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0
ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUt
ZGViaWFuaHZtLWFtZDY0LXNoYWRvdyA0IGhvc3QtaW5zdGFsbCg0KSBicm9rZW4gUkVHUi4gdnMu
IDEzMzU4MAo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtd2luMTAtaTM4NiAgNCBob3N0LWlu
c3RhbGwoNCkgYnJva2VuIFJFR1IuIHZzLiAxMzM1ODAKClRoaXMgd2FzIGl0YWxpYTEgYWdhaW4u
ICBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBkZXRhaWxlZCBsb2dzIGJ1dAogIGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvcmVzdWx0cy9ob3N0L2l0YWxpYTEuaHRt
bApzaG93cyB0d28gZnVydGhlciBwZXJpb2RzIG9mIGBob3N0LWluc3RhbGwoNCkgYnJva2VuJy4K
CkkgaGF2ZSB1bmJsZXNzZWQgaXQuICBJIHRoaW5rIHdlIG11c3QgY29uc2lkZXIgaXRzIFBEVSBw
b3J0IGJ1c3QgYW5kCmFycmFuZ2UgdG8gaGF2ZSBpdCBtb3ZlZCB0byBhIG5ldyBwb3J0LgoKSWFu
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
