Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68114A80B7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 12:59:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Swe-0003K6-Ss; Wed, 04 Sep 2019 10:55:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5Swd-0003Ju-U6
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 10:55:23 +0000
X-Inumbo-ID: 7d8d2fa4-cf02-11e9-abaf-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d8d2fa4-cf02-11e9-abaf-12813bfff9fa;
 Wed, 04 Sep 2019 10:55:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9CECAD4E;
 Wed,  4 Sep 2019 10:55:20 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
 <a5bbc347-a876-17d2-4fae-06b98818e565@suse.com>
 <f552186e-4f5d-f0df-d44d-51a8f2fa5a7e@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e734e54d-7c8c-1a47-aa27-c153542ffbb7@suse.com>
Date: Wed, 4 Sep 2019 12:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f552186e-4f5d-f0df-d44d-51a8f2fa5a7e@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTA6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA5LjIwMTkgMTA6
NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA0LjA5LjE5IDEwOjQwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA0LjA5LjIwMTkgMTA6MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDMuMDkuMTkgMTc6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwMy4wOS4y
MDE5IDE3OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gT24gMDMuMDkuMTkgMTY6NTMs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDI5LjA4LjIwMTkgMTI6MTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGhhdmUgdW5pcXVlIG5hbWVzIHdoZW4g
ZG9pbmcgbG9jayBwcm9maWxpbmcgc2V2ZXJhbCBsb2NhbAo+Pj4+Pj4+PiBsb2NrcyAibG9jayIg
bmVlZCB0byBiZSByZW5hbWVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQnV0IHRoZXNlIGFyZSBhbGwgbmFt
ZWQgc2ltcGx5ICJsb2NrIiBmb3IgYSBnb29kIHJlYXNvbiwgaW5jbHVkaW5nCj4+Pj4+Pj4gYmVj
YXVzZSB0aGV5J3JlIGFsbCBmdW5jdGlvbiBzY29wZSBzeW1ib2xzIChhbmQgdHlwaWNhbGx5IHRo
ZQo+Pj4+Pj4+IGZ1bmN0aW9ucyBhcmUgYWxsIHN1ZmZpY2llbnRseSBzaG9ydCkuIFRoZSBpc3N1
ZSBzdGVtcyBmcm9tIHRoZQo+Pj4+Pj4+IGR1YWwgdXNlIG9mICJuYW1lIiBpbgo+Pj4+Pj4+Cj4+
Pj4+Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwgI25hbWUsICZuYW1lLCAwLCAw
LCAwLCAwLCAwIH0KPj4+Pj4+Pgo+Pj4+Pj4+IHNvIEknZCByYXRoZXIgc3VnZ2VzdCBtYWtpbmcg
dGhpcyBhIGRlcml2YXRpb24gb2YgYSBuZXcKPj4+Pj4+Pgo+Pj4+Pj4+ICNkZWZpbmUgX0xPQ0tf
UFJPRklMRV9OQU1FKGxvY2ssIG5hbWUpIHsgMCwgI25hbWUsICZsb2NrLCAwLCAwLCAwLCAwLCAw
IH0KPj4+Pj4+Pgo+Pj4+Pj4+IGlmIHRoZXJlJ3Mgbm8gb3RoZXIgKHRyYW5zcGFyZW50KSB3YXkg
b2YgZGlzYW1iaWd1YXRpbmcgdGhlIG5hbWVzLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgd2lsbCByZXF1
aXJlIHRvIHVzZSBhIGRpZmZlcmVudCBERUZJTkVfU1BJTkxPQ0soKSB2YXJpYW50LCBzbyBlLmcu
Cj4+Pj4+PiBERUZJTkVfU1BJTkxPQ0tfTE9DQUwoKSwgd2hpY2ggd2lsbCB0aGVuIGluY2x1ZGUg
dGhlIG5lZWRlZCAic3RhdGljIiBhbmQKPj4+Pj4+IGFkZCAiQDxmdW5jPiIgdG8gdGhlIGxvY2sg
cHJvZmlsaW5nIG5hbWUuIElzIHRoaXMgb2theT8KPj4+Pj4KPj4+Pj4gVG8gYmUgZnJhbmsgLSBu
b3QgcmVhbGx5LiBJIGRpc2xpa2UgYm90aCwgYW5kIHdvdWxkIGhlbmNlIHByZWZlciB0bwo+Pj4+
PiBzdGljayB0byB3aGF0IHRoZXJlIGlzIGN1cnJlbnRseSwgdW50aWwgc29tZW9uZSBpbnZlbnRz
IGEgdHJhbnNwYXJlbnQKPj4+Pj4gd2F5IHRvIGRpc2FtYmlndWF0ZSB0aGVzZS4gSSdtIHNvcnJ5
IGZvciBiZWluZyB1bmhlbHBmdWwgaGVyZS4KPj4+Pgo+Pj4+IEkgdGhpbmsgSSBoYXZlIGZvdW5k
IGEgd2F5OiBJIGNvdWxkIGFkZCBfX0ZJTEVfXyBhbmQgX19MSU5FX18gZGF0YSB0bwo+Pj4+IHN0
cnVjdCBsb2NrX3Byb2ZpbGUuIEluIGxvY2tfcHJvZl9pbml0KCkgSSBjb3VsZCBsb29rIGZvciBu
b24tdW5pcXVlCj4+Pj4gbG9jayBuYW1lcyBhbmQgbWFyayB0aG9zZSB0byBiZSBwcmludGVkIHdp
dGggdGhlIF9fRklMRV9fIGFuZCBfX0xJTkVfXwo+Pj4+IGRhdGEgYWRkZWQgdG8gdGhlIG5hbWVz
Lgo+Pj4+Cj4+Pj4gV291bGQgeW91IGJlIGZpbmUgd2l0aCB0aGlzIGFwcHJvYWNoPwo+Pj4KPj4+
IEkgd291bGQgYmUsIGJ1dCBJJ20gYWZyYWlkIEFuZHJldyB3b24ndCAoYXMgd2l0aCBhbnkgbmV3
IHVzZXMgb2YgX19MSU5FX18pLgo+Pj4gSSB3b25kZXIgaWYgX19mdW5jX18gb3IgX19GVU5DVElP
Tl9fIGNvdWxkIGJlIHVzZWQgLSB0aGUgbWFpbiBxdWVzdGlvbiBpcwo+Pj4gaG93IHRoZXkgYmVo
YXZlIHdoZW4gdXNlZCBvdXRzaWRlIG9mIGEgZnVuY3Rpb24uIElmIGVpdGhlciB3b3VsZCBiZSBO
VUxMCj4+PiAocmF0aGVyIHRoYW4gdHJpZ2dlcmluZyBhIGRpYWdub3N0aWMpLCBpdCBtaWdodCBi
ZSB1c2FibGUgaGVyZS4gT2YgY291cnNlCj4+PiB0aGlzIHdvdWxkIGJlIGZyYWdpbGUgaWYganVz
dCBiYXNlZCBvbiBvYnNlcnZlZCAocmF0aGVyIHRoYW4gZG9jdW1lbnRlZCkKPj4+IGJlaGF2aW9y
Lgo+Pgo+PiBXaXRoIGdjYyA3LjQuMSBpdCBmYWlsczoKPj4KPj4gL2hvbWUvZ3Jvc3MveGVuL3hl
bi9pbmNsdWRlL3hlbi9zcGlubG9jay5oOjgwOjQxOiBlcnJvcjog4oCYX19mdW5jX1/igJkgaXMK
Pj4gbm90IGRlZmluZWQgb3V0c2lkZSBvZiBmdW5jdGlvbiBzY29wZSBbLVdlcnJvcl0KPj4gICAg
I2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwgI25hbWUsIF9fZnVuY19fLCAmbmFtZSwg
MCwgMCwgMCwgMCwgMCB9Cj4gCj4gUmlnaHQsIGFzIEkgd2FzIGFmcmFpZCBvZi4gQnV0IF9fUFJF
VFRZX0ZVTkNUSU9OX18gbG9va3MgdG8gYmUgc3VpdGFibGUKPiAoYXMgcGVyIHRoZSBnY2MgZG9j
LCBhbmQgYXMgcGVyIHRoZXJlIGJlaW5nIGNsZWFyIGluZGljYXRpb25zIHRoYXQgY2xhbmcKPiBh
bHNvIHN1cHBvcnRzIHRoaXMpLgoKWWVzLCB0aGlzIGlzIHdvcmtpbmcuIFdpbGwgbW9kaWZ5IHRo
ZSBwYXRjaC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
