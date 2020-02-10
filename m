Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11B6157CFD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 15:03:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j19bx-0002uW-AK; Mon, 10 Feb 2020 14:00:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j19bv-0002uR-RT
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 14:00:27 +0000
X-Inumbo-ID: b056944d-4c0d-11ea-b4c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b056944d-4c0d-11ea-b4c7-12813bfff9fa;
 Mon, 10 Feb 2020 14:00:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48765AF37;
 Mon, 10 Feb 2020 14:00:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
 <43b54452-b4e8-eaca-466b-f79480f0b2c4@suse.com>
 <cd5a5f78-8cef-88b0-51e3-9367bb7df063@citrix.com>
 <6f4fc0f8-6d3a-58f6-5a13-e9b14ca3c3cc@suse.com>
 <b9e1cc74-0d5a-53dd-3a3c-485438bb6b24@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76066c63-2536-8fac-b7b1-ee2aaae532fc@suse.com>
Date: Mon, 10 Feb 2020 15:00:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b9e1cc74-0d5a-53dd-3a3c-485438bb6b24@citrix.com>
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

T24gMTAuMDIuMjAyMCAxNDo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wMi8yMDIw
IDEzOjQ3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTAuMDIuMjAyMCAxNDoyOSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDEwLzAyLzIwMjAgMTM6MjIsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDA4LjAyLjIwMjAgMTY6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IC0t
LSBhL2RvY3MvbWlzYy9wdmgucGFuZG9jCj4+Pj4+ICsrKyBiL2RvY3MvbWlzYy9wdmgucGFuZG9j
Cj4+Pj4+IEBAIC0yMyw3ICsyMyw3IEBAIGZvbGxvd2luZyBtYWNoaW5lIHN0YXRlOgo+Pj4+PiAg
ICogYGNzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFkL2V4ZWN1dGUgY29kZSBzZWdtZW50IHdpdGgg
YSBiYXNlIG9mIOKAmDDigJkKPj4+Pj4gICAgIGFuZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbi
gJkuIFRoZSBzZWxlY3RvciB2YWx1ZSBpcyB1bnNwZWNpZmllZC4KPj4+Pj4gIAo+Pj4+PiAtICog
YGRzYCwgYGVzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFkL3dyaXRlIGRhdGEgc2VnbWVudCB3aXRo
IGEgYmFzZSBvZgo+Pj4+PiArICogYGRzYCwgYGVzYCwgYHNzYDogbXVzdCBiZSBhIDMyLWJpdCBy
ZWFkL3dyaXRlIGRhdGEgc2VnbWVudCB3aXRoIGEgYmFzZSBvZgo+Pj4+PiAgICAg4oCYMOKAmSBh
bmQgYSBsaW1pdCBvZiDigJgweEZGRkZGRkZG4oCZLiBUaGUgc2VsZWN0b3IgdmFsdWVzIGFyZSBh
bGwgdW5zcGVjaWZpZWQuCj4+Pj4gV291bGRuJ3QgdGhpcyB3YW50IGFjY29tcGFueWluZyB3aXRo
IGFuIGFkanVzdG1lbnQgdG8KPj4+PiB4ZW4vYXJjaC94ODYvaHZtL2RvbWFpbi5jOmNoZWNrX3Nl
Z21lbnQoKSwgd2hpY2ggcmlnaHQgbm93Cj4+Pj4gaXNuJ3QgaW4gbGluZSB3aXRoIGVpdGhlciBv
bGQgb3IgbmV3IHZlcnNpb24gb2YgdGhpcyBkb2M/Cj4+PiBXaGF0IGRvIHlvdSB0aGluZyBpcyBt
aXNzaW5nP8KgIEl0IHRvbyBpcyB3cml0dGVuIHdpdGggdGhlIGV4cGVjdGF0aW9uIG9mCj4+PiAl
ZXMgYmVpbmcgc2V0IHVwLCB3aGljaCBJIGNoZWNrZWQgYmVmb3JlIHNlbmRpbmcgdGhpcyBwYXRj
aC4KPj4gVGhlIGZ1bmN0aW9uIGZvciBleGFtcGxlIGxvb2tzIHRvIHBlcm1pdCB6ZXJvIHNlZ21l
bnQgYXR0cmlidXRlcwo+PiBmb3IgYm90aCBEUyBhbmQgRVMuIEl0IGFsc28gbG9va3MgdG8gcGVy
bWl0IG5vbi13cml0YWJsZQo+PiBhdHRyaWJ1dGVzIGZvciBib3RoLCBhbmQgYSBub24tcmVhZGFi
bGUgQ1MuCj4gCj4gSXQgaXMgbm90IGEgUFZILWF1ZGl0aW5nIGZ1bmN0aW9uLgo+IAo+IEl0IGlz
IHJlYWNoYWJsZSBmcm9tIHBsYWluIEhWTSBndWVzdHMsIGFuZCBpcyBvbmx5IHN1cHBvc2VkIHRv
IGJlIGEKPiBtaW5pbXVtIHNldCBvZiBjaGVja3MgdG8gcHJldmVudCBhIHZtZW50cnkgZmFpbHVy
ZSBvZiB0aGUKPiBuZXdseS1pbml0aWFsaXNlZCB2Y3B1IHN0YXRlLsKgIChXaGV0aGVyIGl0IGFj
dHVhbGx5IG1lZXRzIHRoaXMgZ29hbCBpcyBhCj4gc2VwYXJhdGUgbWF0dGVyLikKCldlbGwsIHRo
YXQncyBmaW5lLCBidXQgd2hhdCBvdGhlciBwbGFjZSBhbSBJIG1pc3NpbmcgdGhlbiB3aGVyZSB0
aGUKZG9jdW1lbnRlZCByZXN0cmljdGlvbnMgYWN0dWFsbHkgZ2V0IGVuZm9yY2VkPyBPciBpZiB3
ZSBkb24ndCBtZWFuCnRvIGVuZm9yY2UgdGhlbSwgdGhlbiBwZXJoYXBzIHRoZXJlIHNob3VsZCBi
ZSBhIGRpc3RpbmN0aW9uIGluIHRoZQpkb2MgYmV0d2VlbiAibXVzdCIgYW5kICJzaG91bGQiPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
