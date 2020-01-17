Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C89140605
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:29:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNuC-0005Nx-FD; Fri, 17 Jan 2020 09:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZlyK=3G=amazon.co.uk=prvs=278c75273=pdurrant@srs-us1.protection.inumbo.net>)
 id 1isNuB-0005Ns-BA
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:27:03 +0000
X-Inumbo-ID: 84d2dcb4-390b-11ea-a2eb-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84d2dcb4-390b-11ea-a2eb-bc764e2007e4;
 Fri, 17 Jan 2020 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579253223; x=1610789223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Yemmy2iY8cjJ0DGVfuZWv1d9wsY1TO3imlZdvuA57w=;
 b=IxuXbB0j2zjyAZKKDWMRHVi2fDI+4MuHbNabmxRpwBeEQ4u0m0fodkuQ
 4Zld6aKtVmu7y1wvYRKCF+4bPBzK3ltXaaf4/TtADsCU9UM/IYr8mfR5y
 j9nahToqJNKW6395dTa0j5PKFxrig+DtyaZrYw7nSksPFrYz8nhcI2rpg Q=;
IronPort-SDR: BSnWyn29oGzx2DZHrb6EKntWWhW5hB7iiMB6SUWDYBFw4Vsm1CGsHUpMZHhrc+V2b05Hk2O9Mg
 fcqESn7BhdIw==
X-IronPort-AV: E=Sophos;i="5.70,329,1574121600"; d="scan'208";a="10864988"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 17 Jan 2020 09:26:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9716AA2476; Fri, 17 Jan 2020 09:26:51 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 09:26:51 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 09:26:50 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 17 Jan 2020 09:26:50 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v3 3/6] libxl: add infrastructure to track and query
 'retired' domids
Thread-Index: AQHVzFBmRDOwY+MNmUK40ymCR9e33qftnKYAgAD4nWA=
Date: Fri, 17 Jan 2020 09:26:49 +0000
Message-ID: <57d659aacf3f4eb7ae69080aa5de90be@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-4-pdurrant@amazon.com>
 <24096.43806.179846.885653@mariner.uk.xensource.com>
