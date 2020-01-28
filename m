Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFC14B4AE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:07:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwQYD-0002ZJ-JN; Tue, 28 Jan 2020 13:05:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwQYB-0002ZE-KN
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:05:03 +0000
X-Inumbo-ID: cb51bedc-41ce-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb51bedc-41ce-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 13:05:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28588AD45;
 Tue, 28 Jan 2020 13:05:01 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <cover.1579727989.git.elnikety@amazon.com>
 <f997f1b3a7d515392c15f518ce886710068bb4ef.1579727989.git.elnikety@amazon.com>
 <5a5fb1af-6405-9052-6f6b-0cc650f1e424@suse.com>
 <54470337-d6ba-64a4-e873-5954db070278@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66b2060b-d966-b699-053b-967d1b1edfac@suse.com>
Date: Tue, 28 Jan 2020 14:05:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <54470337-d6ba-64a4-e873-5954db070278@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/microcode: Improve parsing for
 ucode=
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAyMDozNCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMjMuMDEuMjAg
MTE6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyMi4wMS4yMDIwIDIzOjMwLCBFc2xhbSBF
bG5pa2V0eSB3cm90ZToKPj4+IERlY291cGxlIHRoZSBtaWNyb2NvZGUgaW5kZXhpbmcgbWVjaGFu
aXNtIHdoZW4gdXNpbmcgR1JVQiB0byB0aGF0Cj4+PiB3aGVuIHVzaW5nIEVGSS4gVGhpcyBhbGxv
d3MgdXMgdG8gYXZvaWQgdGhlICJ1bnNwZWNpZmllZCBlZmZlY3QiIG9mCj4+PiB1c2luZyBgPGlu
dGVnZXI+YCB3aGVuIGJvb3RpbmcgdmlhIEVGSS4KPj4KPj4gUGVyc29uYWxseSBJJ2QgcHJlZmVy
IHVzIHRvIGNvbnRpbnVlIGNhbGwgdGhpcyB1bnNwZWNpZmllZC4gSXQKPj4gc2ltcGx5IHNob3Vs
ZG4ndCBiZSB1c2VkLiBQZW9wbGUgc2hvdWxkbid0IHJlbHkgb24gaXQgZ2V0dGluZwo+PiBpZ25v
cmVkLiAoSWlyYywgZGVzcGl0ZSB0aGlzIGJlaW5nIHYxLCB5b3UgaGFkIHByZXZpb3VzbHkKPj4g
c3VibWl0dGVkIGEgcGF0Y2ggdG8gdGhpcyBlZmZlY3QsIHdpdGggbWUgcmVwbGF5aW5nIGFib3V0
IHRoZQo+PiBzYW1lLikKPj4KPj4+IFdpdGggdGhhdCwgWGVuIGNhbiBleHBsaWNpdGx5IGlnbm9y
ZSB0aGF0IG9wdGlvbiB3aGVuIHVzaW5nIEVGSS4KPj4KPj4gRG9uJ3Qgd2UgZG8gc28gYWxyZWFk
eSwgYnkgd2F5IG9mIHRoZSAiaWYgKCAhdWNvZGVfbW9kX2ZvcmNlZCApIgo+PiB5b3UgZGVsZXRl
Pwo+Pgo+IAo+IE5vdCBxdWl0ZS4gSWYgY2ZnLmVmaSBkb2VzIG5vdCBzcGVjaWZ5ICJ1Y29kZT08
ZmlsZW5hbWU+IiwgdGhlbiBhIAo+IGB1Y29kZT08aW50ZWdlcj5gIGZyb20gdGhlIGNvbW1hbmRs
aW5lIGdldHMgcGFyc2VkLCByZXN1bHRpbmcgaW4gdGhlIAo+ICJ1bnNwZWNpZmllZCIgYmVoYXZp
b3VyLiBIZXJlLCB0aGUgdWNvZGVfbW9kX2lkeCB3aWxsIGhvbGQgdGhlIDxpbnRlZ2VyPiAKPiB3
aGljaCB3aWxsIGJlIHVzZWQgYXMgaW5kZXggaW50byB0aGUgbW9kdWxlcyBwcmVwYXJlZCBpbiB3
aGF0ZXZlciBvcmRlciAKPiB0aGUgZWZpL2Jvb3QuYyBkZWZpbmVzLgoKSSBndWVzcyBJIHNlZSBu
b3cgd2hhdCB5b3UgbWVhbiwgYnV0IEknbSBzdGlsbCB1bmNvbnZpbmNlZCBpdCBuZWVkcwoiZml4
aW5nIi4gQWZ0ZXIgYWxsIC0gaG93IGlzIHRoaXMgZGlmZmVyZW50IGZyb20gInVjb2RlPTxOPiIg
dXNlZAp3aXRoIHRoZSB3cm9uZyBudW1iZXIgaW4gYSB4ZW4uZ3ogYm9vdD8gSW4gZmFjdCBJJ20g
YWxzbyB1bmNvbnZpbmNlZAp0aGUgYmVoYXZpb3Igb2YgbWljcm9jb2RlX2dyYWJfbW9kdWxlKCkg
dG8gZmFsbCBiYWNrIGFzIGlmCiJ1Y29kZT1zY2FuIiB3YXMgc3BlY2lmaWVkLCBpbiBjYXNlIHNv
bWV0aGluZyBib2d1cyB3YXMgZm91bmQgd2l0aAp0aGUgc3BlY2lmaWVkIG51bWJlci4KCj4+PiAt
LS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+ICsrKyBiL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+Pj4gQEAgLTIxNDcsOSArMjE0Nyw5IEBAIGZvciB1
cGRhdGluZyBDUFUgbWljcmNvZGUuIFdoZW4gbmVnYXRpdmUsIGNvdW50aW5nIHN0YXJ0cyBhdCB0
aGUgZW5kIG9mCj4+PiAgIHRoZSBtb2R1bGVzIGluIHRoZSBHclVCIGVudHJ5IChzbyB3aXRoIHRo
ZSBibG9iIGNvbW1vbmx5IGJlaW5nIGxhc3QsCj4+PiAgIG9uZSBjb3VsZCBzcGVjaWZ5IGB1Y29k
ZT0tMWApLiBOb3RlIHRoYXQgdGhlIHZhbHVlIG9mIHplcm8gaXMgbm90IHZhbGlkCj4+PiAgIGhl
cmUgKGVudHJ5IHplcm8sIGkuZS4gdGhlIGZpcnN0IG1vZHVsZSwgaXMgYWx3YXlzIHRoZSBEb20w
IGtlcm5lbAo+Pj4gLWltYWdlKS4gTm90ZSBmdXJ0aGVyIHRoYXQgdXNlIG9mIHRoaXMgb3B0aW9u
IGhhcyBhbiB1bnNwZWNpZmllZCBlZmZlY3QKPj4+IC13aGVuIHVzZWQgd2l0aCB4ZW4uZWZpICh0
aGVyZSB0aGUgY29uY2VwdCBvZiBtb2R1bGVzIGRvZXNuJ3QgZXhpc3QsIGFuZAo+Pj4gLXRoZSBi
bG9iIGdldHMgc3BlY2lmaWVkIHZpYSB0aGUgYHVjb2RlPTxmaWxlbmFtZT5gIGNvbmZpZyBmaWxl
L3NlY3Rpb24KPj4+ICtpbWFnZSkuIFRoaXMgb3B0aW9uIHNob3VsZCBiZSB1c2VkIG9ubHkgd2l0
aCBsZWdhY3kgYm9vdCwgYXMgaXQgaXMgZXhwbGljaXRseQo+Pj4gK2lnbm9yZWQgaW4gRUZJIGJv
b3QuIFdoZW4gYm9vdGluZyB2aWEgRUZJLCB0aGUgbWljcm9jb2RlIHVwZGF0ZSBibG9iIGZvcgo+
Pj4gK2Vhcmx5IGxvYWRpbmcgY2FuIGJlIHNwZWNpZmllZCB2aWEgdGhlIGB1Y29kZT08ZmlsZW5h
bWU+YCBjb25maWcgZmlsZS9zZWN0aW9uCj4+PiAgIGVudHJ5OyBzZWUgW0VGSSBjb25maWd1cmF0
aW9uIGZpbGUgZGVzY3JpcHRpb25dKGVmaS5odG1sKSkuCj4+Cj4+IEp1c3QgbGlrZSBpbiBwYXRj
aCAxLCBwbGVhc2UgZGlzdGluZ3Vpc2ggIkVGSSBib290IiBpbiBnZW5lcmFsIGZyb20KPj4gInVz
ZSBvZiB4ZW4uZWZpIiAocmVsZXZhbnQgaGVyZSBvZiBjb3Vyc2Ugb25seSBpZiBpbmRlZWQgd2Ug
d2VudAo+PiB3aXRoIHRoaXMgcGF0Y2gpLgo+Pgo+IFlvdSBoYXZlIG1lbnRpb25lZCB0aGlzIHZl
cnkgc2FtZSByZW1hcmsgb24gdGhlIG90aGVyIHBhdGNoIHRvby4gTXkgCj4gdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0ICJFRkkgYm9vdCIgbWF5IGJlIGFtYmlndW91cyBiZXR3ZWVuIChhKSB3ZSBhcmUg
Cj4gYWN0dWFsbHkgYm9vdGluZyBmcm9tIHhlbi5lZmkgb3IgKGIpIGEgc3lzdGVtIHdpdGggRUZJ
IHN1cHBvcnQgKGFuZCB0aGUgCj4gbGF0dGVyIG1heSBzdGlsbCBiZSBmYWxsaW5nIG9udG8gZ3J1
YiBmb3IgYm9vdGluZykuIExldCBtZSBrbm93IGlmIAo+IHRoYXQncyBub3QgYWN0dWFsbHkgd2hh
dCB5b3VyIHJlbWFyayBpcyBhYm91dC4KCldlbGwsIGJvb3RpbmcgZnJvbSBFRkkgY2FuIGJlIGVp
dGhlciB2aWEgeGVuLmVmaSwgb3IgdmlhIHhlbi5neidzCmVmaV9tdWx0aWJvb3QyKCkga2luZC1v
Zi1lbnRyeS1wb2ludC4gWWV0IHRoZSBkaXN0aW5jdGlvbiBkaXNjdXNzZWQKaXMgc3RyaWN0bHkg
YmV0d2VlbiB4ZW4uZWZpIGFuZCB4ZW4uZ3ouCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
