Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F351BBC53
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 13:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOL5-0004IL-Ly; Tue, 28 Apr 2020 11:23:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSul=6M=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jTOL4-0004IG-J5
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:23:46 +0000
X-Inumbo-ID: b8ceacbe-8942-11ea-984c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8ceacbe-8942-11ea-984c-12813bfff9fa;
 Tue, 28 Apr 2020 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588073026;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W4eRcM/1fGYE1Bqj6113bhJpdc2nDV1DGVYvSE2t48E=;
 b=NZ4ZfZt4LPfv8Rof5mUXjdHlDB2T+YRGLhhJL7nh937i5u0q3yOCgcp3
 oHmqTbGpIo/WuTIBy2VVrvRCEYU44uUj1sCzEoKd/TZyDXujMtzGPvKdm
 XnllczikO3fp0a0J/1Vydpr4bDrdmkgldR559xhp3NC+qCVDmZ0V+KY9u s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DSIFuDARWv1h9gWzyu0uGbVxM7j1UZvTqpZcgAJAiIcYRpw5qfJI9AyZxHNpsRxlFd4fRtjowP
 fvItZcq1nChkeFWWSkCQSnRTONeE0p1dVAj2lG7Kq3gfQ+3lMIKPdRWxrPp1V+aiPBSHM/NiFg
 eTI2FIciualDnrTT53qvPqWrkgdfWvYQfIzGPsjUalrMOnybi/sJnNxnW4c1bAnzOs+M196M7R
 N1lCk4mfNG6t16JoGIMtjYJETtdEQG/0jQ2LG2uu+OtU7u3EOoL4oCTqWIRIstZuCGR1ARA2ml
 /bA=
X-SBRS: 2.7
X-MesageID: 16345346
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16345346"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Thread-Topic: [PATCH v7 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
Thread-Index: AQHWCQXiBGUb+wr760WOfoEenUG4zahnVWoAgAALjICAAAX/gIAAAzMAgASARQCAITZdgIAADK2AgAD5+wCAABHcgIAABB0AgAAt8QA=
Date: Tue, 28 Apr 2020 11:23:41 +0000
Message-ID: <563C8FE9-E852-43F6-9FCC-EEEA14B60473@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-9-jgross@suse.com>
 <19f84540-6b49-f99d-805a-e07f56330f31@suse.com>
 <b9ddd1fb-d868-bb69-3b6b-27531beda2fa@suse.com>
 <f7d1f3aa-3a7e-fcb2-3163-5e67756e8452@suse.com>
 <17d65095-a51e-2e00-38ee-7c1c83d2bb99@suse.com>
 <51e0f0d2-f9ce-83fd-79fa-ae4805356612@suse.com>
 <31c7f4fe-847c-96f5-e598-dba99b0bb61a@suse.com>
 <085E1F72-EC22-43D6-8F7E-EDC132CC787D@citrix.com>
 <fb0e92cc-102f-7f87-1ad6-f3ccce1eee60@suse.com>
 <064958B4-1FCC-4300-A98A-7A1D608376F8@citrix.com>
 <23606595-8ce0-5151-d800-1dc0d97513d1@suse.com>
