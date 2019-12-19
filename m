Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED70B12687F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 18:57:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii007-0007wc-Ft; Thu, 19 Dec 2019 17:54:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ii005-0007wX-SK
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:54:13 +0000
X-Inumbo-ID: 8bb8b826-2288-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bb8b826-2288-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 17:54:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576778045; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=AfoK0AsXb2qbHowQbinEKUkHJJmzJk7TxfI+tpTTzeU=;
 b=pqYQk+a/Kv6bP8/N5FCTKEs7Wa/+hMdBBoizrLCfRBNOvqxG6zYWcrEr4EyVJMUIBImousU/
 0nzYb8GOQiEuzrKcGPPa+jDFE2dgtDh0+bH8UJiMbSv9D8ZvhqGKMWQP/LxQen9PNWT4z0F4
 axp3DyEfHZkBAM1cs3ScZjlmWIM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5dfbb21b.7f01669e5fb0-smtp-out-n02;
 Thu, 19 Dec 2019 17:23:39 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p9so6263244wmc.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 09:23:39 -0800 (PST)
X-Gm-Message-State: APjAAAXs4v9WcdwTA4ZzN6AQ6eWVedDWzxk4lnOtDrHC7MjCxhEGhrnQ
 l1l3Jca5MeBSTABVRijf5GNs7YjqpcLmhKyJDrc=
X-Google-Smtp-Source: APXvYqzt3AXYIXHF4lehdv/aomMKGtygeKtX/bplK8bPd4OjYXdV45ap16qJpQh3h8rQrbbCyPa375+SvN1UgcgCzjw=
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr12023181wmi.15.1576776218391; 
 Thu, 19 Dec 2019 09:23:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
 <c6d975b9-638f-355d-79f8-1c1fae4c6007@xen.org>
 <CABfawhnVbzv4UEQFQoRwYurKOWB4Vw=OtsxXUDtFX1HRxr-sWA@mail.gmail.com>
 <5339f10e-6d93-35ac-5777-acf13ba9835f@xen.org>
 <CABfawhmzjE6c0msjpPEBTciTnCTVQGd46ovSuB_7qqXdY6BvsQ@mail.gmail.com>
 <18414678-5d0a-a2b4-f6ba-61464a0127c0@xen.org>
 <CABfawhnReiUnM9_BG9bBJ4994MdS2zd46NyTztGtJsqQXsR3-w@mail.gmail.com>
 <87d7a24b-ce3a-6dda-bd27-fe98d50f2960@xen.org>
