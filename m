Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5368F76C37
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1ca-0007PW-62; Fri, 26 Jul 2019 14:55:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr1cY-0007PN-2x
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:54:58 +0000
X-Inumbo-ID: 55513fd8-afb5-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 55513fd8-afb5-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:54:56 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j6so30190474ioa.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vgCkqq2ElBKhi4YpaxpbRORf1zcf7BRe7xckL6qIek=;
 b=DiKZqdWKudZI2dG4nFOyk9qNq+cWEKF/9QWlJuvyopLrzX9u2fEhC3WhnhOR/bvm5C
 M40GjBJqsdry/JwUg3GfCxzK0MTGpYMIk1Vn0wgWf6vI0+Wc0xvHl+6OOmVMc/xoQBL6
 lZkkFqKkiROv+7IVuNd0KSwF2PuXmInsHVrde47Zv6KbPqsgunb+ocnC9HqKKh1zA7Xj
 E71b3fHl1MJFS7tO+1bv4sAL0sX//X6fnZj18NTotcoY7giHF9L0SQMsqZLmb0S+wOKv
 462N7vcKn0sUydWSptivDj8LyNGuvw/+pdJRBVnFZyDK56SMi43eYrJnesZZmBlzaqHm
 vtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vgCkqq2ElBKhi4YpaxpbRORf1zcf7BRe7xckL6qIek=;
 b=PZHyp+OsUjYpXjBvXipsrLwQ+uA7HvfCGoiGjwMX3vWM0kIh6fKh7WNUYN3IUdWemH
 t74JBGgc5YbsVz9McFZU670u1QyierIsRohgVb8sevORoI+r+pFuf4zxYJ/5d2R7C1Vg
 rb6HLPd7A2BR0/42opxqo051qLgQezNuNhGOfSAWiKSb09D+t55XKsLd1JwLdB9LZ/BF
 Zhkg3gKW+IeZOB1UmxYo4XhaLl2UW87TJXEsgarhoND2wKX8EC7Y6hdRPeKde9vgdUjz
 vw0JE+38g2HO24zdxXEWG4WaH/onDIA2UgD1TheEWjZBbv168ygcvVyYNaQU/C2B1LdX
 pacQ==
X-Gm-Message-State: APjAAAXT+ZksUOWTrp0GRuSy8ssoNCXuxJiVrcc+pZZCspDELkjn/8nu
 oqOC7xDw0RrsCmtMRVcZfMSDaGhzixIB1zOGFHI=
X-Google-Smtp-Source: APXvYqzDKVFnWjsNedD7oSC0rvnURYIn6HKb5+/SOdqK/b52Xc5k0hfSAgsQmWhAAntkKucELuImXTK9pffAMo1II4Q=
X-Received: by 2002:a5d:9448:: with SMTP id x8mr29450129ior.102.1564152896414; 
 Fri, 26 Jul 2019 07:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
In-Reply-To: <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 17:54:45 +0300
Message-ID: <CAOcoXZY0Cr5UJmkODBWfdcW7REM-DUptVpr9sQwkQt8rpYRC-A@mail.gmail.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, Lars Kurth <lars.kurth@citrix.com>, 
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGxlYXNlIGJlIGF3YXJlIHRoYXQgc3VjaCBmb3JfZWFjaF8qIGNhc2VzIGFyZSBjb3ZlcmVkIGJ5
IGNsYW5nLWZvcm1hdC4KClRoYW5rcwoKT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgODo1MCBQTSBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gPiAgICAtIExp
bmUgMTAyNTogVGhlIHRvb2xzIG5lZWRzIHRvIGJlIGFibGUgdG8gZGVhbCBmb3JfZWFjaF92Y3B1
KC4uLikgJiBjby4KPgo+IFRoZXNlIGNhbiBiZSBtYWRlIE9LIGJ5IGFkZGluZyBicmFjZXMuIE90
aGVyIHRoYW4gdGhhdCB0aGUgb25seSB3YXkgSQo+IGZvdW5kIHRvIG1ha2UgaXQgbm90IGNoYW5n
ZSB0aGUgaW5kZW50YXRpb24gaXMgdG8gYWRkIHRoZSBjb21tZW50ICIvKgo+ICpJTkRFTlQtT0ZG
KiAqLyIgYmVmb3JlIHRoZSBibG9jayBhbmQgIi8qICpJTkRFTlQtT04qICovIiBhZnRlcndhcmRz
Lgo+Cj4gVGFtYXMKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
