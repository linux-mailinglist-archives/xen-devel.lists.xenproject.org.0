Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A981AFD1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 08:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658531.1027729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDpF-0004rL-PD; Thu, 21 Dec 2023 07:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658531.1027729; Thu, 21 Dec 2023 07:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGDpF-0004ph-MH; Thu, 21 Dec 2023 07:50:37 +0000
Received: by outflank-mailman (input) for mailman id 658531;
 Thu, 21 Dec 2023 07:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGDpE-0004oS-5i
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 07:50:36 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f224db0-9fd5-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 08:50:35 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d408c2908cso457105ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 23:50:35 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902c19500b001d0c3328a63sm972461pld.66.2023.12.20.23.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 23:50:33 -0800 (PST)
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
X-Inumbo-ID: 9f224db0-9fd5-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703145033; x=1703749833; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLUNEaNazWElk5LNvSjgKYQHnJmPtc7ll3wR32irQhE=;
        b=GmQ5DK12wzgI1eH0z/1q7Gc2j3oTNxzzYUeO1BeEfx7V/j7OcsPrxG7u3Xa+tX/dzO
         1bqL4L6L8Z2RsGLJVPOzytLLFLaegfXDzYwQtoWKVZcOyiiCkxXd8EZVKZ1pj3nbgS0R
         I3wM3xOye3CNnWWbnWUg0hoyS5omJh/0B+PcZklfS5z3xiiAj48AeeJc3XIXudC/mgJC
         FGumUdAvrPV8aGzZGSIj1ZeoehvIs23rKo9oU432By09pRAE89PGNURJvMNb6+4LSLfS
         g3QriijCYJaYMh2aib8D77Uav7snLG/T0xDO5clPG6o7gH5Hsg88DWVELc1Z+aYjBNdU
         xAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703145033; x=1703749833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLUNEaNazWElk5LNvSjgKYQHnJmPtc7ll3wR32irQhE=;
        b=aOLsYR7JUELMdduP8OaQ6pfciX1+HXgPi6o2Hfh0UKVXdmhfiDubMd+66TTojtXAf9
         5m17tsxVq5UNC3dXWWvPtfJTsFCBwvCBbCCnuMO4GRcln8dOjfZs9bowvhN7tgn2AsaC
         sZJYodYnvoqFzK7cfCJ3zETw8tL5nn5HqVqgRdGiQg2OLzZ5Y3YGrT7knxjjySc/NSMo
         Qb7pncM1J+jHIQJs1S3mskXF6aNQ8JYwMhXSziJ0AK1s8gnux8F2ksOcMd1LJJIMQX+W
         PllW0jJS16x/PHVJqx1nnMtFNicEoJJP+xOU3NgAwXf0Hp+NKxOqDze92V5mA24mHeoz
         +D7w==
X-Gm-Message-State: AOJu0YzgTGP7nv9g+g9znH79PfkQaNixEtn/NFd7dxX8e5bElBW14LOY
	pQJK9JivxB1Z3IzqK0/caadDgw==
X-Google-Smtp-Source: AGHT+IFRkKA+vhyi+S3UFsA8cjOfaflfAeEhCaGNiKFgvhAVyfdCpal5yYhxJ1UkT7WFGCcLiHX3CA==
X-Received: by 2002:a17:902:ea05:b0:1d3:bb5b:c51 with SMTP id s5-20020a170902ea0500b001d3bb5b0c51mr5088668plg.72.1703145033585;
        Wed, 20 Dec 2023 23:50:33 -0800 (PST)
Message-ID: <9fb98128-eada-4a50-996e-b442ce8035cd@daynix.com>
Date: Thu, 21 Dec 2023 16:50:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] softmmu/memory: enable automatic deallocation of
 memory regions
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Huang Rui
 <ray.huang@amd.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-7-ray.huang@amd.com>
 <a88696bc-2ffe-442a-a171-50e6120bbf97@daynix.com>
 <5dd37851-0b68-45ae-9843-9c1d6dc078f9@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <5dd37851-0b68-45ae-9843-9c1d6dc078f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/21 16:35, Xenia Ragiadakou wrote:
> 
> On 21/12/23 07:45, Akihiko Odaki wrote:
>> On 2023/12/19 16:53, Huang Rui wrote:
>>> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>>>
>>> When the memory region has a different life-cycle from that of her 
>>> parent,
>>> could be automatically released, once has been unparent and once all 
>>> of her
>>> references have gone away, via the object's free callback.
>>>
>>> However, currently, the address space subsystem keeps references to the
>>> memory region without first incrementing its object's reference count.
>>> As a result, the automatic deallocation of the object, not taking into
>>> account those references, results in use-after-free memory corruption.
>>>
>>> More specifically, reference to the memory region is kept in flatview
>>> ranges. If the reference count of the memory region is not incremented,
>>> flatview_destroy(), that is asynchronous, may be called after memory
>>> region's destruction. If the reference count of the memory region is
>>> incremented, memory region's destruction will take place after
>>> flatview_destroy() has released its references.
>>>
>>> This patch increases the reference count of an owned memory region 
>>> object
>>> on each memory_region_ref() and decreases it on each 
>>> memory_region_unref().
>>
>> Why not pass the memory region itself as the owner parameter of 
>> memory_region_init_ram_ptr()?
> 
> Hmm, in that case, how will it be guaranteed that the VirtIOGPU won't 
> disappear while the memory region is still in use?

You can object_ref() when you do memory_region_init_ram_ptr() and 
object_unref() when the memory region is being destroyed.

