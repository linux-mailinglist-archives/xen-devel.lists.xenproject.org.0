Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A9E7832
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 19:15:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP9UC-0008Ge-60; Mon, 28 Oct 2019 18:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP9UA-0008GO-F5
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 18:11:22 +0000
X-Inumbo-ID: 58686b5e-f9ae-11e9-bbab-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58686b5e-f9ae-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572286281;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=YxdjUl4063UMx1oeb7O+P3qzpmizHZjmn4pJR/bjjF4=;
 b=HXoqbTQ3GNzC5yyDK+3ur291mwB8a0ITie7f/bAJahj048juGBGGBxmP
 qFqYQaXq6G7EegGQ4jh0wT1V+rPi0CPvSyW6SiMuiEqrdKHd+ZYuS7RgM
 /FnG6r4IYrXNybAKHik4/p+PNVbYR0GZ31WIF2FXl5kn6AAuf/bsu82Pc s=;
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
IronPort-SDR: trvI2rChFub/IFre7Mv3fzcIK1ESH0mRyx/I/MRywltKsnK53Ca0a+omaamgF5Jw+T+3ZHmOlm
 QAwUx1hfIJOTd72dvRXdQcQWcX9HhQk/OkL9tfZP8fU3WUuT3sXTotw/0Ep5OLp1Xrk9xj5Gdy
 WaZckvtOXNGhw9FJvd3zWmYDDwwNb33Btac/mVegLEWu4IFPyIDWko2bo9roZR5y1vcsmpZ0Mj
 UgPcCLjNTnc/oZ7etG1rhyKEzMc02Ey4/cD6AQlAmQfsA8g+1xwgrkxx6cHqo0LxRxLXvXF+3t
 ZG8=
X-SBRS: 2.7
X-MesageID: 7882839
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7882839"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23991.12102.489557.230619@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 18:11:18 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <d6eabc00-dd7c-da55-42e2-772021515bab@citrix.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
 <20191028152948.11900-4-ian.jackson@eu.citrix.com>
 <d6eabc00-dd7c-da55-42e2-772021515bab@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 3/3] libxl: Set shadow_memkb
 for stub device model domains
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hFTiBQQVRDSCBmb3ItNC4xMyAzLzNdIGxpYnhs
OiBTZXQgc2hhZG93X21lbWtiIGZvciBzdHViIGRldmljZSBtb2RlbCBkb21haW5zIik6Cj4gT24g
MjgvMTAvMjAxOSAxNToyOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBQcmV2aW91c2x5IHdlIGRp
ZCBub3QgZG8gdGhpcy4gIEluZGVlZCB3ZSBoYXZlIG5ldmVyIGRvbmUgc28uICBTdHViCj4gPiBk
b21haW5zIGhhdmUgaGFkIG5vIG1lbW9yeSBhbGxvd2FuY2UgZm9yIHNoYWRvdyBtZW1vcnkuICBU
aGlzIHNlZW1zIHRvCj4gPiBiZSBhbiBleGlzdGluZyBidWcgd2hpY2ggd2UgZml4Lgo+ID4KPiA+
IHg4NiBtYWludGFpbmVyczogcGxlYXNlIGNvbW1lbnQuCj4gCj4gUFYgZ3Vlc3RzIG5lZWQgYSBz
aGFkb3cgYWxsb2NhdGlvbiB0byBtaWdyYXRlLCBvciBpZiB0aGV5IHRyaXAgb3ZlciB0aGUKPiBQ
ViBMMVRGIHNhZmV0eSBjaGVja3MuCj4gCj4gVGhlIGZvcm1lciBpcyBub3QgYXBwbGljYWJsZSB0
byBzdHViZG9tcywgYW5kIHRoZSBsYXR0ZXIgaXMgYXJndWFibHkKPiBiZXR0ZXIgbGVmdCB3aXRo
IGEgc2hhZG93IGFsbG9jYXRpb24gb2YgMC4KPiAKPiBUaGVzZSBhcmUgaW5mcmFzdHJ1Y3R1cmUg
Vk1zIHJhdGhlciB0aGFuIGN1c3RvbWVyIFZNcywgYW5kIHRoZXJlIGlzIG5vCj4gZXhjdXNlIHJl
YWxseSB0byBiZSBydW5uaW5nIGFuIEwxVEYtdnVsbmVyYWJsZSBzdHViZG9tIHdoaWNoIGlzIHRh
a2luZwo+IHRoZSAyMCUgcGVyZiBoaXQuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpJIHRoaW5r
IHRoaXMgbWVhbnMgSSBzaG91bGQgZHJvcCB0aGlzIHBhdGNoLiAgVGhlIG90aGVyIHR3byB3ZXJl
CnJldmlld2VkIGFuZCByZWxlYXNlLWFja2VkICh0aGFua3MgSsO8cmdlbiBhbmQgQW50aG9ueSkg
c28gSSBoYXZlIGp1c3QKcHVzaGVkIHRoZW0gdG8gc3RhZ2luZy4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
