Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1CB1BA4D
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:44:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQD6J-000291-TJ; Mon, 13 May 2019 15:42:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA65=TN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQD6I-00028r-BZ
 for xen-devel@lists.xen.org; Mon, 13 May 2019 15:42:50 +0000
X-Inumbo-ID: c288ec3b-7595-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c288ec3b-7595-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:42:49 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w23so9428112lfc.9
 for <xen-devel@lists.xen.org>; Mon, 13 May 2019 08:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=88qEa5RyysE/X1a6m43YFvMC7xrY2J/6jIiMiC4OfLA=;
 b=iG1MuMEwA3zu5iRD7HVPLHcHPC1DWfbmmmeU338ZeISsI0a0OX3WLIl3YndV6Pz3i4
 HQXDSTFyLNxblU+uMTNutymc59EQyT14wMhBzRTKSzIBaD/Qo/CbX1g/VB8rNLMmXfMB
 65T6x112yMKOsWxzuH5Tij5TfOz1PLUkJi4lPm/MzmrgJQ8lPRr0CjZ5288rk4ndbaOi
 hBcFGhNFhrj7s6XWSdYG2V1DMKWy6Bt+x1Coac8nzf1cYM9b2Y4m7Q2ojWotA9jdT2ld
 t4Yo+448lD61aNApfUMHT2nIkbTyGn0enH2WN8/SlDxD3/H+hLt2323m59HIgY1GI26L
 rQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=88qEa5RyysE/X1a6m43YFvMC7xrY2J/6jIiMiC4OfLA=;
 b=Seo8ITmIJJsNuD83oHZJbMKgo/crDd0UqHUj+yEzuyiuQ6L0Wt+D+gvr0KCcOHGsoE
 gH/fxCCQ64XMHePb9D35Hl/NL7+UdPrCMbGiiQUcN+qxT5pLYRss1Hu05aNGyUmbMdIJ
 XifJHCIt88eCNQnMC5xhLNHuxvlIQDrLvlllUGav/i/yACGjXguYunvwuh7JIcX4c/5V
 71lDccqEiqpBndD66pDU6IDoBbTQwFK59UEkCxusm9SqDiZT1+OYNC3DqfEn0mFwUmBb
 IZNUAc9xE7ypBftiOzS9zhkjkgB9h/NQZvZi4FIoC0iztmcDQVYLW7xwcRHvqCiP+9LA
 ZPeg==
X-Gm-Message-State: APjAAAW1oOTIZsVbZM+L3NAE14rkVb7g4bSM1ECxBKue8UM56ckkZlFx
 EkiGMAW4BUXCci5FuvELzLg=
X-Google-Smtp-Source: APXvYqwonOrkwRaCWJeYGcVb9UF49F3VDHHTabRip6P2dSB9JKNwJbLN9j/ZpepJnbLiIPU03q+XJg==
X-Received: by 2002:ac2:5bdb:: with SMTP id u27mr9934084lfn.92.1557762167880; 
 Mon, 13 May 2019 08:42:47 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 y25sm3369536lfj.16.2019.05.13.08.42.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 08:42:47 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
 <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
 <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
 <3fcde39c-5cda-b1b6-156c-48bae16a7c83@gmail.com>
 <449bd563-f256-432f-a542-110d9eae0d73@arm.com>
 <30412929-eae5-a013-5962-8b0874c8a3e2@gmail.com>
 <96bd557f-29c4-f0b7-3ccb-d00664ed9ff0@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <66a079a8-8bab-535c-1795-b831e927ea5d@gmail.com>
Date: Mon, 13 May 2019 18:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <96bd557f-29c4-f0b7-3ccb-d00664ed9ff0@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEzLjA1LjE5IDE4OjQwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gIEZyb20gbXkgdW5kZXJz
dGFuZGluZywgaWYgeW91IHdhbnQgY29uc2lzdGVuY3ksIHRoZW4gc2V0dGluZyB0aGUgYWZmaW5p
dHkgd2lsbCBkZWZpbml0ZWx5IGhlbHAuIE90aGVyd2lzZSwgeW91IG1heSBoYXZlIHRoZSBzY2hl
ZHVsZXIgdG8ga2ljayB1cCBhbmQgYWxzbyBiYWxhbmNpbmcuClNvcnJ5LCBkbyB5b3UgbWVhbiBz
ZXR0aW5nIGFmZmluaXR5IGZvciBkZCBwcm9jZXNzZXMsIG9yIERvbTAgVkNQVXMsIG9yIGJvdGg/
CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
