Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89AA1E7E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 17:10:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3M1G-00053z-7t; Thu, 29 Aug 2019 15:07:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3M1D-00053u-VK
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:07:23 +0000
X-Inumbo-ID: b3d0a250-ca6e-11e9-ae6b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3d0a250-ca6e-11e9-ae6b-12813bfff9fa;
 Thu, 29 Aug 2019 15:07:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D4CDAE79;
 Thu, 29 Aug 2019 15:07:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5D03853F0200007800238448@prv1-mh.provo.novell.com>
 <5D0387330200007800238476@prv1-mh.provo.novell.com>
 <b4b51025-7ef0-8d11-8f2a-bf6d48e5db4b@citrix.com>
 <a8d05ee8-3206-a028-4275-d21ed7acc42f@suse.com>
 <dcea3d15-ab93-2282-7cbf-02b5dac23aa2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5de52a7f-61ba-af26-17c7-ca9107218794@suse.com>
Date: Thu, 29 Aug 2019 17:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dcea3d15-ab93-2282-7cbf-02b5dac23aa2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] x86: a little bit of 16-bit video mode
 setting code cleanup
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
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxNjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wOC8yMDE5
IDE1OjIzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjkuMDguMjAxOSAxNjowOCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDE0LzA2LzIwMTkgMTI6MzgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEBAIC0zOCw5ICszOCw5IEBAIEVOVFJZKHdha2V1cF9zdGFydCkKPj4+PiAgICAgICAg
ICBtb3Z3ICAgICVheCwgJXNzICAgICAgICAjIE5lZWQgdGhpcz8gSG93IHRvIHJldCBpZiBjbG9i
YmVyZWQ/Cj4+Pj4gIAo+Pj4+ICAxOiAgICAgICMgZm9yIGFjcGlfc2xlZXA9czNfbW9kZQo+Pj4+
IC0gICAgICAgIHRlc3RsICAgJDIsIHdha2VzeW0odmlkZW9fZmxhZ3MpCj4+Pj4gKyAgICAgICAg
dGVzdGIgICAkMiwgd2FrZXN5bSh2aWRlb19mbGFncykKPj4+PiAgICAgICAgICBqeiAgICAgIDFm
Cj4+Pj4gLSAgICAgICAgbW92bCAgICB3YWtlc3ltKHZpZGVvX21vZGUpLCAlZWF4Cj4+Pj4gKyAg
ICAgICAgbW92dyAgICB3YWtlc3ltKHZpZGVvX21vZGUpLCAlYXgKPj4+IFNpbWlsYXJseSwgdmlk
ZW9fbW9kZSBjYW4gYmVjb21lIC53b3JkLCBJIHRoaW5rLgo+PiBCdXQgYSB3b3JkIGlzIGxlc3Mg
ZWZmaWNpZW50IHRvIGFjY2VzcyAoYmVjYXVzZSBvZiB0aGUgb3BlcmFuZCBzaXplCj4+IG92ZXJy
aWRlKSwgc28gSSdkIHByZWZlciB0byBub3Qgc2hyaW5rIHRoaXMgb25lLiBKdXN0IGxldCBtZSBr
bm93Cj4+IHdoZXRoZXIgeW91IGFncmVlLCBhbmQgSSdsbCBjb29rIHVwIGEgcGF0Y2ggYWNjb3Jk
aW5nbHkuCj4gCj4gVGhpcyBpcyAxNiBiaXQgY29kZSBzbyBpdCBpcyBtb3ZsIHdoaWNoIGhhcyB0
aGUgb3BlcmFuZCBzaXplIHByZWZpeCwgbm90Cj4gbW92dy4KPiAKPiBJdCBpcyBleHRlcm4nZCBp
biBDLCBidXQgbm90IHdyYXBwZWQgaW4gYm9vdHN5bSgpLCBhbmQgSSBjYW4ndCBzZWUgaXQKPiBi
ZWluZyByZWFkIGFueXdoZXJlLgoKT2gsIGluZGVlZC4gSSdsbCBkaXRjaCB0aGUgZXh0ZXJuIHRo
ZW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
