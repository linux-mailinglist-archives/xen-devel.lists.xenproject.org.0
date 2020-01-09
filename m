Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3813562F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 10:51:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipUQB-0005FF-Sl; Thu, 09 Jan 2020 09:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNyl=26=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipUQ9-0005FA-VI
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 09:48:06 +0000
X-Inumbo-ID: 21623888-32c5-11ea-b984-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21623888-32c5-11ea-b984-12813bfff9fa;
 Thu, 09 Jan 2020 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578563285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6663y3tqKdfhVDJoK5SMTAnVqyrzokDuOOJq+o++xBI=;
 b=Zu9BuSNfADfAVapoTJ6wG9pP0XXZ1xkO4VH6jSh3pThac0rsUVJAuQQO
 +88Pff1LdlTLLvQgntcv3lHAMctA9lQj9niquswlPxLBplXfASjmDTWyq
 vapLJ99yKDFSbYroTNPcytDc+tDtI2Qk+ym5xORxMO5c7E5oXrj4F3KGq 4=;
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
IronPort-SDR: VmkUoXnVEoRcM3ei7+U3GUcM6WdC0ynh6lkz7Si8kbNrps1eL8aUnSIOINm42GJsWukJQMf7Eg
 33XoYRQ9GjpGl2cRoQ7VMqcHNYK5jBMKW0Ic2fK8Pi6uwLM4fHbfL8PyuVYrwFgmdeBzjoMB5o
 TB75qE57gvxEAdd2zJMyXOB3Of4rT4O3dJ+xY636qLo93K0TXoP1hOh+BKIaLIdCARTaZR3y3h
 oPX+e+5FKttY4xGdeqzD5tGFGr68N9l8QBDsmT1gG8DWvqprrAyP9CyAALsHgbw2Omg3q3bE9h
 018=
X-SBRS: 2.7
X-MesageID: 10687499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,413,1571716800"; d="scan'208";a="10687499"
Date: Thu, 9 Jan 2020 10:47:51 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200109094751.GY11756@Air-de-Roger>
References: <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
 <20200108150841.GR11756@Air-de-Roger>
 <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
 <20200108180042.GT11756@Air-de-Roger>
 <CABfawhm==Gpca8+E=PihvW3x7Y79kAKD48rk5PHHbbhdATh4-w@mail.gmail.com>
 <20200108183649.GW11756@Air-de-Roger>
 <CABfawh=AK+HAgLqByo_Xgr_Ev53+cEo3tiMuPn4SYL7R1i8P-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=AK+HAgLqByo_Xgr_Ev53+cEo3tiMuPn4SYL7R1i8P-Q@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTI6NTE6MzVQTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFdlZCwgSmFuIDgsIDIwMjAgYXQgMTE6MzcgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgSmFuIDA4LCAy
