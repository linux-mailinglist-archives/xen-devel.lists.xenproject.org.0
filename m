Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EADC05EF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:02:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDprW-0003SH-VJ; Fri, 27 Sep 2019 13:00:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDprV-0003S7-Jo
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:00:41 +0000
X-Inumbo-ID: ce96c8e8-e126-11e9-9678-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ce96c8e8-e126-11e9-9678-12813bfff9fa;
 Fri, 27 Sep 2019 13:00:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC07AB166;
 Fri, 27 Sep 2019 13:00:39 +0000 (UTC)
To: hongyax@amazon.com
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
 <20190926142657.mc3y7i4ovz6hvua6@debian>
 <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9cc437b-add6-3a71-be44-c5d5b74b9d8f@suse.com>
Date: Fri, 27 Sep 2019 15:00:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxNDo1NCwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IE9uIDI2LzA5
LzIwMTkgMTU6MjYsIFdlaSBMaXUgd3JvdGU6Cj4+IE9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDEw
OjQ2OjM0QU0gKzAxMDAsIGhvbmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4gQEAgLTEz
NjcsNyArMTM2Nyw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVk
IGxvbmcgbWJpX3ApCj4+PiAgIAo+Pj4gICAgICAgICAgICAgICBpZiAoIG1hcF9lIDwgZW5kICkK
Pj4+ICAgICAgICAgICAgICAgewo+Pj4gLSAgICAgICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVu
KCh1bnNpZ25lZCBsb25nKV9fdmEobWFwX2UpLCBtYWRkcl90b19tZm4obWFwX2UpLAo+Pj4gKyAg
ICAgICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKV9fdmEobWFwX2Up
LCBJTlZBTElEX01GTiwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEZO
X0RPV04oZW5kIC0gbWFwX2UpLCBQQUdFX0hZUEVSVklTT1IpOwo+Pgo+PiBXaHkgZG9uJ3QgeW91
IGp1c3QgcmVtb3ZlIHRoZSBjYWxscyB0byBtYXBfcGFnZXNfdG9feGVuPwo+Pgo+IAo+IE15IGlu
dGVudGlvbiBpcyB0byBwcmUtcG9wdWxhdGUgdGhlIHJhbmdlIHNvIHRoYXQgd2UgZG9uJ3QgaGF2
ZSB0byBkbyBzbyBsYXRlciAKPiB3aGVuIHRoZXJlIGFyZSB4ZW5oZWFwIGFsbG9jYXRpb25zLiBC
dXQgb2YgY291cnNlIGlmIHRoZXJlIGlzIHN1cGVycGFnZSBtZXJnaW5nIAo+IG9yIHNoYXR0ZXJp
bmcsIHBhZ2UgdGFibGVzIHdpbGwgYmUgcmVtb3ZlZCBvciBhbGxvY2F0ZWQgYW55d2F5LiBJIHdp
bGwgcmVtb3ZlIAo+IHRoZSBjYWxscyBpbiB0aGUgbmV4dCByZXZpc2lvbi4KClByZS1wb3B1bGF0
ZT8gVGhlcmUncyBzb21lIGNvbmNlcHRpb25hbCBxdWVzdGlvbiB0aGVuOiBXaGVuIHRoZQpkaXJl
Y3QgbWFwIGlzIGdvbmUsIGFyZSB5b3UgbWFwcGluZyBYZW4gaGVhcCBwYWdlcyBpbnRvIHRoZSBw
bGFjZQp0aGV5J2QgaGF2ZSBsaXZlZCBhdCBpbiB0aGUgZGlyZWN0IG1hcD8gSSdtIG5vdCBjb252
aW5jZWQgdGhhdCdzCndoYXQgd2Ugd2FudC4gSW4gZmFjdCBJJ20gbm90IGNvbnZpbmNlZCB3ZSdk
IHdhbnQgdG8gcmV0YWluIHRoZQpkaXN0aW5jdGlvbiBiZXR3ZWVuIFhlbiBoZWFwIGFuZCBkb21h
aW4gaGVhcCB0aGVuIGFueSBmdXJ0aGVyIC0KdGhlcmUncyBubyByZWFzb24gYW55bW9yZSBhdCB0
aGF0IHBvaW50IChhZmFpY3QpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
