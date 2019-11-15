Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66EFE580
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:22:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVh7s-0006Vn-2c; Fri, 15 Nov 2019 19:19:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w8zo=ZH=gmail.com=2rushikeshj@srs-us1.protection.inumbo.net>)
 id 1iVh7q-0006Vi-On
 for xen-devel@lists.xen.org; Fri, 15 Nov 2019 19:19:22 +0000
X-Inumbo-ID: d38d8ab2-07dc-11ea-b678-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d38d8ab2-07dc-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:19:21 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s10so8274970edi.5
 for <xen-devel@lists.xen.org>; Fri, 15 Nov 2019 11:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KFbgC++13H9TCQ/nDmzvDVy70qMQ6wmfskpZ7T3QKio=;
 b=Pl5PEt+XKp5ZxABINaaedB4gYbhtyW1ZzYrGRJ/o2OqSga87bpdzF9YaXdgN/2lr8a
 U78WS7Pd8pNnzogBcZu1x06emc/SMtah42U/k3VDSLYmb5TBaNjbyOXtL78Tgc/zfTsv
 Jynxj2vtuP3x3t8h2qwASVeHOz/1m9Tp9/2gE8NyVhGxAYlz/eG0Py5Za83IWWkfGFNG
 Q2pgl+STzrMAVI/xKK1MewA/tAM0YEWs4lmYpZrl8tqb9/TXls8H7nPHBTpWyaaHxyYR
 7mP4u85Og5v2SEzQOaJ70lejBlA2Qn/fvXAvBI7ixTKmeNIf5i0dkPrOPVYCw1P/mjf8
 vcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KFbgC++13H9TCQ/nDmzvDVy70qMQ6wmfskpZ7T3QKio=;
 b=kRG7yFy05b77PzBcwZB+6VKlw3wlMa+jZzpVMOuW1fzB1eU62ztrchcWBs7XrMvw0A
 pkuSTLkL/KIZHBGzcGvE5W8ANozsxxmhmhLDGmgcdNaEghiqRI8NdkyDQY7m8kCQm49v
 XSeQiOYTRbOJC91AQOLy6tWG+2V4XwnH4j2HoELDnYpxQxk5ZUq0rTwRl3osJ7b71fZn
 FSXwH6JjSAMVzd/kRG89RTCQ1H4qrjD7dlkSsl/MNPGx/416vs+hUQGfG2gAKnorSjEZ
 hExWNz8ugBEUms5P73XHJ0+X7gaZqf+RrQG2T8YEIhdi0B7o0EOo2kltntg5h3Rf1LZu
 FEbA==
X-Gm-Message-State: APjAAAVXxNPtQp8suUzD9Vep0v0NQovU0u0vF0axOlhAm8fEvcsobH6a
 UdvfULdQi9XThPRMKn6NkZYyGSSKu5jUnDhq89Q=
X-Google-Smtp-Source: APXvYqwRZPJ7RD5JAwshZCHl/tfK6/pyo7IjP9WXn8RcnHo7kITGI68czFe7dNiREMlqVGq7WNXUHzydyxqEHcyOIsY=
X-Received: by 2002:a17:906:6852:: with SMTP id
 a18mr3082996ejs.193.1573845560720; 
 Fri, 15 Nov 2019 11:19:20 -0800 (PST)
MIME-Version: 1.0
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
In-Reply-To: <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
From: Rishi <2rushikeshj@gmail.com>
Date: Sat, 16 Nov 2019 00:49:09 +0530
Message-ID: <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMTA6MDUgUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDE0LjExLjIwMTkgMTc6MDcsIFJpc2hpIHdyb3RlOgo+ID4g
SW4gc29tZSBvZiBvdXIgaG9zdHMsIFhlbiBpcyBub3QgY29ycmVjdGx5IGV4cG9zaW5nIHByb2Nl
c3NvciB0aGVybWFsCj4gPiBjYXBhYmlsaXRpZXMgdG8gRG9tMC4KPiA+IFBsZWFzZSByZWZlcjog
aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUzNDcKPiA+Cj4g
PiBUaGUgZmxhZwo+ID4gLyogVGhlcm1hbCBhbmQgUG93ZXIgTWFuYWdlbWVudCBMZWFmLCBDUFVJ
RCBsZXZlbCAweDAwMDAwMDA2IChFQVgpLCB3b3JkIDE0ICovCj4gPiBYODZfRkVBVFVSRV9EVEhF
Uk0gKDE0KjMyKyAwKQo+ID4KPiA+IGlzIHJldHVybmVkIDAgdmlhIFBWT1BfVkNBTEw0IHZzIHJl
dHVybnMgMSB2aWEgbmF0aXZlX2NwdWlkKCkgY2FsbCBmcm9tIERvbTAuCj4gPgo+ID4gU2FtcGxl
IG91dHB1dCB2aWEgUFZDQUxMIHZzIE5hdGl2ZSBjYWxsLgo+ID4gWzYzMjkxLjY4ODc1NV0gY3B1
aWRfZWF4IDYgOiAgYSAwCj4gPiBbNjMyOTEuNjg4NzU5XSBuYXRpdmVfY3B1aWQgOiBhIDc3Cj4g
Pgo+ID4gSXMgdGhpcyBhIGJ1ZyBvciBuZWVkcyBzb21lIHNwZWNpYWwgZmVhdHVyZSB0byBiZSBl
bmFibGVkIGZyb20gWGVuIGNvbW1hbmQgbGluZT8KPgo+IEV4cG9zaW5nIHRoaXMgdG8gZ3Vlc3Rz
IChpbmNsdWRpbmcgRG9tMCkgd291bGQgaW1wbHkgcHJvcGVybHkKPiB2aXJ0dWFsaXppbmcgdGhl
IHJlc3BlY3RpdmUgYmVoYXZpb3IuIEluCj4geGVuL2FyY2gveDg2L2NwdWlkLmM6cmVjYWxjdWxh
dGVfbWlzYygpIHdlIHNwZWNpZmljYWxseSBoYXZlCj4KPiAgICAgcC0+YmFzaWMucmF3WzB4Nl0g
PSBFTVBUWV9MRUFGOyAvKiBUaGVybS9Qb3dlciBub3QgZXhwb3NlZCB0byBndWVzdHMuICovCj4K
PiBJZiB5b3Ugd2FudGVkIHRoaXMgZXhwb3NlZCwgeW91J2QgZmlyc3Qgb2YgYWxsIG5lZWQgdG8g
Y29tZSB1cAo+IHdpdGggYSBzYW5lIHZpcnR1YWxpemF0aW9uIG1vZGVsIG9mIHRoaXMgZnVuY3Rp
b25hbGl0eS4gU2ltcGx5Cj4gZXhwb3NpbmcgdGhlIENQVUlEIGJpdHMgaXMgbm90IGdvaW5nIHRv
IGJlIGFuIG9wdGlvbi4KPgo+IEphbgoKSXMgaXQgZHVlIHRvIGFueSBzZWN1cml0eSByaXNrcz8g
SWYgc28sIGFyZSB0aGVyZSBhbnkgYWR2aXNvcmllcyBhcm91bmQgaXQ/CgpTaG91bGQgaXQgYmUg
YWxsb3dlZCB0aGF0IFhlbiBpcyBoaWRpbmcgQ1BVIGZsYWdzIChpbiB0aGlzIGNhc2UKVGhlcm0p
LCB5ZXQgYSBtb2RpZmljYXRpb24gdG8gRG9tMCBrZXJuZWwgYWxsb3dzIHRoZW0gdG8gYmUgYnJv
dWdodApiYWNrPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
