Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6B6CF76
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho75D-0004Xf-ML; Thu, 18 Jul 2019 14:08:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho75B-0004Xa-UI
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:08:29 +0000
X-Inumbo-ID: 83d17122-a965-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 83d17122-a965-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:08:28 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m8so27457330lji.7
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4siLD/KJqRQcUupbcTSB19jWyJAGmozaqRfV+2t2nAE=;
 b=HCcQ3UFEl6CuI+lk4nUOrY3jkNZhfSh/rymOpAKVLxa/+32CRVOYvlqlQqYo9Skoik
 7n/dfwvqqFN55Qd8kCMFDoLqJVofvm1dlH0qbSNm60XvJqWAhhVxiiTgxMFMdrtNGVy2
 0dLfn05u1PJZsYhb1zFWlN1GFbJj9epFIoAqA06cmNJLhEI0mgBaqVym3bkJoqAyl84m
 qCCQvBdckenT7asaVoNcVgdz4TUFUoV8aNQn4Ly2k0Njko3xW0i+n/R2sFd4XwDAFnwG
 k0pShP9dwtoBuM4cliLVvQJJZnLrV+B3nDs/bXuvqlqTSZqbeAVjTwwUzoWPjkHBPSti
 giVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4siLD/KJqRQcUupbcTSB19jWyJAGmozaqRfV+2t2nAE=;
 b=JXPGtvWXpdkwbgHv70U0VLkTYGkYjwAem7dR0PbUWo3xMFMwEvYwh181tS8X+yLQyA
 n5hfUJqxE8ddMEdcizLJ9nximtYrtqq2sr/FmpRDlC6P1kyw3Mh639JUtW4xufz2c8gu
 2Luc9r2GrDCWF8KqQbr35+eMytmpebOacJ4sqVjnOrq6FpNwS6i8FlutNu35NiLGobwJ
 /0S2cwEcimSrdn95DoAGY/JYPAQKCNMGwBnzcKqASAiOXS+QIxce9ZSNffILy65ehYGu
 l+GPPCFkqKnNW3ZZCPMhB/AWvt3hJZiIiJ3LPWPZiguo329HFwE9w2e3O10BQaW0iVr1
 wgLA==
X-Gm-Message-State: APjAAAUHDukmUhBbZu0KI5gtcjr4lcZLnM7kAveUOM0mbzaGZcFVHd9+
 tYMGTLxBu0C7deamY+nNUKdnbYRP
X-Google-Smtp-Source: APXvYqwNGDSgJ37tZaZNIiHqMbd1AV2cooFtuwR2F/YHKD8F3c/eATGpZhX1nQ5t+dv0WK4O2Ihtgg==
X-Received: by 2002:a2e:7a19:: with SMTP id v25mr24519041ljc.39.1563458906924; 
 Thu, 18 Jul 2019 07:08:26 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 e26sm4053053lfc.68.2019.07.18.07.08.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 07:08:26 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
 <c6f154b8-34a5-9b23-6761-1a10680dc486@citrix.com>
 <401358d0-38d3-a881-e020-01934f18b193@citrix.com>
 <e61ddba2-f6b9-b452-c22e-361bc3b8afed@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <40da96a0-1da9-0705-b1ea-58737f05be8f@gmail.com>
Date: Thu, 18 Jul 2019 17:08:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e61ddba2-f6b9-b452-c22e-361bc3b8afed@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMTguMDcuMTkgMTY6NDQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
TXkgc3VnZ2VzdGlvbiBhYm91dCB2dW5tYXAoKSBzdGlsbCBzdGFuZHMgdGhvdWdoLgo+IAo+ICsx
IGZvciB0aGUgdnVubWFwIHNvbHV0aW9uLgoKSXQgd2FzIG15IGluaXRpYWwgaWRlYS4KCkJ1dCwg
dGhlIGlzc3VlIGlzIGludHJvZHVjZWQgYnkgY2hhbmdlIDljYzA2MTguIEluIHBhcnRpY3VsYXIs
IGJ5IHRoZSBjaGVjayBpbiBgeGVuX3B0X3VwZGF0ZSgpYAoKICAgICBpZiAoICFJU19BTElHTkVE
KHZpcnQsIFBBR0VfU0laRSkgKQogICAgIHsKICAgICAgICAgbW1fcHJpbnRrKCJUaGUgdmlydHVh
bCBhZGRyZXNzIGlzIG5vdCBhbGlnbmVkIHRvIHRoZSBwYWdlLXNpemUuXG4iKTsKICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7CiAgICAgfQoKU28gSSBhc3N1bWVkIHlvdSBoYWQgc29tZSBzcGVjaWZp
YyBpZGVhIGFib3V0IHRoYXQgY2hlY2suCgpJJ2QgZml4IGB4ZW5fcHRfdXBkYXRlKClgIGlmIHlv
dSBhcmUgb2sgd2l0aCBpdC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
