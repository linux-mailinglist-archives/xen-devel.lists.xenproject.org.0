Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1F181AD7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:10:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC21q-0007xD-Ao; Wed, 11 Mar 2020 14:08:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC21o-0007x5-Cd
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:08:08 +0000
X-Inumbo-ID: bb72cdf4-63a1-11ea-bec1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb72cdf4-63a1-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583935687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3Y9R5inaHWQo7bFgbeEZQQDupRJWpwIeQH7ppZFbed8=;
 b=WuyUVIsJJQ7qsK7NIjeyvPHB8aGmzvb/HiPlG5rwKl3V0KOJdl1A0IXE
 ndNN7G26Y5sAB7BR4LKTJA8qpE8yJrI4nleYaH1y1mUgC0TrRGzJdqhWk
 GHcgnJQ5WAY3zA7ZU75QYHyk7VwNzbnT3D7YQCCbDIVbE5safVbJ8lvN4 s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IAPsstNbKIjCa3HTOP5LwvM3qn3x6kmIyzZayKfPFbm9wnT9byy5FwDW87oTzLoRWUDNEJaK3O
 7PP/1BnOJvB3Mx3TX0lZRFu4otwFowURoRqcKtw9iv6B6U5Uuz3Q+089dAgYka3taul6KhmAF9
 S1+WRyO5LtRCbsMC3h9m5xYpsN79qTsZh8+kzESaAnrgK4kyhLhWSmg3OMVx4VDLrWqaC2S7VB
 fnb0hLPjS7UQDPSVmsXBCF8AesNZ1co/Ag0lyGZoiNo/U/1OH3bUlvgJkhwazNWXrmGPU/o0cp
 NG4=
X-SBRS: 2.7
X-MesageID: 14189585
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14189585"
Date: Wed, 11 Mar 2020 15:08:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200311135606.GB24458@Air-de-Roger.citrite.net>
References: <20200310134635.99810-1-roger.pau@citrix.com>
 <20200310134635.99810-2-roger.pau@citrix.com>
 <24167.47064.327387.933129@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24167.47064.327387.933129@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH OSSTEST v2 2/2] make-flight: add dom0 PVH
 test
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDM6NTI6NTZQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHYyIDIvMl0gbWFr
ZS1mbGlnaHQ6IGFkZCBkb20wIFBWSCB0ZXN0Iik6Cj4gPiBBZGQgYSBkb20wIFBWSCB0ZXN0LCB0
aGUgdGVzdCB0byBiZSBydW4gaXMgbGF1bmNoaW5nIGEgUFYgZ3Vlc3QKPiA+ICh0ZXN0LWRlYmlh
bikuIE5vdGUgdGhlIFBWSCBkb20wIHRlc3RzIGFyZSBvbmx5IGVuYWJsZWQgZm9yIFhlbiA+PQo+
ID4gNC4xMy4KPiA+IAo+ID4gVGhlIHJ1bnZhciBkaWZmZXJlbmNlIGlzOgo+IAo+IEFyZSB5b3Ug
c3VyZSB0aGlzIGlzIHN0aWxsIHRydWUgPyAgSXQgZG9lc24ndCBtZW50aW9uIHRoZSBpb21tdSBo
b3N0Cj4gZmxhZyB3aGljaAoKVXBkYXRlZCBpdCBvbiB2My4KCj4gPiArICAgICAgam9iX2NyZWF0
ZV90ZXN0IHRlc3QtJHhlbmFyY2gka2Vybi0kZG9tMGFyY2gtZG9tMHB2aC14bC0kY3B1dmVuZG9y
IFwKPiA+ICsgICAgICAgICAgICAgICAgdGVzdC1kZWJpYW4geGwgJHhlbmFyY2ggJGRvbTBhcmNo
ICRkZWJpYW5fcnVudmFycyBcCj4gPiArICAgICAgICAgICAgICAgIGFsbF9ob3N0ZmxhZ3M9JG1v
c3RfaG9zdGZsYWdzLGh2bS0kY3B1dmVuZG9yLGlvbW11IFwKPiA+ICsgICAgICAgICAgICAgICAg
eGVuX2Jvb3RfYXBwZW5kPSdkb20wPXB2aCx2ZXJib3NlJwo+IAo+IGFwcGVhcnMgaGVyZS4gIFNv
IHBsZWFzZSByZWdlbmVyYXRlIHRoaXMuCj4gCj4gSSBnYXZlIHlvdXIgcHJldmlvdXMgdmVyc2lv
biBhIFJldmlld2VkLWJ5LiAgSXMgdGhpcyB0aGUgb25seSB0aGluZwo+IHlvdSBjaGFuZ2VkID8K
Clllcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
