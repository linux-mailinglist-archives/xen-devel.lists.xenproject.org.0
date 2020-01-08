Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AC51345DE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:11:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipCx2-0001lp-5J; Wed, 08 Jan 2020 15:08:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipCx0-0001lZ-Dd
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:08:50 +0000
X-Inumbo-ID: c618387a-3228-11ea-b820-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c618387a-3228-11ea-b820-12813bfff9fa;
 Wed, 08 Jan 2020 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578496129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LbZZgEDmG/uoUBKJ1Of659mUKWVbtn2E18njHWpzBQY=;
 b=cPHQaArVGpsmYGeR46QhssyDDsOoccDnoH/eobYZABaAC9ALvFf6PlWa
 RImA+D7IVR0jYdCOJ1dVCgjFZoumOBi8HJG+TKS2ze8K9/kUsdFzY6/k+
 biLV5G+7Y32+8JHLQ50/1DGoFhdKudxj1j1iE07+h5CNo/Msxgj566uXh 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pZdgd9p37hry2raT8Ux9HTwjXqAnMhfJgCUdeU9L5Wv9hTgpYXN4TdomWM090695uqml4Gie+V
 WTedCDilCopLQpPxLpWv3w95FnKUEYB0swmNe8c6uxrEskmNPoASWKrBH/0tcXhuEgHqn4A8Gb
 5Otp2Lo302wwY3eFmwANk9m2LzyEmtaeXI+IpBQzAM/bInp7i+wppd/5EREm7T5T9+15Tfzis9
 5ADhcUwAahhghVN5he5NgOAm7Z/Sg0Xtxj9Ar/NO0DRujO9ifuglILeiBGuzzp2Kp913DePs2S
 0ME=
