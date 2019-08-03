Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF680735
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 18:25:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htwo8-0001F6-9U; Sat, 03 Aug 2019 16:23:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Udpx=V7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1htwo6-0001F1-Uc
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 16:22:58 +0000
X-Inumbo-ID: f0fd3c56-b60a-11e9-aa3e-b7bd986c9be1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0fd3c56-b60a-11e9-aa3e-b7bd986c9be1;
 Sat, 03 Aug 2019 16:22:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XfefYVlWeQAojupuuS7ICYkBVu1UTpiG4dG8a3L2IKiSSoZ+J/AZTUKJwQYwWk2BVO8sQiVIo2
 Bc+Sz+K8PNFWhWPWsTnMwS+zU8BUJZDVqmgYXpR+xPqlVSezkIwjWzCb10sHAcFAalz0IdrBh6
 0IU8xtOjZ+0WpaLYB9PKVzOYyLrSeHm4ECWlnji7gvKk858jdOGC7ig+0RJtsSkc/ZuCuiGGn7
 R3JLARb1rZvZShk+WyI47ChGWmmaaNZ89dTajrC7x0boq/YMwEaEyt5Xcb6j8kW0IkkvdNjGxY
 bzA=
X-SBRS: 2.7
X-MesageID: 3820949
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,342,1559534400"; 
   d="scan'208";a="3820949"
