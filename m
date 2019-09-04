Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE08A7FD9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Rxm-0006Pq-HX; Wed, 04 Sep 2019 09:52:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5Rxk-0006Pg-P1
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:52:28 +0000
X-Inumbo-ID: b33fcb6a-cef9-11e9-abae-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b33fcb6a-cef9-11e9-abae-12813bfff9fa;
 Wed, 04 Sep 2019 09:52:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 903D9B63F;
 Wed,  4 Sep 2019 09:52:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
 <eea8cf6b-ff96-765f-d9a4-2064a75979a3@citrix.com>
 <4c3acd1d-6b63-eaec-63ec-854f00541653@suse.com>
 <6e775577-d254-cd20-0540-1e7aba9d6874@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ccff9d79-a68e-570b-0b50-b8f91de758d9@suse.com>
Date: Wed, 4 Sep 2019 11:52:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6e775577-d254-cd20-0540-1e7aba9d6874@citrix.com>
Content-Language: en-US
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
 KonradRzeszutekWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 IanJackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTE6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDQvMDkvMjAxOSAx
MDoxMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDQuMDkuMTkgMTA6NTgsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAwNC8wOS8yMDE5IDA5OjQwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAwNC4wOS4yMDE5IDEwOjI1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBPbiAw
My4wOS4xOSAxNzowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwMy4wOS4yMDE5IDE3
OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+IE9uIDAzLjA5LjE5IDE2OjUzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMjkuMDguMjAxOSAxMjoxOCwgSnVlcmdlbiBHcm9z
cyB3cm90ZToKPj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGhhdmUgdW5pcXVlIG5hbWVzIHdoZW4gZG9p
bmcgbG9jayBwcm9maWxpbmcgc2V2ZXJhbAo+Pj4+Pj4+Pj4gbG9jYWwKPj4+Pj4+Pj4+IGxvY2tz
ICJsb2NrIiBuZWVkIHRvIGJlIHJlbmFtZWQuCj4+Pj4+Pj4+IEJ1dCB0aGVzZSBhcmUgYWxsIG5h
bWVkIHNpbXBseSAibG9jayIgZm9yIGEgZ29vZCByZWFzb24sIGluY2x1ZGluZwo+Pj4+Pj4+PiBi
ZWNhdXNlIHRoZXkncmUgYWxsIGZ1bmN0aW9uIHNjb3BlIHN5bWJvbHMgKGFuZCB0eXBpY2FsbHkg
dGhlCj4+Pj4+Pj4+IGZ1bmN0aW9ucyBhcmUgYWxsIHN1ZmZpY2llbnRseSBzaG9ydCkuIFRoZSBp
c3N1ZSBzdGVtcyBmcm9tIHRoZQo+Pj4+Pj4+PiBkdWFsIHVzZSBvZiAibmFtZSIgaW4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwgI25hbWUsICZuYW1l
LCAwLCAwLCAwLCAwLCAwIH0KPj4+Pj4+Pj4KPj4+Pj4+Pj4gc28gSSdkIHJhdGhlciBzdWdnZXN0
IG1ha2luZyB0aGlzIGEgZGVyaXZhdGlvbiBvZiBhIG5ldwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAjZGVm
aW5lIF9MT0NLX1BST0ZJTEVfTkFNRShsb2NrLCBuYW1lKSB7IDAsICNuYW1lLCAmbG9jaywgMCwg
MCwKPj4+Pj4+Pj4gMCwgMCwgMCB9Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGlmIHRoZXJlJ3Mgbm8gb3Ro
ZXIgKHRyYW5zcGFyZW50KSB3YXkgb2YgZGlzYW1iaWd1YXRpbmcgdGhlIG5hbWVzLgo+Pj4+Pj4+
IFRoaXMgd2lsbCByZXF1aXJlIHRvIHVzZSBhIGRpZmZlcmVudCBERUZJTkVfU1BJTkxPQ0soKSB2
YXJpYW50LAo+Pj4+Pj4+IHNvIGUuZy4KPj4+Pj4+PiBERUZJTkVfU1BJTkxPQ0tfTE9DQUwoKSwg
d2hpY2ggd2lsbCB0aGVuIGluY2x1ZGUgdGhlIG5lZWRlZAo+Pj4+Pj4+ICJzdGF0aWMiIGFuZAo+
Pj4+Pj4+IGFkZCAiQDxmdW5jPiIgdG8gdGhlIGxvY2sgcHJvZmlsaW5nIG5hbWUuIElzIHRoaXMg
b2theT8KPj4+Pj4+IFRvIGJlIGZyYW5rIC0gbm90IHJlYWxseS4gSSBkaXNsaWtlIGJvdGgsIGFu
ZCB3b3VsZCBoZW5jZSBwcmVmZXIgdG8KPj4+Pj4+IHN0aWNrIHRvIHdoYXQgdGhlcmUgaXMgY3Vy
cmVudGx5LCB1bnRpbCBzb21lb25lIGludmVudHMgYSB0cmFuc3BhcmVudAo+Pj4+Pj4gd2F5IHRv
IGRpc2FtYmlndWF0ZSB0aGVzZS4gSSdtIHNvcnJ5IGZvciBiZWluZyB1bmhlbHBmdWwgaGVyZS4K
Pj4+Pj4gSSB0aGluayBJIGhhdmUgZm91bmQgYSB3YXk6IEkgY291bGQgYWRkIF9fRklMRV9fIGFu
ZCBfX0xJTkVfXyBkYXRhIHRvCj4+Pj4+IHN0cnVjdCBsb2NrX3Byb2ZpbGUuIEluIGxvY2tfcHJv
Zl9pbml0KCkgSSBjb3VsZCBsb29rIGZvciBub24tdW5pcXVlCj4+Pj4+IGxvY2sgbmFtZXMgYW5k
IG1hcmsgdGhvc2UgdG8gYmUgcHJpbnRlZCB3aXRoIHRoZSBfX0ZJTEVfXyBhbmQgX19MSU5FX18K
Pj4+Pj4gZGF0YSBhZGRlZCB0byB0aGUgbmFtZXMuCj4+Pj4+Cj4+Pj4+IFdvdWxkIHlvdSBiZSBm
aW5lIHdpdGggdGhpcyBhcHByb2FjaD8KPj4+PiBJIHdvdWxkIGJlLCBidXQgSSdtIGFmcmFpZCBB
bmRyZXcgd29uJ3QgKGFzIHdpdGggYW55IG5ldyB1c2VzIG9mCj4+Pj4gX19MSU5FX18pLgo+Pj4K
Pj4+IFRoZSBvay1uZXNzIG9mIHVzaW5nIF9fTElORV9fIGlzIGludmVyc2VseSBwcm9wb3J0aW9u
YWwgdG8gdGhlCj4+PiBsaWtlbGlob29kIG9mIGRldmVsb3BpbmcgYSBsaXZlcGF0Y2ggZm9yIHRo
aXMgcGFydGljdWxhciBidWlsZCBvZiBYZW4sCj4+PiBhbmQgd2hhdCBhZGRpdGlvbmFsIHBhdGNo
aW5nIGRlbHRhIGl0IHdvdWxkIGNhdXNlIHRocm91Z2ggdW5yZWxhdGVkCj4+PiBjaGFuZ2VzLgo+
Pgo+PiBOb3QgcmVsYXRlZCB0byB0aGlzIHBhdGNoLCBidXQgdG8gX19MSU5FX18gYW5kIGxpdmVw
YXRjaGluZzogaGF2ZSB5b3UKPj4gY29uc2lkZXJlZCB0byB1c2UgdGhlICIjbGluZSIgZGlyZWN0
aXZlIHRvIGF2b2lkIHVucmVsYXRlZCBkaWZmcz8KPiAKPiBUaGVyZSBhcmUgd2F5cyB0byBwbGF5
IHdpdGggX19MSU5FX18sIHllcy7CoCAjbGluZSB3YXMgYnJvdWdodCB1cCBpbiB0aGUKPiBvcmln
aW5hbCBkaXNjdXNzaW9uLgo+IAo+IEFzIGEgdGhvdWdodCBleHBlcmltZW50LCBob3cgd291bGQg
eW91IGV4cGVjdCB0aGlzIHRvIGJlIHVzZWQgdG8KPiBzaW1wbGlmeSBhIGxpdmVwYXRjaD8KCkl0
IHNob3VsZCBiZSByYXRoZXIgc3RyYWl0IGZvcndhcmQgdG8gd3JpdGUgYSB0b29sIGFkZGluZyAj
bGluZQpkaXJlY3RpdmVzIHRvIGEgcGF0Y2ggcmVjb3ZlcmluZyB0aGUgcHJldmlvdXMgbGluZSBu
dW1iZXJzIGluIHRoZQpjb2RlIGZvbGxvd2luZyBhIG1vZGlmaWNhdGlvbiB3aGljaCBhZGRlZCBv
ciByZW1vdmVkIGxpbmVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
