Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A16D167FA1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:07:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58wO-0005yV-5r; Fri, 21 Feb 2020 14:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j58wN-0005xn-1W
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:06:03 +0000
X-Inumbo-ID: 4ac6e56a-54b3-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ac6e56a-54b3-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 14:06:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C852AAF1;
 Fri, 21 Feb 2020 14:06:01 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
Date: Fri, 21 Feb 2020 15:06:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAgMTQ6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAyMS8wMi8y
MDIwIDEzOjQ2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBPbiAyMS4wMi4yMCAxNDozNiwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMDIwIDEwOjEwLCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6
MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+IEFsbG93IGEgQ1BVIGFscmVhZHkgaG9s
ZGluZyB0aGUgbG9jayBpbiB3cml0ZSBtb2RlIHRvIGFsc28gbG9jayBpdCBpbgo+Pj4+Pj4gcmVh
ZCBtb2RlLiBUaGVyZSdzIG5vIGhhcm0gaW4gYWxsb3dpbmcgcmVhZCBsb2NraW5nIGEgcndsb2Nr
IHRoYXQncwo+Pj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3
cml0ZSBtb2RlLiBBbGxvd2luZyBzdWNoCj4+Pj4+PiBhY2Nlc3NlcyBpcyByZXF1aXJlZCBhdCBs
ZWFzdCBmb3IgdGhlIENQVSBtYXBzIHVzZS1jYXNlLgo+Pj4+Pj4KPj4+Pj4+IEluIG9yZGVyIHRv
IGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIAo+Pj4+
Pj4gc3VwcG9ydAo+Pj4+Pj4gdXAgdG8gMTYzODQgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRl
IGxvY2sgbWFzayB0byAyIGJpdHM6IG9uZSB0bwo+Pj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5k
aW5nIHdyaXRlcnMgd2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4+Pj4+PiBz
aWduYWwgdGhlIGxvY2sgaXMgb3duZWQgaW4gd3JpdGUgbW9kZS4gTm90ZSB0aGUgd3JpdGUgcmVs
YXRlZCBkYXRhCj4+Pj4+PiBpcyB1c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9uZSBpbiBvcmRlciB0
byBiZSBhYmxlIHRvIGNsZWFyIGl0IChhbmQKPj4+Pj4+IHRodXMgcmVsZWFzZSB0aGUgbG9jaykg
dXNpbmcgYSAxNmJpdCBhdG9taWMgd3JpdGUuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyByZWR1Y2VzIHRo
ZSBtYXhpbXVtIG51bWJlciBvZiBjb25jdXJyZW50IHJlYWRlcnMgZnJvbSAKPj4+Pj4+IDE2Nzc3
MjE2IHRvCj4+Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGlsbCBiZSBlbm91Z2gs
IG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPj4+Pj4+IGNhbiBiZSBleHBhbmRlZCBmcm9tIDMyIHRv
IDY0Yml0cyBpZiBhbGwgYXJjaGl0ZWN0dXJlcyBzdXBwb3J0IGF0b21pYwo+Pj4+Pj4gb3BlcmF0
aW9ucyBvbiA2NGJpdCBpbnRlZ2Vycy4KPj4+Pj4KPj4+Pj4gRldJVywgYXJtMzIgaXMgYWJsZSB0
byBzdXBwb3J0IGF0b21pYyBvcGVyYXRpb25zIG9uIDY0LWJpdCBpbnRlZ2Vycy4KPj4+Pj4KPj4+
Pj4+IMKgwqAgc3RhdGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2sp
Cj4+Pj4+PiDCoMKgIHsKPj4+Pj4+IC3CoMKgwqAgLyoKPj4+Pj4+IC3CoMKgwqDCoCAqIElmIHRo
ZSB3cml0ZXIgZmllbGQgaXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4KPj4+
Pj4+IC3CoMKgwqDCoCAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUg
dXNlZCB0byBjbGVhciBpdC4KPj4+Pj4+IC3CoMKgwqDCoCAqLwo+Pj4+Pj4gLcKgwqDCoCBhdG9t
aWNfc3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPj4+Pj4+ICvCoMKgwqAgLyogU2luY2Ug
dGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIAo+Pj4+Pj4gZGly
ZWN0bHkuICovCj4+Pj4+PiArwqDCoMKgIEFTU0VSVChfaXNfd3JpdGVfbG9ja2VkX2J5X21lKGF0
b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oX1FS
X1NISUZUICE9IDE2KTsKPj4+Pj4+ICvCoMKgwqAgd3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZs
b2NrLT5jbnRzLCAwKTsKPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGlzIGlzIGFuIGFidXNlIHRvIGNh
c3QgYW4gYXRvbWljX3QoKSBkaXJlY3RseSBpbnRvIGEgCj4+Pj4+IHVpbnQxNl90LiBZb3UKPj4+
Pj4gd291bGQgYXQgbGVhc3Qgd2FudCB0byB1c2UgJmxvY2stPmNudHMuY291bnRlciBoZXJlLgo+
Pj4+Cj4+Pj4gU3VyZSwgSSB3YXMgd29uZGVyaW5nIGFib3V0IHRoaXMgbXlzZWxmLgo+Pj4+Cj4+
Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2Fu
IGJlIGZpeGVkIHVwb24KPj4+PiBjb21taXQgaWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4K
Pj4+Cj4+PiBJdCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBhbm90aGVyIGZpZWxkIHNwZWNpZmll
ciBoZXJlLiBBIGNhc3QgbGlrZQo+Pj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFu
ZCBoZW5jZSBhIHRyYXAgd2FpdGluZyBmb3IgYSBiaWcKPj4+IGVuZGlhbiBwb3J0IGF0dGVtcHQg
dG8gZmFsbCBpbnRvLiBBdCB0aGUgdmVyeSBsZWFzdCB0aGlzIHNob3VsZCBjYXVzZQo+Pj4gYSBi
dWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVtcywgZXZlbiBiZXR0ZXIgd291bGQgYmUg
aWYgaXQgd2FzCj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4+Cj4+IFdvdWxkbid0IGEgdW5pb24gYmUg
dGhlIGJldHRlciBjaG9pY2U/Cj4gCj4gWW91IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHVzZSBhdG9t
aWNfdCBpbiB0aGF0IGNhc2UgYXMgeW91IGNhbid0IGFzc3VtZSAKPiB0aGUgbGF5b3V0IG9mIHRo
ZSBzdHJ1Y3R1cmUuCgp1bmlvbiByd2xvY2t3b3JkIHsKICAgICBhdG9taWNfdCBjbnRzOwogICAg
IHVpbnQzMl90IHZhbDsKICAgICBzdHJ1Y3QgewogICAgICAgICB1aW50MTZfdCB3cml0ZTsKICAg
ICAgICAgdWludDE2X3QgcmVhZGVyczsKICAgICB9Owp9OwoKc3RhdGljIGlubGluZSBjb25zdCB1
aW50MzJfdCBfcXJfYmlhcygKICAgICBjb25zdCB1bmlvbiByd2xvY2t3b3JkIHsKICAgICAgICAg
LndyaXRlID0gMCwKICAgICAgICAgLnJlYWRlcnMgPSAxCiAgICAgfSB4OwoKICAgICByZXR1cm4g
eC52YWw7Cn0KCi4uLgogICAgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfcXJfYmlhcygpLCAm
bG9jay0+Y250cyk7Ci4uLgoKSSBndWVzcyB0aGlzIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