In-Reply-To: <23606595-8ce0-5151-d800-1dc0d97513d1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CCE51591D9DBA47992A79C5631485CF@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDI4LCAyMDIwLCBhdCA5OjM5IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMDQuMjAyMCAxMDoyNCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+PiBPbiBBcHIgMjgsIDIwMjAsIGF0IDg6MjAgQU0sIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjcuMDQuMjAyMCAxODoyNSwgR2Vvcmdl
IER1bmxhcCB3cm90ZToNCj4+Pj4gSWYgSmFuIGlzIE9LIHdpdGggaXQgc2ltcGx5IGJlaW5nIG91
dHNpZGUgQ09ORklHX0VYUEVSVCwgdGhlbiBncmVhdC4gIEJ1dCBpZiBoZSBpbnNpc3RzIG9uIHNv
bWUga2luZCBvZiB0ZXN0aW5nIGZvciBpdCB0byBiZSBvdXRzaWRlIG9mIENPTkZJR19FWFBFUlQs
IHRoZW4gYWdhaW4sIHRoZSBwZW9wbGUgd2hvIHdhbnQgaXQgdG8gYmUgc2VjdXJpdHkgc3VwcG9y
dGVkIHNob3VsZCBiZSB0aGUgb25lcyB3aG8gZG8gdGhlIHdvcmsgdG8gbWFrZSBpdCBoYXBwZW4u
DQo+Pj4gDQo+Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcGFydCwgSSdtIGFmcmFpZDogV2l0
aG91dCBhIGNvbmZpZyBvcHRpb24sDQo+Pj4gdGhlIGNvZGUgaXMgZ29pbmcgdG8gYmUgc2VjdXJp
dHkgc3VwcG9ydGVkIGFzIGxvbmcgYXMgaXQgZG9lc24ndA0KPj4+IGdldCBtYXJrZWQgb3RoZXJ3
aXNlIChleHBlcmltZW50YWwgb3Igd2hhdCBub3QpLiBXaXRoIGFuIG9wdGlvbg0KPj4+IGRlcGVu
ZGluZyBvbiBFWFBFUlQsIHdoYXQgd291bGQgYmVjb21lIHNlY3VyaXR5IHVuc3VwcG9ydGVkIGlz
IHRoZQ0KPj4+IG5vbi1kZWZhdWx0IChpLmUuIGRpc2FibGVkKSBzZXR0aW5nLiBUaGVyZSdzIG5v
dCBhIHdob2xlIGxvdCB0bw0KPj4+IHRlc3QgdGhlcmUsIGl0J3MgbWVyZWx5IGEgZm9ybWFsIGNv
bnNlcXVlbmNlIG9mIG91ciBnZW5lcmFsIHJ1bGVzLg0KPj4+IChPZiBjb3Vyc2UsIG92ZXIgdGlt
ZSBkZXBlbmRlbmNpZXMgb2Ygb3RoZXIgY29kZSBtYXkgZGV2ZWxvcCBvbg0KPj4+IHRoZSBpbmZv
cm1hdGlvbiBiZWluZyBhdmFpbGFibGUgZS5nLiB0byBEb20wIHVzZXJsYW5kLiBKdXN0IGxpa2UN
Cj4+PiB0aGVyZSdzIExpbnV4IHVzZXJsYW5kIGNvZGUgYXNzdW1pbmcgdGhlIGtlcm5lbCBjb25m
aWcgaXMNCj4+PiBhdmFpbGFibGUgaW4gY2VydGFpbiB3YXlzIFtJIGRvbid0IG5lY2Vzc2FyaWx5
IG1lYW4gdGhlIGVxdWl2YWxlbnQNCj4+PiBvZiBoeXBmcyBoZXJlXSwgdG8gdGhlbiB1c2UgaXQg
aW4gd2hhdCBJJ2QgY2FsbCBhYnVzaXZlIHdheXMgaW4gYXQNCj4+PiBsZWFzdCBzb21lIGNhc2Vz
LikNCj4+IA0KPj4gSGVyZeKAmXMgYW4gYXJndW1lbnQgeW91IG1pZ2h0IG1ha2U6DQo+PiANCj4+
IOKAnEFzIGEgbWVtYmVyIG9mIHRoZSBzZWN1cml0eSB0ZWFtLCBJIGRvbuKAmXQgd2FudCB0byBi
ZSBvbiB0aGUgaG9vayBmb3IgaXNzdWluZyBYU0FzIGZvciBjb2RlIHdoaWNoIGlzbuKAmXQgYXQg
bGVhc3Qgc21va2UtdGVzdGVkLiAgVGhlcmVmb3JlLCBJIG9wcG9zZSBhbnkgcGF0Y2ggYWRkaW5n
IENPTkZJR19IWVBGUyBvdXRzaWRlIG9mIENPTkZJR19FWFBFUlQsICp1bmxlc3MqIHRoZXJlIGlz
IGEgY29uY3JldGUgcGxhbiBmb3IgZ2V0dGluZyByZWd1bGFyIHRlc3RpbmcgZm9yIENPTkZJR19I
WVBGUz1uLuKAnQ0KPj4gDQo+PiBJ4oCZbSBub3Qgc2F5aW5nIHRoYXTigJlzIGFuIGFyZ3VtZW50
IHlvdSAqc2hvdWxkKiBtYWtlLiAgQnV0IHBlcnNvbmFsbHkgSSBkb27igJl0IGhhdmUgYSBzdHJv
bmcgYXJndW1lbnQgYWdhaW5zdCBzdWNoIGFuIGFyZ3VtZW50LiBTbywgaXQgc2VlbXMgdG8gbWUs
IGlmIHlvdSBkaWQgbWFrZSBpdCwgeW91IGhhdmUgYSByZWFzb25hYmxlIGNoYW5jZSBvZiBjYXJy
eWluZyB5b3VyIHBvaW50Lg0KPj4gDQo+PiBOb3cgY29uc2lkZXIgdGhpcyBoeXBvdGhldGljYWwg
dW5pdmVyc2Ugd2hlcmUgeW91IG1hZGUgdGhhdCBhcmd1bWVudCBhbmQgbm9ib2R5IG9wcG9zZWQg
aXQuICBJbiBvcmRlciB0byBnZXQgYSBwYXJ0aWN1bGFyIGZlYXR1cmUgKENPTkZJR19IWVBGUz1u
IHNlY3VyaXR5IHN1cHBvcnRlZCksIHRoZXJlIGlzIGV4dHJhIHdvcmsgdGhhdCBuZWVkcyB0byBi
ZSBkb25lIChnZXR0aW5nIENPTkZJR19IWVBGUz1uIHRlc3RlZCByZWd1bGFybHkpLiAgTXkgcG9p
bnQgd2FzLCB0aGUgZXhwZWN0YXRpb24gc2hvdWxkIGJlIHRoYXQgdGhlIGV4dHJhIHdvcmsgd2ls
bCBiZSBkb25lIGJ5IHRoZSBwZW9wbGUgd2hvIHdhbnQgb3IgYmVuZWZpdCBmcm9tIHRoZSBmZWF0
dXJlOyB0aGUgc2VyaWVzIHNob3VsZG7igJl0IGJlIGJsb2NrZWQgdW50aWwgSnVlcmdlbiBpbXBs
ZW1lbnRzIENPTkZJR19IWVBGUz1uIHRlc3RpbmcgKHNpbmNlIGhlIGRvZXNu4oCZdCBwZXJzb25h
bGx5IGhhdmUgYSBzdGFrZSBpbiB0aGF0IGZlYXR1cmUpLg0KPj4gDQo+PiBOb3cgb2J2aW91c2x5
LCBkb2luZyB3b3JrIHRvIGhlbHAgc29tZW9uZSBlbHNlIG91dCBpbiB0aGUgY29tbXVuaXR5IGlz
IG9mIGNvdXJzZSBhIGdvb2QgdGhpbmcgdG8gZG87IGl0IGJ1aWxkcyBnb29kd2lsbCwgdXNlcyBv
dXIgYWdncmVnYXRlIHJlc291cmNlcyBtb3JlIGVmZmljaWVudGx5LCBhbmQgbWFrZXMgb3VyIGNv
bW11bml0eSBtb3JlIGVuam95YWJsZSB0byB3b3JrIHdpdGguIEJ1dCB0aGUgZ29vZHdpbGwgcHJp
bWFyaWx5IGNvbWVzIGZyb20gdGhlIGZhY3QgdGhhdCBpdCB3YXMgZG9uZSBhcyBhIHZvbHVudGFy
eSBjaG9pY2UsIG5vdCBhcyBhIHJlcXVpcmVtZW50Lg0KPj4gDQo+PiBKdWVyZ2VuIHdhcyBiYWxr
aW5nIGF0IGhhdmluZyB0byBkbyB3aGF0IGhlIHNhdyBhcyBleHRyYSB3b3JrIHRvIGltcGxlbWVu
dCBDT05GSUdfSFlQRlMuICBJIHdhbnRlZCB0byBtYWtlIGl0IGNsZWFyIHRoYXQgZXZlbiB0aG91
Z2ggSSBzZWUgdmFsdWUgaW4gaGF2aW5nIENPTkZJR19IWVBGUywgKmhlKiBkb2VzbuKAmXQgaGF2
ZSB0byBkbyB0aGUgd29yayBpZiBoZSBkb2VzbuKAmXQgd2FudCB0byAoYWx0aG91Z2ggaXQgd291
bGQgY2VydGFpbmx5IGJlIGFwcHJlY2lhdGVkIGlmIGhlIGRpZCkuICBBbmQgdGhpcyBwYXJhZ3Jh
cGggd2FzIGV4dGVuZGluZyB0aGUgc2FtZSBwcmluY2lwbGUgaW50byB0aGUgaHlwb3RoZXRpY2Fs
IHVuaXZlcnNlIHdoZXJlIHNvbWVvbmUgaW5zaXN0ZWQgdGhhdCBDT05GSUdfSFlQRlM9biBoYWQg
dG8gYmUgdGVzdGVkIGJlZm9yZSBiZWluZyBzZWN1cml0eSBzdXBwb3J0ZWQuDQo+PiANCj4+IEhv
cGUgdGhhdCBtYWtlcyBzZW5zZS4gOi0pDQo+IA0KPiBZZXMsIGl0IGRvZXMsIHRoYW5rcyBmb3Ig
dGhlIGNsYXJpZmljYXRpb24uIEkgY2FuIHNlZSB3aGF0IHlvdSBkZXNjcmliZQ0KPiBhcyBhIHZh
bGlkIHBlcnNwZWN0aXZlIHRvIHRha2UsIGJ1dCByZWFsbHkgaW4gbXkgcmVxdWVzdCB0byBKw7xy
Z2VuIEkNCj4gdG9vayBhbm90aGVyOiBOb3cgdGhhdCB3ZSBoYXZlIEtjb25maWcsIGFkZGl0aW9u
cyBvZiBsYXJnZXIgYm9kaWVzIG9mDQo+IGNvZGUgKHBvc3NpYmx5IGFsc28ganVzdCBpbiB0ZXJt
cyBvZiBiaW5hcnkgc2l6ZSkgc2hvdWxkIGltbyBnZW5lcmFsbHkNCj4gYmUgcXVlc3Rpb25lZCB3
aGV0aGVyIHRoZXkgd2FudC9uZWVkIHRvIGJlIGJ1aWx0IGZvciBldmVyeW9uZS4gSS5lLiBpdA0K
PiBpcyBub3QgdG8gYmUgbGVmdCB0byBwZW9wbGUgYmVpbmcgd29ycmllZCBhYm91dCBiaW5hcnkg
c2l6ZXMgdG8gYXJyYW5nZQ0KPiBmb3IgdGhpbmdzIHRvIG5vdCBiZSBidWlsdCwgYnV0IGZvciBw
ZW9wbGUgY29udHJpYnV0aW5nIG5ldyBidXQgbm90DQo+IGVudGlyZWx5IGVzc2VudGlhbCBjb2Rl
IHRvIGNvbnNpZGVyIG1ha2luZyBpdCBvcHRpb24gZnJvbSB0aGUgdmVyeQ0KPiBiZWdpbm5pbmcu
DQoNCkkgdGhpbmsgdGhhdOKAmXMgYSByZWFzb25hYmxlIHBvc2l0aW9uIHRvIHRha2UsIGJ1dCBu
ZWVkcyB0byBiZSBiYWxhbmNlZCBvbiB0aGUgYW1vdW50IG9mIHdvcmsgdGhhdCB0aGlzIHdvdWxk
IGFjdHVhbGx5IHJlcXVpcmUuICBJZiBpdCBvbmx5IHJlcXVpcmVzIGFkZGluZyBhIGhhbmRmdWwg
b2YgI2lmZGVm4oCZcyBhbmQgbWF5YmUgbWFraW5nIGEgZmV3IHN0dWJzLCB0aGVuIHllcywgYXNr
aW5nIHRoZSBzdWJtaXR0ZXIgdG8gbWFrZSB0aGUgY2hhbmdlIG1ha2VzIHNlbnNlLiAgQnV0IGlm
IGl0IHJlcXVpcmVzIHRocmVlIGRvemVuICNpZmRlZuKAmXMgdGhyb3VnaG91dCB0aGUgY29kZSBh
bmQgYSBmYWlybHkgbWFqb3IgYXJjaGl0ZWN0dXJhbCBjaGFuZ2UsIHRoZW4gSSB0aGluayBpdOKA
mXMgcmVhc29uYWJsZSBmb3IgYSBzdWJtaXR0ZXIgdG8gcHVzaCBiYWNrLg0KDQpJIGRvbuKAmXQg
cmVhbGx5IHVuZGVyc3RhbmQgd2h5IEp1ZXJnZW4gdGhpbmtzIGFkZGluZyBDT05GSUdfSFlQRlMg
d291bGQgY2F1c2UgYSBsb3Qgb2YgY29kZSBjaHVybjsgbXkgYXJndW1lbnRhdGlvbiBoZXJlIGlz
IGJhc2VkIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgaGlzIGFzc2Vzc21lbnQgaXMgY29ycmVjdC4N
Cg0KIC1HZW9yZ2UNCg0K

