Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C983131EF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:15:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMank-0002NS-TZ; Fri, 03 May 2019 16:12:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hManj-0002NM-EX
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:12:43 +0000
X-Inumbo-ID: 46e2d33c-6dbe-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46e2d33c-6dbe-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 16:12:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q10so5694479ljc.6
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6U4h9DiAYmpfZPEpcd88IoE6OE9TJrMQliwouZSES78=;
 b=OZ5ghqCyl225ldlsqK2E9KdUdq4Z944n2lNdEHfuYSV50Pvgs+qKsP65hHHCziv23b
 mUyFW9oKka7nLu87MP7r7sTDK1axMakZlLSyQPIWg3P0qirZKB4FvXyB59pxu752G0mj
 tSuhfSIphBIrWzUj9pguALRvJKWQSo8Bns0/Cx2cTFE1PqdRUAm99KDqDvN7qFbh3m7b
 o0tamxOKhXcApQHBDEi2u4EX2qU2WIC0P7mRx9KNEoxEjXKKWxsIHZgkUYztfj4ALXfb
 Ua+01hkJlcV/U84DWdNU5f3ku/LJ9l2HQnPc5lsTLHhU8VLAXn2fUpR3kNfuKXNjFxlt
 RiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6U4h9DiAYmpfZPEpcd88IoE6OE9TJrMQliwouZSES78=;
 b=iGxp31Slvo+Qks8zQ+khcWyl/Pd523oZqkOX3ivoPUrMxEFJueZSiZKTBgBX7gYnUm
 A3xMKI87HSYBeFNAe9CjjeaWBtWyYY7+PDL/BFug3T6CiR6LYiF8CjOhtaOfjUFm6lHn
 J6w1K0IuO16EVWrm4FZihe8V4T2EgriXMAYDAISVjim6Qpe0N277bFDkZL3Q9FnNyfgd
 fOu5rM57U258/FqnqYryCuuzF7Sn4m6wpikL6FjgXHJk/ab6LLz+3Gcf/DjJB02/MeZm
 j4Eq44TnSur6pDjneCCDlh6o98ePKlttmuSE2ENoOdO9gqqFdqZXQoZWRH4xuaUr1qe8
 c4bQ==
X-Gm-Message-State: APjAAAU8f1YHu6Aa/bgnrF8gQMGthpt5vl20izt/95dw//OA82l3FZub
 yWWmuczMmuzFMmuiGSP/Mec=
X-Google-Smtp-Source: APXvYqzqpfsgHTGnLdaBjCkBDU1awLHti38DXZJ/zoejgzRuZdKOEewCEfdQnWYQEI/dsn3G+iG3eQ==
X-Received: by 2002:a2e:8496:: with SMTP id b22mr5497975ljh.9.1556899960684;
 Fri, 03 May 2019 09:12:40 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d25sm464034lja.91.2019.05.03.09.12.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 09:12:39 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-4-julien.grall@arm.com>
 <450df8f5-676d-9b1d-814a-1888342bdacf@gmail.com>
 <a37467fd-d9b0-f8e4-e211-6e6160df645d@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <bdd2418a-1009-54f9-8a76-91012b8180aa@gmail.com>
Date: Fri, 3 May 2019 19:12:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a37467fd-d9b0-f8e4-e211-6e6160df645d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/20] xen/arm: processor: Use _BITUL
 instead of _AC(1, U) in SCTLR_ defines
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

CgpPbiAwMy4wNS4xOSAxOTowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aGF0IGlzIHlvdXIgInNlY29uZCIuIERvZXMgaXQgbWVhbiB5b3UgYXJlIGhhcHB5IHdp
dGggdGhlIGlkZWEgb2YgdGhlIHBhdGNoIGJ1dCB3ZSBzaG91bGQgYWdyZWUgb24gdGhlIG5hbWlu
ZyBmaXJzdD8KClllcywgcmlnaHQgeW91IGFyZS4KU29ycnkgZm9yIHRoZSBtZXNzLgoKLS0gClNp
bmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
