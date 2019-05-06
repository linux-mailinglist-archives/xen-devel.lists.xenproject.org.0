Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBF1465B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 10:30:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYys-0008D6-Af; Mon, 06 May 2019 08:28:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNYyq-0008Cn-1f
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:28:12 +0000
X-Inumbo-ID: e1a2c86a-6fd8-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1a2c86a-6fd8-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 08:28:11 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 132so2566177ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qjof3TQOaHtBFaIZBEqWNGo46TU1+s+Dj/dr+miikVQ=;
 b=BHD0F5oufG11oragsc3Ufuzgq7cMdkijZ0c79RrQHwB+AbF6/N92mRLCtIrfjzQ7Gi
 HoP8CqsCHtPvwqAI4OaAhLku9dBmZqY+TZWQTF3Oa5w78+UdHlf8fheQVxRhGi32dY43
 ZS2GY0uENQZhyihJNLd966GrfjH6gij5iUMkjC+pKCEMeFt/e4eziHYRUg7ooZw6VAkz
 rTJiwdz5QQDxmcbInn9L5s3UDeNpAN46x+Nh87Us0utBRwij2sr96IfGNgIFNdQTQVeF
 v6tYC15kQX779FilzI08YT7YhehBSX9kNq/+7lw5bPcwjeL6jVPaTlvNsOvD5h1L0/65
 J/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qjof3TQOaHtBFaIZBEqWNGo46TU1+s+Dj/dr+miikVQ=;
 b=YoXq0GUd9dGRULyUtj3M4hLuicU2rL0XeRKDEAPKcgr1fJjGpC2zu8QxGp6y/Gmmtz
 3KhFOrJ+vDAFw1PLwS+3GLqmWAge774wk6XJKKdoLvMVrXeW8kynu1c7Doc9f6WT30fF
 ZRAMwNBkvj5UcnvjFNqHZ4T2ivhA/N2BtcYduErsOe9nA1uOkPmkFZWJKlowNr6wpXfN
 LV41Veuw2O2vIRtBmNTZ68JMvYxKEMwyYejXYIjQ19tOeNjzrthMXTEDcGBVPcxssrbA
 pdXy58SynSpSXCxofjgE9agMV/yZfRm7WTn8FryAmuXpxUbTsE/Fnsz8gOpvXttdvsUz
 Hbzw==
X-Gm-Message-State: APjAAAX7OY59yzirSljILoaLktH+69+2uVs4VfLhcSBuuqmJN1UXrY5m
 ifcM1wsO2C3z66Ck8JLkk+M=
X-Google-Smtp-Source: APXvYqyo8dxIE2HeSWy8/PnOYkpMhAYTMfRTvddcSOjNRdBm+TG7GvHm//WVZz7f+JQeueepNKIEpA==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr11459687ljg.178.1557131289500; 
 Mon, 06 May 2019 01:28:09 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p18sm2405463ljc.54.2019.05.06.01.28.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 01:28:08 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-14-julien.grall@arm.com>
 <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
 <291f238e-16e8-a5d7-c0a5-5532fde69585@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <8a9dd31b-0063-41fe-7030-79d2d1626ba7@gmail.com>
Date: Mon, 6 May 2019 11:28:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <291f238e-16e8-a5d7-c0a5-5532fde69585@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/20] xen/arm32: mm: Avoid to zero and
 clean cache for CPU0 domheap
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

Ck9uIDAzLjA1LjE5IDIwOjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSW4gQywgdW5pbml0aWFs
aXplZCBnbG9iYWwgdmFyaWFibGUgd2lsbCBiZSB6ZXJvIGJ5IGRlZmF1bHQuIEl0IGlzIGEgYml0
IG9mIHdhc3RlIHRvIGFsbG9jYXRlIHNwYWNlIGluIHRoZSBiaW5hcnkgZm9yIHRoZW0uIFNvIHRo
ZSBjb21waWxlciB3aWxsIGNvbW1vbmx5IHB1dCB0aGVtIGluIGEgc2VjdGlvbiBCU1MgdGhhdCBh
cmUgZ29pbmcgdG8gYmUgemVyb2VkIHdoZW4gYXQgbGF1bmNoLgo+IAo+IE9uIEFybTMyLCB0aGlz
IGlzIGFsd2F5cyBkb25lIGluIENQVTAgYXQgZWFybHkgYm9vdC4gRm9yIEFybTY0LCBVRUZJIHdp
bGwgZG8gaXQgZm9yIHVzLCBzbyB3ZSBkb24ndCB3YW50IHRvIGRvIGl0IHdoZW4gdXNpbmcgVUVG
SSBhcyB3ZSBtYXkgb3ZlcnJpZGUgZ2xvYmFsCj4gCj4gVGhlIHJlYXNvbiBJIGNob3NlIHRvIHNh
eSAid2lsbCBhbHdheXMgYmUgemVyb2VkIGJlZm9yZWhhbmQiIHRoYW4gc3BlY2lmaWNhbGx5IG1l
bnRpb24gIkJTUyIgaXMgSSB3YXNuJ3QgZW50aXJlbHkgY29udmluY2VkIHRoZSBjb21waWxlciB3
aWxsIGFsd2F5cyBwdXQgaW4gQlNTLgoKT0suCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
