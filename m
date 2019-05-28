Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8492C366
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 11:40:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVYX6-0007jT-Au; Tue, 28 May 2019 09:36:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M056=T4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hVYX4-0007jN-Ee
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 09:36:34 +0000
X-Inumbo-ID: 13e0cd11-812c-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 13e0cd11-812c-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 09:36:33 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b11so7612635lfa.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SL1Hwgs/hIq1JZBmj6BII8Zjb/gEwvGORC23YkTdXic=;
 b=EbJA10lrRhsjQ1vDr2B83VN0E53kVaPoD9YcwKyh/vGwgbrR+VrxdvIieN9zOwH68p
 nIiutmFVSKVk3DVoykCT8ulmrP62xLlYpC9HhZDEqzXgGHApPTD78GoBK86/SV4kG1mJ
 R91Qb53FnC01zphJd0j32BUo2KYXF7flWvjZCD0tB/ava1zcIs+K4Y6DLx2p5K7PWp7w
 povKBgBQdFQa9f2ou1g72+WTeSC7mi6DTL5y+Nym3BUOWGFZxg7jlmB00hijHrzVIvK3
 YB0RZ6ApOaG3dy9PHKv4taYGYaV1Qz1sTEcYBCvfR7CjZnR6YHt6nBW6nLw1XbXt8mCC
 eZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SL1Hwgs/hIq1JZBmj6BII8Zjb/gEwvGORC23YkTdXic=;
 b=t2LHTKQKgCB1mZjVt4sqLEG4vTMIsVSdH8GR4Utgi2K7/UOguz7TRqqFQxt62k2YMj
 dLa/8K3q/On6U18oW3NB3eQ7I5Ju10BytrLOCi2m8rnRVFMI4jVZajIumU5NeJj0sqmp
 x0xYw37h8lmNF8TqU29Kb7TzvBuiA1MxWK8dSyJOQIbYlqYUhBTkxX2tuJbpSD8k7mc6
 E3+IRKmAzIC+gnRgLmdpnq/wNFDmWqDdM/xWrnBt8HitD9gY9xAvuAWJEjePTvJAx5mw
 Yuz9WwuXausTJjoJTuxcrOCIikDHzrO0M+9KixNkYkq9fNkczMp0ySyyV89jGL/8d7Rc
 xRDQ==
X-Gm-Message-State: APjAAAVSeuIOSP1ZEJLlQDD9cS7PV7p+/xtmyiphwv4Ag76oO9zCbosK
 ZEEXPauuVINx7bkeER2H5tTqPpOMTpI=
X-Google-Smtp-Source: APXvYqwuZl4gZ228Sb12lF3w2Fc8uJXmNUdlu+tQsk5PYB9yJH/7GVe9wN+71fjloIApgx/TZl1u5A==
X-Received: by 2002:a05:6512:64:: with SMTP id
 i4mr16263078lfo.32.1559036191438; 
 Tue, 28 May 2019 02:36:31 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 z6sm2787484ljh.61.2019.05.28.02.36.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:36:30 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
 <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
 <bb5aa1e6-f927-5f96-dbd7-1582da1733f3@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <eec4ac53-eb73-c919-d54c-2b926816c5cb@gmail.com>
Date: Tue, 28 May 2019 12:36:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bb5aa1e6-f927-5f96-dbd7-1582da1733f3@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOC4wNS4xOSAxMjoyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEluIGdlbmVyYWwsIGFs
bCB0aGUgcGF0Y2ggc2VudCBhcmUgc3RhcnRpbmcgd2l0aCBhIG51bWJlciBmb2xsb3dlZCBieSB0
aGUgdGl0bGUuIFRoZSBudW1iZXIgZW5zdXJlIHRoZSBjb3JyZWN0IG9yZGVyaW5nLiBJZiB5b3Ug
ZG9uJ3QgaGF2ZSBudW1iZXIgdGhlbiwgeW91IHdpbGwgZmFsbGJhY2sgdG8gYWxwaGFiZXRpY2Fs
IG9yZGVyLgpBaCwgeWVzLCBzdXJlLiBJIGRpZCByZW5hbWUgbWFudWFsbHkgUkZDMSBwYXRjaCBm
aWxlLiBCdXQgc29tZXdoeSBtaXNzZWQgcmVuYW1pbmcgUkZDMiBwYXRjaCBmaWxlLgoKLS0gClNp
bmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
