Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C338716FE9E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:05:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6vOR-0006MS-Gq; Wed, 26 Feb 2020 12:02:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XWk4=4O=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6vOP-0006MN-Vn
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:02:22 +0000
X-Inumbo-ID: d6b2106b-588f-11ea-9403-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6b2106b-588f-11ea-9403-12813bfff9fa;
 Wed, 26 Feb 2020 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582718541;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=6su7ajvmC2ANdBh99V2fkYbcYtOl4hQo7hXt2M0SQis=;
 b=ETXlRjEaIOM/135zZwZuih27eWInLc161tQ9DVvAIAKgP160dJU3OZZp
 Xvr81tJsYnG8MqoOshLpsKstiNTu2CyV463QVl9sCBZB/AndmBwNwd87q
 K179fUNnbq9KVeURNHev4+0ltOxKTu4BjqGks4Z0H936gevyDcyy+ZYBe 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: feEDqHGn7A22htbq5/mSTHO8L9R7Mqakpe41+4RxlK40uy2RuQRj5h2EhktWiTbSQG+5kpSRw+
 ZDraSrd464iyXv/v01oT27t8SprOJ7X4qxcdYerzBMaFy2Y2nPK4Zddi6vcuiFFHr0Omh09rIY
 F5iZ/pY05jP2OfhIeqNy0Hfv+8gsCbTIz9peX1ITfyOul9hCj/zWca0x0+EK3FTkVUUKrrmOJ1
 Gs/XwC0c8m6gvawEKkEm6tv41VPnrEWUSO58jMfpG9npn75cpCaHe8wd67s88u428i09uhztF4
 oq0=
X-SBRS: 2.7
X-MesageID: 13462721
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,488,1574139600"; d="scan'208";a="13462721"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24150.24138.57553.997537@mariner.uk.xensource.com>
Date: Wed, 26 Feb 2020 12:02:18 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200224165050.32287-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-16-andrew.cooper3@citrix.com>
 <20200224165050.32287-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2.1 15/17] tools/libx[cl]: Plumb 'missing'
 through static_data_done() up into libxl
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIuMSAxNS8xN10gdG9vbHMvbGlieFtjbF06
IFBsdW1iICdtaXNzaW5nJyB0aHJvdWdoIHN0YXRpY19kYXRhX2RvbmUoKSB1cCBpbnRvIGxpYnhs
Iik6Cj4gUHJlIFhlbi00LjE0IHN0cmVhbXMgd2lsbCBub3QgY29udGFpbiBhbnkgQ1BVSUQvTVNS
IGluZm9ybWF0aW9uLiAgVGhlcmUgaXMKPiBub3RoaW5nIGxpYnhjIGNhbiBkbyBhYm91dCB0aGlz
LCBhbmQgd2lsbCBoYXZlIHRvIHJlbHkgb24gdGhlIGhpZ2hlciBsZXZlbAo+IHRvb2xzdGFjayB0
byBwcm92aWRlIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5Lgo+IAo+IFRvIGZhY2lsaXRhdGUgdGhp
cywgZXh0ZW5kIHRoZSBzdGF0aWNfZGF0YV9kb25lKCkgY2FsbGJhY2ssIGhpZ2hsaWdodGluZyB0
aGUKPiBtaXNzaW5nIGluZm9ybWF0aW9uLCBhbmQgbW9kaWZ5IGxpYnhsIHRvIHVzZSBpdC4gIEF0
IHRoZSBsaWJ4YyBsZXZlbCwgdGhpcwo+IHJlcXVpcmVzIGFuIGFyY2gtc3BlY2lmaWMgaG9vayB3
aGljaCwgZm9yIG5vdywgYWx3YXlzIHJlcG9ydHMgQ1BVSUQgYW5kIE1TUiBhcwo+IG1pc3Npbmcu
ICBUaGlzIHdpbGwgYmUgYWRqdXN0ZWQgaW4gYSBsYXRlciBjaGFuZ2UuCj4gCj4gTm8gb3ZlcmFs
bCBmdW5jdGlvbmFsIGNoYW5nZSAtIHRoaXMgaXMganVzdCBwbHVtYmluZy4KClRoYW5rcyBmb3Ig
dGhlIGFkZGl0aW9uYWwgZXhwbGFuYXRpb24gYW5kIHRoZSBleHBsYW5hdGlvbiBvbiBJUkMuCkkn
bSBub3cgY29udmluY2VkIHRoYXQgdGhpcyBpcyB0aGUgYmVzdCB3YXkgdG8gZG8gaXQuCgpBY2tl
ZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
