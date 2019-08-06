Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5FE83ACB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:08:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv6f3-0006FI-BK; Tue, 06 Aug 2019 21:06:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nn9y=WC=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hv6f2-0006FD-Ba
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:06:24 +0000
X-Inumbo-ID: 0b006f3f-b88e-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0b006f3f-b88e-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 21:06:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p17so83448459ljg.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2019 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=svv/87DVkw9FxcrI5L4SwMi+kB0NjQ+Ki6inL6Kh9ic=;
 b=fushbGu2qALa2VlYUJDp7NRb92do9Za//jnO1DHLp0u2VnEuSKoQG+IxqeLWmhDDDu
 gxVzkMFyHNsWzDDzdB5JlWjSdCnxY8V5bA4ygBpJCDilrsFSfj6fe2sP88SXUD7wllws
 RZD5Ldph6Ev50XL971xuKxRteIKmHYxMc5bnNVkt00NfVG2MusulROmSPf4zE25qcMY0
 WzSavuADsL6UkjYN7Zt3dx7KPnI/H9fhhHXi252d7aStjG0LNk3cC0d9j1sRn0YYtNUg
 29YZwhZpwI2IGT47czlSYD3A5fIHZpaMVSCiJBXu/uO8tfNwg3BkccOa14TDUpkD4BXO
 g5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=svv/87DVkw9FxcrI5L4SwMi+kB0NjQ+Ki6inL6Kh9ic=;
 b=oIFY7FSIBaehWztg/rBhoDQ7MPQDUC3d5mnYUd+0vMQBtCtjE98+6CFfRT66HI0LzU
 AMHY8Js3sai2cj9nwiqFnpPR1LV4skR5ecKeChUrd1l7MfjOM7svY0c82N3dBJHXxuXc
 wJETkN5qpQ3W7RJFlDQNEZz1l4WRPtY9t33xZzC2myeUfkyC4sc5EYF4xjwehWcYianI
 wqW5QxhFsuK1Ah0lyCmlEjfq5fTT0hy6mXtPfqaEL7bp9ymLrQAbEzUklwE3IiDfLdtb
 UTAbtucOzDj/1KbpW2j6+ZJxPBH4tH5VaouHwBrE6VCrka0BnD0NwfR8p06oGgxFXktA
 o5/w==
X-Gm-Message-State: APjAAAU/6DIAz+LcxiMT0xMnT8Bn+r+IlfLZLiUtzDci6ngeimwrUqzI
 nGQOHE6dUH4HISmjP3vq5YSEQX7QimVk9phUqc8=
X-Google-Smtp-Source: APXvYqwN5X7HvH7VrGDylbp63IF2Bxz/Lo/VCjXKkDWvrG1qag1MJywSIIlbravr6jWzra7O7HoxRZwCZV9/SYWncII=
X-Received: by 2002:a2e:8999:: with SMTP id c25mr2828620lji.169.1565125581458; 
 Tue, 06 Aug 2019 14:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
 <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
 <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
 <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
 <6b286e50-411f-229f-e6b8-0ebd7e930f22@dornerworks.com>
In-Reply-To: <6b286e50-411f-229f-e6b8-0ebd7e930f22@dornerworks.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Wed, 7 Aug 2019 02:35:45 +0530
Message-ID: <CABHD4K-DQqcKpsDbpUR7AvOy4n0=Fejz2D+Au5ZQ-2CY=7+76A@mail.gmail.com>
To: NathanStuder <nathan.studer@dornerworks.com>
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: peng.fan@nxp.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTmF0ZSAsIEhpIEp1bGllbiwKCj4KPiBBbWl0LAo+Cj4gICAgICAgICBIYXZlIHlvdSBjaGVj
a2VkIG91dCB0aGUgTlhQIFhlbiBmb3JrPwo+Cj4gICAgICAgICBodHRwczovL3NvdXJjZS5jb2Rl
YXVyb3JhLm9yZy9leHRlcm5hbC9pbXgvaW14LXhlbi8KPgo+ICAgICAgICAgV2hpbGUgdGhlIHdv
cmsgdGhlcmUgaGFzbid0IGJlZW4gdXBzdHJlYW1lZCB5ZXQsIHRoZSBzdXBwb3J0IGZvciB0aGUg
aU1YOFFNCj4gKFF1YWRNYXgpIGlzIGZhaXJseSBjb21wbGV0ZS4gIFRoZXJlIGFyZSBzb21lIGlt
cG9ydGFudCBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZQo+IGlNWDhNIGFuZCB0aGF0IFNvQyBiZXlv
bmQgdGhvc2UgeW91J3ZlIG5vdGVkIChubyBBNzIgY2x1c3Rlciwgbm8gU01NVSwgYW5kIG5vCj4g
U3lzdGVtIENvbnRyb2wgVW5pdCAoU0NVKSksIGJ1dCBpdCBtaWdodCBzb2x2ZSBzb21lIG9mIHRo
ZSBpc3N1ZXMgeW91J3ZlIGJlZW4KPiBydW5uaW5nIGludG8gb3IgYXZvaWQgeWV0IHVua25vd24g
aXNzdWVzIHdoZW4geW91IGF0dGVtcHQgdG8gYm9vdCBhIGd1ZXN0IGRvbWFpbi4KCkkgbG9va2Vk
IGFyb3VuZCB0aGUgd29yayBkb25lIGZvciBpTVg4UU0gYnV0IHRoZSBVQVJUIElQIHVzZWQgb24K
aS5NWDhNUSBpcyBjb21wbGV0ZWx5IGRpZmZlcmVudCB0aGFuCnRoYXQgdXNlZCBvbiBpLk1YUU0u
CgpUaGUgaW5pdGlhbCBhZ2VuZGEgb2YgdGhpcyBzZXJpZXMgaXMgdG8gZ2V0IHBhcnRpY3VsYXIg
dWFydApkcml2ZXIodXNlZCBvbiBpLklNWDhNUSkgaW4gZmlyc3QgYW5kIHRoZW4Kc3RhcnQgYm9v
dGluZyBkb21Vcy4KClRoYW5rcywKLUFtaXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
