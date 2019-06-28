Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADE5A49B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 20:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgvzN-00064l-6m; Fri, 28 Jun 2019 18:52:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GzO1=U3=gmail.com=drhunter95@srs-us1.protection.inumbo.net>)
 id 1hgvzL-00064g-Lz
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 18:52:47 +0000
X-Inumbo-ID: ead0ff89-99d5-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ead0ff89-99d5-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 18:52:46 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so11956668edr.11
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2019 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BFFu0VcbLovtoNRHC7y3gD7VnSeLGsx30Nnk2d3LIeQ=;
 b=XXlhXSok1utAk4H/N/kY7uxQdM79lcvoUJyckqki1/4oaRtrWRd8UvhQ5HvK4hwmD6
 /SQFiOYtu5Jxw0pDUKHbhux/HJEoZI202aN93CQcyZV30ROmi+XyjiJxRXWLFe0g4Xbk
 1qGa5qy5HI7bmWDGiraYnuAX5bkumgxrDm8TyfCFSNdEQsADCPTuos55h0ZO2FSI4VR7
 oboVQw7otg6iu9cNW1oDoxp2m1YUnwZZGv++5oexNbqkFe9E+gQwu30ypHBJWNQbdjOK
 P4cr1vBJS8lymiHB7b1RgaRCcMCE0TfueNNQaQEffQzbS8JcSeEBcfSr8r64tjvaI2Pj
 uFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BFFu0VcbLovtoNRHC7y3gD7VnSeLGsx30Nnk2d3LIeQ=;
 b=F0ApSzZ+fvbdrEBQH2PM25xcZJIFT9XFp5nOk0sQyB8g/UcHaLamYDpJpc3m1p9iKN
 gcMVDY/ZPjMrIOWJ0Js6lXxWCeS4XbeSGy3+hYR+relo7HKzNncg6kn3DLt/UMBXR3kX
 jr2R5v+zMlHli/ooUCBRCS0hFRhvXSHD5S3E3x+eRnyg45M7I2BGaRiTEwP2RXy4AZg4
 oBo6x7iDzLsSQAbNxvNsPOxiicRa57VKx/LJ1wD4w9i2mAWfTK/4DjARZtX4pbJI8SB3
 kIKLns4yVlAeW0Upb1jIEg7QZh1FAvKao/yKMMfn1dCShzWL2lYCtNQ2zfwMj61CT6/s
 OCdg==
X-Gm-Message-State: APjAAAVorIi/oO6rTrxZEyXbkN1QJHY6O2LBZLaOdaIwL7CRAhOheR3q
 fPeFIH5hOmWlSRzDWNSfgRZ8B4gS+UlDYv+CCbw=
X-Google-Smtp-Source: APXvYqy9xvdOx7BwtZ9n5fQIBRDJkWDXuJH4PlIMwpIFGn/f32PkM1+CbjkxpVZ/vg1qVUKWWTQT/XwxWB92l5W81ek=
X-Received: by 2002:a50:9456:: with SMTP id q22mr13604074eda.28.1561747965303; 
 Fri, 28 Jun 2019 11:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
 <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
 <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
 <alpine.DEB.2.21.1906280901120.5851@sstabellini-ThinkPad-T480s>
 <CALC81-sX7Coj9Lg_zkeRxCTDvLQKc6iABtTfJQP53heCOsA85Q@mail.gmail.com>
 <0a7e9f5f-3b82-52d3-6d18-c60aa7e6e8a6@gmail.com>
