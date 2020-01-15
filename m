Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4313BD4D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:23:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfna-0002kT-BE; Wed, 15 Jan 2020 10:21:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irfnY-0002kO-OW
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:21:16 +0000
X-Inumbo-ID: be5eb700-3780-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be5eb700-3780-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 10:21:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79A36ACCA;
 Wed, 15 Jan 2020 10:21:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-6-andrew.cooper3@citrix.com>
 <c8b1dd46-5873-aec8-de72-402aa74727f2@suse.com>
 <6e708726-9769-f8a0-340d-5c2a739ae4ca@citrix.com>
 <1cdae18b-7c16-6dc1-9e36-50a1bed9d17a@suse.com>
Message-ID: <f2bd89ac-eead-cd98-0c23-c0b6aa83137a@suse.com>
Date: Wed, 15 Jan 2020 11:21:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1cdae18b-7c16-6dc1-9e36-50a1bed9d17a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/boot: Size the boot/directmap
 mappings dynamically
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMDEuMjAyMCAx
ODoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTQvMDEvMjAyMCAxNzowMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBFdmVuIHdoZW4gdGhhdCByZW1haW5pbmcgaXNzdWUgZ290IGFkZHJl
c3NlZCwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIKPj4+IHRvIGtlZXAgaXQsIGFsdGVyaW5n
IHRoZSBib3VuZCB0byBHQigxKS4KPj4KPj4gQSAxRyBjaGVjayB3b3VsZG4ndCBiZSBjb3JyZWN0
Lgo+Pgo+PiBXZSd2ZSBhbHJlYWR5IGdvdCBhIG1vcmUgc3VpdGFibGUgb25lLCB3aGljaCBpcyB0
aGUgY2hlY2sgdGhhdCBYZW4KPj4gZG9lc24ndCBlbmNyb2FjaCBpbnRvIHRoZSBzdHVicyByYW5n
ZS4KPiAKPiBPaCwgcmlnaHQuIElmIG9ubHkgdGhhdCBjaGVjayB3YXMgY29ycmVjdC4gSSBndWVz
cyBpdCBvdWdodCB0byBiZQo+IHVzaW5nICYsIG5vdCB8LCBhbmQgcGVyaGFwcyBhbHNvIF9faW1h
Z2VfYmFzZV9fID09IFhFTl9WSVJUX1NUQVJULgo+IEknbGwgZ2l2ZSB0aGlzIGEgdHJ5IGFuZCBz
ZW5kIGEgcGF0Y2ggdW5sZXNzIGluIHRoZSBjb3Vyc2Ugb2YKPiBkb2luZyBzbyBJIHJlYWxpemUg
dGhlcmUncyBhIHJlYXNvbiBmb3IgaXQgYmVpbmcgdGhlIHdheSBpdCBpcy4KClNvIHRoZSB8IGlz
IGNvcnJlY3QgKHRvIGRlYWwgd2l0aCB0aGUgY2FzZSBvZiB0aGUgaW50ZXJtZWRpYXRlCmZpbGUg
Z2V0dGluZyBsaW5rZWQgYXQgYSBkaWZmZXJlbnQgYmFzZSBhZGRyZXNzIHdoZW4gcHJvZHVjaW5n
Cnhlbi5lZmkpLCBidXQgcHJvYmFibHkgbWlzbGVhZGluZy4gSSBndWVzcyBJJ2xsIHN1Ym1pdCBh
IHBhdGNoCmFueXdheSwgZGVzcGl0ZSB0aGUgY29uc3RydWN0IG5vdCBiZWluZyBicm9rZW4uCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