In-Reply-To: <87d7a24b-ce3a-6dda-bd27-fe98d50f2960@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 10:23:02 -0700
X-Gmail-Original-Message-ID: <CABfawhkuKkos3x4C6UxKVd2A=2f6ESs+kNZtAfcEqtgnogCXYw@mail.gmail.com>
Message-ID: <CABfawhkuKkos3x4C6UxKVd2A=2f6ESs+kNZtAfcEqtgnogCXYw@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v2 19/20] x86/mem_sharing: reset a fork
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
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgOTo1OCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTkvMTIvMjAxOSAxNjoxMSwgVGFtYXMgSyBMZW5n
eWVsIHdyb3RlOgo+ID4+PiBXZWxsLCB0aGlzIGlzIG9ubHkgYW4gZXhwZXJpbWVudGFsIHN5c3Rl
bSB0aGF0J3MgY29tcGxldGVseSBkaXNhYmxlZAo+ID4+PiBieSBkZWZhdWx0LiBNYWtpbmcgdGhl
IGFzc3VtcHRpb24gdGhhdCBwZW9wbGUgd2hvIG1ha2UgdXNlIG9mIGl0IHdpbGwKPiA+Pj4ga25v
dyB3aGF0IHRoZXkgYXJlIGRvaW5nIEkgdGhpbmsgaXMgZmFpci4KPiA+Pgo+ID4+IEkgYXNzdW1l
IHRoYXQgaWYgeW91IHN1Ym1pdCB0byB1cHN0cmVhbSB0aGlzIG5ldyBoeXBlcmNhbGwgdGhlbiB0
aGVyZSBpcwo+ID4+IGxvbmdlciBwbGFuIHRvIGhhdmUgbW9yZSBwZW9wbGUgdG8gdXNlIGl0IGFu
ZCBwb3RlbnRpYWxseSBtYWtpbmcKPiA+PiAic3RhYmxlIi4gSWYgbm90LCB0aGVuIGl0IHJhaXNl
cyB0aGUgcXVlc3Rpb24gd2h5IHRoaXMgaXMgcHVzaGVkIHVwc3RyZWFtLi4uCj4gPgo+ID4gSXQn
cyBiZWluZyBwdXNoZWQgdXBzdHJlYW0gc28gb3RoZXIgcGVvcGxlIGNhbiBtYWtlIHVzZSBvZiBp
dCwgZXZlbiBpZgo+ID4gaXQncyBub3QgInByb2R1Y3Rpb24gcXVhbGl0eSIuIEJleW9uZCB3aGF0
IGlzIGJlaW5nIHNlbnQgaGVyZSB0aGVyZQo+ID4gYXJlIG5vIGxvbmdlciB0ZXJtIHBsYW5zIGZy
b20gSW50ZWwgKGF0IHRoaXMgcG9pbnQpIHRvIHN1cHBvcnQgdGhpcyBpbgo+ID4gYW55IHdheS4K
Pgo+IFNvIGlmIHRoaXMgaXMgbWVyZ2VkLCB3aG8gaXMgZ29pbmcgdG8gbWFpbnRhaW4gaXQ/CgpJ
dCBmYWxscyB1bmRlciBtZW1fc2hhcmluZyBmb3Igd2hpY2ggSSdtIGxpc3RlZCBhcyAiT2RkIEZp
eGVzIgptYWludGFpbmVyLCB3aGljaCBJIGRvIGluIG15IHBlcnNvbmFsIGZyZWUgdGltZS4gVGhl
IHN0YXR1cyB0aGVyZQppc24ndCBjaGFuZ2luZyB3aXRoIHRoaXMgbmV3IGZlYXR1cmUuCgo+Cj4g
PiBUaGUgYWx0ZXJuYXRpdmUgd291bGQgYmUgdGhhdCB3ZSBqdXN0IHJlbGVhc2UgYSBmb3JrIChv
ciBqdXN0Cj4gPiB0aGUgcGF0Y2hlcykgYW5kIHdhbGsgYXdheS4KPiA+ICBJZiB0aGUgWGVuIGNv
bW11bml0eSB3YW50cyB0byBtYWtlIHRoZQo+ID4gYW5ub3VuY2VtZW50IHRoYXQgb25seSBjb2Rl
IHRoYXQgd2lsbCBoYXZlIGxvbmcgdGVybSBzdXBwb3J0IGFuZCBpcwo+ID4gInN0YWJsZSIgaXMg
YWNjZXB0ZWQgdXBzdHJlYW0gdGhhdCdzIElNSE8gZHJhc3RpY2FsbHkgZ29pbmcgdG8gcmVkdWNl
Cj4gPiBwZW9wbGUncyBpbnRlcmVzdCB0byBzaGFyZSBhbnl0aGluZy4KPgo+IFNoYXJpbmcgaXMg
b25lIHRoaW5nLCBidXQgaWYgdGhpcyBjb2RlIGlzIG5vdCBhdCBsZWFzdCBhIG1pbmltdW0KPiBt
YWludGFpbmVkIHRoZW4gaXQgaXMgbGlrZWx5IHRoZSBjb2RlIHdpbGwgbm90IGJlIGZ1bmN0aW9u
YWwgaW4gYSB5ZWFyIHRpbWUuCgpTdXJwcmlzaW5nbHkgbWVtX3NoYXJpbmcgaGFkIG9ubHkgbWlu
b3IgYml0cm90cyBpbiB0aGUgbGFzdCB+NSB5ZWFycwppbiB3aGljaCB0aW1lIGl0IGhhcyBiZWVu
IHByZXR0eSBtdWNoIGFiYW5kb25lZC4KCj4KPiBEb24ndCBnZXQgbWUgd3JvbmcsIHRoaXMgaXMg
YSBjb29sIGZlYXR1cmUgdG8gaGF2ZSBidXQgeW91IG1ha2UgaXQKPiBzb3VuZHMgbGlrZSB0aGlz
IGlzIGdvaW5nIHRvIGJlIGR1bXBlZCBpbiBYZW4gYW5kIG5ldmVyIGdvaW5nIHRvIGJlCj4gdG91
Y2hlZCBhZ2Fpbi4gSG93IGlzIHRoaXMgZ29pbmcgdG8gYmUgYmVuZWZpY2lhbCBmb3IgdGhlIGNv
bW11bml0eT8KCkl0IGFkZHMgYW4gZXhwZXJpbWVudGFsIGZlYXR1cmUgdG8gWGVuIHRoYXQgcGVv
cGxlIGNhbiB0cnkgb3V0IGFuZAp3ZWxsIGV4cGVyaW1lbnQgd2l0aCEgSXQgbWF5IGJlIHVzZWZ1
bCwgaXQgbWF5IG5vdCBiZS4gWW91IHlvdXJzZWxmCnNhaWQgdGhhdCB0aGlzIGlzIGEgY29vbCBm
ZWF0dXJlLiBUaGUgZmFjdCB0aGF0IHRoZXJlIGlzIGEgSklSQSB0aWNrZXQKdHJhY2tpbmcgdGhp
cyBhbHNvIHNob3dzIHRoZXJlIGlzIGNvbW11bml0eSBpbnRlcmVzdCBpbiBoYXZpbmcgc3VjaCBh
CmZlYXR1cmUgYXZhaWxhYmxlLiBJZiBkb3duIHRoZSByb2FkIHRoYXQgY2hhbmdlcyBhbmQgdGhp
cyBwcm92ZXMgdG8gYmUKZGVhZCBjb2RlLCBpdCBjYW4gYmUgcmVtb3ZlZC4gSSBkb24ndCB0aGlu
ayB0aGF0IHdpbGwgYmUgbmVjZXNzYXJ5CnNpbmNlIHRoaXMgaXNuJ3QgZXZlbiBjb21waWxlZCBi
eSBkZWZhdWx0IGFueW1vcmUgdGhvdWdoLiBCdXQgYW55d2F5LAppdCBtYWtlcyBtb3JlIHNlbnNl
IHRvIGdldCBpdCB1cHN0cmVhbSB0aGVuIGNhcnJ5IGl0IG91dCBvZiB0cmVlCmJlY2F1c2UgaXQg
Z2V0cyBtb3JlIGV4cG9zdXJlIHRoYXQgd2F5LCBtb3JlIHBlb3BsZSBtYXkgdHJ5IGl0IG91dC4K
SGF2aW5nIGl0IGluLXRyZWUgYWxzbyBtZWFucyB0aGF0IGluIGEgY291cGxlIHJlbGVhc2VzIHBl
b3BsZSB3aG8gYXJlCmludGVyZXN0ZWQgaW4gdGhlIGZlYXR1cmUgZG9uJ3QgaGF2ZSB0byBnbyB0
aHJvdWdoIHRoZSBwcm9jZXNzIG9mCnJlYmFzaW5nIHRoZSBwYXRjaHNldCBvbiBuZXdlciB2ZXJz
aW9ucyBvZiBYZW4gc2luY2UgaXQncyBhbHJlYWR5CmluLXRyZWUuCgo+ID4+PiBCdXQgaWYgb3Ro
ZXJzIGZlZWwgdGhhdCBzdHJvbmdseSBhcyB3ZWxsIGFib3V0Cj4gPj4+IGhhdmluZyB0byBoYXZl
IGNvbnRpbnVhdGlvbiBmb3IgdGhpcyBJIGRvbid0IHJlYWxseSBtaW5kIGFkZGluZyBpdC4KPiA+
Pgo+ID4+IEkgZG9uJ3QgdGhpbmsgdGhlIGNvbnRpbnVhdGlvbiB3b3JrIGlzIGdvaW5nIHRvIGJl
IGRpZmZpY3VsdCwgYnV0IGlmIHlvdQo+ID4+IHdhbnQgdG8gZGVsYXkgaXQsIHRoZW4gdGhlIG1p
bmltdW0gaXMgdG8gZG9jdW1lbnQgc3VjaCBhc3N1bXB0aW9ucyBmb3IKPiA+PiB5b3VyIHVzZXJz
Lgo+ID4KPiA+IEkganVzdCBkb24ndCBzZWUgYSB1c2UgZm9yIGl0IGJlY2F1c2UgaXQgd2lsbCBu
ZXZlciBhY3R1YWxseSBleGVjdXRlLgo+Cj4gVGhhdCdzIGEgdmVyeSBuYXJyb3cgdmlldyBvZiBo
b3cgeW91ciBoeXBlcmNhbGwgY2FuIGJlIHVzZWQuIEkga25vdyB0aGF0Cj4geW91IHNhaWQgdGhh
dCBzaG91bGQgb25seSBiZSBjYWxsZWQgZWFybHksIGJ1dCBpbWFnaW5lIGZvciBhIG1vbWVudCB0
aGUKPiB1c2VyIGRlY2lkZSB0byBjYWxsIGl0IG11Y2ggbGF0ZXIgaW4gdGhlIGZvcmsgcHJvY2Vz
cy4KPgo+ID4gU28gdG8gbWUgaXQganVzdCBsb29rcyBsaWtlIHVubmVjZXNzYXJ5IGRlYWQgZ2x1
ZS4KPgo+IFRyeSB0byBjYWxsIHRoZSBoeXBlcmNhbGwgYWZ0ZXIgZW5vdWdoIGRlZHVwbGljYXRp
b24gaGFwcGVuIChtYXliZQo+IDIwbWluKS4gQWx0ZXJuYXRpdmVseSwgZ2l2ZSBtZSBhY2Nlc3Mg
dG8geW91ciBtYWNoaW5lIHdpdGggdGhlIGNvZGUgYW5kCj4gSSBjYW4gc2hvdyBob3cgaXQgY2Fu
IGJlIG1pc3VzZWQgOykuCgpJdCB3aWxsIGhhbmcgZm9yIGEgYml0IGZvciBzdXJlIGFuZCBMaW51
eCBpbiBkb20wIHdpbGwgY29tcGxhaW4gdGhhdCBhCkNQVSBpcyBzdHVjay4gQnV0IGl0IHdpbGwg
ZXZlbnR1YWxseSBmaW5pc2guIEl0J3Mgbm90IGxpa2UgaXQncyBkb2luZwphbGwgdGhhdCBtdWNo
LiBBbmQgYW55d2F5LCBpZiB5b3Ugbm90aWNlIHRoYXQgaGFwcGVuaW5nIHdoZW4geW91IGNhbGwK
aXQgaXQgd2lsbCBiZSBhbiBvYnZpb3VzIGNsdWUgdGhhdCB5b3Ugc2hvdWxkbid0IGJlIHVzaW5n
IGl0IHVuZGVyIHRoZQpzaXR1YXRpb24geW91IGFyZSB1c2luZyBpdCB1bmRlci4gSGF2aW5nIGNv
bnRpbnVhdGlvbiB3b3VsZCBoaWRlIHRoYXQuCgo+Cj4gPiBCdXQgZG9jdW1lbnRpbmcgdGhlCj4g
PiBhc3N1bXB0aW9uIHVuZGVyIHdoaWNoIHRoaXMgaHlwZXJjYWxsIHNob3VsZCBleGVjdXRlIGlz
IHBlcmZlY3RseQo+ID4gZmFpci4KPgo+IFlvdSBtaWdodCB3YW50IHRvIHRoaW5rIGhvdyB0aGUg
aW50ZXJmYWNlIHdvdWxkIGxvb2sgbGlrZSB3aXRoIHRoZQo+IHByZWVtcHRpb24uIFNvIHRoZSBk
YXkgeW91IGRlY2lkZSB0byBpbnRyb2R1Y2UgcHJlZW1wdGlvbiB5b3UgZG9uJ3QgaGF2ZQo+IHRv
IGNyZWF0ZSBhIG5ldyBoeXBlcmNhbGwuCgpXaHkgd291bGQgeW91IG5lZWQgdG8gaW50cm9kdWNl
IGEgbmV3IGh5cGVyY2FsbCBpZiBwcmVlbXB0aW9uIGJlY29tZXMKbmVjZXNzYXJ5PyBUaGlzIGlz
IG5vdCBhIHN0YWJsZSBpbnRlcmZhY2VzLiBJdCBjYW4gYmUgcmVtb3ZlZC9jaGFuZ2VkCmNvbXBs
ZXRlbHkgZnJvbSBvbmUgWGVuIHJlbGVhc2UgdG8gdGhlIG5leHQuCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
