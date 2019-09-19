Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350BB7876
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:28:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuYz-00089Y-8Z; Thu, 19 Sep 2019 11:25:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAuYx-00089G-As
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:25:27 +0000
X-Inumbo-ID: 2b24a1e7-dad0-11e9-9656-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b24a1e7-dad0-11e9-9656-12813bfff9fa;
 Thu, 19 Sep 2019 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568892323;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=13xa+yfDVyD3rqQfnNj85xTPGSMlw5NcPOe81Jsc1+s=;
 b=eSOw/RoZml776GpGslosPhpqIIXBYL1XxG0QjLc2cO+9x0jzoL+2h6AP
 43db8tpOlXI/wtlKwTK3V77CFlcxzuKFr8+oF9gKb1/eoEuq4p7BMJ/KN
 Ax530yNvTLNB0fdFswLk/aUGiiJglhKotaGUDOEOHK+/vs7VQb3Wtd/vD k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KcekH9iaMkfWDcKccrBUaX5vT8/8V9a4ir63pszRrDSh2+JdIDwGj1Nu1lj0mMu9x5DMteCVh9
 XOwUVn0DbTndSOQ4F6tRi3ZDGvxDgkGIBXsj8kOPC0d5P7Ly5ZJBn4/BNYvo0n6cDwYcvON2/u
 kKxod04pAdcBWWjnok9DO0fyxGqkwX9Mk8RlD0/Vc5k16veAbq9Lf7X+L/0wZTK7hHenXPtg+J
 /9QEG/s9XZqMockOJsNX0bRcYc9vPeCxWlnkGZPXKI2TRUxuVaJc5Dot/7Z5jLOs0QLkybomn1
 5ko=
X-SBRS: 2.7
X-MesageID: 5985623
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5985623"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.26016.526192.999389@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 12:25:20 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919110443.817594-4-anthony.perard@citrix.com>
References: <20190919110443.817594-1-anthony.perard@citrix.com>
 <20190919110443.817594-4-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 3/9] libxl_internal: Introduce
 libxl__ev_devlock for devices hotplug via QMP
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDMvOV0gbGlieGxfaW50ZXJuYWw6IElu
dHJvZHVjZSBsaWJ4bF9fZXZfZGV2bG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAiKToK
PiBUaGUgY3VycmVudCBsb2NrIGBkb21haW5fdXNlcmRhdGFfbG9jaycgY2FuJ3QgYmUgdXNlZCB3
aGVuIG1vZGlmaWNhdGlvbgo+IHRvIGEgZ3Vlc3QgaXMgZG9uZSBieSBzZW5kaW5nIGNvbW1hbmQg
dG8gUUVNVSwgdGhpcyBpcyBhIHNsb3cgcHJvY2Vzcwo+IGFuZCByZXF1aXJlcyB0byBjYWxsIENU
WF9VTkxPQ0ssIHdoaWNoIGlzIG5vdCBwb3NzaWJsZSB3aGlsZSBob2xkaW5nCj4gdGhlIGBkb21h
aW5fdXNlcmRhdGFfbG9jaycuCj4gCj4gVG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCB3ZSBjcmVhdGUg
YSBuZXcgbG9jayB3aGljaCBjYW4gdGFrZSBvdmVyIHBhcnQKPiBvZiB0aGUgam9iIG9mIHRoZSBq
c29uX2xvY2suCj4gCj4gVGhpcyBsb2NrIGlzIG91dHNpZGUgQ1RYX0xPQ0sgaW4gdGhlIGxvY2sg
aGllcmFyY2h5Lgo+IGxpYnhsX19ldl9kZXZsb2NrX2xvY2sgd2lsbCBoYXZlIENUWF9VTkxPQ0sg
YmVmb3JlIHRyeWluZyB0byBncmFiIHRoZQo+IGV2X2RldmxvY2suIFRoZSBjYWxsYmFjayBpcyB1
c2VkIHRvIG5vdGlmeSB3aGVuIHRoZSBldl9kZXZsb2NrIGhhdmUKPiBiZWVuIGFjcXVpcmVkLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgoKVGhhbmtzLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgoKQW5kIGNvbW1pdHRlZCB0aGUgc2VyaWVzLgoKSWFuLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
