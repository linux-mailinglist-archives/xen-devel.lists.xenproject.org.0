Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB593C54E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 09:41:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1habMI-0007n6-AL; Tue, 11 Jun 2019 07:38:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1habMG-0007n1-Se
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 07:38:16 +0000
X-Inumbo-ID: deec6745-8c1b-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id deec6745-8c1b-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 07:38:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o13so10542574lji.5
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 00:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2GHx9qUNTaf9n1m2NZR5L/xuQl0r098B84BG6tAIXu8=;
 b=N4spEAelIXzvdl/wAg/RV9Lv4rRqi8LnjellzmzmpybL9lpXKbC6TkdlCxCFSy6qzx
 MlVzcNpe7Ds/f3ykBYXKYuVnciCett3oGOLGrZo0guh/QjA03nIeb7CI0zDVQ+NVLSiv
 z4ZvtVVgG4CTxE3kXacaATjet6NuOfCi7ZbetYDNnjLKr2rsvX48EowNFE4eVb1Jnoa5
 5i5J7asVkSD0sYb//oNJFlPxjSclwAwg8gLMzrdSZpFNEICASenEjXRmqf9+8mYiwYMK
 Y/B9jnDbPa6TKxl7Rl9LXZQY7EyMUvcAa2NFUUP6M9zhZefntHqxno4ogn3nublvY2CK
 snjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2GHx9qUNTaf9n1m2NZR5L/xuQl0r098B84BG6tAIXu8=;
 b=Vm/opi3BAbfEYRVRPS08FcURKAYKsdRyJvhPxNBfczs+owrV04zirSs06l1pALKcKX
 wyY3idvgKp9pUeJbkmHIGMGc/s5zuHTQ+laPkSAKot0EudRHBqxz4gbfLbxSBY2icG0C
 EHuFqTAAtZJ54zFiuEt5y+HPsv+Q4IOcVEywmrYIdLesMro6JpUqjZFLs92hCBQSCsFF
 mF0I1TwPSoGBIgMAgGPgT/7HDJnx/6rrNn47e8UZgz6DFdLNIckorCcOL+Ln0f5PC+LI
 Qt0VrAG4fTpBzwKOCbKeSBw1pezPAkJrln3MsEPa/9eU60Te6a+gYOTMEymWKGteQEai
 tR7Q==
X-Gm-Message-State: APjAAAXykTlWesc/7kjxDqmRD9bwEwoW9xfmZo+DyG2ydcx5P7UaU6lc
 jM2x/ZzTUe5c+8DWk81xVUM=
X-Google-Smtp-Source: APXvYqyWpwKOR6Tl6xodVdHeR/wNI+b9gt4qvDC09uf/QJj3A8BBI+vr7YW5U6DkzNGHpjLCGgPJww==
X-Received: by 2002:a2e:8ecb:: with SMTP id e11mr2564598ljl.218.1560238693731; 
 Tue, 11 Jun 2019 00:38:13 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t7sm1886840ljd.5.2019.06.11.00.38.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 00:38:12 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
 <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
 <1388d47c-efd1-b30b-9847-92c343964dfa@gmail.com>
 <89ce5e93-f62a-2856-cb80-11a2ef7ec2be@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <a059a34f-ac33-4680-8d95-6f144ffab76b@gmail.com>
Date: Tue, 11 Jun 2019 10:38:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <89ce5e93-f62a-2856-cb80-11a2ef7ec2be@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC4wNi4xOSAyMjo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgd2FzLiBCdXQgSSBh
bHNvIGhhZCB0aW1lIHRvIHRoaW5rIGFib3V0IHRoZSBjb21taXQgbWVzc2FnZSBhbmQgSSB3b3Vs
ZCBiZSBoYXBweSB0byBjb21taXQgd2l0aCBqdXN0IHdoYXQgaXQgaXMgY3VycmVudGx5IHdyaXR0
ZW4uCj4gCj4gSSBoYXZlIG5vdyBhcHBsaWVkIHRvIG15IHN0YWdpbmcgYnJhbmNoIHdpdGggbXkg
YWNrZWQtYnkuIEkgd2lsbCBjb21taXQgaXQgdG9uaWdodC4KCkdyZWF0LiBUaGFuayB5b3UuCgo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLAoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNv
di4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
