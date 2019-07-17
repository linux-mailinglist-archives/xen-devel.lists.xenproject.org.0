Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4AF6BFB1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 18:36:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnmr9-0004OV-Ai; Wed, 17 Jul 2019 16:32:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNpr=VO=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hnmr7-0004OQ-W2
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:32:38 +0000
X-Inumbo-ID: 7c2a4c44-a8b0-11e9-8980-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c2a4c44-a8b0-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 16:32:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x15so22820175wmj.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2019 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aOZbREGu53jWVjAZz1uZQXw9UekJDLzDVjGuxrXBs7I=;
 b=uARaONgmGtnZqLh0Fgfgw+K1+e7MoX8M8vaQNOIEaYQeqFwZwVZfMqQHB+afiyOh08
 o2D1YjqZUnmQiZtpSkqkbO72KqpgHt4sH0rl8y5/+0gLjMDnpv9oT6ZBLafXWCSOJ2J6
 2wOmtgPCOYzG+HGZIrk72eFSoNTXWcck1uyjlqaMQMi0VXzxPZKjOdftEGztX4dji565
 TGKLtKs5HnPkTIaKrJY0vMTf7yGGm+jOsOIuW6cQAkNvyw0gdmwiGAGx6cl9PGKLGqhW
 XfbNf5jc5718fcHn2C8Ru7VcVMU2qc7OuG934PzjE/BU+6IbGCDyRROZtrj5h1uQ0/Ad
 QlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aOZbREGu53jWVjAZz1uZQXw9UekJDLzDVjGuxrXBs7I=;
 b=uVTf2+C2+KxYJm3s50sk7V1eLJfB2lseYkzIW+JNa8VefSm2WLHyWtf85F0g3byOXa
 3tcQcffs6W8DjlRMzTzUxwaY+HmCDZtyWSkT0QVGPtrJlhJpkSUFlrCpt0/KucgZuujX
 J8zDSu3MLBYmh3ovX0NEt8qir7ilNh3u/L27kYkcWoXBoXA5DJyh7Lo9IKNbjjIzA+03
 3uFMtpjsvoH9RJtHivKcpsIUKvRlmVV7mBz5h+6ay64dVxGByTFBG+ZLh8PuB72FXvQl
 DufNX4hZKV669gedolMLmAaqfceGES1BjU26jSf+w3RGpxutbANXJYDED64OpMX9pbAr
 8OBA==
X-Gm-Message-State: APjAAAXJUe4ON8dwn960jty4313st5aQ71jwdhTE5tOlvbyxNafBP2FO
 z4hRa3lSBAc20GaZhjUiPUU=
X-Google-Smtp-Source: APXvYqxfeunrc5PIERNSYym0KNaLAvgiQcWa8Nz6RKddtWrBlszr8n/ApObw9XcxODY/v029huQCUQ==
X-Received: by 2002:a1c:5f87:: with SMTP id
 t129mr39534368wmb.150.1563381155819; 
 Wed, 17 Jul 2019 09:32:35 -0700 (PDT)
Received: from ?IPv6:2001:16b8:665f:2100:1e4b:d6ff:fef9:46e6?
 (200116b8665f21001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:665f:2100:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id t185sm18138962wma.11.2019.07.17.09.32.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 09:32:34 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
 <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d304061e-f34e-d0e6-04a4-1a8bfc7414fa@gmail.com>
Date: Wed, 17 Jul 2019 18:32:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores
 into hyp mode
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
Cc: hy-gsoc@hy-research.com, andre.przywara@arm.com, sstabellini@kernel.org,
 tim@xen.org, drhunter95@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKPiAKPiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIGhvdyB0aGlzIGV2ZXIg
d29ya2VkLiBvbWFwNV9zbXBfaW5pdCBpcyBjYWxsZWQKPiBieSB0d28gc2V0cyBvZiBwbGF0Zm9y
bXMgKGJhc2VkIG9uIGNvbXBhdGlibGUpOgo+IMKgwqAgLSB0aSxkcmE3OiB0aGVyZSB3ZXJlIHNv
bWUgaGFja3MgaW4gVS1ib290IHRvIGF2b2lkIHRoZSBTTUMuIElmIEkgYW0KPiByaWdodCwgdGhl
biBJIHdvdWxkIG5vdCBib3RoZXIgdG8gc3VwcG9ydCBoYWNrZWQgVS1ib290Lgo+IMKgwqAgLSB0
aSxvbWFwNTogWzFdIHN1Z2dlc3QgdGhhdCBVLWJvb3QgZG8gdGhlIHN3aXRjaCBmb3IgdXMgYnV0
IGl0IGlzCj4gbm90IGNsZWFyIHdoZXRoZXIgdGhpcyBpcyB1cHN0cmVhbWVkLiBAQ2hlbiwgSSBr
bm93IHlvdSBkaWQgdGhlIHBvcnQgYQo+IGxvbmcgdGltZSBhZ28uIERvIHlvdSByZWNhbGwgaG93
IHRoaXMgd29ya2VkPwo+IAo+IExpbnV4IHNlZW1zIHRvIHVzZSB0aGUgc21jIG9uIGFueSBkcmE3
IGFuZCBvbWFwNTR4eC4gU28gbWF5YmUgd2UgY2FuIHVzZQo+IHNhZmVseSBoZXJlLgo+IEkgZG9u
J3QgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zIHRvIHRoZSBmdWxsIGV4dGVudC4gV2hhdCBzaG91
bGQgYmUKaW52ZXN0aWdhdGVkPwoKLS0gClJlZ2FyZHMsIERlbmlzIE9icmV6a292CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
