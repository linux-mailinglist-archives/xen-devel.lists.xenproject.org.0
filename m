Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AC135D62
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:00:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipaC1-0007Nf-0r; Thu, 09 Jan 2020 15:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuxF=26=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipaBz-0007Na-3L
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 15:57:51 +0000
X-Inumbo-ID: c9763d84-32f8-11ea-b9fc-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9763d84-32f8-11ea-b9fc-12813bfff9fa;
 Thu, 09 Jan 2020 15:57:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578585470; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=J2eRlR5F//LjSvsl79VZAiyzofygq1+8D4RtDup747c=;
 b=OsZUBIoLbL9cPDkrT6gT1ttxQnHHZPkj3+qMoPtoT+R/Pa/Kvwns+xhaMlO8vyQWVG/EnOOy
 1vwo1HtlOhXZwpXlXAYpRD317OyNXz760c7YmfrJ0LIS7kxzGLinVjiw6Yn6b3jZGO5wJqcX
 fFPycjOZ19r3wMwmigY2Rfc5vgE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mxa.mailgun.org with ESMTP id 5e174d7c.7fb6bbed4d70-smtp-out-n01;
 Thu, 09 Jan 2020 15:57:48 -0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p17so3422668wma.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 07:57:48 -0800 (PST)
X-Gm-Message-State: APjAAAXE1XH/O4dSGtUEQRmVnk8ab1biVmpodqewU8SWrrU71yk2xR7n
 SZv0EafcHRBLMlY2HjA5vdbfsaG1+xu8p4y/Kl8=
X-Google-Smtp-Source: APXvYqwnCTkxuNGF0bBe1oQdJuZ43tcDPFg0c9Q1FzOYOhJ3VG16j/EBFEDUUQXo/AsjKM9ir0+hAIOnqjT9U0DhFZY=
X-Received: by 2002:a05:600c:2c7:: with SMTP id 7mr5497374wmn.87.1578585467085; 
 Thu, 09 Jan 2020 07:57:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
 <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
 <20200109151010.GC11756@Air-de-Roger>
 <259d98b3-5d27-a856-a457-4e7c37004982@suse.com>
In-Reply-To: <259d98b3-5d27-a856-a457-4e7c37004982@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Jan 2020 08:57:10 -0700
X-Gmail-Original-Message-ID: <CABfawhmTi9T+TJC0=J1vRwsz859oeFXfKTmqCz4yvcmSdS0umQ@mail.gmail.com>
Message-ID: <CABfawhmTi9T+TJC0=J1vRwsz859oeFXfKTmqCz4yvcmSdS0umQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gOSwgMjAyMCBhdCA4OjM0IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwOS4wMS4yMDIwIDE2OjEwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+ID4gT24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDY6NDE6MTJBTSAtMDcwMCwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4+IE9uIFRodSwgSmFuIDksIDIwMjAgYXQgMzoyOSBBTSBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+Pj4KPiA+Pj4gSGkgVGFtYXMsCj4g
Pj4+Cj4gPj4+IE9uIDA4LzAxLzIwMjAgMTc6MTQsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+
Pj4+ICtzdGF0aWMgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IGRvbWFpbiAqY2QpCj4gPj4+PiArewo+ID4+Pj4gKyAgICBpbnQgcmM7Cj4gPj4+PiArCj4gPj4+
PiArICAgIGlmICggIWQtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQgJiYKPiA+Pj4+ICsgICAgICAg
ICAocmMgPSBkb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihkKSkgKQo+ID4+Pgo+ID4+
PiBBRkFJVSwgdGhlIHBhcmVudCBkb21haW4gd2lsbCBiZSBwYXVzZWQgaWYgaXQgd2Fzbid0IHBh
dXNlZCBiZWZvcmUgYW5kCj4gPj4+IHRoaXMgd2lsbCBub3QgYmUgdW5wYXVzZWQgYnkgdGhlIHNh
bWUgaHlwZXJjYWxsLiBSaWdodD8KPiA+Pgo+ID4+IFllcywgaXQgbmVlZHMgdG8gcmVtYWluIHBh
dXNlZCBhcyBsb25nIGFzIHRoZXJlIGFyZSBmb3JrcyBhY3RpdmUgZnJvbQo+ID4+IGl0LiBBZnRl
cndhcmRzIGl0IGNhbiBiZSB1bnBhdXNlZC4KPiA+Cj4gPiBJZiB5b3Ugd2FudCB0aGUgcGFyZW50
IGRvbWFpbiB0byByZW1haW4gcGF1c2VkIGZvciBhcyBsb25nIGFzIHRoZQo+ID4gZm9ya3MgYXJl
IGFjdGl2ZSwgc2hvdWxkbid0IGVhY2ggZm9yayBpbmNyZW1lbnQgdGhlIHBhdXNlIGNvdW50IG9u
Cj4gPiBjcmVhdGlvbiBhbmQgZGVjcmVtZW50IGl0IHdoZW4gdGhlIGZvcmsgaXMgZGVzdHJveWVk
Pwo+ID4KPiA+IEhvdyBjYW4geW91IGFzc3VyZSBubyBvdGhlciBvcGVyYXRpb24gb3IgZW50aXR5
IGhhcyBpbmNyZW1lbnRlZAo+ID4gY29udHJvbGxlcl9wYXVzZV9jb3VudCB0ZW1wb3JhcnkgYW5k
IGlzIGxpa2VseSB0byBkZWNyZW1lbnQgaXQgYXQgc29tZQo+ID4gcG9pbnQgd2hpbGUgZm9ya3Mg
YXJlIHN0aWxsIGFjdGl2ZT8KPgo+IFRoZSBfYnlfc3lzdGVtY29udHJvbGxlciB2YXJpYW50cyBs
b29rIHdyb25nIHRvIGJlIHVzZWQgaGVyZSBhbnl3YXkuCj4gV2h5IGlzIHRoaXMgbm90IHNpbXBs
eSBkb21haW5feyx1bn1wYXVzZSgpPwo+CgpNeSByZWFzb25pbmcgd2FzIHRoYXQgYnkgZGVmYXVs
dCB0aGUgdXNlciBzaG91bGQgcGF1c2UgdGhlIHBhcmVudCBWTQpiZWZvcmUgZm9ya2luZy4gVGhp
cyBzYW5pdHkgY2hlY2tzIGp1c3QgbWltaWNrcyB0aGF0IHN0ZXAgaW4gY2FzZSB0aGUKdXNlciBk
aWRuJ3QgZG8gdGhhdCBhbHJlYWR5LiBCdXQgSSBndWVzcyBlaXRoZXIgd291bGQgd29yaywgSSBk
b24ndApyZWFsbHkgc2VlIG11Y2ggZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28uCgpUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
