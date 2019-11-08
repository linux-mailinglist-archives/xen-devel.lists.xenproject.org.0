Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A48F4468
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:23:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1Nf-0003et-LN; Fri, 08 Nov 2019 10:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mw+O=ZA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iT1Ne-0003eM-E4
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:20:38 +0000
X-Inumbo-ID: 678713b8-0211-11ea-a1d4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 678713b8-0211-11ea-a1d4-12813bfff9fa;
 Fri, 08 Nov 2019 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573208436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZUjgEgnWiLZXVC3yKn77IA3MaOoRCiaj369EXFJ0d50=;
 b=aidOu5f/Q3cVvQn1oM6e1p4eyuAf8bZJ9+iSyar6knP6asPjair8Xkf7
 9IDwJM93KmLoW0eGbnZXcCxF7ZkqqSWf7m3hNVCkbLNBD0r4GIubfTPy6
 y0eWlF5YkPxeqyde/HK86k2wat58P43UhjBkEZvoEH7siJgYDPBpYKZHJ M=;
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
IronPort-SDR: mJCaayr62LwnkFbINpI4+SZzSaxBYhRyPp6p4Aw+51Qryi1RG+wMGfLBqOtiInCA2jXO7CViIu
 TFnl/l1Q3GFRpBAfJ/aEGYB1S4Xokr4PXX7m2vfOUisy8LTKR6yFDELCO37gHG02qlZV71Gc03
 +4EsFMRkJ54df6WYprXn/kCN/8OLS7lwVJBY7n+C0jt7s3m/MpSGeh41BlzZ6dY0uLRtUFM8AE
 YyMCV3JH6/QhVSTEH6VuM/aAUTUkUAuhwM2feLXAe6SI/uiS5xedFn5GBsBoTZ8tINMg2YFAWn
 Ga8=
X-SBRS: 2.7
X-MesageID: 8457101
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,281,1569297600"; 
   d="scan'208";a="8457101"
Date: Fri, 8 Nov 2019 11:20:23 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20191108102023.GD17494@Air-de-Roger>
References: <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
 <20191031152304.GY17494@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D5E24A7@SHSMSX104.ccr.corp.intel.com>
 <20191104094633.GZ17494@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D5E9FBF@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D5E9FBF@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDI6MjU6MDVBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5j
