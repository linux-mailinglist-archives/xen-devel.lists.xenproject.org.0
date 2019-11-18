Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411D100747
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 15:23:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWhtt-0006xB-Et; Mon, 18 Nov 2019 14:21:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LWYA=ZK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iWhts-0006x5-1n
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 14:21:08 +0000
X-Inumbo-ID: a275fab6-0a0e-11ea-a2d9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a275fab6-0a0e-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574086857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Dvu+PZcU2dY+u9FTwpObmbkCZKokJa6gVPiSChuJWSI=;
 b=dwecdj+rLJtben4EXTZS1T6XVuMl4N8t4ZzjkpsnY8BWBDLrfnQ4VXit
 IeJM/jfzGOb5z5e9TJ9crmZwdAESbBGHDP8plV9jGqy4rg+cTzttFuD1R
 Qzz6+9nTc0P/ylzatfl0es98slHSZrvGPdEwBg/Cmwh39JJqAACqHypAY E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4+kuzfOdU64Xcsb3kFuhlA2GB5p0Yq2C2jitD4nHw4k08DVM5Ur3TpX2zw3Wj4VdTBmTF3/phZ
 k2MQR7/guCCBL3Bv0mUGJXjR689qhqxh5GQ50Lao6Kkf/hIwGtpxeiIoI8K/urGy9lxSI7TCT6
 3n+VWFd6i2rvFb2gDZu2itKuEuK7ksCba5POw49l48C3LaQ9NWe8y8YthBg71fKya13+5bVNXx
 22nSPZt1OFqCkCUiX4cIrxu/nucj7kCyhMj6RAHJCOBRHLBe+cp+4iWzDSHU4VSfViBZubnxKA
 JOM=
X-SBRS: 2.7
X-MesageID: 8466973
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8466973"
Date: Mon, 18 Nov 2019 15:20:48 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191118142048.GM72134@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <7a971294-7cfa-f801-15cf-afcf6e5a85cf@suse.com>
 <20191118134611.GK72134@Air-de-Roger>
 <0b9c8956-8179-c272-f7b5-f8d4f7ba21ca@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b9c8956-8179-c272-f7b5-f8d4f7ba21ca@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6MDA6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTEuMjAxOSAxNDo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIE5vdiAxOCwgMjAxOSBhdCAwMTowMTo1OFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxOC4xMS4yMDE5IDExOjE2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IFdoZW4gdXNpbmcgcG9zdGVkIGludGVycnVwdHMgb24gSW50ZWwgaGFyZHdhcmUgaXQncyBwb3Nz
