Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E811CDDB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 14:09:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifO9G-0002Zh-Hi; Thu, 12 Dec 2019 13:04:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifO9E-0002Zc-W7
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 13:04:53 +0000
X-Inumbo-ID: fb6fc05a-1cdf-11ea-8d48-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb6fc05a-1cdf-11ea-8d48-12813bfff9fa;
 Thu, 12 Dec 2019 13:04:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A585AD2C;
 Thu, 12 Dec 2019 13:04:50 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cd54bc0e-9e7b-42bb-ea60-8d4578a59cac@suse.com>
 <f150033a-ec07-7542-ab49-b5a8b746c2c1@citrix.com>
 <43160a9d-2738-0b1d-01ef-b3ad8f1c50dc@suse.com>
 <c49ca1fb-ce62-6668-966f-7a75150687fa@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dca85647-3e26-0d70-d381-e4baca33b156@suse.com>
Date: Thu, 12 Dec 2019 14:05:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <c49ca1fb-ce62-6668-966f-7a75150687fa@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86emul: correct LFS et al handling for
 64-bit mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxMjozNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMi8yMDE5
IDEwOjExLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMTIuMjAxOSAyMTo1NywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDExLzEyLzIwMTkgMDk6MjgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IEFNRCBhbmQgZnJpZW5kcyBleHBsaWNpdGx5IHNwZWNpZnkgdGhhdCA2NC1iaXQgb3Bl
cmFuZHMgYXJlbid0IHBvc3NpYmxlCj4+Pj4gZm9yIHRoZXNlIGluc25zLiBOZXZlcnRoZWxlc3Mg
UkVYLlcgaXNuJ3QgZnVsbHkgaWdub3JlZDogSXQgc3RpbGwKPj4+PiBjYW5jZWxzIGEgcG9zc2li
bGUgb3BlcmFuZCBzaXplIG92ZXJyaWRlICgweDY2KS4gSW50ZWwgb3RvaCBleHBsaWNpdGx5Cj4+
Pj4gcHJvdmlkZXMgZm9yIDY0LWJpdCBvcGVyYW5kcyBvbiB0aGUgcmVzcGVjdGl2ZSBpbnNuIHBh
Z2Ugb2YgdGhlIFNETS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPj4+IEl0IGlzIGRlZmluaXRlbHkgbW9yZSB0aGFuIGp1c3QgdGhlc2Uu
wqAgTmVhciBqdW1wcyBoYXZlIHBlci12ZW5kb3IKPj4+IGJlaGF2aW91ciBvbiBob3cgbG9uZyB0
aGUgaW5zdHJ1Y3Rpb24gaXMsIHdoZXJlYXMgZmFyIGp1bXAvY2FsbHMgYXJlIGluCj4+PiB0aGUg
c2FtZSBjYXRlZ29yeSBhcyB0aGVzZSBieSB0aGUgbG9va3Mgb2YgdGhpbmdzLgo+PiBCdXQgeW91
IGRvbid0IGV4cGVjdCBtZSB0byBmb2xkIGFsbCBvZiB0aGVzZSBpbnRvIG9uZSBwYXRjaCwgZG8K
Pj4geW91Pwo+IAo+IHNob3J0IGptcCBjZXJ0YWlubHkgbm90LCBidXQgZmFyIGptcC9jYWxsIGlz
IGp1c3QgdHdvIGV4dHJhIGNhc2UKPiBzdGF0ZW1lbnRzIGluIHRoaXMgbmV3IGNvZGUgYmxvY2ss
IG5vPwoKTm90IGV4YWN0bHkgKHRoZSBvdGhlciBjaGFuZ2Ugd291bGQgbmVlZCB0byBiZSBpbgp4
ODZfZGVjb2RlX29uZWJ5dGUoKSBhbmQgZGVwZW5kIG9uIE1vZFJNLnJlZyksIGJ1dCB5ZXMsIEkg
Y2FuCmRvIHRoaXMuIFlldCB0aGVuIGl0IHdvdWxkIGZlZWwgb2RkIHRvIG5vdCBhbHNvIGRlYWwg
d2l0aCB0aGUKbmVhciBjb3VudGVycGFydHMgYXQgdGhlIHNhbWUgdGltZS4gV2hpY2ggaW4gdHVy
biB3b3VsZCBtYWtlCmlzIGRlc2lyYWJsZSB0byBhbHNvIGRlYWwgd2l0aCBuZWFyIFJFVCBhcyB3
ZWxsLiBBdCB3aGljaApwb2ludCB3ZSdyZSBhYm91dCB0byBhbHNvIGRpc2N1c3MgQ0FMTC9KTVAg
d2l0aCBkaXNwbGFjZW1lbnQKb3BlcmFuZHMgYW5kIEpjYy4KCj4+IFdlIGhhdmUgX3NvbWVfIHZl
bmRvciBkZXBlbmRlbnQgYmVoYXZpb3IgYWxyZWFkeSwgYW5kIEknbQo+PiBzbG93bHkgYWRkaW5n
IHRvIGl0LiBPdXIgZmFyIGNhbGwvam1wIHN1cHBvcnQgaXMgcmF0aGVyCj4+IGluY29tcGxldGUg
aW4gb3RoZXIgd2F5cyBhbnl3YXkuCj4gCj4gVGhlcmUgaXMgZGlmZmVyZW50IHRydW5jYXRpb24g
YmVoYXZpb3VyIGZvciAlcmlwIHdoaWNoIG5lZWRzIGFsdGVyaW5nLAo+IGJ1dCB0aGF0IGlzIGEg
c2VwYXJhdGUgYXJlYSBvZiBjb2RlLsKgIEFueXRoaW5nIGVsc2U/Cgpwcm90bW9kZV9sb2FkX3Nl
ZygpIGFuZCBNT1ZTWEQgYWxyZWFkeSBoYXZlIHZlbmRvciBkZXBlbmRlbnQKY29kZSwgaWYgdGhh
dCB3YXMgeW91ciBxdWVzdGlvbi4gRm9yIHRoaW5ncyBuZWVkaW5nIGRvaW5nIHNlZQphYm92ZSBw
bHVzIExPT1AsIEpbRVJdQ1haLCBTWVNFTlRFUiwgYW5kIFNZU0VYSVQgYXMgZmFyIGFzIEknbQpj
dXJyZW50bHkgYXdhcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
