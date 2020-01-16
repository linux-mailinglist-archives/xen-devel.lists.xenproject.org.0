Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A113D579
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 08:59:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irzzd-0006Gg-Kk; Thu, 16 Jan 2020 07:55:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s8OO=3F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1irzzc-0006Gb-6K
 for xen-devel@lists.xen.org; Thu, 16 Jan 2020 07:55:04 +0000
X-Inumbo-ID: 7f5a104e-3835-11ea-86b6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f5a104e-3835-11ea-86b6-12813bfff9fa;
 Thu, 16 Jan 2020 07:55:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D021AC2C;
 Thu, 16 Jan 2020 07:55:00 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-2-sergey.dyasli@citrix.com>
 <96c2414e-91fb-5a28-44bc-e30d2daabec5@citrix.com>
 <6f643816-a7dc-f3bb-d521-b6ac104918d6@suse.com>
 <c116cc6c-c56c-13a5-6dce-ecbb9cf80b3a@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c0e6f3a8-85b1-ba92-7379-bdf5f1225ff5@suse.com>
Date: Thu, 16 Jan 2020 08:54:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c116cc6c-c56c-13a5-6dce-ecbb9cf80b3a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/4] kasan: introduce
 set_pmd_early_shadow()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAgMTc6MzIsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMTUvMDEvMjAyMCAx
MTowOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMTUuMDEuMjAgMTE6NTQsIFNlcmdleSBE
eWFzbGkgd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuLAo+Pj4KPj4+IE9uIDA4LzAxLzIwMjAgMTU6MjAs
IFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4gSXQgaXMgaW5jb3JyZWN0IHRvIGNhbGwgcG1kX3Bv
cHVsYXRlX2tlcm5lbCgpIG11bHRpcGxlIHRpbWVzIGZvciB0aGUKPj4+PiBzYW1lIHBhZ2UgdGFi
bGUuIFhlbiBub3RpY2VzIGl0IGR1cmluZyBrYXNhbl9wb3B1bGF0ZV9lYXJseV9zaGFkb3coKToK
Pj4+Pgo+Pj4+ICAgICAgIChYRU4pIG1tLmM6MzIyMjpkMTU1djAgbWZuIDM3MDRiIGFscmVhZHkg
cGlubmVkCj4+Pj4KPj4+PiBUaGlzIGhhcHBlbnMgZm9yIGthc2FuX2Vhcmx5X3NoYWRvd19wdGUg
d2hlbiBVU0VfU1BMSVRfUFRFX1BUTE9DS1MgaXMKPj4+PiBlbmFibGVkLiBGaXggdGhpcyBieSBp
bnRyb2R1Y2luZyBzZXRfcG1kX2Vhcmx5X3NoYWRvdygpIHdoaWNoIGNhbGxzCj4+Pj4gcG1kX3Bv
cHVsYXRlX2tlcm5lbCgpIG9ubHkgb25jZSBhbmQgdXNlcyBzZXRfcG1kKCkgYWZ0ZXJ3YXJkcy4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0
cml4LmNvbT4KPj4+Cj4+PiBMb29rcyBsaWtlIHRoZSBwbGFuIHRvIHVzZSBzZXRfcG1kKCkgZGly
ZWN0bHkgaGFzIGZhaWxlZDogaXQncyBhbgo+Pj4gYXJjaC1zcGVjaWZpYyBmdW5jdGlvbiBhbmQg
Y2FuJ3QgYmUgdXNlZCBpbiBhcmNoLWluZGVwZW5kZW50IGNvZGUKPj4+IChhcyBrYnVpbGQgdGVz
dCByb2JvdCBoYXMgcHJvdmVuKS4KPj4+Cj4+PiBEbyB5b3Ugc2VlIGFueSB3YXkgb3V0IG9mIHRo
aXMgb3RoZXIgdGhhbiBkaXNhYmxpbmcgU1BMSVRfUFRFX1BUTE9DS1MKPj4+IGZvciBQViBLQVNB
Tj8KPj4KPj4gQ2hhbmdlIHNldF9wbWRfZWFybHlfc2hhZG93KCkgbGlrZSB0aGUgZm9sbG93aW5n
Ogo+Pgo+PiAjaWZkZWYgQ09ORklHX1hFTl9QVgo+PiBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3Bt
ZF9lYXJseV9zaGFkb3cocG1kX3QgKnBtZCwgcHRlX3QgKmVhcmx5X3NoYWRvdykKPj4gewo+PiAg
ICAgIHN0YXRpYyBib29sIHBtZF9wb3B1bGF0ZWQgPSBmYWxzZTsKPj4KPj4gICAgICBpZiAobGlr
ZWx5KHBtZF9wb3B1bGF0ZWQpKSB7Cj4+ICAgICAgICAgIHNldF9wbWQocG1kLCBfX3BtZChfX3Bh
KGVhcmx5X3NoYWRvdykgfCBfUEFHRV9UQUJMRSkpOwo+PiAgICAgIH0gZWxzZSB7Cj4+ICAgICAg
ICAgIHBtZF9wb3B1bGF0ZV9rZXJuZWwoJmluaXRfbW0sIHBtZCwgZWFybHlfc2hhZG93KTsKPj4g
ICAgICAgICAgcG1kX3BvcHVsYXRlZCA9IHRydWU7Cj4+ICAgICAgfQo+PiB9Cj4+ICNlbHNlCj4+
IHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcG1kX2Vhcmx5X3NoYWRvdyhwbWRfdCAqcG1kLCBwdGVf
dCAqZWFybHlfc2hhZG93KQo+PiB7Cj4+ICAgICAgcG1kX3BvcHVsYXRlX2tlcm5lbCgmaW5pdF9t
bSwgcG1kLCBlYXJseV9zaGFkb3cpOwo+PiB9Cj4+ICNlbmRpZgo+Pgo+PiAuLi4gYW5kIG1vdmUg
aXQgdG8gaW5jbHVkZS94ZW4veGVuLW9wcy5oIGFuZCBjYWxsIGl0IHdpdGgKPj4gbG1fYWxpYXMo
a2FzYW5fZWFybHlfc2hhZG93X3B0ZSkgYXMgdGhlIHNlY29uZCBwYXJhbWV0ZXIuCj4gCj4gWW91
ciBzdWdnZXN0aW9uIHRvIHVzZSBpZmRlZiBpcyByZWFsbHkgZ29vZCwgZXNwZWNpYWxseSBub3cg
d2hlbiBJCj4gZmlndXJlZCBvdXQgdGhhdCBDT05GSUdfWEVOX1BWIGltcGxpZXMgWDg2LiBCdXQg
SSBkb24ndCBsaWtlIHRoZSBpZGVhCj4gb2Yga2FzYW4gY29kZSBjYWxsaW5nIGEgbm9uLWVtcHR5
IGZ1bmN0aW9uIGZyb20geGVuLW9wcy5oIHdoZW4KPiBDT05GSUdfWEVOX1BWIGlzIG5vdCBkZWZp
bmVkLiBJJ2QgcHJlZmVyIHRvIGtlZXAgc2V0X3BtZF9lYXJseV9zaGFkb3coKQo+IGluIG1tL2th
c2FuL2luaXQuYyB3aXRoIHRoZSBzdWdnZXN0ZWQgaWZkZWYuCgpGaW5lIHdpdGggbWUuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
