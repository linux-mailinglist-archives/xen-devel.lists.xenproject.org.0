Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E231A3C7
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 22:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPBpx-0006j7-R3; Fri, 10 May 2019 20:09:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nNyG=TK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hPBpw-0006j2-LA
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 20:09:44 +0000
X-Inumbo-ID: 8cdfdcbc-735f-11e9-91cc-1fec6a9d3173
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cdfdcbc-735f-11e9-91cc-1fec6a9d3173;
 Fri, 10 May 2019 20:09:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9931217F9;
 Fri, 10 May 2019 20:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557518983;
 bh=v1kze2IN0532imrINwtRs/4gaq1egpTb9MsbKw3tukg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kruRsYj8POh0UbnCYrvS7fcAd2RBr0zTLl/HQaCA5KTHe2elhVvYfjTZxScYtOGYe
 UVXEDSsNM4LQYNwRQtcinavKcpcYYe7/A0tfw14maGL0FamA4P0jgkdl3UZ/2C5Suy
 qwmmopYhxkZwtKNkX4EYDRZoyEIdDgMQl4gwaAro=
Date: Fri, 10 May 2019 13:09:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
In-Reply-To: <23756.6502.516380.800716@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.1905101308180.25766@sstabellini-ThinkPad-T480s>
References: <20190502162550.21038-1-anthony.perard@citrix.com>
 <23756.6502.516380.800716@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools/Makefile: Fix build of QEMU,
 remove --source-path
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAzIE1heSAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBBZGRpbmcgU3RlZmFubyBm
b3IgYXJjaGFlbG9naWNhbCByZWFzb25zLgo+IAo+IEFudGhvbnkgUEVSQVJEIHdyaXRlcyAoIltQ
QVRDSF0gdG9vbHMvTWFrZWZpbGU6IEZpeCBidWlsZCBvZiBRRU1VLCByZW1vdmUgLS1zb3VyY2Ut
cGF0aCIpOgo+ID4gRm9sbG93aW5nIFFFTVUncyBjb21taXQgNzlkNzdiY2QzNiAoY29uZmlndXJl
OiBSZW1vdmUgLS1zb3VyY2UtcGF0aAo+ID4gb3B0aW9uKSwgWGVuJ3MgYnVpbGQgc3lzdGVtIGZh
aWxzIHRvIGJ1aWxkIHFlbXUteGVuLiBUaGUgLS1zb3VyY2UtcGF0aAo+ID4gb3B0aW9uIGdpdmVz
IHJlZHVuZGFudCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgbG9jYXRpb24gb2YgdGhlIHNvdXJjZXMK
PiA+IHNvIHNpbXBseSByZW1vdmUgaXQuIChjb25maWd1cmUgYWxyZWFkeSBsb29rcyBhdCBpdHMg
JDAgdG8gZmluZCB0aGUKPiA+IHNvdXJjZS1wYXRoLikKPiAKPiBGb3IgWGVuIHN0YWdpbmc6Cj4g
Cj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+
IEkgd2FudGVkIHRvIGZvbGxvdyB0aGUgcHJpbmNpcGxlIG9mIENoZXN0ZXJ0b24ncyBGZW5jZSBb
MV0sCj4gcGFydGljdWxhcmx5IHRvIGtub3cgaG93IGZhciBiYWNrIHRvIGJhY2twb3J0IHRoaXMg
Y2hhbmdlLCBzbyBJCj4gY2hlY2tlZCB0aGUgZ2l0IGhpc3RvcnkuICBUaGlzIG9wdGlvbiBoYXMg
YmVlbiBwYXNzZWQgc2luY2UgdGhlIHZlcnkKPiBmaXJzdCB0aW1lIHhlbi5naXQgYnVpbHQgcWVt
dSB1cHN0cmVhbSwgaW4KPiAgICBlNzM3YjQzMzNiYjI4N2I2MTM0YTg5ZWRmZjJiZGUyYTdlMDQ4
YTllCj4gICAgQ2xvbmUgYW5kIGJ1aWxkIHVwc3RyZWFtIFFlbXUgYnkgZGVmYXVsdAo+IAo+IFN0
ZWZhbm8sIGNhbiB5b3UgcmVtZW1iZXIgYW55dGhpbmcgYWJvdXQgdGhpcyA/ICBEWUsgaG93IGZh
ciBiYWNrIHdlCj4gc2hvdWxkIGJhY2twb3J0IHRoaXMgY2hhbmdlID8KClVuZm9ydHVuYXRlbHkg
SSBkb24ndCByZW1lbWJlci4gVG8gc3RheSBvbiB0aGUgc2FmZSBzaWRlLCBJIHdvdWxkIHRlc3QK
ZWFjaCBiYWNrcG9ydCBiZWZvcmUgcHVzaGluZyBpdCBpZiBJIHdlcmUgeW91LgoKCj4gWzFdIGh0
dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0NoZXN0ZXJ0b24lMjdzX2ZlbmNlI0NoZXN0ZXJ0
b24nc19mZW5jZQo+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IFRoaXMgcGF0Y2ggd291bGQgdW5ibG9jayB0
aGUgcWVtdS1tYWlubGluZSBicmFuY2ggaW4gb3NzdGVzdC4KPiA+IC0tLQo+ID4gIHRvb2xzL01h
a2VmaWxlIHwgMSAtCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL01ha2VmaWxlIGIvdG9vbHMvTWFrZWZpbGUKPiA+IGluZGV4IGM5
MDNkNmE2M2UuLjk5Y2JjOTUwZGMgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9NYWtlZmlsZQo+ID4g
KysrIGIvdG9vbHMvTWFrZWZpbGUKPiA+IEBAIC0yNDYsNyArMjQ2LDYgQEAgc3ViZGlyLWFsbC1x
ZW11LXhlbi1kaXI6IHFlbXUteGVuLWRpci1maW5kCj4gPiAgCQktLXByZWZpeD0kKExJQkVYRUMp
IFwKPiA+ICAJCS0tbGliZGlyPSQoTElCRVhFQ19MSUIpIFwKPiA+ICAJCS0taW5jbHVkZWRpcj0k
KExJQkVYRUNfSU5DKSBcCj4gPiAtCQktLXNvdXJjZS1wYXRoPSQkc291cmNlIFwKPiA+ICAJCS0t
ZXh0cmEtY2ZsYWdzPSItRFhDX1dBTlRfQ09NUEFUX0VWVENITl9BUEk9MSBcCj4gPiAgCQktRFhD
X1dBTlRfQ09NUEFUX0dOVFRBQl9BUEk9MSBcCj4gPiAgCQktRFhDX1dBTlRfQ09NUEFUX01BUF9G
T1JFSUdOX0FQST0xIFwKPiA+IC0tIAo+ID4gQW50aG9ueSBQRVJBUkQKPiA+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
