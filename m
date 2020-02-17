Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A716140E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 14:58:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3gsf-0006VZ-J8; Mon, 17 Feb 2020 13:56:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3gse-0006VE-49
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 13:56:12 +0000
X-Inumbo-ID: 40ed9922-518d-11ea-bfed-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40ed9922-518d-11ea-bfed-12813bfff9fa;
 Mon, 17 Feb 2020 13:56:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABD2CAE62;
 Mon, 17 Feb 2020 13:56:10 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
 <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
 <20200217121704.GJ4679@Air-de-Roger>
 <ac1cc737-3fd2-a184-1df1-ce7279b23067@suse.com>
 <20200217124937.GK4679@Air-de-Roger>
 <bd84bab5-ce9f-a624-b00e-b05a07206dfd@suse.com>
 <20200217134728.GL4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e7003ac5-e8b0-5abb-f64c-777fcc28bc04@suse.com>
Date: Mon, 17 Feb 2020 14:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200217134728.GL4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAgMTQ6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MTcsIDIwMjAgYXQgMDI6MTc6MjNQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MTcuMDIuMjAgMTM6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBNb24sIEZlYiAx
NywgMjAyMCBhdCAwMTozMjo1OVBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9u
IDE3LjAyLjIwIDEzOjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBNb24sIEZl
YiAxNywgMjAyMCBhdCAwMToxMTo1OVBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+
Pj4gT24gMTcuMDIuMjAgMTI6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+PiBIaSBKdWVy
Z2VuLAo+Pj4+Pj4+Cj4+Pj4+Pj4gT24gMTcvMDIvMjAyMCAwNzoyMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPj4+Pj4+Pj4gK3ZvaWQgcmN1X2JhcnJpZXIodm9pZCkKPj4+Pj4+Pj4gICAgwqAgewo+
Pj4+Pj4+PiAtwqDCoMKgIGF0b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApOwo+Pj4+
Pj4+PiAtwqDCoMKgIHJldHVybiBzdG9wX21hY2hpbmVfcnVuKHJjdV9iYXJyaWVyX2FjdGlvbiwg
JmNwdV9jb3VudCwgTlJfQ1BVUyk7Cj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKCAhYXRvbWljX2NtcHhj
aGcoJmNwdV9jb3VudCwgMCwgbnVtX29ubGluZV9jcHVzKCkpICkKPj4+Pj4+Pgo+Pj4+Pj4+IFdo
YXQgZG9lcyBwcmV2ZW50IHRoZSBjcHVfb25saW5lX21hcCB0byBjaGFuZ2UgdW5kZXIgeW91ciBm
ZWV0Pwo+Pj4+Pj4+IFNob3VsZG4ndCB5b3UgZ3JhYiB0aGUgbG9jayB2aWEgZ2V0X2NwdV9tYXBz
KCk/Cj4+Pj4+Pgo+Pj4+Pj4gT2gsIGluZGVlZC4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIGluIHR1cm4g
d2lsbCByZXF1aXJlIGEgbW9kaWZpY2F0aW9uIG9mIHRoZSBsb2dpYyB0byBkZXRlY3QgcGFyYWxs
ZWwKPj4+Pj4+IGNhbGxzIG9uIG11bHRpcGxlIGNwdXMuCj4+Pj4+Cj4+Pj4+IElmIHlvdSBwaWNr
IG15IHBhdGNoIHRvIHR1cm4gdGhhdCBpbnRvIGEgcncgbG9jayB5b3Ugc2hvdWxkbid0IHdvcnJ5
Cj4+Pj4+IGFib3V0IHBhcmFsbGVsIGNhbGxzIEkgdGhpbmssIGJ1dCB0aGUgbG9jayBhY3F1aXNp
dGlvbiBjYW4gc3RpbGwgZmFpbAo+Pj4+PiBpZiB0aGVyZSdzIGEgQ1BVIHBsdWcvdW5wbHVnIGdv
aW5nIG9uOgo+Pj4+Pgo+Pj4+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVz
L2h0bWwveGVuLWRldmVsLzIwMjAtMDIvbXNnMDA5NDAuaHRtbAo+Pj4+Cj4+Pj4gVGhhbmtzLCBi
dXQgbGV0dGluZyByY3VfYmFycmllcigpIGZhaWwgaXMgYSBubyBnbywgc28gSSBzdGlsbCBuZWVk
IHRvCj4+Pj4gaGFuZGxlIHRoYXQgY2FzZSAoSSBtZWFuIHRoZSBjYXNlIGZhaWxpbmcgdG8gZ2V0
IHRoZSBsb2NrKS4gQW5kIGhhbmRsaW5nCj4+Pj4gb2YgcGFyYWxsZWwgY2FsbHMgaXMgbm90IG5l
ZWRlZCB0byBiZSBmdW5jdGlvbmFsIGNvcnJlY3QsIGJ1dCB0byBhdm9pZAo+Pj4+IG5vdCBuZWNl
c3NhcnkgY3B1IHN5bmNocm9uaXphdGlvbiAoZWFjaCBwYXJhbGxlbCBjYWxsIGRldGVjdGVkIGNh
biBqdXN0Cj4+Pj4gd2FpdCB1bnRpbCB0aGUgbWFzdGVyIGhhcyBmaW5pc2hlZCBhbmQgdGhlbiBy
ZXR1cm4pLgo+Pj4+Cj4+Pj4gQlRXIC0gVGhlIHJlY3Vyc2l2ZSBzcGlubG9jayB0b2RheSB3b3Vs
ZCBhbGxvdyBmb3IgZS5nLiByY3VfYmFycmllcigpIHRvCj4+Pj4gYmUgY2FsbGVkIGluc2lkZSBh
IENQVSBwbHVnL3VucGx1ZyBzZWN0aW9uLiBZb3VyIHJ3bG9jayBpcyByZW1vdmluZyB0aGF0Cj4+
Pj4gcG9zc2liaWxpdHkuIEFueSBjaGFuY2UgdGhhdCBjb3VsZCBiZSBoYW5kbGVkPwo+Pj4KPj4+
IFdoaWxlIHRoaXMgbWlnaHQgYmUgaW50ZXJlc3RpbmcgZm9yIHRoZSByY3Ugc3R1ZmYsIGl0IGNl
cnRhaW5seSBpc24ndAo+Pj4gZm9yIG90aGVyIHBpZWNlcyBhbHNvIHJlbHlpbmcgb24gdGhlIGNw
dSBtYXBzIGxvY2suCj4+Pgo+Pj4gSWU6IGdldF9jcHVfbWFwcyBtdXN0IGZhaWwgd2hlbiBjYWxs
ZWQgYnkgc2VuZF9JUElfbWFzayBpZiB0aGVyZSdzIGEKPj4+IENQVSBwbHVnL3VucGx1ZyBvcGVy
YXRpb24gZ29pbmcgb24sIGV2ZW4gaWYgaXQncyBvbiB0aGUgc2FtZSBwQ1BVCj4+PiB0aGF0J3Mg
aG9sZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlLgo+Pgo+PiBTdXJlPyBIb3cgaXMgY3B1X2Rv
d24oKSB3b3JraW5nIHRoZW4/Cj4gCj4gc2VuZF9JUElfbWFzayBmYWlsaW5nIHRvIGFjcXVpcmUg
dGhlIGNwdSBtYXBzIGxvY2sgcHJldmVudHMgaXQgZnJvbQo+IHVzaW5nIHRoZSBBUElDIHNob3J0
aGFuZCwgd2hpY2ggaXMgd2hhdCB3ZSB3YW50IGluIHRoYXQgY2FzZS4KPiAKPj4gSXQgaXMgY2Fs
bGluZyBzdG9wX21hY2hpbmVfcnVuKCkKPj4gd2hpY2ggaXMgdXNpbmcgc2VuZF9JUElfbWFzaygp
Li4uCj4gCj4gWGVuIHNob3VsZCBhdm9pZCB1c2luZyB0aGUgQVBJQyBzaG9ydGhhbmQgaW4gdGhh
dCBjYXNlLCB3aGljaCBJIGRvbid0Cj4gdGhpbmsgaXQncyBoYXBwZW5pbmcgbm93LCBhcyB0aGUg
bG9jayBpcyByZWN1cnNpdmUuCgpJbiBmYWN0IHRoZSBjb2RlIGFyZWEgd2hlcmUgdGhpcyBpcyB0
cnVlIGlzIG11Y2ggc21hbGxlciB0aGFuIHRoYXQKcHJvdGVjdGVkIGJ5IHRoZSBsb2NrLgoKQmFz
aWNhbGx5IG9ubHkgX19jcHVfZGlzYWJsZSgpIGFuZCBfX2NwdV91cCgpIChvbiB4ODYpIGFyZSBj
cml0aWNhbCBpbgp0aGlzIHJlZ2FyZC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
