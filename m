Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BAF18337E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:43:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCP0M-0008T9-7l; Thu, 12 Mar 2020 14:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NBDK=45=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jCP0K-0008T4-T7
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:40:08 +0000
X-Inumbo-ID: 5dd42020-646f-11ea-b1a0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dd42020-646f-11ea-b1a0-12813bfff9fa;
 Thu, 12 Mar 2020 14:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584024008;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HdpRx2F6ZlpDM+ruFmOcK60tbhWgjhjFLhO4AlS0mwA=;
 b=OMYnEqJuhzd+oXmdwygsCFOS/zWw61N2UEDva9QLqcfvz4BLHbxuzj7L
 XRikL4dVkq341PU4qu0mP+8KV951JsQsKc/JFaWtHg7CdpDGkXzLi9sjh
 KQ1fZhxa1yoTCtmkwG38RUXYz7JNQ4IgH5fPi8MsFyVeKo4hvFJbsq7tl 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bmxuv9iSeiYaeLQYeKpjrnVoUX3lx4wO4RY+thKQXVH+GrJC0vpOUOxo3GuF3j4Lff2jMEYcUj
 pDUG9DHTkWUJ+JzCT/xnexHigZfhd8BKiFfimIufr8UlI2ZbBXOJEdGfnLu6q7FRlelo+zdWdS
 BTJ8jTTHQUHQTTV2GztJQM8Pg/q7LsF3AWsMLJCcNpXLdQr4tV8eTXqbebpyXH6P6OljlB4dEh
 ZvVzkUxB35mHbCXigT/JBAELo+kPto24IkV1OQQx51q1gRafxinRt7/8Fz8UUOJRTMqMguFr/3
 OyE=
X-SBRS: 2.7
X-MesageID: 13849599
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="13849599"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
Thread-Index: AQHV+HRVs3zoIyZvn0K7LD/O07UAx6hE6gyAgAAMgIA=
Date: Thu, 12 Mar 2020 14:40:01 +0000
Message-ID: <49F5E83F-DB7A-4756-A1C5-DDF47C9312F3@citrix.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <57b1c260-0d1b-76de-83e5-65e043263325@citrix.com>
In-Reply-To: <57b1c260-0d1b-76de-83e5-65e043263325@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <049C1283DFDA754E8DD37E0B9BE9445F@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Juergen Gross <jgross@suse.com>, Charles
 Arnold <carnold@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Glen <glenbarney@gmail.com>, Dario Faggioli <dfaggioli@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWFyIDEyLCAyMDIwLCBhdCAxOjU1IFBNLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDEyLzAzLzIwMjAgMTM6NDQsIERh
