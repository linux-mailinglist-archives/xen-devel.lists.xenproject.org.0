Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F3DB60FB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAWkF-0003og-Ih; Wed, 18 Sep 2019 09:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAWkD-0003o1-O8
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:59:29 +0000
X-Inumbo-ID: 0023e19e-d9fb-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0023e19e-d9fb-11e9-b299-bc764e2007e4;
 Wed, 18 Sep 2019 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568800768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZlMkbgKNa/JuDyXnWBExbh/6C4JIM8OVmuPjGEDLT6c=;
 b=EcUivwF6Ut5WOmzdemmb+hXC6gm0o3c6xkobrgBX3O3THRZiYL84493e
 uRgpVxaTaiy61vrFB0B0nnd7uR11o+pTNgZVwqkTZA2PcBEyA2F97BxJA
 jyKVxU83kQ8CpOeKynMQ0eLqOu7ZZOdN47cYPz6kYS8TvQF9297zUJd08 c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tTRjb/hvT1QXaXpFUclEr4dcIhD2dYCXmZtUUEkadb6hvJk8vDkREXL6eQS7h+sFhP5cGlDaNb
 UgeSwFfnj7CXbqkHUc+MsvpYLW7kcZjXcWQbVvyJjLCJWi9+P8CNk0P58HKrqeEnCsNovzRZNO
 si6/pLtGI9DCvkvxbgtf2kLqDOd6uWtzP3dpMBDxjdndQMESsyz/OnglBKPxjoecQNSSqsa79i
 deP0KKzxWMPfYiak5tLacbdurQoKQEPZb0QrdEJNQfLcVDRneDERM+bPbwmLr6GPKHlVcnfP4W
 tkk=
