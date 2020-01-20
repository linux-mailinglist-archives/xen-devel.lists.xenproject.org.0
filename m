Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBD142680
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 10:00:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itSsz-0007X4-0C; Mon, 20 Jan 2020 08:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XRTg=3J=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itSsx-0007Wz-Lq
 for xen-devel@lists.xen.org; Mon, 20 Jan 2020 08:58:15 +0000
X-Inumbo-ID: fe19dd44-3b62-11ea-aecd-bc764e2007e4
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe19dd44-3b62-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 08:58:14 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so15512985pfs.6
 for <xen-devel@lists.xen.org>; Mon, 20 Jan 2020 00:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OtvuAZ/43/mZHHfizo8i6GGUaKzklYrgQcNWjIYaCCE=;
 b=WdDp0lZvPJmeAzRMpIwzwDhesFmt4i0sEFxsoWiXOtYFS56QGmK9RMbCK6kw8m7QEI
 0X5HiIFpbovQKTm2dPFyoK+0BD8h+9nyX/EFDXoRsjNg9SiNa1Dw9kMgtS9ic0wJ/tEG
 oZuRKII7pM05FfYMOJ3FqF18EyzDEVz6sDyEGT2vwoMuUIYkc04jldFVMxGXrGzXmA+k
 qj0YNEJsKBVQNQVF/I6qffKSeeh1cr9HqY0z+JZtXKYILrthO4WKzF5wlkNwEJgwKAte
 f11oQtwy1F8rNTly7RHk8geriY8aPkf0JWTAO66sju9daX5QTYNgOspqFFcF7ixy3mPQ
 jYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OtvuAZ/43/mZHHfizo8i6GGUaKzklYrgQcNWjIYaCCE=;
 b=pB5xbYcp/pJPwEcncVi9SPmRfkUEabJQfI7UT6hyRJHzhdUiqcWMAp5trXxGNUZ3JD
 cwWlwYw839Wx6gJzQdmgnQh+ZXD+m/AamT811GoCGNgAy1etKgrPYeBtxopC8fOj6S5X
 gzi+lG6ym76roGw5jlBKAA4O6YUHZ3LFCPgGSRezo47Qo1E+vF0wS2lhlu07u1uCDUj+
 TbOuOxN//LuEOqXMBVRjCCYVNfxe7Nu+bYPKLUH/50njDXIy4L0EdvrsMZP4tIJOGWWR
 oyIFrdF+rA/7Wj7Ueq8NZgyoUeaxEPLK9XXLRXIzb1tFZfMKzjZ/cTJcAE1mhO76defN
 K8yQ==
X-Gm-Message-State: APjAAAVKMuO4n6Aiu/NyEcOyM6u3CXWcNBrqS9P4MtYJKM9WmiyssdNo
 qdGr8xevoGiIp8SOTwbxVLp719syTL1CCZUIxKM=
X-Google-Smtp-Source: APXvYqxDKYl6lynrRj2aQbMI8J4UD8eLFvatdUCj7kFSIsY6n7F0dc4aX6kmUr5QAY/bvs1TX2M2j/bAQhNekoygjc0=
X-Received: by 2002:a63:220b:: with SMTP id i11mr58192051pgi.50.1579510693988; 
 Mon, 20 Jan 2020 00:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
 <20200117125834.14552-5-sergey.dyasli@citrix.com>
In-Reply-To: <20200117125834.14552-5-sergey.dyasli@citrix.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 20 Jan 2020 08:58:02 +0000
Message-ID: <CACCGGhApXXnQwfBN_LioAh+8bk-cAAQ2ciua-MnnQoMBUfap6g@mail.gmail.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen/netback: fix grant copy across
 page boundary
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNyBKYW4gMjAyMCBhdCAxMjo1OSwgU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNs
aUBjaXRyaXguY29tPiB3cm90ZToKPgo+IEZyb206IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPgo+Cj4gV2hlbiBLQVNBTiAob3IgU0xVQl9ERUJVRykgaXMgdHVybmVk
IG9uLCB0aGVyZSBpcyBhIGhpZ2hlciBjaGFuY2UgdGhhdAo+IG5vbi1wb3dlci1vZi10d28gYWxs
b2NhdGlvbnMgYXJlIG5vdCBhbGlnbmVkIHRvIHRoZSBuZXh0IHBvd2VyIG9mIDIgb2YKPiB0aGUg
c2l6ZS4gVGhlcmVmb3JlLCBoYW5kbGUgZ3JhbnQgY29waWVzIHRoYXQgY3Jvc3MgcGFnZSBib3Vu
ZGFyaWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNs
aUBjaXRyaXguY29tPgo+IC0tLQo+IHYxIC0tPiB2MjoKPiAtIFVzZSBzaXplb2ZfZmllbGQoc3Ry
dWN0IHNrX2J1ZmYsIGNiKSkgaW5zdGVhZCBvZiBtYWdpYyBudW1iZXIgNDgKPiAtIFNsaWdodGx5
IHVwZGF0ZSBjb21taXQgbWVzc2FnZQo+Cj4gUkZDIC0tPiB2MToKPiAtIEFkZGVkIEJVSUxEX0JV
R19PTiB0byB0aGUgbmV0YmFjayBwYXRjaAo+IC0geGVudmlmX2lkeF9yZWxlYXNlKCkgbm93IGxv
Y2F0ZWQgb3V0c2lkZSB0aGUgbG9vcAo+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9y
Zz4KPiBDQzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpBY2tlZC1ieTogUGF1bCBEdXJy
YW50IDxwYXVsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
