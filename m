Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A4916AB2B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:18:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6GO1-0002rX-LY; Mon, 24 Feb 2020 16:15:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6GO0-0002rS-5O
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 16:15:12 +0000
X-Inumbo-ID: d4dc5bd0-5720-11ea-9217-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4dc5bd0-5720-11ea-9217-12813bfff9fa;
 Mon, 24 Feb 2020 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582560912;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=09ERKEkuv7gXz7q5pl9OpTDAxPuyg5r7ratvaKeZDV4=;
 b=eXVBvOoDqqonRKiDxzfBbeZYgu10PXsZU+TfK6NI8fK0kpGemRwO2XiM
 wOKSHsE++U5yk78jsxqPWDDAQCd5c+mJwekUrna363n5XhPrwLJ1iiRhS
 XJkLxN6ndCohr9ohL7Vg+L8Pz1BHnnvTPK/ajOl8v293OFlnBaqo+Ot7i U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8f6OOz3jVzJCKtaJqdtkwk8reJ9UKSzcCCUM+tsGh+9A/YnX7S1TDqnUfJiKKW5oBmLvOH0PYP
 07A5iIGmITDneP1y21ZELQ25ITo0x5vz3XKYp9oBk60CXt9QubydVADy8bg0eiwpBbYWyWCOXN
 /3XSD8Nz7CpveJTa9dIzdF6V2uH4b+AJnSsndey8UMHgONKrr0RII1T11WoYh7WO/00NNiHlNo
 YpM7mXlSMqRbtEAHRgsKfLR4gAgraP24FYnnIpHMOmkZSqHymQm6UpY3kDszhA798WqVhUyyw3
 4uI=
X-SBRS: 2.7
X-MesageID: 12898719
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12898719"
Date: Mon, 24 Feb 2020 17:15:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200224161503.GX4679@Air-de-Roger>
References: <20200224142219.30690-1-andrew.cooper3@citrix.com>
 <20200224144357.GQ4679@Air-de-Roger>
 <b1d64626-393a-ebb0-9f14-d9e01e959862@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1d64626-393a-ebb0-9f14-d9e01e959862@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/xmalloc Unify type handling in macros
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDM6NDk6NDdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNC8wMi8yMDIwIDE0OjQzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDI6MjI6MTlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBUaGUgbWFjcm9zIGluIHhtYWxsb2MuaCBhcmUgYSBtaXggb2YgdXNpbmcgdGhl
aXIgdHlwZSBwYXJhbWV0ZXIgZGlyZWN0bHksIGFuZAo+ID4+IHVzaW5nIHR5cGVvZigpLgo+ID4g
VGhlIG9ubHkgb25lcyBJIGNvdWxkIHNwb3QgaW4gdGhlIG5laWdoYm9yaG9vZCBhcmUKPiA+IHhy
ZWFsbG9jX2ZsZXhfc3RydWN0IGFuZCB4bWVtZHVwLCB3aGljaCBkb24ndCBoYXZlIGEgdHlwZSBw
YXJhbWV0ZXIKPiA+IGJ1dCByYXRoZXIgYSBwb2ludGVyIHBhcmFtZXRlciwgYW5kIGhlbmNlIHVz
ZSB0eXBlb2YgYWdhaW5zdCB0aGUKPiA+IHBhc3NlZCBwb2ludGVyLgo+ID4KPiA+PiBTd2l0Y2gg
dW5pZm9ybWx5IHRvIHRoZSBsYXR0ZXIgc28gZXhwcmVzc2lvbnMgY2FuIGJlIHVzZWQsCj4gPj4g
cmF0aGVyIHRoYW4gb25seSB0eXBlIG5hbWVzLgo+ID4gSSdtIGZpbmUgd2l0aCB0aGlzLCBidXQg
SSBkb24ndCB0aGluayB0aGV5IGFyZSBhIG1peCwgbWFjcm9zCj4gPiB1c2luZyBhIHR5cGUgcGFy
YW1ldGVyIGNsZWFybHkgZXhwZWN0IGEgdHlwZSwgd2hpbGUgbWFjcm9zIHVzaW5nIHB0cgo+ID4g
ZXhwZWN0IGEgcG9pbnRlciwgYW5kIGhlbmNlIHVzZSB0eXBlb2YgdG8gZ2V0IHRoZSB0eXBlLgo+
IAo+IEknbSBhZnJhaWQgdGhpcyBpc24ndCBoZWxwZnVsLsKgIEl0cyBub3QgYW4gYWNrL25hY2sg
b3IgYW55IHN1Z2dlc3Rpb24KPiBmcm9tIGEgY2hhbmdlLgoKT2gsIHNvcnJ5IEkgd2Fzbid0IGNs
ZWFyLiBJJ20gbm90IG9wcG9zZWQgdG8gdGhlIGNoYW5nZSwgYnV0IEkgd291bGQKcmVxdWVzdCBh
IHJld29yZCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UuIEllOgoKIkFsbG93IHRoZSBtYWNyb3MgaW4g
eG1hbGxvYy5oIHRvIGFsc28gc3VwcG9ydCBnZXR0aW5nIHBhc3NlZCBhbgppbnN0YW5jZSBvZiBh
IHR5cGUgaW5zdGVhZCBvZiB0aGUgdHlwZSBpdHNlbGYuIFNvbWUgbWFjcm9zIGFscmVhZHkKZXhw
ZWN0ZWQgYSBwb2ludGVyIHRvIGFuIGluc3RhbmNlIGdldHRpbmcgcGFzc2VkIGluLCBiZWNhdXNl
IHRoZXkgaGFkCnRvIG9wZXJhdGUgb24gaXQsIGJ1dCBvdGhlcnMgb25seSBzdXBwb3J0IGdldHRp
bmcgcGFzc2VkIGEgdHlwZS4iCgpPciBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzLiBXaGVuIEkg
cmVhZCB5b3VyIGNvbW1pdCBtZXNzYWdlIGl0IG1hZGUKbWUgdGhpbmsgdGhhdCB0aG9zZSBtYWNy
b3Mgd291bGQgcmFuZG9tbHkgZXhwZWN0IGEgdHlwZSBvciBhbiBpbnN0YW5jZQp3aXRob3V0IGFu
eSByZWFzb25pbmcsIGJ1dCBBRkFJQ1QgdGhlcmUncyBhIHJlYXNvbiB3aHkgdGhpbmdzIGFyZSB0
aGUKd2F5IHRoZXkgYXJlIG5vdy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
