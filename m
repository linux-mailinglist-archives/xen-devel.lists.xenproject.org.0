Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCB11A542
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 08:44:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iewcL-0004xO-7o; Wed, 11 Dec 2019 07:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iewcK-0004xJ-Hj
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 07:41:04 +0000
X-Inumbo-ID: 9505a8ee-1be9-11ea-8ac5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9505a8ee-1be9-11ea-8ac5-12813bfff9fa;
 Wed, 11 Dec 2019 07:41:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C204ADA8;
 Wed, 11 Dec 2019 07:41:02 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-6-andrew.cooper3@citrix.com>
 <60ae5d0a-8290-42ed-74e7-894515c5dea3@suse.com>
 <300fe43e-fbe9-b0e0-1ac8-000e2a55f276@citrix.com>
 <7a1c0f6b-6f41-8a1f-7170-9ea235bf1bc9@suse.com>
 <c5aceeb7-ea60-a692-ce9c-f6939d1c413b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca89c65b-79bd-a129-9e90-a6cec3cc083e@suse.com>
Date: Wed, 11 Dec 2019 08:41:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c5aceeb7-ea60-a692-ce9c-f6939d1c413b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] xen/tasklet: Return -ERESTART from
 continue_hypercall_on_cpu()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxODo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8xMi8yMDE5
