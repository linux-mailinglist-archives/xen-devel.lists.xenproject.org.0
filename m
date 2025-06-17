Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82FADC305
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017790.1394786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQYG-00067m-Q9; Tue, 17 Jun 2025 07:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017790.1394786; Tue, 17 Jun 2025 07:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQYG-000660-Mu; Tue, 17 Jun 2025 07:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1017790;
 Tue, 17 Jun 2025 07:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qu13=ZA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uRQYE-000642-V5
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:16:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0e41b79-4b4a-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 09:16:09 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so916358766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 00:16:09 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81562ecsm802501966b.27.2025.06.17.00.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 00:16:07 -0700 (PDT)
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
X-Inumbo-ID: f0e41b79-4b4a-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750144569; x=1750749369; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ah1lcLne+pI4unO6xxJUtv9kU/DwTiXbQt10O1vsR8=;
        b=UMoR7m6LCOZvR2dpR020J/FxoX6Oq6Mk02MlOy+jM0BerOlDjCdSLSdjig5D2W0c1R
         mwhQtMJji0fITdDEV3cy0TB5fxOaW4CqDe21ppkO7NKt2EdUTLv7Y6fArgSUzIWfHJMm
         Jkm9MaBsdcIGzJ1k4K0C1cvubTKdRKQ/GtdnOV7ufFkJU1coUtpLaOpnm796jBIAjuvI
         AKvXplpr+kKhfZpFqD46A5O6SOAUl2ZkjYz6zeNNIygUz5LS4K0NATUCvhhj9izyJNWi
         0RTlIv9CdIo1EhISNBB33nTdNkWdWDWdq9Qm5NMWv+GBLCWLUfkjyEXGMRCanNhHFqV8
         HJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144569; x=1750749369;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Ah1lcLne+pI4unO6xxJUtv9kU/DwTiXbQt10O1vsR8=;
        b=UkZ/Db+CPdgpDIu7giz6zOgNv++5OGr9STPthPAmEADjGPU0wjgKKdd6//jYc91mBj
         ex/qJpofPbp/Zt9arwB9R1jwoXxTAbqmVUoJC2odQTumdPLrL9G4MZmnmwgNerjPY68E
         9+zdQ+OJKKut9dp6c08ogWBUCUmMaJBUqjJFiEW2c3inValP1oNO+ON2KxsnBkuv/YR4
         SZkv9Rw8j58IA+thOJK0+cdrrjcBt2CqUGqHsdliRvsaXQAz26DYoqwShNZcS0jK0W8+
         rt/zOOo1rH0C0CwAaL1eIKrNk/im5/1+DnfxI7aRRYxLZuRsYEtepQH7WEhUGv69zDFR
         ThTA==
X-Forwarded-Encrypted: i=1; AJvYcCUIOaYL1hWyGiSAuT5qx1wL8IVG9AHkJdlTrp+d2PmFCZ9rJKC3GYnHan2MYq7jedTVRAVICTf/7p0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz21ANUGMBdIWcWsPDuxFa+t39vkhdTXkN/7wllfgaLzVCanhPV
	uEK1CWoFbphF3zDcKeck+UzhMneKPznBUYB5H2hWauW71imaAVnQEFAK
X-Gm-Gg: ASbGncttn0/C0m1FwJCPlJU0578B9PnAd0oafhVUVkPk6CieFKFS+f7szqF688a02xE
	Q3Ts4cKsMA5CqXIMvlyYoCJBQX+VM3ezngKghLzqtd44Jn8kFetH3Xbl0J+5Itnafyf4k9rs61F
	8xjUVNNr6ADmk9yLL7e3E++H8ZdxlGkdNVRwFLAZFJ1lxpjDn62AjC3QxcFZsIls90D+dA93lwX
	+t4CvzYJyxBbPuCPdiWk0GsXeqiDVUt13Dtn0M9ic/VieMI4xBrPeMN+VIyJwJZen65qmeSrHT1
	diGTbEoAscsyg6OHuTUl+Vczby5tugWag7c6gSqkln+if+ASXMBWm75UJGvyOJ344p6PpyA7Tul
	0UeMRP17AOJEwWjuMAwJY6E3vmH//DjAU9LM=
