Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8407C9F3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 19:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hss39-0005FT-9k; Wed, 31 Jul 2019 17:06:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mXbA=V4=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hss37-0005FK-GO
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 17:06:01 +0000
X-Inumbo-ID: 7882bf67-b3b5-11e9-8980-bc764e045a96
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7882bf67-b3b5-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 17:06:00 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h6so12680430iom.7
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p99yD2tbA3jtcUDfYEMZ99DltewhcyYF0B1inay7Kt8=;
 b=MxUpA6KaKZT6jjs9HCpis3el3mKZJyQbCNCcH09tpyqTSxnXh4qCs0p4rLG1flbU+j
 upQxEAR721maKfD12k1a5SBi2MX04rg1iYwrqjb3CWG/eaGfdg/S5c5SSKitOXHZyoH4
 72fME5zpzP9oCoZwMTL7XvVJ560Yi8EDzOheGWsY+ChNbH2BmMe04hJsBkZl5hgiMqfU
 gxee6MvdDxEFBUecIE/2xVu+DmLNOaSkR2WXbpF5k31/6yVyZBTkBvuFnkAXRyUCqaeR
 yy+pBllxy1sGizGs99+lJkGRn7eJoQWlTIycIiz0klAgSVE3HjgFn3HwNgOJrP9+qti2
 lfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p99yD2tbA3jtcUDfYEMZ99DltewhcyYF0B1inay7Kt8=;
 b=kkWcO94e4WGdM91M9KeruQ9vWFTRfV4YSOXWzksz6KCkvVOk+MoFhrPtGvgIBTnZP9
 sst8jYVju8mzdfPC2q0b4ysqLoTivN9RGJmaMsyVAvcj9CpEdUjiPbKRB0g+JolPOocI
 Ia1m3LdhuQm6GR3gypyVudPM+/mzJR5J3WXadT3shv+EPvVZCJeBxgRZ4w3zqmjDKwBR
 v9h9oEgQi6vu8LYPV6tIJh/WTRmrALL3n9JbZTMI5mPM0EsjqTEFu5QfxfyIlr91P2x5
 GQvaouUZlNzOXHOHblQmGH/KPGVSd93IgFvXoa0IXp7dVI7LGdJDv73GLI+KZY3bnQJ1
 ISvg==
X-Gm-Message-State: APjAAAWRFXOsX4cwE7z9vXdhFJTXgf3HK8JIMIxWPbsXVWBxJFHnyMeg
 kVM6BUaIHnRUDMalm3cXeixcBxISnubEs/BXMvE=
X-Google-Smtp-Source: APXvYqzVpw14IGZ2u3YdnQHIdoUJB7ixt75sJHBIU0hrdPdS26aQbroThWRZ8RSRnyDtEq8fSAAYGBZKnSHF/tWlCCE=
X-Received: by 2002:a6b:8b8b:: with SMTP id
 n133mr38449926iod.183.1564592759912; 
 Wed, 31 Jul 2019 10:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
 <CAOcoXZYw0uC+2c5KAVMhvXRukYomAuhSVW=jWU3HH1sX6zgkaQ@mail.gmail.com>
 <685e081c-b374-7d66-4645-d6ee7a02f655@arm.com>
 <CAOcoXZZ5HWYrDEy966BN-Esaci2XD=H98kn1JNwjAU_DUW_Egg@mail.gmail.com>
 <d5e1b66e-4d94-6ec5-96e4-54fb77c44eaa@arm.com>
 <CAOcoXZbapuZ3FhDP2cZ+C9JEJwCZUp03h-6eTbynqk5RGWF+3g@mail.gmail.com>
 <efbb6de5-3454-ad61-e3e6-07c7bdb0def7@arm.com>
 <CAOcoXZYKXqXa=M2LvcGMDrufh9snhSQvCX_qBFr63sn=fgDo=w@mail.gmail.com>
 <1CE4B542-C03C-4B21-AC92-145F7B9B63BB@gmail.com>
