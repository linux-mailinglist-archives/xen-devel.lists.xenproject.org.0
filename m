Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629816616E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:52:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4o5o-00042Q-1q; Thu, 20 Feb 2020 15:50:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4o5n-00042L-76
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:50:23 +0000
X-Inumbo-ID: b3c4a55e-53f8-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3c4a55e-53f8-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 15:50:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DF2AAC23;
 Thu, 20 Feb 2020 15:50:21 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
 <20200220151734.GM4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f82c3cb-862d-87bd-7a01-4812be98eedd@suse.com>
Date: Thu, 20 Feb 2020 16:50:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220151734.GM4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxNjoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAyMCwgMjAyMCBhdCAwNDowMjo1NVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjAuMDIuMjAyMCAxNToxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgRmVi
IDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEFu
b3RoZXIgb3B0aW9uIGlzIHRvIHVzZSB0aGUgcmVjdXJzZV9jcHUgZmllbGQgb2YgdGhlCj4+Pj4g
YXNzb2NpYXRlZCBzcGluIGxvY2s6IFRoZSBmaWVsZCBpcyB1c2VkIGZvciByZWN1cnNpdmUgbG9j
a3MKPj4+PiBvbmx5LCBhbmQgaGVuY2UgdGhlIG9ubHkgY29uZmxpY3Qgd291bGQgYmUgd2l0aAo+
Pj4+IF9zcGluX2lzX2xvY2tlZCgpLCB3aGljaCB3ZSBkb24ndCAoYW5kIGluIHRoZSBmdXR1cmUg
dGhlbgo+Pj4+IGFsc28gc2hvdWxkbid0KSB1c2Ugb24gdGhpcyBsb2NrLgo+Pj4KPj4+IEkgbG9v
a2VkIGludG8gdGhhdCBhbHNvLCBidXQgdGhpbmdzIGdldCBtb3JlIGNvbXBsaWNhdGVkIEFGQUlD
VCwgYXMgaXQncwo+Pj4gbm90IHBvc3NpYmxlIHRvIGF0b21pY2FsbHkgZmV0Y2ggdGhlIHN0YXRl
IG9mIHRoZSBsb2NrIGFuZCB0aGUgb3duZXIKPj4+IENQVSBhdCB0aGUgc2FtZSB0aW1lLiBOZWl0
aGVyIHlvdSBjb3VsZCBzZXQgdGhlIExPQ0tFRCBiaXQgYW5kIHRoZSBDUFUKPj4+IGF0IHRoZSBz
YW1lIHRpbWUuCj4+Cj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBhdG9taWNhbGx5IGZldGNoIGJvdGgg
YWZhaWNzOiBUaGUgZmllbGQgaXMKPj4gdmFsaWQgb25seSBpZiB0aGUgTE9DS0VEIGJpdCBpcyBz
ZXQuIEFuZCB3aGVuIHJlYWRpbmcgdGhlCj4+IGZpZWxkIHlvdSBvbmx5IGNhcmUgYWJvdXQgdGhl
IHZhbHVlIGJlaW5nIGVxdWFsIHRvCj4+IHNtcF9wcm9jZXNzb3JfaWQoKSwgaS5lLiBpdCBpcyBm
aW5lIHRvIHNldCBMT0NLRUQgYmVmb3JlCj4+IHVwZGF0aW5nIHRoZSBDUFUgZmllbGQgb24gbG9j
aywgYW5kIHRvIHJlc2V0IHRoZSBDUFUgZmllbGQgdG8KPj4gU1BJTkxPQ0tfTk9fQ1BVIChvciB3
aGF0ZXZlciBpdCdzIGNhbGxlZCkgYmVmb3JlIGNsZWFyaW5nCj4+IExPQ0tFRC4KPiAKPiBZZXMg
dGhhdCB3b3VsZCByZXF1aXJlIHRoZSB1c2FnZSBvZiBhIHNlbnRpbmVsIHZhbHVlIGFzIDAgd291
bGQgYmUgYQo+IHZhbGlkIHByb2Nlc3NvciBJRC4KPiAKPiBJIHdvdWxkIHRyeSB0byByZWZyYWlu
IGZyb20gKGFidSlzaW5nIGludGVybmFsIHNwaW5sb2NrIGZpZWxkcywgYXMgSQo+IHRoaW5rIHdl
IGNhbiBzb2x2ZSB0aGlzIGp1c3QgYnkgdXNpbmcgdGhlIGNudHMgZmllbGQgb24gdGhlIGN1cnJl
bnQKPiByd2xvY2sgaW1wbGVtZW50YXRpb24uCj4gCj4gV2hhdCBpc3N1ZSBkbyB5b3UgaGF2ZSBp
biBtaW5kIHRoYXQgd291bGQgcHJldmVudCBzdG9yaW5nIHRoZSBDUFUKPiB3cml0ZSBsb2NrZWQg
aW4gdGhlIGNudHMgZmllbGQ/CgpUaGUgcmVkdWN0aW9uIG9mIHRoZSBudW1iZXIgb2YgYml0cyB1
c2VkIGZvciBvdGhlciBwdXJwb3Nlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
