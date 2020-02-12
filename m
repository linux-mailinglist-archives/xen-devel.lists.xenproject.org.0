Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439915A54F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 10:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1obY-0003pY-Cr; Wed, 12 Feb 2020 09:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JFaq=4A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1obW-0003pS-FH
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 09:46:46 +0000
X-Inumbo-ID: 946b9f6e-4d7c-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 946b9f6e-4d7c-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 09:46:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C75AAB3D;
 Wed, 12 Feb 2020 09:46:44 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200211093122.5644-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bdccae10-21bc-bb19-b650-f3b97fb58a5a@suse.com>
Date: Wed, 12 Feb 2020 10:46:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211093122.5644-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxMDozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbmUgb2YgdGhlIG1h
aW4gZGVzaWduIGdvYWxzIG9mIGNvcmUgc2NoZWR1bGluZyBpcyB0byBhdm9pZCBhY3Rpb25zCj4g
d2hpY2ggYXJlIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvIHRoZSBkb21haW4gY3VycmVudGx5IHJ1
bm5pbmcgb24gYQo+IGdpdmVuIGNwdSBvciBjb3JlLiBMaXZlIHBhdGNoaW5nIGlzIG9uZSBvZiB0
aG9zZSBhY3Rpb25zIHdoaWNoIGFyZQo+IGFsbG93ZWQgdGFraW5nIHBsYWNlIG9uIGEgY3B1IG9u
bHkgd2hlbiB0aGUgaWRsZSBzY2hlZHVsaW5nIHVuaXQgaXMKPiBhY3RpdmUgb24gdGhhdCBjcHUu
Cj4gCj4gVW5mb3J0dW5hdGVseSBsaXZlIHBhdGNoaW5nIHRyaWVzIHRvIGZvcmNlIHRoZSBjcHVz
IGludG8gdGhlIGlkbGUgbG9vcAo+IGp1c3QgYnkgcmFpc2luZyB0aGUgc2NoZWR1bGUgc29mdGly
cSwgd2hpY2ggd2lsbCBubyBsb25nZXIgYmUKPiBndWFyYW50ZWVkIHRvIHdvcmsgd2l0aCBjb3Jl
IHNjaGVkdWxpbmcgYWN0aXZlLiBBZGRpdGlvbmFsbHkgdGhlcmUgYXJlCj4gc3RpbGwgc29tZSBw
bGFjZXMgaW4gdGhlIGh5cGVydmlzb3IgY2FsbGluZyBjaGVja19mb3JfbGl2ZXBhdGNoX3dvcmso
KQo+IHdpdGhvdXQgYmVpbmcgaW4gdGhlIGlkbGUgbG9vcC4KPiAKPiBJdCBpcyBlYXN5IHRvIGZv
cmNlIGEgY3B1IGludG8gdGhlIG1haW4gaWRsZSBsb29wIGJ5IHNjaGVkdWxpbmcgYQo+IHRhc2ts
ZXQgb24gaXQuIFNvIHN3aXRjaCBsaXZlIHBhdGNoaW5nIHRvIHVzZSB0YXNrbGV0cyBmb3Igc3dp
dGNoaW5nIHRvCj4gaWRsZSBhbmQgcmFpc2luZyBzY2hlZHVsaW5nIGV2ZW50cy4gQWRkaXRpb25h
bGx5IHRoZSBjYWxscyBvZgo+IGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yaygpIG91dHNpZGUgdGhl
IG1haW4gaWRsZSBsb29wIGNhbiBiZSBkcm9wcGVkLgo+IAo+IEFzIHRhc2tsZXRzIGFyZSBvbmx5
IHJ1bm5pbmcgb24gaWRsZSB2Y3B1cyBhbmQgc3RvcF9tYWNoaW5lX3J1bigpCj4gaXMgYWN0aXZh
dGluZyB0YXNrbGV0cyBvbiBhbGwgY3B1cyBidXQgdGhlIG9uZSBpdCBoYXMgYmVlbiBjYWxsZWQg
b24KPiB0byByZW5kZXp2b3VzLCBpdCBpcyBtYW5kYXRvcnkgZm9yIHN0b3BfbWFjaGluZV9ydW4o
KSB0byBiZSBjYWxsZWQgb24KPiBhbiBpZGxlIHZjcHUsIHRvbywgYXMgb3RoZXJ3aXNlIHRoZXJl
IGlzIG5vIHdheSBmb3Igc2NoZWR1bGluZyB0bwo+IGFjdGl2YXRlIHRoZSBpZGxlIHZjcHUgZm9y
IHRoZSB0YXNrbGV0IG9uIHRoZSBzaWJsaW5nIG9mIHRoZSBjcHUKPiBzdG9wX21hY2hpbmVfcnVu
KCkgaGFzIGJlZW4gY2FsbGVkIG9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCkFwcGxpY2FibGUgeDg2IGJpdHMKQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
