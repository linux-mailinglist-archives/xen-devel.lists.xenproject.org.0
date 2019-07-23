Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF1671048
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 06:00:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hplvg-0005Qx-0D; Tue, 23 Jul 2019 03:57:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hplvd-0005Qs-S6
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 03:57:29 +0000
X-Inumbo-ID: fc72c642-acfd-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fc72c642-acfd-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 03:57:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0AB6AEE9;
 Tue, 23 Jul 2019 03:57:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1907221341080.31177@sstabellini-ThinkPad-T480s>
 <32ddfaac-9f7b-bdfc-1ef4-bde1879e57c8@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <797f6f77-415d-543f-f9d1-b209eefbfc8e@suse.com>
Date: Tue, 23 Jul 2019 05:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <32ddfaac-9f7b-bdfc-1ef4-bde1879e57c8@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [BUG?] limit too low in privcmd-buf.c
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 206497@studenti.unimore.it, marco.solieri@unimore.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMTkgMjM6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjIvMDcvMjAxOSAy
MjoyMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBIaSBKdWVyZ2VuLAo+Pgo+PiBXZSBh
cmUgd29ya2luZyBvbiBhIHRlY2hub2xvZ3kgdG8gbGltaXQgY2FjaGUgaW50ZXJmZXJlbmNlIGJl
dHdlZW4KPj4gZ3Vlc3RzIHJ1bm5pbmcgb24gdGhlIHNhbWUgU29DLiBJdCB3b3JrcyB3ZWxsLCBi
dXQgYXMgYSBjb25zZXF1ZW5jZSwgYWxsCj4+IG1lbW9yeSBhbGxvY2F0aW9ucyBhcmUgNEsgb25s
eTogaGlnaGVyIGdyYW51bGFyaXRpZXMgKDJNLCAxRykgZG8gbm90Cj4+IHdvcmsgYXQgYWxsLgo+
Pgo+PiBPbmUgb2YgdGhlIGlzc3VlcyBJIGFtIHNlZWluZyBhZnRlciB1cGdyYWRpbmcgZG9tMCBr
ZXJuZWwgaXMgdGhhdCB0aGUKPj4gbGltaXQgaW4gcHJpdmNtZC1idWYuYywgd2hpY2ggaXMgNjQs
IGlzIHRvbyBsb3cuICAoUHJldmlvdXNseSBJIHdhcwo+PiB1c2luZyBhbiBvbGQga2VybmVsIHdp
dGhvdXQgcHJpdmNtZC1idWYuYy4pIFRoZSBpc3N1ZSBpcyB0aGF0IEkgY2Fubm90Cj4+IHN0YXJ0
IGEgZ3Vlc3Qgb2YgMTI4TUIgYmVjYXVzZSBtbWFwIHJldHVybnMgYW4gZXJyb3IsIHNwZWNpZmlj
YWxseSB0aGUKPj4gZm9sbG93aW5nIGNoZWNrIGluIHByaXZjbWRfYnVmX21tYXA6cHJpdmNtZF9i
dWZfbW1hcCBmYWlsczoKPj4KPj4gICAgICAgICAgaWYgKCEodm1hLT52bV9mbGFncyAmIFZNX1NI
QVJFRCkgfHwgY291bnQgPiBsaW1pdCB8fAo+PiAgICAgICAgICAgICAgZmlsZV9wcml2LT5hbGxv
Y2F0ZWQgKyBjb3VudCA+IGxpbWl0KQo+PiAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+
Cj4+IFRoZSBjaGVjayB0byBmYWlsIGlzICJmaWxlX3ByaXYtPmFsbG9jYXRlZCArIGNvdW50ID4g
bGltaXQiLgo+Pgo+PiBJbiBteSB0ZXN0cywgbGltaXQgbmVlZHMgdG8gYmUgcm91Z2hseSBzaW1p
bGFyIHRvIHRoZSBhbW91bnQgb2YgTUIgb2YKPj4gZ3Vlc3QgUkFNIGdpdmVuIHRvIHRoZSBndWVz
dC4gRm9yIGV4YW1wbGUsIHdlIHdhbnQgYSBsaW1pdCBvZiA1MTIgdG8gYmUKPj4gYWJsZSB0byBz
dGFydCBhIGd1ZXN0IHdpdGggNTEyTUIgb2YgUkFNLgo+Pgo+PiBGb3IgdGhlIG1vbWVudCwgSSBz
b2x2ZWQgdGhlIHByb2JsZW0gc2ltcGx5IGJ5IGluY3JlYXNpbmcgdGhlIGxpbWl0Lgo+PiBIb3dl
dmVyLCBJIGRvbid0IGtub3cgZm9yIHN1cmUgd2hhdCB0aGUgcmlnaHQgbGltaXQgd291bGQgYmUg
YW5kIHdoZXRoZXIKPj4gaXQgaXMgdGhlIHJpZ2h0IHdheSB0byBzb2x2ZSB0aGUgcHJvYmxlbS4K
Pj4KPj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zPwo+IAo+IFRoYXQgbGltaXQgd2FzIHJl
bW92ZWQgc2hvcnRseSBhZnRlcndhcmRzIChpdCByZWdyZXNzZWQgbWlncmF0aW5nIG9mCj4gbWVk
aXVtIHNpemVkIFZNcyksIGFuZCByZWFsbHkgb3VnaHQgdG8gaGF2ZSBoaXQgc3RhYmxlIGJ5IG5v
dy4uLgoKSXQgd2FzIGluIDQuMjAgYW5kIDQuMTggYW5kIDQuMTkgc3RhYmxlIGtlcm5lbHMgaGF2
ZSBpdC4gUHJlLTQuMTgga2VybmVsCmRvZXNuJ3QgaGF2ZSBwcml2Y21kLWJ1Zi5jLgoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
