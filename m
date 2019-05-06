Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A814A2F
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd2d-0007MB-Tl; Mon, 06 May 2019 12:48:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2c-0007Lh-D3
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:22 +0000
X-Inumbo-ID: 39725d4a-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39725d4a-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:48:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j11so9055234lfm.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxyYSCB8u4cZ8KKSNwwa3AXfbNBjP6/79nszvxdGkRs=;
 b=NG3wSZcafy38zw5tLDg9xYWFjCFlOJnejsJuWIK1yaKp8ZNDo7Az89rtcVMYsAG4Vv
 Y1TVhHbdzV+X/HSg7E2TAn6QAZn60prgD1xn7U5dMAxMOQx/iDoMW98ZrXgoZuqNiTRi
 ByXWcyLdtTA48wQ4a3j6H0AeHaEiQdmc6SDr3C+b9sKvQkTYXkqpXDZ4XQ7i6G8YQI+a
 WBq4fZb5SgWWUGbohhyjFAc1eYSX4miltc5+V1lsxJiE/H1AdhUZX+mKnNBMLwWfX2CZ
 e1Tmyb6V8tj0aCCLPPoEQBsdHYw1AumS1JJ+a+8k59972am4ZgMk2KtXVeQ00GLrCgaq
 aBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxyYSCB8u4cZ8KKSNwwa3AXfbNBjP6/79nszvxdGkRs=;
 b=tk5G7Na1evHXDl73BuFT9CLZJhMFoqvh01F/2cO87y/O4Z0qImoPKvFDy9VDcTZOqE
 WGAlv+x7R0SNHgnS1XFPl3X+Pb13ucnO9JES/HbjmgtJdI8i2b7TDm53cypW6TxjDNrd
 /6NeE7t4hJFt56acuCGknw75OdA+cOVUmd8YvCD5UhpTAHPy16nwFv+LgwxL7tJu+326
 RmYABhLYpp9sspzOXfWgHHi4YqqeaqcU4V26BuDuB0AqxLs0O72jaPg51Wnrj1lbG1We
 i0bkLIjcFJUtX0rjrGTww6t6k7wIru4LEyql2c18Yt50eLjQPidU9FaBJ9x3xnmxrftK
 91xg==
X-Gm-Message-State: APjAAAVnuLWGIICkz/QWGNcc86ktU+CVqeXH4BJ5Nwue5qTfG7yLnMQ1
 c66bC1njtq9MVbSqklscTLQ=
X-Google-Smtp-Source: APXvYqxWHw0E7hPz63Wnd0mSYoynGSD0NolW3lY6KlaJ51L2xoxqDpmuAvrKfXNt98zs0z31Jhs+dQ==
X-Received: by 2002:a19:ae0b:: with SMTP id f11mr11673860lfc.106.1557146898805; 
 Mon, 06 May 2019 05:48:18 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 e5sm2316448lja.64.2019.05.06.05.48.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-5-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e7bd0a3b-d030-8a2f-2fd6-a7eab540d2bf@gmail.com>
Date: Mon, 6 May 2019 15:48:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-5-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/12] xen/arm: mm: Introduce _PAGE_PRESENT
 and _PAGE_POPULATE
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBmbGFncyBhcmUgbm90IGVub3VnaCB0byBkZXNjcmliZSB3aGF0IGtpbmQgb2YgdXBkYXRl
Cj4gd2lsbCBkb25lIG9uIHRoZSBWQSByYW5nZS4gVGhleSBuZWVkIHRvIGJlIHVzZWQgaW4gY29u
anVuY3Rpb24gd2l0aCB0aGUKPiBlbnVtIHhlbm1hcF9vcGVyYXRpb24uCj4gCj4gSXQgd291bGQg
YmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBmb3IgdGhlIHVw
ZGF0ZQo+IGluIGEgc2luZ2xlIHBsYWNlLgo+IAo+IFR3byBuZXcgZmxhZ3MgYXJlIGFkZGVkIHRv
IHJlbW92ZSB0aGUgcmVsaWVuY2Ugb24geGVubWFwX29wZXJhdGlvbjoKPiAgICAgIC0gX1BBR0Vf
UFJFU0VOVDogSW5kaWNhdGUgd2hldGhlciB3ZSBhcmUgYWRkaW5nL3JlbW92aW5nIHRoZSBtYXBw
aW5nCj4gICAgICAtIF9QQUdFX1BPUFVMQVRFOiBJbmRpY2F0ZSB3aGV0aGVyIHdlIG9ubHkgcG9w
dWxhdGUgcGFnZS10YWJsZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
