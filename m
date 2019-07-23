Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58F71D5D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 19:07:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpyBE-0006RH-Ua; Tue, 23 Jul 2019 17:02:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlUe=VU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpyBD-0006RC-U7
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 17:02:23 +0000
X-Inumbo-ID: a37e4dd2-ad6b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a37e4dd2-ad6b-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 17:02:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98628337;
 Tue, 23 Jul 2019 10:02:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2515C3F71A;
 Tue, 23 Jul 2019 10:02:21 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrii Anisov <andrii.anisov@gmail.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
 <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
 <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
 <6e608435-a414-320b-307a-a413c82cf9aa@arm.com>
 <a3b0d7ed-db9d-9c03-9fef-1b42b02b3f4b@gmail.com>
 <039019e1-ac02-019f-9ce1-78ed64198d5e@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6b629a1d-7179-26d5-3581-1034eb7aba57@arm.com>
Date: Tue, 23 Jul 2019 18:02:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <039019e1-ac02-019f-9ce1-78ed64198d5e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjMvMDcvMjAxOSAxMDoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjMu
MDcuMjAxOSAxMDo0OCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gSnVsaWVuLCBKYW4sIEFuZHJl
dywKPj4KPj4gVGhlIHByb2JsZW0gYWRkcmVzc2VkIGJ5IFsxXSBjYXVzZXMgcmFuZG9tIEFSTTY0
IGJvb3QgZmFpbHMgZGVwZW5kZW50IG9uIGh5cGVydmlzb3IgY29kZSBjaGFuZ2VzLgo+PiBZZXQg
bW9yZSBnZW5lcmljIHNvbHV0aW9uIHdhcyByZXF1ZXN0ZWQgYnkgQW5kcmV3IGFuZCBzdXBwb3J0
ZWQgYnkgSnVsaWVuIFsyXS4KPj4KPj4gSG93IHRvIHByb2NlZWQgd2l0aCB0aGlzIHBhcnRpY3Vs
YXIgcGF0Y2g/Cj4+IEFzIEkgdW5kZXJzdGFuZCwgSmFuIGRvdWJ0cyB3ZSBzaG91bGQgbW92ZSBw
YWdlIGFsaWdubWVudCB0byB2dW5tYXAoKSwgd2hpbGUgSnVsaWVuIGFuZCBBbmRyZXcgd2FudGVk
IHRoZSBjb21taXQgbWVzc2FnZSBjbGFyaWZpY2F0aW9uLgo+PiBDYW4gd2UgaGF2ZSBhbiBhZ3Jl
ZW1lbnQgb24gYXBwcm9hY2ggaGVyZT8KPj4KPj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTE2Ny5odG1sCj4+IFsy
XSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTktMDcvbXNnMDExMjkuaHRtbAo+IAo+IEZpcnN0IG9mIGFsbCwgbGV0IG1lIHF1b3RlIExpbnV4
J2VzIGNvZGU6Cj4gCj4gc3RhdGljIHZvaWQgX192dW5tYXAoY29uc3Qgdm9pZCAqYWRkciwgaW50
IGRlYWxsb2NhdGVfcGFnZXMpCj4gewo+IAlzdHJ1Y3Qgdm1fc3RydWN0ICphcmVhOwo+IAo+IAlp
ZiAoIWFkZHIpCj4gCQlyZXR1cm47Cj4gCj4gCWlmIChXQVJOKCFQQUdFX0FMSUdORUQoYWRkciks
ICJUcnlpbmcgdG8gdmZyZWUoKSBiYWQgYWRkcmVzcyAoJXApXG4iLAo+IAkJCWFkZHIpKQo+IAkJ
cmV0dXJuOwo+IAo+IEFzIGxvbmcgYXMgd2UgYWltIHRvIGhhdmUgYSByZWFzb25hYmxlIGxldmVs
IG9mIGNvbXBhdGliaWxpdHkgb2YKPiBzaW1pbGFyIGludGVyZmFjZXMsIHdlIHNob3VsZCBub3Qg
Z28gdGhlIHN1Z2dlc3RlZCByb3V0ZS4KCldlbGwsIGl0IGlzIG1vcmUgbGlrZWx5IHRvIGhhdmUg
TGludXggY29kZSBtb3ZpbmcgdG8gWGVuIGNvbXBhcmUgdG8gdGhlIApvcHBvc2l0ZS4gU28gdGhl
IGNoYW5nZSBzdWdnZXN0ZWQgaXMgc3RpbGwgY29tcGF0aWJsZSBhcyB3ZSBkb24ndCByZXN0cmlj
dCAKYW55dGhpbmcgYnV0IGp1c3Qgb3BlbiBtb3JlIGZsZXhpYmlsaXR5LgoKPiAKPiBCZXlvbmQg
dGhhdCBJIGNvbnRpbnVlIHRvIGJlIG9mIHRoZSBvcGluaW9uIHRoYXQgaXQgc2hvdWxkIGJlCj4g
YWxsLW9yLW5vdGhpbmc6IEFueSBwb2ludGVyIHBvaW50aW5nIGFueXdoZXJlIGF0IG9yIGluc2lk
ZSB0aGUKPiByZWdpb24gc2hvdWxkIGJlIGFjY2VwdGVkLCBvciBqdXN0IHRoZSBvbmUgcG9pbnRp
bmcgcHJlY2lzZWx5IGF0Cj4gdGhlIHN0YXJ0LgpUaGF0J3MgZmluZSwgYnV0IHdlIGNhbiBzdGls
bCBhY2hpZXZlIHRoaXMgc3RlcCBieSBzdGVwLi4uIEhhbmRsaW5nIHVuYWxpZ25lZCAKYWRkcmVz
cyBpcyBxdWl0ZSBlYXN5LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
