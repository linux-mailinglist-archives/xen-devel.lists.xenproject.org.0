Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443D173C2D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 16:50:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7hrj-0002gK-Ic; Fri, 28 Feb 2020 15:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7hri-0002gF-4H
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 15:47:50 +0000
X-Inumbo-ID: ab9e8f58-5a41-11ea-9986-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab9e8f58-5a41-11ea-9986-12813bfff9fa;
 Fri, 28 Feb 2020 15:47:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C5F5ABF4;
 Fri, 28 Feb 2020 15:47:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-2-roger.pau@citrix.com>
 <7df3df82-c6c3-37ab-3123-cd2894268b4d@suse.com>
 <20200228152728.GA24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87d7fb0c-550d-e399-7a3d-f48cfbbcd53e@suse.com>
Date: Fri, 28 Feb 2020 16:47:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228152728.GA24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86/hvm: allow ASID flush when v !=
 current
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxNjoyNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwMjoyOTowOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gQ3VycmVudCBpbXBs
ZW1lbnRhdGlvbiBvZiBodm1fYXNpZF9mbHVzaF92Y3B1IGlzIG5vdCBzYWZlIHRvIHVzZQo+Pj4g
dW5sZXNzIHRoZSB0YXJnZXQgdkNQVSBpcyBlaXRoZXIgcGF1c2VkIG9yIHRoZSBjdXJyZW50bHkg
cnVubmluZyBvbmUsCj4+PiBhcyBpdCBtb2RpZmllcyB0aGUgZ2VuZXJhdGlvbiB3aXRob3V0IGFu
eSBsb2NraW5nLgo+Pgo+PiBJbmRlZWQsIGJ1dCB0aGUgaXNzdWUgeW91J3JlIHRha2luZyBjYXJl
IG9mIGlzIGhpZ2hseSB0aGVvcmV0aWNhbDoKPj4gSSBkb24ndCB0aGluayBhbnkgc2FuZSBjb21w
aWxlciB3aWxsIHNwbGl0IHdyaXRlcyBvZiB0aGUgZmllbGRzCj4+IHRvIG11bHRpcGxlIGluc25z
LiBJdCB3b3VsZCBiZSBuaWNlIGlmIHRoaXMgd2FzIG1hZGUgY2xlYXIgaGVyZS4KPiAKPiBXaGF0
IGFib3V0IGFkZGluZzoKPiAKPj4+IEZpeCB0aGlzIGJ5IHVzaW5nIGF0b21pYyBvcGVyYXRpb25z
IHdoZW4gYWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCj4+PiBmaWVsZCwgYm90aCBpbiBodm1fYXNp
ZF9mbHVzaF92Y3B1X2FzaWQgYW5kIG90aGVyIEFTSUQgZnVuY3Rpb25zLiBUaGlzCj4+PiBhbGxv
d3MgdG8gc2FmZWx5IGZsdXNoIHRoZSBjdXJyZW50IEFTSUQgZ2VuZXJhdGlvbi4gTm90ZSB0aGF0
IGZvciB0aGUKPj4+IGZsdXNoIHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlzIGN1cnJlbnRs
eSBydW5uaW5nIGEgdm1leGl0IGlzCj4+PiByZXF1aXJlZC4KPiAKPiAiTW9zdCBjb21waWxlcnMg
d2lsbCBhbHJlYWR5IGRvIHN1Y2ggd3JpdGVzIGFuZCByZWFkcyBhcyBhIHNpbmdsZQo+IGluc3Ry
dWN0aW9uLCBzbyB0aGUgdXNhZ2Ugb2YgYXRvbWljIG9wZXJhdGlvbnMgaXMgbW9zdGx5IHVzZWQg
YXMgYQo+IHNhZmV0eSBtZWFzdXJlLiIKPiAKPiBIZXJlPwoKQ291bGQgeW91IHBlcmhhcHMgc3Rh
cnQgd2l0aCAiQ29tcGlsZXJzIHdpbGwgbm9ybWFsbHkgLi4uIiBJJ20gZmluZQp3aXRoIHRoZSBy
ZXN0LCBpdCdzIGp1c3QgdGhhdCAibW9zdCBjb21waWxlcnMiIHN0aWxsIGZlZWxzIGxpa2UKYW4g
dW5kZXJzdGF0ZW1lbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