X-SBRS: 2.7
X-MesageID: 11003304
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11003304"
Date: Wed, 8 Jan 2020 16:08:41 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200108150841.GR11756@Air-de-Roger>
References: <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDk6MzY6MDFBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDk6MDggQU0gVGFtYXMgSyBMZW5neWVs
IDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIERlYyAzMSwgMjAx
OSBhdCA4OjExIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgMDg6MDA6MTdBTSAtMDcwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgRGVjIDMxLCAyMDE5IGF0IDM6
NDAgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDA1OjM3OjM4UE0gLTA3MDAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gPiA+ID4gT24gTW9uLCBEZWMgMzAsIDIwMTkg
YXQgNToyMCBQTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBPbiBNb24sIDMwIERlYyAyMDE5LCAyMDo0OSBUYW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPj4KPiA+ID4gPiA+ID4gPj4gT24gTW9uLCBE
ZWMgMzAsIDIwMTkgYXQgMTE6NDMgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4+IEJ1dCBrZWVwIGluIG1pbmQgdGhhdCB0aGUgImZvcmstdm0iIGNv
bW1hbmQgZXZlbiB3aXRoIHRoaXMgdXBkYXRlCj4gPiA+ID4gPiA+ID4+IHdvdWxkIHN0aWxsIG5v
dCBwcm9kdWNlIGZvciB5b3UgYSAiZnVsbHkgZnVuY3Rpb25hbCIgVk0gb24gaXRzIG93bi4KPiA+
ID4gPiA+ID4gPj4gVGhlIHVzZXIgc3RpbGwgaGFzIHRvIHByb2R1Y2UgYSBuZXcgVk0gY29uZmln
IGZpbGUsIGNyZWF0ZSB0aGUgbmV3Cj4gPiA+ID4gPiA+ID4+IGRpc2ssIHNhdmUgdGhlIFFFTVUg
c3RhdGUsIGV0Yy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJTU8gdGhlIGRlZmF1bHQgYmVoYXZpb3Ig
b2YgdGhlIGZvcmsgY29tbWFuZCBzaG91bGQgYmUgdG8gbGVhdmUgdGhlCj4gPiA+ID4gPiBvcmln
aW5hbCBWTSBwYXVzZWQsIHNvIHRoYXQgeW91IGNhbiBjb250aW51ZSB1c2luZyB0aGUgc2FtZSBk
aXNrIGFuZAo+ID4gPiA+ID4gbmV0d29yayBjb25maWcgaW4gdGhlIGZvcmsgYW5kIHlvdSB3b24n
dCBuZWVkIHRvIHBhc3MgYSBuZXcgY29uZmlnCj4gPiA+ID4gPiBmaWxlLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEFzIEp1bGllbiBhbHJlYWR5IHNhaWQsIG1heWJlIEkgd2Fzbid0IGNsZWFyIGluIG15
IHByZXZpb3VzIHJlcGxpZXM6Cj4gPiA+ID4gPiBJJ20gbm90IGFza2luZyB5b3UgdG8gaW1wbGVt
ZW50IGFsbCB0aGlzLCBpdCdzIGZpbmUgaWYgdGhlCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbiBv
ZiB0aGUgZm9yay12bSB4bCBjb21tYW5kIHJlcXVpcmVzIHlvdSB0byBwYXNzIGNlcnRhaW4KPiA+
ID4gPiA+IG9wdGlvbnMsIGFuZCB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIG5vdCBpbXBs
ZW1lbnRlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBXZSBuZWVkIGFuIGludGVyZmFjZSB0aGF0J3Mg
c2FuZSwgYW5kIHRoYXQncyBkZXNpZ25lZCB0byBiZSBlYXN5IGFuZAo+ID4gPiA+ID4gY29tcHJl
aGVuc2l2ZSB0byB1c2UsIG5vdCBhbiBpbnRlcmZhY2UgYnVpbHQgYXJvdW5kIHdoYXQncyBjdXJy
ZW50bHkKPiA+ID4gPiA+IGltcGxlbWVudGVkLgo+ID4gPiA+Cj4gPiA+ID4gT0ssIHNvIEkgdGhp
bmsgdGhhdCB3b3VsZCBsb29rIGxpa2UgInhsIGZvcmstdm0gPHBhcmVudF9kb21pZD4iIHdpdGgK
PiA+ID4gPiBhZGRpdGlvbmFsIG9wdGlvbnMgZm9yIHRoaW5ncyBsaWtlIG5hbWUsIGRpc2ssIHZs
YW4sIG9yIGEgY29tcGxldGVseQo+ID4gPiA+IG5ldyBjb25maWcsIGFsbCBvZiB3aGljaCBhcmUg
Y3VycmVudGx5IG5vdCBpbXBsZW1lbnRlZCwgKyBhbgo+ID4gPiA+IGFkZGl0aW9uYWwgb3B0aW9u
IHRvIG5vdCBsYXVuY2ggUUVNVSBhdCBhbGwsIHdoaWNoIHdvdWxkIGJlIHRoZSBvbmx5Cj4gPiA+
ID4gb25lIGN1cnJlbnRseSB3b3JraW5nLiBBbHNvIGtlZXBpbmcgdGhlIHNlcGFyYXRlICJ4bCBm
b3JrLWxhdW5jaC1kbSIKPiA+ID4gPiBhcyBpcy4gSXMgdGhhdCB3aGF0IHdlIGFyZSB0YWxraW5n
IGFib3V0Pwo+ID4gPgo+ID4gPiBJIHRoaW5rIGZvcmstbGF1bmNoLXZtIHNob3VsZCBqdXN0IGJl
IGFuIG9wdGlvbiBvZiBmb3JrLXZtIChpZToKPiA+ID4gLS1sYXVuY2gtZG0tb25seSBvciBzb21l
IHN1Y2gpLiBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSByZWFzb24gdG8gaGF2ZQo+ID4gPiBhIHNl
cGFyYXRlIHRvcC1sZXZlbCBjb21tYW5kIHRvIGp1c3QgbGF1bmNoIHRoZSBkZXZpY2UgbW9kZWwu
Cj4gPgo+ID4gSXQncyBqdXN0IHRoYXQgdGhlIGZvcmstbGF1bmNoLWRtIG5lZWRzIHRoZSBkb21p
ZCBvZiB0aGUgZm9yaywgd2hpbGUKPiA+IHRoZSBmb3JrLXZtIG5lZWRzIHRoZSBwYXJlbnQncyBk
b21pZC4gQnV0IEkgZ3Vlc3Mgd2UgY2FuIGludGVycHJldCB0aGUKPiA+ICJkb21pZCIgcmVxdWly
ZWQgaW5wdXQgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIHdoaWNoIHN1Yi1vcHRpb24gaXMKPiA+
IHNwZWNpZmllZCBmb3IgdGhlIGNvbW1hbmQuIExldCdzIHNlZSBob3cgaXQgcGFucyBvdXQuCj4g
Cj4gSG93IGRvZXMgdGhlIGZvbGxvd2luZyBsb29rIGZvciB0aGUgaW50ZXJmYWNlPwo+IAo+ICAg
ICB7ICJmb3JrLXZtIiwKPiAgICAgICAmbWFpbl9mb3JrX3ZtLCAwLCAxLAo+ICAgICAgICJGb3Jr
IGEgZG9tYWluIGZyb20gdGhlIHJ1bm5pbmcgcGFyZW50IGRvbWlkIiwKPiAgICAgICAiW29wdGlv
bnNdIDxEb21pZD4iLAo+ICAgICAgICItaCAgICAgICAgICAgICAgICAgICAgICAgICAgIFByaW50
IHRoaXMgaGVscC5cbiIKPiAgICAgICAiLU4gPG5hbWU+ICAgICAgICAgICAgICAgICAgICBBc3Np
Z24gbmFtZSB0byBWTSBmb3JrLlxuIgo+ICAgICAgICItRCA8ZGlzaz4gICAgICAgICAgICAgICAg
ICAgIEFzc2lnbiBkaXNrIHRvIFZNIGZvcmsuXG4iCj4gICAgICAgIi1CIDxicmlkZ2UgICAgICAg
ICAgICAgICAgICAgQXNzaWduIGJyaWRnZSB0byBWTSBmb3JrLlxuIgo+ICAgICAgICItViA8dmxh
bj4gICAgICAgICAgICAgICAgICAgIEFzc2lnbiB2bGFuIHRvIFZNIGZvcmsuXG4iCgpJTU8gSSB0
aGluayB0aGUgbmFtZSBvZiBmb3JrIGlzIHRoZSBvbmx5IHVzZWZ1bCBvcHRpb24uIEJlaW5nIGFi
bGUgdG8KYXNzaWduIGRpc2tzIG9yIGJyaWRnZXMgZnJvbSB0aGUgY29tbWFuZCBsaW5lIHNlZW1z
IHF1aXRlIGNvbXBsaWNhdGVkLgpXaGF0IGFib3V0IFZNcyB3aXRoIG11bHRpcGxlIGRpc2tzPyBP
ciBWTXMgd2l0aCBtdWx0aXBsZSBuaWNzIG9uCmRpZmZlcmVudCBicmlkZ2VzPwoKSSB0aGluayBp
dCdzIGVhc2llciBmb3IgYm90aCB0aGUgaW1wbGVtZW50YXRpb24gYW5kIHRoZSB1c2VyIHRvIGp1
c3QKdXNlIGEgY29uZmlnIGZpbGUgaW4gdGhhdCBjYXNlLgoKPiAgICAgICAiLUMgPGNvbmZpZz4g
ICAgICAgICAgICAgICAgICBVc2UgY29uZmlnIGZpbGUgZm9yIFZNIGZvcmsuXG4iCj4gICAgICAg
Ii1RIDxxZW11LXNhdmUtZmlsZT4gICAgICAgICAgVXNlIHFlbXUgc2F2ZSBmaWxlIGZvciBWTSBm
b3JrLlxuIgo+ICAgICAgICItLWxhdW5jaC1kbSAgPHllc3xub3xsYXRlPiAgIExhdW5jaCBkZXZp
Y2UgbW9kZWwgKFFFTVUpIGZvciBWTSBmb3JrLlxuIgo+ICAgICAgICItLWZvcmstcmVzZXQgICAg
ICAgICAgICAgICAgIFJlc2V0IFZNIGZvcmsuXG4iCj4gICAgICAgIi1wICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRG8gbm90IHVucGF1c2UgVk1zIGFmdGVyIGZvcmsuIgoKSSB0aGluayB0aGUg
ZGVmYXVsdCBiZWhhdmlvdXIgc2hvdWxkIGJlIHRvIGxlYXZlIHRoZSBvcmlnaW5hbCBWTQpwYXVz
ZWQgYW5kIHRoZSBmb3JrZWQgb25lIHJ1bm5pbmcsIGFuZCBoZW5jZSB0aGlzIHNob3VsZCBiZToK
CiAgICAgICAgIi1wICAgICAgICAgICAgICAgICAgICAgICAgICAgTGVhdmUgZm9ya2VkIFZNIHBh
dXNlZC4iCgkiLXUgICAgICAgICAgICAgICAgICAgICAgICAgICBMZWF2ZSBwYXJlbnQgVk0gdW5w
YXVzZWQuIgoKPiAgICAgICAiLWggICAgICAgICAgICAgICAgICAgICAgICAgICBQcmludCB0aGlz
IGhlbHAuXG4iCj4gICAgICAgIi1kICAgICAgICAgICAgICAgICAgICAgICAgICAgRW5hYmxlIGRl
YnVnIG1lc3NhZ2VzLlxuIgo+ICAgICB9LAo+IAo+IEN1cnJlbnRseSB0aGUgcGFydHMgdGhhdCBh
cmUgaW1wbGVtZW50ZWQgd291bGQgbG9vayBsaWtlOgo+IHhsIGZvcmstdm0gLXAgLS1sYXVuY2gt
ZG0gbm8gPHBhcmVudF9kb21pZD4KPiB4bCBmb3JrLXZtIC1wIC0tbGF1bmNoLWRtIGxhdGUgLUMg
PGNvbmZpZz4gLVEgPHFlbXUtc2F2ZS1maWxlPiA8Zm9ya19kb21pZD4KCldoeSBkbyB5b3UgbmVl
ZCBhIGNvbmZpZyBmaWxlIGZvciBsYXVuY2hpbmcgdGhlIFFlbXUgZGV2aWNlIG1vZGVsPwpEb2Vz
bid0IHRoZSBzYXZlLWZpbGUgY29udGFpbiBhbGwgdGhlIGluZm9ybWF0aW9uPwoKSSB0aGluayB5
b3UgYWxzbyBuZWVkIHNvbWV0aGluZyBsaWtlOgoKIyB4bCBmb3JrLXZtIC0tbGF1bmNoLWRtIGxh
dGUgPHBhcmVudF9kb21pZD4gPGZvcmtfZG9taWQ+CgpTbyB0aGF0IGEgdXNlciBkb2Vzbid0IG5l
ZWQgdG8gcGFzcyBhIHFlbXUtc2F2ZS1maWxlPwoKQ2FuIHlvdSBhbHNvIGxpc3QgdGhlIGNvbW1h
bmQgdXNlZCB0byBnZXQgdGhlIFFlbXUgc2F2ZS1maWxlIGZyb20gdGhlCnBhcmVudD8gKGp1c3Qg
Zm9yIGNvbXBsZXRlbmVzcyBwdXJwb3NlcykuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
