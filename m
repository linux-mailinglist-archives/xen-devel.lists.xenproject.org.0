Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18218358E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:55:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCQ7T-00083K-9G; Thu, 12 Mar 2020 15:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCQ7S-00083F-3b
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:51:34 +0000
X-Inumbo-ID: 585edc70-6479-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 585edc70-6479-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 15:51:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C357ADE8;
 Thu, 12 Mar 2020 15:51:32 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <03f34120-8420-a526-1b03-03601c169be1@suse.com>
Date: Thu, 12 Mar 2020 16:51:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158402056376.753.7091379488590272336.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/2] xen: credit2: fix vcpu starvation due
 to too few credits
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
Cc: Charles Arnold <carnold@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMTQ6NDQsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IEhlbGxvIGV2ZXJ5b25l
LAo+IAo+IFRoZXJlIGhhdmUgYmVlbiByZXBvcnRzIG9mIGEgQ3JlZGl0MiBpc3N1ZSBkdWUgdG8g
d2hpY2ggdkNQVXMgd2hlcmUKPiBiZWluZyBzdGFydmVkLCB0byB0aGUgcG9pbnQgdGhhdCBndWVz
dCBrZXJuZWwgd291bGQgY29tcGxhaW4gb3IgZXZlbgo+IGNyYXNoLgo+IAo+IFNlZSB0aGUgZm9s
bG93aW5nIHhlbi11c2VycyBhbmQgeGVuLWRldmVsIHRocmVhZHM6Cj4gaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi11c2Vycy8yMDIwLTAyL21zZzAwMDE4Lmh0
bWwKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLXVzZXJz
LzIwMjAtMDIvbXNnMDAwMTUuaHRtbAo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMi9tc2cwMTE1OC5odG1sCj4gCj4gSSBkaWQgc29t
ZSBpbnZlc3RpZ2F0aW9ucywgYW5kIGZpZ3VyZWQgb3V0IHRoYXQgdGhlIHZDUFVzIGluIHF1ZXN0
aW9uCj4gYXJlIG5vdCBzY2hlZHVsZWQgZm9yIGxvbmcgdGltZSBpbnRlcnZhbHMgYmVjYXVzZSB0
aGV5IHNvbWVob3cgbWFuYWdlIHRvCj4gYmUgZ2l2ZW4gYW4gYW1vdW50IG9mIGNyZWRpdHMgd2hp
Y2ggaXMgbGVzcyB0aGFuIHRoZSBjcmVkaXQgdGhlIGlkbGUKPiB2Q1BVIGhhcy4KPiAKPiBBbiBl
eGFtcGxlIG9mIHRoaXMgc2l0dWF0aW9uIGlzIHNob3duIGhlcmUuIEluIGZhY3QsIHdlIGNhbiBz
ZWUgZDB2MQo+IHNpdHRpbmcgaW4gdGhlIHJ1bnF1ZXVlIHdoaWxlIGFsbCB0aGUgQ1BVcyBhcmUg
aWRsZSwgYXMgaXQgaGFzCj4gLTEyNTQyMzgyNzAgY3JlZGl0cywgd2hpY2ggaXMgc21hbGxlciB0
aGFuIC0yXjMwID0g4oiSMTA3Mzc0MTgyNDoKPiAKPiAgICAgIChYRU4pIFJ1bnF1ZXVlIDA6Cj4g
ICAgICAoWEVOKSAgIG5jcHVzICAgICAgICAgICAgICA9IDI4Cj4gICAgICAoWEVOKSAgIGNwdXMg
ICAgICAgICAgICAgICA9IDAtMjcKPiAgICAgIChYRU4pICAgbWF4X3dlaWdodCAgICAgICAgID0g
MjU2Cj4gICAgICAoWEVOKSAgIHBpY2tfYmlhcyAgICAgICAgICA9IDIyCj4gICAgICAoWEVOKSAg
IGluc3Rsb2FkICAgICAgICAgICA9IDEKPiAgICAgIChYRU4pICAgYXZlbG9hZCAgICAgICAgICAg
ID0gMjkzMzkxICh+MTExJSkKPiAgICAgIChYRU4pICAgaWRsZXJzOiAwMCwwMDAwMDAwMCwwMDAw
MDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwZmZmZmZmZgo+ICAgICAgKFhFTikgICB0
aWNrbGVkOiAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCww
MDAwMDAwMAo+ICAgICAgKFhFTikgICBmdWxseSBpZGxlIGNvcmVzOiAwMCwwMDAwMDAwMCwwMDAw
MDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwZmZmZmZmZgo+ICAgICAgWy4uLl0KPiAg
ICAgIChYRU4pIFJ1bnF1ZXVlIDA6Cj4gICAgICAoWEVOKSBDUFVbMDBdIHJ1bnE9MCwgc2libGlu
Zz0wMCwuLi4sIGNvcmU9MDAsLi4uCj4gICAgICAoWEVOKSBDUFVbMDFdIHJ1bnE9MCwgc2libGlu
Zz0wMCwuLi4sIGNvcmU9MDAsLi4uCj4gICAgICBbLi4uXQo+ICAgICAgKFhFTikgQ1BVWzI2XSBy
dW5xPTAsIHNpYmxpbmc9MDAsLi4uLCBjb3JlPTAwLC4uLgo+ICAgICAgKFhFTikgQ1BVWzI3XSBy
dW5xPTAsIHNpYmxpbmc9MDAsLi4uLCBjb3JlPTAwLC4uLgo+ICAgICAgKFhFTikgUlVOUToKPiAg
ICAgIChYRU4pICAgICAwOiBbMC4xXSBmbGFncz0wIGNwdT01IGNyZWRpdD0tMTI1NDIzODI3MCBb
dz0yNTZdIGxvYWQ9MjYyMTQ0ICh+MTAwJSkKPiAKPiBUaGlzIGhhcHBlbnMgYmFjYXVzZSAtLWFs
dGhvdWdoIHZlcnkgcmFyZWx5LS0gdkNQVXMgYXJlIGFsbG93ZWQgdG8KPiBleGVjdXRlIGZvciBt
dWNoIG1vcmUgdGhhbiB0aGUgc2NoZWR1bGVyIHdvdWxkIHdhbnQgdGhlbSB0by4KPiAKPiBGb3Ig
ZXhhbXBsZSwgSSBoYXZlIGEgdHJhY2Ugc2hvd2luZyB0aGF0IGNzY2hlZDJfc2NoZWR1bGUoKSBp
cyBpbnZva2VkIGF0Cj4gdD01Nzk3MDc0NjE1NW5zLiBBdCB0PTU3OTcwNzQ3NjU4bnMgKCsxNTAz
bnMpIHRoZSBzX3RpbWVyIGlzIHNldCB0bwo+IGZpcmUgYXQgdD01Nzk3OTQ4NTA4M25zLCBpLmUu
LCA4NzM4OTI4bnMgaW4gZnV0dXJlLiBUaGF0J3MgYmVjYXVzZSBjcmVkaXQKPiBvZiBzbmV4dCBp
cyBleGFjdGx5IHRoYXQgODczODkyOG5zLiBUaGVuLCB3aGF0IEkgc2VlIGlzIHRoYXQgdGhlIG5l
eHQKPiBjYWxsIHRvIGJ1cm5fY3JlZGl0cygpLCBjb21pbmcgZnJvbSBjc2NoZWQyX3NjaGVkdWxl
KCkgZm9yIHRoZSBzYW1lIHZDUFUKPiBoYXBwZW5zIGF0IHQ9NjAwODMyODM2MTducy4gVGhhdCBp
cyAqYSBsb3QqICgyMTAzNzk4NTM0bnMpIGxhdGVyIHRoYW4KPiB3aGVuIHdlIGV4cGVjdGVkIGFu
ZCBhc2tlZC4gT2YgY291cnNlLCB0aGF0IGFsc28gbWVhbnMgdGhhdCBkZWx0YSBpcwo+IDIxMTI1
Mzc0NjJucywgYW5kIHRoZXJlZm9yZSBjcmVkaXRzIHdpbGwgc2luayB0byAtMjEwMzc5ODUzNCEK
CkN1cnJlbnQgaWRlYXMgYXJlOgoKLSBDb3VsZCBpdCBiZSB0aGUgdmNwdSBpcyBidXN5IGZvciB2
ZXJ5IGxvbmcgdGltZSBpbiB0aGUgaHlwZXJ2aXNvcj8KICAgU28gZWl0aGVyIGZpZ2h0aW5nIHdp
dGggYW5vdGhlciB2Y3B1IGZvciBhIGxvY2ssIGRvaW5nIGEgbG9uZwogICBydW5uaW5nIGh5cGVy
Y2FsbCwgLi4uCgotIFRoZSB0aW1lciB1c2VkIGlzIG5vdCByZWxpYWJsZS4KCi0gVGhlIHRpbWUg
YmFzZSBpcyBub3QgcmVsaWFibGUgKHRzYyBvciB3aGF0ZXZlciBpcyB1c2VkIGZvciBnZXR0aW5n
CiAgIHRoZSB0aW1lIGhhcyBqdW1wZWQgMiBzZWNvbmRzIGludG8gdGhlIGZ1dHVyZSkuCgotIFN5
c3RlbSBtYW5hZ2VtZW50IG1vZGUgaGFzIGtpY2tlZCBpbi4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
