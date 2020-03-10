Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEC917F1BB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 09:20:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBa4P-0007D6-0b; Tue, 10 Mar 2020 08:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBa4N-0007D1-0P
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 08:16:55 +0000
X-Inumbo-ID: 7f8258b5-62a7-11ea-ad2c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f8258b5-62a7-11ea-ad2c-12813bfff9fa;
 Tue, 10 Mar 2020 08:16:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1FB11AD43;
 Tue, 10 Mar 2020 08:16:52 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20200303122750.26996-1-jgross@suse.com>
 <8bde8418-420f-6862-760e-1dd6e25b8852@suse.com>
 <247e9905-57ad-edc7-bdac-ce9dd47cc56c@suse.com>
Message-ID: <58e3214a-53e0-a033-e5fe-94f02dd733f8@suse.com>
Date: Tue, 10 Mar 2020 09:16:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <247e9905-57ad-edc7-bdac-ce9dd47cc56c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix onlining cpu with core
 scheduling active
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAgMTc6MDQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMDMuMDMuMjAgMTQ6
MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMy4wMy4yMDIwIDEzOjI3LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMKPj4+ICsrKyBi
L3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCj4+PiBAQCAtNjE2LDcgKzYxNiw4IEBAIHN0YXRp
YyBpbnQgY3B1cG9vbF9jcHVfYWRkKHVuc2lnbmVkIGludCBjcHUpCj4+PiDCoMKgwqDCoMKgIGdl
dF9zY2hlZF9yZXMoY3B1KS0+Y3B1cG9vbCA9IE5VTEw7Cj4+PiDCoMKgwqDCoMKgIGNwdXMgPSBz
Y2hlZF9nZXRfb3B0X2NwdW1hc2soY3B1cG9vbDAtPmdyYW4sIGNwdSk7Cj4+PiAtwqDCoMKgIGlm
ICggY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVzKSApCj4+PiArwqDCoMKg
IGlmICggY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVzKSAmJgo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqAgY3B1bWFza193ZWlnaHQoY3B1cykgPj0gY3B1cG9vbF9nZXRfZ3JhbnVs
YXJpdHkoY3B1cG9vbDApICkKPj4KPj4gV2h5ID49ICwgbm90ID09ID8gQW5kIGlzIHRoZSBvdGhl
ciBwYXJ0IG9mIHRoZSBjb25kaXRpb24gbmVlZGVkPwo+IAo+IEkgY2FuIHN3aXRjaCB0byA9PS4K
PiAKPj4gSXNuJ3QgdGhpcyByYXRoZXIgYSBjb25kaXRpb24gdGhhdCBjb3VsZCBiZSBBU1NFUlQo
KWVkLCBhcyBDUFVzCj4+IHNob3VsZG4ndCBtb3ZlIG91dCBvZiB0aGUgImZyZWUiIHNldCBiZWZv
cmUgcmVhY2hpbmcgdGhlCj4+IGdyYW51bGFyaXR5Pwo+IAo+IFByb2JhYmx5LCB5ZXMuIEknbGwg
Z2l2ZSBpdCBzb21lIHRlc3RpbmcgYW5kIGNoYW5nZSBpdCBpbiB0aGUgY2FzZQo+IG9mIChleHBl
Y3RlZCkgc3VjY2Vzcy4KClRoaW5raW5nIG1vcmUgYWJvdXQgaXQgSSdtIGluY2xpbmVkIHRvIGtl
ZXAgdGVzdGluZyBib3RoIGNvbmRpdGlvbnMuCkluIGNhc2Ugd2UgYXJlIHN1cHBvcnRpbmcgY3B1
cG9vbHMgd2l0aCBkaWZmZXJlbnQgZ3JhbnVsYXJpdGllcyB3ZSdsbApuZWVkIHRvIHRlc3QgZm9y
IGFsbCBjcHVzIHRvIGJlIGZyZWUgaW4gY2FzZSB0aGUgb3RoZXIgc2libGluZyBoYXMgYmVlbgpt
b3ZlZCB0byBhIGNwdXBvb2wgd2l0aCBncmFuPTEgYWxyZWFkeS4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
