Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8914A38
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd3X-0007qb-TG; Mon, 06 May 2019 12:49:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3W-0007q3-UH
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:18 +0000
X-Inumbo-ID: 5be0ba7f-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5be0ba7f-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:49:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y19so1471890lfy.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nedW5dhZpJv0ZRkEAn/cs42bVR9gy63zX8hcSZyBIpw=;
 b=RLe5Alx6NP22FqcHPO+qetAkxeDuCU3CowWE5uvzlbw5cYRVIPJZC82uiYpz/FoyMN
 iBWk64w9mm8EPgql9X7d/rp0sBgq7+ZnCHFgKzlmLBhkzBds9E+zQq7+S6aKGVNQVf5C
 khEf2Qu1q9RRlB1LjgESc1WNweXHOb1HTmP0qKfnNshsMEbT2aN09wcHRszmCueRSfGu
 qQN1hDhbZ/12R2phZaq4eXj7vW0IOyTaldN0ZDeojXjhemZGvFAhe8jFZhvlSQj43JxZ
 FHqS/Gkv98TXCDCoZ61+t7fazDQSGl5a9Mgi5JjkOJOdxMxSLaUXx8WGx3HtZvJOoAfE
 oGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nedW5dhZpJv0ZRkEAn/cs42bVR9gy63zX8hcSZyBIpw=;
 b=jddfS0vaUBwz3h1hOPwXj1aqC33hHMSHifx7bfRAqdDp68t3Rj37k30smKwieQn8b2
 XcV0uWB81a9rHujV2Avx8UbiM0SM63ZMd23DhGpPoORL2vKfKOgS4w2wpxE3GHli0cRw
 1QIRZfsVHOLgQa0TQt5XNlsBGFZwWZwONh4C2xKAdJYy5seVdZ5+6zgALnwgQjo8EDiw
 r5tVDILUG4uQNtUmd1LW0zeW7MQhU8W82WGT03VYuI4Yth6o0gduootbKwdycWlv9CfE
 aSrX3oKHlERcRWFgBkCem1decs/pA+46loLQGfUwBQ9buAAYE5I9fOYW/Q1vG5xi8LZI
 oLmQ==
X-Gm-Message-State: APjAAAVS9ThZQwNtEccVEHu+1FGhAZKEfUofJrBEM7zxfv3OUcaYxN6j
 rj2TT2fGe+jLdn/8+MGouxm6q5I3AmA=
X-Google-Smtp-Source: APXvYqz+FSoewd9mAOYEFkB/rsEZTrISQ3jSUqBqADs+CbnQKCWEoMNy9qkXHL9Tezm8aI8GhW/EXQ==
X-Received: by 2002:ac2:42d5:: with SMTP id n21mr8641822lfl.162.1557146956553; 
 Mon, 06 May 2019 05:49:16 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d4sm1100976lfg.79.2019.05.06.05.49.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:49:15 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-13-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4f8eeed7-c5c5-52ed-e365-b09ab6153647@gmail.com>
Date: Mon, 6 May 2019 15:49:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-13-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 12/12] xen/arm: mm: Remove
 set_pte_flags_on_range()
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHNldF9wdGVfZmxhZ3Nf
b25fcmFuZ2UoKSBpcyB5ZXQgYW5vdGhlciBmdW5jdGlvbiB0aGF0IHdpbGwgb3Blbi1jb2RlCj4g
dXBkYXRlIHRvIGEgc3BlY2lmaWMgcmFuZ2UgaW4gdGhlIFhlbiBwYWdlLXRhYmxlcy4gSXQgY2Fu
IGJlIGNvbXBsZXRlbHkKPiBkcm9wcGVkIGJ5IHVzaW5nIGVpdGhlciBtb2RpZnlfeGVuX21hcHBp
bmdzKCkgb3IgZGVzdHJveV94ZW5fbWFwcGluZ3MoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFuZHJp
aSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkg
QW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
