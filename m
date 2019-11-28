Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17C910CD55
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:56:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaN31-0004Fr-5q; Thu, 28 Nov 2019 16:53:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaN30-0004Fi-2B
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:53:42 +0000
X-Inumbo-ID: a1563710-11ff-11ea-a3d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1563710-11ff-11ea-a3d8-12813bfff9fa;
 Thu, 28 Nov 2019 16:53:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3769EAF65;
 Thu, 28 Nov 2019 16:53:40 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
 <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
 <24031.63719.734430.510061@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73aed248-8a39-789b-2b6c-b67d68aa8eac@suse.com>
Date: Thu, 28 Nov 2019 17:53:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24031.63719.734430.510061@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNzo0MiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2ggd3Jp
dGVzICgiUmU6IFtQQVRDSC1mb3ItNC4xMyB2NF0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1l
cyBhbmQgbWF4X21hcHRyYWNrX2ZyYW1lcyBoYW5kbGluZyIpOgo+PiBPbiAyOC4xMS4yMDE5IDE0
OjU4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiAgICAgIHVpbnQzMl90IG1heF92Y3B1czsKPj4+
ICAgICAgdWludDMyX3QgbWF4X2V2dGNobl9wb3J0Owo+Pj4gLSAgICB1aW50MzJfdCBtYXhfZ3Jh
bnRfZnJhbWVzOwo+Pj4gLSAgICB1aW50MzJfdCBtYXhfbWFwdHJhY2tfZnJhbWVzOwo+Pj4gKyAg
ICBpbnQzMl90IG1heF9ncmFudF9mcmFtZXM7Cj4+PiArICAgIGludDMyX3QgbWF4X21hcHRyYWNr
X2ZyYW1lczsKPj4KPj4gV2hpbGUgdGhpcyBtYXkgd2FudCBiYWNrcG9ydGluZyBhaXVpLCB3ZSBu
ZWVkIHRvIGJlIGEgbGl0dGxlCj4+IGNhcmVmdWwgd2l0aCB0aGUgaW50ZXJmYWNlIGNoYW5nZSBo
ZXJlLgo+IAo+IEEgbm90ZSBoZXJlIGluIGEgbGlzdCBkaXNjdXNzaW9uLCBvciBldmVuIGluIGEg
Y29tbWl0IG1lc3NhZ2UsIGlzCj4gcGVyaGFwcyBub3QgZ29pbmcgdG8gYmUgdmVyeSBlZmZlY3Rp
dmUgdG8gZGVhbCB3aXRoIHRoaXMuCj4gCj4gSG93IGJhZCB3b3VsZCBpdCBiZSB0byBjaGFuZ2Ug
dGhlIG5hbWVzIGFzIHdlbGwgYXMgdGhlIHR5cGVzID8KCkhtbSwgbm90IHN1cmUgLSBvbiBvbmUg
aGFuZCB0aGlzIHdvdWxkIGZsYWcgdGhlIGlzc3VlIHRvIHBlb3BsZQpjb25zdW1pbmcgdGhlIGlu
dGVyZmFjZS4gT3RvaCBpdCB3b3VsZG4ndCBoZWxwIHBlb3BsZSB1c2luZwpkZXJpdmVkIGhlYWRl
ciBmaWxlcyAodGhleSdkIG5vdGljZSBmYXIgbGF0ZXIpLCBhbmQgY2F1c2luZwpicmVha2FnZSBs
aWtlIHRoaXMgaW4gc3RhYmxlIHRyZWVzIGRvZXMndCBsb29rIHZlcnkgZnJpZW5kbHkKZWl0aGVy
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