MDIwIGF0IDExOjE0OjQ2QU0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24g
V2VkLCBKYW4gOCwgMjAyMCBhdCAxMTowMSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIEphbiAwOCwgMjAyMCBh
dCAwODozMjoyMkFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gPiBPbiBX
ZWQsIEphbiA4LCAyMDIwIGF0IDg6MDggQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiBJIHRoaW5rIHlvdSBhbHNvIG5lZWQgc29tZXRo
aW5nIGxpa2U6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICMgeGwgZm9yay12bSAtLWxhdW5jaC1k
bSBsYXRlIDxwYXJlbnRfZG9taWQ+IDxmb3JrX2RvbWlkPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBTbyB0aGF0IGEgdXNlciBkb2Vzbid0IG5lZWQgdG8gcGFzcyBhIHFlbXUtc2F2ZS1maWxlPwo+
ID4gPiA+ID4KPiA+ID4gPiA+IFRoaXMgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgdG8gbWUuIFRv
IGxhdW5jaCBRRU1VIHlvdSBuZWVkIHRoZSBjb25maWcKPiA+ID4gPiA+IGZpbGUgdG8gd2lyZSB0
aGluZ3MgdXAgY29ycmVjdGx5LiBMaWtlIGluIG9yZGVyIHRvIGxhdW5jaCBRRU1VIHlvdQo+ID4g
PiA+ID4gbmVlZCB0byB0ZWxsIGl0IHRoZSBuYW1lIG9mIHRoZSBWTSwgZGlzayBwYXRoLCBldGMu
IHRoYXQgYXJlIGFsbAo+ID4gPiA+ID4gY29udGFpbmVkIGluIHRoZSBjb25maWcuCj4gPiA+ID4K
PiA+ID4gPiBZb3UgY291bGQgZ2V0IGFsbCB0aGlzIGluZm9ybWF0aW9uIGZyb20gdGhlIHBhcmVu
dCBWTSwgSUlSQyBsaWJ4bCBoYXMKPiA+ID4gPiBhIGpzb24gdmVyc2lvbiBvZiB0aGUgY29uZmln
LiBGb3IgZXhhbXBsZSBmb3IgbWlncmF0aW9uIHRoZXJlJ3Mgbm8KPiA+ID4gPiBuZWVkIHRvIHBh
c3MgYW55IGNvbmZpZyBmaWxlLCBzaW5jZSB0aGUgaW5jb21pbmcgVk0gY2FuIGJlIHJlY3JlYXRl
ZAo+ID4gPiA+IGZyb20gdGhlIGRhdGEgaW4gdGhlIHNvdXJjZSBWTS4KPiA+ID4gPgo+ID4gPgo+
ID4gPiBCdXQgYWdhaW4sIGNyZWF0aW5nIGEgZm9yayB3aXRoIHRoZSBleGFjdCBjb25maWcgb2Yg
dGhlIHBhcmVudCBpcyBub3QKPiA+ID4gcG9zc2libGUuIEV2ZW4gaWYgdGhlIHRvb2wgd291bGQg
cmVuYW1lIHRoZSBmb3JrIG9uLXRoZS1mbHkgYXMgaXQgZG9lcwo+ID4gPiBkdXJpbmcgdGhlIG1p
Z3JhdGlvbiwgdGhlIGZvcmsgd291bGQgZW5kIHVwIHRocmFzaGluZyB0aGUgcGFyZW50IFZNJ3MK
PiA+ID4gZGlzayBhbmQgbWFraW5nIGl0IGltcG9zc2libGUgdG8gY3JlYXRlIGFueSBhZGRpdGlv
bmFsIGZvcmtzLiBJdCB3b3VsZAo+ID4gPiBhbHNvIG1lYW4gdGhhdCBhdCBubyBwb2ludCBjYW4g
dGhlIG9yaWdpbmFsIFZNIGJlIHVucGF1c2VkIGFmdGVyIHRoZQo+ID4gPiBmb3JrcyBhcmUgZ29u
ZS4gSSBkb24ndCBzZWUgYW55IHVzZWNhc2UgaW4gd2hpY2ggdGhhdCB3b3VsZCBtYWtlIGFueQo+
ID4gPiBzZW5zZSBhdCBhbGwuCj4gPgo+ID4gWW91IGNvdWxkIGhhdmUgdGhlIGRpc2socykgYXMg
cmVhZC1vbmx5IGFuZCB0aGUgVk0gcnVubmluZyBjb21wbGV0ZWx5Cj4gPiBmcm9tIFJBTS4gQWxw
aW5lLWxpbnV4IGhhcyAob3IgaGFkKSBhIG1vZGUgd2hlcmUgaXQgd2FzIGNvbXBsZXRlbHkKPiA+
IHN0YXRlbGVzcyBhbmQgcnVubmluZyBmcm9tIFJBTS4gSSB0aGluayBpdCdzIGZpbmUgdG8gcmVx
dWlyZSBwYXNzaW5nIGEKPiA+IGNvbmZpZyBmaWxlIGZvciB0aGUgdGltZSBiZWluZywgd2UgY2Fu
IGxvb2sgYXQgb3RoZXIgb3B0aW9ucwo+ID4gYWZ0ZXJ3YXJkcy4KPiA+Cj4gCj4gT0ssIHRoZXJl
IGlzIHRoYXQuIEJ1dCBJIHdvdWxkIHNheSB0aGF0J3MgYSBmYWlybHkgbmljaGUgdXNlLWNhc2Uu
IFlvdQo+IHdvdWxkbid0IGhhdmUgYW55IG5ldHdvcmsgYWNjZXNzIGluIHRoYXQgZm9yaywgbm8g
ZGlzaywgbm8gd2F5IHRvIGdldAo+IGluZm9ybWF0aW9uIGluIG9yIG91dCBiZXNpZGUgdGhlIHNl
cmlhbCBjb25zb2xlLgoKV2h5IHdvbid0IHRoZSBmb3JrIGhhdmUgbmV0d29yayBhY2Nlc3M/CgpJ
ZiB0aGUgcGFyZW50IFZNIGlzIGxlZnQgcGF1c2VkIHRoZSBmb3JrIHNob3VsZCBiZWhhdmUgbGlr
ZSBhIGxvY2FsCm1pZ3JhdGlvbiByZWdhcmRpbmcgbmV0d29yayBhY2Nlc3MsIGFuZCB0aHVzIGJl
IGZ1bGx5IGZ1bmN0aW9uYWwuCgo+IFNvIEkgd291bGRuJ3Qgd2FudAo+IHRoYXQgc2V0dXAgdG8g
YmUgY29uc2lkZXJlZCB0aGUgZGVmYXVsdC4gSWYgc29tZW9uZSB3YW50cyB0byB0aGF0IEkKPiB3
b3VsZCByYXRoZXIgaGF2ZSBhbiBvcHRpb24gdGhhdCB0ZWxscyB4bCB0byBhdXRvbWF0aWNhbGx5
IG5hbWUgdGhlCj4gZm9yayBmb3IgeW91IGluc3RlYWQgb2YgdGhlIG90aGVyIHdheSBhcm91bmQu
CgpBY2ssIEkganVzdCB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHdoYXRldmVyIGludGVyZmFjZSB3
ZSBlbmQgdXAgdXNpbmcKaXMgZGVzaWduZWQgdGFraW5nIGludG8gYWNjb3VudCBvdGhlciB1c2Ug
Y2FzZXMgYXBhcnQgZnJvbSB0aGUgb25lIGF0CmhhbmQuCgpPbiBhbiB1bnJlbGF0ZWQgbm90ZSwg
ZG9lcyBmb3JraW5nIHdvcmsgd2hlbiB1c2luZyBQViBpbnRlcmZhY2VzPwoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
