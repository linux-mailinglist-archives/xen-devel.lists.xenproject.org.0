Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11881C4821
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:11:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFYjH-00083h-K7; Wed, 02 Oct 2019 07:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFYjG-00083c-V7
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:07:18 +0000
X-Inumbo-ID: 4472a536-e4e3-11e9-9710-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4472a536-e4e3-11e9-9710-12813bfff9fa;
 Wed, 02 Oct 2019 07:07:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56ABAAC12;
 Wed,  2 Oct 2019 07:07:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
 <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
 <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
 <39e9ad3d-e3b0-e5c3-f115-33af4e2ee688@suse.com>
 <dfcfd2dc-65cb-e11b-0db2-535322c8275c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9ee0114c-41ba-5d8e-1aef-5bccf1fb15dc@suse.com>
Date: Wed, 2 Oct 2019 09:07:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dfcfd2dc-65cb-e11b-0db2-535322c8275c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAyMTo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJbiB0aGlzIGV4YW1w
bGUsIGhhcmR3YXJlIGNhbiB0aGUgZW11bGF0b3IgY2FuIGRpc2FncmVlIGJ5IHVzaW5nIGEKPiBk
aWZmZXJlbnQgYWNjZXNzIHdpZHRoLgo+IAo+IEkndmUgYmVlbiBleHBlcmltZW50aW5nIHdpdGgg
bXkgUm9tZSBzeXN0ZW0sIGFuZCBhbiBlbXVsYXRvciBoYXJkY29kZWQKPiB0byB1c2UgMi1ieXRl
IGFjY2Vzc2VzLsKgIEFmdGVyIHNvbWUgaW52ZXN0aWdhdGlvbiwgdGhlIGxpdmVsb2NrIG9ubHkK
PiBvY2N1cnMgZm9yIGFjY2Vzcy1yaWdodHMgZmF1bHRzLsKgIFRyYW5zbGF0aW9uIGZhdWx0cyBn
ZXQgaWRlbnRpZmllZCBhcwo+IG5vdCBhIHNoYWRvdyBmYXVsdCwgYW5kIGJvdW5jZWQgYmFjayB0
byB0aGUgZ3Vlc3QuCj4gCj4gU2hhZG93IGd1ZXN0cyBjYW4gdXNlIFBLUlUsIHNvIGNhbiBnZW5l
cmF0ZSBhbiBhY2Nlc3MgZmF1bHQgYnkgbWFya2luZwo+IHRoZSBwYWdlIGF0IDB4MjAwMCBhcyBu
by1hY2Nlc3MsIHNvIEkgdGhpbmsgdGhhdCBpbiBwcmluY2lwbGUsIHRoaXMKPiBjaGFuZ2Ugd2ls
bCByZXN1bHQgaW4gYSBuZXcgbGF0ZW50IGxpdmVsb2NrIGNhc2UsIGJ1dCBJIGNhbid0IGFjdHVh
bGx5Cj4gY29uZmlybSBpdC4KCkkgdGhpbmsgSSBzZWUgd2hhdCB5b3UgbWVhbiwgYnV0IHRoZW4g
SSBkb24ndCBzZWUgaG93IHRoaXMgaXMgYW4KYXJndW1lbnQgYWdhaW5zdCB0aGUgcGF0Y2ggaW4g
aXRzIGN1cnJlbnQgc2hhcGU6IEl0IGFjdHVhbGx5CnJlZHVjZXMgdGhlIGNhc2VzIG9mIGRpc2Fn
cmVlbWVudCBiZXR3ZWVuIGhhcmR3YXJlIGFuZCBlbXVsYXRvci4KT25lIHBvc3NpYmlsaXR5IHRv
IG1ha2UgYSBmdXJ0aGVyIHN0ZXAgaW4gdGhhdCBkaXJlY3Rpb24gd291bGQKYmUgdG8gbWFrZSBi
ZWhhdmlvciBkZXBlbmRlbnQgdXBvbiB0aGUgdW5kZXJseWluZyBoYXJkd2FyZSdzCnZlbmRvciwg
cmF0aGVyIHRoYW4gdGhlIG9uZSB0aGUgZ3Vlc3Qgc2Vlcy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
