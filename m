Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C11268B2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 19:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii0Bk-0000m8-LK; Thu, 19 Dec 2019 18:06:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ii0Bi-0000m3-Gw
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 18:06:14 +0000
X-Inumbo-ID: 399ddc40-228a-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 399ddc40-228a-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 18:06:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576778765; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=IyloxmqkBHPSY7qlnUrWFB5IHpRUiZ4wTJ1twMBOuns=;
 b=Yu6Pv1c9Oxb4rWCnyoxpRAhBViOwJaQvx/0V+KxLYrH69Hj9lfOpfgJwRkwQLDxk0hRXamSv
 K7JwupVGxQnt9/Uv+dNcb4PYrvLfDzWw5Zn6yE84NDVhfB7GbpHFdM1u7FjclyMoGFMrHebY
 cOThdW5vYVJUMFU3iHQTX9bO/ZU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5dfbbad8.7f08031b8c30-smtp-out-n02;
 Thu, 19 Dec 2019 18:00:56 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id c14so6905374wrn.7
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 10:00:56 -0800 (PST)
X-Gm-Message-State: APjAAAUOSWGwZw1/HDXlKqIXIWlPj743+FTnoWRF+CwtUSuMdEtFZN8U
 WdAgcAkfmhrnCAjRGeDtx+h+Juc4ljRwqlKlPzI=
X-Google-Smtp-Source: APXvYqy9OprZzvccyGS6uu27FtixjyXOZig4RSIZsLGKxn7h8C6OfsZLYv6Onl7gMJzglpm1CZ6Yo8QUuT4w5AosfTM=
X-Received: by 2002:adf:b60f:: with SMTP id f15mr10219209wre.372.1576778455314; 
 Thu, 19 Dec 2019 10:00:55 -0800 (PST)
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
 <CABfawhkuKkos3x4C6UxKVd2A=2f6ESs+kNZtAfcEqtgnogCXYw@mail.gmail.com>
 <ed2aa649-0c68-5b10-dbe7-6b91c8bb00ca@xen.org>
In-Reply-To: <ed2aa649-0c68-5b10-dbe7-6b91c8bb00ca@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 11:00:18 -0700
X-Gmail-Original-Message-ID: <CABfawhk++Exkc=uCZ=eer15Hyzu1OSh4gww78-avDs5BSoYpXg@mail.gmail.com>
Message-ID: <CABfawhk++Exkc=uCZ=eer15Hyzu1OSh4gww78-avDs5BSoYpXg@mail.gmail.com>
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

