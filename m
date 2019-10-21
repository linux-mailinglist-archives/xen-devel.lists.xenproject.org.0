Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D3DE97B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 12:31:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMUtr-0004NR-J5; Mon, 21 Oct 2019 10:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMUtp-0004NM-ME
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 10:26:53 +0000
X-Inumbo-ID: 4bf7b4b8-f3ed-11e9-944a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4bf7b4b8-f3ed-11e9-944a-12813bfff9fa;
 Mon, 21 Oct 2019 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571653612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w3qAegeha3MA+Nro6pfjuqK6O8assNR0OBj+t6KFI+k=;
 b=Yqu94pOeCtkO/F6dJ/1CoB+57c0BTV9h/0CcZqafv3DWvU34RigMyqvs
 dPI/oebBazwzfuVkZfXSVIXxYTX0b/+KTGz9xI5vK5wFC7fKNfH8GYJXr
 sQyE8W467LMAJPmkfoy4IgQKi6iSplOl6hTHNHFiRoEJJLBeGFRcQ8OF4 Q=;
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
IronPort-SDR: VxluysP3gKCukcGboeMaaZPxHIdbtFLq4I3I4hDpdj06d5IVthE+L538udBxNpdVvRRFxNtTPQ
 MHXmq97I1gcuCRhy2hjJyaeq3zN9dztnksfy9PQ9abibKERzuQ2PkIfjqNEOQp0m3aa1KTql5H
 y2FjsSSNhzgeBEuy8YkLLZkRtv+YOhGM93RqqjoUBzDh1ON+73e+MgcrfXwYzzXqDgatjhEESk
 7yTxS7ZTtO9PzKCh6jpzwPCQ4+HaWcP7IFenPQg2RPKEOrgvJ7I2jQGMbEzpNAWaE+YzREtQEu
 gRw=
X-SBRS: 2.7
X-MesageID: 7187889
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7187889"
Date: Mon, 21 Oct 2019 12:26:44 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191021102644.GI17494@Air-de-Roger>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-10-liuwe@microsoft.com>
 <20191021102225.GH17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021102225.GH17494@Air-de-Roger>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-next v2 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6MjI6MjVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwNDowMDo0M1BNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gV2UgdXNlIHRoZSBzYW1lIGNvZGUgc3RydWN0dXJlIGFzIHdlIGRpZSBm
