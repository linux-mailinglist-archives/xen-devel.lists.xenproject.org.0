Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865B157DE3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 15:54:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1APa-0007kV-Hx; Mon, 10 Feb 2020 14:51:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1APZ-0007kQ-EF
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:51:45 +0000
X-Inumbo-ID: da6e3134-4c14-11ea-b4d5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da6e3134-4c14-11ea-b4d5-12813bfff9fa;
 Mon, 10 Feb 2020 14:51:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1A834AC4A;
 Mon, 10 Feb 2020 14:51:43 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
 <43b54452-b4e8-eaca-466b-f79480f0b2c4@suse.com>
 <cd5a5f78-8cef-88b0-51e3-9367bb7df063@citrix.com>
 <6f4fc0f8-6d3a-58f6-5a13-e9b14ca3c3cc@suse.com>
 <b9e1cc74-0d5a-53dd-3a3c-485438bb6b24@citrix.com>
 <76066c63-2536-8fac-b7b1-ee2aaae532fc@suse.com>
 <388ca644-ce0f-8ddd-4db2-31be232af6e6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcdff077-b1ea-d5c4-1801-51e0cd6de201@suse.com>
Date: Mon, 10 Feb 2020 15:51:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <388ca644-ce0f-8ddd-4db2-31be232af6e6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxNTowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wMi8yMDIw
IDE0OjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMDIuMjAyMCAxNDo1NiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDEwLzAyLzIwMjAgMTM6NDcsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDEwLjAyLjIwMjAgMTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9u
IDEwLzAyLzIwMjAgMTM6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDguMDIuMjAy
MCAxNjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+PiAtLS0gYS9kb2NzL21pc2MvcHZo
LnBhbmRvYwo+Pj4+Pj4+ICsrKyBiL2RvY3MvbWlzYy9wdmgucGFuZG9jCj4+Pj4+Pj4gQEAgLTIz
LDcgKzIzLDcgQEAgZm9sbG93aW5nIG1hY2hpbmUgc3RhdGU6Cj4+Pj4+Pj4gICAqIGBjc2A6IG11
c3QgYmUgYSAzMi1iaXQgcmVhZC9leGVjdXRlIGNvZGUgc2VnbWVudCB3aXRoIGEgYmFzZSBvZiDi
gJgw4oCZCj4+Pj4+Pj4gICAgIGFuZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbigJkuIFRoZSBz
ZWxlY3RvciB2YWx1ZSBpcyB1bnNwZWNpZmllZC4KPj4+Pj4+PiAgCj4+Pj4+Pj4gLSAqIGBkc2As
IGBlc2A6IG11c3QgYmUgYSAzMi1iaXQgcmVhZC93cml0ZSBkYXRhIHNlZ21lbnQgd2l0aCBhIGJh
c2Ugb2YKPj4+Pj4+PiArICogYGRzYCwgYGVzYCwgYHNzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFk
L3dyaXRlIGRhdGEgc2VnbWVudCB3aXRoIGEgYmFzZSBvZgo+Pj4+Pj4+ICAgICDigJgw4oCZIGFu
ZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbigJkuIFRoZSBzZWxlY3RvciB2YWx1ZXMgYXJlIGFs
bCB1bnNwZWNpZmllZC4KPj4+Pj4+IFdvdWxkbid0IHRoaXMgd2FudCBhY2NvbXBhbnlpbmcgd2l0
aCBhbiBhZGp1c3RtZW50IHRvCj4+Pj4+PiB4ZW4vYXJjaC94ODYvaHZtL2RvbWFpbi5jOmNoZWNr
X3NlZ21lbnQoKSwgd2hpY2ggcmlnaHQgbm93Cj4+Pj4+PiBpc24ndCBpbiBsaW5lIHdpdGggZWl0
aGVyIG9sZCBvciBuZXcgdmVyc2lvbiBvZiB0aGlzIGRvYz8KPj4+Pj4gV2hhdCBkbyB5b3UgdGhp
bmcgaXMgbWlzc2luZz/CoCBJdCB0b28gaXMgd3JpdHRlbiB3aXRoIHRoZSBleHBlY3RhdGlvbiBv
Zgo+Pj4+PiAlZXMgYmVpbmcgc2V0IHVwLCB3aGljaCBJIGNoZWNrZWQgYmVmb3JlIHNlbmRpbmcg
dGhpcyBwYXRjaC4KPj4+PiBUaGUgZnVuY3Rpb24gZm9yIGV4YW1wbGUgbG9va3MgdG8gcGVybWl0
IHplcm8gc2VnbWVudCBhdHRyaWJ1dGVzCj4+Pj4gZm9yIGJvdGggRFMgYW5kIEVTLiBJdCBhbHNv
IGxvb2tzIHRvIHBlcm1pdCBub24td3JpdGFibGUKPj4+PiBhdHRyaWJ1dGVzIGZvciBib3RoLCBh
bmQgYSBub24tcmVhZGFibGUgQ1MuCj4+PiBJdCBpcyBub3QgYSBQVkgtYXVkaXRpbmcgZnVuY3Rp
b24uCj4+Pgo+Pj4gSXQgaXMgcmVhY2hhYmxlIGZyb20gcGxhaW4gSFZNIGd1ZXN0cywgYW5kIGlz
IG9ubHkgc3VwcG9zZWQgdG8gYmUgYQo+Pj4gbWluaW11bSBzZXQgb2YgY2hlY2tzIHRvIHByZXZl
bnQgYSB2bWVudHJ5IGZhaWx1cmUgb2YgdGhlCj4+PiBuZXdseS1pbml0aWFsaXNlZCB2Y3B1IHN0
YXRlLsKgIChXaGV0aGVyIGl0IGFjdHVhbGx5IG1lZXRzIHRoaXMgZ29hbCBpcyBhCj4+PiBzZXBh
cmF0ZSBtYXR0ZXIuKQo+PiBXZWxsLCB0aGF0J3MgZmluZSwgYnV0IHdoYXQgb3RoZXIgcGxhY2Ug
YW0gSSBtaXNzaW5nIHRoZW4gd2hlcmUgdGhlCj4+IGRvY3VtZW50ZWQgcmVzdHJpY3Rpb25zIGFj
dHVhbGx5IGdldCBlbmZvcmNlZD8gT3IgaWYgd2UgZG9uJ3QgbWVhbgo+PiB0byBlbmZvcmNlIHRo
ZW0sIHRoZW4gcGVyaGFwcyB0aGVyZSBzaG91bGQgYmUgYSBkaXN0aW5jdGlvbiBpbiB0aGUKPj4g
ZG9jIGJldHdlZW4gIm11c3QiIGFuZCAic2hvdWxkIj8KPiAKPiBUaGUgd3JpdHRlbiBBQkkgaXMg
dGhlIEFCSS7CoCBDb25mb3JtaW5nIGltcGxlbWVudGF0aW9ucyBtdXN0IChhcyBpbgo+IG11c3Qp
IGZvbGxvdyB0aGUgcnVsZXMuCj4gCj4gVGhlIGRvbWFpbiBidWlsZGVyKHMpIGFyZSB0aGUgb25s
eSBwbGFjZXMgd2hpY2gga25vd3MgdGhhdCB0aGUgUFZIIHN0YXJ0Cj4gQUJJIGlzIGluIHVzZS4K
Ckxvb2tzIGxpa2UgSSBnb3QgY29uZnVzZWQgLSBJJ20gc29ycnkgZm9yIHRoZSBub2lzZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
