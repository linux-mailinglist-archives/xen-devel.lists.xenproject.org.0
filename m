Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F636CBDB7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 16:46:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGOo9-0006Y3-7d; Fri, 04 Oct 2019 14:43:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lyic=X5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iGOo7-0006Xy-DH
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 14:43:47 +0000
X-Inumbo-ID: 5dfcc3b4-e6b5-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dfcc3b4-e6b5-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 14:43:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B60EB1C7;
 Fri,  4 Oct 2019 14:43:44 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
Date: Fri, 4 Oct 2019 16:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMTkgMTY6MzQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvNC8xOSAzOjI0
IFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAwNC4xMC4xOSAxNjowOCwgR2VvcmdlIER1
bmxhcCB3cm90ZToKPj4+IE9uIDEwLzQvMTkgNzo0MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBzY2hlZF90aWNrX3N1c3BlbmQoKSBhbmQgc2NoZWRfdGlja19yZXN1bWUoKSBzaG91bGQg
bm90IGNhbGwgdGhlCj4+Pj4gc2NoZWR1bGVyIHNwZWNpZmljIHRpbWVyIGhhbmRsZXJzIGluIGNh
c2UgdGhlIGNwdSB0aGV5IGFyZSBydW5uaW5nIG9uCj4+Pj4gaXMganVzdCBiZWluZyBtb3ZlZCB0
byBvciBmcm9tIGEgY3B1cG9vbC4KPj4+Pgo+Pj4+IFVzZSBhIG5ldyBwZXJjcHUgbG9jayBmb3Ig
dGhhdCBwdXJwb3NlLgo+Pj4KPj4+IElzIHRoZXJlIGEgcmVhc29uIHdlIGNhbid0IHVzZSB0aGUg
cGNwdV9zY2hlZHVsZV9sb2NrKCkgaW5zdGVhZCBvZgo+Pj4gaW50cm9kdWNpbmcgYSBuZXcgb25l
P8KgIFNvcnJ5IGlmIHRoaXMgaXMgb2J2aW91cywgYnV0IGl0J3MgYmVlbiBhIHdoaWxlCj4+PiBz
aW5jZSBJIHBva2VkIGFyb3VuZCB0aGlzIGNvZGUuCj4+Cj4+IExvY2sgY29udGVudGlvbiB3b3Vs
ZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3aXRoIGNyZWRpdDIgd2hpY2ggaXMgdXNpbmcgYQo+PiBw
ZXItY29yZSBvciBldmVuIHBlci1zb2NrZXQgbG9jay4gV2UgZG9uJ3QgY2FyZSBhYm91dCBvdGhl
ciBzY2hlZHVsaW5nCj4+IGFjdGl2aXR5IGhlcmUsIGFsbCB3ZSBuZWVkIGlzIGEgZ3VhcmQgYWdh
aW5zdCBvdXIgcGVyLWNwdSBzY2hlZHVsZXIKPj4gZGF0YSBiZWluZyBjaGFuZ2VkIGJlbmVhdGgg
b3VyIGZlZXQuCj4gCj4gSXMgdGhpcyBjb2RlIHJlYWxseSBiZWluZyBjYWxsZWQgc28gb2Z0ZW4g
dGhhdCB3ZSBuZWVkIHRvIHdvcnJ5IGFib3V0Cj4gdGhpcyBsZXZlbCBvZiBjb250ZW50aW9uPwoK
SXRzIGNhbGxlZCBlYWNoIHRpbWUgaWRsZSBpcyBlbnRlcmVkIGFuZCBsZWZ0IGFnYWluLgoKRXNw
ZWNpYWxseSB3aXRoIGNvcmUgc2NoZWR1bGluZyB0aGVyZSBpcyBhIGhpZ2ggcHJvYmFiaWxpdHkg
b2YgbXVsdGlwbGUKY3B1cyBsZWF2aW5nIGlkbGUgYXQgdGhlIHNhbWUgdGltZSBhbmQgdGhlIHBl
ci1zY2hlZHVsZXIgbG9jayBiZWluZyB1c2VkCmluIHBhcmFsbGVsIGFscmVhZHkuCgo+IFdlIGFs
cmVhZHkgaGF2ZSBhICpsb3QqIG9mIGxvY2tzOyBhbmQgaW4gdGhpcyBjYXNlIHlvdSdyZSBhZGRp
bmcgYQo+IHNlY29uZCBsb2NrIHdoaWNoIGludGVyYWN0cyB3aXRoIHRoZSBwZXItc2NoZWR1bGVy
IGNwdSBsb2NrLiAgVGhpcyBqdXN0Cj4gc2VlbXMgbGlrZSBhc2tpbmcgZm9yIHRyb3VibGUuCgpJ
biB3aGljaCB3YXkgZG9lcyBpdCBpbnRlcmFjdCB3aXRoIHRoZSBwZXItc2NoZWR1bGVyIGNwdSBs
b2NrPwoKPiBJIHdvbid0IE5hY2sgdGhlIHBhdGNoLCBidXQgSSBkb24ndCB0aGluayBJIHdvdWxk
IGFjayBpdCB3aXRob3V0IGNsZWFyCj4gZXZpZGVuY2UgdGhhdCB0aGUgZXh0cmEgbG9jayBoYXMg
YSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCB0aGF0J3Mgd29ydGgKPiB0aGUgY29zdCBvZiB0aGUg
ZXh0cmEgY29tcGxleGl0eS4KCkkgdGhpbmsgY29tcGxleGl0eSBpcyBsb3dlciB0aGlzIHdheS4g
RXNwZWNpYWxseSBjb25zaWRlcmluZyB0aGUgcGVyLQpzY2hlZHVsZXIgbG9jayBjaGFuZ2luZyB3
aXRoIG1vdmluZyBhIGNwdSB0byBvciBmcm9tIGEgY3B1cG9vbC4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
