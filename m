Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A3786774
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 08:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589783.921815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ3ll-0005WX-GC; Thu, 24 Aug 2023 06:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589783.921815; Thu, 24 Aug 2023 06:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ3ll-0005Uq-DN; Thu, 24 Aug 2023 06:24:37 +0000
Received: by outflank-mailman (input) for mailman id 589783;
 Thu, 24 Aug 2023 06:24:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Lin=EJ=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qZ3li-0005Uk-PU
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 06:24:35 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1a9b9a8-4246-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 08:24:31 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68bbd45d0d5so331618b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 23:24:31 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 ey6-20020a056a0038c600b00686f048bb9dsm6577558pfb.74.2023.08.23.23.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 23:24:28 -0700 (PDT)
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
X-Inumbo-ID: e1a9b9a8-4246-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692858269; x=1693463069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAWLL6d+tB1TW/sa+M7W81IeOtWmeLLF2BjX95heF8Y=;
        b=WC7DtczIl2huODCCK2FUQBPFySR8Fgdq+0RzN3EpYCF6xc5qlgt5yYNUyGMzGD3Vfd
         sCmovMwZKx7eCaX+kb4GhOATxvPvZalq8HdXwztGZ/H374MK4JcYUpPJJsgpKNLIKxot
         DmBT4zE6v8oseL1JDCpoVcqcxZf5N5NE7wvMO3NRJDeqxBq3NCwRJPiax64qfPuWSob5
         mcJU3k0lorHBX5pSNWGBJw+GJKMZc4VAy8jbjqfXszKYvDjyOYUFsPD/PZLQycXFE2uX
         l6MCDqrZ3yavMHHn+nS97IILA+7i5RFenYBam2Bp94XJlGvvguZGUp/ZdPOc/jOY5cia
         xE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692858269; x=1693463069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAWLL6d+tB1TW/sa+M7W81IeOtWmeLLF2BjX95heF8Y=;
        b=TdugXXk7dzMjTrX8UEYVaPREdqC0Ft4dWNhKzUgFM7wPCU5LVVAPXDgUKBtbNUpIit
         CMidQahg+H0Y+8NsW8d0d213dyWtxaGl7rW1M0spf2hApHAWwgew/WQT9SY6RG55S/UA
         XKZqyRrUAh1mpllgewCky2msTRy4dnlnondkYw2KP1BX7liBlIstwF2yVjBuX1B7kmvd
         t9IPTNS+lXNv/77XU7fD5562TP10poOMaDgB07+NH8A1YrmLgq96n0L1evnkKtOZgnhD
         +MiIUMrgyM5ZFGjVugEjJIb0JizNcXuv34T5vhGGT6hzZ+Cu4d2cU3j3gXdTlU1r4iZv
         0npQ==
X-Gm-Message-State: AOJu0YzQUbkvmTQ2c6O6HgB6UegW0aEVeriU84t22qDuos8EgapgjT2R
	YmoqUloDY0XJ2SKyq/iOA8WCSg==
X-Google-Smtp-Source: AGHT+IEs+IcDk16YZ3T8sMPMS+c78NyGGAK7cNqbsAY3c0HgSGha1qj1+0CJyvlKa4AYIkTewnV0cA==
X-Received: by 2002:a05:6a20:8e19:b0:13e:1d49:723c with SMTP id y25-20020a056a208e1900b0013e1d49723cmr15644854pzj.2.1692858269010;
        Wed, 23 Aug 2023 23:24:29 -0700 (PDT)
Message-ID: <144fd7ac-154f-79b9-5483-56b15941f62f@bytedance.com>
Date: Thu, 24 Aug 2023 14:24:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v5 05/45] xenbus/backend: dynamically allocate the
 xen-backend shrinker
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230824034304.37411-1-zhengqi.arch@bytedance.com>
 <20230824034304.37411-6-zhengqi.arch@bytedance.com>
 <d07d52b1-6e6d-4b29-a9ce-7e325e7b1f11@suse.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d07d52b1-6e6d-4b29-a9ce-7e325e7b1f11@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 2023/8/24 14:00, Juergen Gross wrote:
> On 24.08.23 05:42, Qi Zheng wrote:
>> Use new APIs to dynamically allocate the xen-backend shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: xen-devel@lists.xenproject.org
> 
> Acked-by: Juergen Gross <jgross@suse.com>

Thanks for your review!

> 
> Just one note: it seems as if most users will set seeks to DEFAULT_SEEKS.
> Wouldn't it be better to do this in shrinker_alloc() and let only callers
> who want a different value overwrite that?

I think it makes sense, will do.

Thanks,
Qi

> 
> 
> Juergen

