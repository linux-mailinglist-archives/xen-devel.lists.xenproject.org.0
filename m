Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8FC240844
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 17:18:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k59YV-0003GW-G7; Mon, 10 Aug 2020 15:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7tr8=BU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k59YT-0003GR-VX
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 15:17:42 +0000
X-Inumbo-ID: 117a42e4-a2a3-4d1e-ba08-85b4588d2c96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 117a42e4-a2a3-4d1e-ba08-85b4588d2c96;
 Mon, 10 Aug 2020 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597072660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MuVaQQQS00VxLuoI+eySNOnbLtmhSt7iT1Acd8MfNBk=;
 b=REulUawi79upWINyQQBQhCXHaFNcb/lKmI4ZPVC0o6BjUVct6w9KNILI
 XGIUiC24Gg5l+6FvlOmZljWdbmu1ztVt/g9h4Y8sT8eRq6DuGNc0Q7wCL
 u8kLExCZ3kd6ghyeZoBaoS6PFgXW5fPLQRTlCe5orU+OMBKXM8wZpg8DR U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: q3AvQsF6wTuD8vajCChvoRHlWOjqr7CePcO2BliNFURUFHXH5ee+RzxXid6TroYILFxE9Zr5/t
 byWoDwUXPUowSX5HeEr3HrYDpIR2tj+xD2x2HxZdD+/8QPxLkUFljcGaPQXjzXIYkBqF9G3XE0
 yuLR3Vs99hHjUiMF1FjG0S0wPXKHOeSRtFAL/TMbwPUAy74KNMQYY9MSrxUO5cSMPi+6EpduA1
 jPtN+d5l4N1pkHawRiBTSZ/8ZC3mzBQlnidu8ndhQ3epmAjZ9ITSgCQsC2AZ3SnwJEJUzLv1LX
 HbY=
X-SBRS: 2.7
X-MesageID: 24522621
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,457,1589256000"; d="scan'208";a="24522621"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Thread-Topic: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Thread-Index: AQHWaW0Cnjv2J5dpD0iO4FcEWA2no6kn31uAgAAShQCAAAIpAIAABZqAgAAA3oCAAADsgIAAAV+AgAALJACAASC1gIAINbsA
Date: Mon, 10 Aug 2020 15:17:36 +0000
Message-ID: <2B6E76FB-C520-4988-9C3A-BD495568360E@citrix.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
 <24362.33281.726014.586449@mariner.uk.xensource.com>
In-Reply-To: <24362.33281.726014.586449@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <0243A5921A5CD64099F0223AF063D45C@citrix.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei
 Liu <wl@xen.org>, Nick Rosbrook <rosbrookn@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDUsIDIwMjAsIGF0IDEwOjU1IEFNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBOaWNrIFJvc2Jyb29rIHdyaXRlcyAoIlJlOiBb
