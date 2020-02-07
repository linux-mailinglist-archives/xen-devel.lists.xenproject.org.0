Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5942155720
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 12:46:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j023s-0004dQ-TI; Fri, 07 Feb 2020 11:44:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gniO=33=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j023r-0004dL-Nd
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 11:44:39 +0000
X-Inumbo-ID: 38178466-499f-11ea-b13f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38178466-499f-11ea-b13f-12813bfff9fa;
 Fri, 07 Feb 2020 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581075879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MUDB3FEF81tvvZ8ty5DAEPeQnf7iiNKqw8ZvJD3Rx7M=;
 b=GgKMTOw6oSND2F1K+U+wJfVNOF8xU07OJrpJhGhrZEICiOpDoPJREbLb
 W1YgOpVEgRAQQdks2tBmdvPL8wWFusQqcv33/UYc4hF46lxoV/ZOijYuX
 a5RNoHXsvdOXzpDSa7vJJSdxKDxPhpL0Tf+t6Z8fpDtin0opR5wtWqSOO 4=;
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
IronPort-SDR: QilDxLLcyL6TJerg/Uqsa/adv2yk3nI47zBbM8qarWQjS67YLQR6z178zrPM7XJwuhvcPl4Fd6
 Soxf0FlPnOkxrH8jM9263YA6ZBuSS/8dsp9JfsYn5XY0WL8fuuL65riSWcgmBOruy9g02LONrb
 RryFAaasTnLrTZVyYjM8It8hbcWsegHJWyVbVZGC+tAteW18P0NyctxfoCVYYT3mj9rRAqwMUx
 n+517NoD6EGhWLmNPZTTSV7eqnnaOtl+C5hg834zcZ0kzW+16J3M3Si21SWoNXoadT7favr1gV
 9Xw=
X-SBRS: 2.7
X-MesageID: 12112320
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12112320"
Date: Fri, 7 Feb 2020 12:44:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200207114427.GC4679@Air-de-Roger>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
 <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
 <030eac1d-85b1-fa91-135e-00462eefeb92@suse.com>
 <f7814499-920b-6d7f-1a39-bb4bfb4d69c6@suse.com>
 <bfb81466-4cf8-c57f-b7cb-e07d1fc58351@suse.com>
 <67c529af-9dc1-c59f-a699-5a39c731b76d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67c529af-9dc1-c59f-a699-5a39c731b76d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross
 Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMTA6MjU6MDVBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAwNy4wMi4yMCAwOTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAwNy4w
