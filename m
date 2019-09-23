Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DDBB371
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 14:14:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCNBm-0001s9-TC; Mon, 23 Sep 2019 12:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCNBl-0001s4-1G
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 12:11:33 +0000
X-Inumbo-ID: 46d7c4ef-ddfb-11e9-95fc-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46d7c4ef-ddfb-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569240691;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zb0ysOsQQoL3C7l1g9FwZozoK9NPsA24Yj/Mz++KDP4=;
 b=dmhJnBuWEXJBcduHOoZn0cnRTSj0uQvuHtzzgTxkBvR2c9sm526WY6+g
 bWWyU1/+yGL5l6tzriikFCl3heI3/a3obDs57znPV5GcS77NqJBr/D+iG
 Ku5tP8qLiL87TNXA6molGt79jap0mC4fYt8vn4yXEPLYsW+ZrYMlw7Sh6 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OqyKl099bLy4qDFsBS8DTkThqgFffHWfNGEtkaknqif1WLWfRsB6AgoBuYZlDR6gDiYo12a7CN
 Re/CFloWjvpl5yYYJm5sod1vjFhRNH389JOJ1fVs1O9Xy9xCyiqht1PK2wEL6AEqMKO/nYIuGc
 p5XwuH27yYIMZpVuxzt9E4CaENvaVuBRnPUgCLKCUg3KkDa9iB7IOrkkoBlezL+cck2Dh1lSaz
 SkRCvmGeGEfFyvKEqz6bqX+8odQWhEUMEs/aIVPRlWnV6C4Y8D3N4TCM343h45FT2KnJZoSG59
 hTQ=
X-SBRS: 2.7
X-MesageID: 5928969
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,539,1559534400"; 
   d="scan'208";a="5928969"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Wei Liu' <wl@xen.org>
