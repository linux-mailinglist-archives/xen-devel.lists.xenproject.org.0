Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6601845EB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:26:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiPe-0007no-JE; Fri, 13 Mar 2020 11:23:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCiPd-0007nS-AH
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:23:33 +0000
X-Inumbo-ID: 1248e34e-651d-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1248e34e-651d-11ea-b34e-bc764e2007e4;
 Fri, 13 Mar 2020 11:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14A78AAC7;
 Fri, 13 Mar 2020 11:23:32 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
 <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
 <41c5066a-17ef-31ca-afa6-f7ded8c31574@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d20369e5-260e-6ff7-0eb0-aef426298509@suse.com>
Date: Fri, 13 Mar 2020 12:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <41c5066a-17ef-31ca-afa6-f7ded8c31574@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAgMTE6NDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDEzLzAzLzIwMjAgMTA6MTUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEzLjAzLjIw
IDExOjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuLAo+Pj4KPj4+IE9uIDEz
LzAzLzIwMjAgMDg6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4gU2ltaWxhciB0byBzcGlu
bG9ja3MgcHJlZW1wdGlvbiBzaG91bGQgYmUgZGlzYWJsZWQgd2hpbGUgaG9sZGluZyBhCj4+Pj4g
cndsb2NrLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDE4ICsr
KysrKysrKysrKysrKysrLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3
bG9jay5oIGIveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oCj4+Pj4gaW5kZXggMWMyMjFkZDBkOS4u
NGVlMzQxYTE4MiAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+PiBAQCAtMiw2ICsyLDcgQEAKPj4+
PiDCoCAjZGVmaW5lIF9fUldMT0NLX0hfXwo+Pj4+IMKgICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+
Cj4+Pj4gKyNpbmNsdWRlIDx4ZW4vcHJlZW1wdC5oPgo+Pj4+IMKgICNpbmNsdWRlIDx4ZW4vc21w
Lmg+Cj4+Pj4gwqAgI2luY2x1ZGUgPHhlbi9zcGlubG9jay5oPgo+Pj4+IEBAIC01NywxMCArNTgs
MTIgQEAgc3RhdGljIGlubGluZSBpbnQgX3JlYWRfdHJ5bG9jayhyd2xvY2tfdCAqbG9jaykKPj4+
PiDCoMKgwqDCoMKgIGNudHMgPSBhdG9taWNfcmVhZCgmbG9jay0+Y250cyk7Cj4+Pj4gwqDCoMKg
wqDCoCBpZiAoIGxpa2VseShfY2FuX3JlYWRfbG9jayhjbnRzKSkgKQo+Pj4+IMKgwqDCoMKgwqAg
ewo+Pj4KPj4+IElmIHlvdSBnZXQgcHJlZW1wdGVkIGhlcmUsIHRoZW4gaXQgbWVhbnMgdGhlIGNo
ZWNrIGJlbG93IGlzIGxpa2VseSAKPj4+IGdvaW5nIHRvIGZhaWwuIFNvIEkgdGhpbmsgaXQgd291
bGQgYmUgYmVzdCB0byBkaXNhYmxlIHByZWVtcHRpb24gCj4+PiBiZWZvcmUsIHRvIGdpdmUgbW9y
ZSBjaGFuY2UgdG8gc3VjY2VlZC4KPj4KPj4gQXMgcHJlZW1wdGlvbiBwcm9iYWJpbGl0eSBhdCB0
aGlzIHZlcnkgcG9pbnQgc2hvdWxkIGJlIG11Y2ggbG93ZXIgdGhhbgo+PiB0aGF0IG9mIGhlbGQg
bG9ja3MgSSB0aGluayB0aGF0IGlzIG9wdGltaXppbmcgdGhlIHdyb25nIHBhdGguCj4gCj4gV2h5
IHNvPyBMb2NrIGNvbnRlbnRpb24gc2hvdWxkIGJlIGZhaXJseSBsaW1pdGVkIG9yIHlvdSBhbHJl
YWR5IGhhdmUgYSAKPiBwcm9ibGVtIG9uIHlvdXIgc3lzdGVtLiBTbyBwcmVlbXB0aW9uIGlzIG1v
cmUgbGlrZWx5LgoKVG9kYXkgcHJvYmFiaWxpdHkgb2YgcHJlZW1wdGlvbiBpcyAwLgoKRXZlbiB3
aXRoIHByZWVtcHRpb24gYWRkZWQgdGhlIHByb2JhYmlsaXR5IHRvIGJlIHByZWVtcHRlZCBpbiBh
IHNlcXVlbmNlCm9mIGFib3V0IGEgZG96ZW4gaW5zdHJ1Y3Rpb25zIGlzIF92ZXJ5XyBsb3cuCgo+
IAo+PiBJJ20gbm90Cj4+IG9wcG9zZWQgZG9pbmcgdGhlIG1vZGlmaWNhdGlvbiB5b3UgYXJlIHJl
cXVlc3RpbmcsIGJ1dCB3b3VsZCBsaWtlIHRvCj4+IGhlYXIgYSBzZWNvbmQgb3BpbmlvbiBvbiB0
aGF0IHRvcGljLCBlc3BlY2lhbGx5IGFzIEknZCBuZWVkIHRvIGFkZAo+PiBhbm90aGVyIHByZWVt
cHRfZW5hYmxlKCkgY2FsbCB3aGVuIGZvbGxvd2luZyB5b3VyIGFkdmljZS4KPiAKPiBJIGRvbid0
IHJlYWxseSBzZWUgdGhlIHByb2JsZW0gd2l0aCBhZGRpbmcgYSBuZXcgcHJlZW1wdGlvbl9lbmFi
bGUoKSAKPiBjYWxsLiBCdXQgdGhlIGNvZGUgY2FuIGFsc28gYmUgcmV3b3JrZWQgdG8gaGF2ZSBv
bmx5IG9uZSBjYWxsLi4uCgpJdHMgdGhlIGR5bmFtaWNhbCBwYXRoIEknbSBzcGVha2luZyBvZi4g
QWNjZXNzaW5nIGEgbG9jYWwgY3B1IHZhcmlhYmxlCmlzIG5vdCB0aGF0IGNoZWFwLCBhbmQgaW4g
Y2FzZSB3ZSBhZGQgcHJlZW1wdGlvbiBpbiB0aGUgZnV0dXJlCnByZWVtcHRfZW5hYmxlKCkgd2ls
bCBiZWNvbWUgZXZlbiBtb3JlIGV4cGVuc2l2ZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