aWJsZSB0aGF0IHRoZQo+ID4+PiB2Q1BVIHJlc3VtZXMgZXhlY3V0aW9uIHdpdGggYSBzdGFsZSBs
b2NhbCBBUElDIElSUiByZWdpc3RlciBiZWNhdXNlCj4gPj4+IGRlcGVuZGluZyBvbiB0aGUgaW50
ZXJydXB0cyB0byBiZSBpbmplY3RlZCB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxCj4gPj4+IG1pZ2h0
IG5vdCBiZSBjYWxsZWQsIGFuZCB0aHVzIFBJUiB3b24ndCBiZSBzeW5jZWQgaW50byBJUlIuCj4g
Pj4+Cj4gPj4+IEZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIFBJUiBpcyBhbHdheXMgc3luY2VkIHRv
IElSUiBpbiB2bXhfaW50cl9hc3Npc3QKPiA+Pj4gcmVnYXJkbGVzcyBvZiB3aGF0IGludGVycnVw
dHMgYXJlIHBlbmRpbmcuCj4gPj4KPiA+PiBGb3IgdGhpcyBwYXJ0LCBkaWQgeW91IGNvbnNpZGVy
IHB1bGxpbmcgYWhlYWQgdG8gdGhlIGJlZ2lubmluZwo+ID4+IG9mIGh2bV92Y3B1X2hhc19wZW5k
aW5nX2lycSgpIGl0cyBjYWxsIHRvIHZsYXBpY19oYXNfcGVuZGluZ19pcnEoKT8KPiA+IAo+ID4g
SSBhc3N1bWVkIHRoZSBvcmRlciBpbiBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnEgaXMgdGhlcmUg
Zm9yIGEgcmVhc29uLgo+ID4gSSBjb3VsZCBpbmRlZWQgbW92ZSB2bGFwaWNfaGFzX3BlbmRpbmdf
aXJxIHRvIHRoZSB0b3AsIGJ1dCB0aGVuIGVpdGhlcgo+ID4gdGhlIHJlc3VsdCBpcyBkaXNjYXJk
ZWQgaWYgZm9yIGV4YW1wbGUgYSBOTUkgaXMgcGVuZGluZyBpbmplY3Rpb24KPiA+IChpbiB3aGlj
aCBjYXNlIHRoZXJlJ3Mgbm8gbmVlZCB0byBnbyB0aHJvdWdoIGFsbCB0aGUgbG9naWMgaW4KPiA+
IHZsYXBpY19oYXNfcGVuZGluZ19pcnEpLCBvciB3ZSBpbnZlcnQgdGhlIHByaW9yaXR5IG9mIGV2
ZW50Cj4gPiBpbmplY3Rpb24uCj4gCj4gQ2hhbmdpbmcgdGhlIG9yZGVyIG9mIGV2ZW50cyBpbmpl
Y3RlZCBpcyBub3QgYW4gb3B0aW9uIGFmYWljdC4gVGhlCj4gcG9pbnRsZXNzIHByb2Nlc3Npbmcg
ZG9uZSBpcyBhIHZhbGlkIGNvbmNlcm4sIHlldCB0aGUgc3VnZ2VzdGlvbgo+IHdhcyBzcGVjaWZp
Y2FsbHkgdG8gaGF2ZSAocGFydCBvZikgdGhpcyBwcm9jZXNzaW5nIHRvIG9jY3VyIGVhcmx5Lgo+
IFRoZSBkaXNjYXJkaW5nIG9mIHRoZSByZXN1bHQsIGluIHR1cm4sIGlzIG5vdCBhIHByb2JsZW0g
YWZhaWN0LCBhcwo+IGEgc3Vic2VxdWVudCBjYWxsIHdpbGwgcmV0dXJuIHRoZSBzYW1lIHJlc3Vs
dCAodW5sZXNzIGEgaGlnaGVyCj4gcHJpb3JpdHkgaW50ZXJydXB0IGhhcyBzdXJmYWNlZCBpbiB0
aGUgbWVhbnRpbWUpLgoKWWVzLCB0aGF0J3MgZmluZS4gU28geW91IHdvdWxkIHByZWZlciB0byBt
b3ZlIHRoZSBjYWxsIHRvCnZsYXBpY19oYXNfcGVuZGluZ19pcnEgYmVmb3JlIGFueSBleGl0IHBh
dGggaW4KaHZtX3ZjcHVfaGFzX3BlbmRpbmdfaXJxPwoKPiA+PiBUaGVuIGFnYWluIEkgd29uZGVy
IHdoZXRoZXIgdGhlIFBJUi0+SVJSIHN5bmMgaXMgYWN0dWFsbHkKPiA+PiBsZWdpdGltYXRlIHRv
IHBlcmZvcm0gd2hlbiB2ICE9IGN1cnJlbnQuCj4gPiAKPiA+IElNTyB0aGlzIGlzIGZpbmUgYXMg
bG9uZyBhcyB0aGUgdkNQVSBpcyBub3QgcnVubmluZywgYXMgaW4gdGhhdCBjYXNlCj4gPiB0aGUg
aGFyZHdhcmUgaXMgbm90IGluIGNvbnRyb2wgb2YgSVJSLgo+IAo+IEhlcmUgYW5kIC4uLgo+IAo+
ID4+IElmIGl0J3Mgbm90LCB0aGVuIHRoZXJlCj4gPj4gbWlnaHQgYmUgYSB3aWRlciBzZXQgb2Yg
cHJvYmxlbXMgKHNlZSBlLmcuCj4gPj4gaHZtX2xvY2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KCkp
LiBCdXQgb2YgY291cnNlIHRoZSBhZGp1c3RtZW50Cj4gPj4gdG8gaHZtX3ZjcHVfaGFzX3BlbmRp
bmdfaXJxKCkgY291bGQgYWxzbyBiZSB0byBtYWtlIHRoZSBjYWxsCj4gPj4gZWFybHkgb25seSB3
aGVuIHYgPT0gY3VycmVudC4KPiA+IAo+ID4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgYmUgdGhh
dCByZXN0cmljdGl2ZSwgdiA9PSBjdXJyZW50IHx8Cj4gPiAhdmNwdV9ydW5hYmxlKHYpIG91Z2h0
IHRvIGJlIHNhZmUuIEkndmUgYWxzbyBmb3Jnb3QgdG8gc2VuZCBteQo+ID4gcHJlLXBhdGNoIHRv
IGludHJvZHVjZSBhbiBhc3NlcnQgdG8gdGhhdCBlZmZlY3Q6Cj4gPiAKPiA+IGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMS9tc2cwMDYz
NS5odG1sCj4gPiAKPiA+PiBBIGxhc3QgcXVlc3Rpb24gaXMgdGhhdCBvbiB0aGUgY29uc2VxdWVu
Y2VzIG9mIG92ZXJseSBhZ2dyZXNzaXZlCj4gPj4gc3luYy1pbmcgLSB0aGF0J2xsIGhhcm0gcGVy
Zm9ybWFuY2UsIGJ1dCBzaG91bGRuJ3QgYWZmZWN0Cj4gPj4gY29ycmVjdG5lc3MgaWYgSSdtIG5v
dCBtaXN0YWtlbi4KPiA+IAo+ID4gVGhhdCdzIGNvcnJlY3QsIGFzIGxvbmcgYXMgdGhlIHZjcHUg
aXMgdGhlIGN1cnJlbnQgb25lIG9yIGl0J3Mgbm90Cj4gPiBydW5uaW5nLgo+IAo+IC4uLiBoZXJl
IEkgY29udGludWUgdG8gYmUgd29ycmllZCBvZiByYWNlczogQW55IGNoZWNrIGZvciBhIHZDUFUg
dG8KPiBiZSBub24tcnVubmluZyAob3Igbm9uLXJ1bm5hYmxlKSBpcyBzdGFsZSB0aGUgbW9tZW50
IHlvdSBpbnNwZWN0IHRoZQo+IHJlc3VsdCBvZiB0aGUgY2hlY2suIFVubGVzcywgb2YgY291cnNl
LCB5b3Ugc3VwcHJlc3Mgc2NoZWR1bGluZwo+IChhY3Rpb25zIHBvdGVudGlhbGx5IG1ha2luZyBh
IHZDUFUgcnVubmFibGUpIGR1cmluZyB0aGF0IHRpbWUgd2luZG93LgoKSG0sIGl0J3MgaW5kZWVk
IHRydWUgdGhhdCBzeW5jaW5nIFBJUiBpbnRvIElSUiBmb3IgYSB2Q1BVIG5vdCBydW5uaW5nCmlu
IHRoZSBjdXJyZW50IHBDUFUgaXMgdHJvdWJsZXNvbWUuIE1heWJlIHN5bmNpbmcgUElSIGludG8g
SVJSIHNob3VsZApvbmx5IGJlIGRvbmUgd2hlbiB2ID09IGN1cnJlbnQ/CgpUaGUgb25seSBhbHRl
cm5hdGl2ZSBJIGNhbiB0aGluayBvZiBpcyBzb21ldGhpbmcgbGlrZToKCmlmICggdiAhPSBjdXJy
ZW50ICkKICAgIHZjcHVfcGF1c2Uodik7CnN5bmNfcGlyX2lycih2KTsKaWYgKCB2ICE9IGN1cnJl
bnQgKQogICAgdmNwdV91bnBhdXNlKHYpOwoKSXMgdGhlcmUgYSBuZWVkIHRvIGNoZWNrIHRoZSBJ
UlIgb2YgdkNQVXMgdGhhdCBhcmUgbm90IHJ1bm5pbmcsIGFuZApkb2VzIGl0IG1hdHRlciBpZiB0
aGUgSVJSIGlzIG5vdCBmdWxseSB1cGRhdGVkIGluIHRoYXQgY2FzZT8KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
