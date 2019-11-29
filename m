Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CA10D3EF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:28:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadUQ-00014u-Mp; Fri, 29 Nov 2019 10:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iadUP-00014p-7T
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:27:05 +0000
X-Inumbo-ID: c98e4644-1292-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c98e4644-1292-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 10:27:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 23FDCB4DD;
 Fri, 29 Nov 2019 10:27:04 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
Date: Fri, 29 Nov 2019 11:27:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8xMS8yMDE5
IDEwOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIHN3aXRjaCBvZiBndWVzdF9jb25zb2xl
X3dyaXRlKCkncyBzZWNvbmQgcGFyYW1ldGVyIGZyb20gcGxhaW4gdG8KPj4gdW5zaWduZWQgaW50
IGhhcyBjYXVzZWQgdGhlIGZ1bmN0aW9uJ3MgbWFpbiBsb29wIGhlYWRlciB0byBubyBsb25nZXIK
Pj4gZ3VhcmQgdGhlIG1pbl90KCkgdXNlIHdpdGhpbiB0aGUgZnVuY3Rpb24gYWdhaW5zdCBlZmZl
Y3RpdmVseSBuZWdhdGl2ZQo+PiB2YWx1ZXMsIGR1ZSB0byB0aGUgY2FzdHMgaGlkZGVuIGluc2lk
ZSB0aGUgbWFjcm8uIFJlcGxhY2UgYnkgYSBwbGFpbgo+PiBtaW4oKSwgY29udmVydGluZyBvbmUg
b2YgdGhlIGFyZ3VtZW50cyBzdWl0YWJseSB3aXRob3V0IGludm9sdmluZyBhbnkKPj4gY2FzdC4K
Pj4KPj4gRml4ZXM6IGVhNjAxZWM5OTk1YiAoInhlbi9jb25zb2xlOiBSZXdvcmsgSFlQRVJDQUxM
X2NvbnNvbGVfaW8gaW50ZXJmYWNlIikKPj4gUmVwb3J0ZWQtYnk6IElsamEgVmFuIFNwcnVuZGVs
IDxpdmFuc3BydW5kZWxAaW9hY3RpdmUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+IEBAIC01MzgsNyArNTM4
LDcgQEAgc3RhdGljIGxvbmcgZ3Vlc3RfY29uc29sZV93cml0ZShYRU5fR1VFUwo+PiAgICAgICAg
ICAgICAgICAgIF9fSFlQRVJWSVNPUl9jb25zb2xlX2lvLCAiaWloIiwKPj4gICAgICAgICAgICAg
ICAgICBDT05TT0xFSU9fd3JpdGUsIGNvdW50LCBidWZmZXIpOwo+PiAgCj4+IC0gICAgICAgIGtj
b3VudCA9IG1pbl90KGludCwgY291bnQsIHNpemVvZihrYnVmKS0xKTsKPj4gKyAgICAgICAga2Nv
dW50ID0gbWluKGNvdW50ICsgc2l6ZW9mKGNoYXJbMF0pLCBzaXplb2Yoa2J1ZikgLSAxKTsKPiAK
PiBJcyBzaXplb2YoYXJyYXlbMF0pIGFsd2F5cyAwLCBvciBpcyB0aGlzIGp1c3QgYSBHQ0MtaXNt
ID/CoCBHb2Rib2x0Cj4gc3VnZ2VzdHMgaXMgMCBvbiBhbGwgY29tcGlsZXIgd2Ugc3VwcG9ydC4K
PiAKPiBFaXRoZXIgd2F5LCBpc24ndCB0aGUgbW9yZSBjb21tb24gaWRpb20gKyAwdWwgP8KgIFBl
cnNvbmFsbHksIEkgZmVlbCB0aGF0Cj4gaXMgY2xlYXJlciB0byBmb2xsb3cuCgpJIGRlY2lkZWQg
YWdhaW5zdCArIDB1bCBvciBhbGlrZSBiZWNhdXNlIGluIHByaW5jaXBsZSBzaXplX3QKYW5kIHVu
c2lnbmVkIGxvbmcgYXJlIGRpZmZlcmVudCB0eXBlcy4gSW4gcGFydGljdWxhciAzMi1iaXQKeDg2
IGdjYyB1c2VzIHVuc2lnbmVkIGludCBmb3Igc2l6ZV90LCBhbmQgaGVuY2UgbWluKCkncwp0eXBl
IHNhZmV0eSBjaGVjayB3b3VsZCBjYXVzZSB0aGUgYnVpbGQgdG8gZmFpbCB0aGVyZS4gVGhlCnNh
bWUgcmlzayBvYnZpb3VzbHkgZXhpc3RzIGZvciBhbnkgMzItYml0IGFyY2ggKGUuZy4gQXJtMzIs
CmJ1dCBJIGhhdmVuJ3QgY2hlY2tlZCB3aGF0IHR5cGUgaXQgYWN0dWFsbHkgdXNlcykuCgo+IFRo
YXQgc2FpZCwgZ2l2ZW4gdGhlIHNldmVyaXR5IGFuZCB1cmdlbmN5IG9mIHRoaXMKPiBleHRyZW1l
bHktbHVja3ktaXRzLW5vdC1hbi1YU0EsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyCj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCBidXQgaWRlYWxseSB1c2luZyB0aGUgKzB1bCBmb3Jt
LgoKVGhhbmtzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