Mi4yMDIwIDA5OjQyLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+ID4gPiBPbiAwNy4wMi4yMCAwOToy
MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gT24gMDcuMDIuMjAyMCAwOTowNCwgSsO8cmdl
biBHcm/DnyB3cm90ZToKPiA+ID4gPiA+IE9uIDA2LjAyLjIwIDE1OjAyLCBTZXJnZXkgRHlhc2xp
IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAwNi8wMi8yMDIwIDExOjA1LCBTZXJnZXkgRHlhc2xpIHdy
b3RlOgo+ID4gPiA+ID4gPiA+IE9uIDA2LzAyLzIwMjAgMDk6NTcsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4gPiBPbiAwNS4wMi4yMCAxNzowMywgU2VyZ2V5IER5YXNsaSB3cm90
ZToKPiA+ID4gPiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiA+ID4gPiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgYSBMaXZlLVBhdGNoIGFwcGxpY2F0
aW9uIGZhaWx1cmUgaW4gY29yZS0KPiA+ID4gPiA+ID4gPiA+ID4gc2NoZWR1bGluZyBtb2RlIGFu
ZCB0aGlzIGlzIGFuIGV4YW1wbGUgb2Ygd2hhdCBJIHVzdWFsbHkgZ2V0Ogo+ID4gPiA+ID4gPiA+
ID4gPiAoaXQncyBlYXNpbHkgcmVwcm9kdWNpYmxlKQo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAoWEVOKSBbICAzNDIuNTI4MzA1XSBsaXZlcGF0Y2g6IGxwOiBD
UFU4IC0gSVBJaW5nIHRoZSBvdGhlciAxNSBDUFVzCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
KFhFTikgWyAgMzQyLjU1ODM0MF0gbGl2ZXBhdGNoOiBscDogVGltZWQgb3V0IG9uIHNlbWFwaG9y
ZSBpbiBDUFUgcXVpZXNjZSBwaGFzZSAxMy8xNQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIChY
RU4pIFsgIDM0Mi41NTgzNDNdIGJhZCBjcHVzOiA2IDkKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAgKFhFTikgWyAgMzQyLjU1OTI5M10gQ1BVOiAgICA2Cj4gPiA+
ID4gPiA+ID4gPiA+ICAgICAgICAgKFhFTikgWyAgMzQyLjU1OTU2Ml0gWGVuIGNhbGwgdHJhY2U6
Cj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgKFhFTikgWyAgMzQyLjU1OTU2NV0gICAgWzxmZmZm
ODJkMDgwMjNmMzA0Pl0gUiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZvdXNf
aW4rMHhhNC8weDI3MAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIChYRU4pIFsgIDM0Mi41NTk1
NjhdICAgIFs8ZmZmZjgyZDA4MDIzZjhhYT5dIEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWR1bGUr
MHgxN2EvMHgyNjAKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgICAoWEVOKSBbICAzNDIuNTU5NTcx
XSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJx
KzB4NWEvMHg5MAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIChYRU4pIFsgIDM0Mi41NTk1NzRd
ICAgIFs8ZmZmZjgyZDA4MDI3OGVjNT5dIEYgYXJjaC94ODYvZG9tYWluLmMjZ3Vlc3RfaWRsZV9s
b29wKzB4MzUvMHg2MAo+ID4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAoWEVOKSBbICAzNDIuNTU5NzYxXSBDUFU6ICAgIDkKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAoWEVOKSBbICAzNDIuNTYwMDI2XSBYZW4gY2FsbCB0cmFjZToKPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICAgICAoWEVOKSBbICAzNDIuNTYwMDI5XSAgICBbPGZmZmY4MmQwODAyNDE2NjE+XSBSIF9z
cGluX2xvY2tfaXJxKzB4MTEvMHg0MAo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgIChYRU4pIFsg
IDM0Mi41NjAwMzJdICAgIFs8ZmZmZjgyZDA4MDIzZjMyMz5dIEYgY29tbW9uL3NjaGVkdWxlLmMj
c2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YzMvMHgyNzAKPiA+ID4gPiA+ID4gPiA+ID4gICAg
ICAgICAoWEVOKSBbICAzNDIuNTYwMDM2XSAgICBbPGZmZmY4MmQwODAyM2Y4YWE+XSBGIGNvbW1v
bi9zY2hlZHVsZS5jI3NjaGVkdWxlKzB4MTdhLzB4MjYwCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAg
ICAgKFhFTikgWyAgMzQyLjU2MDAzOV0gICAgWzxmZmZmODJkMDgwMjQwZDVhPl0gRiBjb21tb24v
c29mdGlycS5jI19fZG9fc29mdGlycSsweDVhLzB4OTAKPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAoWEVOKSBbICAzNDIuNTYwMDQyXSAgICBbPGZmZmY4MmQwODAyNzlkYjU+XSBGIGFyY2gveDg2
L2RvbWFpbi5jI2lkbGVfbG9vcCsweDU1LzB4YjAKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiA+IFRoZSBmaXJzdCBIVCBzaWJsaW5nIGlzIHdhaXRpbmcgZm9yIHRoZSBzZWNvbmQg
aW4gdGhlIExQLWFwcGxpY2F0aW9uCj4gPiA+ID4gPiA+ID4gPiA+IGNvbnRleHQgd2hpbGUgdGhl
IHNlY29uZCB3YWl0cyBmb3IgdGhlIGZpcnN0IGluIHRoZSBzY2hlZHVsZXIgY29udGV4dC4KPiA+
ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IEFueSBzdWdnZXN0aW9ucyBvbiBob3cg
dG8gaW1wcm92ZSB0aGlzIHNpdHVhdGlvbiBhcmUgd2VsY29tZS4KPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gQ2FuIHlvdSB0ZXN0IHRoZSBhdHRhY2hlZCBwYXRjaCwgcGxlYXNlPyBJ
dCBpcyBvbmx5IHRlc3RlZCB0byBib290LCBzbwo+ID4gPiA+ID4gPiA+ID4gSSBkaWQgbm8gbGl2
ZXBhdGNoIHRlc3RzIHdpdGggaXQuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhhbmsg
eW91IGZvciB0aGUgcGF0Y2ghIEl0IHNlZW1zIHRvIGZpeCB0aGUgaXNzdWUgaW4gbXkgbWFudWFs
IHRlc3RpbmcuCj4gPiA+ID4gPiA+ID4gSSdtIGdvaW5nIHRvIHN1Ym1pdCBhdXRvbWF0aWMgTFAg
dGVzdGluZyBmb3IgYm90aCB0aHJlYWQvY29yZSBtb2Rlcy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IEFuZHJldyBzdWdnZXN0ZWQgdG8gdGVzdCBsYXRlIHVjb2RlIGxvYWRpbmcgYXMgd2VsbCBh
bmQgc28gSSBkaWQuCj4gPiA+ID4gPiA+IEl0IHVzZXMgc3RvcF9tYWNoaW5lKCkgdG8gcmVuZGV6
dm91cyBjcHVzIGFuZCBpdCBmYWlsZWQgd2l0aCBhIHNpbWlsYXIKPiA+ID4gPiA+ID4gYmFja3Ry
YWNlIGZvciBhIHByb2JsZW1hdGljIENQVS4gQnV0IGluIHRoaXMgY2FzZSB0aGUgc3lzdGVtIGNy
YXNoZWQKPiA+ID4gPiA+ID4gc2luY2UgdGhlcmUgaXMgbm8gdGltZW91dCBpbnZvbHZlZDoKPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ICAgICAgICAoWEVOKSBbICAxNTUuMDI1MTY4XSBYZW4gY2Fs
bCB0cmFjZToKPiA+ID4gPiA+ID4gICAgICAgIChYRU4pIFsgIDE1NS4wNDAwOTVdICAgIFs8ZmZm
ZjgyZDA4MDI0MTdmMj5dIFIgX3NwaW5fdW5sb2NrX2lycSsweDIyLzB4MzAKPiA+ID4gPiA+ID4g
ICAgICAgIChYRU4pIFsgIDE1NS4wNjk1NDldICAgIFs8ZmZmZjgyZDA4MDIzZjNjMj5dIFMgY29t
bW9uL3NjaGVkdWxlLmMjc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YTIvMHgyNzAKPiA+ID4g
PiA+ID4gICAgICAgIChYRU4pIFsgIDE1NS4xMDk2OTZdICAgIFs8ZmZmZjgyZDA4MDIzZjcyOD5d
IEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWRfc2xhdmUrMHgxOTgvMHgyNjAKPiA+ID4gPiA+ID4g
ICAgICAgIChYRU4pIFsgIDE1NS4xNDU1MjFdICAgIFs8ZmZmZjgyZDA4MDI0MGUxYT5dIEYgY29t
bW9uL3NvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg1YS8weDkwCj4gPiA+ID4gPiA+ICAgICAgICAo
WEVOKSBbICAxNTUuMTgwMjIzXSAgICBbPGZmZmY4MmQwODAzNzE2ZjY+XSBGIHg4Nl82NC9lbnRy
eS5TI3Byb2Nlc3Nfc29mdGlycXMrMHg2LzB4MjAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEl0
IGxvb2tzIGxpa2UgeW91ciBwYXRjaCBwcm92aWRlcyBhIHdvcmthcm91bmQgZm9yIExQIGNhc2Us
IGJ1dCBvdGhlcgo+ID4gPiA+ID4gPiBjYXNlcyBsaWtlIHN0b3BfbWFjaGluZSgpIHJlbWFpbiBi
cm9rZW4gc2luY2UgdGhlIHVuZGVybHlpbmcgaXNzdWUgd2l0aAo+ID4gPiA+ID4gPiB0aGUgc2No
ZWR1bGVyIGlzIHN0aWxsIHRoZXJlLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBbmQgaGVyZSBpcyB0
aGUgZml4IGZvciB1Y29kZSBsb2FkaW5nICh0aGF0IHdhcyBpbiBmYWN0IHRoZSBvbmx5IGNhc2UK
PiA+ID4gPiA+IHdoZXJlIHN0b3BfbWFjaGluZV9ydW4oKSB3YXNuJ3QgYWxyZWFkeSBjYWxsZWQg
aW4gYSB0YXNrbGV0KS4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGlzIGEgcmF0aGVyIG9kZCByZXN0
cmljdGlvbiwgYW5kIGhlbmNlIHdpbGwgbmVlZCBleHBsYWluaW5nLgo+ID4gPiAKPiA+ID4gc3Rv
cF9tYWNoaW5lX3J1bigpIGlzIHVzaW5nIGEgdGFza2xldCBvbiBlYWNoIG9ubGluZSBjcHUgKGV4
Y2x1ZGluZyB0aGUKPiA+ID4gb25lIGl0IHdhcyBjYWxsZWQgb25lKSBmb3IgZG9pbmcgYSByZW5k
ZXp2b3VzIG9mIGFsbCBjcHVzLiBXaXRoIHRhc2tsZXRzCj4gPiA+IGFsd2F5cyBiZWluZyBleGVj
dXRlZCBvbiBpZGxlIHZjcHVzIGl0IGlzIG1hbmRhdG9yeSBmb3IKPiA+ID4gc3RvcF9tYWNoaW5l
X3J1bigpIHRvIGJlIGNhbGxlZCBvbiBhbiBpZGxlIHZjcHUgYXMgd2VsbCB3aGVuIGNvcmUKPiA+
ID4gc2NoZWR1bGluZyBpcyBhY3RpdmUsIGFzIG90aGVyd2lzZSBhIGRlYWRsb2NrIHdpbGwgb2Nj
dXIuIFRoaXMgaXMgYmVpbmcKPiA+ID4gYWNjb21wbGlzaGVkIGJ5IHRoZSB1c2Ugb2YgY29udGlu
dWVfaHlwZXJjYWxsX29uX2NwdSgpLgo+ID4gCj4gPiBXZWxsLCBpdCdzIHRoaXMgImEgZGVhZGxv
Y2siIHdoaWNoIGlzIHRvbyB2YWd1ZSBmb3IgbWUuIFdoYXQgZXhhY3RseSBpcwo+ID4gaXQgdGhh
dCBkZWFkbG9ja3MsIGFuZCB3aGVyZSAoaWYgbm90IG9idmlvdXMgZnJvbSB0aGUgZGVzY3JpcHRp
b24gb2YKPiA+IHRoYXQgY2FzZSkgaXMgdGhlIGNvbm5lY3Rpb24gdG8gY29yZSBzY2hlZHVsaW5n
PyBGdW5kYW1lbnRhbGx5IHN1Y2ggYW4KPiA+IGlzc3VlIHdvdWxkIHNlZW0gdG8gY2FsbCBmb3Ig
YW4gYWRqdXN0bWVudCB0byBjb3JlIHNjaGVkdWxpbmcgbG9naWMsCj4gPiBub3QgcGxhY2luZyBv
ZiBuZXcgcmVzdHJpY3Rpb25zIG9uIG90aGVyIHByZS1leGlzdGluZyBjb2RlLgo+IAo+IFRoaXMg
aXMgdGhlIG1haW4gb2JqZWN0aXZlIG9mIGNvcmUgc2NoZWR1bGluZzogb24gYWxsIHNpYmxpbmdz
IG9mIGEKPiBjb3JlIG9ubHkgdmNwdXMgb2YgZXhhY3RseSBvbmUgZG9tYWluIGFyZSBhbGxvd2Vk
IHRvIGJlIGFjdGl2ZS4KPiAKPiBBcyB0YXNrbGV0cyBhcmUgb25seSBydW5uaW5nIG9uIGlkbGUg
dmNwdXMgYW5kIHN0b3BfbWFjaGluZV9ydW4oKQo+IGlzIGFjdGl2YXRpbmcgdGFza2xldHMgb24g
YWxsIGNwdXMgYnV0IHRoZSBvbmUgaXQgaGFzIGJlZW4gY2FsbGVkIG9uCj4gdG8gcmVuZGV6dm91
cywgaXQgaXMgbWFuZGF0b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8gYmUgY2FsbGVkIG9u
Cj4gYW4gaWRsZSB2Y3B1LCB0b28sIGFzIG90aGVyd2lzZSB0aGVyZSBpcyBubyB3YXkgZm9yIHNj
aGVkdWxpbmcgdG8KPiBhY3RpdmF0ZSB0aGUgaWRsZSB2Y3B1IGZvciB0aGUgdGFza2xldCBvbiB0
aGUgc2libGluZyBvZiB0aGUgY3B1Cj4gc3RvcF9tYWNoaW5lX3J1bigpIGhhcyBiZWVuIGNhbGxl
ZCBvbi4KCkNvdWxkIHRoZXJlIGFsc28gYmUgaXNzdWVzIHdpdGggb3RoZXIgcmVuZGV6dm91cyBu
b3QgcnVubmluZyBpbgp0YXNrbGV0IGNvbnRleHQ/CgpPbmUgdHJpZ2dlcmVkIGJ5IG9uX3NlbGVj
dGVkX2NwdXMgZm9yIGV4YW1wbGU/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