PiA+Pj4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRoYXQgd2UganVzdCByZWxlYXNlIGEgZm9y
ayAob3IganVzdAo+ID4+PiB0aGUgcGF0Y2hlcykgYW5kIHdhbGsgYXdheS4KPiA+Pj4gICBJZiB0
aGUgWGVuIGNvbW11bml0eSB3YW50cyB0byBtYWtlIHRoZQo+ID4+PiBhbm5vdW5jZW1lbnQgdGhh
dCBvbmx5IGNvZGUgdGhhdCB3aWxsIGhhdmUgbG9uZyB0ZXJtIHN1cHBvcnQgYW5kIGlzCj4gPj4+
ICJzdGFibGUiIGlzIGFjY2VwdGVkIHVwc3RyZWFtIHRoYXQncyBJTUhPIGRyYXN0aWNhbGx5IGdv
aW5nIHRvIHJlZHVjZQo+ID4+PiBwZW9wbGUncyBpbnRlcmVzdCB0byBzaGFyZSBhbnl0aGluZy4K
PiA+Pgo+ID4+IFNoYXJpbmcgaXMgb25lIHRoaW5nLCBidXQgaWYgdGhpcyBjb2RlIGlzIG5vdCBh
dCBsZWFzdCBhIG1pbmltdW0KPiA+PiBtYWludGFpbmVkIHRoZW4gaXQgaXMgbGlrZWx5IHRoZSBj
b2RlIHdpbGwgbm90IGJlIGZ1bmN0aW9uYWwgaW4gYSB5ZWFyIHRpbWUuCj4gPgo+ID4gU3VycHJp
c2luZ2x5IG1lbV9zaGFyaW5nIGhhZCBvbmx5IG1pbm9yIGJpdHJvdHMgaW4gdGhlIGxhc3QgfjUg
eWVhcnMKPiA+IGluIHdoaWNoIHRpbWUgaXQgaGFzIGJlZW4gcHJldHR5IG11Y2ggYWJhbmRvbmVk
Lgo+IFRoaXMgZmFsbHMgdW5kZXIgYSAibWluaW11bSBtYWludGFpbmVkIi4gVGhpcyB3YXNuJ3Qg
Y2xlYXIgZnJvbSB5b3VyCj4gcHJldmlvdXMgc3RhdGVtZW50IHN0YXRpbmcgdGhlcmUgd2lsbCBi
ZSBubyBzdXBwb3J0LgoKU3VyZSwgSSBtZWFudCB0aGVyZSBpcyBubyBzdXBwb3J0IGZyb20gSW50
ZWwgKGllLiBpdCdzIG5vdCBwYXJ0IG9mIG15CmpvYi1kZXNjcmlwdGlvbiBub3IgZG8gSSBnZXQg
cGF5ZWQgdG8gc3VwcG9ydCB0aGlzIGxvbmctdGVybSkuIEkKdXN1YWxseSBjaGVjayBkdXJpbmcg
dGhlIFJDIHRlc3QgZGF5cyB0aGF0IGl0J3MgYXQgbGVhc3QgZnVuY3Rpb25hbCBieQpkb2luZyBz
b21lIHRlc3RpbmcgbWFudWFsbHkuIEJ1dCBpdCdzIHByZXR0eSBhZC1ob2Mgd2hlbiBhbmQgaWYg
SSBkbwp0aGF0IChoZW5jZSB0aGUgT2RkIGZpeGVzIHN0YXR1cykuCgo+ID4KPiA+Pj4+PiBCdXQg
aWYgb3RoZXJzIGZlZWwgdGhhdCBzdHJvbmdseSBhcyB3ZWxsIGFib3V0Cj4gPj4+Pj4gaGF2aW5n
IHRvIGhhdmUgY29udGludWF0aW9uIGZvciB0aGlzIEkgZG9uJ3QgcmVhbGx5IG1pbmQgYWRkaW5n
IGl0Lgo+ID4+Pj4KPiA+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGNvbnRpbnVhdGlvbiB3b3JrIGlz
IGdvaW5nIHRvIGJlIGRpZmZpY3VsdCwgYnV0IGlmIHlvdQo+ID4+Pj4gd2FudCB0byBkZWxheSBp
dCwgdGhlbiB0aGUgbWluaW11bSBpcyB0byBkb2N1bWVudCBzdWNoIGFzc3VtcHRpb25zIGZvcgo+
ID4+Pj4geW91ciB1c2Vycy4KPiA+Pj4KPiA+Pj4gSSBqdXN0IGRvbid0IHNlZSBhIHVzZSBmb3Ig
aXQgYmVjYXVzZSBpdCB3aWxsIG5ldmVyIGFjdHVhbGx5IGV4ZWN1dGUuCj4gPj4KPiA+PiBUaGF0
J3MgYSB2ZXJ5IG5hcnJvdyB2aWV3IG9mIGhvdyB5b3VyIGh5cGVyY2FsbCBjYW4gYmUgdXNlZC4g
SSBrbm93IHRoYXQKPiA+PiB5b3Ugc2FpZCB0aGF0IHNob3VsZCBvbmx5IGJlIGNhbGxlZCBlYXJs
eSwgYnV0IGltYWdpbmUgZm9yIGEgbW9tZW50IHRoZQo+ID4+IHVzZXIgZGVjaWRlIHRvIGNhbGwg
aXQgbXVjaCBsYXRlciBpbiB0aGUgZm9yayBwcm9jZXNzLgo+ID4+Cj4gPj4+IFNvIHRvIG1lIGl0
IGp1c3QgbG9va3MgbGlrZSB1bm5lY2Vzc2FyeSBkZWFkIGdsdWUuCj4gPj4KPiA+PiBUcnkgdG8g
Y2FsbCB0aGUgaHlwZXJjYWxsIGFmdGVyIGVub3VnaCBkZWR1cGxpY2F0aW9uIGhhcHBlbiAobWF5
YmUKPiA+PiAyMG1pbikuIEFsdGVybmF0aXZlbHksIGdpdmUgbWUgYWNjZXNzIHRvIHlvdXIgbWFj
aGluZSB3aXRoIHRoZSBjb2RlIGFuZAo+ID4+IEkgY2FuIHNob3cgaG93IGl0IGNhbiBiZSBtaXN1
c2VkIDspLgo+ID4KPiA+IEl0IHdpbGwgaGFuZyBmb3IgYSBiaXQgZm9yIHN1cmUgYW5kIExpbnV4
IGluIGRvbTAgd2lsbCBjb21wbGFpbiB0aGF0IGEKPiA+IENQVSBpcyBzdHVjay4gQnV0IGl0IHdp
bGwgZXZlbnR1YWxseSBmaW5pc2guIEl0J3Mgbm90IGxpa2UgaXQncyBkb2luZwo+ID4gYWxsIHRo
YXQgbXVjaC4gQW5kIGFueXdheSwgaWYgeW91IG5vdGljZSB0aGF0IGhhcHBlbmluZyB3aGVuIHlv
dSBjYWxsCj4gPiBpdCBpdCB3aWxsIGJlIGFuIG9idmlvdXMgY2x1ZSB0aGF0IHlvdSBzaG91bGRu
J3QgYmUgdXNpbmcgaXQgdW5kZXIgdGhlCj4gPiBzaXR1YXRpb24geW91IGFyZSB1c2luZyBpdCB1
bmRlci4gSGF2aW5nIGNvbnRpbnVhdGlvbiB3b3VsZCBoaWRlIHRoYXQuCj4KPiBJIGFtIG5vdCBn
b2luZyB0byBhcmd1ZSBtb3JlIGFzIHRoaXMgaXMgYW4gZXhwZXJpbWVudGFsIGZlYXR1cmUuIEJ1
dAo+IHRoaXMgd2lsbCBiZSBhIHNob3dzdG9wcGVyIGlmIHdlIGV2ZXIgY29uc2lkZXIgbWVtX3No
YXJpbmcgdG8gYmUKPiBzdXBwb3J0ZWQgKG9yIGV2ZW4gc2VjdXJpdHkgc3VwcG9ydGVkKS4KPgo+
IE1lYW53aGlsZSBwbGVhc2UgZG9jdW1lbnQgdGhlIGFzc3VtcHRpb24uCgpBY2ssIGFscmVhZHkg
ZGlkLgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
