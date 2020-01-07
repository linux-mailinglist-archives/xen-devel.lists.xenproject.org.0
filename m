Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D003132CA3
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 18:10:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iosLA-0001jM-9B; Tue, 07 Jan 2020 17:08:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iosL8-0001jH-QD
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 17:08:22 +0000
X-Inumbo-ID: 4e99ba70-3170-11ea-ac75-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e99ba70-3170-11ea-ac75-12813bfff9fa;
 Tue, 07 Jan 2020 17:08:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7B06B15D;
 Tue,  7 Jan 2020 17:08:20 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
 <20200107163339.rwqo6ybwzxgi77e4@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af2dd5b5-f5a4-6fe3-5654-6d84739e6d92@suse.com>
Date: Tue, 7 Jan 2020 18:08:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107163339.rwqo6ybwzxgi77e4@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxNzozMywgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEphbiAwNiwgMjAy
MCBhdCAxMToyNzoxOEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMDEuMjAy
MCAxNzo0NywgV2VpIExpdSB3cm90ZToKPj4+IEh5cGVyLVYncyBpbnB1dCAvIG91dHB1dCBhcmd1
bWVudCBtdXN0IGJlIDggYnl0ZXMgYWxpZ25lZCBhbiBub3QgY3Jvc3MKPj4+IHBhZ2UgYm91bmRh
cnkuIFRoZSBlYXNpZXN0IHdheSB0byBzYXRpc2Z5IHRob3NlIHJlcXVpcmVtZW50cyBpcyB0byB1
c2UKPj4+IHBlcmNwdSBwYWdlLgo+Pgo+PiBJJ20gbm90IHN1cmUgImVhc2llc3QiIGlzIHJlYWxs
eSB0cnVlIGhlcmUuIE90aGVycyBjb3VsZCBjb25zaWRlciBhZGRpbmcKPj4gX19hbGlnbmVkKCkg
YXR0cmlidXRlcyBhcyBlYXN5IG9yIGV2ZW4gZWFzaWVyIChieSBiZWluZyBldmVuIG1vcmUKPj4g
dHJhbnNwYXJlbnQgdG8gdXNlIHNpdGVzKS4gQ291bGQgd2Ugc2V0dGxlIG9uICJPbmUgd2F5IC4u
LiI/Cj4gCj4gRG8geW91IG1lYW4gc29tZXRoaW5nIGxpa2UKPiAKPiAgICBzdHJ1Y3QgZm9vIF9f
YWxpZ25lZCg4KTsKCklmIHRoaXMgaXMgaW4gYSBoZWFkZXIgYW5kIC4uLgoKPiAgICBodl9kb19o
eXBlcmNhbGwoT1AsIHZpcnRfdG9fbWFkZHIoJmZvbyksIC4uLik7CgouLi4gdGhpcyBpbiBhY3R1
YWwgY29kZSwgdGhlbiB5ZXMuCgo+ID8KPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdHJhbnNw
YXJlbnQgdG8gdXNlciBzaXRlcy4gUGx1cywgZm9vIGlzIG9uIHN0YWNrCj4gd2hpY2ggaXMgMSkg
ZGlmZmljdWx0IHRvIGdldCBpdHMgbWFkZHIsCgpJdCBiZWluZyBvbiB0aGUgc3RhY2sgbWF5IGlu
ZGVlZCBjb21wbGljYXRlIGdldHRpbmcgaXRzIG1hY2hpbmUgYWRkcmVzcwooaWYgbm90IG5vdywg
dGhlbiBkb3duIHRoZSByb2FkKSAtIHZhbGlkIHBvaW50LgoKPiAyKSBtYXkgY3Jvc3MgcGFnZSBi
b3VuZGFyeS4KClRoZSBfX2FsaWduZWQoKSBvZiBjb3Vyc2UgbmVlZHMgdG8gYmUgbGFyZ2UgZW5v
dWdoIHRvIGF2b2lkIHRoaXMKaGFwcGVuaW5nLgoKPj4gQWxzbywgd2hpbGUgbG9va2luZyBhdCB0
aGlzIEkgbm90aWNlIHRoYXQgLSBkZXNwaXRlIG15IGVhcmxpZXIKPj4gY29tbWVudCB3aGVuIGdp
dmluZyB0aGUgcmVzcGVjdGl2ZSwgc29ydC1vZi1jb25kaXRpb25hbCBhY2sgLQo+PiB0aGVyZSBh
cmUgKHN0aWxsKSBtYW55IGFwcGFyZW50bHkgcG9pbnRsZXNzIF9fcGFja2VkIGF0dHJpYnV0ZXMK
Pj4gaW4gaHlwZXJ2LXRsZnMuaC4gQ2FyZSB0byBjb21tZW50IG9uIHRoaXM/Cj4gCj4gQWdhaW4s
IHRoYXQncyBhIHN0cmFpZ2h0IGltcG9ydCBmcm9tIExpbnV4LiBJIHRyaWVkIG5vdCB0byBkZXZp
YXRlIHRvbwo+IG11Y2guIEEgY29tbWl0IGluIExpbnV4IChlYzA4NDQ5MTcyN2IwKSBjbGFpbXMg
ImNvbXBpbGVyIGNhbiBhZGQKPiBhbGlnbm1lbnQgcGFkZGluZyB0byBzdHJ1Y3R1cmVzIG9yIHJl
b3JkZXIgc3RydWN0IG1lbWJlcnMgZm9yCj4gcmFuZG9taXphdGlvbiBhbmQgb3B0aW1pemF0aW9u
Ii4KCldvdWxkIGEgY29tcGlsZXIgZG9pbmcgc28gKHdpdGhvdXQgZXhwbGljaXRseSBiZWluZyB0
b2xkIHRvKSBldmVuCmJlIGluIGxpbmUgd2l0aCB0aGUgQyBzcGVjPyBJJ2QgYnV5IHN1Y2ggYSBj
bGFpbSBvbmx5IGlmIEkgc2VlIGFuCmV4YW1wbGUgcHJvdmluZyBpdC4KCj4gSSBqdXN0IGNoZWNr
ZWQgYWxsIHRoZSBwYWNrZWQgc3RydWN0dXJlcy4gVGhleSBzZWVtIHRvIGhhdmUgYWxsIHRoZQo+
IHJlcXVpcmVkIG1hbnVhbCBwYWRkaW5ncyBhbHJlYWR5LiBJIGNhbiBvbmx5IGFzc3VtZSB0aGV5
IHRyaWVkIHRvIGVycmVkCj4gb24gdGhlIHNhZmUgc2lkZS4KCkFuZCB5b3Ugc3VyZWx5IHJlY2Fs
bCB3ZSBoYWQgdG8gcmVtb3ZlIHF1aXRlIGEgZmV3IGluc3RhbmNlcyBvZgpfX3BhY2tlZCBmb3Ig
Z2NjIDkgY29tcGF0aWJpbGl0eT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