In-Reply-To: <24096.43806.179846.885653@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.74]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 3/6] libxl: add infrastructure to track
 and query 'retired' domids
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE2IEphbnVhcnkgMjAyMCAxOToyOAo+IFRvOiBEdXJy
YW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUGVyYXJkCj4gPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAzLzZdIGxp
YnhsOiBhZGQgaW5mcmFzdHJ1Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5Cj4gJ3JldGlyZWQnIGRv
bWlkcwo+IAo+IFRoYW5rcy4gIEkgdGhpbmsgdGhpcyBpcyB0aGUgYWxnb3JpdGhtIGFzIHdlIGRp
c2N1c3NlZCwgdGhhbmtzLgo+IEkgaGF2ZSBzb21lIGNvbW1lbnRzIGFib3V0IHRoZSBpbXBsZW1l
bnRhdGlvbi4uLgo+IAo+IFBhdWwgRHVycmFudCB3cml0ZXMgKCJbUEFUQ0ggdjMgMy82XSBsaWJ4
bDogYWRkIGluZnJhc3RydWN0dXJlIHRvIHRyYWNrCj4gYW5kIHF1ZXJ5ICdyZXRpcmVkJyBkb21p
ZHMiKToKPiA+IEEgZG9taWQgaXMgY29uc2lkZXJlZCByZXRpcmVkIGlmIHRoZSBkb21haW4gaXQg
cmVwcmVzZW50cyB3YXMgZGVzdHJveWVkCj4gPiBsZXNzIHRoYW4gYSBzcGVjaWZpZWQgbnVtYmVy
IG9mIHNlY29uZHMgYWdvLiBUaGUgbnVtYmVyIGNhbiBiZSBzZXQgdXNpbmcKPiA+IHRoZSBlbnZp
cm9ubWVudCB2YXJpYWJsZSBMSUJYTF9ET01JRF9NQVhfUkVUSVJFTUVOVC4gSWYgdGhlIHZhcmlh
YmxlCj4gZG9lcwo+ID4gbm90IGV4aXN0IHRoZW4gYSBkZWZhdWx0IHZhbHVlIG9mIDYwcyBpcyB1
c2VkLgo+IC4uLgo+IAo+IEknbSBhZnJhaWQgSSB0aGluayB5b3VyIHVwZGF0ZSBwcm90b2NvbCBm
b3IgdGhpcyBmaWxlIGlzIHdyb25nLiAgSW4KPiBnZW5lcmFsIGl0IGlzIGEgYmFkIGlkZWEgdG8g
dHJ5IHRvIHdyaXRlIG92ZXIgYSBmaWxlIGluLXBsYWNlLiAgRG9pbmcKPiBzbyBpcyBmdWxsIG9m
IGdvdGNoYXMuICAoSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgZm9yIGV4YW1wbGUgSSB0aGluawo+
IGFuIGludGVycnVwdGVkIGF0dGVtcHQgYXQgY2xlYW5pbmcgdGhlIGZpbGUgY2FuIHByb2R1Y2Ug
YSBjb3JydXB0ZWQKPiBmaWxlIGNvbnRhaW5pbmcgbm9uc2Vuc2UuKQo+IAo+IENhbiB3ZSBwbGVh
c2UgdXNlIHRoZSBzdGFuZGFyZCB3cml0ZS10by1uZXctZmlsZS1hbmQtcmVuYW1lID8KCk9rLCBm
YWlyIGVub3VnaC4gSSdkIG5vdCByZWFsbHkgY29uc2lkZXJlZCBpbnRlcnJ1cHRpb24gYXMgYmVp
bmcgdG9vIG11Y2ggb2YgYSByaXNrIGJ1dCBJIGd1ZXNzIEkgc2hvdWxkLgoKPiBJZSwgdG8gbGF1
bmRlcgo+ICAgICBmbG9jayhvcGVuKCJkb21pZC1oaXN0b3J5LmxvY2siKSkKPiAgICAgZm9wZW4o
ImRvbWlkLWhpc3RvcnkiLCJyIikKPiAgICAgZm9wZW4oImRvbWlkLWhpc3RvcnkubmV3IiwidyIp
Cj4gICAgIGZnZXRzL2ZwdXRzCj4gICAgIGZjbG9zZQo+ICAgICByZW5hbWUKPiAgICAgY2xvc2UK
PiAKPiAoQW5kIG5vIHVzZXMgb2YgZnRlbGwsIGZvcGVuKCwicisiKSwgZXRjLikKPiAKPiBSZWFk
aW5nIGNhbiBiZSBkb25lIHdpdGhvdXQgdGFraW5nIHRoZSBsb2NrLCBpZiB5b3Ugc28gZmFuY3ku
Cj4gCj4gSSB0aGluayB0aGVyZSBhcmUgYSBsb3Qgb2YgbWlzc2luZyBlcnJvciBjaGVja3MgaW4g
dGhpcyBwYXRjaCwgYnV0Cj4gc2luY2UgSSdtIGFza2luZyBmb3IgYSBkaWZmZXJlbnQgYXBwcm9h
Y2ggSSB3b24ndCBwb2ludCB0aGVtIG91dAo+IGluZGl2aWR1YWxseS4KPiAKCk9rLgoKPiA+ICsg
ICAgZmQgPSBvcGVuKG5hbWUsIE9fUkRXUnxPX0NSRUFULCAwNjQ0KTsKPiA+ICsgICAgaWYgKGZk
IDwgMCkgewo+ID4gKyAgICAgICAgTE9HRShFUlJPUiwgInVuZXhwZWN0ZWQgZXJyb3Igd2hpbGUg
dHJ5aW5nIG9wZW4gJXMsIGVycm5vPSVkIiwKPiA+ICsgICAgICAgICAgICAgbmFtZSwgZXJybm8p
Owo+ID4gKyAgICAgICAgZ290byBmYWlsOwo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIGZvciAo
OzspIHsKPiA+ICsgICAgICAgIHJldCA9IGZsb2NrKGZkLCBMT0NLX0VYKTsKPiAKPiBJIGxvb2tl
ZCBmb3IgYSB1dGlsaXR5IGZ1bmN0aW9uIHRvIGRvIHRoaXMgYnV0IGRpZG4ndCBmaW5kIG9uZS4K
PiBJIHRoaW5rIHRoaXMgaXMgY29tcGxpY2F0ZWQgYmVjYXVzZSBpdCBuZWVkcyB0byBiZSBhIGBj
YXJlZmQnIGluIGxpYnhsCj4gdGVybXMgYmVjYXVzZSBvZiBjb25jdXJyZW50IGZvcmtpbmcgYnkg
b3RoZXIgdGhyZWFkcyBpbiB0aGUKPiBhcHBsaWNhdGlvbi4KPiAKPiBJIHN1Z2dlc3QgZ2VuZXJh
bGlzaW5nIGxpYnhsX19sb2NrX2RvbWFpbl91c2VyZGF0YSwgd2hpY2ggaGFzIGFsbCB0aGUKPiBu
ZWNlc3NhcnkgY29kZSAoYW5kIHdoaWNoIGFsc28gd291bGQgcGVybWl0IHJlbW92aW5nIHRoZSBm
aWxlIGluIHRoZQo+IGZ1dHVyZSkuCj4gCj4gSSBmZWVsIHJlc3BvbnNpYmxlIGZvciB0aGlzIGlu
Y29udmVuaWVuY2UuICBJZiB0aGlzIGlzIHRvbyB0aXJlc29tZQo+IGZvciB5b3UsIEkgY291bGQg
ZG8gdGhhdCBwYXJ0IGZvciB5b3UuLi4KPiAKClRoYXQncyBvazsgSSdsbCBpbnNlcnQgYSBwcmVj
ZWRpbmcgZ2VuZXJhbGl6YXRpb24gcGF0Y2gsIHVubGVzcyBpdCB0dXJucyBpbnRvIGEgdG90YWwg
Y2FuIG9mIHdvcm1zLi4uIHdoaWNoIEkgZG91YnQgaXQgd2lsbC4KCj4gPiArLyogV3JpdGUgYSBk
b21pZCByZXRpcmVtZW50IHJlY29yZCAqLwo+ID4gK3N0YXRpYyB2b2lkIGxpYnhsX19yZXRpcmVf
ZG9taWQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQpCj4gPiArewo+IC4uLgo+ID4gKyAg
ICB3aGlsZSAoZmdldHMobGluZSwgc2l6ZW9mKGxpbmUpLCBmKSkgewo+ID4gKyAgICAgICAgdW5z
aWduZWQgbG9uZyBzZWM7Cj4gPiArICAgICAgICB1bnNpZ25lZCBpbnQgaWdub3JlZDsKPiA+ICsK
PiA+ICsgICAgICAgIHJvZmYgPSBmdGVsbChmKTsKPiA+ICsKPiA+ICsgICAgICAgIGlmIChzc2Nh
bmYobGluZSwgIiVsdSAldSIsICZzZWMsICZpZ25vcmVkKSAhPSAyKQo+ID4gKyAgICAgICAgICAg
IGNvbnRpbnVlOyAvKiBQdXJnZSBtYWxmb3JtZWQgbGluZXMgKi8KPiAKPiBJJ20gbm90IHN1cmUg
d2h5IHlvdSBib3RoZXIgd2l0aCBmZ2V0cyBpbnRvIGEgYnVmZmVyLCB3aGVuIHlvdSBjb3VsZAo+
IGp1c3QgdXNlIGZzY2FuZiByYXRoZXIgdGhhbiBzc2NhbmYuICBZb3VyIGNvZGUgZG9lc24ndCBu
ZWVkIHRvIHRha2UKPiBtdWNoIGNhcmUgYWJvdXQgd2VpcmQgc3ludGF4IHdoaWNoIG1pZ2h0IG9j
Y3VyIChhbmQgaW5kZWVkIHlvdXIgY29kZQo+IGhlcmUgZG9lc24ndCB0YWtlIHN1Y2ggY2FyZSku
CgpXZWxsLCBJIG5lZWQgdG8gcHVsbCB0aGUgbGluZSBpbnRvIGEgYnVmZmVyIGlmIEknbSBnb2lu
ZyB0byB3cml0ZSBpdCBvdXQgYWdhaW4sIGJ1dCBvdGhlcndpc2UgSSBjb3VsZCBpbmRlZWQgdXNl
IGZzY2FuZigpLgoKPiAKPiA+IEBAIC0xMzMxLDYgKzE0NjIsNyBAQCBzdGF0aWMgdm9pZCBkZXZp
Y2VzX2Rlc3Ryb3lfY2IobGlieGxfX2VnYyAqZWdjLAo+ID4gICAgICAgICAgaWYgKCFjdHgtPnhj
aCkgZ290byBiYWRjaGlsZDsKPiA+Cj4gPiAgICAgICAgICBpZiAoIWRpcy0+c29mdF9yZXNldCkg
ewo+ID4gKyAgICAgICAgICAgIGxpYnhsX19yZXRpcmVfZG9taWQoZ2MsIGRvbWlkKTsKPiAKPiBJ
IHdvbmRlciBpZiBhIGJldHRlciB0ZXJtIHRoYW4gInJldGlyZWQiIHdvdWxkIGJlIHBvc3NpYmxl
LiAgSQo+IGluaXRpYWxseSBmb3VuZCB0aGlzIHBhdGNoIGEgYml0IGNvbmZ1c2luZyBiZWNhdXNl
IEkgdGhvdWdodCBhIHJldGlyZWQKPiBkb21pZCB3b3VsZCBiZSBvbmUgd2hpY2ggaGFkICpub3Qq
IGJlZW4gdXNlZCByZWNlbnRseS4gIE1heWJlCj4gInJlY2VudCIsICJtYXJrIHJlY2VudCIsIGV0
Yy4gPyAgVWx0aW1hdGVseSB0aGlzIGlzIGEgYmlrZXNoZWQgaXNzdWUKPiB3aGljaCBJIHdpbGwg
bGVhdmUgdGhpcyB1cCB0byB5b3UsIHRob3VnaC4KPiAKCk9rLCAncmVjZW50JyBpcyBwcm9iYWJs
eSBjbGVhcmVyLiBJJ2xsIHMvcmV0aXJlZC9yZWNlbnQvZy4KCj4gCj4gSSBkb24ndCBtdWNoIGxp
a2UgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIHRvIGNvbmZpZ3VyZSB0aGlzLiAgSSBkb24ndAo+
IG9iamVjdCB0byBrZWVwaW5nIGl0IGJ1dCBjYW4gd2UgaGF2ZSBhIGNvbW1lbnQgc2F5aW5nIHRo
aXMgaXMgbm90Cj4gaW50ZW5kZWQgZm9yIHVzZSBpbiBwcm9kdWN0aW9uID8gIFBlcnNvbmFsbHkg
SSB3b3VsZCByYXRoZXIgaXQgd2FzCj4gaGFyZGNvZGVkLCBvciBmYWlsaW5nIHRoYXQsIHdyaXR0
ZW4gdG8gc29tZSBjb25maWcgZmlsZS4KPiAKClRoZSBwcm9ibGVtIGlzIHRoYXQgbGlieGwgaGFz
IG5vIGNvbmZpZyBmaWxlLiBFbnYgdmFyaWFibGVzIHNlZW0gdG8gYmUgdXNlZCBmb3Igb3RoZXIg
dGhpbmdzIHNvIEkgZm9sbG93ZWQgc3VpdC4gSSdkIHJhdGhlciBrZWVwIHRoZSBvdmVycmlkZSBm
b3IgZGVidWcgcHVycG9zZXM7IEknbGwgc3RpY2sgYSBjb21tZW50IGluIHRoZSBoZWFkZXIgc2F5
aW5nIHRoYXQncyB3aGF0IGl0J3MgZm9yIHRob3VnaCwgYXMgeW91IHN1Z2dlc3QuCgo+IAo+IEZp
bmFsbHksIEkgdGhpbmsgdGhpcyBwYXRjaCBuZWVkcyBhbiBhZGRpdGlvbiB0byB4ZW4taW5pdC1k
b20wIHRvCj4gcmVtb3ZlIG9yIGVtcHR5IHRoZSByZWNvcmQgZmlsZS4gIFRoaXMgaXMgYmVjYXVz
ZSB3aGlsZSAvcnVuIGlzCj4gdXN1YWxseSBhIHRtcGZzLCB0aGlzIGlzIG5vdCAqbmVjZXNzYXJp
bHkqIHRydWUuCj4gCgpPaywgaWYgd2UgY2Fubm90IHJlbHkgb24gaXQgYmVpbmcgdG1wZnMgdGhl
biBJIHdpbGwgZG8gdGhhdC4KCiAgUGF1bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
