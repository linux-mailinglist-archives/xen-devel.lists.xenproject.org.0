Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB44131AD
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:00:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYe-0006ri-JF; Fri, 03 May 2019 15:57:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYc-0006r9-9B
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:06 +0000
X-Inumbo-ID: 183c61e5-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 183c61e5-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s7so225346ljh.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RXU7wdl4+CLHHrGvsf2BR1gyq1GCZ8B1ellkZaVdOvU=;
 b=DlMOUaihuQ0RP49O8/T3SqROmr0JasPTTc3FaJ3m4L9clIZRez+H8SZAOsAxQhrDKj
 TDQsuDaN2mjbO9loHjNA5r7e+XgWhKI/+xTuXiPkt0/plVZaCar36o3E/jkdUAatNgU3
 W4QUJlCBNNjGT2BbfutkZovjYXpdfG4lqIIa/ZcsAi3flj/L09G2lofe7mlPabYROREd
 FVCObNrwzH12SICaWKgc18RCgHhkKcQIweIHdhMNhWJu4TAeEHRIOn7D7mZNV4WyVVKs
 260FoEDVyS2nwpSEHfZCqJV43ZsWBOUqNoXmb5wIsFbOsbulUQiIhcT2WTSVbEtxlzfI
 XBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXU7wdl4+CLHHrGvsf2BR1gyq1GCZ8B1ellkZaVdOvU=;
 b=smRMLHknMilnL4RGxbaoTPXzt0IblvLORuYE7GEUClYd0Brj7fIySGf82SOb/2BNMa
 5xh9ufU5i9+tYsIgqmkkmgFEszZlBwMNrtsHUc6n0FQYxpJ4cl8kgsJBALATYwUA/eB6
 G7ddG0Hv03X4qCbFOccltKIw7U/LF300wVBVF2+lduOasgOTfESVGMTnN66zXfmZ+8kP
 KRwTLmdBa5pbgRfTYFrsi4NBsCpCwpoCXjjLfbODndZZ33LXIDNKS39WBZhwQb1q8h3s
 6WF7RIU40d9C1+Ua+x5OCl1FrCjPGE0AkF06mWiySLzsy2RrtWR3l3+SlqvyoEem9vr6
 12aw==
X-Gm-Message-State: APjAAAVHEqt8H/DrT7cMKi0bAnrf1z3uWXjkPREoUPlpTvQEvkl/kJwX
 GYEATigLOR32O1t/AEubbk0=
X-Google-Smtp-Source: APXvYqyye7yW7wP7gog84glaqzKW+Uyg4CWNSxno1Ae0fCondGIPXoMBDHm1OVQSjt3agJ4AWSmJiw==
X-Received: by 2002:a2e:94ca:: with SMTP id r10mr5426394ljh.33.1556899023478; 
 Fri, 03 May 2019 08:57:03 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 e10sm464638ljf.5.2019.05.03.08.57.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:02 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-8-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d2a2ed2b-3c5e-0e02-30a6-c8dcfa8682e6@gmail.com>
Date: Fri, 3 May 2019 18:57:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-8-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/20] xen/arm64: head: Remove unnecessary
 comment
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBT
byBmYXIsIHdlIGRvbid0IGluaXQgc3BlY2lmaWMgY29yZSBpbml0aWFsaXphdGlvbiBhdCBib290
LiBTbyByZW1vdmUKPiB0aGUgY29tbWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFu
ZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
