Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDBF127ECC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:54:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJdh-00010I-Qt; Fri, 20 Dec 2019 14:52:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJdg-00010A-K8
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:52:24 +0000
X-Inumbo-ID: 54cea1c6-2338-11ea-9376-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54cea1c6-2338-11ea-9376-12813bfff9fa;
 Fri, 20 Dec 2019 14:52:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C30CAF33;
 Fri, 20 Dec 2019 14:52:23 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
 <8be5ebf6-c710-e1de-12af-f87137b69c44@suse.com>
 <bcf40a51-eed4-a48d-8f7e-e3b10df504cd@citrix.com>
 <b093c3f9-f247-c8ad-ca6b-b2bd25dd2bce@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e17dddf1-020e-63ae-4136-6b2a9fc703d3@suse.com>
Date: Fri, 20 Dec 2019 15:52:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b093c3f9-f247-c8ad-ca6b-b2bd25dd2bce@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] x86/mm: mod_l<N>_entry() have no need
 to use __copy_from_user()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMjAxOSAxNTo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi8yMC8xOSAy
OjQyIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyMC8xMi8yMDE5IDE0OjE5LCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IG1vZF9sMV9lbnRyeSgpJ3MgbmVlZCB0byBkbyBzbyB3ZW50IGF3
YXkgd2l0aCBjb21taXQgMmQwNTU3YzVjYiAoIng4NjoKPj4+IEZvbGQgcGFnZV9pbmZvIGxvY2sg
aW50byB0eXBlX2luZm8iKSwgYW5kIHRoZSBvdGhlciB0aHJlZSBuZXZlciBoYWQgc3VjaAo+Pj4g
YSBuZWVkLCBhdCBsZWFzdCBnb2luZyBiYWNrIGFzIGZhciBhcyAzLjIuMC4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IFRoZXNlIHBy
ZXN1bWFibHkgd2FudCBBQ0NFU1NfT05DRSgpIHRvIGF2b2lkIGludHJvZHVjaW5nIHJlcGVhdGVk
IHJlYWQKPj4gdnVsbmVyYWJpbGl0aWVzP8KgIFdoaWxlIHRoZSBtYXBwaW5ncyBtaWdodCBiZSBz
YWZlLCB0aGV5IHN0aWxsIHBvaW50IHRvCj4+IGxpdmUgZ3Vlc3QgZGF0YS4KPiAKPiBUaGUgTDEg
aXRzZWxmIHNob3VsZCBiZSBtYXBwZWQgcmVhZC1vbmx5IGJ5IHRoZSBndWVzdCwgYW5kIGxvY2tl
ZCBhdAo+IHRoaXMgcG9pbnQsIG5vPwoKVHJ1ZSwgYnV0IEkgdGhpbmsgaXQgd29uJ3QgaHVydCB0
byB1c2UgQUNDRVNTX09OQ0UoKSBuZXZlcnRoZWxlc3MKLSBpdCBtYWtlcyB0aGUgY29kZSBtb3Jl
IG9idmlvdXNseSBzYWZlIGluZGVwZW5kZW50IG9mIGFueSBsb2NraW5nCmtub3dsZWRnZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
