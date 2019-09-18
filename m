Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071BB62C3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 14:08:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYgn-0001zJ-W1; Wed, 18 Sep 2019 12:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAYgl-0001zA-Kp
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 12:04:03 +0000
X-Inumbo-ID: 66fea028-da0c-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66fea028-da0c-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 12:04:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC3F3ABC4;
 Wed, 18 Sep 2019 12:04:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <17dad502-8e1f-83b9-7071-c8e342bc6104@suse.com>
 <8e10c3b4-775e-9c29-e9a5-64c7a8a99d5e@citrix.com>
 <5c5fcb8b-eba2-bd93-d2dc-f06eed7a64af@suse.com>
 <7ca42458-9f65-3593-a7ad-b24e44445d57@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4a45ac6-a57f-8c4e-6f63-80a9e4f2f872@suse.com>
Date: Wed, 18 Sep 2019 14:04:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7ca42458-9f65-3593-a7ad-b24e44445d57@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/9] x86/mm: honor opt_pcid also for
 32-bit PV domains
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDkuMjAxOSAxMzo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wOS8yMDE5
IDEwOjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMDkuMjAxOSAyMTowMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDE3LzA5LzIwMTkgMDc6MTQsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEkgY2FuJ3Qgc2VlIGFueSB0ZWNobmljYWwgb3IgcGVyZm9ybWFuY2UgcmVhc29uIHdo
eSB3ZSBzaG91bGQgdHJlYXQKPj4+PiAzMi1iaXQgUFYgZGlmZmVyZW50IGZyb20gNjQtYml0IFBW
IGluIHRoaXMgcmVnYXJkLgo+Pj4gV2VsbCwgb3RoZXIgdGhhbiB0aGUgZmFjdCB0aGlzIHNldHRp
bmcgaXMgb25seSByZWFkIGZvciBhIDY0Yml0IGd1ZXN0Li4uCj4+IEhvdyBjb21lPyBtYWtlX2Ny
MygpIHVzZXMgaXQgdW5pZm9ybWx5LCBhcyBkb2VzIHB2X21ha2VfY3I0KCkuCj4+IHRvZ2dsZV9n
dWVzdF9tb2RlKCkgaXMgdGhlIG9uZSBjYXNlIHdoZXJlIGl0J3Mgc3RyaWN0bHkgNjQtYml0Cj4+
IGd1ZXN0IG9ubHkuCj4gCj4gT2ggLSB5b3UgYXJlIHJpZ2h0LsKgIEkgZG9uJ3Qga25vdyBob3cg
SSBjYW1lIHRvIHRoZSBhYm92ZSBjb25jbHVzaW9uLAo+IGJ1dCAuLi4KPiAKPj4+IFRoZSByZWFz
b24gaXQgaXNuJ3Qgc2V0IGZvciAzMmJpdCBndWVzdHMgaXMgdGhhdCB0aGVyZSBpcyBubyBzY2Vu
YXJpbwo+Pj4gd2hlcmUgd2UgdXNlIGl0Lgo+PiAicGNpZD0xIiBhbmQgInBjaWQ9bm94cHRpIiBi
b3RoIGFyZSBzY2VuYXJpb3Mgd2hlcmUsIHdpdGggdGhpcwo+PiBwYXRjaCBpbiBwbGFjZSwgd2Ug
d291bGQgdXNlIGl0Lgo+IAo+IC4uLiBJIHN0aWxsIGRvbid0IHNlZSB3aHkgdGhpcyBpcyBzZW5z
aWJsZS4KCldoZXRoZXIgaXQncyBzZW5zaWJsZSB0byBhdCBsZWFzdCB0cnkgb3V0IEknbSBub3Qg
Z29pbmcgdG8ganVkZ2UuCldoYXQgSSBmaW5kIHdyb25nIHRob3VnaCBpcyB0aGF0LCBmb3Igbm8g
cmVhc29uLCB3ZSBkb24ndCBmdWxseQpob25vciB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiBwcmlv
ciB0byB0aGlzIGNoYW5nZS4KCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIGFsbCBpdCB3aWxsIGRv
IGZvciBhIDMyYml0IFBWIGd1ZXN0IGlzIHN0YXJ0IHVzaW5nCj4gMiBQQ0lEcyBmb3IgdGhlIHNh
bWUgbG9naWNhbCBnQ1IzLCB3aGljaCB3aWxsIGJlIGEgbmV0IHBlcmYgaXQgaGl0IGZvcgo+IDMy
Yml0IFBWIGd1ZXN0cy4KPiAKPiBUaGlzIGlzIHVsdGltYXRlbHkgd3JhcHBlZCB1cCBpbiB0aGUg
Y29uZnVzaW9uIG92ZXIgVEZfa2VybmVsX21vZGUgYW5kCj4gdi0+YXJjaC5ndWVzdF90YWJsZXss
X3VzZXJ9LgoKSXMgdGhlcmUgc3RpbGwgY29uZnVzaW9uLCBkZXNwaXRlIHRoZSBjbGVhbnVwIGRv
bmUgbm90IG92ZXJseSBsb25nCmFnbz8gVEZfa2VybmVsX21vZGUgaXMgbm93IHVuaWZvcm1seSBz
ZXQgZm9yIEhWTSBhbmQgMzItYml0IFBWCnZDUFUtczsgb25seSA2NC1iaXQgUFYgdkNQVS1zIGNh
biBoYXZlIGl0IGNsZWFyLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
