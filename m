Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DF1844FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:35:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jChax-0001kn-GD; Fri, 13 Mar 2020 10:31:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jChaw-0001ki-28
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:31:10 +0000
X-Inumbo-ID: c0ba8c8c-6515-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0ba8c8c-6515-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 10:31:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8255FADFE;
 Fri, 13 Mar 2020 10:31:08 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
 <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0248620e-7f13-cc10-0d07-173e74e106b4@suse.com>
Date: Fri, 13 Mar 2020 11:31:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxMToxNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4wMy4yMCAx
MTowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBKdWVyZ2VuLAo+Pgo+PiBPbiAxMy8wMy8y
MDIwIDA4OjA1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gU2ltaWxhciB0byBzcGlubG9ja3Mg
cHJlZW1wdGlvbiBzaG91bGQgYmUgZGlzYWJsZWQgd2hpbGUgaG9sZGluZyBhCj4+PiByd2xvY2su
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
Pj4gLS0tCj4+PiDCoCB4ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmggfCAxOCArKysrKysrKysrKysr
KysrKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCBiL3hlbi9p
bmNsdWRlL3hlbi9yd2xvY2suaAo+Pj4gaW5kZXggMWMyMjFkZDBkOS4uNGVlMzQxYTE4MiAxMDA2
NDQKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAo+Pj4gKysrIGIveGVuL2luY2x1
ZGUveGVuL3J3bG9jay5oCj4+PiBAQCAtMiw2ICsyLDcgQEAKPj4+IMKgICNkZWZpbmUgX19SV0xP
Q0tfSF9fCj4+PiDCoCAjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgo+Pj4gKyNpbmNsdWRlIDx4ZW4v
cHJlZW1wdC5oPgo+Pj4gwqAgI2luY2x1ZGUgPHhlbi9zbXAuaD4KPj4+IMKgICNpbmNsdWRlIDx4
ZW4vc3BpbmxvY2suaD4KPj4+IEBAIC01NywxMCArNTgsMTIgQEAgc3RhdGljIGlubGluZSBpbnQg
X3JlYWRfdHJ5bG9jayhyd2xvY2tfdCAqbG9jaykKPj4+IMKgwqDCoMKgwqAgY250cyA9IGF0b21p
Y19yZWFkKCZsb2NrLT5jbnRzKTsKPj4+IMKgwqDCoMKgwqAgaWYgKCBsaWtlbHkoX2Nhbl9yZWFk
X2xvY2soY250cykpICkKPj4+IMKgwqDCoMKgwqAgewo+Pgo+PiBJZiB5b3UgZ2V0IHByZWVtcHRl
ZCBoZXJlLCB0aGVuIGl0IG1lYW5zIHRoZSBjaGVjayBiZWxvdyBpcyBsaWtlbHkgZ29pbmcgCj4+
IHRvIGZhaWwuIFNvIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBkaXNhYmxlIHByZWVtcHRp
b24gYmVmb3JlLCB0byAKPj4gZ2l2ZSBtb3JlIGNoYW5jZSB0byBzdWNjZWVkLgo+IAo+IEFzIHBy
ZWVtcHRpb24gcHJvYmFiaWxpdHkgYXQgdGhpcyB2ZXJ5IHBvaW50IHNob3VsZCBiZSBtdWNoIGxv
d2VyIHRoYW4KPiB0aGF0IG9mIGhlbGQgbG9ja3MgSSB0aGluayB0aGF0IGlzIG9wdGltaXppbmcg
dGhlIHdyb25nIHBhdGguIEknbSBub3QKPiBvcHBvc2VkIGRvaW5nIHRoZSBtb2RpZmljYXRpb24g
eW91IGFyZSByZXF1ZXN0aW5nLCBidXQgd291bGQgbGlrZSB0bwo+IGhlYXIgYSBzZWNvbmQgb3Bp
bmlvbiBvbiB0aGF0IHRvcGljLCBlc3BlY2lhbGx5IGFzIEknZCBuZWVkIHRvIGFkZAo+IGFub3Ro
ZXIgcHJlZW1wdF9lbmFibGUoKSBjYWxsIHdoZW4gZm9sbG93aW5nIHlvdXIgYWR2aWNlLgoKSSBj
YW4gc2VlIGFyZ3VtZW50cyBmb3IgYm90aCBwbGFjZW1lbnRzLCBhbmQgaGVuY2UgSSdtIGZpbmUg
ZWl0aGVyCndheS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
