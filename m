Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBF6FF31
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 14:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpX1v-0001g5-Vr; Mon, 22 Jul 2019 12:02:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpX1u-0001g0-DP
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 12:02:58 +0000
X-Inumbo-ID: a4637bc6-ac78-11e9-9045-530db75c76d6
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a4637bc6-ac78-11e9-9045-530db75c76d6;
 Mon, 22 Jul 2019 12:02:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 533DF28;
 Mon, 22 Jul 2019 05:02:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D530E3F71A;
 Mon, 22 Jul 2019 05:02:54 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrii Anisov <andrii.anisov@gmail.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
Date: Mon, 22 Jul 2019 13:02:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
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

T24gMjIvMDcvMjAxOSAxMToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjIuMDcuMjAxOSAx
MTozMCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4KPj4KPj4gT24gMTkuMDcuMTkgMTI6MzcsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTguMDcuMjAxOSAxOToxMSwgQW5kcmlpIEFuaXNvdiB3
cm90ZToKPj4+PiBMZXQgdnVubWFwIGFsaWduIHBhc3NlZCB2aXJ0dWFsIGFkZHJlc3MgYnkgUEFH
RV9TSVpFLgo+Pj4KPj4+IERlc3BpdGUgc2VlaW5nIEFuZHJldydzIFItYiB5b3UndmUgYWxyZWFk
eSBnb3QgSSdkIGxpa2UgdG8gcG9pbnQgb3V0Cj4+PiB0aGF0IHRoaXMgaW5jcmVhc2VzIHRoZSBy
aXNrIG9mIHNvbWUgY29kZSBwYXNzaW5nIHRoZSB3cm9uZyBwb2ludGVyCj4+PiBpbnRvIGhlcmUu
IHssdW59bWFwX2RvbWFpbl9wYWdlKCkgYWN0IG9uIHNpbmdsZSBwYWdlcyBvbmx5LCBzbyB0aGVy
ZSdzCj4+PiBubyBhbWJpZ3VpdHkuIFdoZW4gdGFsa2luZyBhYm91dCBtdWx0aS1wYWdlIHJlZ2lv
bnMgdGhvdWdoLCBub3QgdW5kb2luZwo+Pj4gYXJpdGhtZXRpYyBwcmV2aW91c2x5IGRvbmUgbWF5
IG1lYW4gYWN0dWFsbHkgcG9pbnRpbmcgYXQgb3RoZXIgdGhhbiB0aGUKPj4+IGZpcnN0IHBhZ2Ug
b2YgdGhlIG1hcHBpbmcuCj4+Cj4+IFdlbGwsIHdoYXQgd2UgYXJlIG1vdmluZyBpbnRvIHZ1bm1h
cCgpLCBpcyBhIHBhZ2UgYWxpZ25tZW50IG9ubHkuIEl0IGNhbid0IHNhdmUgdXMgZnJvbSB0aGUg
d3JvbmcgcG9pbnRlciwgZXZlbiBpZiBpdCBpcyBkb25lIG91dHNpZGUgdGhlIHZ1bm1hcCgpLgo+
Pgo+Pj4+IFdpdGggdGhlIG1haW4gY2hhbmdlLCBhbHNvOgo+Pj4+ICDCoMKgIC0gc3RyaXAgYWxs
IGV4aXN0aW5nIHZ1bm1hcCgpIGNhbGxzIGZyb20gcHJpb3IgbWFza2luZwo+Pj4KPj4+IF9JZl8g
d2UgYXJlIHRvIGdvIHRoaXMgcm91dGUsIHRoZW4gdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKCkK
Pj4+IGNhbGxlcnMgc2hvdWxkIGFsc28gYmUgYWRqdXN0ZWQuIFRoZXJlLCBhcyBmb3IgdW5tYXBf
ZG9tYWluX3BhZ2UoKSwKPj4+IEkgYWdyZWUgaXQgd291bGQgbWFrZSBzZW5zZSB0byBiZSBtb3Jl
IHRvbGVyYW50Lgo+Pgo+PiBJJ3ZlIGZvdW5kIHR3byBwYWdlIGFsaWdubWVudHMgcHJpb3IgdG8g
YHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpYCBjYWxsLiBTaG91bGQgSSB3aXBlIHRoZW0gaW4g
dGhpcyBwYXRjaCwgb3IgaW4gc2VwYXJhdGU/Cj4gCj4gSWYgd2UncmUgdG8gZ28gdGhlIHN1Z2dl
c3RlZCByb3V0ZSB0aGVuIGl0IG1pZ2h0IG5vdCBtYXR0ZXIgbXVjaC4KPiBBcyBJJ20gbm90IGVu
dGlyZWx5IGNlcnRhaW4geWV0IHRoYXQgd2Ugd2lsbCwgbWFraW5nIHRoaXMgYSBwcmVyZXEKPiBv
bmUgZGVhbGluZyB3aXRoIHRoZSBhbGlnbm1lbnQgaW4gdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFs
KCkgbWlnaHQKPiBiZSBiZXR0ZXIuIFlvdXIgZXhpc3RpbmcgcGF0Y2ggd291bGQgdGhlbiBmdXJ0
aGVyIHNoaWZ0IHRoaXMgaW50bwo+IHZ1bm1hcCgpLgoKSSB0aGluayBhbGxvd2luZyB2dW5tYXAg
dG8gZGVhbCB3aXRoIHVuYWxpZ25lZCBhZGRyZXNzIGNvdWxkIHNpbXBsaWZ5IHNvbWUgb2YgCnRo
ZSBjYWxsZXJzLiBQYXNzaW5nIHRoZSB3cm9uZyBwYWdlLWFsaWduZWQgcG9pbnRlciBpcyBsZXNz
IGNyaXRpY2FsIHRoYW4gCnBhc3NpbmcgYW4gdW5hbGlnbmVkIGFkZHJlc3MuCgpUaGUgbGF0dGVy
IG1heSByZXN1bHQgaW4gbWlzYmVoYXZpbmcgY29kZS4gVGhlIHZtYXAgd2lsbCBlbmQtdXAgdG8g
bm90IGJlIHN5bmMgCndpdGggdGhlIHBhZ2UtdGFibGUgYXMgd2UgYXNzdW1lIHBhZ2UtdGFibGUg
dXBkYXRlIGNhbm5vdCBmYWlsICh0aGlzIHByb2JhYmx5IApzaG91bGQgYmUgY2hhbmdlZCkuIE9u
IEFybSwgdGhpcyB3aWxsIHJlc3VsdCB0byBhbnkgbmV3IHZtYXAgZnVuY3Rpb24gdG8gbGlrZWx5
IApmYWlsICh3ZSBkb24ndCBhbGxvdyByZXBsYWNlIGFuIGV4aXN0aW5nIHZhbGlkIHBhZ2UtdGFi
bGUgZW50cnkpLgoKSUlVQyB0aGUgY29kZSwgdGhlIGZvcm1lciB3aWxsIHJlc3VsdCB0byBvbmx5
IHVubWFwcGluZyBzb21lIHBhcnQgb2YgdGhlIHZtYXAuIApXaGlsZSBJIGFncmVlIHRoaXMgaXMg
bm90IGlkZWFsLCB0aGUgdm1hcCB3aWxsIHN0aWxsIHN0YXkgaW4tc3luYyB3aXRoIHRoZSAKcGFn
ZS10YWJsZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