To: Dario Faggioli <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ab677cc1-1d65-ff4e-37b8-89e6c600c8fd@citrix.com>
Date: Sat, 3 Aug 2019 17:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156458463216.7075.10552410480716651842.stgit@Palanthas>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/3] automation: build Xen in openSUSE
 Tumbleweed
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDcvMjAxOSAxNzo1OCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gVGhlIG9wZW5TVVNF
IGRpc3RyaWJ1dGlvbiBjb21lcyBpbiB0d28gZmxhdm91cnM6IExlYXAsIHdoaWNoIGlzCj4gbm9u
LXJvbGxpbmcsIGFuZCByZWxlYXNlZCBhbm51YWx5LCBhbmQgVHVtYmxld2VlZCwgd2hpY2ggaXMg
cm9sbGluZy4KPgo+IEluIGdlbmVyYWwsIHRoZXkgYXJlIHF1aXRlIHNpbWlsYXIsIGJ1dCB0aGUg
dmVyc2lvbnMgb2YgdGhlIHNvZnR3YXJlCj4gdGhleSBzaGlwIGNhbiBiZSBzaWduaWZpY2FudGx5
IGRpZmZlcmVudC4gQXMgaXQgaXMgZWFzeSB0byBpbWFnaW5lLAo+IFR1bWJsZXdlZWQsIGJlaW5n
IHJvbGxpbmcsIGhhcyBtdWNoIG1vcmUgcmVjZW50IGFuZCB1cGRhdGVkIHBhY2thZ2VzLgo+Cj4g
QWN0dWFsbHksIFR1bWJsZXdlZWQgb2Z0ZW4gc2hpcHMgdGhlIG1vc3QgdXBkYXRlZCByZWxlYXNl
cyBvZiB2YXJpb3VzCj4gc29mdHdhcmUgYW5kIHByb2plY3RzLCBhbW9uZyBtYW55IGRpc3RyaWJ1
dGlvbiBhcm91bmQuCj4KPiBGb3IgaW5zdGFuY2UsIHJpZ2h0IG5vdywgVHVtYmxld2VlZCBoYXMg
Z2NjIDkuMS4xLiBGZWRvcmEgUmF3aGlkZSBhbHNvCj4gc2VlbXMgdG8gaGF2ZSA5LjEuMSwgd2hp
bGUgRmVkb3JhIDMwIGhhcyA5LjAuMS4gRGViaWFuIFVuc3RhYmxlIGFuZAo+IFVidW50dSBEaXNj
byBib3RoIGhhdmUgOC4zLjAsIEFGQUlDVC4KPgo+IE9mIGNvdXJzZSwgaXQncyBub3QgYXQgYWxs
IGxpa2UgInRoZSBtb3JlIHVwZGF0ZWQgdGhlIGJldHRlciIsIG9yCj4gYW55dGhpbmcgbGlrZSB0
aGF0ISBJdCdzIGp1c3QgdGhhdCBJIHNlZSBzb21lIHZhbHVlIGluIGhhdmluZywgYXMgYSBwYXJ0
Cj4gb2Ygb3VyIENJOgo+IC0gbW9yZSBkaXZlcnNpdHksIGluIHRlcm1zIG9mIHZlcnNpb25zIG9m
IHRoZSBwYWNrYWdlcy9zb2Z0d2FyZSB3ZSB0cnkKPiAgIHRvIGJ1aWxkIFhlbiB3aXRoIGFuZCBh
Z2FpbnN0Owo+IC0gYSAiYmxlZWRpbmcgZWRnZSIgZW52aXJvbm1lbnQsIGluIG9yZGVyIHRvIGNh
dGNoLCBvciBhdCBsZWFzdCBiZQo+ICAgYXdhcmUgb2YsIGJ1aWxkIGlzc3VlcyB3aXRoIGxhdGVz
dCBjb21waWxlcnMgYW5kL29yIHdoZW4gbGlua2luZwo+ICAgYWdhaW5zdCB0aGUgbGF0ZXN0IHZl
cnNpb24gb2YgdGhpcyBhbmQgdGhhdCBsaWJyYXJ5Lgo+Cj4gSW50ZXJlc3RpbmdseSwgaW4gdGhl
IHBhc3QgY291cGxlIG9mIGRheXMsIGEgZmV3IGJ1aWxkIGlzc3VlcyBvZiBYZW4sCj4gcWVtdS14
ZW4gYW5kIGlweGUgKGF0IHRoZSBjb21taXQgdGhhdCB3ZSB3ZXJlIGNoZWNraW5nIG91dCkgd2l0
aCBnY2MKPiA5LjEuMSB3aGVyZSBkaXNjb3ZlcmVkIGFuZCBmaXhlZC4gQW5kIC0tYXQgbGVhc3Qg
YXMgZmFyIGFzIHRoZSBvbmVzCj4gSSd2ZSByZXBvcnRlZC9maXhlZC0tIEkgZm91bmQgYWJvdXQg
dGhlbSB3aGlsZSBidWlsZGluZyBYZW4gaW4KPiBvcGVuU1VTRSBUdW1ibGV3ZWVkICh3aGlsZSB3
b3JraW5nIG9uIHRoaXMgcGF0Y2ggc2VyaWVzIDotRCApLgo+Cj4gSGFwcHkgdG8gaGVhciB3aGF0
IHBlb3BsZSB0aGluayBhYm91dCBhbGwgdGhpcy4gOi0pCj4KPiBPaCwgQlRXLCBhcGFydCBmcm9t
IGFkZGluZyB0aGUgVHVtYmxld2VlZCBkb2NrZXJmaWxlIGFuZCBDSSBqb2JzLCB0aGUKPiBzZXJp
ZXMgYWxzbyBkb2VzIHNvbWUgbWlub3IgdHdlYWtpbmcgb2YgdGhlIGFscmVhZHkgcHJlc2VudCBv
cGVuU1VTRQo+IExlYXAgZG9ja2VyZmlsZSAoaW4gcGF0Y2ggMSkuCj4KPiBUaGFua3MgYW5kIFJl
Z2FyZHMuCj4gLS0tCj4gRGFyaW8gRmFnZ2lvbGkgKDMpOgo+ICAgICAgIGF1dG9tYXRpb246IHRy
eSB0byBrZWVwIG9wZW5TVVNFIExlYXAgaW1hZ2UgYSBsaXR0bGUgc21hbGxlcgoKSSd2ZSBwdXNo
ZWQgcGF0Y2ggMSwgYW5kIHJlZnJlc2hlZCB0aGUgbGVhcCBjb250YWluZXIuCgpJIGhhdmUgYWxz
byBwdXNoZWQgYSB0dW1ibGV3ZWVkIGNvbnRhaW5lciwgYnV0IHRoZSBidWlsZCBpcyBjdXJyZW50
bHkKZmFpbGluZyBpbiBRZW11LgoKaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3Bs
ZS9hbmR5aGhwL3hlbi8tL2pvYnMvMjY1MzAxMzAzCgpJIGhhdmUgYWxzbyBwdXNoZWQgcGF0Y2gg
MiwgYmVjYXVzZSB0aGF0IGlzIHRoZSBkb2NrZXJmaWxlIHdoaWNoIG1hdGNoZXMKdGhlIGN1cnJl
bnQgY29udGFpbmVyLsKgIEhvd2V2ZXIsIEkgd29uJ3QgcHVzaCBwYXRjaCAzIChhZGRpbmcgaXQg
aW50bwpDSSkgdW50aWwgdGhlIGJ1aWxkIGVycm9ycyBhcmUgcmVzb2x2ZWQuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
