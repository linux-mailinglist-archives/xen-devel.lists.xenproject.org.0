Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2E14513
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:22:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXuU-0000bI-RF; Mon, 06 May 2019 07:19:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNXuT-0000bA-4Q
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 07:19:37 +0000
X-Inumbo-ID: 4cc30e8f-6fcf-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4cc30e8f-6fcf-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 07:19:35 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 132so2404056ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xdNFs35FFayFtc8YIExBKNAtKpot+Pnre9J3ZPbt/gg=;
 b=lDJu3Na1OOrWWtSzT1tdZC+n/i8oA10vx4G4ORDNZGn6m3A9oGaIu1yKqs3fVROmiT
 5gy1qbeaxIdQIyQhayREc9dkPEoturAnMllk5AyuR45hBhJ0QXZXb+A8KvbM2dvVwU4X
 4XpEV9WsgV/JXxSMzNVlYOxLQBOH+B7Of80n5V2YRrEkiy/H6uJp7JCfla1QhouGiW7g
 +6vXb3N+jI/cYkBkvokZkVqt4OIFcZS90gQB4y0396qRU3QLUrBn7N460+HDrhMOzQ8j
 1OF5EWdJdKCaIVrtk5Zm7zTHf3VKguBB3v9t529z5UmyJxbZ6DPgsSrcEB3CnfBAn5bi
 CNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xdNFs35FFayFtc8YIExBKNAtKpot+Pnre9J3ZPbt/gg=;
 b=Mp19Lg58sfBzuAvUPiCopuy6sTYXL/ofploG5CrvlXPUKlwF/3PwCtpOnN/hWR4pcB
 t4hZnJTh9NGeVA+nft8OTjt+GBB2g4aC/8JfFW/mYMxoR+b1/FhuZXH8mzZ7bM5Ihg2e
 CyprhHWP3dN92Th2stDYJNBo9d3mv8mHRae81BQg+AGdhdYjPEi8ljelt03JF+FWjhDx
 ncFZWsMgX3nHK43ukGQM4XsllVB1C9dCcJ/svBTsH9XP32j6XkKB0ohlEDXn9WkSkija
 uflYPuyCO+IEl7ZDCDHtZg9jGO2JE2q9/wVO5+kVtaEAS4hRkGadfzPXqUUVWVYKlyWu
 VqOQ==
X-Gm-Message-State: APjAAAV46VsEgBwMXYVxIuK3a5Qgm/7pbBYtAIAIIfM1A3HgEBvBf3lh
 r+7GwhLjhUL4T7Q6Ea8luew=
X-Google-Smtp-Source: APXvYqzI7EpwN3pPpkiOqoEHaE8LXnxOeWk1eNbKMjuPrBb4+/69c2yGeEny319LHY7WzkC4GgTSFQ==
X-Received: by 2002:a2e:9d4c:: with SMTP id y12mr12457623ljj.132.1557127174221; 
 Mon, 06 May 2019 00:19:34 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d22sm2112072lfc.80.2019.05.06.00.19.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 00:19:33 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
 <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
 <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f5b93de0-08e6-cafd-dda7-2ba60c004804@gmail.com>
Date: Mon, 6 May 2019 10:19:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
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

CgpPbiAwMy4wNS4xOSAyMDowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgd2lsbCByZXdvcmQg
dG8gIlRoYW5rZnVsbHkgWGVuIHByb3ZpZGVzIGFuIGhhbmR5IG1hY3JvIHRoYXQgd2lsbCBtYWtl
IHRoZSBjb2RlIG1vcmUgcmVhZGFibGUiLgoKR29vZC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
