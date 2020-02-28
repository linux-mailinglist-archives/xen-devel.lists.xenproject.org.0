Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D0173863
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:31:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fhP-0006jq-Dw; Fri, 28 Feb 2020 13:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7fhN-0006j1-Ls
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:29:01 +0000
X-Inumbo-ID: 47b4e176-5a2e-11ea-83b0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b4e176-5a2e-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 13:29:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDB8FAC44;
 Fri, 28 Feb 2020 13:28:59 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7df3df82-c6c3-37ab-3123-cd2894268b4d@suse.com>
Date: Fri, 28 Feb 2020 14:29:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86/hvm: allow ASID flush when v !=
 current
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgaW1w
bGVtZW50YXRpb24gb2YgaHZtX2FzaWRfZmx1c2hfdmNwdSBpcyBub3Qgc2FmZSB0byB1c2UKPiB1
bmxlc3MgdGhlIHRhcmdldCB2Q1BVIGlzIGVpdGhlciBwYXVzZWQgb3IgdGhlIGN1cnJlbnRseSBy
dW5uaW5nIG9uZSwKPiBhcyBpdCBtb2RpZmllcyB0aGUgZ2VuZXJhdGlvbiB3aXRob3V0IGFueSBs
b2NraW5nLgoKSW5kZWVkLCBidXQgdGhlIGlzc3VlIHlvdSdyZSB0YWtpbmcgY2FyZSBvZiBpcyBo
aWdobHkgdGhlb3JldGljYWw6CkkgZG9uJ3QgdGhpbmsgYW55IHNhbmUgY29tcGlsZXIgd2lsbCBz
cGxpdCB3cml0ZXMgb2YgdGhlIGZpZWxkcwp0byBtdWx0aXBsZSBpbnNucy4gSXQgd291bGQgYmUg
bmljZSBpZiB0aGlzIHdhcyBtYWRlIGNsZWFyIGhlcmUuCgo+IEZpeCB0aGlzIGJ5IHVzaW5nIGF0
b21pYyBvcGVyYXRpb25zIHdoZW4gYWNjZXNzaW5nIHRoZSBnZW5lcmF0aW9uCj4gZmllbGQsIGJv
dGggaW4gaHZtX2FzaWRfZmx1c2hfdmNwdV9hc2lkIGFuZCBvdGhlciBBU0lEIGZ1bmN0aW9ucy4g
VGhpcwo+IGFsbG93cyB0byBzYWZlbHkgZmx1c2ggdGhlIGN1cnJlbnQgQVNJRCBnZW5lcmF0aW9u
LiBOb3RlIHRoYXQgZm9yIHRoZQo+IGZsdXNoIHRvIHRha2UgZWZmZWN0IGlmIHRoZSB2Q1BVIGlz
IGN1cnJlbnRseSBydW5uaW5nIGEgdm1leGl0IGlzCj4gcmVxdWlyZWQuCj4gCj4gTm90ZSB0aGUg
c2FtZSBjb3VsZCBiZSBhY2hpZXZlZCBieSBpbnRyb2R1Y2luZyBhbiBleHRyYSBmaWVsZCB0bwo+
IGh2bV92Y3B1X2FzaWQgdGhhdCBzaWduYWxzIGh2bV9hc2lkX2hhbmRsZV92bWVudGVyIHRoZSBu
ZWVkIHRvIGNhbGwKPiBodm1fYXNpZF9mbHVzaF92Y3B1IG9uIHRoZSBnaXZlbiB2Q1BVIGJlZm9y
ZSB2bWVudHJ5LCB0aGlzIGhvd2V2ZXIKPiBzZWVtcyB1bm5lY2Vzc2FyeSBhcyBodm1fYXNpZF9m
bHVzaF92Y3B1IGl0c2VsZiBvbmx5IHNldHMgdHdvIHZDUFUKPiBmaWVsZHMgdG8gMCwgc28gdGhl
cmUncyBubyBuZWVkIHRvIGRlbGF5IHRoaXMgdG8gdGhlIHZtZW50cnkgQVNJRAo+IGhlbHBlci4K
PiAKPiBUaGlzIGlzIG5vdCBhIGJ1Z2ZpeCBhcyBubyBjYWxsZXJzIHRoYXQgd291bGQgdmlvbGF0
ZSB0aGUgYXNzdW1wdGlvbnMKPiBsaXN0ZWQgaW4gdGhlIGZpcnN0IHBhcmFncmFwaCBoYXZlIGJl
ZW4gZm91bmQsIGJ1dCBhIHByZXBhcmF0b3J5Cj4gY2hhbmdlIGluIG9yZGVyIHRvIGFsbG93IHJl
bW90ZSBmbHVzaGluZyBvZiBIVk0gdkNQVXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CgpXaXRoIGEgc3VpdGFibGUgY2xhcmlmaWNhdGlvbiBhZGRlZApBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
