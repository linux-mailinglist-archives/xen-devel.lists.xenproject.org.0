Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C61348B6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 17:59:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEco-0006hk-M1; Wed, 08 Jan 2020 16:56:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipEcm-0006hf-Ng
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:56:04 +0000
X-Inumbo-ID: bca6ed90-3237-11ea-b1f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bca6ed90-3237-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 16:55:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40626ADC8;
 Wed,  8 Jan 2020 16:55:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
 <cfee6317-36dc-05d6-1887-da0a5ce9428f@citrix.com>
 <38cdc276-d41a-9e79-3f0a-8836ebe9a125@suse.com>
 <6d9ebd8d-3b71-c88a-9786-b4fb66905982@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c071c0b-4dce-671a-4225-19765a7f56e7@suse.com>
Date: Wed, 8 Jan 2020 17:55:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6d9ebd8d-3b71-c88a-9786-b4fb66905982@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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

T24gMDguMDEuMjAyMCAxNzoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8wMS8yMDIw
IDExOjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQXMgc2FpZCAtIEknbSBnb2luZyB0byB0cnkg
dG8gbm90IHN0YW5kIGluIHRoZSB3YXkgb2YgeW91IHJlLQo+PiBhcnJhbmdpbmcgdGhpcywgYnV0
Cj4+IC0gdGhlIG5ldyBjb2RlIHNob3VsZCBub3QgYnJlYWsgc2lsZW50bHkgd2hlbiAoaW4gcGFy
dGljdWxhcikKPj4gICBsMl9ib290bWFwW10gY2hhbmdlcwo+IAo+IFdoYXQgcHJhY3RpY2FsIGNo
YW5nZXMgZG8geW91IHRoaW5rIGNvdWxkIGJlIGRvbmUgaGVyZT/CoCBJIGNhbid0IHNwb3QKPiBh
bnkgd2hpY2ggd291bGQgYmUgaGVscGZ1bC4KPiAKPiBBIEJVSUxEX0JVR19PTigpIGRvZXNuJ3Qg
d29yay7CoCBUaGUgbW9zdCBsaWtlbHkgY2FzZSBmb3Igc29tZXRoaW5nIGdvaW5nCj4gd3Jvbmcg
aGVyZSBpcyBhbiBlZGl0IHRvIHg4Nl82NC5TIGFuZCBubyBlcXVpdmFsZW50IGVkaXQgdG8gcGFn
ZS5oLAo+IHdoaWNoIGEgQlVJTERfQlVHX09OKCkgd291bGRuJ3Qgc3BvdC7CoCBoZWFkLlMgc2lt
aWxhcmx5IGhhcyBubyB1c2VmdWwKPiBwcm90ZWN0aW9ucyB3aGljaCBjb3VsZCBiZSBhZGRlZC4K
CldlbGwsIHRoZSBmdW5kYW1lbnRhbCBhc3N1bXB0aW9uIGlzIHRoYXQgdGhlIC5TIGZpbGVzIGFu
ZCB0aGUKQyBkZWNsYXJhdGlvbiBvZiBsP19ib290bWFwW10gYXJlIGtlcHQgaW4gc3luYy4gTm8g
QlVJTERfQlVHX09OKCkKY2FuIGNvdmVyIGEgbWlzdGFrZSBtYWRlIHRoZXJlLiBCdXQgcmF0aGVy
IHRoYW4gdXNpbmcgdGhlIGxpdGVyYWwKNCBhcyB5b3UgZGlkLCBhbiBBUlJBWV9TSVpFKCkgY29u
c3RydWN0IHNob3VsZCBiZSB1c2FibGUgdG8gZWl0aGVyCnJlcGxhY2UgaXQsIG9yIGFtZW5kIGl0
IHdpdGggYSBCVUlMRF9CVUdfT04oKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