X-SBRS: 2.7
X-MesageID: 5715934
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5715934"
Date: Wed, 18 Sep 2019 10:59:24 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918095924.GJ1308@perard.uk.xensource.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
 <20190614103801.22619-4-anthony.perard@citrix.com>
 <23936.65374.447070.19120@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23936.65374.447070.19120@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v2 3/9] libxl_internal: Introduce
 libxl__ev_lock for devices hotplug via QMP
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

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDQ6NDQ6MzBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDMvOV0gbGlieGxfaW50ZXJu
YWw6IEludHJvZHVjZSBsaWJ4bF9fZXZfbG9jayBmb3IgZGV2aWNlcyBob3RwbHVnIHZpYSBRTVAi
KToKPiA+IFRoZSBjdXJyZW50IGxvY2sgYGRvbWFpbl91c2VyZGF0YV9sb2NrJyBjYW4ndCBiZSB1
c2VkIHdoZW4gbW9kaWZpY2F0aW9uCj4gPiB0byBhIGd1ZXN0IGlzIGRvbmUgYnkgc2VuZGluZyBj
b21tYW5kIHRvIFFFTVUsIHRoaXMgaXMgYSBzbG93IHByb2Nlc3MKPiA+IGFuZCByZXF1aXJlcyB0
byBjYWxsIENUWF9VTkxPQ0ssIHdoaWNoIGlzIG5vdCBwb3NzaWJsZSB3aGlsZSBob2xkaW5nCj4g
PiB0aGUgYGRvbWFpbl91c2VyZGF0YV9sb2NrJy4KPiA+IAo+ID4gVG8gcmVzb2x2ZSB0aGlzIGlz
c3VlLCB3ZSBjcmVhdGUgYSBuZXcgbG9jayB3aGljaCBjYW4gdGFrZSBvdmVyIHBhcnQKPiA+IG9m
IHRoZSBqb2Igb2YgdGhlIGpzb25fbG9jay4KPiAKPiBUaGFua3MuICBUaGlzIGlzIGJhc2ljYWxs
eSBmaW5lLiAgSSBoYXZlIG9ubHkgdHJpdmlhbCBjb21tZW50cy4KPiAKPiA+ICt2b2lkIGxpYnhs
X19ldl9sb2NrX2dldChsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9sb2NrICpsb2NrKQo+IAo+
IEkgd29uZGVyIGlmIHRoaXMgaXMgdGhlIHJpZ2h0IG5hbWUgZm9yIHRoaXMuICBFZmZlY3RpdmVs
eSB5b3UgaGF2ZQo+IGNhbGxlZCB0aGlzIGxvY2sgImxvY2siLiAgTWF5YmUgImRsb2NrIiBvciAi
ZGV2bG9jayIgb3IgInNkbG9jayIgKHNsb3cKPiBkZXZpY2UgbG9jaykgb3Igc29tZXRoaW5nID8g
IFNvcnJ5IGZvciBiaWtlc2hlZGRpbmcgYnV0IGhvcGVmdWxseQo+IHNlZGRlcnkgd2lsbCBiZSBl
YXN5LgoKImRldmxvY2siIHNvdW5kcyBmaW5lLiBTbyB3ZSdsbCBoYXZlICJsaWJ4bF9fZXZfZGV2
bG9jayIKYW5kICJsaWJ4bF9fZXZfZGV2bG9ja19nZXQiLgoKPiA+ICtzdGF0aWMgdm9pZCBldl9s
b2NrX3ByZXBhcmVfZm9yayhsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9sb2NrICpsb2NrKQo+
ID4gK3sKPiAuLi4KPiA+ICsgICAgICAgICAgICAgICAgLyogQWxsIG90aGVyIGVycm5vOiBFQkFE
RiwgRUlOVkFMLCBFTk9MQ0ssIEVXT1VMREJMT0NLICovCj4gPiArICAgICAgICAgICAgICAgIExP
R0VEKEVSUk9SLCBkb21pZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgInVuZXhwZWN0ZWQg
ZXJyb3Igd2hpbGUgdHJ5aW5nIHRvIGxvY2sgJXMsIGZkPSVkLCBlcnJubz0lZCIsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgIGxvY2tmaWxlLCBmZCwgZXJybm8pOwo+IAo+IExPR0VEIHByaW50
cyBzdHJlcnJvcihlcnJubykgc28geW91IGRvbid0IG5lZWQgdG8gcHJpbnQgdGhlIG51bWVyaWMK
PiB2YWx1ZSB3aXRoICVkIHRvby4gIFRoYXQncyB3aGF0IHRoZSBFIGluIGl0cyBuYW1lIGlzLgoK
WWVzLCBzaW1wbGUgY29weS1wYXN0ZSBlcnJvciwgSSdsbCByZW1vdmUgdGhlIGVycm5vIHZhbHVl
LgoKPiA+ICt2b2lkIGxpYnhsX19ldl91bmxvY2sobGlieGxfX2djICpnYywgbGlieGxfX2V2X2xv
Y2sgKmxvY2spCj4gPiArewo+ID4gKyAgICBpbnQgcjsKPiA+ICsKPiA+ICsgICAgYXNzZXJ0KCFs
aWJ4bF9fZXZfY2hpbGRfaW51c2UoJmxvY2stPmNoaWxkKSk7Cj4gPiArCj4gPiArICAgIC8qIEl0
J3MgaW1wb3J0YW50IHRvIHVubGluayB0aGUgZmlsZSBiZWZvcmUgcmVsZWFzaW5nIHRoZSBsb2Nr
IHRvIGF2b2lkCj4gPiArICAgICAqIHRoZSBmb2xsb3dpbmcgcmFjZSAoaWYgdW5sb2NrL2Nsb3Nl
IGJlZm9yZSB1bmxpbmspOgo+ID4gKyAgICAgKgo+ID4gKyAgICAgKiAgIFAxIExPQ0sgICAgICAg
ICAgICAgICAgICAgICAgICAgUDIgVU5MT0NLCj4gPiArICAgICAqICAgZmQxID0gb3Blbihsb2Nr
ZmlsZSkKPiA+ICsgICAgICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVubG9j
ayhmZDIpCj4gPiArICAgICAqICAgZmxvY2soZmQxKQo+ID4gKyAgICAgKiAgIGZzdGF0IGFuZCBz
dGF0IGNoZWNrIHN1Y2Nlc3MKPiA+ICsgICAgICogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVubGluayhsb2NrZmlsZSkKPiA+ICsgICAgICogICByZXR1cm4gbG9jawo+ID4gKyAg
ICAgKgo+ID4gKyAgICAgKiBJbiBhYm92ZSBjYXNlIFAxIHRoaW5rcyBpdCBoYXMgZ290IGhvbGQg
b2YgdGhlIGxvY2sgYnV0Cj4gPiArICAgICAqIGFjdHVhbGx5IGxvY2sgaXMgcmVsZWFzZWQgYnkg
UDIgKGxvY2tmaWxlIHVubGlua2VkKS4KPiA+ICsgICAgICovCj4gCj4gSSB3b25kZXIgaWYgaXQg
d291bGQgYmUgYmV0dGVyIHRvIHJlZmVyIHRvIHRoZSBvdGhlciBjb3B5IG9mIHRoaXMKPiBjb21t
ZW50IGJ5IGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRhLgoKSXQgd291bGQgYmUgcHJvYmFi
bHkgZmluZS4gSWYgdGhlIGNvbW1lbnQgZ2V0cyByZW1vdmVkIG9yIHRoZSBmdW5jdGlvbgpnZXRz
IHJlbmFtZWQsIG9uZSBjYW4gYGdpdCBibGFtZWAgdG8gZmlndXJlIG91dCB3aGF0IHRoZSByZWZl
cmVuY2UgaXMKZm9yLgoKSSdsbCByZXBsYWNlIHRoZSBjb21tZW50IGJ5IHRoaXMgbmV3IG9uZToK
ICAgIC8qIFNlZSB0aGUgcmF0aW9uYWxlIGluIGxpYnhsX191bmxvY2tfZG9tYWluX3VzZXJkYXRh
KCkKICAgICAqIGFib3V0IHdoeSB3ZSBkbyB1bmxpbmsoKSBiZWZvcmUgdW5sb2NrKCkuICovCgpU
aGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
