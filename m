Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F787CC6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 16:31:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw5sI-0004NO-5z; Fri, 09 Aug 2019 14:28:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw5sG-0004NJ-61
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:28:08 +0000
X-Inumbo-ID: e6d68fab-bab1-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6d68fab-bab1-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:28:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1F7D3AD3A;
 Fri,  9 Aug 2019 14:28:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d1ae0cb5-2dfb-7984-62ec-19f7f5a5abaf@suse.com>
 <2796108d-26af-2520-feb7-2f091ad82ec3@suse.com>
 <835d449c-6c7e-5315-cb36-d34ac932812f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f37f2f5-5384-4e97-1a11-f454c61c5e86@suse.com>
Date: Fri, 9 Aug 2019 16:28:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <835d449c-6c7e-5315-cb36-d34ac932812f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/link: Introduce
 .bss.percpu.page_aligned
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDEzOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW5zZXJ0IGV4cGxpY2l0IGFsaWdubWVudCBz
dWNoIHRoYXQgdGhlIHJlc3VsdCBpcyBzYWZlIGV2ZW4gd2l0aCBvYmplY3RzCj4+IHNob3J0ZXIg
dGhhbiBhIHBhZ2UgaW4gbGVuZ3RoLsKgIFRoZSBQT0lOVEVSX0FMSUdOIGZvciBfX2Jzc19lbmQg
aXMgdG8KPj4gY292ZXIKPj4gdGhlIGxhY2sgb2YgU01QX0NBQ0hFX0JZVEVTIGFsaWdubWVudCwg
YXMgdGhlIGxvb3BzIHdoaWNoIHplcm8gdGhlIEJTUwo+PiB1c2UKPj4gcG9pbnRlci1zaXplZCBz
dG9yZXMgb24gYWxsIGFyY2hpdGVjdHVyZXMuCj4gCj4gLi4uCj4gCj4+IHY0Ogo+PiAgwqAqIERy
b3Agc3RyYXkgdHJhaWxpbmcgQUxJR04oKS4gTWFrZSBERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdO
RUQoKSB2ZXJpZnkKPj4gIMKgwqAgdGhlIGFsaWdubWVudCByYXRoZXIgdGhhbiBzcGVjaWZ5aW5n
IGl0Lgo+IAo+IE15IGZlZWxpbmdzIGFib3V0IHRoZSBzdHJheS1uZXNzIG9mIEFMSUdOKCkgbm90
d2l0aHN0YW5kaW5nLCB0aGUgY29tbWl0Cj4gbWVzc2FnZSBub3cgd3JvbmcgYW5kIG5lZWRzIGNv
cnJlY3RpbmcuCgpPaCwgaW5kZWVkLCBhbmQgbm90IGp1c3QgZm9yIHRoaXMgYXNwZWN0LgoKPj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL3BlcmNwdS5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9w
ZXJjcHUuaAo+PiBAQCAtOSw5ICs5LDE3IEBACj4+ICDCoCAqIFRoZSBfIyNuYW1lIGNvbmNhdGVu
YXRpb24gaXMgYmVpbmcgdXNlZCBoZXJlIHRvIHByZXZlbnQgJ25hbWUnCj4+IGZyb20gZ2V0dGlu
Zwo+PiAgwqAgKiBtYWNybyBleHBhbmRlZCwgd2hpbGUgc3RpbGwgYWxsb3dpbmcgYSBwZXItYXJj
aGl0ZWN0dXJlIHN5bWJvbAo+PiBuYW1lIHByZWZpeC4KPj4gIMKgICovCj4+IC0jZGVmaW5lIERF
RklORV9QRVJfQ1BVKHR5cGUsIG5hbWUpIF9fREVGSU5FX1BFUl9DUFUodHlwZSwgXyMjbmFtZSwg
KQo+PiArI2RlZmluZSBERUZJTkVfUEVSX0NQVSh0eXBlLCBuYW1lKSBcCj4+ICvCoMKgwqAgX19E
RUZJTkVfUEVSX0NQVShfX3NlY3Rpb24oIi5ic3MucGVyY3B1IiksIHR5cGUsIF8gIyMgbmFtZSkK
Pj4gKwo+PiArI2RlZmluZSBERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQodHlwZSwgbmFtZSkg
XAo+PiArwqDCoMKgIHR5cGVkZWYgY2hhciBuYW1lICMjIF9jaGtfdFtCVUlMRF9CVUdfT05fWkVS
TyhfX2FsaWdub2YodHlwZSkgJiBcCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAoUEFHRV9TSVpFIC0gMSkpXTsgXAo+PiArwqDCoMKgIF9fREVGSU5FX1BFUl9D
UFUoX19zZWN0aW9uKCIuYnNzLnBlcmNwdS5wYWdlX2FsaWduZWQiKSwgXAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eXBlLCBfICMjIG5hbWUpCj4gCj4gSSB0
aGluayB0aGlzIHdvdWxkIGJlIGVhc2llciB0byByZWFkIGFzOgo+IAo+ICNkZWZpbmUgREVGSU5F
X1BFUl9DUFVfUEFHRV9BTElHTkVEKHR5cGUsIG5hbWUpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPiAgwqDCoMKgIHR5cGVkZWYgY2hhciBuYW1lICMjIF9jaGtfdFvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+ICDC
oMKgwqDCoMKgwqDCoCBCVUlMRF9CVUdfT05fWkVSTyhfX2FsaWdub2YodHlwZSkgJiAoUEFHRV9T
SVpFIC0gMSkpXTsgXAo+ICDCoMKgwqAgX19ERUZJTkVfUEVSX0NQVShfX3NlY3Rpb24oIi5ic3Mu
cGVyY3B1LnBhZ2VfYWxpZ25lZCIpLMKgwqDCoCBcCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdHlwZSwgXyAjIyBuYW1lKQo+IAo+IAo+IEJ5IG5vdCBicmVha2lu
ZyBpbXBvcnRhbnQgYml0IG9mIGxvZ2ljIGFjcm9zcyBhIG5ld2xpbmUuCgpXaWxsIGRvLgoKPiBQ
cmVmZXJhYmx5IHdpdGggdGhpcyBjaGFuZ2VkLCBidXQgZGVmaW5pdGVseSB3aXRoIHRoZSBjb21t
aXQgbWVzc2FnZQo+IGZpeGVkLCBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClRoYW5rcywgSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
