Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B06079A3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 16:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427708.677035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olt4d-00005a-OJ; Fri, 21 Oct 2022 14:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427708.677035; Fri, 21 Oct 2022 14:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olt4d-0008UR-Kg; Fri, 21 Oct 2022 14:32:35 +0000
Received: by outflank-mailman (input) for mailman id 427708;
 Fri, 21 Oct 2022 14:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRa2=2W=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1olt4c-0008Tl-8h
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 14:32:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32c8e467-514d-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 16:32:32 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id t4so2287935wmj.5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 07:32:32 -0700 (PDT)
Received: from [192.168.1.175] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 j30-20020adfa55e000000b0021e51c039c5sm19956585wrb.80.2022.10.21.07.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 07:32:31 -0700 (PDT)
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
X-Inumbo-ID: 32c8e467-514d-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWfsfJk5hx3YdnSCVx+J9ZQWPQB2UtKYVlioTVCoe6Q=;
        b=LKo9gIspEGDjZ5aujnedyRII5wlF2qeUzXGeiMpsBP8KzPel8RQ4EHiqaRK/Ooe6eM
         CNbHd0JEIit91La08aVhUMVI8XnwgigNfHC0AoTyzVraxCaHtiU5kQ/6PaLw3ZL3vB1M
         qB/ak4yXhKchaGqgi1UIxkOM/176T0ZCUeW4Co8OmuncjNBexYBRIpMbPd8EC+Ptgjzv
         tCcJNK48GeoP7LqUt9ZLxaCpW2MvF4cU1Wit46thHzdGtkM5hYOvrIRwqFNd9PgKbc23
         0xIyFjSXHhY50Ax/nEPRmUSBTAZK9PNu/COj+aA604wuukAA42DVTXkofZ8Pkn9czSFr
         a1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWfsfJk5hx3YdnSCVx+J9ZQWPQB2UtKYVlioTVCoe6Q=;
        b=1xOoI8b/whGbZ5ZOzOaqqTsoeT+0s+JIux83rgYjC2o8cr2Njh+UYlAHk++OaM1S3Z
         VpAXaGkpQNiJjVtv8FN8Y7aDCUqYTAXmfFJ7EggCUEKZCR2W/gG59f4gR+M3nl55MgZp
         Fdz54mCTNgWGUJC4vFlLe0VAvuuebOuvGVwybnS5Ai6qC+XnBSLNXfzZKqXnMZt0G0w5
         L2jS7pocd/RV7Hiqj/fsybsZBxYFjmmRqqY6iV6MDCuelloNqkeF7TTSslM4SMypB2mi
         5/8+CxO5GF+rSSlB9/I5+HzFzUumQTj/W5Bf9qNVDyRov0wHDY9Ahz81Bv61Dn2+QGOv
         9kCw==
X-Gm-Message-State: ACrzQf1tOGRvfAQeOHWFYRbO8XR/zuAsjUnxzIotUXcbIjhR/OzOxs4F
	p9fTyP05iKYns6KfCOhUskQ=
X-Google-Smtp-Source: AMsMyM4m7QMb4HUpEeZenI17Ikl+Hrp2wTwl3mJq8owhR+d9LsT36DIEWUaKn5r5wQTgH9bO9gbXVQ==
X-Received: by 2002:a05:600c:3384:b0:3c6:f25a:96e9 with SMTP id o4-20020a05600c338400b003c6f25a96e9mr21595334wmp.112.1666362751960;
        Fri, 21 Oct 2022 07:32:31 -0700 (PDT)
Message-ID: <e9120354-e72e-2774-c382-45ab0cb76220@gmail.com>
Date: Fri, 21 Oct 2022 17:32:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com> <87ilntgzpj.fsf@epam.com>
 <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
Content-Language: en-US
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello all.


On 19.07.22 13:40, Jan Beulich wrote:
> On 19.07.2022 12:32, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>
>>> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>>>> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
>>>> iounmap(), but not added corresponding include.
>>>>
>>>> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
>>> I don't think there's any active issue with the "missing" include:
>>> That's only a problem once Arm has vPCI code enabled? In which
>>> case I don't think a Fixes: tag is warranted.
>> Fair enough. May I ask committer to drop this tag?
> I had taken respective note already, in case I end up committing this.
> But this is the last patch of the series, so I can only guess whether
> it might be okay to go in ahead of the other three patches.
>
> Jan


I am wondering, where this patch could be 4.17 material?

The patch series seem to get stuck, but the current patch just adds a 
missing include to fix a build on Arm, so it is completely independent. 
I agree, there is no issue with the current code base as vPCI is 
disabled on Arm, so nothing to fix right now. But as PCI 
passthrough/vPCI on Arm is in the development stage, the developers 
enable that support in their builds. I think the risk is rather low than 
high.



-- 
Regards,

Oleksandr Tyshchenko