b21dCj4gPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDQsIDIwMTkgNTo0NyBQTQo+ID4gCj4gPiBP
biBTYXQsIE5vdiAwMiwgMjAxOSBhdCAwNzo0ODowNkFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90
ZToKPiA+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJp
eC5jb21dCj4gPiA+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMzEsIDIwMTkgMTE6MjMgUE0K
PiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgT2N0IDMxLCAyMDE5IGF0IDA3OjUyOjIzQU0gLTA3MDAs
IEpvZSBKaW4gd3JvdGU6Cj4gPiA+ID4gPiBPbiAxMC8zMS8xOSAxOjAxIEFNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+ID4gPiA+ID4gT24gMzAuMTAuMjAxOSAxOTowMSwgSm9lIEppbiB3cm90ZToK
PiA+ID4gPiA+ID4+IE9uIDEwLzMwLzE5IDEwOjIzIEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+ID4gPiA+ID4gPj4+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDA5OjM4OjE2QU0gLTA3MDAs
IEpvZSBKaW4gd3JvdGU6Cj4gPiA+ID4gPiA+Pj4+IE9uIDEwLzMwLzE5IDE6MjQgQU0sIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gPiA+Pj4+PiBDYW4geW91IHRyeSB0byBhZGQgdGhl
IGZvbGxvd2luZyBkZWJ1ZyBwYXRjaCBvbiB0b3Agb2YgdGhlCj4gPiBleGlzdGluZwo+ID4gPiA+
ID4gPj4+Pj4gb25lIGFuZCByZXBvcnQgdGhlIG91dHB1dCB0aGF0IHlvdSBnZXQgb24gdGhlIFhl
biBjb25zb2xlPwo+ID4gPiA+ID4gPj4+Pgo+ID4gPiA+ID4gPj4+PiBBcHBsaWVkIGRlYnVnIHBh
dGNoIGFuZCBydW4gdGhlIHRlc3QgYWdhaW4sIG5vdCBvZiBhbnkgbG9nCj4gPiBwcmludGVkLAo+
ID4gPiA+ID4gPj4+PiBhdHRhY2hlZCBYZW4gbG9nIG9uIHNlcmlhbCBjb25zb2xlLCBzZWVtcyBw
aV91cGRhdGVfaXJ0ZSgpIG5vdAo+ID4gYmVlbgo+ID4gPiA+ID4gPj4+PiBjYWxsZWQgZm9yIGlv
bW11X2ludHBvc3Qgd2FzIGZhbHNlLgo+ID4gPiA+ID4gPj4+Cj4gPiA+ID4gPiA+Pj4gSSBoYXZl
IHRvIGFkbWl0IEknbSBsb3N0IGF0IHRoaXMgcG9pbnQuIERvZXMgaXQgbWVhbiB0aGUgb3JpZ2lu
YWwKPiA+ID4gPiA+ID4+PiBpc3N1ZSBoYWQgbm90aGluZyB0byBkbyB3aXRoIHBvc3RlZCBpbnRl
cnJ1cHRzPwo+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4+IExvb2tzIHdoZW4gaW5qZWN0IGlycSBi
eSB2bGFwaWNfc2V0X2lycSgpLCBpdCBjaGVja2VkIGJ5Cj4gPiA+ID4gPiA+PiBodm1fZnVuY3Mu
ZGVsaXZlcl9wb3N0ZWRfaW50ciByYXRoZXIgdGhhbiBpb21tdV9pbnRwb3N0Ogo+ID4gPiA+ID4g
Pj4KPiA+ID4gPiA+ID4+ICAxNzYgICAgIGlmICggaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2lu
dHIgKQo+ID4gPiA+ID4gPj4gIDE3NyAgICAgICAgIGh2bV9mdW5jcy5kZWxpdmVyX3Bvc3RlZF9p
bnRyKHRhcmdldCwgdmVjKTsKPiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+PiBBbmQgZGVsaXZlcl9w
b3N0ZWRfaW50cigpIHdvdWxkIGJlIHRoZXJlLCB3aGVuIHZteCBlbmFibGVkOgo+ID4gPiA+ID4g
Pj4KPiA+ID4gPiA+ID4+IChYRU4pIEhWTTogVk1YIGVuYWJsZWQKPiA+ID4gPiA+ID4+IChYRU4p
IEhWTTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRldGVjdGVkCj4gPiA+ID4gPiA+
PiAoWEVOKSBIVk06IEhBUCBwYWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCCj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IEkgY2FuJ3Qgc2VlIHRoZSBjb25uZWN0aW9uLiBzdGFydF92bXgoKSBoYXMKPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gICAgIGlmICggY3B1X2hhc192bXhfcG9zdGVkX2ludHJfcHJv
Y2Vzc2luZyApCj4gPiA+ID4gPiA+ICAgICB7Cj4gPiA+ID4gPiA+ICAgICAgICAgYWxsb2NfZGly
ZWN0X2FwaWNfdmVjdG9yKCZwb3N0ZWRfaW50cl92ZWN0b3IsCj4gPiA+ID4gcGlfbm90aWZpY2F0
aW9uX2ludGVycnVwdCk7Cj4gPiA+ID4gPiA+ICAgICAgICAgaWYgKCBpb21tdV9pbnRwb3N0ICkK
PiA+ID4gPiA+ID4gICAgICAgICAgICAgYWxsb2NfZGlyZWN0X2FwaWNfdmVjdG9yKCZwaV93YWtl
dXBfdmVjdG9yLAo+ID4gPiA+IHBpX3dha2V1cF9pbnRlcnJ1cHQpOwo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiAgICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS5kZWxpdmVyX3Bvc3RlZF9pbnRyID0K
PiA+IHZteF9kZWxpdmVyX3Bvc3RlZF9pbnRyOwo+ID4gPiA+ID4gPiAgICAgICAgIHZteF9mdW5j
dGlvbl90YWJsZS5zeW5jX3Bpcl90b19pcnIgICAgID0gdm14X3N5bmNfcGlyX3RvX2lycjsKPiA+
ID4gPiA+ID4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUudGVzdF9waXIgICAgICAgICAgICA9
IHZteF90ZXN0X3BpcjsKPiA+ID4gPiA+ID4gICAgIH0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
aS5lLiB0aGUgaG9vayBpcyBwcmVzZW50IG9ubHkgd2hlbiBwb3N0ZWQgaW50ZXJydXB0cyBhcmUK
PiA+ID4gPiA+ID4gYXZhaWxhYmxlIGluIGdlbmVyYWwuIEkuZS4gYWxzbyB3aXRoIGp1c3QgQ1BV
LXNpZGUgcG9zdGVkCj4gPiA+ID4gPiA+IGludGVycnVwdHMsIHllcywgd2hpY2ggZ2V0cyBjb25m
aXJtZWQgYnkgeW91ciAiYXBpY3Y9MCIKPiA+ID4gPiA+ID4gdGVzdC4gWWV0IHdpdGgganVzdCBD
UFUtc2lkZSBwb3N0ZWQgaW50ZXJydXB0cyBJJ20KPiA+ID4gPiA+ID4gc3RydWdnbGluZyBhZ2Fp
biB0byB1bmRlcnN0YW5kIHlvdXIgb3JpZ2luYWwgcHJvYmxlbQo+ID4gPiA+ID4gPiBkZXNjcmlw
dGlvbiwgYW5kIHRoZSBuZWVkIHRvIGZpZGRsZSB3aXRoIElPTU1VIHNpZGUgY29kZS4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBZZXMsIG9uIG15IHRlc3QgZW52LCBjcHVfaGFzX3ZteF9wb3N0ZWRfaW50
cl9wcm9jZXNzaW5nID09IHRydWUgJiYKPiA+ID4gPiBpb21tdV9pbnRwb3N0ID09IGZhbHNlLAo+
ID4gPiA+ID4gd2l0aCB0aGlzLCBwb3N0ZWQgaW50ZXJydXB0cyBiZWVuIGVuYWJsZWQuCj4gPiA+
ID4KPiA+ID4gPiBJJ20gc3RpbGwgcXVpdGUgbG9zdC4gTXkgcmVhZGluZyBvZiB0aGUgSW50ZWwg
VlQtZCBzcGVjIGlzIHRoYXQgdGhlCj4gPiA+ID4gcG9zdGVkIGludGVycnVwdCBkZXNjcmlwdG9y
ICh3aGljaCBjb250YWlucyB0aGUgUElSUikgaXMgdXNlZCBpbgo+ID4gPiA+IGNvbmp1bmN0aW9u
IHdpdGggYSBwb3N0ZWQgaW50ZXJydXB0IHJlbWFwcGluZyBlbnRyeSBpbiB0aGUgaW9tbXUsIHNv
Cj4gPiA+ID4gdGhhdCBpbnRlcnJ1cHRzIGdldCByZWNvcmRlZCBpbiB0aGUgUElSUiBhbmQgbGF0
ZXIgc3luY2VkIGJ5IHRoZQo+ID4gPiA+IGh5cGVydmlzb3IgaW50byB0aGUgdmxhcGljIElSUiB3
aGVuIHJlc3VtaW5nIHRoZSB2aXJ0dWFsIENQVS4KPiA+ID4KPiA+ID4gdGhlcmUgYXJlIHR3byBw
YXJ0cy4gSW50ZWwgZmlyc3QgaW1wbGVtZW50cyBDUFUgcG9zdGVkIGludGVycnVwdCwKPiA+ID4g
d2hpY2ggYWxsb3dzIG9uZSBDUFUgdG8gcG9zdCBJUEkgaW50byBub24tcm9vdCBjb250ZXh0IGlu
IGFub3RoZXIKPiA+ID4gQ1BVIHRocm91Z2ggcG9zdGVkIGludGVycnVwdCBkZXNjcmlwdG9yLiBM
YXRlciBWVC1kIHBvc3RlZAo+ID4gPiBpbnRlcnJ1cHQgY29tZXMsIHdoaWNoIHVzZSBpbnRlcnJ1
cHQgcmVtYXBwaW5nIGVudHJ5IGFuZCB0aGUKPiA+ID4gc2FtZSBwb3N0ZWQgaW50ZXJydXB0IGRl
c2NyaXB0b3IgKHVzaW5nIG1vcmUgZmllbGRzKSB0byBjb252ZXJ0Cj4gPiA+IGEgZGV2aWNlIGlu
dGVycnVwdCBpbnRvIGEgcG9zdGVkIGludGVycnVwdC4gVGhlIHBvc3RpbmcgcHJvY2VzcyBpcwo+
ID4gPiBzYW1lIG9uIHRoZSBkZXN0IENQVSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0J3MgZnJv
bSBhbm90aGVyIENQVQo+ID4gPiBvciBhIGRldmljZS4KPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUg
ZGVzY3JpcHRpb24uCj4gPiAKPiA+IFNvIHRoZSBwcm9ibGVtIHJlcG9ydGVkIGJ5IEppbiBoYXBw
ZW5zIHdoZW4gdXNpbmcgQ1BVIHBvc3RlZAo+ID4gaW50ZXJydXB0cyBidXQgbm90IFZULWQgcG9z
dGVkIGludGVycnVwdHMsIGluIHdoaWNoIGNhc2UgdGhlcmUKPiA+IHNob3VsZG4ndCBiZSBhIG5l
ZWQgdG8gc3luYyBQSVJSIHdpdGggSVJSIHdoZW4gaW50ZXJydXB0cyBmcm9tIGEKPiA+IHBhc3N0
aHJvdWdoIGRldmljZSBhcmUgcmVjb25maWd1cmVkLCBiZWNhdXNlIGludGVycnVwdHMgZnJvbSB0
aGF0Cj4gPiBkZXZpY2Ugc2hvdWxkbid0IGVuZCB1cCBzaWduYWxlZCBpbiBQSVJSIGJlY2F1c2Ug
VlQtZCBwb3N0ZWQKPiA+IGludGVycnVwdHMgaXMgbm90IGJlaW5nIHVzZWQuCj4gPiAKPiA+IERv
IGludGVycnVwdHMgZnJvbSBwYXNzdGhyb3VnaCBkZXZpY2VzIGVuZCB1cCBzaWduYWxlZCBpbiB0
aGUgcG9zdGVkCj4gPiBpbnRlcnJ1cHQgZGVzY3JpcHRvciBQSVJSIGZpZWxkIHdoZW4gbm90IHVz
aW5nIFZULWQgcG9zdGVkCj4gPiBpbnRlcnJ1cHRzIGJ1dCB1c2luZyBDUFUgcG9zdGVkIGludGVy
cnVwdHM/Cj4gCj4gTm8uIElmIFZULWQgcG9zdGVkIGludGVycnVwdCBpcyBkaXNhYmxlZCwgaW50
ZXJydXB0cyBmcm9tIHBhc3N0aHJvdWdoCj4gZGV2aWNlcyBkb24ndCBnbyB0aHJvdWdoIHBvc3Rl
ZCBpbnRlcnJ1cHQgZGVzY3JpcHRvci4gQnV0IGFmdGVyIGh5cGVydmlzb3IKPiBzZXJ2ZXMgdGhl
IGludGVycnVwdCBhbmQgd2hlbiBpdCBkZWNpZGVzIHRvIGluamVjdCBhIHZpcnR1YWwgaW50ZXJy
dXB0IGludG8KPiB0aGUgZ3Vlc3QsIFBJUlIgd2lsbCBiZSB1cGRhdGVkIGlmIENQVSBwb3N0ZWQg
aW50ZXJydXB0IGlzIGVuYWJsZWQuCgpPaCwgSSBzZWUuIHZteF9kZWxpdmVyX3Bvc3RlZF9pbnRy
IHdoaWNoIGlzIGNhbGxlZCByZWdhcmRsZXNzIG9mCndoZXRoZXIgVlQtZCBwb3N0ZWQgaW50ZXJy
dXB0cyBhcmUgZW5hYmxlZCBvciBub3QgZG9lcyBzZXQgdGhlIHZlY3RvcgppbiB0aGUgUElSUiwg
c28gd2UgZG8gbmVlZCB0byBzeW5jIHRoZSBQSVJSIHdpdGggdGhlIElSUiBldmVuIHdoZW4gQ1BV
Cm9ubHkgcG9zdGVkIGludGVycnVwdHMgYXJlIHVzZWQuCgpNYXkgSSBhc2sgd2h5IHRoaXMgaXMg
ZG9uZSB0aGF0IHdheT8gV2hlbiBWVC1kIHBvc3RlZCBpbnRlcnJ1cHRzIGFyZQpub3QgdXNlZCB3
b3VsZG4ndCBpdCBiZSBzaW1wbGVyIHRvIGp1c3Qgc2V0IHRoZSB2ZWN0b3IgaW4gdGhlIElSUgpk
aXJlY3RseSBpbnN0ZWFkIG9mIHNldHRpbmcgaXQgaW4gdGhlIFBJUlIgYW5kIGxhdGVyIHN5bmNp
bmcgdGhlIFBJUlIKd2l0aCBJUlI/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
