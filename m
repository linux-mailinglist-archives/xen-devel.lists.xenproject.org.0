Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3C61BA3E
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:41:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQD2Q-0001De-JL; Mon, 13 May 2019 15:38:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA65=TN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQD2P-0001DU-2a
 for xen-devel@lists.xen.org; Mon, 13 May 2019 15:38:49 +0000
X-Inumbo-ID: 32b40053-7595-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32b40053-7595-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 15:38:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m20so11418828lji.2
 for <xen-devel@lists.xen.org>; Mon, 13 May 2019 08:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7VneVWsrd/X7Rj3LYVMHHCKRsAyFgTICE051laXBIAU=;
 b=aCfB6pyCFINSwFgqBgwf5kan94473CzrDwqmRbLpf8zbLRaEZSv8gznH2zmLwWyDT2
 bWRkmsdHyF7uClDtU6rwdKFeu+e+W5aA33/oy1d7SNEh6Wdgqmk3LBKIQwvPM2zO2ys4
 O+UngqNRbzFfD8QO6XWhd9pTzFLZSb332HoPbBrfVzX+y+D+CS/0CDS3qCRHC/YTvuDZ
 sjljwDtTSddhLvVsIBmeHTvpixuqz2CR7n+px/tJLxeRxCKc9VK4DBaMtp7FbQmmHTdY
 fPjqODPV8kn8EuJ9PQ/zjF5rnLsG+ukMFlCmYThxqN4CGS2HfuejxxZokb6v3iAKEdm6
 luRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7VneVWsrd/X7Rj3LYVMHHCKRsAyFgTICE051laXBIAU=;
 b=Sx4M1prJit6h88n3yJow8bw2+hZZssgC0H0MTWyfXfd/xMObilWOZXWJ31Dv+AeVTx
 lLYSS88xdME7jBT7GuDnLD/TxEtLL85t+io/XxWaxvW0RNpvYeSbqDdLZLmTL//aWAVt
 ucejWZaDMBt+J2p5avclwhAVjPqWD1ngLmPxi923/igdGxJGX2GeYPjNwEfMDRHD+DmY
 JEul6f/b/xIkQ/nLswGzvyYQKaTCR7hAoax8bs4Azy5w2r1X3Bo/Ww7MB1upsSOwImK6
 ivvrUD4YpvxrVTwlRC92WwA6DttxTbfCzK7akJ6T4blV+mH+hpB9agDOFoEkvkg3eTFO
 ZwAQ==
X-Gm-Message-State: APjAAAW6nfOc4ijxtirC+Iz8TZ6snyfpRFc/Dg0O6eIV33ujRFWtHsc8
 72z7myOXphX4+Hae9AEQIwM=
X-Google-Smtp-Source: APXvYqz7A46+2pKNCmtk+uamaw/ojzuhmk0bp0J8xNVsgsR6ivmudhD9hFzaUTWKvqn2kDUMmBDS5w==
X-Received: by 2002:a2e:9116:: with SMTP id m22mr2695640ljg.12.1557761926710; 
 Mon, 13 May 2019 08:38:46 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 u11sm3370188lfb.60.2019.05.13.08.38.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 08:38:45 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
 <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
 <256009a8-c960-5342-ee8e-3e0721af8658@arm.com>
 <3fcde39c-5cda-b1b6-156c-48bae16a7c83@gmail.com>
 <449bd563-f256-432f-a542-110d9eae0d73@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <30412929-eae5-a013-5962-8b0874c8a3e2@gmail.com>
Date: Mon, 13 May 2019 18:38:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <449bd563-f256-432f-a542-110d9eae0d73@arm.com>
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

CgpPbiAxMy4wNS4xOSAxODozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNvLCBhcmUgeW91IHJ1
bm5pbmcgNCBkZCAob25lIGZvciBlYWNoIGNvcmUpIGluIHBhcmFsbGVsPyBBcmUgdGhleSBwaW5u
ZWQ/CgpZZXMsIHN1cmUgSSBydW4gNCBkZCdzIGluIHBhcmFsbGVsIHRvIGdldCBhbGwgVkNQVXMg
bG9hZGVkLiBObyB0aGV5IGFyZSBub3QgcGlubmVkLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFu
aXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