b3IgWGVuLgo+ID4gCj4gPiBBcyBzdGFydGVycywgZGV0ZWN0IEh5cGVyLVYgaW4gcHJvYmUgcm91
dGluZS4gTW9yZSBjb21wbGV4Cj4gPiBmdW5jdGlvbmFsaXRpZXMgd2lsbCBiZSBhZGRlZCBsYXRl
ci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4K
PiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgfCAgOSArKysr
Cj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICB8ICAxICsKPiA+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIHwgIDEgKwo+ID4gIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgIHwgIDUgKysrCj4gPiAgeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oICAgICAgICB8ICAxICsKPiA+ICB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi5oIHwgNDUgKysrKysrKysrKysrKysrKysrKwo+ID4gIDcgZmls
ZXMgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKPiA+IGluZGV4IDU4
NGJkYzFiYjguLmM1YTkzYmFiZmUgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZp
Zwo+ID4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKPiA+IEBAIC0xNjMsNiArMTYzLDE1IEBA
IGVuZGNob2ljZQo+ID4gIGNvbmZpZyBHVUVTVAo+ID4gIAlib29sCj4gPiAgCj4gPiArY29uZmln
IEhZUEVSVl9HVUVTVAo+ID4gKwlkZWZfYm9vbCBuCj4gPiArCXNlbGVjdCBHVUVTVAo+ID4gKwlw
cm9tcHQgIkh5cGVyLVYgR3Vlc3QiCj4gPiArCS0tLWhlbHAtLS0KPiA+ICsJICBTdXBwb3J0IGZv
ciBYZW4gZGV0ZWN0aW5nIHdoZW4gaXQgaXMgcnVubmluZyB1bmRlciBIeXBlci1WLgo+ID4gKwo+
ID4gKwkgIElmIHVuc3VyZSwgc2F5IE4uCj4gPiArCj4gPiAgY29uZmlnIFhFTl9HVUVTVAo+ID4g
IAlkZWZfYm9vbCBuCj4gPiAgCXNlbGVjdCBHVUVTVAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9ndWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQo+ID4gaW5k
ZXggZjYzZDY0YmJlZS4uZjE2NDE5Njc3MiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9NYWtlZmlsZQo+ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlCj4gPiBA
QCAtMSwzICsxLDQgQEAKPiA+ICBvYmoteSArPSBoeXBlcnZpc29yLm8KPiA+ICAKPiA+ICtzdWJk
aXItJChDT05GSUdfSFlQRVJWX0dVRVNUKSArPSBoeXBlcnYKPiA+ICBzdWJkaXItJChDT05GSUdf
WEVOX0dVRVNUKSArPSB4ZW4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLjY4MTcwMTA5YTkKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUK
PiA+IEBAIC0wLDAgKzEgQEAKPiA+ICtvYmoteSArPSBoeXBlcnYubwo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAw
MDAwMC4uNDQ5NGI4N2ZlOAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gQEAgLTAsMCArMSw2OSBAQAo+ID4gKy8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPiA+ICsgKiBhcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+
ICsgKgo+ID4gKyAqIFN1cHBvcnQgZm9yIGRldGVjdGluZyBhbmQgcnVubmluZyB1bmRlciBIeXBl
ci1WLgo+ID4gKyAqCj4gPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiA+ICsgKiBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQo+ID4g
KyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhl
IExpY2Vuc2UsIG9yCj4gPiArICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4K
PiA+ICsgKgo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0
aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ID4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsg
d2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCj4gPiArICogTUVSQ0hBTlRBQklM
SVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+ID4gKyAq
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4gPiArICoKPiA+
ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZQo+ID4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNl
ZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4gPiArICoKPiA+ICsgKiBDb3B5cmln
aHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ID4gKyAqLwo+ID4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5o
Pgo+ID4gKwo+ID4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KPiA+ICsKPiA+ICtib29sIF9faW5p
dCBoeXBlcnZfcHJvYmUodm9pZCkKPiA+ICt7Cj4gPiArICAgIHVpbnQzMl90IGVheCwgZWJ4LCBl
Y3gsIGVkeDsKPiA+ICsgICAgYm9vbCBoeXBlcnZfZ3Vlc3QgPSBmYWxzZTsKPiAKPiBJIGRvbid0
IHRoaW5rIHlvdSBuZWVkIHRoaXMgbG9jYWwgdmFyaWFibGUsIHlvdSBjYW4gcmV0dXJuIHRydWUg
aW4gaWYKPiB0aGUgaWYgY29uZGl0aW9uIG1hdGNoZXMsIGFuZCBmYWxzZSBvdGhlcndpc2UuCj4g
Cj4gPiArCj4gPiArICAgIGNwdWlkKDB4NDAwMDAwMDAsICZlYXgsICZlYngsICZlY3gsICZlZHgp
Owo+ID4gKyAgICBpZiAoIChlYnggPT0gMHg3MjYzNjk0ZCkgJiYgLyogIk1pY3IiICovCj4gPiAr
ICAgICAgICAgKGVjeCA9PSAweDY2NmY3MzZmKSAmJiAvKiAib3NvZiIgKi8KPiA+ICsgICAgICAg
ICAoZWR4ID09IDB4NzY0ODIwNzQpICkgIC8qICJ0IEh2IiAqLwo+IAo+IEkgZ3Vlc3MgdGhlcmUg
YXJlIG5vIEh5cGVyViBoZWFkZXJzIHRvIGltcG9ydCB0aGF0IGhhdmUgdGhvc2UgdmFsdWVzCj4g
ZGVmaW5lZD8KPiAKPiBBbHRlcm5hdGl2ZWx5IHlvdSBjb3VsZCBkbyBzb21ldGhpbmcgbGlrZSB0
aGUgZm9sbG93aW5nIEkgdGhpbms6Cj4gCj4gc3RhdGljIGNvbnN0IGNoYXIgaHlwZXJ2X3NpZ1td
IF9faW5pdGNvbnN0ID0gIk1pY3Jvc29mdCBIdiI7Cj4gCj4gYm9vbCBfX2luaXQgaHlwZXJ2X3By
b2JlKHZvaWQpCj4gewo+ICAgICB1aW50MzJfdCBlYXgsIHNpZ1szXTsKPiAKPiAgICAgY3B1aWQo
MHg0MDAwMDAwMCwgJmVheCwgJnNpZ1swXSwgJnNpZ1sxXSwgJnNpZ1syXSk7Cj4gICAgIGlmICgg
IXN0cm5jbXAoaHlwZXJ2X3NpZywgc2lnLCBzdHJuY21wKGh5cGVydl9zaWcpICkKClVyZywgSSd2
ZSBtYWRlIGEgbWlzdGFrZSBoZXJlLCB0aGUgbGluZSBzaG91bGQgYmU6Cgohc3RybmNtcChoeXBl
cnZfc2lnLCBzaWcsIHN0cmxlbihoeXBlcnZfc2lnKSkKCkFuZCB5b3UgY2FuIGxpa2VseSBkZWNs
YXJlIGh5cGVydl9zaWcgaW5zaWRlIHRoZSBwcm9iZSBmdW5jdGlvbiBhbHNvLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
