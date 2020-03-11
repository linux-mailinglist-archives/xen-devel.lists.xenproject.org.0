Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C02181053
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 07:03:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBuQc-0002aD-7Y; Wed, 11 Mar 2020 06:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBuQa-0002a8-UY
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 06:01:12 +0000
X-Inumbo-ID: b57fa9ce-635d-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b57fa9ce-635d-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 06:01:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3222AE65;
 Wed, 11 Mar 2020 06:01:10 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-3-jgross@suse.com>
 <758b6a3a-a08e-4b83-9523-0fcb02f705a7@suse.com>
 <7f1d759e-2a35-f7ab-7d71-104420192fb6@suse.com>
 <c44f82ae-e5b4-d58f-5deb-2f5c6d6175bd@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <45abf6f9-6d99-d636-4e4c-ddc428e3c3d3@suse.com>
Date: Wed, 11 Mar 2020 07:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c44f82ae-e5b4-d58f-5deb-2f5c6d6175bd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAgMTc6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjAzLjIwMjAgMTc6
MzQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEwLjAzLjIwIDE3OjI5LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDEwLjAzLjIwMjAgMDg6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gK3ZvaWQgcmN1X2JhcnJpZXIodm9pZCkKPj4+PiAgICB7Cj4+Pj4gLSAgICBhdG9taWNfdCBj
cHVfY291bnQgPSBBVE9NSUNfSU5JVCgwKTsKPj4+PiAtICAgIHJldHVybiBzdG9wX21hY2hpbmVf
cnVuKHJjdV9iYXJyaWVyX2FjdGlvbiwgJmNwdV9jb3VudCwgTlJfQ1BVUyk7Cj4+Pj4gKyAgICB1
bnNpZ25lZCBpbnQgbl9jcHVzOwo+Pj4+ICsKPj4+PiArICAgIHdoaWxlICggIWdldF9jcHVfbWFw
cygpICkKPj4+PiArICAgIHsKPj4+PiArICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMo
KTsKPj4+PiArICAgICAgICBpZiAoICFhdG9taWNfcmVhZCgmY3B1X2NvdW50KSApCj4+Pj4gKyAg
ICAgICAgICAgIHJldHVybjsKPj4+PiArCj4+Pj4gKyAgICAgICAgY3B1X3JlbGF4KCk7Cj4+Pj4g
KyAgICB9Cj4+Pj4gKwo+Pj4+ICsgICAgbl9jcHVzID0gbnVtX29ubGluZV9jcHVzKCk7Cj4+Pj4g
Kwo+Pj4+ICsgICAgaWYgKCBhdG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBuX2NwdXMpID09
IDAgKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAgICAgIGF0b21pY19hZGQobl9jcHVzLCAmZG9uZV9j
b3VudCk7Cj4+Pj4gKyAgICAgICAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKCZjcHVfb25saW5lX21h
cCwgUkNVX1NPRlRJUlEpOwo+Pj4+ICsgICAgfQo+Pj4+ICsKPj4+PiArICAgIHdoaWxlICggYXRv
bWljX3JlYWQoJmRvbmVfY291bnQpICkKPj4+Cj4+PiBEb24ndCB5b3UgbGVhdmUgYSB3aW5kb3cg
Zm9yIHJhY2VzIGhlcmUsIGluIHRoYXQgZG9uZV9jb3VudAo+Pj4gZ2V0cyBzZXQgdG8gbm9uLXpl
cm8gb25seSBhZnRlciBzZXR0aW5nIGNwdV9jb3VudD8gQSBDUFUKPj4+IGxvc2luZyB0aGUgY21w
eGNoZyBhdHRlbXB0IGFib3ZlIG1heSBvYnNlcnZlIGRvbmVfY291bnQKPj4+IHN0aWxsIGJlaW5n
IHplcm8sIGFuZCBoZW5jZSBleGl0IHdpdGhvdXQgd2FpdGluZyBmb3IgdGhlCj4+PiBjb3VudCB0
byBhY3R1YWxseSBfZHJvcF8gdG8gemVyby4KPj4KPj4gVGhpcyBjYW4gb25seSBiZSBhIGNwdSBu
b3QgaGF2aW5nIGpvaW5lZCB0aGUgYmFycmllciBoYW5kbGluZywgc28gaXQKPj4gd2lsbCBkbyB0
aGF0IGxhdGVyLgo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kIC0gaWYgdHdvIENQ
VXMgaW5kZXBlbmRlbnRseSBjYWxsCj4gcmN1X2JhcnJpZXIoKSwgbmVpdGhlciBzaG91bGQgZmFs
bCB0aHJvdWdoIGhlcmUgd2l0aG91dCB3YWl0aW5nCj4gYXQgYWxsLCBJIHdvdWxkIHRoaW5rPwoK
T2gsIGdvb2QgY2F0Y2ghCgpJIGhhdmUgdGhvdWdodCBtb3JlIGFib3V0IHRoaXMgcHJvYmxlbSBh
bmQgSSB0aGluayB1c2luZyBjb3VudGVycyBvbmx5CmZvciBkb2luZyByZW5kZXp2b3VzIGFjY291
bnRpbmcgaXMgcmF0aGVyIHJpc2t5LiBJJ2xsIGhhdmUgYSB0cnkgdXNpbmcKYSBjcHVtYXNrIGlu
c3RlYWQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
