Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE416FC78
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:47:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uC7-0005Ca-CJ; Wed, 26 Feb 2020 10:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6uC6-0005CV-2k
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:45:34 +0000
X-Inumbo-ID: 1d3ebb7e-5885-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d3ebb7e-5885-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 10:45:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4774ACCE;
 Wed, 26 Feb 2020 10:45:32 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
 <20200224104645.96381-5-roger.pau@citrix.com>
 <cae27b7b-1690-7273-635e-95584a474fa5@suse.com>
 <20200226101852.GB24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbbce137-2ea5-7154-8411-dc161ff6bfbb@suse.com>
Date: Wed, 26 Feb 2020 11:45:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226101852.GB24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Sander Eikelenboom <linux@eikelenboom.it>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMToxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyNiwgMjAyMCBhdCAxMTowNzo0NEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MjQuMDIuMjAyMCAxMTo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gVXNpbmcgc2NyYXRj
aF9jcHVtYXNrIGluIHNlbmRfSVBJX21hc2sgaXMgbm90IHNhZmUgYmVjYXVzZSBpdCBjYW4gYmUK
Pj4+IGNhbGxlZCBmcm9tIGludGVycnVwdCBjb250ZXh0LCBhbmQgaGVuY2UgWGVuIHdvdWxkIGhh
dmUgdG8gbWFrZSBzdXJlCj4+PiBhbGwgdGhlIHVzZXJzIG9mIHRoZSBzY3JhdGNoIGNwdW1hc2sg
ZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCj4+PiBpdC4KPj4+Cj4+PiBJbnN0ZWFkIGlu
dHJvZHVjZSBhIG5ldyBjcHVtYXNrIHRvIGJlIHVzZWQgYnkgc2VuZF9JUElfbWFzaywgYW5kCj4+
PiBkaXNhYmxlIGludGVycnVwdHMgd2hpbGUgdXNpbmcgaXQuCj4+Cj4+IFRoZSBhbHRlcm5hdGl2
ZSBvZiBhbHNvIGFkZGluZyAuLi4KPj4KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYwo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4+PiBAQCAtNTksNiArNTksNyBAQCBzdGF0aWMgdm9p
ZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4+
PiAgICAgIGFwaWNfd3JpdGUoQVBJQ19JQ1IsIGNmZyk7Cj4+PiAgfQo+Pj4gIAo+Pj4gK0RFQ0xB
UkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBzZW5kX2lwaV9jcHVtYXNrKTsKPj4+ICAvKgo+Pj4g
ICAqIHNlbmRfSVBJX21hc2soY3B1bWFzaywgdmVjdG9yKTogc2VuZHMgQHZlY3RvciBJUEkgdG8g
Q1BVcyBpbiBAY3B1bWFzaywKPj4+ICAgKiBleGNsdWRpbmcgdGhlIGxvY2FsIENQVS4gQGNwdW1h
c2sgbWF5IGJlIGVtcHR5Lgo+Pj4gQEAgLTY3LDcgKzY4LDIxIEBAIHN0YXRpYyB2b2lkIHNlbmRf
SVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50IHZlY3RvciwKPj4+ICB2b2lk
IHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQo+Pj4gIHsK
Pj4+ICAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwo+Pj4gLSAgICBjcHVtYXNrX3QgKnNj
cmF0Y2ggPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+Pj4gKyAgICBjcHVtYXNrX3QgKnNj
cmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPj4+ICsgICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsKPj4+ICsKPj4+ICsgICAgaWYgKCBpbl9tYygpIHx8IGluX25taSgpICkKPj4KPj4g
Li4uIGluX2lycSgpIGhlcmUgd2FzIGNvbnNpZGVyZWQsIGFuZCBkaXNjYXJkZWQgYmVjYXVzZSBv
Zj8gV2l0aAo+PiB0aGlzIHlvdSdkIG5vdCBuZWVkIHRoZSBzZWNvbmQgQ1BVIG1hc2sgYW5kIHlv
dSdkIGFsc28gYmUgYWJsZQo+PiB0byBhdm9pZCBkaXNhYmxpbmcgYW4gcmUtZW5hYmxpbmcgSVJR
cy4KPiAKPiBJIGFpbWVkIHRvIHVzZSB0aGUgc2hvcnRoYW5kIGFzIG11Y2ggYXMgcG9zc2libGUs
IGJ1dCBJIHdvdWxkIGFsc28gYmUKPiBmaW5lIHdpdGggbm90IHVzaW5nIGl0IGluIGlycSBjb250
ZXh0LiBJIGFzc3VtZSB0aGVyZSBhcmVuJ3QgdGhhdCBtYW55Cj4gZmx1c2hlcyBpbiBpcnEgY29u
dGV4dCwgYW5kIHRoZW4gdGhlIElQSXMgc2VudCBhcmUgcHJvYmFibHkgbm90Cj4gYnJvYWRjYXN0
IG9uZXMuCgpXZWxsLCBoZXJlIGl0J3Mgbm90IGp1c3QgZmx1c2hlcywgaXMgaXQ/IEtub3dpbmcg
c29tZSAodHlwaWNhbCkKSVJRIGNvbnRleHQgdXNlcyBjb3VsZCBhbGxvdyB1cyB0YWtlIGEgYmV0
dGVyIGRlY2lzaW9uLiBBZnRlcgpTYW5kZXIncyByZXBvcnQsIGRpZCB5b3UgYWN0dWFsbHkgaWRl
bnRpZnkgd2hhdCBwYXRoKHMpIHRoZQplYXJsaWVyIGNoYW5nZSBicm9rZT8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
