Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E87139A4A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 20:44:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir5aF-0005bF-2A; Mon, 13 Jan 2020 19:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DMbA=3C=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ir5aD-0005bA-7K
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 19:41:05 +0000
X-Inumbo-ID: a24e100a-363c-11ea-b89f-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a24e100a-363c-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 19:41:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z22so11505068ljg.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 11:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P2JjBgb41yqRuhnejMVHAJJ0rFFFUIyAt9aN81/G+tQ=;
 b=TI8YDdmz/VoaloBXcMa1uow603QlYwl+KXGwFAJUUvXRjZLj+KkIFnsZQri7kwuRsv
 eP/KPEGROBYJpKyE8ACnFntLP5EcdSqQpV9GiHdnCPH2Gcbo1hn06SGrvddmM5SSgRyo
 kRaSXYTcYFGWTN8tBQ1HEeBH6IGjFr4c8ve5lQTO6ownl2Tl83Bibv+cJ7an7tbPhJ/c
 SYBiep+pXwX4MGAoOrtJM5B5tzzaBM+lILwGRMEesxuhuahrTVlhpQUM6yu2RaDa7Tg4
 r7Mv+Ol+FeJk47gU8E+UG8E/GIPOG2KVQfU/LZpMRST7eSWuQopwwYT+51BaSENwkFD1
 mn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2JjBgb41yqRuhnejMVHAJJ0rFFFUIyAt9aN81/G+tQ=;
 b=etbQamSedLcxHK3nTHNruotAM+elXMDCs+pBGf8/S/46wlScSFPZ1IbMJIOJ6AY6u0
 V/KKb9AoD7m/6cZI0GNo0c2Zr7t7QKhoX4s8WqydPPPj6UeZbkXZ3RV21Qj/uL0cNOw7
 hknxkkpuw9InlzJQFFAgrrPfKw2F1k3xyCjcDPJh/npSl8FBYWTZ1f06GoxoCHAq7358
 P5rK83UPwL3GKcNkc9KlFGsg2C7n83/IMscPpvwza5ZNx1AmZ+FULRn8XerrwUEsKFff
 2sxF5f0USZLbOf4O1F8qRHC342b3Cx8JqTMZP4fUaaXrVFH5x6LUhti9QH/CES6c08jW
 Saeg==
X-Gm-Message-State: APjAAAU4txn/+U5Uu8f8vqdhEsZPSaERraRpwnZnco+tiW5eps/Bq8GD
 Olm/7MkDvtKKrlqBQrYqesikCfQjyl9XKZWOurY=
X-Google-Smtp-Source: APXvYqzuxVJZX4gHjdaHuvj65Y4fcRWbEzcu2H/7DHiVPxjGvQGd+tcXylV3yJlADTIHYSIcpWHmH4SqTmFAfRTNt6o=
X-Received: by 2002:a2e:2283:: with SMTP id
 i125mr12242120lji.244.1578944463287; 
 Mon, 13 Jan 2020 11:41:03 -0800 (PST)
MIME-Version: 1.0
References: <339bee59-b89b-b3fc-fb7d-114e8ffe1716@suse.com>
 <e06491b8-58cc-46b1-3f79-d06d6765d089@suse.com>
 <aa06aa23-d108-671e-74cc-5fd50c848792@citrix.com>
In-Reply-To: <aa06aa23-d108-671e-74cc-5fd50c848792@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 13 Jan 2020 14:40:52 -0500
Message-ID: <CAKf6xpuHqJiMjkkx=bttN4LWBbtOdcu_=SPoqaC+3kg=osAC4g@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] Ping: [PATCH] x86/HVM: use single (atomic) MOV for
 aligned emulated writes
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
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMTE6MDkgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMC8xMi8yMDE5IDE2OjIzLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+IE9uIDE2LjA5LjIwMTkgMTE6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4+IFVzaW5nIG1lbWNweSgpIG1heSByZXN1bHQgaW4gbXVsdGlwbGUgaW5kaXZpZHVhbCBieXRl
IGFjY2Vzc2VzCj4gPj4gKGRlcGVuZGVuaW5nIGhvdyBtZW1jcHkoKSBpcyBpbXBsZW1lbnRlZCBh
bmQgaG93IHRoZSByZXN1bHRpbmcgaW5zbnMsCj4gPj4gZS5nLiBSRVAgTU9WU0IsIGdldCBjYXJy
aWVkIG91dCBpbiBoYXJkd2FyZSksIHdoaWNoIGlzbid0IHdoYXQgd2UKPiA+PiB3YW50L25lZWQg
Zm9yIGNhcnJ5aW5nIG91dCBndWVzdCBpbnNucyBhcyBjb3JyZWN0bHkgYXMgcG9zc2libGUuIEZh
bGwKPiA+PiBiYWNrIHRvIG1lbWNweSgpIG9ubHkgZm9yIGFjY2Vzc2VzIG5vdCAyLCA0LCBvciA4
IGJ5dGVzIGluIHNpemUuCj4gPj4KPiA+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpTaG91bGQgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYzpo
dm1fZW11bGF0ZV93cml0ZSgpIGJlIHNpbWlsYXJseSBjaGFuZ2VkPwoKVGhhbmtzLApKYXNvbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
