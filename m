Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76CA81EA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 14:11:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5U6Q-0002Fy-UY; Wed, 04 Sep 2019 12:09:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5U6O-0002Fh-KY
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 12:09:32 +0000
X-Inumbo-ID: d9f3a84a-cf0c-11e9-abb0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9f3a84a-cf0c-11e9-abb0-12813bfff9fa;
 Wed, 04 Sep 2019 12:09:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 15384B66A;
 Wed,  4 Sep 2019 12:09:31 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <52fe7f67-ffd0-2d22-90fb-f3462ea059cd@suse.com>
 <d5dd94c2-070e-b3ff-57cf-92893b3cca7b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2bcdab9-7bf5-9266-eadf-5c5ab4de7105@suse.com>
Date: Wed, 4 Sep 2019 14:09:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d5dd94c2-070e-b3ff-57cf-92893b3cca7b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMzozNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDQvMDkvMjAx
OSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjA5LjIwMTkgMDI6MjAsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gSWYgTUNGRyBhcmVhIGlzIG5vdCByZXNlcnZlZCBpbiBFODIw
LCBYZW4gYnkgZGVmYXVsdCB3aWxsIGRlZmVyIGl0cyB1c2FnZQo+Pj4gdW50aWwgRG9tMCByZWdp
c3RlcnMgaXQgZXhwbGljaXRseSBhZnRlciBBQ1BJIHBhcnNlciByZWNvZ25pemVzIGl0IGFzCj4+
PiBhIHJlc2VydmVkIHJlc291cmNlIGluIERTRFQuIEhhdmluZyBpdCByZXNlcnZlZCBpbiBFODIw
IGlzIG5vdAo+Pj4gbWFuZGF0b3J5IGFjY29yZGluZyB0byAiUENJIEZpcm13YXJlIFNwZWNpZmlj
YXRpb24sIHJldiAzLjIiIChwYXIuIDQuMS4yKQo+Pj4gYW5kIGZpcm13YXJlIGlzIGZyZWUgdG8g
a2VlcCBhIGhvbGUgRTgyMCBpbiB0aGF0IHBsYWNlLiBYZW4gZG9lc24ndCBrbm93Cj4+PiB3aGF0
IGV4YWN0bHkgaXMgaW5zaWRlIHRoaXMgaG9sZSBzaW5jZSBpdCBsYWNrcyBmdWxsIEFDUEkgdmll
dyBvZiB0aGUKPj4+IHBsYXRmb3JtIHRoZXJlZm9yZSBpdCdzIHBvdGVudGlhbGx5IGhhcm1mdWwg
dG8gYWNjZXNzIE1DRkcgcmVnaW9uCj4+PiB3aXRob3V0IGFkZGl0aW9uYWwgY2hlY2tzIGFzIHNv
bWUgbWFjaGluZXMgYXJlIGtub3duIHRvIHByb3ZpZGUKPj4+IGluY29uc2lzdGVudCBpbmZvcm1h
dGlvbiBvbiB0aGUgc2l6ZSBvZiB0aGUgcmVnaW9uLgo+Pgo+PiBJcnJlc3BlY3RpdmUgb2YgdGhp
cyBiZWluZyBhIGdvb2QgY2hhbmdlLCBJJ3ZlIGhhZCBhbm90aGVyIHRob3VnaHQKPj4gd2hpbGUg
cmVhZGluZyB0aGlzIHBhcmFncmFwaCwgZm9yIGEgaHlwZXJ2aXNvciBzaWRlIGNvbnRyb2w6IExp
bnV4Cj4+IGhhcyBhICJtZW1vcHQ9IiBjb21tYW5kIGxpbmUgb3B0aW9uIGFsbG93aW5nIGZpbmUg
Z3JhaW5lZCBjb250cm9sCj4+IG92ZXIgdGhlIEU4MjAgbWFwLiBXZSBjb3VsZCBoYXZlIHNvbWV0
aGluZyBzaW1pbGFyIHRvIGFsbG93Cj4+IGluc2VydGluZyBhbiBFODIwX1JFU0VSVkVEIHJlZ2lv
biBpbnRvIGEgaG9sZSAoaXQgd291bGQgYmUgdGhlCj4+IHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBh
ZG1pbiB0byBndWFyYW50ZWUgbm8gb3RoZXIgY29uZmxpY3RzLCBpLmUuCj4+IGl0IHNob3VsZCBn
ZW5lcmFsbHkgYmUgdXNlZCBvbmx5IGlmIGUuZy4gdGhlIE1DRkcgaXMgaW5kZWVkIGtub3duCj4+
IHRvIGxpdmUgYXQgdGhlIHNwZWNpZmllZCBwbGFjZSwgYW5kIGJlaW5nIHByb3Blcmx5IHJlcHJl
c2VudGVkIGluCj4+IHRoZSBBQ1BJIHRhYmxlcykuIFRob3VnaHRzPwo+IAo+IFdoYXQgb3RoZXIg
dXNlIGNhc2VzIGNhbiB5b3UgdGhpbmsgb2YgaW4gY2FzZSB3ZSdkIGhhdmUgdGhpcyBvcHRpb24/
Cj4gRnJvbSB0aGUgdG9wIG9mIG15IGhlYWQsIGl0IG1pZ2h0IGJlIHByb3ZpZGluZyBhIG1lbW1h
cCBmb3IgYSBzZWNvbmQgWGVuCj4gYWZ0ZXIgZG9pbmcga2V4ZWMgZnJvbSBYZW4gdG8gWGVuLgo+
IAo+IFdoYXQgYmVuZWZpdHMgZG8geW91IHRoaW5rIGl0IG1pZ2h0IGhhdmUgb3ZlciBqdXN0IGFj
Y2VwdGluZyBhIGhvbGUKPiB1c2luZyAibWNmZz1yZWxheGVkIiBvcHRpb24gZnJvbSBhZG1pbiBw
ZXJzcGVjdGl2ZT8KCkl0IHdvdWxkbid0IGJlIE1DRkctc3BlY2lmaWMsIGkuZS4gaXQgY291bGQg
YWxzbyBiZSB1c2VkIHRvIGUuZy4KY29udmVydCBob2xlcyB0byBFODIwX1JFU0VSVkVEIHRvIHNp
bGVuY2UgVlQtZCdzIHJlc3BlY3RpdmUgUk1SUgp3YXJuaW5nLiBQbHVzIGJ5IGluc2VydGluZyB0
aGUgZW50cnkgaW50byBvdXIgb3duIEU4MjAgd2UnZCBhbHNvCnByb3BhZ2F0ZSBpdCB0byB1c2Vy
cyBvZiBYRU5NRU1fbWFjaGluZV9tZW1vcnlfbWFwLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
