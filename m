Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3611D19D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 16:57:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQo9-0001BQ-8e; Thu, 12 Dec 2019 15:55:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifQo7-0001BB-DZ
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 15:55:15 +0000
X-Inumbo-ID: c3a3b948-1cf7-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3a3b948-1cf7-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 15:55:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 057D4AB71;
 Thu, 12 Dec 2019 15:55:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cd54bc0e-9e7b-42bb-ea60-8d4578a59cac@suse.com>
 <f150033a-ec07-7542-ab49-b5a8b746c2c1@citrix.com>
 <43160a9d-2738-0b1d-01ef-b3ad8f1c50dc@suse.com>
 <c49ca1fb-ce62-6668-966f-7a75150687fa@citrix.com>
 <dca85647-3e26-0d70-d381-e4baca33b156@suse.com>
 <0cb57b2f-c127-4161-85c6-a99e933398f5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d020da72-2687-4f08-09b6-1ab7ff416559@suse.com>
Date: Thu, 12 Dec 2019 16:55:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0cb57b2f-c127-4161-85c6-a99e933398f5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86emul: correct LFS et al handling for
 64-bit mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxNToyMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMi8yMDE5
IDEzOjA1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTIuMTIuMjAxOSAxMjozNywgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDEyLzEyLzIwMTkgMTA6MTEsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDExLjEyLjIwMTkgMjE6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9u
IDExLzEyLzIwMTkgMDk6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gQU1EIGFuZCBmcmll
bmRzIGV4cGxpY2l0bHkgc3BlY2lmeSB0aGF0IDY0LWJpdCBvcGVyYW5kcyBhcmVuJ3QgcG9zc2li
bGUKPj4+Pj4+IGZvciB0aGVzZSBpbnNucy4gTmV2ZXJ0aGVsZXNzIFJFWC5XIGlzbid0IGZ1bGx5
IGlnbm9yZWQ6IEl0IHN0aWxsCj4+Pj4+PiBjYW5jZWxzIGEgcG9zc2libGUgb3BlcmFuZCBzaXpl
IG92ZXJyaWRlICgweDY2KS4gSW50ZWwgb3RvaCBleHBsaWNpdGx5Cj4+Pj4+PiBwcm92aWRlcyBm
b3IgNjQtYml0IG9wZXJhbmRzIG9uIHRoZSByZXNwZWN0aXZlIGluc24gcGFnZSBvZiB0aGUgU0RN
Lgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPj4+Pj4gSXQgaXMgZGVmaW5pdGVseSBtb3JlIHRoYW4ganVzdCB0aGVzZS7CoCBOZWFy
IGp1bXBzIGhhdmUgcGVyLXZlbmRvcgo+Pj4+PiBiZWhhdmlvdXIgb24gaG93IGxvbmcgdGhlIGlu
c3RydWN0aW9uIGlzLCB3aGVyZWFzIGZhciBqdW1wL2NhbGxzIGFyZSBpbgo+Pj4+PiB0aGUgc2Ft
ZSBjYXRlZ29yeSBhcyB0aGVzZSBieSB0aGUgbG9va3Mgb2YgdGhpbmdzLgo+Pj4+IEJ1dCB5b3Ug
ZG9uJ3QgZXhwZWN0IG1lIHRvIGZvbGQgYWxsIG9mIHRoZXNlIGludG8gb25lIHBhdGNoLCBkbwo+
Pj4+IHlvdT8KPj4+IHNob3J0IGptcCBjZXJ0YWlubHkgbm90LCBidXQgZmFyIGptcC9jYWxsIGlz
IGp1c3QgdHdvIGV4dHJhIGNhc2UKPj4+IHN0YXRlbWVudHMgaW4gdGhpcyBuZXcgY29kZSBibG9j
aywgbm8/Cj4+IE5vdCBleGFjdGx5ICh0aGUgb3RoZXIgY2hhbmdlIHdvdWxkIG5lZWQgdG8gYmUg
aW4KPj4geDg2X2RlY29kZV9vbmVieXRlKCkgYW5kIGRlcGVuZCBvbiBNb2RSTS5yZWcpLCBidXQg
eWVzLCBJIGNhbgo+PiBkbyB0aGlzLiBZZXQgdGhlbiBpdCB3b3VsZCBmZWVsIG9kZCB0byBub3Qg
YWxzbyBkZWFsIHdpdGggdGhlCj4+IG5lYXIgY291bnRlcnBhcnRzIGF0IHRoZSBzYW1lIHRpbWUu
IFdoaWNoIGluIHR1cm4gd291bGQgbWFrZQo+PiBpcyBkZXNpcmFibGUgdG8gYWxzbyBkZWFsIHdp
dGggbmVhciBSRVQgYXMgd2VsbC4gQXQgd2hpY2gKPj4gcG9pbnQgd2UncmUgYWJvdXQgdG8gYWxz
byBkaXNjdXNzIENBTEwvSk1QIHdpdGggZGlzcGxhY2VtZW50Cj4+IG9wZXJhbmRzIGFuZCBKY2Mu
Cj4+Cj4+Pj4gV2UgaGF2ZSBfc29tZV8gdmVuZG9yIGRlcGVuZGVudCBiZWhhdmlvciBhbHJlYWR5
LCBhbmQgSSdtCj4+Pj4gc2xvd2x5IGFkZGluZyB0byBpdC4gT3VyIGZhciBjYWxsL2ptcCBzdXBw
b3J0IGlzIHJhdGhlcgo+Pj4+IGluY29tcGxldGUgaW4gb3RoZXIgd2F5cyBhbnl3YXkuCj4+PiBU
aGVyZSBpcyBkaWZmZXJlbnQgdHJ1bmNhdGlvbiBiZWhhdmlvdXIgZm9yICVyaXAgd2hpY2ggbmVl
ZHMgYWx0ZXJpbmcsCj4+PiBidXQgdGhhdCBpcyBhIHNlcGFyYXRlIGFyZWEgb2YgY29kZS7CoCBB
bnl0aGluZyBlbHNlPwo+PiBwcm90bW9kZV9sb2FkX3NlZygpIGFuZCBNT1ZTWEQgYWxyZWFkeSBo
YXZlIHZlbmRvciBkZXBlbmRlbnQKPj4gY29kZSwgaWYgdGhhdCB3YXMgeW91ciBxdWVzdGlvbi4K
PiAKPiBJIHdhcyBhY3R1YWxseSBqdXN0IGFza2luZyBhYm91dCBmYXIgam1wL2NhbGwuCj4gCj4g
SWYgeW91J3JlIHN1cmUgdGhhdCBmYXIgam1wL2NhbGwgaXMgbW9yZSBjb21wbGljYXRlZCB0aGFu
IGp1c3QgdHdlYWtpbmcKPiB0aGlzIHBhdGNoLCB0aGVuIGZpbmUuwqAgQWNrZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MgbXVjaC4gSSdsbCBz
ZWUgdG8gcHV0IHRvZ2V0aGVyIHRoZSBmYXIgYnJhbmNoIGNvdW50ZXJwYXJ0CnNvb24uIFBlcmhh
cHMgSSBjYW4gYWxzbyBkbyB0aGUgbmVhciBicmFuY2ggcGFydHMgdGhlbi4KCj4+IEZvciB0aGlu
Z3MgbmVlZGluZyBkb2luZyBzZWUKPj4gYWJvdmUgcGx1cyBMT09QLCBKW0VSXUNYWiwgU1lTRU5U
RVIsIGFuZCBTWVNFWElUIGFzIGZhciBhcyBJJ20KPj4gY3VycmVudGx5IGF3YXJlLgo+IAo+IFNZ
U0NBTEwgYW5kIFNZU1JFVCBhcyB3ZWxsLsKgIFRoZSB3YXkgdGhleSBoYW5kbGUgTVNSX1NUQVIg
aXMgdmVuZG9yCj4gc3BlY2lmaWMsIGFzIHdlbGwgYXMgI1VEIGNvbmRpdGlvbnMuCj4gCj4gSSd2
ZSBqdXN0IG5vdGljZWQgdGhhdCBJJ3ZlIHN0aWxsIGdvdCBhbiBYU0EtMjA0IGZvbGxvd3VwIHBh
dGNoIHN0aWxsCj4gb3V0c3RhbmRpbmcgZnJvbSAyMDE2Li4uCgpPaC4gTG9va2luZyBmb3J3YXJk
IHRvIHNlZSBpdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
