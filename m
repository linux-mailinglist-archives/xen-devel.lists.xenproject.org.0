Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F451182E5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:57:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iebIa-0007CH-Rx; Tue, 10 Dec 2019 08:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iebIZ-0007CC-8J
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:55:15 +0000
X-Inumbo-ID: c7585478-1b2a-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7585478-1b2a-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 08:55:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3E92AE5E;
 Tue, 10 Dec 2019 08:55:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-6-andrew.cooper3@citrix.com>
 <60ae5d0a-8290-42ed-74e7-894515c5dea3@suse.com>
 <300fe43e-fbe9-b0e0-1ac8-000e2a55f276@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7a1c0f6b-6f41-8a1f-7170-9ea235bf1bc9@suse.com>
Date: Tue, 10 Dec 2019 09:55:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <300fe43e-fbe9-b0e0-1ac8-000e2a55f276@citrix.com>
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

T24gMDkuMTIuMjAxOSAxODo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8xMi8yMDE5
IDE2OjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFNvbWUgaHlwZXJjYWxscyB0YXNrbGV0cyB3YW50IHRvIGNyZWF0
ZSBhIGNvbnRpbnVhdGlvbiwgcmF0aGVyIHRoYW4gZmFpbCB0aGUKPj4+IGh5cGVyY2FsbCB3aXRo
IGEgaGFyZCBlcnJvci4gIEJ5IHRoZSB0aW1lIHRoZSB0YXNrbGV0IGlzIGV4ZWN1dGluZywgaXQg
aXMgdG9vCj4+PiBsYXRlIHRvIGNyZWF0ZSB0aGUgY29udGludWF0aW9uLCBhbmQgZXZlbiBjb250
aW51ZV9oeXBlcmNhbGxfb25fY3B1KCkgZG9lc24ndAo+Pj4gaGF2ZSBlbm91Z2ggc3RhdGUgdG8g
ZG8gaXQgY29ycmVjdGx5Lgo+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIHF1aXRlIG5pY2UgaWYgeW91
IG1hZGUgY2xlYXIgd2hhdCBwaWVjZSBvZiBzdGF0ZQo+PiBpdCBpcyBhY3R1YWxseSBtaXNzaW5n
LiBUbyBiZSBob25lc3QsIEkgZG9uJ3QgcmVjYWxsIGFueW1vcmUuCj4gCj4gSG93IHRvIGNvcnJl
Y3RseSBtdXRhdGUgdGhlIHJlZ2lzdGVycyBhbmQvb3IgbWVtb3J5ICh3aGljaCBpcyBzcGVjaWZp
Ywo+IHRvIHRoZSBoeXBlcmNhbGwgc3Vib3AgaW4gc29tZSBjYXNlcykuCgpXZWxsLCBpbi1tZW1v
cnkgYXJndW1lbnRzIGNhbiBiZSBhY2Nlc3NlZCBhcyBsb25nIGFzIHRoZSBtYXBwaW5nIGlzCnRo
ZSByaWdodCBvbmUgKHdoaWNoIGl0IHR5cGljYWxseSB3b3VsZG4ndCBiZSBpbnNpZGUgYSB0YXNr
bGV0KS4gRG8KZXhpc3RpbmcgY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpIHVzZXJzIG5lZWQg
dGhpcz8gTG9va2luZyBvdmVyCnBhdGNoIDQgYWdhaW4sIEkgZGlkbid0IHRoaW5rIHNvLiAoV2hp
Y2ggaXNuJ3QgdG8gc2F5IHRoYXQgcmVtb3ZpbmcKdGhlIGxhdGVudCBpc3N1ZSBpcyBub3QgYSBn
b29kIHRoaW5nLikKCkluLXJlZ2lzdGVyIHZhbHVlcyBjYW4gYmUgY2hhbmdlZCBhcyBsb25nIGFz
IHRoZSByZXNwZWN0aXZlIGV4aXQKcGF0aCB3aWxsIHN1aXRhYmx5IHBpY2sgdXAgdGhlIHZhbHVl
LCB3aGljaCBJIHRob3VnaHQgd2FzIGFsd2F5cwp0aGUgY2FzZS4KCkhlbmNlIEknbSBhZnJhaWQg
eW91ciBzaW5nbGUgcmVwbHkgc2VudGVuY2UgZGlkbid0IHJlYWxseSBjbGFyaWZ5Cm1hdHRlcnMu
IEknbSBzb3JyeSBpZiB0aGlzIGlzIGp1c3QgYmVjYXVzZSBvZiBtZSBiZWluZyBkZW5zZS4KCj4+
PiBUaGVyZSBpcyBvbmUgUkZDIHBvaW50LiAgVGhlIHN0YXRlbWVudCBpbiB0aGUgaGVhZGVyIGZp
bGUgb2YgIklmIHRoaXMgZnVuY3Rpb24KPj4+IHJldHVybnMgMCB0aGVuIHRoZSBmdW5jdGlvbiBp
cyBndWFyYW50ZWVkIHRvIHJ1biBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUuIgo+Pj4gd2Fz
IG5ldmVyIHRydWUuICBJbiB0aGUgY2FzZSBvZiBhIENQVSBtaXNzLCB0aGUgaHlwZXJjYWxsIHdv
dWxkIGJlIGJsaW5kbHkKPj4+IGZhaWxlZCB3aXRoIC1FSU5WQUwuCj4+ICJXYXMgbmV2ZXIgdHJ1
ZSIgc291bmRzIGxpa2UgImNvbXBsZXRlbHkgYnJva2VuIi4gQWZhaWN0IGl0IHdhcyB0cnVlCj4+
IGluIGFsbCBjYXNlcyBleGNlcHQgdGhlIHB1cmVseSBoeXBvdGhldGljYWwgb25lIG9mIHRoZSB0
YXNrbGV0IGVuZGluZwo+PiB1cCBleGVjdXRpbmcgb24gdGhlIHdyb25nIENQVS4KPiAKPiBUaGVy
ZSBpcyBub3RoaW5nIGh5cG90aGV0aWNhbCBhYm91dCBpdC7CoCBJdCByZWFsbHkgd2lsbCBnbyB3
cm9uZyB3aGVuIGEKPiBDUFUgZ2V0cyBvZmZsaW5lZC4KCkFjY2VwdGVkLCBidXQgaXQncyBzdGls
bCBub3QgbGlrZSAiY29tcGxldGVseSBicm9rZW4iLiBJIHdvdWxkIGV2ZW4Kc3VwcG9zZSB0aGUg
Y2FzZSB3YXNuJ3QgY29uc2lkZXJlZCB3aGVuIENQVSBvZmZsaW5pbmcgc3VwcG9ydCB3YXMKaW50
cm9kdWNlZCwgbm90IHdoZW4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpIGNhbWUgaW50byBl
eGlzdGVuY2UKKHdoaWNoIHByZXN1bWFibHkgaXMgd2hlbiB0aGUgY29tbWVudCB3YXMgd3JpdHRl
bikuCgpBbnl3YXkgLSB5ZXMsIEkgYWdyZWUgdGhpcyBpcyBhIGZhaXIgc29sdXRpb24gdG8gdGhl
IGlzc3VlIGF0IGhhbmQuCgo+Pj4gVGhlIGN1cnJlbnQgYmVoYXZpb3VyIHdpdGggdGhpcyBwYXRj
aCBpcyB0byBub3QgY2FuY2VsIHRoZSBjb250aW51YXRpb24sIHdoaWNoCj4+PiBJIHRoaW5rIGlz
IGxlc3MgYmFkLCBidXQgc3RpbGwgbm90IGdyZWF0LiAgVGhvdWdodHM/Cj4+IFdlbGwsIHRoYXQn
cyBhIGd1ZXN0IGxpdmUgbG9jayB0aGVuIGFpdWkuCj4gCj4gSXQgc2ltcGx5IGNvbnRpbnVlcyBh
Z2Fpbi7CoCBJdCB3aWxsIGxpdmVsb2NrIG9ubHkgaWYgdGhlIGh5cGVyY2FsbCBwaWNrcwo+IGEg
YmFkIGNwdSBhbGwgdGhlIHRpbWUuCgpPaCwgSSBzZWUgSSB3YXMgbWlzbGVhZCBieSBjb250aW51
ZV9oeXBlcmNhbGxfdGFza2xldF9oYW5kbGVyKCkgbm90CnVwZGF0aW5nIGluZm8tPmNwdSwgbm90
IHBheWluZyBhdHRlbnRpb24gdG8gaXQgYWN0dWFsbHkgZnJlZWluZyBpbmZvLgpQbHVzIGEgY3J1
Y2lhbCBhc3BlY3QgbG9va3MgdG8gYmUgdGhhdCB0aGVyZSBhcmUgbm8gImNoYWluZWQiIHVzZXMg
b2YKY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpIGFueW1vcmUgKHRoZSBtaWNyb2NvZGUgbG9h
ZGluZyBvbmUgYmVpbmcKZ29uZSBub3cpIC0gYWZhaWN0IGFueSBzdWNoIHdvdWxkbid0IGd1YXJh
bnRlZSBmb3J3YXJkIHByb2dyZXNzIHdpdGgKdGhpcyBuZXcgbW9kZWwgKHdpdGhvdXQgcmVjb3Jk
aW5nIHNvbWV3aGVyZSB3aGljaCBDUFVzIGhhZCBiZWVuIGRlYWx0CndpdGggYWxyZWFkeSkuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