Thread-Topic: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
Thread-Index: AQHVcfc0mf3MiCY5wEmvlk07Intk2qc5FCDA///qIQCAACrzIA==
Date: Mon, 23 Sep 2019 12:11:26 +0000
Message-ID: <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
In-Reply-To: <20190923112718.qtx6qpme3ghsmf6l@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMjMgU2VwdGVtYmVyIDIwMTkgMTI6MjcKPiBUbzogUGF1bCBEdXJyYW50IDxQYXVs
LkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogJ1dlaSBMaXUnIDx3bEB4ZW4ub3JnPjsgWGVuIERl
dmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IFdlaSBMaXUK
PiA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBNaWNoYWVsIEtlbGxleQo+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIGZvci1uZXh0IFJG
QyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiAKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAx
MDo0ODo0NUFNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlz
dHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiA+IFNlbnQ6IDIzIFNl
cHRlbWJlciAyMDE5IDExOjA5Cj4gPiA+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+ID4gPiBDYzogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyCj4gPEFuZHJldy5D
b29wZXIzQGNpdHJpeC5jb20+Owo+ID4gPiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9z
b2Z0LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25u
ZQo+ID4gPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxd
IFtQQVRDSCBmb3ItbmV4dCBSRkMgMC84XSBQb3J0IFhlbiB0byBIeXBlci1WCj4gPiA+Cj4gPiA+
IEhpIGFsbAo+ID4gPgo+ID4gPiBJbiBjYXNlIHlvdSdyZSB3b25kZXJpbmcsIEkgY2FuIGFscmVh
ZHkgcnVuIGEgZnVsbHkgZmxlZGdlZCBYZW4gc3lzdGVtIG9uCj4gPiA+IEh5cGVyLVYgd2l0aCBl
bXVsYXRlZCBkaXNrIGFuZCBuZXR3b3JrLgo+ID4gPgo+ID4gPiBUaGlzIGlzIHRoZSB2ZXJ5IGZp
cnN0IHN0YWdlIGZvciBwb3J0aW5nIFhlbiB0byBydW4gb24gSHlwZXItViB3aXRoIGFsbCB0aGUK
PiA+ID4gZ29vZGllcyBIeXBlci1WIGhhcyB0byBvZmZlci4gIFdpdGggdGhpcyBzZXJpZXMsIFhl
biBjYW4gc3VjY2Vzc2Z1bGx5IGRldGVjdAo+ID4gPiBIeXBlci1WIGFuZCBwcmludHMgb3V0IGEg
bWVzc2FnZS4gIEkgd291bGQgbGlrZSB0byBmaXJzdCBnZXQgdGhlIGRpcmVjdG9yeQo+ID4gPiBz
dHJ1Y3R1cmUgYW5kIGtjb25maWcgb3B0aW9ucyBhZ3JlZWQgdXBvbi4KPiA+ID4KPiA+ID4gVGhl
cmUgYXJlIHR3byBtYWpvciBhcmVhcyB0byBiZSB3b3JrZWQgb246Cj4gPiA+ICAgKiBNYWtlIERv
bTAgYWJsZSB0byB1c2UgSHlwZXItVidzIHN5bnRoZXRpYyBkZXZpY2VzLgo+ID4gPiAgICogTWFr
ZSBYZW4gdXNlIG9mIHRoZSBzeW50aGV0aWMgdGltZXIsIHJlZmVyZW5jZSBUU0MgYW5kIGVubGln
aHRlbm1lbnQgVk1DUwo+ID4gPiAgICAgYW5kIG90aGVyIGludGVyZmFjZXMuCj4gPiA+Cj4gPiA+
IFRoZXkgYXJlbid0IHRyaXZpYWwsIGFuZCB0aW1lIGNhbiBiZSBzY2FyY2Ugb24gbXkgc2lkZSwg
c28gSSBpbnRlbmQgdG8gcG9zdAo+ID4gPiBwYXRjaGVzIHBpZWNlIG1lYWwgd2hlbiB0aGV5IGFy
ZSByZWFkeS4KPiA+ID4KPiA+ID4gUXVlc3Rpb25zIGFuZCBjb21tZW50cyBhcmUgd2VsY29tZS4K
PiA+Cj4gPiBZYXkhIEdsYWQgeW91IGZvdW5kIHRoZSB0aW1lIHRvIGRvIHRoaXMgOi0pIE1ha2lu
ZyB1c2Ugb2YgdGhlIHN5bmljLAo+ID4gc3RpbWVyLCB3aWxsIGJlIHVzZWZ1bC4gVG8gZ2V0IHRo
ZSBiZW5lZml0IGZvciBuZXN0ZWQgZ3Vlc3RzIHRob3VnaCwgSQo+ID4gYXNzdW1lIHdlJ2xsIG5l
ZWQgdG8gZXhwb3NlZCBlbmxpZ2h0ZW5lZCBWTUNTLCBFUFQgZmx1c2gsIGV0Yy4KPiA+IHRocm91
Z2g/Cj4gCj4gUGVyIFRMRlMsIGVWTUNTIHNob3VsZCBiZSB1c2VkIGJ5IEwxIFhlbi4KClllcywg
SSBndWVzcyBpdCBvbmx5IG5lZWRzIHRvIGJlIHVzZWQgYnkgTDEsIGJ1dCBXaW5kb3dzIGlzIHVz
aW5nIGFuIGluY3JlYXNpbmcgbnVtYmVyIG9mIFZNcyBmb3IgdmFyaW91cyBwdXJwb3NlcyBzbyBJ
IHRoaW5rIG1ha2luZyBpdCBzdGFjayB3ZWxsIHdvdWxkIGJlIHVzZWZ1bC4KCj4gCj4gTm90IHN1
cmUgd2hhdCB5b3UgbWVhbnQgYnkgRVBUIGZsdXNoLiBJZiB5b3UgbWVhbiB0aGluZ3MgbGlrZQo+
IEh2Rmx1c2hHdWVzdFBoeXNpY2FsQWRkcmVzc1NwYWNlLCBJIHRoaW5rIHRoZXkgc2hvdWxkIGJl
IHVzZWQgYnkgWGVuCj4gb25seSBhcyB3ZWxsLiBJJ20gbm90IHN1cmUgd2hldGhlciB0aGV5IHNo
b3VsZCBiZSBleHBvc2UgdG8gTDIgZ3Vlc3RzLgo+IAoKWWVzLCB0aGF0J3Mgd2hhdCBJIG1lYW50
IGFuZCwgYWdhaW4sIEkgd2FzIHRoaW5raW5nIGFib3V0IHRoZSBuZXN0ZWQgV2luZG93cyBndWVz
dCB1c2luZyBWTXMgaXRzZWxmLgoKPiBUaGVyZSBhcmUgaHlwZXJjYWxscyBmb3IgdmlydHVhbCBU
TEIgbWFuYWdlbWVudC4gV2UgbWF5IGNob29zZSB0byBleHBvc2UKPiB0aGVtIHRvIEwyIGd1ZXN0
cyBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlLgo+IAoKRG8geW91IG1lYW4gJ0RpcmVjdCBWaXJ0dWFs
IEZsdXNoJz8gVGhlIGh5cGVyY2FsbHMgaW4gcXVlc3Rpb24gYXJlIGFscmVhZHkgaGFuZGxlZCBp
biB2aXJpZGlhbiBmb3IgdGhlIHB1cnBvc2VzIG9mIHJlbW90ZSBUTEIgZmx1c2gsIHNvIEkgZ3Vl
c3MgaXQgd291bGQgYmUgYSBxdWVzdGlvbiBvZiB3aXJpbmcgdGhlbSB0aHJvdWdoLgoKICBQYXVs
Cgo+IFdlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
