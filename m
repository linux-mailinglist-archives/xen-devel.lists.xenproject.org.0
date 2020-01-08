Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B13133FF8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 12:11:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip9C1-00035m-Lp; Wed, 08 Jan 2020 11:08:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ip9Bz-00035h-Ow
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 11:08:03 +0000
X-Inumbo-ID: 22e09a89-3207-11ea-b7a0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22e09a89-3207-11ea-b7a0-12813bfff9fa;
 Wed, 08 Jan 2020 11:08:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0723DB268;
 Wed,  8 Jan 2020 11:08:02 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-3-andrew.cooper3@citrix.com>
 <145d6e59-b50e-b617-cbb5-48ebed002c23@suse.com>
 <fd2d333a-8127-2688-acb7-b082955f9eb5@citrix.com>
 <b07c66db-193e-7bb0-7ea2-12d876b3ccac@suse.com>
 <b60a3b8b-351f-5756-3726-fedd3b8bcec9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bcf8801-ae9b-7216-6998-564b682d95f3@suse.com>
Date: Wed, 8 Jan 2020 12:08:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b60a3b8b-351f-5756-3726-fedd3b8bcec9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/6] x86/boot: Map the trampoline as
 read-only
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAyMDowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wMS8yMDIw
IDE2OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDcuMDEuMjAyMCAxNjo1MSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA3LzAxLzIwMjAgMTU6MjEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDA2LjAxLjIwMjAgMTY6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IGMv
cyBlYzkyZmNkMWQwOCwgd2hpY2ggY2F1c2VkIHRoZSB0cmFtcG9saW5lIEdEVCBBY2Nlc3MgYml0
cyB0byBiZSBzZXQsCj4+Pj4+IHJlbW92ZWQgdGhlIGZpbmFsIHdyaXRlcyB3aGljaCBvY2N1cnJl
ZCBiZXR3ZWVuIGVuYWJsaW5nIHBhZ2luZyBhbmQgc3dpdGNoaW5nCj4+Pj4+IHRvIHRoZSBoaWdo
IG1hcHBpbmdzLiAgVGhlcmUgZG9uJ3QgcGxhdXNpYmx5IG5lZWQgdG8gYmUgYW55IG1lbW9yeSB3
cml0ZXMgaW4KPj4+Pj4gZmV3IGluc3RydWN0aW9ucyBpcyB0YWtlcyB0byBwZXJmb3JtIHRoaXMg
dHJhbnNpdGlvbi4KPj4+Pj4KPj4+Pj4gQXMgYSBjb25zZXF1ZW5jZSwgd2UgY2FuIHJlbW92ZSB0
aGUgUldYIG1hcHBpbmcgb2YgdGhlIHRyYW1wb2xpbmUuICBJdCBpcyBSWAo+Pj4+PiB2aWEgaXRz
IGlkZW50aXR5IG1hcHBpbmcgYmVsb3cgMU0sIGFuZCBSVyB2aWEgdGhlIGRpcmVjdG1hcC4KPj4+
Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Pj4+Cj4+Pj4+IFRoaXMgcHJvYmFibHkgd2FudHMgYmFja3BvcnRpbmcsIGFsb25nc2lkZSBl
YzkyZmNkMWQwOCBpZiBpdCBoYXNuJ3QgeWV0Lgo+Pj4+IFRoaXMgaXMganVzdCBjbGVhbnVwLCBs
YXJnZWx5IGNvc21ldGljIGluIG5hdHVyZS4gSXQgY291bGQgYmUgYXJndWVkCj4+Pj4gdGhhdCBv
bmNlIHRoZSBkaXJlY3RtYXAgaGFzIGRpc2FwcGVhcmVkIHRoaXMgY2FuIHNlcnZlIGFzIGFkZGl0
aW9uYWwKPj4+PiBwcm9vZiB0aGF0IHRoZSB0cmFtcG9saW5lIHJhbmdlIGhhcyBubyAoaW50ZW5k
ZWQpIHdyaXRhYmxlIG1hcHBpbmdzCj4+Pj4gYW55bW9yZSwgYnV0IHByaW9yIHRvIHRoYXQgcG9p
bnQgSSBkb24ndCBzZWUgbXVjaCBmdXJ0aGVyIGJlbmVmaXQuCj4+Pj4gQ291bGQgeW91IGV4cGFu
ZCBvbiB0aGUgcmVhc29ucyB3aHkgeW91IHNlZSBib3RoIGFzIGJhY2twb3J0aW5nCj4+Pj4gY2Fu
ZGlkYXRlcz8KPj4+IERlZmVuY2UgaW4gZGVwdGguCj4+Pgo+Pj4gQW4gUldYIG1hcHBpbmcgaXMg
dmVyeSBhdHRyYWN0aXZlIGZvciBhbiBhdHRhY2tlciB3aG8ncyBicm9rZW4gaW50byBYZW4KPj4+
IGFuZCBpcyBsb29raW5nIHRvIGV4cGFuZCB0aGUgZGFtYWdlIHRoZXkgY2FuIGRvLgo+PiBTdWNo
IGFuIGF0dGFja2VyIGlzIHR5cGljYWxseSBpbiB0aGUgcG9zaXRpb24gdGhvdWdoIHRvIG1ha2UK
Pj4gdGhlbXNlbHZlcyBSV1ggbWFwcGluZ3MuCj4gCj4gVGhpcyBpcyBvbmUgZXhhbXBsZSBvZiBh
IHBvc3NpYmlsaXR5LsKgIEkgd291bGRuJ3QgcHV0IGl0IGluIHRoZSAibGlrZWx5Igo+IGNhdGVn
b3J5LCBhbmQgaXQgZGVmaW5pdGVseSBpc24ndCBhIGd1YXJhbnRlZS4KPiAKPj4gIEhhdmluZyBh
cyBsaXR0bGUgYXMgcG9zc2libGUgaXMgb25seQo+PiBjb21wbGljYXRpbmcgdGhlaXIgam9iLCBu
b3QgbWFraW5nIGl0IGltcG9zc2libGUsIEkgd291bGQgc2F5Lgo+IAo+IFllcywgYW5kPwo+IAo+
IFRoaXMgaXMgdGhlIGVudGlyZSBwb2ludCBvZiBkZWZlbmNlIGluIGRlcHRoLsKgIE1ha2UgYW4g
YXR0YWNrZXJzIGpvYiBoYXJkZXIuCj4gCj4gRW5mb3JjaW5nIFdeWCBpcyB1bml2ZXJzYWxseSBj
b25zaWRlcmVkIGEgZ29vZCB0aGluZyBmcm9tIGEgc2VjdXJpdHkKPiBwZXJzcGVjdGl2ZSwgYmVj
YXVzZSBpdCByZW1vdmVzIGEgbG9hZCBvZiB0cml2aWFsIGNhc2VzIGNhc2VzIHdoZXJlIGEKPiBz
dGFjayBvdmVyLXdyaXRlIGNhbiBlYXNpbHkgYmUgdHVybmVkIGludG8gYXJiaXRyYXJ5IGNvZGUg
ZXhlY3V0aW9uLgoKVGhlbiBsZXQgbWUgYXNrIHRoZSBxdWVzdGlvbiBkaWZmZXJlbnRseTogRGlk
IHdlIGJhY2twb3J0IGFueSBvZiB0aGUKZWFybGllciBSV1ggZWxpbWluYXRpb24gY2hhbmdlcz8g
SSBkb24ndCByZWNhbGwgdXMgZG9pbmcgc28uIFBsZWFzZQpkb24ndCBnZXQgbWUgd3JvbmcgLSBJ
J20gaGFwcHkgdG8gYmUgY29udmluY2VkIG9mIHRoZSBiYWNrcG9ydCBuZWVkLApidXQgYXMgYWx3
YXlzIEknZCBsaWtlIHRvIHRha2Ugc3VjaCBhIGRlY2lzaW9uIGluIGEgY29uc2lzdGVudCAoYW5k
CmhlbmNlIHN1ZmZpY2llbnRseSBwcmVkaWN0YWJsZSkgbWFubmVyLCBvciBhbHRlcm5hdGl2ZWx5
IHdpdGggYSBnb29kCmVub3VnaCByZWFzb24gdG8gaWdub3JlIHRoaXMgZ2VuZXJhbCBnb2FsLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
