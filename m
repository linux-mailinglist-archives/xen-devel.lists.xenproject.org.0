Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D021A10A2E4
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:01:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZeAv-0000Bf-4K; Tue, 26 Nov 2019 16:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZeAt-0000Ba-AK
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:58:51 +0000
X-Inumbo-ID: 042f7b8d-106e-11ea-a3a5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 042f7b8d-106e-11ea-a3a5-12813bfff9fa;
 Tue, 26 Nov 2019 16:58:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 292F7AC45;
 Tue, 26 Nov 2019 16:58:49 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-2-roger.pau@citrix.com>
 <cccc439b-9595-1d5e-6969-8094e3a7c562@suse.com>
 <20191126164757.GH980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d44f276b-efce-d3e6-9b92-30c0874c726a@suse.com>
Date: Tue, 26 Nov 2019 17:58:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126164757.GH980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 1/2] x86/vmx: add ASSERT to
 prevent syncing PIR to IRR...
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
Cc: Juergen Gross <jgross@suse.com>, KevinTian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNzo0NywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBO
b3YgMjYsIDIwMTkgYXQgMDU6MzI6MDRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI2LjExLjIwMTkgMTQ6MjYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
Ywo+Pj4gQEAgLTIwNTQsNiArMjA1NCwxOSBAQCBzdGF0aWMgdm9pZCB2bXhfc3luY19waXJfdG9f
aXJyKHN0cnVjdCB2Y3B1ICp2KQo+Pj4gICAgICB1bnNpZ25lZCBpbnQgZ3JvdXAsIGk7Cj4+PiAg
ICAgIERFQ0xBUkVfQklUTUFQKHBlbmRpbmdfaW50ciwgTlJfVkVDVE9SUyk7Cj4+PiAgCj4+PiAr
ICAgIGlmICggdiAhPSBjdXJyZW50ICYmICFhdG9taWNfcmVhZCgmdi0+cGF1c2VfY291bnQpICkK
Pj4+ICsgICAgewo+Pj4gKyAgICAgICAgLyoKPj4+ICsgICAgICAgICAqIFN5bmNpbmcgUElSIHRv
IElSUiBtdXN0IG5vdCBiZSBkb25lIGJlaGluZCB0aGUgYmFjayBvZiB0aGUgQ1BVLAo+Pj4gKyAg
ICAgICAgICogc2luY2UgdGhlIElSUiBpcyBjb250cm9sbGVkIGJ5IHRoZSBoYXJkd2FyZSB3aGVu
IHRoZSB2Q1BVIGlzCj4+PiArICAgICAgICAgKiBleGVjdXRpbmcuIE9ubHkgYWxsb3cgWGVuIHRv
IGRvIHN1Y2ggc3luYyBpZiB0aGUgdkNQVSBpcyB0aGUgY3VycmVudAo+Pj4gKyAgICAgICAgICog
b25lIG9yIGlmIGl0J3MgcGF1c2VkOiB0aGF0J3MgcmVxdWlyZWQgaW4gb3JkZXIgdG8gc3luYyB0
aGUgbGFwaWMKPj4+ICsgICAgICAgICAqIHN0YXRlIGJlZm9yZSBzYXZpbmcgaXQuCj4+PiArICAg
ICAgICAgKi8KPj4KPj4gSXMgdGhpcyBzdGF0ZWQgdGhpcyB3YXkgYnkgdGhlIFNETSBhbnl3aGVy
ZT8KPiAKPiBObywgSSB0aGluayB0aGUgU0RNIGlzIG5vdCB2ZXJ5IGNsZWFyIG9uIHRoaXMsIHRo
ZXJlJ3MgYSBwYXJhZ3JhcGgKPiBhYm91dCBQSVI6Cj4gCj4gIlRoZSBsb2dpY2FsIHByb2Nlc3Nv
ciBwZXJmb3JtcyBhIGxvZ2ljYWwtT1Igb2YgUElSIGludG8gVklSUiBhbmQKPiBjbGVhcnMgUElS
LiBObyBvdGhlciBhZ2VudCBjYW4gcmVhZCBvciB3cml0ZSBhIFBJUiBiaXQgKG9yIGdyb3VwIG9m
Cj4gYml0cykgYmV0d2VlbiB0aGUgdGltZSBpdCBpcyByZWFkICh0byBkZXRlcm1pbmUgd2hhdCB0
byBPUiBpbnRvIFZJUlIpCj4gYW5kIHdoZW4gaXQgaXMgY2xlYXJlZC4iCgpXZWxsLCB0aGlzIGlz
IGFib3V0IFBJUiwgYnV0IG15IHF1ZXN0aW9uIHdhcyByYXRoZXIgdG93YXJkcyB0aGUKZWZmZWN0
cyBvbiB2SVJSLgoKPj4gSSBhc2sgYmVjYXVzZSB0aGUKPj4gY29tbWVudCB0aGVuIHJlYWxseSBk
b2Vzbid0IGFwcGx5IHRvIGp1c3QgdGhpcyBmdW5jdGlvbiwgYnV0IHRvCj4+IHZsYXBpY197LHRl
c3RfYW5kX317c2V0LGNsZWFyfV92ZWN0b3IoKSBtb3JlIGdlbmVyYWxseS4gSXQncwo+PiBub3Qg
Y2xlYXIgdG8gbWUgYXQgYWxsIHdoZXRoZXIgdGhlIENQVSBjYWNoZXMgKGluIGFuIGluY29oZXJl
bnQKPj4gZmFzaGlvbikgSVJSIChhbmQgbWF5YmUgb3RoZXIgQVBJQyBwYWdlIGVsZW1lbnRzKSwg
cmF0aGVyIHRoYW4KPj4gaG9ub3JpbmcgdGhlIGF0b21pYyB1cGRhdGVzIHRoZXNlIG1hY3JvcyBk
by4KPiAKPiBJTU8gc3luY2luZyBQSVIgdG8gSVJSIHdoZW4gdGhlIHZDUFUgaXMgcnVubmluZyBv
biBhIGRpZmZlcmVudCBwQ1BVIGlzCj4gbGlrZWx5IHRvIGF0IGxlYXN0IGRlZmVhdCB0aGUgcHVy
cG9zZSBvZiBwb3N0ZWQgaW50ZXJydXB0czoKCkkgYWdyZWUgaGVyZS4KCj4gd2hlbiB0aGUKPiBD
UFUgcmVjZWl2ZXMgdGhlIHBvc3RlZCBpbnRlcnJ1cHQgdmVjdG9yIGl0IHdvbid0IHNlZSB0aGUK
PiBvdXRzdGFuZGluZy1ub3RpZmljYXRpb24gYml0IGluIHRoZSBwb3N0ZWQtaW50ZXJydXB0IGRl
c2NyaXB0b3IKPiBiZWNhdXNlIHRoZSBzeW5jIGRvbmUgZnJvbSBhIGRpZmZlcmVudCBwQ1BVIHdv
dWxkIGhhdmUgY2xlYXJlZCBpdCwgYXQKPiB3aGljaCBwb2ludCBpdCdzIG5vdCBjbGVhciB0byBt
ZSB0aGF0IHRoZSBwcm9jZXNzb3Igd2lsbCBjaGVjayB2SVJSCj4gZm9yIHBlbmRpbmcgaW50ZXJy
dXB0cy4gVGhlIGRlc2NyaXB0aW9uIGluIHNlY3Rpb24gMjkuNgo+IFBPU1RFRC1JTlRFUlJVUFQg
UFJPQ0VTU0lORyBkb2Vzbid0IGV4cGxpY2l0bHkgbWVudGlvbiB3aGV0aGVyIHRoZQo+IHZhbHVl
IG9mIHRoZSBvdXRzdGFuZGluZy1ub3RpZmljYXRpb24gYml0IGFmZmVjdHMgdGhlIGxvZ2ljIG9m
IHBvc3RlZAo+IGludGVycnVwdCBwcm9jZXNzaW5nLgoKQnV0IG92ZXJhbGwgdGhpcyBhZ2FpbiBp
cyBhbGwgcG9zdGVkIGludGVycnVwdCBjZW50cmljIHdoZW4gbXkKcXVlc3Rpb24gd2FzIGFib3V0
IHZJUlIsIGluIHBhcnRpY3VsYXIgd2hldGhlciB0aGUgYXNzZXJ0aW5nIHlvdQphZGQgbWF5IG5l
ZWQgdG8gYmUgZXZlbiBtb3JlIHJpZ2lkLgoKQW55d2F5LCBsZXQncyBzZWUgd2hhdCB0aGUgVk1Y
IG1haW50YWluZXJzIGhhdmUgdG8gc2F5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
