Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251F18339E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 15:48:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCP5z-0000PL-7Y; Thu, 12 Mar 2020 14:45:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NBDK=45=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jCP5x-0000PG-Mo
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 14:45:57 +0000
X-Inumbo-ID: 2e3f8380-6470-11ea-b1a4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e3f8380-6470-11ea-b1a4-12813bfff9fa;
 Thu, 12 Mar 2020 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584024356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/F20xaLxl10SbrzcUBmcdmf3YGIW9GIYrIV3f7dLWJE=;
 b=SQ+MRvCM0DfgOK4x3314FhHbYjVXCZ3tghswmYb4VYgkwWgFGmIX0rOF
 r64fzK9JeKkcpZ/3Eo5gxkRLXxhQ0cV6+F/J2jzJbXS4fRSGkiBK0pkeX
 GlL3M1NDdrzKGMdTVO0lhotA46vOfovIW/m7l2Sln2/nmseWoQA8KuOAX s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fdsxwOnvHOTFZ9xOX2FT3zP3rYgTWhDjqv5kyyZyT5d2D2ySoWpWyVYOaDOWWigZighrRhckCI
 /jo84ctIXQrFNPuqPllQg5dwCiQ7QfZU4GAzNaW4PSEq/663IurZPzCE92ZXIhs+NKSqvR0hHE
 DsBDk+hsSKm6h53gf6jNALKF62US47uzQ/F6Lde/pyDOFHTL025oto093Pkix2eGMPhGAFqIA5
 Gl/iqWdlwfajdef9sulIyMVWGZKN5jHc7v0gs2bhnK/CeRhX0eRPiYJtWoSkiXa/+yrTcqqyJH
 r1g=
X-SBRS: 2.7
X-MesageID: 14265091
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14265091"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Thread-Topic: [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach lower
 credits than idle
Thread-Index: AQHV+HRVs3zoIyZvn0K7LD/O07UAx6hE+CwA
Date: Thu, 12 Mar 2020 14:45:53 +0000
Message-ID: <2B668743-662D-4A34-9ADE-F699A7BABF8A@citrix.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
In-Reply-To: <158402065414.753.15785539969715690913.stgit@Palanthas>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <87083242A2ADCD45AA9E9F1F5E8029F4@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>, Jan
 Beulich <jbeulich@suse.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWFyIDEyLCAyMDIwLCBhdCAxOjQ0IFBNLCBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFRoZXJlIGhhdmUgYmVlbiByZXBvcnQgb2Ygc3Rh
