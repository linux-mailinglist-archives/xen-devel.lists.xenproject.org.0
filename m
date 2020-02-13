Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F36215BCA2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:21:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BaK-0007li-I8; Thu, 13 Feb 2020 10:19:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2BaJ-0007ld-QC
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:19:03 +0000
X-Inumbo-ID: 41469806-4e4a-11ea-b874-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41469806-4e4a-11ea-b874-12813bfff9fa;
 Thu, 13 Feb 2020 10:19:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 12824B16D;
 Thu, 13 Feb 2020 10:19:01 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-3-roger.pau@citrix.com>
 <4849c6bc-e77b-d02f-7d0d-598cbcb3f145@suse.com>
 <20200213100355.GV4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a839cdc7-bc52-92cf-8020-74cfad568358@suse.com>
Date: Thu, 13 Feb 2020 11:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213100355.GV4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/smp: use a dedicated scratch
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

T24gMTMuMDIuMjAyMCAxMTowMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEZl
YiAxMywgMjAyMCBhdCAxMDo1OToyOUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTIuMDIuMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gVXNpbmcgc2NyYXRj
aF9jcHVtYXNrIGluIHNlbmRfSVBJX21hayBpcyBub3Qgc2FmZSBiZWNhdXNlIGl0IGNhbiBiZQo+
Pj4gY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5jZSBYZW4gd291bGQgaGF2
ZSB0byBtYWtlIHN1cmUKPj4+IGFsbCB0aGUgdXNlcnMgb2YgdGhlIHNjcmF0Y2ggY3B1bWFzayBk
aXNhYmxlIGludGVycnVwdHMgd2hpbGUgdXNpbmcKPj4+IGl0Lgo+Pj4KPj4+IEluc3RlYWQgaW50
cm9kdWNlIGEgbmV3IGNwdW1hc2sgdG8gYmUgdXNlZCBieSBzZW5kX0lQSV9tYXNrLCBhbmQKPj4+
IGRpc2FibGUgaW50ZXJydXB0cyB3aGlsZSB1c2luZy4KPj4KPj4gTXkgZmlyc3QgdGhvdWdodCBo
ZXJlIHdhczogV2hhdCBhYm91dCBOTUkgb3IgI01DIGNvbnRleHQ/IEV2ZW4gaWYKPj4gbm90IHVz
aW5nIHRoZSBmdW5jdGlvbiB0b2RheSAod2hpY2ggSSBkaWRuJ3QgY2hlY2spLCB0aGVyZSBzaG91
bGRuJ3QKPj4gYmUgYSBsYXRlbnQgaXNzdWUgaW50cm9kdWNlZCBoZXJlIHByZXZlbnRpbmcgdGhl
bSBmcm9tIGRvaW5nIHNvIGluCj4+IHRoZSBmdXR1cmUuIEluc3RlYWQgSSB0aGluayB5b3Ugd2Fu
dCB0byBhbGxvY2F0ZSB0aGUgc2NyYXRjaCBtYXNrCj4+IGR5bmFtaWNhbGx5IChhdCBsZWFzdCBp
ZiBjYWxsZXIgY29udGV4dCBkb2Vzbid0IGFsbG93IHVzZSBvZiB0aGUKPj4gZ2VuZXJpYyBvbmUp
LCBhbmQgc2ltcGx5IHJlZnJhaW4gZnJvbSBjb2FsZXNjaW5nIElQSXMgaWYgdGhpcwo+PiBhbGxv
Y2F0aW9ucyBmYWlscy4KPiAKPiBIbSwgaXNuJ3QgdGhpcyBnb2luZyB0byBiZSBxdWl0ZSBleHBl
bnNpdmUsIGFuZCBoZW5jZSByZW5kZXIgdGhlCj4gYmVuZWZpdCBvZiB1c2luZyB0aGUgc2hvcnRo
YW5kIG1vb3Q/CgpEZXBlbmRzIG9uIGhvdyBtYW55IENQVXMgdGhlcmUgYXJlLCBpLmUuIGhvdyBs
b25nIHRoZSBsb29wIG90aGVyd2lzZQp3b3VsZCBiZS4gV2hlbiB4bWFsbG9jKCkgZG9lc24ndCBu
ZWVkIHRvIHR1cm4gdG8gdGhlIHBhZ2UgYWxsb2NhdG9yLApJIHRoaW5rIGl0IHdvbid0IGJlIG92
ZXJseSBzbG93LiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBhdm9pZApjb2FsZXNjaW5nIGlu
IGEgc2xpZ2h0bHkgZGlmZmVyZW50IHdheSAod2l0aG91dCBoYXZpbmcgdG8gZmlkZGxlCndpdGgg
dGhlIHNjcmF0Y2ggbWFzaykgd2hlbiBjYWxsZWQgaW4gaW50ZXJydXB0IGNvbnRleHQuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