X-Google-Smtp-Source: AGHT+IHFyACyZ1pUqFlH3ZjviZ32gP4rW4cGrPFjDvZsNtgze0BSWUDSKyhgOD3lF5gIem48RgddNw==
X-Received: by 2002:a17:907:c0d:b0:ad8:8efe:31fb with SMTP id a640c23a62f3a-adfad4f5918mr1281139866b.54.1750144568429;
        Tue, 17 Jun 2025 00:16:08 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SzwOD00Xg0gbG5SJ0mOofsZV"
Message-ID: <5648bdc5-20e0-4d2d-a6df-93b4088c106c@gmail.com>
Date: Tue, 17 Jun 2025 09:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix P2M root page tables invalidation
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250616065648.17517-1-michal.orzel@amd.com>
 <6cd8c65a-c440-45e3-9bb1-e8c28e90ae56@xen.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6cd8c65a-c440-45e3-9bb1-e8c28e90ae56@xen.org>

This is a multi-part message in MIME format.
--------------SzwOD00Xg0gbG5SJ0mOofsZV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/16/25 10:15 AM, Julien Grall wrote:
> (+Oleksii)
>
> Hi,
>
> Adding Oleksii for visibility.

Thanks for adding me.

>
> On 16/06/2025 07:56, Michal Orzel wrote:
>> Fix the condition part of the for loop in p2m_invalidate_root() that
>> uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is to

I used P2M_ROOT_PAGES for RISC-V for the similar case. This patch just confirms
that it was a correct decision.

Thanks.

~ Oleksii

>> invalidate all root page tables (that can be concatenated), so the loop
>> must iterate through all these pages. Root level can be 0 or 1, whereas
>> there can be 1,2,8,16 root pages. The issue may lead to some pages
>> not being invalidated and therefore the guest access won't be trapped.
>> We use it to track pages accessed by guest for set/way emulation 
>> provided
>> no IOMMU, IOMMU not enabled for the domain or P2M not shared with IOMMU.
>>
>> Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch of 
>> Set/Way operations")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
>
--------------SzwOD00Xg0gbG5SJ0mOofsZV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/16/25 10:15 AM, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6cd8c65a-c440-45e3-9bb1-e8c28e90ae56@xen.org">(+Oleksii)
      <br>
      <br>
      Hi,
      <br>
      <br>
      Adding Oleksii for visibility.
      <br>
    </blockquote>
    <pre>Thanks for adding me.

</pre>
    <blockquote type="cite"
      cite="mid:6cd8c65a-c440-45e3-9bb1-e8c28e90ae56@xen.org">
      <br>
      On 16/06/2025 07:56, Michal Orzel wrote:
      <br>
      <blockquote type="cite">Fix the condition part of the for loop in
        p2m_invalidate_root() that
        <br>
        uses P2M_ROOT_LEVEL instead of P2M_ROOT_PAGES. The goal here is
        to
        <br>
      </blockquote>
    </blockquote>
    <pre>I used P2M_ROOT_PAGES for RISC-V for the similar case. This patch just confirms
that it was a correct decision.

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:6cd8c65a-c440-45e3-9bb1-e8c28e90ae56@xen.org">
      <blockquote type="cite">invalidate all root page tables (that can
        be concatenated), so the loop
        <br>
        must iterate through all these pages. Root level can be 0 or 1,
        whereas
        <br>
        there can be 1,2,8,16 root pages. The issue may lead to some
        pages
        <br>
        not being invalidated and therefore the guest access won't be
        trapped.
        <br>
        We use it to track pages accessed by guest for set/way emulation
        provided
        <br>
        no IOMMU, IOMMU not enabled for the domain or P2M not shared
        with IOMMU.
        <br>
        <br>
        Fixes: 2148a125b73b ("xen/arm: Track page accessed between batch
        of Set/Way operations")
        <br>
        Signed-off-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
        <br>
      </blockquote>
      <br>
      Reviewed-by: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:jgrall@amazon.com">&lt;jgrall@amazon.com&gt;</a>
      <br>
      <br>
      Cheers,
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------SzwOD00Xg0gbG5SJ0mOofsZV--

