Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140AFC071D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:16:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDr0h-0003qK-G5; Fri, 27 Sep 2019 14:14:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDr0g-0003qD-Bn
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:14:14 +0000
X-Inumbo-ID: 14b23baa-e131-11e9-967a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 14b23baa-e131-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:14:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C25BAC69;
 Fri, 27 Sep 2019 14:14:12 +0000 (UTC)
To: hongyax@amazon.com
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
 <20190926142657.mc3y7i4ovz6hvua6@debian>
 <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
 <d9cc437b-add6-3a71-be44-c5d5b74b9d8f@suse.com>
 <6d410229-a7b9-22dc-3708-90d1ae9d728a@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8120a633-573f-d66c-2662-1b9d1124eecb@suse.com>
Date: Fri, 27 Sep 2019 16:14:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6d410229-a7b9-22dc-3708-90d1ae9d728a@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad RzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxNjowMiwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IE9uIDI3LzA5
LzIwMTkgMTQ6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyNy4wOS4yMDE5IDE0OjU0LCBo
b25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4+Cj4+IFByZS1wb3B1bGF0ZT8gVGhlcmUncyBzb21l
IGNvbmNlcHRpb25hbCBxdWVzdGlvbiB0aGVuOiBXaGVuIHRoZQo+PiBkaXJlY3QgbWFwIGlzIGdv
bmUsIGFyZSB5b3UgbWFwcGluZyBYZW4gaGVhcCBwYWdlcyBpbnRvIHRoZSBwbGFjZQo+PiB0aGV5
J2QgaGF2ZSBsaXZlZCBhdCBpbiB0aGUgZGlyZWN0IG1hcD8gSSdtIG5vdCBjb252aW5jZWQgdGhh
dCdzCj4+IHdoYXQgd2Ugd2FudC4gSW4gZmFjdCBJJ20gbm90IGNvbnZpbmNlZCB3ZSdkIHdhbnQg
dG8gcmV0YWluIHRoZQo+PiBkaXN0aW5jdGlvbiBiZXR3ZWVuIFhlbiBoZWFwIGFuZCBkb21haW4g
aGVhcCB0aGVuIGFueSBmdXJ0aGVyIC0KPj4gdGhlcmUncyBubyByZWFzb24gYW55bW9yZSBhdCB0
aGF0IHBvaW50IChhZmFpY3QpLgo+IAo+IFllcy4gTXkgcGF0Y2hlcyBtYXAgeGVuaGVhcCBwYWdl
cyB0byB3aGVyZSB0aGV5IHdvdWxkIGhhdmUgbGl2ZWQgb24gdGhlIGRpcmVjdCAKPiBtYXAgcmVn
aW9uLCBhbmQgdW5tYXAgd2hlbiB4ZW5oZWFwIHBhZ2VzIGFyZSBmcmVlZC4gVGhlIG9yaWdpbmFs
IHByb3Bvc2FsIHdhcyAKPiB0byB1c2Ugdm1hcCgpIHdoaWNoIHdlIGZpbmQgZGlmZmljdWx0IHRv
IGltcGxlbWVudC4KPiAKPiAtIHZtYXAgdGFrZXMgYW4gYXJyYXkgb2YgbWZucy4gTWFwcGluZyBh
IGxhcmdlIHJlZ2lvbiByZXF1aXJlIAo+IGFsbG9jYXRpbmcvZnJlZWluZyBtZW1vcnkgZm9yIGEg
bGFyZ2UgYXJyYXkgb2YgbWZucywgdW5sZXNzIHdlIGNoYW5nZSBvciBhZGQgCj4gYW5vdGhlciB2
bWFwIHZhcmlhbnQuCj4gLSB2YTwtPnBhIGNvbnZlcnNpb24uIE1hcHBpbmcgeGVuaGVhcCB0byBk
aXJlY3QgbWFwIHJlZ2lvbiBtYWtlcyBhbGwgdGhlIAo+IHhlbmhlYXAgY29udmVyc2lvbiBtYWNy
b3Mgc3RpbGwgd29yay4gVGhlIHZtYXAgcHJvcG9zYWwgbmVlZHMgdG8gYWRkIGFub3RoZXIgCj4g
ZmllbGQgaW4gcGFnZV9pbmZvIChicmVha2luZyB0aGUgcG93ZXIgb2YgMikgb3IgdG8gaGF2ZSBh
IHNlcGFyYXRlIHN0cnVjdHVyZSAKPiBzb21ld2hlcmUgZWxzZSBmb3IgdmEvcGEgY29udmVyc2lv
bi4KCkJ1dCB0aGVuIHdoeSBkbyB0aGUgaW5pdGlhbCBzbyBtYW55IHBhdGNoZXMgKGluaGVyaXRl
ZCBmcm9tIFdlaSkKY29udmVydCBmcm9tIGRvbWhlYXAgdG8geGVuaGVhcCBhbGxvY2F0aW9ucyBh
dCBhbGw/IElmIHlvdXIKYXBwcm9hY2ggaXMgdG8gYmUgYXQgbGVhc3QgYW4gaW50ZXJtZWRpYXRl
IGdvYWwsIHRoZW4gSSB0aGluayB0aGUKb3JkZXIgb2YgY2hhbmdlcyBzaG91bGQgYmUgc3VjaCB0
aGF0IG9uLWRlbWFuZCBtYXBwaW5nIG9mIHhlbmhlYXAKcGFnZXMgb2NjdXJzIGZpcnN0LCBhbmQg
dGhlbiB0aGUgeGVuaGVhcCAtPiBkb21oZWFwIGNvbnZlcnNpb24KY2FuIGhhcHBlbiBpbiBiYXNp
Y2FsbHkgYXJiaXRyYXJpbHkgc21hbGwgc3RlcHMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