UEFUQ0hdIGxpYnhsOiBhdm9pZCBnb2xhbmcgYnVpbGRpbmcgd2l0aG91dCBDT05GSUdfR09MQU5H
PXkiKToNCj4+IEphbiAtIGlzIHRoZSBwcm9ibGVtIHNwZWNpZmljYWxseSB0aGF0IGEgZnJlc2gg
Y2xvbmUsICBvciBgZ2l0DQo+PiBjaGVja291dGAsIGV0Yy4gY2hhbmdlcyBmaWxlIHRpbWVzdGFt
cHMgaW4gYSB3YXkgdGhhdCB0cmlnZ2VycyBtYWtlIHRvDQo+PiByZWJ1aWxkIHRob3NlIHRhcmdl
dHM/IEkgaGF2ZSBub3QgdXNlZCB0aGUgbW92ZS1pZi1jaGFuZ2VkIGFwcHJvYWNoDQo+PiBiZWZv
cmUsIGJ1dCBBRkFJQ1QgdGhhdCB3b3VsZCBiZSBzdWZmaWNpZW50Lg0KPiANCj4gSSBkb24ndCB0
aGluayB0aGVyZSBpcywgZnJvbSB0aGUgcG9pbnQgb2YgdmlldyBvZiB0aGUgYnVpbGQgc3lzdGVt
LA0KPiBhbnl0aGluZyBkaWZmZXJlbnQgYWJvdXQgZ2VuZ290eXBlcyB0aGFuIGFib3V0IGFueSBv
dGhlciBpbi10cmVlDQo+IGNvbW1pdHRlZCBmaWxlIHdoaWNoIGlzIHVwZGF0ZWQgdXNpbmcgbWFr
ZWZpbGUgcnVsZXMgYmFzZWQgb24gb25seQ0KPiBvdGhlciBpbi10cmVlIGZpbGVzIGFuZCBjb21t
b24gdXRpbGl0aWVzIChlZywgaW4gdGhpcyBjYXNlLCBQeXRob24pLg0KPiANCj4gSSBndWVzcyB1
c2luZyBtb3ZlLWlmLWNoYW5nZWQgd2lsbCBwcm9iYWJseSBmaXggdGhpcy4NCg0KVGhhdOKAmXMg
cHJvYmFibHkgdGhlIHF1aWNrZXN0IGZpeCBBVE0uDQoNCj4gSmFuOiB0aGUgcmVhc29ucyB3aHkg
dGhpcyBvdXRwdXQgZmlsZSBoYXMgdG8gYmUgY29tbWl0dGVkIGFyZQ0KPiBjb21wbGljYXRlZC4g
IFdlJ3ZlIGRpc2N1c3NlZCB0aGVtIGF0IGxlbmd0aC4gIFVsdGltYXRlbHkgdGhlIHJlYXNvbg0K
PiBpcyBkZWxpYmVyYXRlIGRlZmljaWVuY2llc1sxXSBpbiBnb2xhbmcuICBTYWRseSB0aGlzIGlz
IHRoZSBiZXN0IG9mIGENCj4gbm90LXZlcnktZ29vZCBzZXQgb2Ygb3B0aW9ucy4NCg0KSSB0aGlu
ayB3ZSBkZWNpZGVkIGF0IHRoZSBTdW1taXQgdG8gbWFrZSBhIHNlcGFyYXRlIHJlcG8gZm9yIHRo
ZSBnZW5lcmF0ZWQgY29kZSwgZGlkbuKAmXQgd2U/DQoNClRvIGV4cGFuZCBvbiB0aGlzLCBKYW46
DQoNCjEuIEEgKnVzZWZ1bCogZ28gcGFja2FnZSBtdXN0IGJlIGFibGUgdG8gYmUgZG93bmxvYWRl
ZCBhbmQgYnVpbHQgYnkgdGhlIGdvIGJ1aWxkIHRvb2xzIGZyb20gdGhlIFVSTCBvZiBhIGdpdCBy
ZXBvDQoNCjIuIFRoZSBnbyBidWlsZCBwcm9jZXNzIGlzIHJlc3RyaWN0ZWQgaW4gd2hhdCBpdCB3
aWxsIGRvIGF1dG9tYXRpY2FsbHkgZm9yIHNlY3VyaXR5IHJlYXNvbnMuDQoNCkZvciA0LjE0LCB3
ZSBjaG9zZSB0byBjaGVjayB0aGUgZ2VuZXJhdGVkIGNvZGUgaW50byB4ZW4uZ2l0LCBzbyB0aGF0
IHRoZSBtYWluIFhlbiByZXBvIGNvdWxkIGZ1bGZpbGwgIzEuICBUbyBtYWtlIHN1cmUgdGhhdCB0
aGUgZ2VuZXJhdGVkIGNvZGUgd2FzIGtlcHQgdXAgdG8gZGF0ZSB3aXRoIGNoYW5nZXMgaW4gbGli
eGxfdHlwZXMuaWRsLCB3ZSBkZWNpZGVkIHRvIHJlLWdlbmVyYXRlIHRoZSBjb2RlIGV2ZW4gZm9y
IHN5c3RlbXMgd2hpY2ggZG9u4oCZdCBoYXZlIGdvbGFuZyBpbnN0YWxsZWQuDQoNCkJ1dCB0aGlz
IGlzIGFub3RoZXIgZXhhbXBsZSBvZiB0aGUgYW5ub3lpbmcgc2lkZSBlZmZlY3RzIG9mIHRoaXMg
YXBwcm9hY2guDQoNClRoZSBvdGhlciBhcHByb2FjaCwgd2hpY2ggSSB0aG91Z2h0IHdl4oCZZCBh
Z3JlZWQgdXBvbiBhdCB0aGUgc3VtbWl0LCBpcyB0byBoYXZlIGEgc2VwYXJhdGUgcmVwbyB3aXRo
IGEgbW9yZSBmcmllbmRseSBVUkwgd2hpY2ggaXMgcHJvZ3JhbW1hdGljYWxseSBnZW5lcmF0ZWQg
b24gYSByZWd1bGFyIGJhc2lzLiAgVGhhdCB3b3VsZCBvYnZpYXRlIHRoZSBuZWVkIHRvIHJ1biB0
aGUgZ2VuZXJhdG9yLCBleGNlcHQgdG8gdmVyaWZ5IHRoYXQgdGhlIGdlbmVyYXRlZCBjb2RlIHN0
aWxsIGNvbXBpbGVkICh3aGljaCB3b3VsZG7igJl0IGJlIHBvc3NpYmxlIHdpdGhvdXQgaGF2aW5n
IGdvbGFuZyBpbnN0YWxsZWQgYW55d2F5KS4NCg0KPiBbMV0gVGhpcyBpcyBhbiBleHRyZW1lIHBo
cmFzZSwgYnV0IGp1c3RpZmllZCBJIHRoaW5rLiAgVGhlIGdvbGFuZw0KPiBkZXNpZ25lcnMgaGF2
ZSBkZWxpYmVyYXRlbHkgYWltZWQgYXQgd2hhdCB0aGV5IHJlZ2FyZCBhcyAic2ltcGxpY2l0eSIN
Cj4gYW5kIG9uZSBvZiB0aGUgdGhpbmdzIHRoZXkgaGF2ZSAic2ltcGxpZmllZCIgYXdheSAoaW4g
dGhlaXIgbGFuZ3VhZ2UNCj4gYW5kIGluIHRoZWlyIHBhY2thZ2UgbWFuYWdlbWVudCBhbmQgYnVp
bGQgdG9vbHMpIGlzIHRoZSBhYmlsaXR5IHRvDQo+IGNvbnZlbmllbnRseSBnZW5lcmF0ZSBnb2xh
bmcgY29kZSBhdCBidWlsZCB0aW1lLiAgQ29tbWl0dGluZyB0aGUNCj4gZ2VuZXJhdGVkIGNvZGUg
aXMgdGhlIG5vcm0gaW4gdGhlIGdvbGFuZyBjb21tdW5pdHkuDQoNCkl04oCZcyBhIGJpdCBsZXNz
IHVucmVhc29uYWJsZSB0aGFuIHRoaXMuIDotKSAgVGhlcmUgYWN0dWFsbHkgaXMgaW5mcmFzdHJ1
Y3R1cmUgZm9yIGdlbmVyYXRpbmcgZmlsZXMg4oCUIGBnbyBnZW5lcmF0ZWAuICBJdOKAmXMganVz
dCBub3QgYWxsb3dlZCB0byBydW4gYXMgcGFydCBvZiBhIGJ1aWxkLg0KDQpPbmUgb2YgdGhlIGNv
cmUgdGhpbmdzIHRoZXkgd2FudGVkIHRvIGJlIGFibGUgdG8gZG8gd2FzIHRvIGRvd25sb2FkIGFu
ZCBidWlsZCBkZXBlbmRlbmNpZXMsIHJlY3Vyc2l2ZWx5IGFuZCBhdXRvbWF0aWNhbGx5LCBmcm9t
IGFyYml0cmFyeSBVUkxzLCB3aXRob3V0IHRoZSBuZWVkIGZvciBhbnkgY3VyYXRpb24uICBGb3Ig
c2FmZXR5IGNvbmNlcm5zLCB0aGV5IGRvbuKAmXQgd2FudCBhbnkgc3VjaCBkZXBlbmRlbmNpZXMg
dG8gYmUgYWJsZSB0byBydW4gYXJiaXRyYXJ5IGNvbW1hbmRzIGFzIHBhcnQgb2YgdGhlaXIgYnVp
bGQ6IEdvIGJ1aWxkcyBjYW4gYmFzaWNhbGx5IGNhbGwgY29tcGlsZXJzIGFuZCBsaW5rZXJzIGFu
ZCB0aGF04oCZcyBpdC4NCg0KTm90IHN1cmUgSSBhY3R1YWxseSBidXkgdGhhdCB0aGlzIGdpdmVz
IHlvdSBhIHdob2xlIGxvdCBvZiBzYWZldHksIHNpbmNlIHRoZXJl4oCZcyBub3QgYSBub3Qgb2Yg
cG9pbnQgaW4gY29tcGlsaW5nIHNvbWV0aGluZyB5b3XigJlyZSBub3QgZ29pbmcgdG8gcnVuOyBh
bmQgaXTigJlzIG5vdCBjbGVhciB0byBtZSB0aGF0IGl04oCZcyB0ZXJyaWJseSBtb3JlIHJpc2t5
IHRvIHJ1biBjb2RlIHlvdSBoYXZlbuKAmXQgdmV0dGVkIHRoYW4gdG8gYnVpbGQgY29kZSB5b3Ug
aGF2ZW7igJl0IHZldHRlZC4gIEJ1dCBhdCBsZWFzdCBpdOKAmXMgbm90IG9idmlvdXNseSB3cm9u
Zy4NCg0KIC1HZW9yZ2UNCg0K

