Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE7165816
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 07:58:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4flS-0003Rs-4t; Thu, 20 Feb 2020 06:56:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4flQ-0003Rn-4f
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 06:56:48 +0000
X-Inumbo-ID: 29631ffc-53ae-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29631ffc-53ae-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 06:56:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E89D8AD33;
 Thu, 20 Feb 2020 06:56:46 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20200123085504.30911-1-jgross@suse.com>
 <95f651ddc1639d1c498067e4af71759585aa48b3.camel@suse.com>
 <6aff04ca-904b-cf27-d6f4-af9a146e4c04@suse.com>
 <865b2b41d62a236f62a70e67bdc424e4ed336886.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <40a41da6-64a0-d332-c544-0eb937204fa6@suse.com>
Date: Thu, 20 Feb 2020 07:56:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <865b2b41d62a236f62a70e67bdc424e4ed336886.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: rework credit2 run-queue
 allocation
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTk6MzcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAyMC0w
Mi0xOSBhdCAxNzo1MiArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjAg
MTc6NDcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4gT24gVGh1LCAyMDIwLTAxLTIzIGF0IDA5
OjU1ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9jb21tb24vc2No
ZWQvY3JlZGl0Mi5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMKPj4+PiBA
QCAtODQ5LDUxICs4MjIsNzEgQEAgc3RhdGljIGlubGluZSBib29sIHNhbWVfY29yZSh1bnNpZ25l
ZCBpbnQKPj4+PiBjcHVhLAo+Pj4+IHVuc2lnbmVkIGludCBjcHViKQo+Pj4+ICAgICAgICAgICAg
ICBjcHVfdG9fY29yZShjcHVhKSA9PSBjcHVfdG9fY29yZShjcHViKTsKPj4+PiAgIH0KPj4+PiAg
IAo+Pj4+IC1zdGF0aWMgdW5zaWduZWQgaW50Cj4+Pj4gLWNwdV90b19ydW5xdWV1ZShjb25zdCBz
dHJ1Y3QgY3NjaGVkMl9wcml2YXRlICpwcnYsIHVuc2lnbmVkIGludAo+Pj4+IGNwdSkKPj4+PiAr
c3RhdGljIHN0cnVjdCBjc2NoZWQyX3J1bnF1ZXVlX2RhdGEgKgo+Pj4+ICtjcHVfYWRkX3RvX3J1
bnF1ZXVlKHN0cnVjdCBjc2NoZWQyX3ByaXZhdGUgKnBydiwgdW5zaWduZWQgaW50Cj4+Pj4gY3B1
KQo+Pj4+ICAgewo+Pj4+IC0gICAgY29uc3Qgc3RydWN0IGNzY2hlZDJfcnVucXVldWVfZGF0YSAq
cnFkOwo+Pj4+IC0gICAgdW5zaWduZWQgaW50IHJxaTsKPj4+PiArICAgIHN0cnVjdCBjc2NoZWQy
X3J1bnF1ZXVlX2RhdGEgKnJxZCwgKnJxZF9uZXc7Cj4+Pj4gKyAgICBzdHJ1Y3QgbGlzdF9oZWFk
ICpycWRfaW5zOwo+Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4+PiArICAgIGludCBy
cWkgPSAwOwo+Pj4+ICsgICAgYm9vbCBycWlfdW51c2VkID0gZmFsc2UsIHJxZF92YWxpZCA9IGZh
bHNlOwo+Pj4+ICsKPj4+PiArICAgIHJxZF9uZXcgPSB4emFsbG9jKHN0cnVjdCBjc2NoZWQyX3J1
bnF1ZXVlX2RhdGEpOwo+Pj4+ICAgCj4+Pj4KPj4+IFNvLCBJJ20gbm90IHN1cmUgSSBzZWUgd2h5
IGl0J3MgYmV0dGVyIHRvIGFsbG9jYXRpbmcgdGhpcyBoZXJlLCBhbmQKPj4+IHRoZW4gZnJlZSBp
dCBpZiB3ZSBkaWRuJ3QgbmVlZCBpdCwgaW5zdGVhZCB0aGFuIGFsbG9jYXRpbmcgaXQKPj4+IGxh
dGVyLAo+Pj4gb25seSBpZiB3ZSBhY3R1YWxseSBuZWVkIGl0Li4uIFdoYXQgYW0gSSBtaXNzaW5n
PyA6LSkKPj4KPj4gV2hlcmUgcG9zc2libGUgd2Ugc2hvdWxkIHRyeSB0byBhdm9pZCBjYWxsaW5n
IGFsbG9jYXRpb24gZnVuY3Rpb25zCj4+IHdpdGggbG9ja3MgaGVsZC4KPj4KPiBBaCwgc3VyZSwg
dGhhdCdzIGEgdmVyeSBnb29kIHJlYXNvbiBpbmRlZWQsIG15IGJhZCBub3Qgbm90aWNpbmcgdGhh
dAo+IGRvaW5nIHRoaXMgbGlrZSB0aGF0IHRoZSBhbGxvY2F0aW9uIHNpdHMgb3V0c2lkZSBvZiB0
aGUgd3JpdGVfbG9jaygpCj4gc2VjdGlvbi4KPiAKPiBOZXZlcnRoZWxlc3MsIEknZCBhZGQgYSBx
dWljayBjb21tZW50IGFib3V0IHRoYXQsIHRvIG1ha2UgaXQgZXZlbiBtb3JlCj4gb2J2aW91cy4g
Oi0pCgpEbyB3ZSByZWFsbHkgbmVlZCB0aGF0PwoKQ2FsbGluZyBhbnkgb2YgdGhlIGFsbG9jIGZ1
bmN0aW9ucyB3aXRoIGludGVycnVwdHMgb2ZmIHdpbGwgY3Jhc2ggdGhlCnN5c3RlbSAoYXQgbGVh
c3QgaW4gZGVidWcgYnVpbGRzKS4KCkkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBhZGQgc3VjaCBj
b21tZW50cyBhbGwgb3ZlciB0aGUgY29kZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
