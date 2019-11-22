Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75596107416
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 15:33:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY9xd-0003Qq-9y; Fri, 22 Nov 2019 14:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY9xc-0003Ql-JS
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 14:31:00 +0000
X-Inumbo-ID: b368bcfe-0d34-11ea-a353-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b368bcfe-0d34-11ea-a353-12813bfff9fa;
 Fri, 22 Nov 2019 14:30:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56EB2B28C;
 Fri, 22 Nov 2019 14:30:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
 <20191121221551.1175-3-andrew.cooper3@citrix.com>
 <e2fe7f81-2852-dc74-d4b8-b990c186f1cf@suse.com>
 <c60b3c89-5617-caa4-3ca8-4648c378c2f6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ef29318-259e-b505-eee0-276f1377c0b8@suse.com>
Date: Fri, 22 Nov 2019 15:31:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c60b3c89-5617-caa4-3ca8-4648c378c2f6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/svm: Write the correct %eip into
 the outgoing task
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxNDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8xMS8yMDE5
IDEzOjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjEuMTEuMjAxOSAyMzoxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+ICsgICAgICAgIC8qIEZhbGx0aHJvdWdoICovCj4+PiArICAgIGNh
c2UgMHg2MjogLyogYm91bmQgKi8KPj4gRG9lcyAiYm91bmQiIHJlYWxseSBiZWxvbmcgb24gdGhp
cyBsaXN0PyBJdCByYWlzaW5nICNCUiBpcyBsaWtlCj4+IGluc25zIHJhaXNpbmcgcmFuZG9tIG90
aGVyIGV4Y2VwdGlvbnMsIG5vdCBsaWtlIElOVE8gLyBJTlQzLAo+PiB3aGVyZSB0aGUgSURUIGRl
c2NyaXB0b3IgYWxzbyBoYXMgdG8gaGF2ZSBzdWl0YWJsZSBEUEwgZm9yIHRoZQo+PiBleGNlcHRp
b24gdG8gYWN0dWFsbHkgZ2V0IGRlbGl2ZXJlZCAocmF0aGVyIHRoYW4gI0dQKS4gSS5lLiBpdAo+
PiBzaG91bGRuJ3QgbWFrZSBpdCBoZXJlIGluIHRoZSBmaXJzdCBwbGFjZSwgZHVlIHRvIHRoZQo+
PiBYODZfRVZFTlRUWVBFX0hXX0VYQ0VQVElPTiBjaGVjayBpbiB0aGUgY2FsbGVyLgo+Pgo+PiBJ
T1cgaWYgImJvdW5kIiBuZWVkcyB0byBiZSBoZXJlLCB0aGVuIGFsbCBvdGhlcnMgbmVlZCB0byBi
ZSBhcwo+PiB3ZWxsLCB1bmxlc3MgdGhleSBjYW4ndCBjYXVzZSBhbnkgZXhjZXB0aW9uIGF0IGFs
bC4KPiAKPiBNb3JlIGV4cGVyaW1lbnRhdGlvbiByZXF1aXJlZC7CoCBCT1VORCBkb2Vzbid0IGFw
cGVhciB0byBiZSBzcGVjaWFsIGNhc2VkCj4gYnkgU1ZNLCBidXQgaXMgYnkgVlQteC7CoCBWVC14
IGhvd2V2ZXIgZG9lcyB0aHJvdyBpdCBpbiB0aGUgc2FtZSBjYXRlZ29yeQo+IGFzICNVRCwgYW5k
IGlkZW50aWZ5IGl0IHRvIGJlIGEgaGFyZHdhcmUgZXhjZXB0aW9uLgo+IAo+IEkgc3VzcGVjdCB5
b3UgYXJlIHJpZ2h0LCBhbmQgdCBkb2Vzbid0IHdhbnQgdG8gYmUgaGVyZS4KPiAKPj4+ICsgICAg
Y2FzZSAweDlhOiAvKiBjYWxsIChmYXIsIGFic29sdXRlKSAqLwo+Pj4gKyAgICBjYXNlIDB4Y2E6
IC8qIHJldCBpbW0xNiAoZmFyKSAqLwo+Pj4gKyAgICBjYXNlIDB4Y2I6IC8qIHJldCAoZmFyKSAq
Lwo+Pj4gKyAgICBjYXNlIDB4Y2M6IC8qIGludDMgKi8KPj4+ICsgICAgY2FzZSAweGNkOiAvKiBp
bnQgaW1tOCAqLwo+Pj4gKyAgICBjYXNlIDB4Y2U6IC8qIGludG8gKi8KPj4+ICsgICAgY2FzZSAw
eGNmOiAvKiBpcmV0ICovCj4+PiArICAgIGNhc2UgMHhlYTogLyogam1wIChmYXIsIGFic29sdXRl
KSAqLwo+Pj4gKyAgICBjYXNlIDB4ZjE6IC8qIGljZWJwICovCj4+IFNhbWUgcGVyaGFwcyBmb3Ig
SUNFQlAsIGFsYmVpdCBJJ20gbGVzcyBjZXJ0YWluIGhlcmUsIGFzIGl0cwo+PiBiZWhhdmlvciBp
cyB0b28gcG9vcmx5IGRvY3VtZW50ZWQgKGlmIGF0IGFsbCkuCj4gCj4gSUNFQlAncyAjREIgaXMg
YSB0cmFwLCBub3QgYSBmYXVsdCwgc28gaW5zdHJ1Y3Rpb24gbGVuZ3RoIGlzIGltcG9ydGFudC4K
CkhtbSwgdGhpcyBtYXkgcG9pbnQgYXQgYSBiaWdnZXIgaXNzdWUgdGhlbjogU2luZ2xlIHN0ZXAg
YW5kIGRhdGEKYnJlYWtwb2ludHMgYXJlIHRyYXBzLCB0b28uIEJ1dCBvZiBjb3Vyc2UgdGhleSBj
YW4gb2NjdXIgd2l0aAphcmJpdHJhcnkgaW5zbnMuIERvIHRoZWlyIGludGVyY2VwdHMgb2NjdXIg
d2l0aCBndWVzdCBSSVAgYWxyZWFkeQp1cGRhdGVkPyAoVGhleSB3b3VsZG4ndCBjdXJyZW50bHkg
bWFrZSBpdCBoZXJlIGFueXdheSBiZWNhdXNlIG9mCnRoZSBYODZfRVZFTlRUWVBFX0hXX0VYQ0VQ
VElPTiBjaGVjayBpbiB0aGUgY2FsbGVyLikgSWYgdGhleSBkbywKYXJlIHlvdSBzdXJlIElDRUJQ
LSNEQidzIGRvZXNuJ3Q/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
