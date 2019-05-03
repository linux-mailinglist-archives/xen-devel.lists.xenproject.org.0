Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4198A1319F
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYo-0006xX-R6; Fri, 03 May 2019 15:57:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYn-0006wT-5y
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:17 +0000
X-Inumbo-ID: 1ef2e977-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ef2e977-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:16 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c6so223954lji.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4LewNE+7oVpa6HproFAzlqyMsDQnwZmutDC3kB5Zl2g=;
 b=W64u8DZqtNSuzkeQHF5O3F8En2pN1l2GjEn6uDMHN7hIevAYKtDoEk2XuqDZBTZqI+
 n/f4+iAv+crfeYkIGu3o3QXLG6WHsQWIW/xTuXdMsAm6tuhr//0VyfJWn2osgEUvPWtZ
 Re0Zof3RrCr1J7S/IxNfiKx8xKWhvOgIS6TYULbKxVlh7Q4OgzNOUejmq4uRaET6ZFH5
 bGPsZdGXyvy2bsa2RNuNbM9voMDddcwYc/RLwHOwllxv4Sjf3ojfjumsc+fWAoqmJh9d
 Dq3FTKl6l+bGe42vJgiGp1EtOvFpSmNwhjSkydtU/4p1EQk9Fnr26nlrKJ0lr0CjJjj9
 5YRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4LewNE+7oVpa6HproFAzlqyMsDQnwZmutDC3kB5Zl2g=;
 b=IsoTbj3HEhmjkTAVaY8SQmCuoLw1v5nrX4AiKprtoTBOVb6zvh5LJyb6P6/l1X5qih
 9+88a33QMJ4HSgr/5tZjkpCzUgcr+Y9UhhH4NoZkf6615ZmV+pafw71N0cY+y9RD9mxy
 GYkt+7QWeOsFfGNfjE4HWAJCh5EwDx/PieWU89OcSJS64AXhQcOBkhv2rnURarhfib6P
 5+L48D6urKtNig8O76IMtLhMEJL4jTHIVLTWhplmPwO1H7QHSoty58MMoS/fvdc8GWIG
 cU/x/mmJbBuHq7rUQPHWmNzlgf2mrktZ6zYj0M5NUTYuxguIXT4BPbLb3QUDmlCavmnB
 QaWQ==
X-Gm-Message-State: APjAAAWaSAD4CGvF2OU6zrQEdq3AyARb1knPEMaMG14hqrD+C1/C3trH
 wsnSy8cRuNCbmQywyQ+yVdo=
X-Google-Smtp-Source: APXvYqxloSGrMVIw8SbCXP5rsTaOwtakDGxS4GHRMXqdpSf7NCtOcdTWB/DEWJ3kJSyqw25UkPgfsg==
X-Received: by 2002:a2e:8496:: with SMTP id b22mr5457095ljh.9.1556899034715;
 Fri, 03 May 2019 08:57:14 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 x68sm494230lff.3.2019.05.03.08.57.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:13 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-11-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <5b1a6f14-cb12-091e-9019-f076ebe9d6e5@gmail.com>
Date: Fri, 3 May 2019 18:57:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-11-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/20] xen/arm32: head: Correctly report the
 HW CPU ID
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGVyZSBhcmUgbm8gcmVhc29uIHRvIGNvbnNpZGVyIHRoZSBIVyBDUFUgSUQgd2lsbCBiZSAwIHdo
ZW4gdGhlCj4gcHJvY2Vzc29yIGlzIHBhcnQgb2YgYSB1bmlwcm9jZXNzb3Igc3lzdGVtLiBBdCBi
ZXN0LCB0aGlzIHdpbGwgcmVzdWx0IHRvCj4gY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0
IG9mIFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQo+IE1QSURSLgo+IAo+IFNv
IHJlbW92ZSB0aGUgemVyb2luZyBhbmQgbG9naWMgdG8gY2hlY2sgaWYgdGhlIENQVSBpcyBwYXJ0
IG9mIGEKPiB1bmlwcm9jZXNzb3Igc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3Yg
PGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
