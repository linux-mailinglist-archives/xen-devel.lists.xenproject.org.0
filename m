Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42813204
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:19:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMasi-0002jG-94; Fri, 03 May 2019 16:17:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMasg-0002j5-Fz
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:17:50 +0000
X-Inumbo-ID: fdc246de-6dbe-11e9-843c-bc764e045a96
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fdc246de-6dbe-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 16:17:48 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id w12so5661957ljh.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5gm4hGdyi8TbcGLOCQl2NReL6hVdkmuJ945aoKx/zkY=;
 b=BKc3bgMoM9zzjpV316INuJZcMieZyv9hMF3j9UJiwDybZKoHU2EZ3IGagsPVnJxb1m
 P2wguLT0fce4K4rxB14gXVl7HaQ1c1rNLp2OJTVwRMtT5MfmdZ5NrtMwD6ESS4NPMWVb
 0/qQqF4fwAd9HJpSEVRct+e8orogy8onPyO/PqwG2c6f2TvptWMChnyibLEc3ncB3c00
 odaTMeTWiLTCXBQdulTgfr+c+4mDl4ptSEDvq3tC90DgO2VaGuEtLXnSEXOtfbYnyS61
 G5mP+NfoZpma8BvJUJELRw0mgBt7ALJ7tvO29/KpkQ3aT6jxFeUU+q6yPaQTA5Pl80cx
 qu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5gm4hGdyi8TbcGLOCQl2NReL6hVdkmuJ945aoKx/zkY=;
 b=j0znHQvWRAXY03kHKUWw4pn8EdF31pPYVLz3VsPFKxqC1SO6IRmQ8vkaE3q2YcsOp1
 9TY79jJuh+M7toNXjmLGzzVBS7XsX+r/u3yrpHc+rXdvyfoHi2C0PuMQQyyXpXYPEckI
 pznrVi98LITeO6tjhWt0ukAGsYAEZRmXp2JAEtLFmPyp5+Ea6IdpwrtPohopnOHtkwl5
 VjO7M3uA9NKTN2G6l8z+KAanAMV3YxDuroYCmQsi7uDbXGZ1FeRH0UYDOyvIFVDaStPF
 OmnmL+AC2YoYOc7vkjonpRJIFatx1ssYnJr0CrWaxkUyo1YevgeOvMW47VDHeLUT0Ntn
 VcDw==
X-Gm-Message-State: APjAAAUHlZICMDb+zCo4e74GBTR5DHuMzlp2/jyHtk0b9HkDOYQiioiY
 sV5NKBpBdYFFy4uZL7h3ppg=
X-Google-Smtp-Source: APXvYqz1O7zfFxBuf77p3+oNrOPwA6TXeLC40GhQMcAVkbbdLus3+pA6NDyaY8zep00Jknv1VUzy4w==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr2133554lji.168.1556900267504; 
 Fri, 03 May 2019 09:17:47 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 y7sm470609ljj.34.2019.05.03.09.17.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 09:17:46 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-5-julien.grall@arm.com>
 <baf59ec5-cc0a-5ffc-f637-6bbfd29dd589@gmail.com>
 <f3491a70-c5c4-024f-235e-e00a842b81d7@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <0b9442d3-6d3f-9632-862c-9dca202781c0@gmail.com>
Date: Fri, 3 May 2019 19:17:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f3491a70-c5c4-024f-235e-e00a842b81d7@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/20] xen/arm: Rework HSCTLR_BASE
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

CgpPbiAwMy4wNS4xOSAxOToxMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aGF0IGlzIHlvdXIgInNlY29uZCIuIERvZXMgaXQgbWVhbiB5b3UgYXJlIGhhcHB5IHdp
dGggdGhlIGlkZWEgb2YgdGhlIHBhdGNoIGJ1dCB3ZSBzaG91bGQgYWdyZWUgb24gdGhlIG5hbWlu
ZyBmaXJzdD8KClllcywgSSdtIG9rIHdpdGggdGhlIGNoYW5nZS4KQWN0dWFsbHkgSSBsaWtlIHRo
ZSBwYXJ0IHdpdGggSFNDVExSX0NMRUFSIGFzIGEgY29tcGlsYXRpb24gdGltZSBndWFyZC4KQnV0
IG5hbWluZyBzaG91bGQgYmUgYWdyZWVkIGZpcnN0LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFu
aXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