IDA4OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDkuMTIuMjAxOSAxODo0OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA5LzEyLzIwMTkgMTY6NTIsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDA1LjEyLjIwMTkgMjM6MzAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFNv
bWUgaHlwZXJjYWxscyB0YXNrbGV0cyB3YW50IHRvIGNyZWF0ZSBhIGNvbnRpbnVhdGlvbiwgcmF0
aGVyIHRoYW4gZmFpbCB0aGUKPj4+Pj4gaHlwZXJjYWxsIHdpdGggYSBoYXJkIGVycm9yLiAgQnkg
dGhlIHRpbWUgdGhlIHRhc2tsZXQgaXMgZXhlY3V0aW5nLCBpdCBpcyB0b28KPj4+Pj4gbGF0ZSB0
byBjcmVhdGUgdGhlIGNvbnRpbnVhdGlvbiwgYW5kIGV2ZW4gY29udGludWVfaHlwZXJjYWxsX29u
X2NwdSgpIGRvZXNuJ3QKPj4+Pj4gaGF2ZSBlbm91Z2ggc3RhdGUgdG8gZG8gaXQgY29ycmVjdGx5
Lgo+Pj4+IEkgdGhpbmsgaXQgd291bGQgYmUgcXVpdGUgbmljZSBpZiB5b3UgbWFkZSBjbGVhciB3
aGF0IHBpZWNlIG9mIHN0YXRlCj4+Pj4gaXQgaXMgYWN0dWFsbHkgbWlzc2luZy4gVG8gYmUgaG9u
ZXN0LCBJIGRvbid0IHJlY2FsbCBhbnltb3JlLgo+Pj4gSG93IHRvIGNvcnJlY3RseSBtdXRhdGUg
dGhlIHJlZ2lzdGVycyBhbmQvb3IgbWVtb3J5ICh3aGljaCBpcyBzcGVjaWZpYwo+Pj4gdG8gdGhl
IGh5cGVyY2FsbCBzdWJvcCBpbiBzb21lIGNhc2VzKS4KPj4gV2VsbCwgaW4tbWVtb3J5IGFyZ3Vt
ZW50cyBjYW4gYmUgYWNjZXNzZWQgYXMgbG9uZyBhcyB0aGUgbWFwcGluZyBpcwo+PiB0aGUgcmln
aHQgb25lICh3aGljaCBpdCB0eXBpY2FsbHkgd291bGRuJ3QgYmUgaW5zaWRlIGEgdGFza2xldCku
IERvCj4+IGV4aXN0aW5nIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoKSB1c2VycyBuZWVkIHRo
aXM/IExvb2tpbmcgb3Zlcgo+PiBwYXRjaCA0IGFnYWluLCBJIGRpZG4ndCB0aGluayBzby4gKFdo
aWNoIGlzbid0IHRvIHNheSB0aGF0IHJlbW92aW5nCj4+IHRoZSBsYXRlbnQgaXNzdWUgaXMgbm90
IGEgZ29vZCB0aGluZy4pCj4+Cj4+IEluLXJlZ2lzdGVyIHZhbHVlcyBjYW4gYmUgY2hhbmdlZCBh
cyBsb25nIGFzIHRoZSByZXNwZWN0aXZlIGV4aXQKPj4gcGF0aCB3aWxsIHN1aXRhYmx5IHBpY2sg
dXAgdGhlIHZhbHVlLCB3aGljaCBJIHRob3VnaHQgd2FzIGFsd2F5cwo+PiB0aGUgY2FzZS4KPj4K
Pj4gSGVuY2UgSSdtIGFmcmFpZCB5b3VyIHNpbmdsZSByZXBseSBzZW50ZW5jZSBkaWRuJ3QgcmVh
bGx5IGNsYXJpZnkKPj4gbWF0dGVycy4gSSdtIHNvcnJ5IGlmIHRoaXMgaXMganVzdCBiZWNhdXNl
IG9mIG1lIGJlaW5nIGRlbnNlLgo+IAo+IEhvdywgcGh5c2ljYWxseSwgd291bGQgeW91IGFycmFu
Z2UgZm9yIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoKSB0bwo+IG1ha2UgdGhlIHJlcXVpc2l0
ZSBzdGF0ZSBhZGp1c3RtZW50cz8KCllvdSBjYW4ndCAoYXQgbGVhc3Qgbm90IHdpdGhvdXQgaGF2
aW5nIHN1ZmZpY2llbnQgZnVydGhlciBjb250ZXh0KSwKSSBhZ3JlZS4gWWV0IC4uLgoKPiBZZXMg
LSByZWdpc3RlcnMgYW5kIG1lbW9yeSBjYW4gYmUgYWNjZXNzZWQsIGJ1dCBvbmx5IHRoZSBoeXBl
cmNhbGwKPiAoc3ViPylvcCBoYW5kbGVyIGtub3dzIGhvdyB0byBtdXRhdGUgdGhlbSBhcHByb3By
aWF0ZWx5Lgo+IAo+IFlvdSdkIGhhdmUgdG8gY29weSB0aGUgbXV0YXRpb24gbG9naWMgaW50byBj
b250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCksCj4gYW5kIHBhc3MgaW4gb3Avc3Vib3BzIGFuZCBh
IHVuaW9uIG9mIGFsbCBwb2ludGVycywgKmFuZCogd2hhdGV2ZXIKPiBpbnRlcm1lZGlhdGUgc3Rh
dGUgdGhlIHN1Ym9wIGhhbmRsZXIgbmVlZHMuCj4gCj4gT3IgeW91IGNhbiByZXR1cm4gLUVSRVNU
QVJUIGFuZCBsZXQgdGhlIGNhbGxlciBEVFJUIHdpdGggdGhlIHN0YXRlIGl0Cj4gaGFzIGluIGNv
bnRleHQsIGFzIGl0IHdvdWxkIGluIG90aGVyIGNhc2VzIHJlcXVpcmluZyBhIGNvbnRpbnVhdGlv
bi4KCi4uLiBpdCBjb250aW51ZXMgdG8gYmUgdW5jbGVhciB0byBtZSB3aGV0aGVyIHlvdSdyZSBm
aXhpbmcgYW4gYWN0dWFsCmJ1ZyBoZXJlLCBvciBqdXN0IGEgbGF0ZW50IG9uZS4gVGhlIGV4aXN0
aW5nIHVzZXMgb2YKY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpIGRvbid0IGxvb2sgdG8gcmVx
dWlyZSBzdGF0ZSB1cGRhdGVzCmJleW9uZCB0aGUgaHlwZXJjYWxsIHJldHVybiB2YWx1ZSAob3Ig
ZWxzZSwgYWl1aSwgdGhleSB3b3VsZG4ndCBoYXZlCndvcmtlZCBpbiB0aGUgZmlyc3QgcGxhY2Up
LCBhbmQgdGhhdCBvbmUgaGFkIGEgd2F5IHRvIGdldCBtb2RpZmllZC4KCj4+Pj4+IFRoZSBjdXJy
ZW50IGJlaGF2aW91ciB3aXRoIHRoaXMgcGF0Y2ggaXMgdG8gbm90IGNhbmNlbCB0aGUgY29udGlu
dWF0aW9uLCB3aGljaAo+Pj4+PiBJIHRoaW5rIGlzIGxlc3MgYmFkLCBidXQgc3RpbGwgbm90IGdy
ZWF0LiAgVGhvdWdodHM/Cj4+Pj4gV2VsbCwgdGhhdCdzIGEgZ3Vlc3QgbGl2ZSBsb2NrIHRoZW4g
YWl1aS4KPj4+IEl0IHNpbXBseSBjb250aW51ZXMgYWdhaW4uwqAgSXQgd2lsbCBsaXZlbG9jayBv
bmx5IGlmIHRoZSBoeXBlcmNhbGwgcGlja3MKPj4+IGEgYmFkIGNwdSBhbGwgdGhlIHRpbWUuCj4+
IE9oLCBJIHNlZSBJIHdhcyBtaXNsZWFkIGJ5IGNvbnRpbnVlX2h5cGVyY2FsbF90YXNrbGV0X2hh
bmRsZXIoKSBub3QKPj4gdXBkYXRpbmcgaW5mby0+Y3B1LCBub3QgcGF5aW5nIGF0dGVudGlvbiB0
byBpdCBhY3R1YWxseSBmcmVlaW5nIGluZm8uCj4+IFBsdXMgYSBjcnVjaWFsIGFzcGVjdCBsb29r
cyB0byBiZSB0aGF0IHRoZXJlIGFyZSBubyAiY2hhaW5lZCIgdXNlcyBvZgo+PiBjb250aW51ZV9o
eXBlcmNhbGxfb25fY3B1KCkgYW55bW9yZSAodGhlIG1pY3JvY29kZSBsb2FkaW5nIG9uZSBiZWlu
Zwo+PiBnb25lIG5vdykgLSBhZmFpY3QgYW55IHN1Y2ggd291bGRuJ3QgZ3VhcmFudGVlIGZvcndh
cmQgcHJvZ3Jlc3Mgd2l0aAo+PiB0aGlzIG5ldyBtb2RlbCAod2l0aG91dCByZWNvcmRpbmcgc29t
ZXdoZXJlIHdoaWNoIENQVXMgaGFkIGJlZW4gZGVhbHQKPj4gd2l0aCBhbHJlYWR5KS4KPiAKPiBJ
J2QgZm9yZ290dGVuIHRoYXQgd2UgaGFkIHRoYXQsIGJ1dCBJIGNhbid0IHNheSBJJ20gc2FkIHRv
IHNlZSB0aGUgYmFjawo+IG9mIGl0LsKgIEkgcmVjYWxsIGF0IHRoZSB0aW1lIHNheWluZyB0aGF0
IGl0IHdhc24ndCBhIGNsZXZlciBtb3ZlLgo+IAo+IEZvciBub3csIEkgc3VnZ2VzdCB0aGF0IHdl
IGlnbm9yZSB0aGF0IGNhc2UuwqAgSWYgYW4gd2hlbiBhIHJlYWwgdXNlY2FzZQo+IGFwcGVhcnMs
IHdlIGNhbiBjb25zaWRlciBtYWtpbmcgYWRqdXN0bWVudHMuCgpPaCwgb2YgY291cnNlIC0gSSBk
aWRuJ3QgbWVhbiB0byBldmVuIHJlbW90ZWx5IHN1Z2dlc3QgYW55dGhpbmcgZWxzZS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