In-Reply-To: <1CE4B542-C03C-4B21-AC92-145F7B9B63BB@gmail.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Wed, 31 Jul 2019 20:05:48 +0300
Message-ID: <CAOcoXZaL3OwVcNsOUkUVw4Wo6ts8YQkuQ60vz+-H573Zwvuy2g@mail.gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Committers <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgNzoyNyBQTSBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhl
bkBnbWFpbC5jb20+IHdyb3RlOgoKPiBWaWt0b3I6IHRoYW5rIHlvdSBmb3Igc3BlbmRpbmcgdGlt
ZSBvbiB0aGlzCj4KPiBJIGFkZGVkIGFuIGl0ZW0gdG8gY29tbXVuaXR5IGNhbGwgdG9tb3Jyb3cg
YW5kIENDJ2VkIHlvdSBpbiB0aGUgaW52aXRlLiBTbyBJIHRoaW5rIHdoYXQgd2UgbmVlZCB0byBk
byBpcyBmaWd1cmUgb3V0IGEgd2F5IG9uIGhvdyB0byBtYWtlIHRoZSBjb2Rpbmcgc3RhbmRhcmQg
ZW5mb3JjZWFibGUgYnkgYSBjb2Rpbmcgc3RhbmRhcmQgY2hlY2tlciBzdWNoIGFzIHByb3Bvc2Vk
IGhlcmUuIEFGQUlDVAo+ICogSXQgc2VlbXMgdGhlcmUgYXJlIHNvbWUgdW5kb2N1bWVudGVkIGNv
ZGluZyBzdGFuZGFyZCBydWxlcywgd2hpY2ggYXJlIGVzc2VudGlhbGx5IGNhdXNpbmcgcHJvYmxl
bXMgd2l0aCB0aGUgdG9vbAo+ICogSW4gYWRkaXRpb24sIHRoZSBmYWN0IHRoYXQgdGhlIExMVk0g
Y29kaW5nIHN0eWxlIGlzIHRoZSBiYXNlbGluZSBmb3IgdGhlIGNoZWNrcyBtYXkgYWxzbyBjcmVh
dGUgc29tZSBwcm9ibGVtcyB3aXRoIGZhbHNlIHN0YW5kYXJkIHZpb2xhdGlvbnMKPgo+IE15IGlu
c3RpbmN0IHdvdWxkIGJlIHRvIHRyeSBhbmQgZG9jdW1lbnQgYW55IHVuZG9jdW1lbnRlZCBydWxl
cyBvbiBhIHNjcmF0Y2ggc3BhY2UgKGUuZy4gZ29vZ2xlIGRvYyksIGxvb2sgYXQgZGlmZmVyZW5j
ZXMgYmV0d2VlbiBYZW4gYW5kIExMVk0gZm9ybWF0dGluZyBzdHlsZSBhbmQgdGhlbiBtYWtlIGRl
Y2lzaW9ucyB1c2luZyBhIHZvdGluZyBtZWNoYW5pc20gdG8gYXZvaWQgYmlrZS1zaGVkZGluZy4g
SW4gc29tZSBjYXNlcyBkaXNjdXNzaW9uIG1heSBiZSBuZWNlc3NhcnkgdGhvdWdoCj4KPiBJdCB3
b3VsZCBiZSBnb29kIGlmIHlvdSBjb3VsZCBhdHRlbmQsIGJ1dCBJIHRoaW5rIHdlIGNhbiBkbyB3
aXRob3V0IHlvdSwgaWYgbmVlZGVkCj4KCkxhcnMsIHRoYW5rIHlvdSBmb3IgdGhlIGludml0YXRp
b24uIEkgd2lsbCB0cnkgdG8gam9pbiB0aGUgY2FsbC4KU2VlbXMgdGhlIHRvcGljIGlzIG5vdCBh
IHNpbXBsZSBvbmUsIHRoZXJlIGFyZSBhIGxvdCBvZiB0aGluZ3MgdG8gZGlzY3VzcyBpdC4KClRo
YW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
