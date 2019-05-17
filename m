Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DFC22014
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2019 00:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRkwg-0006S7-Fe; Fri, 17 May 2019 22:03:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ke0=TR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRkwf-0006S2-CJ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 22:03:17 +0000
X-Inumbo-ID: 9199e46f-78ef-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9199e46f-78ef-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 22:03:15 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z5so7545980lji.10
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O5n/msiISze9JoG98iWFg9QkU0TLk7ccycXNkJD1VMU=;
 b=sq17cLTu+36SRiwY0gncdnsfSON7IoCEWIXgTaWrEC20pQ2wv1Bm3Rlag+IOUbEaWT
 AFzt3R6EfqaexAawf9SeczhD1jEFuhJRquo5ZFFpUL6EIXVl6LMqBghxOMfBtJJWFSdH
 lje5mz8ugNYRr2/nK7ML+tvAI7xcZ6BBUw2cvC3eAE2jg5GPSziJbjj2Jf04NCRkJw7F
 RwisgZ/EhImpGwaHXc7nID9uApqkXthJzJEa8jlDjkkizBGpWD4UEx3KjjU8/iOn+sRZ
 z/1wY9s0nM4tlq2MGuc2NbBXzwpxdrqK78AR/WG5zoeKyz/qsKIoswES4/n4NRxGe/Mr
 XMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O5n/msiISze9JoG98iWFg9QkU0TLk7ccycXNkJD1VMU=;
 b=Zd/kXSHqv+JmbgRAjByqUnLKDrO0VHKYTkZ5grqQWX0u+o7td83s+4pzLj40ZHZX9z
 OKum3Ul+cdYU7s20T39wh5vRi7wz9pTwCzB8ScQO88drjp4Uu/Z1HCWTbyEvuEg43XwT
 2FIj9UesRgG38mEGSp1BYGktcLjkdU1CuUaq4se6cj5zubC7uqSF2E31eQQ6Lhlz9QN5
 GgKNxtz3h5yFYyDSfhXETDrQAqfkOHtkg7LeKoEU7S6nlC99O9PVmSR1witPQgqL4acZ
 VkUwwNBcSe0yKigKUp4ABIGt3Ov/yi5MJdVuBbkJL/NySsNtgNS1mYu/K7oaojpYBm+5
 q8Mw==
X-Gm-Message-State: APjAAAX3YL1u+ngsQLPA47IOIRfZngg1OcKjM72zsSdgQ3ycR2pFKSLm
 KBHaCw9vCJsuJemslfIR9iCRVd6enBOwx53GaAw=
X-Google-Smtp-Source: APXvYqykV5SzzFKsxsQ03ivspnOK3ytQNTkRKgtgzeJB8KAOYTtr9pK1AvxRqtncnFnxAt0HtfJ4RSi0d3GaZut3X54=
X-Received: by 2002:a2e:597:: with SMTP id 145mr2167389ljf.127.1558130594147; 
 Fri, 17 May 2019 15:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
 <b3621bcf-89d0-22a0-2416-4cf5a341d13a@arm.com>
In-Reply-To: <b3621bcf-89d0-22a0-2416-4cf5a341d13a@arm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 17 May 2019 15:01:01 -0700
Message-ID: <CAKmqyKN=HCwitx7StNKLmNhjVeXq0cEawyi+j9VJf5dkhfi=jQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTo0NiBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxNi8wNS8yMDE5IDIwOjMwLCBBbGlzdGFpciBG
cmFuY2lzIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMzozMiBBTSBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4+Pj4gT24gMTYuMDUuMTkg
YXQgMDI6MDIsIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+IHdyb3RlOgo+ID4+PiBNYWtlIHRo
ZSBhc20vdnBsMDExLmggZGVwZW5kZW50IG9uIHRoZSBBUk0gYXJjaGl0ZWN0dXJlLgo+ID4+Cj4g
Pj4gQnV0IHdlIG9ubHkgaGF2ZSB4ODYgYW5kIEFybSByaWdodCBub3cuIEEgd29yZCBtb3JlIGFi
b3V0Cj4gPj4geW91ciBtb3RpdmF0aW9uIHdvdWxkIGhlbHAuCj4gPgo+ID4gQXMgdGhlIGNvZGUg
Y3VycmVudGx5IGlzIG5vIG9uZSBjYW4gYWRkIGFub3RoZXIgYXJjaGl0ZWN0dXJlLiBUaGlzIGlz
Cj4gPiBqdXN0IGEgZ2VuZXJhbCBmaXh1cCBhcyBhc3N1bWluZyBYZW4gd2lsbCBvbmx5IGV2ZXIg
c3VwcG9ydCB0d28gYXJjaHMKPiA+IHNlZW1zIHN0cmFuZ2UuCj4KPiBBdCB3aGljaCBwb2ludCwg
d291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGF2b2lkICNpZmRlZiBBUkNIIGluIGNvbW1vbiBjb2Rl
Pwo+IEluc3RlYWQsIHdlIGNvdWxkIHByb3ZpZGUgYXJjaCBoZWxwZXIgYW5kL29yIG1vcmUgbWVh
bmluZyBDT05GSUcgbmFtZS4KCkknbSBub3Qgc3VyZSBpZiB0aGUgYXJjaCBoZWxwZXJzIGFyZSBh
bnkgZWFzaWVyIHRvIHVuZGVyc3RhbmQuIE1heWJlCnRoYXQgaXMgd29ydGggbG9va2luZyBpbnRv
LCBhdCB0aGUgbW9tZW50IHRob3VnaCBJIHN0aWxsIHRoaW5rIGl0Cm1ha2VzIHNlbnNlIHRvIGZp
eCB0aGlzICNpZmRlZi4KCkFsaXN0YWlyCgo+Cj4gQ2hlZXJzLAo+Cj4gLS0KPiBKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