In-Reply-To: <0a7e9f5f-3b82-52d3-6d18-c60aa7e6e8a6@gmail.com>
From: Iain Hunter <drhunter95@gmail.com>
Date: Fri, 28 Jun 2019 19:52:34 +0100
Message-ID: <CALC81-uLUYMZwvySKORhPHVu1g8ko5_WeF8v7jEHp6BpsCEZ+w@mail.gmail.com>
To: Denis Obrezkov <denisobrezkov@gmail.com>
Subject: Re: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
 register
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGVuaXMsCkFncmVlZC4gSSB3b3VsZCBjb250aW51ZSBhcyB5b3UgYXJlLCBqdXN0IHJlbWVt
YmVyaW5nIHRoYXQgaWYgeW91IGhhdmUKYW4gaXNzdWUgdGhlcmUgbWlnaHQgYmUgYSBwYXRjaCBm
b3IgaXQgYWxyZWFkeSBhbmQgaGF2ZSBhIGxvb2sgYXQgdGhlCnBhdGNoZXMuCklhaW4KCk9uIEZy
aSwgMjggSnVuIDIwMTkgYXQgMTk6MzEsIERlbmlzIE9icmV6a292IDxkZW5pc29icmV6a292QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBJYWluLAo+Cj4gT24gNi8yOC8xOSA3OjI1IFBNLCBJYWlu
IEh1bnRlciB3cm90ZToKPiA+IEhpIFN0ZWZhbm8sCj4gPiBJdCB3YXMgYSBwYXRjaHNldCBJJ2Qg
Y2lyY3VsYXRlZCBlYXJsaWVyIGluIHRoZSBHU29DIHByb2Nlc3MuCj4gPiBCYXNpY2FsbHkgdGhl
IHBhcnRpYWwgcG9ydCBvZiBYZW4gb24gWDE1IEknZCBkb25lIGxhc3QgeWVhci4gVGhlIGJ1aWxk
Cj4gPiBzY3JpcHQgaXMgdGhlIHJlZmVyZW5jZSBmb3Igd2hpY2ggcGF0Y2hlcyB3ZXJlIGFjdHVh
bGx5IHVzZWQuCj4gPiBJYWluCj4gSSBiZWxpZXZlIHRoZSByZWFzb24gd2UgaGF2ZW4ndCBzdGFy
dGVkIGZyb20gdHJ5aW5nIHlvdXIgcGF0Y2ggd2FzIHRoYXQKPiBJIHRob3VnaHQgdGhhdCBzaW5j
ZSB5b3UgaGFkbid0IHVzZWQgc21wIHlvdXIgc29sdXRpb24gbWlnaHQgbm90IHdvcmsgaW4KPiBv
dXIgY2FzZSwgc2luY2Ugd2Ugd2FudCB0byBoYXZlIHNtcCAoSSB3YXMgcHJvYmFibHkgd3Jvbmcp
Lgo+IEkgdGhpbmsgSSBzaG91bGQgcmVwcm9kdWNlIGFsbCB0aGUgaXNzdWVzIHN0ZXAtYnktc3Rl
cCB0aGF0IElhaW4gZmFjZWQKPiBhbmQgYXBwbHkgaGlzIHBhdGNoZXMgd2hlcmUgdGhleSBhcmUg
cmVxdWlyZWQgKG90aGVyd2lzZSBpdCB3b3VsZCBiZQo+IGhhcmQgZm9yIG1lIHRvIHVuZGVyc3Rh
bmQgd2hhdCdzIGhhcHBlbmluZykuCj4KPiBTdGVmYW5vLCBKdWxpZW4/Cj4gPgo+ID4gT24gRnJp
LCAyOCBKdW4gMjAxOSBhdCAxNzowMiwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IEhpIElhaW4sCj4gPj4KPiA+PiBXaGVyZSBpcyB0
aGUgcGF0Y2ggeW91IG1lbnRpb25lZD8gTWF5YmUgeW91IGZvcmdvdCB0byBhdHRhY2ggaXQgdG8g
dGhlCj4gPj4gZW1haWw/Cj4gPj4KPiA+PiBDaGVlcnMsCj4gPj4KPiA+PiBTdGVmYW5vCj4gPj4K
PiA+PiBPbiBGcmksIDI4IEp1biAyMDE5LCBJYWluIEh1bnRlciB3cm90ZToKPiA+Pj4gU3RlZmFu
bywgRGVuaXMsCj4gPj4+Cj4gPj4+IEkgYWNoaWV2ZWQgdGhhdCB3aXRoIHBhdGNoCj4gPj4+IHBh
dGNoZXMveGVuLzAwMDMtYWRkLVBSQ01fTVBVLXRvLW1lbW9yeS10cmFuc2xhdGlvbi1mb3ItQU01
NzJ4LnBhdGNoLgo+ID4+PiBUaGlzIGp1c3QgYWRkcwo+ID4+PiAgLnNwZWNpZmljX21hcHBpbmc9
b21hcDVfc3BlY2lmaWNfbWFwcGluZwo+ID4+PiB0byBEUkE3IHBsYXRmb3JtLgo+ID4+Pgo+ID4+
PiBJYWluCj4gPj4+Cj4gPj4+IE9uIEZyaSwgMjggSnVuIDIwMTkgYXQgMDE6MzMsIFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4g
V3JpdGluZyBoZXJlIGEgc3VtbWFyeSBvZiB0aGUgZm9sbG93LXVwIGRpc2N1c3Npb24gb24gSVJD
Lgo+ID4+Pj4KPiA+Pj4+IFRoaXMgaXMgZHVlIHRvIGEgbWFnaWMgbWVtb3J5IHJlZ2lvbiwgbm90
IGRlc2NyaWJlZCBpbiB0aGUgZGV2aWNlIHRyZWUsCj4gPj4+PiBiZWluZyBhY2Nlc3NlZCBieSBM
aW51eC4gVGhlIG1lbW9yeSByZWdpb24gaXMgMHg0ODI0MzQwMCAtIDB4NDgyNDM0MDArNTEyLgo+
ID4+Pj4KPiA+Pj4+IFRvIGZpeCBwcm9ibGVtcyBsaWtlIHRoaXMgb25lLCB3ZSBoYXZlIHRoZSBw
bGF0Zm9ybSBzcGVjaWZpYyBmaWxlcyBpbgo+ID4+Pj4geGVuOiBzZWUgdGhlIGZpbGVzIHVuZGVy
IHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvLiBTcGVjaWZpY2FsbHksIG9tYXA1LmMKPiA+Pj4+IG1p
Z2h0IGJlIGEgZ29vZCBtb2RlbCBmb3Igd2hhdCB3ZSBuZWVkLiBMb29rIGF0IHRoZQo+ID4+Pj4g
b21hcDVfc3BlY2lmaWNfbWFwcGluZyBmdW5jdGlvbiwgd2hpY2ggZG9lcyBleGFjdGx5IHdoYXQg
dGhlIG5hbWUKPiA+Pj4+IHN1Z2dlc3RzOiBpdCBtYXBzIHNwZWNpYWwgTU1JTyByZWdpb25zIGlu
dG8gdGhlIGd1ZXN0Lgo+ID4+Pj4KPiA+Pj4+ICAvKiBBZGRpdGlvbmFsIG1hcHBpbmdzIGZvciBk
b20wIChub3QgaW4gdGhlIERUUykgKi8KPiA+Pj4+ICBzdGF0aWMgaW50IG9tYXA1X3NwZWNpZmlj
X21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCkKPiA+Pj4+ICB7Cj4gPj4+PiAgICAgIC8qIE1hcCB0
aGUgUFJNIG1vZHVsZSAqLwo+ID4+Pj4gICAgICBtYXBfbW1pb19yZWdpb25zKGQsIGdhZGRyX3Rv
X2dmbihPTUFQNV9QUk1fQkFTRSksIDIsCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgbWFk
ZHJfdG9fbWZuKE9NQVA1X1BSTV9CQVNFKSk7Cj4gPj4+Pgo+ID4+Pj4gICAgICAvKiBNYXAgdGhl
IFBSTV9NUFUgKi8KPiA+Pj4+ICAgICAgbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4o
T01BUDVfUFJDTV9NUFVfQkFTRSksIDEsCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgbWFk
ZHJfdG9fbWZuKE9NQVA1X1BSQ01fTVBVX0JBU0UpKTsKPiA+Pj4+Cj4gPj4+PiAgICAgIC8qIE1h
cCB0aGUgV2FrZXVwIEdlbiAqLwo+ID4+Pj4gICAgICBtYXBfbW1pb19yZWdpb25zKGQsIGdhZGRy
X3RvX2dmbihPTUFQNV9XS1VQR0VOX0JBU0UpLCAxLAo+ID4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgIG1hZGRyX3RvX21mbihPTUFQNV9XS1VQR0VOX0JBU0UpKTsKPiA+Pj4+Cj4gPj4+PiAgICAg
IC8qIE1hcCB0aGUgb24tY2hpcCBTUkFNICovCj4gPj4+PiAgICAgIG1hcF9tbWlvX3JlZ2lvbnMo
ZCwgZ2FkZHJfdG9fZ2ZuKE9NQVA1X1NSQU1fUEEpLCAzMiwKPiA+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICBtYWRkcl90b19tZm4oT01BUDVfU1JBTV9QQSkpOwo+ID4+Pj4KPiA+Pj4+ICAgICAg
cmV0dXJuIDA7Cj4gPj4+PiAgfQo+ID4+Pj4KPiA+Pj4+IFdlIG5lZWQgc29tZXRoaW5nIHNpbWls
YXIgZm9yIDB4NDgyNDM0MDAgLSAweDQ4MjQzNDAwKzUxMiBvbgo+ID4+Pj4gQmVhZ2xlYm9hcmQu
Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+IE9uIFRodSwgMjcgSnVuIDIwMTksIERlbmlzIE9icmV6a292
IHdyb3RlOgo+ID4+Pj4+IENDJ2VkIG90aGVyIEdTb0MgbWVudG9ycwo+ID4+Pj4+Cj4gPj4+Pj4g
T24gNi8yNy8xOSA5OjUyIFBNLCBEZW5pcyBPYnJlemtvdiB3cm90ZToKPiA+Pj4+Pj4gSGVsbG8g
YWxsLAo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIGhhdmUgYSBmYWlsdXJlIHdoZW4gSSBhbSB0cnlpbmcg
dG8gYm9vdCBMaW51eCB3aXRoIFhlbiBvbiBiYi14MTUsIGhlcmUKPiA+Pj4+Pj4gaXMgdGhlIGxv
ZzoKPiA+Pj4+Pj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vQkJBRlBrVlUKPiA+Pj4+Pj4KPiA+Pj4+
Pj4gYW5kLCBhcyBKdWxpZW4gKGNjJ2VkKSBzdWdnZXN0ZWQgaGVyZSBpcyB0aGUgRFQgZGVidWcg
aW5mb3JtYXRpb24gZm9yIHhlbjoKPiA+Pj4+Pj4gaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL29w
ZW4/aWQ9MTVZVHNDS1lVVGJHMmktc2lXZXpKWEtXdUcwSDFWZlF6Cj4gPj4+Pj4+Cj4gPj4+Pj4+
IFNvLCB3aGF0IEkgd2FzIGFibGUgdG8gZmlndXJlIG91dDoKPiA+Pj4+Pj4gSW4gb21hcDRfcHJt
aW5zdF9yZWFkX2luc3RfcmVnIGl0IHRyaWVzIHRvIHJlYWQgZnJvbSBfcHJtX2Jhc2VzW3BhcnRd
LnZhCj4gPj4+Pj4+IChhcmNoL2FybS9tYWNoLW9tYXAyL3BybWluc3Q0NHh4LmMpLgo+ID4+Pj4+
PiBfcHJtX2Jhc2VzW3BhcnRdLnZhIGhhcyBhIHZhbHVlIG9mIHBybV9iYXNlIG9yIHByY21fbXB1
X2Jhc2UgZGVwZW5kaW5nCj4gPj4+Pj4+IG9uIHBhcnQgdmFsdWUoYXJjaC9hcm0vbWFjaC1vbWFw
Mi9wcm1pbnN0NDR4eC5jOjQ0KQo+ID4+Pj4+PiBGYWlsdXJlIGhhcHBlbnMgd2hlbiBfcHJtX2Jh
c2VzW09NQVA0NDMwX1BSQ01fTVBVX1BBUlRJVElPTl0gaXMgcmVhZC4KPiA+Pj4+Pj4gSXQncyB2
YWx1ZSBzZXQgdXAgaW4gYXJjaC9hcm0vbWFjaC1vbWFwMi9wcmNtX21wdTQ0eHguYzo1NC4KPiA+
Pj4+Pj4gVGhlIGluc3RhbGxlZCB2YWx1ZSBpcyBvYnRhaW5lZCB3aXRoIE9NQVBfTDRfSU9fQURE
UkVTUyBtYWNybwo+ID4+Pj4+PiAobWFjaF9vbWFwMi9pby5jOjY2NykuIEhlcmUgaXMgaXRzIGRl
ZmluaXRpb24gKGFyY2gvYXJtL21hY2hfb21hcDIvaW9tYXAuaCk6Cj4gPj4+Pj4+ICNkZWZpbmUg
T01BUDJfTDRfSU9fT0ZGU0VUICAweGIyMDAwMDAwCj4gPj4+Pj4+ICNkZWZpbmUgT01BUDJfTDRf
SU9fQUREUkVTUyhwYSkgSU9NRU0oKHBhKSArIE9NQVAyX0w0X0lPX09GRlNFVCkgLyogTDQgKi8K
PiA+Pj4+Pj4KPiA+Pj4+Pj4gYW5kIElPTUVNIChhcmNoL2FybS9pbmNsdWRlL2FzbS9pby5oKToK
PiA+Pj4+Pj4gI2RlZmluZSBJT01FTSh4KSAgICAoKHZvaWQgX19mb3JjZSBfX2lvbWVtICopKHgp
KQo+ID4+Pj4+Pgo+ID4+Pj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBpcyBoYXBwZW5pbmcg
YW5kIGhvdyB0byBvdmVyY29tZSBpdC4KPiA+Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IC0tCj4gPj4+
Pj4gUmVnYXJkcywgRGVuaXMgT2JyZXprb3YKPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Cj4KPiAtLQo+
IFJlZ2FyZHMsIERlbmlzIE9icmV6a292Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
