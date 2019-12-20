Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C409127EE9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 16:01:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJl4-0001cU-07; Fri, 20 Dec 2019 15:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJl1-0001Xo-PL
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:59:59 +0000
X-Inumbo-ID: 60fa0a9a-2339-11ea-9378-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60fa0a9a-2339-11ea-9378-12813bfff9fa;
 Fri, 20 Dec 2019 14:59:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 709B4B2B5;
 Fri, 20 Dec 2019 14:59:54 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
 <8be5ebf6-c710-e1de-12af-f87137b69c44@suse.com>
 <bcf40a51-eed4-a48d-8f7e-e3b10df504cd@citrix.com>
 <b093c3f9-f247-c8ad-ca6b-b2bd25dd2bce@citrix.com>
 <e17dddf1-020e-63ae-4136-6b2a9fc703d3@suse.com>
 <e88e6746-c544-d53d-7251-0a3faf905f77@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bac4bd7d-4985-9dfe-c644-270b288c435f@suse.com>
Date: Fri, 20 Dec 2019 16:00:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e88e6746-c544-d53d-7251-0a3faf905f77@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] x86/mm: mod_l<N>_entry() have no need
 to use __copy_from_user()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNTo1NCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi8yMC8xOSAy
OjUyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjAuMTIuMjAxOSAxNTo0NywgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDEyLzIwLzE5IDI6NDIgUE0sIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4+Pj4gT24gMjAvMTIvMjAxOSAxNDoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IG1v
ZF9sMV9lbnRyeSgpJ3MgbmVlZCB0byBkbyBzbyB3ZW50IGF3YXkgd2l0aCBjb21taXQgMmQwNTU3
YzVjYiAoIng4NjoKPj4+Pj4gRm9sZCBwYWdlX2luZm8gbG9jayBpbnRvIHR5cGVfaW5mbyIpLCBh
bmQgdGhlIG90aGVyIHRocmVlIG5ldmVyIGhhZCBzdWNoCj4+Pj4+IGEgbmVlZCwgYXQgbGVhc3Qg
Z29pbmcgYmFjayBhcyBmYXIgYXMgMy4yLjAuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Pgo+Pj4+IFRoZXNlIHByZXN1bWFibHkg
d2FudCBBQ0NFU1NfT05DRSgpIHRvIGF2b2lkIGludHJvZHVjaW5nIHJlcGVhdGVkIHJlYWQKPj4+
PiB2dWxuZXJhYmlsaXRpZXM/wqAgV2hpbGUgdGhlIG1hcHBpbmdzIG1pZ2h0IGJlIHNhZmUsIHRo
ZXkgc3RpbGwgcG9pbnQgdG8KPj4+PiBsaXZlIGd1ZXN0IGRhdGEuCj4+Pgo+Pj4gVGhlIEwxIGl0
c2VsZiBzaG91bGQgYmUgbWFwcGVkIHJlYWQtb25seSBieSB0aGUgZ3Vlc3QsIGFuZCBsb2NrZWQg
YXQKPj4+IHRoaXMgcG9pbnQsIG5vPwo+Pgo+PiBUcnVlLCBidXQgSSB0aGluayBpdCB3b24ndCBo
dXJ0IHRvIHVzZSBBQ0NFU1NfT05DRSgpIG5ldmVydGhlbGVzcwo+PiAtIGl0IG1ha2VzIHRoZSBj
b2RlIG1vcmUgb2J2aW91c2x5IHNhZmUgaW5kZXBlbmRlbnQgb2YgYW55IGxvY2tpbmcKPj4ga25v
d2xlZGdlLgo+IAo+IEJ1dCB0aGF0IG1pZ2h0IGdpdmUgc29tZW9uZSB0aGUgaWRlYSB0aGF0IHRo
YXQgaXQgKndhcyogc2FmZSB0byBkbyB0aGUKPiB0eXBlIGFkanVzdG1lbnRzIHdpdGhvdXQgdGhl
IHBhZ2UgYmVpbmcgbG9ja2VkLCB3aGljaCBpdCBjZXJ0YWlubHkgaXNuJ3QuCgpJdCBpc24ndCBp
biB0aGUgY29tbW9uIGNhc2UsIGJ1dCB3ZSBjb3VsZG4ndCwgZm9yIGV4YW1wbGUsIHB1dAppbiBB
U1NFUlQoKXMgaW4gcGxhY2Ugb2YgdXNpbmcgQUNDRVNTX09OQ0UoKSwgYXMgbmV3X2d1ZXN0X2Ny
MygpJ3MKdXNlIG9mIG1vZF9sNF9lbnRyeSgpIGlzIHdpdGhvdXQgbG9jaywgeWV0IHN0aWxsIHNh
ZmUgKGJlY2F1c2Ugb2YKYWN0aW5nIG9uIHRoZSBvdGhlcndpc2UgaW1tdXRhYmxlIEw0IHRhYmxl
IG9mIGEgMzItYml0IGd1ZXN0KS4KRkFPRCB0aGlzIGNvZGUgcGF0aCBhbHNvIGRvZXNuJ3QgbmVl
ZCB0aGUgQUNDRVNTX09OQ0UoKSAoZm9yIHRoZQpzYW1lIHJlYXNvbikuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
