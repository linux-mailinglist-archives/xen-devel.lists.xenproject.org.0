Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B524387625E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 11:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690194.1075987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riXiB-0007nb-76; Fri, 08 Mar 2024 10:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690194.1075987; Fri, 08 Mar 2024 10:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riXiB-0007mI-47; Fri, 08 Mar 2024 10:44:23 +0000
Received: by outflank-mailman (input) for mailman id 690194;
 Fri, 08 Mar 2024 10:44:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iEmX=KO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1riXi9-0007mC-Ip
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 10:44:21 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1a4c762-dd38-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 11:44:20 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a45c006ab82so258820866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Mar 2024 02:44:20 -0800 (PST)
Received: from ?IPV6:2003:e5:8715:c000:52ff:24ed:f304:23c0?
 (p200300e58715c00052ff24edf30423c0.dip0.t-ipconnect.de.
 [2003:e5:8715:c000:52ff:24ed:f304:23c0])
 by smtp.gmail.com with ESMTPSA id
 qw28-20020a1709066a1c00b00a381ca0e589sm9143282ejc.22.2024.03.08.02.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 02:44:19 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d1a4c762-dd38-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709894659; x=1710499459; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqyo1Ozj3kkEIPRj2BTXEgAdVk5xtil/9n1qtnu1Pcw=;
        b=Lu4mSfUUgW2Bw5/gqqPDAcobscRxihzP4vDA9twF98zuMfgXONKEfosHpCb9KXaWam
         Z5/B0m1/9zd+rxePRx/3zcJg3ctEOkmDuvKODu6SIYr3dnxHCKaN2me8xUecw3ARwpgB
         04Eikq3RubK3Lw6ArRija1/V6bQwfToGyQwOI6g31vvQN0enB7nOIeljU7K/gY6920Y4
         JjUHejD1rdXKOcJm9MR6lzF/6LeP2ngJb7aeJzX6ZGzchEHBLFyIge6ElYIN9r80D0AS
         RTDkxf5gJbUNbKI+bR+gdQT22NYpCWW7i07k/ZCAsn1rs5Oy/Qjpk9OS59AEFIOmBW15
         ZBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709894659; x=1710499459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqyo1Ozj3kkEIPRj2BTXEgAdVk5xtil/9n1qtnu1Pcw=;
        b=R4N53CoB6G4fSk57doWY0HYquZXuRt6cGgvr8T+jn6xBIxFUxLyg9mgHyClwmVS4Hd
         o/lA0X0hPlQDVcQopArTL5bJZyoaAlDbhpAqVN3XK4jmkRjDTuBFXT6DkooKNVLk6S45
         PQPFfVCYKSmOI//OxcTtHfYEB8oI39sm+fVQFbuljLjoNQP9jhc9ctDmR6oKXJ7onLcz
         A164Zz6SITW4yyNybahtS/Mm5jk0z77Uizogllj6qqWdYLtSvSH26HT6oNENdPvE26ja
         +nX88CX7KSoZohRa0zm40xUeIedvmvbOA0LEo9dRQK0x0ATMaU1ez4KCjNjn0YbBRdiN
         KLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjU6zT3CKogdbpGh674QYYbD/zxdOmnsj6IFJMw3gzN1jtmIE926Q4mwPyIwv/MD4wUcPKbJyTZZ1z4ALeFftd9sx5BpBLtBLD9d+sge4=
X-Gm-Message-State: AOJu0YwFMoUX+A0OfBJ6/CWDWQDTK6/ow70KF1wHPPRb0B3LvG/V9kSp
	MZlh+6G+ULaPOaG3/M2UBdX6/onkqph7kMZw4odtb8mIUlU2SvyroXyHD+DPufA=
X-Google-Smtp-Source: AGHT+IFa6C3iAF/szUL0WlQeNpe8wcBtHEqOX8Y5ln2fUfYZWdhgUrMKRCSGzkxNxe3X+0IVFHoIFA==
X-Received: by 2002:a17:906:35cd:b0:a44:dc35:df19 with SMTP id p13-20020a17090635cd00b00a44dc35df19mr12080192ejb.67.1709894659653;
        Fri, 08 Mar 2024 02:44:19 -0800 (PST)
Message-ID: <23249fa7-1721-4d47-a0d4-b592913e4560@suse.com>
Date: Fri, 8 Mar 2024 11:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/grant-dma-iommu: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, kernel@pengutronix.de
References: <20240307181135.191192-2-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240307181135.191192-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.03.24 19:11, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


