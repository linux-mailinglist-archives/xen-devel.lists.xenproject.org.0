Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201EC1BA9E
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 18:09:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQDSk-0004U3-ON; Mon, 13 May 2019 16:06:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA65=TN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQDSj-0004Ty-9d
 for xen-devel@lists.xen.org; Mon, 13 May 2019 16:06:01 +0000
X-Inumbo-ID: ff860272-7598-11e9-8980-bc764e045a96
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff860272-7598-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 16:06:00 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id h21so9741003ljk.13
 for <xen-devel@lists.xen.org>; Mon, 13 May 2019 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Yw/VnAyrogSue3RK3yx7C7XreOw4URtUwX41tgCg0E=;
 b=o7aMdbl/2ywgkBDMC5asMRWhZMJJEc2yoVGMEHOobdYFFsbD+lsVUR6VLyswCohnue
 yEk7H8uv9II6wGPRmpAtTd+70HMk2+kKpWSlPS8uOHpAlVjP/zB59krNiublEVX0MO0L
 Vxo4QRCcKvUHDZESe+DsGwISPXwR90jN6sLBNXqyhH23aLmhFfWRyv11pqxtj/j5Sa+h
 2huKhAv0GDqNoRnmvwrd7wyG5aNQx+vrifK6bmEeeniOqEo1WUU7cu1OHthfpaIZ6FJ1
 NZv5kSGIfQRSABxeZXZ/Pk/KvktJ1fL1gILxfAhkObiE9NPbg5kvlxtilCEnIIs4WIQv
 g9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Yw/VnAyrogSue3RK3yx7C7XreOw4URtUwX41tgCg0E=;
 b=CqyYSQGryQpwlqWlhPmYzXGFOxpIR+8XDYONdw+Uw3//C669WJQkZRuA7uqWjza+vU
 XvXCqm+7A84VGiUp0MEU1+t2QDUMy1eCIuCpA6j/Zn2XII/QUB/R3ze+hrdfCGuD+BeK
 Nm2WHSCkJ3Mim3/C6qWM8PjKU8zfIeHNutfl7pIh94HaB3g9kguzifHPDdqSlwJeB69h
 mR/6W19OZh0nNij+E4OETnsSfcjUFaiteaCKwog8EDZO8BofKJFfIa8rO2rNqKMpwQME
 PkmpsZCzYc0H50hO0wH/QqD9IUuDrcjshgRvARDGMtWXM9IFvISF8oyrERd5VIffFEM+
 IRWw==
X-Gm-Message-State: APjAAAWKdKe6gD7NlC/CWrmxAA5XHw3hSLQ+j/DmcAkL+RbgLer0aZpF
 e9c9ey334ebrIJN04gY+OiA=
X-Google-Smtp-Source: APXvYqyR/BlHG1gAWEEDpciK5o3Fnz5p6dQdged1J6Ib1wCcuv+45FIHFCH1G92ZTPm1H8/TjmZo2w==
X-Received: by 2002:a2e:1312:: with SMTP id 18mr3767148ljt.79.1557763558808;
 Mon, 13 May 2019 09:05:58 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 u2sm2429156ljd.97.2019.05.13.09.05.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 09:05:57 -0700 (PDT)
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
 <66a079a8-8bab-535c-1795-b831e927ea5d@gmail.com>
 <cb7753a4-5e83-ab0c-90c4-b80072685a9b@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <104d2f91-73fa-9938-cc3d-3b24eb9c1f02@gmail.com>
Date: Mon, 13 May 2019 19:05:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cb7753a4-5e83-ab0c-90c4-b80072685a9b@arm.com>
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

CgpPbiAxMy4wNS4xOSAxODo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgd2FzIHNwZWFraW5n
IGFib3V0IGRkIHByb2Nlc3MuIEJ1dCBEb20wIHZDUFVzIG1pZ2h0IGFsc28gYmUgYSBnb29kIGlk
ZWEuCgpJIHNlZS4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
