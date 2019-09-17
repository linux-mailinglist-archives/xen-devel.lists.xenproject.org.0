Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC8B52DD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:23:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGDd-0002HU-Ry; Tue, 17 Sep 2019 16:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGDc-0002HP-HS
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:20:44 +0000
X-Inumbo-ID: 188ad0ba-d967-11e9-9619-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 188ad0ba-d967-11e9-9619-12813bfff9fa;
 Tue, 17 Sep 2019 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568737244;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=NkUioaP0lmGKrRGse7Sbf2QUDBBoVwjtSafs/Dc0l2s=;
 b=apxU0QaOfmlb+d/7iuroOD9TaIz9DyNoA2xbzQ7gDM75Q988FCjXTrUp
 BCrTgRkg6GEdaHpuQrGTswja9tmBzH0P8FgjNaGkdGVubUEYDzK9O1vaV
 jqryyuVbWf076t3OTR+FXso0SPCd+kypet2+4N2+E2ZrCfN45+bxAzzke g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1UmZmyUf6/oJNSvPRXWEYHjzIoviwQSLCtyhqHRoFZl4LSNht+64G/09TpfcJT4XVDqk8YjLi2
 kWXw8Y/am3cIauTj9Taa9OD1nF0XJdLWUNTdaghAhBvJahKaFtv4r5yXXgi/+NOS70TzMYNmoC
 LU3xy+hSZGjT/eXMAX9ztsMmqYo2CSmHHB5aPLla4/0LWtpSCCHwq45YsvUHDXOCoOC2hNzdIK
 K0mnfv8VKI5apEwqBfzvhfEZrhz0VuR5j0Ujz1/z3PbzimMVdjGOWgv9pbUdPphHR1Oaso/chF
 dKY=
X-SBRS: 2.7
X-MesageID: 5680529
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5680529"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.1977.641708.328884@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:20:09 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614103801.22619-7-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
 <20190614103801.22619-7-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 6/9] libxl_disk: Cut libxl_cdrom_insert
 into steps ..
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDYvOV0gbGlieGxfZGlzazogQ3V0IGxp
YnhsX2Nkcm9tX2luc2VydCBpbnRvIHN0ZXBzIC4uIik6Cj4gLi4gYW5kIHVzZSBhIG5ldyAic2xv
dyIgbG9jayB0byBhdm9pZCBob2xkaW5nIHRoZSB1c2VyZGF0YSBsb2NrIGFjcm9zcwo+IHNldmVy
YWwgZnVuY3Rpb25zLgo+IAo+IFRoaXMgcGF0Y2ggY3V0cyBsaWJ4bF9jZHJvbV9pbnNlcnQgaW50
byBkaWZmZXJlbnQgc3RlcC9mdW5jdGlvbiBidXQKPiB0aGVyZSBhcmUgc3RpbGwgY2FsbGVkIHN5
bmNocm9ub3VzbHkuIChUYWtpbmcgdGhlIGV2X2xvY2sgaXMgdGhlIG9ubHkKPiBzdGVwIHRoYXQg
bWlnaHQgYmUgYXN5bmNocm9ub3VzLikgQSBsYXRlciBwYXRjaCB3aWxsIGNhbGwgdGhlbQo+IGFz
eW5jaHJvbm91c2x5IHdoZW4gUU1QIGlzIGludm9sdmVkLgo+IAo+IFRoZWUgdXNlcmRhdGEgbG9j
ayAoanNvbl9sb2NrKSB1c2UgdG8gcHJvdGVjdCBhZ2FpbnN0IGNvbmN1cnJlbnQgY2hhbmdlCj4g
b2YgY2Ryb20gaXMgcmVwbGFjZWQgYnkgYW4gZXZfbG9jayB3aGljaCBjYW4gYmUgaGVsZCBhY3Jv
c3MgZGlmZmVyZW50Cj4gQ1RYX0xPQ0sgc2VjdGlvbnMuIFRoZSBqc29uX2xvY2sgaXMgc3RpbGwg
dXNlZCB3aGVuIHJlYWRpbmcvbW9kaWZ5aW5nCj4gdGhlIGRvbWFpbiB1c2VyZGF0YSAobWFuZGF0
b3J5KSBhbmQgdXBkYXRlIHhlbnN0b3JlIChtb3N0bHkgYmVjYXVzZQo+IGl0J3MgdXBkYXRlZCBh
cyB0aGUgc2FtZSB0aW1lIGFzIHRoZSB1c2VyZGF0YSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
