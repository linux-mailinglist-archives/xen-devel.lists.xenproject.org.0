Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575CA161326
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 14:20:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3gH9-0002mJ-K9; Mon, 17 Feb 2020 13:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3gH8-0002m7-MG
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 13:17:26 +0000
X-Inumbo-ID: d68f1b28-5187-11ea-bfe7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d68f1b28-5187-11ea-bfe7-12813bfff9fa;
 Mon, 17 Feb 2020 13:17:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71FB8AB8F;
 Mon, 17 Feb 2020 13:17:24 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <0e8018be-7551-9bdf-fc6a-fb388579ff18@xen.org>
 <4f29d05c-db7d-c1da-2fd9-8eed7dcdc587@suse.com>
 <20200217121704.GJ4679@Air-de-Roger>
 <ac1cc737-3fd2-a184-1df1-ce7279b23067@suse.com>
 <20200217124937.GK4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bd84bab5-ce9f-a624-b00e-b05a07206dfd@suse.com>
Date: Mon, 17 Feb 2020 14:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200217124937.GK4679@Air-de-Roger>
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

T24gMTcuMDIuMjAgMTM6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MTcsIDIwMjAgYXQgMDE6MzI6NTlQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MTcuMDIuMjAgMTM6MTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+PiBPbiBNb24sIEZlYiAx
NywgMjAyMCBhdCAwMToxMTo1OVBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+IE9u
IDE3LjAyLjIwIDEyOjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+IEhpIEp1ZXJnZW4sCj4+
Pj4+Cj4+Pj4+IE9uIDE3LzAyLzIwMjAgMDc6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+
PiArdm9pZCByY3VfYmFycmllcih2b2lkKQo+Pj4+Pj4gICDCoCB7Cj4+Pj4+PiAtwqDCoMKgIGF0
b21pY190IGNwdV9jb3VudCA9IEFUT01JQ19JTklUKDApOwo+Pj4+Pj4gLcKgwqDCoCByZXR1cm4g
c3RvcF9tYWNoaW5lX3J1bihyY3VfYmFycmllcl9hY3Rpb24sICZjcHVfY291bnQsIE5SX0NQVVMp
Owo+Pj4+Pj4gK8KgwqDCoCBpZiAoICFhdG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBudW1f
b25saW5lX2NwdXMoKSkgKQo+Pj4+Pgo+Pj4+PiBXaGF0IGRvZXMgcHJldmVudCB0aGUgY3B1X29u
bGluZV9tYXAgdG8gY2hhbmdlIHVuZGVyIHlvdXIgZmVldD8KPj4+Pj4gU2hvdWxkbid0IHlvdSBn
cmFiIHRoZSBsb2NrIHZpYSBnZXRfY3B1X21hcHMoKT8KPj4+Pgo+Pj4+IE9oLCBpbmRlZWQuCj4+
Pj4KPj4+PiBUaGlzIGluIHR1cm4gd2lsbCByZXF1aXJlIGEgbW9kaWZpY2F0aW9uIG9mIHRoZSBs
b2dpYyB0byBkZXRlY3QgcGFyYWxsZWwKPj4+PiBjYWxscyBvbiBtdWx0aXBsZSBjcHVzLgo+Pj4K
Pj4+IElmIHlvdSBwaWNrIG15IHBhdGNoIHRvIHR1cm4gdGhhdCBpbnRvIGEgcncgbG9jayB5b3Ug
c2hvdWxkbid0IHdvcnJ5Cj4+PiBhYm91dCBwYXJhbGxlbCBjYWxscyBJIHRoaW5rLCBidXQgdGhl
IGxvY2sgYWNxdWlzaXRpb24gY2FuIHN0aWxsIGZhaWwKPj4+IGlmIHRoZXJlJ3MgYSBDUFUgcGx1
Zy91bnBsdWcgZ29pbmcgb246Cj4+Pgo+Pj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLTAyL21zZzAwOTQwLmh0bWwKPj4KPj4gVGhhbmtz
LCBidXQgbGV0dGluZyByY3VfYmFycmllcigpIGZhaWwgaXMgYSBubyBnbywgc28gSSBzdGlsbCBu
ZWVkIHRvCj4+IGhhbmRsZSB0aGF0IGNhc2UgKEkgbWVhbiB0aGUgY2FzZSBmYWlsaW5nIHRvIGdl
dCB0aGUgbG9jaykuIEFuZCBoYW5kbGluZwo+PiBvZiBwYXJhbGxlbCBjYWxscyBpcyBub3QgbmVl
ZGVkIHRvIGJlIGZ1bmN0aW9uYWwgY29ycmVjdCwgYnV0IHRvIGF2b2lkCj4+IG5vdCBuZWNlc3Nh
cnkgY3B1IHN5bmNocm9uaXphdGlvbiAoZWFjaCBwYXJhbGxlbCBjYWxsIGRldGVjdGVkIGNhbiBq
dXN0Cj4+IHdhaXQgdW50aWwgdGhlIG1hc3RlciBoYXMgZmluaXNoZWQgYW5kIHRoZW4gcmV0dXJu
KS4KPj4KPj4gQlRXIC0gVGhlIHJlY3Vyc2l2ZSBzcGlubG9jayB0b2RheSB3b3VsZCBhbGxvdyBm
b3IgZS5nLiByY3VfYmFycmllcigpIHRvCj4+IGJlIGNhbGxlZCBpbnNpZGUgYSBDUFUgcGx1Zy91
bnBsdWcgc2VjdGlvbi4gWW91ciByd2xvY2sgaXMgcmVtb3ZpbmcgdGhhdAo+PiBwb3NzaWJpbGl0
eS4gQW55IGNoYW5jZSB0aGF0IGNvdWxkIGJlIGhhbmRsZWQ/Cj4gCj4gV2hpbGUgdGhpcyBtaWdo
dCBiZSBpbnRlcmVzdGluZyBmb3IgdGhlIHJjdSBzdHVmZiwgaXQgY2VydGFpbmx5IGlzbid0Cj4g
Zm9yIG90aGVyIHBpZWNlcyBhbHNvIHJlbHlpbmcgb24gdGhlIGNwdSBtYXBzIGxvY2suCj4gCj4g
SWU6IGdldF9jcHVfbWFwcyBtdXN0IGZhaWwgd2hlbiBjYWxsZWQgYnkgc2VuZF9JUElfbWFzayBp
ZiB0aGVyZSdzIGEKPiBDUFUgcGx1Zy91bnBsdWcgb3BlcmF0aW9uIGdvaW5nIG9uLCBldmVuIGlm
IGl0J3Mgb24gdGhlIHNhbWUgcENQVQo+IHRoYXQncyBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRl
IG1vZGUuCgpTdXJlPyBIb3cgaXMgY3B1X2Rvd24oKSB3b3JraW5nIHRoZW4/IEl0IGlzIGNhbGxp
bmcgc3RvcF9tYWNoaW5lX3J1bigpCndoaWNoIGlzIHVzaW5nIHNlbmRfSVBJX21hc2soKS4uLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
