Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4E5FEC08
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422636.668795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHGz-00034L-Sg; Fri, 14 Oct 2022 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422636.668795; Fri, 14 Oct 2022 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHGz-00031W-Ps; Fri, 14 Oct 2022 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 422636;
 Fri, 14 Oct 2022 09:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1R5=2P=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ojHGx-00031Q-RM
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:46:32 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1467aa27-4ba5-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 11:46:30 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id d26so9294472ejc.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 02:46:30 -0700 (PDT)
Received: from [192.168.1.93] (adsl-33.176.58.192.tellas.gr. [176.58.192.33])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090627cd00b0077826b92d99sm1287627ejc.12.2022.10.14.02.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 02:46:29 -0700 (PDT)
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
X-Inumbo-ID: 1467aa27-4ba5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/QgieFe04Q2SJKx9LehzMnVWzkhikXB3a9E3m0cIns=;
        b=K1HIsHX2VT1jItBGMSIsj6MT1z56SADs0lNYo+hnTLpkQbdBGVGw5vXDrk/vBmpKZY
         5AdEzMvMzd3xKjvubpbAvNIqgZ9Fl64+Q8AQ2fy1i+vynq8xf1CqOsD2/2W13KUgkpAs
         uzJqO+LoEC6Obxu638S3wyTu0xDcz2I8dKk+8+xQ8iVD2Bun4wx8pUipqeQccz9sMMjp
         wrE4CsqWrSQjUXaPAf96/ldFM7AoT4Ye0iQd2nDf29FVGi5sX8gSY91MA2bYPWm+Zbk5
         pCUAPb3FMUV4ZghqIQfOrG+6631KprF5xxapf3ehJMEs85/3cSNSUXAwckSAbBcDYkfh
         VGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/QgieFe04Q2SJKx9LehzMnVWzkhikXB3a9E3m0cIns=;
        b=gXuzBe4BtZVuMsFTW6FTSBhEs+tzuXYkrkSI5C2w/KmsSe+k02KbEi5Ssq4z89QHc0
         ivYx/mKZkZlte2vE2gOh2Ua+15Ov2PeK79Mm48lKABzWi563nGowHV50iBh09Gop32Wo
         N43X0clR+7M5AOhKuzgt33IYtyjr8H9O6/nRieIuHPAgomJvIveM44F/oED+11bWK0cz
         FvxLO3AvEcW+9+aP0ssGjyw2T7otc2tWCJInFDxh7Tq04tdwOd2XeJ6uTF+xyIikR4f7
         kKgbhPO61BpIVeBqLAUsnFmV4h9O/e7e0IbnbGCPLonWSdmK04HRde+jBTkD0LZPOgfk
         U1VA==
X-Gm-Message-State: ACrzQf2eeTj+YQBbYhR8cgLWQUxxQ8/FfF35ajKbbjH2rVgSHjGI2kh+
	Gus2isMUFfEKtLqzNJTr3vc=
X-Google-Smtp-Source: AMsMyM7Qe2slz11VfgUKivecRlyC7KjU1tt4NB0PoyTrtT078o3/loMsTrnp5qOX4eP7vPo0YLYd8Q==
X-Received: by 2002:a17:906:c152:b0:78d:9dbb:150b with SMTP id dp18-20020a170906c15200b0078d9dbb150bmr2838450ejc.542.1665740789890;
        Fri, 14 Oct 2022 02:46:29 -0700 (PDT)
Message-ID: <db3a487d-8330-fc68-8659-b6974352e7bc@gmail.com>
Date: Fri, 14 Oct 2022 12:46:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
 <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
 <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <05c4def0-321e-c864-7d92-b4dfe110d030@suse.com>
 <AS8PR08MB7991AD5D30E4EBADD0A7582592259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ccca7922-513d-3a9d-c994-f15c23e40812@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <ccca7922-513d-3a9d-c994-f15c23e40812@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/22 15:39, Julien Grall wrote:
> Hi,
> 
> On 13/10/2022 13:29, Henry Wang wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Assuming you have 4 (N) page table levels, isn't it 7 (1 + 2 * (N - 
>>>>> 1))?
>>>>> Or is the root table not taken from the p2m pool?
>>>>
>>>> Correct, on arm the root is not taken from the pool.
>>>
>>> Isn't that a (perhaps just minor) mistake?
>>
>> Not really, in the code review phase, the question of whether we include
>> the root in the p2m pool was discussed and the conclusion at that time
>> was not including this page for now, as this is supposed to require a lot
>> of extra work/refactor. Probably there will be a series from my side to
>> add the root to the pool, but at least not now.
> 
> The root page tables can be one of multiple concatenated pages (up to 8 
> pages). The P2M pool is allocating page by page and therefore wouldn't 
> allow us to allocate contiguous pages.

Sorry that I 'm asking this so late (I was just going through the 
thread) but why 8?

> 
> Therefore, we need to handle the root differently. At which point it 
> doesn't seem to be worth it to allocate it from the P2M pool.
> 
> Cheers,
> 

-- 
Xenia

