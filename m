Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B2127EF6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 16:04:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJmr-0002PV-Dz; Fri, 20 Dec 2019 15:01:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJmq-0002PQ-3w
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 15:01:52 +0000
X-Inumbo-ID: a10e1568-2339-11ea-9379-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a10e1568-2339-11ea-9379-12813bfff9fa;
 Fri, 20 Dec 2019 15:01:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89132B286;
 Fri, 20 Dec 2019 15:01:42 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <8b611419-a0c7-743f-fec4-f02a04caf114@suse.com>
 <17723247-f12e-5a43-836b-6aff95a93ab1@citrix.com>
 <ab5cd434-0c9a-ca6e-f615-eea57ae40853@suse.com>
 <3b3cb270-7dfe-2f7b-bafc-48a30db12d55@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67acfb06-c095-9e8e-89f2-51cb16baabdd@suse.com>
Date: Fri, 20 Dec 2019 16:02:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3b3cb270-7dfe-2f7b-bafc-48a30db12d55@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/EPT: adjustments for redundant function
 arguments
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNTo1OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi8yMC8xOSAy
OjQxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjAuMTIuMjAxOSAxNToyNiwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDEyLzIwLzE5IDI6MjEgUE0sIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEluIGVwdF9wMm1fdHlwZV90b19mbGFncygpIHBhc3NpbmcgaW4gdHlwZSBhbmQgYWNj
ZXNzIGFzIHNlcGFyYXRlCj4+Pj4gcGFyYW1ldGVycyBjYW4gYmUgY29uc2lkZXJlZCBhbiBvcHRp
bWl6YXRpb24sIGFzIGFsbCBjYWxsZXJzIHNldCB0aGUKPj4+PiByZXNwZWN0aXZlIGZpZWxkcyBp
biB0aGUgZW50cnkgYmVpbmcgdXBkYXRlZCBiZWZvcmUgdGhlIGNhbGwuIFJldGFpbgo+Pj4+IHRo
aXMgYmVoYXZpb3IgYnV0IGFkZCBhc3NlcnRpb25zLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4KPj4+IEluIHdoYXQgd2F5IGlzIGl0
IGFuIG9wdGltaXphdGlvbj8KPj4KPj4gVGhlcmUncyBubyBwb2ludGVyIGRlLXJlZiBuZWVkZWQ7
IHRoZSB2YWx1ZXMgd2lsbCBhbHJlYWR5IGNvbWUgaW4KPj4gdmlhIHJlZ2lzdGVycy4gQW5kICJj
YW4gYmUgY29uc2lkZXJlZCIgYmVjYXVzZSBwb3NzaWJseSBzb21lCj4+IGNvbXBpbGVycyBhcmUg
c21hcnQgZW5vdWdoIHRvIGVsaW1pbmF0ZSB0aGUgcG9pbnRlciBkZS1yZWYgYWdhaW4KPj4gKGJ1
dCB0aGVuIGl0J2xsIHN0aWxsIGJlIGEgYml0ZmllbGQgZXh0cmFjdCwgd2hpY2ggY2FsbGVycyBt
YXkKPj4gYmUgYWJsZSB0byBhdm9pZCkuCj4gCj4gUmlnaHQ7IG9uIHRoZSB3aG9sZSBJJ2QgcmF0
aGVyIGxldCBjb21waWxlcnMgZG8gdGhpcyBzb3J0IG9mCj4gbWljcm8tb3B0aW1pemF0aW9uLCBh
bmQgb25seSBkbyB0aGlzICJtYW51YWwiIHNvcnQgb2Ygb3B0aW1pemF0aW9uIHdpdGgKPiBzb21l
IHNvcnQgb2YgYmVuY2htYXJrcyBzaG93aW5nIHRoYXQgaXMgaGFzIHNvbWUga2luZCBvZiBlZmZl
Y3QuCj4gCj4+Cj4+PiBJIGRvbid0IG5lY2Vzc2FyaWx5IG9wcG9zZSB0aGlzLCBidXQgZ2l2ZW4g
dGhhdCAzIG9mIHRoZSA0IGNhbGxlcnMKPj4+IGxpdGVyYWxseSBkbyBzb21ldGhpbmcgbGlrZToK
Pj4+Cj4+PiAgICAgZXB0X3AybV90eXBlX3RvX2ZsYWdzKHAybSwgJmUsIGUuc2FfcDJtdCwgZS5h
Y2Nlc3MpOwo+Pj4KPj4+IEl0IHNlZW1zIGxpa2UganVzdCBnZXR0aW5nIHJpZCBvZiB0aGUgZXh0
cmFuZW91cyBhcmd1bWVudHMgbWlnaHQgYSBiZQo+Pj4gYmV0dGVyIG9wdGlvbi4KPj4KPj4gVGhh
dCB3YXMgbXkgb3JpZ2luYWwgaW50ZW50aW9uIGFzIHdlbGwsIGJ1dCBpaXJjIEFuZHJldyBkaWRu
J3QgbGlrZQo+PiBpdCB3aGVuIHdlIGRpc2N1c3NlZCBpdCBiYWNrIHRoZW4gKHRoZSBjb250ZXh0
IGhlcmUgYmVpbmcgWFNBLTMwNCkuCj4gCj4gSSBkaWQgYSBxdWljayBza2ltIHRocm91Z2ggdGhv
c2UgdGhyZWFkcyBhbmQgY291bGRuJ3QgZmluZCBhbnkgY29tbWVudAo+IG9uIHRoaXMgaXNzdWUu
ICBDb3VsZCB5b3UgcG9pbnQgbWUgdG8gdGhlIG1haWwgd2l0aCBpdD8gIChPciBBbmR5LCB3b3Vs
ZAo+IHlvdSBjYXJlIHRvIHJlcGVhdCB5b3VyIGFyZ3VtZW50PykKCkkgZ3Vlc3MgaXQgbWF5IGhh
dmUgYmVlbiBhbiBpcmMgZGlzY3Vzc2lvbiwgcXVpdGUgcG9zc2libHkgZXZlbgphIHByaXZhdGUg
b25lIGJldHdlZW4gaGltIGFuZCBtZS4KCj4gVWx0aW1hdGVseSB0aGUgcGF0Y2ggYXMgaXQgc3Rh
bmRzIGlzIG9ubHkgbWFraW5nIHRoZSBleGlzdGluZyBjb2RlCj4gc2FmZXIsIHNvIEknbSBPSyB3
aXRoIGdpdmluZyBpdCBteSBBY2sgaWYgeW91IGRvbid0IHdhbnQgdG8gcHVyc3VlIHRoZQo+IG90
aGVyIG9wdGlvbjsgYnV0IEknZCBwcmVmZXIgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgYW5kIHBvdGVu
dGlhbGx5Cj4gaW1wcm92ZSB0aGluZ3Mgd2hpbGUgd2UncmUgYXQgaXQuICAoQW5kIGlmIHRoZXJl
ICppcyogYSBnb29kIHJlYXNvbiBmb3IKPiBwYXNzaW5nIGluIHBhcmFsbGVsIHBhcmFtZXRlcnMs
IGl0IHdvdWxkIGJlIGdvb2QgdG8gcmVjb3JkIGl0IGluIGEKPiBjb21tZW50IHNvIHdlIGRvbid0
IGhhdmUgdGhpcyBjb252ZXJzYXRpb24gYWdhaW4gaW4gMyB5ZWFycycgdGltZS4pCgpJJ2QgYmUg
aGFwcHkgdG8gZ28gdGhlIG90aGVyIHJvdXRlIC0gYXMgc2FpZCwgdGhhdCdzIHdoYXQgSSBoYWQK
aW5pdGlhbGx5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
