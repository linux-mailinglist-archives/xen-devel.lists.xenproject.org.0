Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F04A7EFE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:13:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5RKC-0001ya-Or; Wed, 04 Sep 2019 09:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5RKA-0001yV-Tk
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:11:34 +0000
X-Inumbo-ID: fd87b012-cef3-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd87b012-cef3-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 09:11:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A1F6AF62;
 Wed,  4 Sep 2019 09:11:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
 <eea8cf6b-ff96-765f-d9a4-2064a75979a3@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4c3acd1d-6b63-eaec-63ec-854f00541653@suse.com>
Date: Wed, 4 Sep 2019 11:11:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eea8cf6b-ff96-765f-d9a4-2064a75979a3@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTA6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDQvMDkvMjAxOSAw
OTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjA5LjIwMTkgMTA6MjUsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwMy4wOS4xOSAxNzowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDMuMDkuMjAxOSAxNzowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMDMu
MDkuMTkgMTY6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjkuMDguMjAxOSAxMjox
OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiBJbiBvcmRlciB0byBoYXZlIHVuaXF1ZSBu
YW1lcyB3aGVuIGRvaW5nIGxvY2sgcHJvZmlsaW5nIHNldmVyYWwgbG9jYWwKPj4+Pj4+PiBsb2Nr
cyAibG9jayIgbmVlZCB0byBiZSByZW5hbWVkLgo+Pj4+Pj4gQnV0IHRoZXNlIGFyZSBhbGwgbmFt
ZWQgc2ltcGx5ICJsb2NrIiBmb3IgYSBnb29kIHJlYXNvbiwgaW5jbHVkaW5nCj4+Pj4+PiBiZWNh
dXNlIHRoZXkncmUgYWxsIGZ1bmN0aW9uIHNjb3BlIHN5bWJvbHMgKGFuZCB0eXBpY2FsbHkgdGhl
Cj4+Pj4+PiBmdW5jdGlvbnMgYXJlIGFsbCBzdWZmaWNpZW50bHkgc2hvcnQpLiBUaGUgaXNzdWUg
c3RlbXMgZnJvbSB0aGUKPj4+Pj4+IGR1YWwgdXNlIG9mICJuYW1lIiBpbgo+Pj4+Pj4KPj4+Pj4+
ICNkZWZpbmUgX0xPQ0tfUFJPRklMRShuYW1lKSB7IDAsICNuYW1lLCAmbmFtZSwgMCwgMCwgMCwg
MCwgMCB9Cj4+Pj4+Pgo+Pj4+Pj4gc28gSSdkIHJhdGhlciBzdWdnZXN0IG1ha2luZyB0aGlzIGEg
ZGVyaXZhdGlvbiBvZiBhIG5ldwo+Pj4+Pj4KPj4+Pj4+ICNkZWZpbmUgX0xPQ0tfUFJPRklMRV9O
QU1FKGxvY2ssIG5hbWUpIHsgMCwgI25hbWUsICZsb2NrLCAwLCAwLCAwLCAwLCAwIH0KPj4+Pj4+
Cj4+Pj4+PiBpZiB0aGVyZSdzIG5vIG90aGVyICh0cmFuc3BhcmVudCkgd2F5IG9mIGRpc2FtYmln
dWF0aW5nIHRoZSBuYW1lcy4KPj4+Pj4gVGhpcyB3aWxsIHJlcXVpcmUgdG8gdXNlIGEgZGlmZmVy
ZW50IERFRklORV9TUElOTE9DSygpIHZhcmlhbnQsIHNvIGUuZy4KPj4+Pj4gREVGSU5FX1NQSU5M
T0NLX0xPQ0FMKCksIHdoaWNoIHdpbGwgdGhlbiBpbmNsdWRlIHRoZSBuZWVkZWQgInN0YXRpYyIg
YW5kCj4+Pj4+IGFkZCAiQDxmdW5jPiIgdG8gdGhlIGxvY2sgcHJvZmlsaW5nIG5hbWUuIElzIHRo
aXMgb2theT8KPj4+PiBUbyBiZSBmcmFuayAtIG5vdCByZWFsbHkuIEkgZGlzbGlrZSBib3RoLCBh
bmQgd291bGQgaGVuY2UgcHJlZmVyIHRvCj4+Pj4gc3RpY2sgdG8gd2hhdCB0aGVyZSBpcyBjdXJy
ZW50bHksIHVudGlsIHNvbWVvbmUgaW52ZW50cyBhIHRyYW5zcGFyZW50Cj4+Pj4gd2F5IHRvIGRp
c2FtYmlndWF0ZSB0aGVzZS4gSSdtIHNvcnJ5IGZvciBiZWluZyB1bmhlbHBmdWwgaGVyZS4KPj4+
IEkgdGhpbmsgSSBoYXZlIGZvdW5kIGEgd2F5OiBJIGNvdWxkIGFkZCBfX0ZJTEVfXyBhbmQgX19M
SU5FX18gZGF0YSB0bwo+Pj4gc3RydWN0IGxvY2tfcHJvZmlsZS4gSW4gbG9ja19wcm9mX2luaXQo
KSBJIGNvdWxkIGxvb2sgZm9yIG5vbi11bmlxdWUKPj4+IGxvY2sgbmFtZXMgYW5kIG1hcmsgdGhv
c2UgdG8gYmUgcHJpbnRlZCB3aXRoIHRoZSBfX0ZJTEVfXyBhbmQgX19MSU5FX18KPj4+IGRhdGEg
YWRkZWQgdG8gdGhlIG5hbWVzLgo+Pj4KPj4+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggdGhpcyBh
cHByb2FjaD8KPj4gSSB3b3VsZCBiZSwgYnV0IEknbSBhZnJhaWQgQW5kcmV3IHdvbid0IChhcyB3
aXRoIGFueSBuZXcgdXNlcyBvZiBfX0xJTkVfXykuCj4gCj4gVGhlIG9rLW5lc3Mgb2YgdXNpbmcg
X19MSU5FX18gaXMgaW52ZXJzZWx5IHByb3BvcnRpb25hbCB0byB0aGUKPiBsaWtlbGlob29kIG9m
IGRldmVsb3BpbmcgYSBsaXZlcGF0Y2ggZm9yIHRoaXMgcGFydGljdWxhciBidWlsZCBvZiBYZW4s
Cj4gYW5kIHdoYXQgYWRkaXRpb25hbCBwYXRjaGluZyBkZWx0YSBpdCB3b3VsZCBjYXVzZSB0aHJv
dWdoIHVucmVsYXRlZCBjaGFuZ2VzLgoKTm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCwgYnV0IHRv
IF9fTElORV9fIGFuZCBsaXZlcGF0Y2hpbmc6IGhhdmUgeW91CmNvbnNpZGVyZWQgdG8gdXNlIHRo
ZSAiI2xpbmUiIGRpcmVjdGl2ZSB0byBhdm9pZCB1bnJlbGF0ZWQgZGlmZnM/CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