cmlvIEZhZ2dpb2xpIHdyb3RlOg0KPj4gVGhlcmUgaGF2ZSBiZWVuIHJlcG9ydCBvZiBzdGFsbHMg
b2YgZ3Vlc3QgdkNQVXMsIHdoZW4gQ3JlZGl0MiB3YXMgdXNlZC4NCj4+IEl0IHNlZW1lZCBsaWtl
IHRoZXNlIHZDUFVzIHdlcmUgbm90IGdldHRpbmcgc2NoZWR1bGVkIGZvciB2ZXJ5IGxvbmcNCj4+
IHRpbWUsIGV2ZW4gdW5kZXIgbGlnaHQgbG9hZCBjb25kaXRpb25zIChlLmcuLCBkdXJpbmcgZG9t
MCBib290KS4NCj4+IA0KPj4gSW52ZXN0aWdhdGlvbnMgbGVkIHRvIHRoZSBkaXNjb3ZlcnkgdGhh
dCAtLWFsdGhvdWdoIHJhcmVseS0tIGl0IGNhbg0KPj4gaGFwcGVuIHRoYXQgYSB2Q1BVIG1hbmFn
ZXMgdG8gcnVuIGZvciB2ZXJ5IGxvbmcgdGltZXNsaWNlcy4gSW4gQ3JlZGl0MiwNCj4+IHRoaXMg
bWVhbnMgdGhhdCwgd2hlbiBydW50aW1lIGFjY291bnRpbmcgaGFwcGVucywgdGhlIHZDUFUgd2ls
bCBsb3NlIGENCj4+IGxhcmdlIHF1YW50aXR5IG9mIGNyZWRpdHMuIFRoaXMgaW4gdHVybiBtYXkg
bGVhZCB0byB0aGUgdkNQVSBoYXZpbmcgbGVzcw0KPj4gY3JlZGl0cyB0aGFuIHRoZSBpZGxlIHZD
UFVzICgtMl4zMCkuIEF0IHRoaXMgcG9pbnQsIHRoZSBzY2hlZHVsZXIgd2lsbA0KPj4gcGljayB0
aGUgaWRsZSB2Q1BVLCBpbnN0ZWFkIG9mIHRoZSByZWFkeSB0byBydW4gdkNQVSwgZm9yIGEgZmV3
DQo+PiAiZXBvY2hzIiwgd2hpY2ggb2Z0ZW4gdGltZXMgaXMgZW5vdWdoIGZvciB0aGUgZ3Vlc3Qg
a2VybmVsIHRvIHRoaW5rIHRoZQ0KPj4gdkNQVSBpcyBub3QgcmVzcG9uZGluZyBhbmQgY3Jhc2hp
bmcuDQo+PiANCj4+IEFuIGV4YW1wbGUgb2YgdGhpcyBzaXR1YXRpb24gaXMgc2hvd24gaGVyZS4g
SW4gZmFjdCwgd2UgY2FuIHNlZSBkMHYxDQo+PiBzaXR0aW5nIGluIHRoZSBydW5xdWV1ZSB3aGls
ZSBhbGwgdGhlIENQVXMgYXJlIGlkbGUsIGFzIGl0IGhhcw0KPj4gLTEyNTQyMzgyNzAgY3JlZGl0
cywgd2hpY2ggaXMgc21hbGxlciB0aGFuIC0yXjMwID0g4oiSMTA3Mzc0MTgyNDoNCj4+IA0KPj4g
ICAgKFhFTikgUnVucXVldWUgMDoNCj4+ICAgIChYRU4pICAgbmNwdXMgICAgICAgICAgICAgID0g
MjgNCj4+ICAgIChYRU4pICAgY3B1cyAgICAgICAgICAgICAgID0gMC0yNw0KPj4gICAgKFhFTikg
ICBtYXhfd2VpZ2h0ICAgICAgICAgPSAyNTYNCj4+ICAgIChYRU4pICAgcGlja19iaWFzICAgICAg
ICAgID0gMjINCj4+ICAgIChYRU4pICAgaW5zdGxvYWQgICAgICAgICAgID0gMQ0KPj4gICAgKFhF
TikgICBhdmVsb2FkICAgICAgICAgICAgPSAyOTMzOTEgKH4xMTElKQ0KPj4gICAgKFhFTikgICBp
ZGxlcnM6IDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDBm
ZmZmZmZmDQo+PiAgICAoWEVOKSAgIHRpY2tsZWQ6IDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAw
MDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwDQo+PiAgICAoWEVOKSAgIGZ1bGx5IGlkbGUg
Y29yZXM6IDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDBm
ZmZmZmZmDQo+PiAgICBbLi4uXQ0KPj4gICAgKFhFTikgUnVucXVldWUgMDoNCj4+ICAgIChYRU4p
IENQVVswMF0gcnVucT0wLCBzaWJsaW5nPTAwLC4uLiwgY29yZT0wMCwuLi4NCj4+ICAgIChYRU4p
IENQVVswMV0gcnVucT0wLCBzaWJsaW5nPTAwLC4uLiwgY29yZT0wMCwuLi4NCj4+ICAgIFsuLi5d
DQo+PiAgICAoWEVOKSBDUFVbMjZdIHJ1bnE9MCwgc2libGluZz0wMCwuLi4sIGNvcmU9MDAsLi4u
DQo+PiAgICAoWEVOKSBDUFVbMjddIHJ1bnE9MCwgc2libGluZz0wMCwuLi4sIGNvcmU9MDAsLi4u
DQo+PiAgICAoWEVOKSBSVU5ROg0KPj4gICAgKFhFTikgICAgIDA6IFswLjFdIGZsYWdzPTAgY3B1
PTUgY3JlZGl0PS0xMjU0MjM4MjcwIFt3PTI1Nl0gbG9hZD0yNjIxNDQgKH4xMDAlKQ0KPj4gDQo+
PiBXZSBjZXJ0YWlubHkgZG9uJ3Qgd2FudCwgdW5kZXIgYW55IGNpcmN1bXN0YW5jZSwgdGhpcyB0
byBoYXBwZW4uDQo+PiBUaGVyZWZvcmUsIGxldCdzIHVzZSBJTlRfTUlOIGZvciB0aGUgY3JlZGl0
cyBvZiB0aGUgaWRsZSB2Q1BVLCBpbg0KPj4gQ3JlZGl0MiwgdG8gYmUgc3VyZSB0aGF0IG5vIHZD
UFUgY2FuIGdldCBiZWxvdyB0aGF0IHZhbHVlLg0KPj4gDQo+PiBOT1RFOiBpbnZlc3RpZ2F0aW9u
cyBoYXZlIGJlZW4gZG9uZSBhYm91dCBfaG93XyBpdCBpcyBwb3NzaWJsZSBmb3IgYQ0KPj4gdkNQ
VSB0byBleGVjdXRlIGZvciBzbyBsb25nIHRoYXQgaXRzIGNyZWRpdHMgYmVjb21lcyBzbyBsb3cu
IFdoaWxlIHN0aWxsDQo+PiBub3QgY29tcGxldGVseSBjbGVhciwgdGhlcmUgYXJlIGV2aWRlbmNl
IHRoYXQ6DQo+PiAtIGl0IG9ubHkgaGFwcGVucyB2ZXJ5IHJhcmVseQ0KPj4gLSBpdCBhcHBlYXJz
IHRvIGJlIGJvdGggbWFjaGluZSBhbmQgd29ya2xvYWQgc3BlY2lmaWMNCj4+IC0gaXQgZG9lcyBu
b3QgbG9vayB0byBiZSBhIENyZWRpdDIgKGUuZy4sIGFzIGl0IGhhcHBlbnMgd2hlbiBydW5uaW5n
DQo+PiAgd2l0aCBDcmVkaXQxIGFzIHdlbGwpIGlzc3VlLCBvciBhIHNjaGVkdWxlciBpc3N1ZQ0K
PiANCj4gT24gd2hhdCBiYXNpcz8NCj4gDQo+IEV2ZXJ5dGhpbmcgcmVwb3J0ZWQgdG8geGVuLWRl
dmVsIGFwcGVhcnMgdG8gc3VnZ2VzdHMgaXQgaXMgYSBjcmVkaXQyDQo+IHByb2JsZW0uICBJdCBk
b2Vzbid0IG1hbmlmZXN0IG9uIHZlcnNpb25zIG9mIFhlbiBiZWZvcmUgY3JlZGl0MiBiZWNhbWUN
Cj4gdGhlIGRlZmF1bHQsIGFuZCBzd2l0Y2hpbmcgYmFjayB0byBjcmVkaXQxIGFwcGVhcnMgdG8g
bWl0aWdhdGUgdGhlIHByb2JsZW0uDQo+IA0KPiBDZXJ0YWlubHkgYXMgZmFyIGFzIFhlblNlcnZl
ciBpcyBjb25jZXJuZWQsIHdlIGhhdmVuJ3Qgc2VlbiBzeW1wdG9tcw0KPiBsaWtlIHRoaXMgaW4g
YSBkZWNhZGUgb2YgcnVubmluZyBjcmVkaXQxLg0KDQpPbmUgcmVhc29uIGNvdWxkIGJlIGJlY2F1
c2UgdGhlIHN5bXB0b21zIGFyZSBkaWZmZXJlbnQuICBPbiBjcmVkaXQxLCBjcmVkaXRzIGFuZCDi
gJxwcmlvcml0eeKAnSBhcmUgc2VwYXJhdGVkOyBpdOKAmXMgbm90IHBvc3NpYmxlIGluIGNyZWRp
dDEgZm9yIGEgdmNwdSB0byBlbmQgdXAgd2l0aCBhIGxvd2VyIHByaW9yaXR5IHRoYW4gdGhlIGlk
bGUgZG9tYWluLCBhbmQgbm8gbWF0dGVyIGhvdyBsb3cgdGhlIGNyZWRpdHMgYmVjb21lLCBhIHZj
cHUgd2lsbCBhbHdheXMgZW5kIHVwIHdpdGggc29tZSDigJxwZWVyc+KAnSBhdCB0aGUgc2FtZSBw
cmlvcml0eSBsZXZlbCwgbWVhbmluZyBpdCBhbHdheXMgaGFzIGEgY2hhbmNlIGF0IHNvbWUgY3B1
Lg0KDQpXaGF0IERhcmlvIGlzIHNheWluZyAoaWYgSSB1bmRlcnN0YW5kIGhpbSBjb3JyZWN0bHkp
IGlzIHRoYXQgdGhlICpwcm94aW1hdGUqIGNhdXNlIChhbGxvd2luZyBhIHZjcHUgdG8gaGF2ZSBh
biBlZmZlY3RpdmUgcHJpb3JpdHkgb2YgbGVzcyB0aGFuIGlkbGUpIGlzIGNlcnRhaW5seSBjcmVk
aXQyLW9ubHk7IGJ1dCB0aGUgKmRlZXBlciogY2F1c2UgKHZjcHVzIHJhY2tpbmcgdXAgbWFzc2l2
ZSBhbW91bnRzIG9mIG5lZ2F0aXZlIGNyZWRpdCkgaXMgbm90Lg0KDQogLUdlb3JnZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