bGxzIG9mIGd1ZXN0IHZDUFVzLCB3aGVuIENyZWRpdDIgd2FzIHVzZWQuDQo+IEl0IHNlZW1lZCBs
aWtlIHRoZXNlIHZDUFVzIHdlcmUgbm90IGdldHRpbmcgc2NoZWR1bGVkIGZvciB2ZXJ5IGxvbmcN
Cj4gdGltZSwgZXZlbiB1bmRlciBsaWdodCBsb2FkIGNvbmRpdGlvbnMgKGUuZy4sIGR1cmluZyBk
b20wIGJvb3QpLg0KPiANCj4gSW52ZXN0aWdhdGlvbnMgbGVkIHRvIHRoZSBkaXNjb3ZlcnkgdGhh
dCAtLWFsdGhvdWdoIHJhcmVseS0tIGl0IGNhbg0KPiBoYXBwZW4gdGhhdCBhIHZDUFUgbWFuYWdl
cyB0byBydW4gZm9yIHZlcnkgbG9uZyB0aW1lc2xpY2VzLiBJbiBDcmVkaXQyLA0KPiB0aGlzIG1l
YW5zIHRoYXQsIHdoZW4gcnVudGltZSBhY2NvdW50aW5nIGhhcHBlbnMsIHRoZSB2Q1BVIHdpbGwg
bG9zZSBhDQo+IGxhcmdlIHF1YW50aXR5IG9mIGNyZWRpdHMuIFRoaXMgaW4gdHVybiBtYXkgbGVh
ZCB0byB0aGUgdkNQVSBoYXZpbmcgbGVzcw0KPiBjcmVkaXRzIHRoYW4gdGhlIGlkbGUgdkNQVXMg
KC0yXjMwKS4gQXQgdGhpcyBwb2ludCwgdGhlIHNjaGVkdWxlciB3aWxsDQo+IHBpY2sgdGhlIGlk
bGUgdkNQVSwgaW5zdGVhZCBvZiB0aGUgcmVhZHkgdG8gcnVuIHZDUFUsIGZvciBhIGZldw0KPiAi
ZXBvY2hzIiwgd2hpY2ggb2Z0ZW4gdGltZXMgaXMgZW5vdWdoIGZvciB0aGUgZ3Vlc3Qga2VybmVs
IHRvIHRoaW5rIHRoZQ0KPiB2Q1BVIGlzIG5vdCByZXNwb25kaW5nIGFuZCBjcmFzaGluZy4NCj4g
DQo+IEFuIGV4YW1wbGUgb2YgdGhpcyBzaXR1YXRpb24gaXMgc2hvd24gaGVyZS4gSW4gZmFjdCwg
d2UgY2FuIHNlZSBkMHYxDQo+IHNpdHRpbmcgaW4gdGhlIHJ1bnF1ZXVlIHdoaWxlIGFsbCB0aGUg
Q1BVcyBhcmUgaWRsZSwgYXMgaXQgaGFzDQo+IC0xMjU0MjM4MjcwIGNyZWRpdHMsIHdoaWNoIGlz
IHNtYWxsZXIgdGhhbiAtMl4zMCA9IOKIkjEwNzM3NDE4MjQ6DQo+IA0KPiAgICAoWEVOKSBSdW5x
dWV1ZSAwOg0KPiAgICAoWEVOKSAgIG5jcHVzICAgICAgICAgICAgICA9IDI4DQo+ICAgIChYRU4p
ICAgY3B1cyAgICAgICAgICAgICAgID0gMC0yNw0KPiAgICAoWEVOKSAgIG1heF93ZWlnaHQgICAg
ICAgICA9IDI1Ng0KPiAgICAoWEVOKSAgIHBpY2tfYmlhcyAgICAgICAgICA9IDIyDQo+ICAgIChY
RU4pICAgaW5zdGxvYWQgICAgICAgICAgID0gMQ0KPiAgICAoWEVOKSAgIGF2ZWxvYWQgICAgICAg
ICAgICA9IDI5MzM5MSAofjExMSUpDQo+ICAgIChYRU4pICAgaWRsZXJzOiAwMCwwMDAwMDAwMCww
MDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwZmZmZmZmZg0KPiAgICAoWEVOKSAg
IHRpY2tsZWQ6IDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAw
LDAwMDAwMDAwDQo+ICAgIChYRU4pICAgZnVsbHkgaWRsZSBjb3JlczogMDAsMDAwMDAwMDAsMDAw
MDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMGZmZmZmZmYNCj4gICAgWy4uLl0NCj4g
ICAgKFhFTikgUnVucXVldWUgMDoNCj4gICAgKFhFTikgQ1BVWzAwXSBydW5xPTAsIHNpYmxpbmc9
MDAsLi4uLCBjb3JlPTAwLC4uLg0KPiAgICAoWEVOKSBDUFVbMDFdIHJ1bnE9MCwgc2libGluZz0w
MCwuLi4sIGNvcmU9MDAsLi4uDQo+ICAgIFsuLi5dDQo+ICAgIChYRU4pIENQVVsyNl0gcnVucT0w
LCBzaWJsaW5nPTAwLC4uLiwgY29yZT0wMCwuLi4NCj4gICAgKFhFTikgQ1BVWzI3XSBydW5xPTAs
IHNpYmxpbmc9MDAsLi4uLCBjb3JlPTAwLC4uLg0KPiAgICAoWEVOKSBSVU5ROg0KPiAgICAoWEVO
KSAgICAgMDogWzAuMV0gZmxhZ3M9MCBjcHU9NSBjcmVkaXQ9LTEyNTQyMzgyNzAgW3c9MjU2XSBs
b2FkPTI2MjE0NCAofjEwMCUpDQo+IA0KPiBXZSBjZXJ0YWlubHkgZG9uJ3Qgd2FudCwgdW5kZXIg
YW55IGNpcmN1bXN0YW5jZSwgdGhpcyB0byBoYXBwZW4uDQo+IFRoZXJlZm9yZSwgbGV0J3MgdXNl
IElOVF9NSU4gZm9yIHRoZSBjcmVkaXRzIG9mIHRoZSBpZGxlIHZDUFUsIGluDQo+IENyZWRpdDIs
IHRvIGJlIHN1cmUgdGhhdCBubyB2Q1BVIGNhbiBnZXQgYmVsb3cgdGhhdCB2YWx1ZS4NCj4gDQo+
IE5PVEU6IGludmVzdGlnYXRpb25zIGhhdmUgYmVlbiBkb25lIGFib3V0IF9ob3dfIGl0IGlzIHBv
c3NpYmxlIGZvciBhDQo+IHZDUFUgdG8gZXhlY3V0ZSBmb3Igc28gbG9uZyB0aGF0IGl0cyBjcmVk
aXRzIGJlY29tZXMgc28gbG93LiBXaGlsZSBzdGlsbA0KPiBub3QgY29tcGxldGVseSBjbGVhciwg
dGhlcmUgYXJlIGV2aWRlbmNlIHRoYXQ6DQo+IC0gaXQgb25seSBoYXBwZW5zIHZlcnkgcmFyZWx5
DQo+IC0gaXQgYXBwZWFycyB0byBiZSBib3RoIG1hY2hpbmUgYW5kIHdvcmtsb2FkIHNwZWNpZmlj
DQo+IC0gaXQgZG9lcyBub3QgbG9vayB0byBiZSBhIENyZWRpdDIgKGUuZy4sIGFzIGl0IGhhcHBl
bnMgd2hlbiBydW5uaW5nDQo+ICB3aXRoIENyZWRpdDEgYXMgd2VsbCkgaXNzdWUsIG9yIGEgc2No
ZWR1bGVyIGlzc3VlDQo+IA0KPiBUaGlzIHBhdGNoIG1ha2VzIENyZWRpdDIgbW9yZSByb2J1c3Qg
dG8gZXZlbnRzIGxpa2UgdGhpcywgd2hhdGV2ZXINCj4gdGhlIGNhdXNlIGlzLCBhbmQgc2hvdWxk
IGhlbmNlIGJlIGJhY2twb3J0ZWQgKGFzIGZhciBhcyBwb3NzaWJsZSkuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPg0KPiBSZXBvcnRlZC1i
eTogR2xlbiA8Z2xlbmJhcm5leUBnbWFpbC5jb20+DQo+IFJlcG9ydGVkLWJ5OiBUb21hcyBNb3pl
cyA8aHlkcmFwb2xpY0BnbWFpbC5jb20+DQoNCk5pdDogVGhlIHJlcG9ydGVkLWJ54oCZcyBzaG91
bGQgYmUgYmVmb3JlIHRoZSBTb0IgKGkuZS4sIHRhZ3Mgcm91Z2hseSBpbiB0aW1lIG9yZGVyKS4N
Cg0KSSB0aGluayB0aGlzIGlzIGEgZ29vZCBjaGFuZ2UgdG8gbWFrZSB0aGUgYWxnb3JpdGhtIG1v
cmUgcm9idXN0LCBzbzoNCg0KQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT4NCg0KQnV0IGl0IHNlZW1zIGxpa2UgYWxsb3dpbmcgYSBndWVzdCB0byByYWNr
IHVwIC0yXjYzIGNyZWRpdHMgaXMgc3RpbGwgYSBiYWQgdGhpbmcsIGFuZCBpdCB3b3VsZCBiZSBu
aWNlIHRvIGhhdmUgc29tZSBvdGhlciBiYWNrc3RvcCAvIHJlc2V0IG1lY2hhbmlzbS4gIEJ1dCBJ
IGd1ZXNzIHRvIGhhdmUgYW4gZWZmZWN0aXZlIG1lY2hhbmlzbSBvZiB0aGF0IHNvcnQgd2XigJlk
IHdhbnQgdG8gdW5kZXJzdGFuZCBob3cgaXQgaGFwcGVuZWQgaW4gdGhlIGZpcnN0IHBsYWNlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
