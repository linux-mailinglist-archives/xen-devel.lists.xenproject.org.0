Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3D10AF73
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:18:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZwE1-0008L0-Ks; Wed, 27 Nov 2019 12:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZwDz-0008Kv-JE
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 12:15:15 +0000
X-Inumbo-ID: 90b4fa90-110f-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90b4fa90-110f-11ea-9db0-bc764e2007e4;
 Wed, 27 Nov 2019 12:15:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54E16AD5E;
 Wed, 27 Nov 2019 12:15:13 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <09d31a70-9f03-85fa-9772-8205eade6f08@citrix.com>
 <d34bdb0d-cd47-4007-48c0-317163552e91@suse.com>
 <b3502812-6687-5398-5a5c-4a98ff490a55@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9e4d1bbe-f33f-87c6-eaa9-3af653fd4e20@suse.com>
Date: Wed, 27 Nov 2019 13:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b3502812-6687-5398-5a5c-4a98ff490a55@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTM6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTEvMjcvMTkgNDoz
NCBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMjYuMTEuMTkgMTg6MzAsIEdlb3JnZSBE
dW5sYXAgd3JvdGU6Cj4+PiBPbiAxMS8yNi8xOSA1OjE3IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ogo+Pj4+IC0geGwgd2lsbCB1c2UgdGhlIGxpYnhsIGRlZmF1bHQgZm9yIG1hcHRyYWNrLCBidXQg
ZG9lcyBpdHMgb3duIGRlZmF1bHQKPj4+PiAgwqDCoCBjYWxjdWxhdGlvbiBmb3IgZ3JhbnQgZnJh
bWVzOiBlaXRoZXIgMzIgb3IgNjQsIGJhc2VkIG9uIHRoZSBtYXgKPj4+PiAgwqDCoCBwb3NzaWJs
ZSBtZm4uCj4+Pgo+Pj4gW3NuaXBdCj4+Pgo+Pj4+IEBAIC0xOTksMTMgKzE5OCw2IEBAIHN0YXRp
YyB2b2lkIHBhcnNlX2dsb2JhbF9jb25maWcoY29uc3QgY2hhcgo+Pj4+ICpjb25maWdmaWxlLAo+
Pj4+ICDCoCDCoMKgwqDCoMKgIGlmICgheGx1X2NmZ19nZXRfbG9uZyAoY29uZmlnLCAibWF4X2dy
YW50X2ZyYW1lcyIsICZsLCAwKSkKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIG1heF9ncmFudF9m
cmFtZXMgPSBsOwo+Pj4+IC3CoMKgwqAgZWxzZSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGxpYnhs
X3BoeXNpbmZvX2luaXQoJnBoeXNpbmZvKTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgbWF4X2dyYW50
X2ZyYW1lcyA9IChsaWJ4bF9nZXRfcGh5c2luZm8oY3R4LCAmcGh5c2luZm8pICE9IDAgfHwKPj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICEocGh5c2luZm8ubWF4X3Bvc3NpYmxlX21mbiA+PiAzMikpCj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPyAzMiA6IDY0Owo+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBsaWJ4bF9waHlzaW5mb19kaXNwb3NlKCZwaHlzaW5mbyk7Cj4+Pj4gLcKg
wqDCoCB9Cj4+Pgo+Pj4gU29ycnksIG1lYW50IHRvIGFkZCBhIHBhdGNoIHRvIGFkZCB0aGlzIGZ1
bmN0aW9uYWxpdHkgYmFjayBpbnRvIHRoZQo+Pj4gaHlwZXJ2aXNvciAtLSBpLmUuLCBzbyB0aGF0
IG9wdF9tYXhfZ3JhbnRfZnJhbWVzIHdvdWxkIGJlIDMyIG9uIHN5c3RlbXMKPj4+IHdpdGggMzIt
Yml0IG1mbnMuCj4+Pgo+Pj4gQnV0IHRoaXMgc2VlbXMgbGlrZSBhIGZhaXJseSBzdHJhbmdlIGNh
bGN1bGF0aW9uIGFueXdheTsgaXQncyBub3QgY2xlYXIKPj4+IHRvIG1lIHdoZXJlIGl0IHdvdWxk
IGhhdmUgY29tZSBmcm9tLgo+PiBtZm5zIGFib3ZlIHRoZSAzMi1iaXQgbGltaXQgcmVxdWlyZSB0
byB1c2UgZ3JhbnQgdjIuIFRoaXMgaW4gdHVybgo+PiBkb3VibGVzIHRoZSBncmFudCBmcmFtZXMg
bmVlZGVkIGZvciB0aGUgc2FtZSBudW1iZXIgb2YgZ3JhbnRzLgo+IAo+IEJ1dCBpcyBsYXJnZSBt
Zm5zIHRoZSAqb25seSogcmVhc29uIHRvIHVzZSBncmFudCB2Mj8gIEFyZW4ndCBtb2Rlcm4KPiBn
dWVzdHMgZ29pbmcgdG8gdXNlIGdyYW50IHYyIHJlZ2FyZGxlc3Mgb2YgdGhlIG1heCBtZm4gc2l6
ZT8KCkxhcmdlIG1mbnMgbGVhdmUgdGhlIGd1ZXN0IG5vIGNob2ljZS4gTGludXgga2VybmVsIFYy
IHN1cHBvcnQgd2FzCnJlbW92ZWQgYW5kIEkgcmVpbnRyb2R1Y2VkIGl0IGZvciBiZWluZyBhYmxl
IHRvIHN1cHBvcnQgbGFyZ2UgbWZucyBpbgpndWVzdHMuCgpDdXJyZW50IExpbnV4IGtlcm5lbCB3
aWxsIHVzZSBWMSBpZiB0aGUgbWF4IG1mbiBmaXRzIGluIDMyIGJpdHMgYW5kIFYyCm9ubHkgaWYg
dGhlcmUgY2FuIGJlIG1lbW9yeSBhYm92ZSB0aGF0IGJvdW5kYXJ5LgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
