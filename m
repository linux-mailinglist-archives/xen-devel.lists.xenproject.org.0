Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323424C2B
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:04:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1aG-0003AJ-J4; Tue, 21 May 2019 10:01:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1aF-0003A8-52
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:01:23 +0000
X-Inumbo-ID: 629ccbf4-7baf-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 629ccbf4-7baf-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:01:22 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u27so12584039lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hge+GcjBveaYubR7LVCnR3BME/XeJwFRp61kQ3F9uoc=;
 b=mYEXQuOAYuUVSx9FZtrQA88ij3+DPTbpoxXt1wRLx3AE1vD8RggBroJPvztDvK4i9x
 HNHL428pBQR42JjZrLjSeHP6/+a1oBL6tY9lZttG9NrvG5bu842O9FxSF0UIWUkBtPCx
 +2xPtlhr6l6FewXwVu/RkIBBR5HEqaGa9ksDEOR721R/ANp/d0gs824E3E63kq8XYRJW
 nKlKDdOJud0ytRZT/oA2d13wZmIqgn7olvPiWfsHgKH2cL2QILBfDoZlPA6vZndallyI
 aO33+zGUiew04pUJOchThH4+JE+OkSEzJlImwMWGXJWBlRoKB6lGwIBzxu7uBU2O6IQK
 AF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hge+GcjBveaYubR7LVCnR3BME/XeJwFRp61kQ3F9uoc=;
 b=AgZ/6goYfJzn3yvqPNBHKe43Rt/HjpngcIPcQLFHABSPn/3M+fUe1woCM7FWTJ5ieh
 udxnRA/cc3iNLYVqVfVpD36X7UaclqYFBDozMJwGtNbg/ftWwXVfqO5VVCzGx6MxoEw+
 rBSEFPfJviSJ7Aq1H/u0daszIYkwA7Yto2ed+zpJOae9JP8p2zLwkFmDGY7AtbI2ZsEX
 2yQ+NexFbZhtzRwKay/aWlPRov9hmtRX7wyImmB9thFv/MdB0J0DlY1ipFmHTxRy3c0s
 EK0H6DKO74HgNSX7xyUes1fsm8Gw37lLCbsIvYWTDNpsGEEQ9OWhm2d/1XDyC1cY4Mkc
 fivg==
X-Gm-Message-State: APjAAAU1L5YO69nAIIUyPrgARygjS5h6CTKQ7Pw4b6FcU6YP17TZbAMc
 MFcVHiRbGniVGmZ89D5IQxc=
X-Google-Smtp-Source: APXvYqwzf03D6h6fHp4wlpdRPUukuynElpl136PBs9FMt9Zt8P5w19V+QlYcB7hXOZqoH7UlU52+Zg==
X-Received: by 2002:a19:282:: with SMTP id 124mr38932506lfc.131.1558432881033; 
 Tue, 21 May 2019 03:01:21 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 x23sm4591531lfc.25.2019.05.21.03.01.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 03:01:20 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-4-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <35041df1-0c11-e5a0-037c-c26b2737e8d3@gmail.com>
Date: Tue, 21 May 2019 13:01:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122456.28559-4-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 03/19] xen/arm:
 processor: Use BIT(.., UL) instead of _AC(1, U) in SCTLR_ defines
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFVzZSB0aGUgcGF0dGVy
biBCSVQoLi4uLCBVTCkgdG8gbWFrZSB0aGUgY29kZSBtb3JlIHJlYWRhYmxlLiBOb3RlIHRoYXQK
PiB1bnNpZ25lZCBsb25nIGlzIHVzZWQgaW5zdGVhZCBvZiB1bnNpZ25lZCBiZWNhdXNlIFNDVExS
IGlzIHRlY2huaWNhbGx5Cj4gMzItYml0IG9uIEFybTMyIGFuZCA2NC1iaXQgb24gQXJtNjQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJl
dmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNp
bmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
