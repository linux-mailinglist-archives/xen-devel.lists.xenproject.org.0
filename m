Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02B1441EB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 17:18:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwBW-0004AC-UY; Tue, 21 Jan 2020 16:15:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itwBV-0004A7-9G
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:15:21 +0000
X-Inumbo-ID: 35ed8e3a-3c69-11ea-bae3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35ed8e3a-3c69-11ea-bae3-12813bfff9fa;
 Tue, 21 Jan 2020 16:15:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F8B7ACCA;
 Tue, 21 Jan 2020 16:15:15 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
 <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
 <20200121155708.GI11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddac90c5-2fe5-ba92-d7ab-f258f483521d@suse.com>
Date: Tue, 21 Jan 2020 17:15:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121155708.GI11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxNjo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAyMSwgMjAyMCBhdCAxMTo0Mzo1OEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjEuMDEuMjAyMCAxMToyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IFNvIEknbSBub3Qg
c3VyZSBob3cgdG8gcHJvZ3Jlc3Mgd2l0aCB0aGlzIHBhdGNoLCBhcmUgd2UgZmluZSB3aXRoCj4+
PiB0aG9zZSBsaW1pdGF0aW9ucz8KPj4KPj4gSSdtIGFmcmFpZCB0aGlzIGRlcGVuZHMgb24gLi4u
Cj4+Cj4+PiBBcyBJIHNhaWQsIFhlbiBoYXNuJ3QgZ290IGVub3VnaCBrbm93bGVkZ2UgdG8gY29y
cmVjdGx5IGlzb2xhdGUgdGhlCj4+PiBCQVJzLCBhbmQgaGVuY2Ugd2UgaGF2ZSB0byByZWx5IG9u
IGRvbTAgRFRSVC4gV2UgY291bGQgYWRkIGNoZWNrcyBpbgo+Pj4gWGVuIHRvIG1ha2Ugc3VyZSBu
byBCQVJzIHNoYXJlIGEgcGFnZSwgYnV0IGl0J3MgYSBub24tdHJpdmlhbCBhbW91bnQKPj4+IG9m
IHNjYW5uaW5nIGFuZCBzaXppbmcgZWFjaCBwb3NzaWJsZSBCQVIgb24gdGhlIHN5c3RlbS4KPj4K
Pj4gLi4uIHdoZXRoZXIgRG9tMCBhY3R1YWxseSAiRFRSVCIsIHdoaWNoIGluIHR1cm4gaXMgY29t
cGxpY2F0ZWQgYnkgdGhlcmUKPj4gbm90IGJlaW5nIGEgc3BlY2lmaWMgRG9tMCBrZXJuZWwgaW5j
YXJuYXRpb24gdG8gY2hlY2sgYWdhaW5zdC4gUGVyaGFwcwo+PiByYXRoZXIgdGhhbiBoYXZpbmcg
WGVuIGNoZWNrIF9hbGxfIEJBUnMsIFhlbiBvciB0aGUgdG9vbCBzdGFjayBjb3VsZAo+PiBjaGVj
ayBCQVJzIG9mIGRldmljZXMgYWJvdXQgdG8gYmUgaGFuZGVkIHRvIGEgZ3Vlc3Q/IFBlcmhhcHMg
d2UgbmVlZCB0bwo+PiBwYXNzIGF1eGlsaWFyeSBpbmZvcm1hdGlvbiB0byBodm1sb2FkZXIgdG8g
YmUgYWJsZSB0byBqdWRnZSB3aGV0aGVyIGEKPj4gQkFSIHNoYXJlcyBhIHBhZ2Ugd2l0aCBhbm90
aGVyIG9uZT8gUGVyaGFwcyB0aGVyZSBhbHNvIG5lZWRzIHRvIGJlIGEKPj4gd2F5IGZvciBodm1s
b2FkZXIgdG8ga25vdyB3aGF0IG9mZnNldCBpbnRvIGEgcGFnZSBoYXMgdG8gYmUgbWFpbnRhaW5l
ZAo+PiBmb3IgYW55IHBhcnRpY3VsYXIgQkFSLCBhcyBmb2xsb3dzIGZyb20gSmFzb24ncyByZWNl
bnQgcmVwbHk/Cj4gCj4gTGludXggaGFzIGFuIG9wdGlvbiB0byBmb3JjZSByZXNvdXJjZSBhbGln
bm1lbnQgKGFzIHJlcG9ydGVkIGJ5Cj4gSmFzb24pLCBtYXliZSB3ZSBjb3VsZCBmb3JjZSBhbGwg
QkFScyB0byBiZSBhbGlnbmVkIHRvIHBhZ2Ugc2l6ZSBpbgo+IG9yZGVyIHRvIGJlIHBhc3NlZCB0
aHJvdWdoPwo+IAo+IFRoYXQgd291bGQgbWFrZSBpdCBlYXNpZXIgdG8gY2hlY2sgKGFzIFhlbi9R
ZW11IHdvdWxkIG9ubHkgbmVlZCB0bwo+IGFzc2VydCB0aGF0IHRoZSBCQVIgYWRkcmVzcyBpcyBh
bGlnbmVkKSwgYW5kIHdvbid0IHJlcXVpcmUgbXVjaCBleHRyYQo+IHdvcmsgaW4gWGVuIGFwYXJ0
IGZyb20gdGhlIGNoZWNrIGl0c2VsZi4KPiAKPiBEbyB5b3UgdGhpbmsgdGhpcyB3b3VsZCBiZSBh
biBhY2NlcHRhYmxlIHNvbHV0aW9uPwoKSW4gcHJpbmNpcGxlIHllcywgYnV0IHRoZXJlIGFyZSBs
b29zZSBlbmRzOgotIFdoYXQgZG8geW91IG1lYW4gYnkgIndlIGNvdWxkIGZvcmNlIj8gV2UgaGF2
ZSBubyBjb250cm9sIG92ZXIgdGhlCiAgRG9tMCBrZXJuZWwuCi0gV2hhdCBhYm91dCBub24tTGlu
dXggRG9tMD8KCkFsc28sIGFwYXJ0IGZyb20gZXh0cmEgcmVzb3VyY2UgKGFkZHJlc3Mgc3BhY2Up
IGNvbnN1bXB0aW9uLCB3aGF0J3MKdGhlIHBvaW50IG9mIGZvcmNpbmcgYSBzaW5nbGUgZGV2aWNl
J3MgQkFScyB0byBzZXBhcmF0ZSBwYWdlcz8gKEknbQphc3N1bWluZyBoZXJlIHRoYXQgaHZtbG9h
ZGVyIHdvdWxkIGhhdmUgYSB3YXkgdG8ga25vdyBvZiB0aGUKcG90ZW50aWFsbHkgcmVzdWx0aW5n
IG5vbi16ZXJvIG9mZnNldHMgaW50byBhIHBhZ2UuIEFuZCBJJ20gc3RpbGwKcHV6emxlZCB0aGF0
IHRoZSBsYWNrIHRoZXJlb2YgaGFzbid0IGJlZW4gcmVwb3J0ZWQgYXMgYSBidWcgYnkKYW55b25l
LCBhZmFpay4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
