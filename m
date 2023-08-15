Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72777CA28
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 11:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583935.914281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVq8q-0008PQ-6S; Tue, 15 Aug 2023 09:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583935.914281; Tue, 15 Aug 2023 09:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVq8q-0008Ng-3o; Tue, 15 Aug 2023 09:15:08 +0000
Received: by outflank-mailman (input) for mailman id 583935;
 Tue, 15 Aug 2023 09:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vtqw=EA=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qVq8o-0008Na-25
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 09:15:06 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3711391e-3b4c-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 11:15:03 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bb91c20602so9096645ad.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Aug 2023 02:15:03 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 io13-20020a17090312cd00b001b39ffff838sm10630843plb.25.2023.08.15.02.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
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
X-Inumbo-ID: 3711391e-3b4c-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692090901; x=1692695701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
        b=B4NWnukFtWBpBFBooLjjX+4xRi6cYrfaI8iegReeVzLQWKPXXt1CxHdKL4/tZ0fNPM
         0UExtQR6YZe58qkKHpbXtHQV0uPapic2RYOUTB+6Pi7LdOE1C7GEcaF7+zgpTtYtD/de
         UlP+/TDXrfMVghqI9OT3wDmB4f+60Ecld4ptmi3g4OGE44+/xTS+dFaCetp2KrysicqF
         +aYy3xTBT6yAIsFwZB/EdPqMFUGo82MatiM8ko8K8L/pW/bDYDRzwOeVlfM6AvdWPq+b
         HcGAAnq5GXzxPWbDmjMNdTVLUEtTfSjxZmvfFI4JrMMNezs7y6COdvHcs3klmaxHW6vC
         FHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692090901; x=1692695701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6UPah3rxy6GE+IW6hhaEXFukV19/RQgo9PDGSDaxjc=;
        b=WRpC7emADzGxGir9vE/6Ln3oRWmHV7cAEV3tzXLHLflqxbCDCHRDKdlHwK+IC+G2Td
         d5vsntvArbSZLr4IzEv7/ck4kGRVHXhwt2ODttlw9d84+REORS77sgNMQLghliqVzJZD
         xf5doM90vItC3BwdSRilHrT5exgHNh/cjsDM7jSDq2aCL7OruvQwNm15wgMr4uQZOR1N
         id4QZk4EIgOSb5111PahZwTsRcI4/uX1MvDgblMB9sYphul6y4FvGtBFceBK3HO5cW2Q
         9sEBCn/6pWDWa5qouvPw0ui6YAR1FKpsCEs4f+pOo1UX+BkpU+qjLU7Z4mgQgYMliIqf
         QqBg==
X-Gm-Message-State: AOJu0YwMR6QwvymPFUhBFo5K1lH5g2zBriUQqjvpmrJI+PYIf74wxzaS
	rKjutgHoP+gIW7TJ4CF3kfPZ2w==
X-Google-Smtp-Source: AGHT+IGKaQyK0d17VyjHV7p/Fr8yAF+2JMAJsl65uoihXD9UcmAUSi1eF134pFnOBdZUKl9ThFMr5Q==
X-Received: by 2002:a17:902:e5c8:b0:1bb:83ec:832 with SMTP id u8-20020a170902e5c800b001bb83ec0832mr13866844plf.2.1692090901535;
        Tue, 15 Aug 2023 02:15:01 -0700 (PDT)
Message-ID: <4f64cd2d-90e8-7902-7ef7-1ac58d51b2a8@bytedance.com>
Date: Tue, 15 Aug 2023 17:14:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v4 01/48] mm: move some shrinker-related function
 declarations to mm/internal.h
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@fromorbit.com,
 tkhai@ya.ru, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>, djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, yujie.liu@intel.com,
 Greg KH <gregkh@linuxfoundation.org>, simon.horman@corigine.com,
 dlemoal@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, x86@kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-2-zhengqi.arch@bytedance.com>
 <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <FC3AE898-443D-4ACB-BCB4-0F8F2F48CDD0@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/8/15 16:36, Muchun Song wrote:
> 
> 
>> On Aug 7, 2023, at 19:08, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The following functions are only used inside the mm subsystem, so it's
>> better to move their declarations to the mm/internal.h file.
>>
>> 1. shrinker_debugfs_add()
>> 2. shrinker_debugfs_detach()
>> 3. shrinker_debugfs_remove()
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> One nit bellow.
> 
> [...]
> 
>> +
>> +/*
>> + * shrinker related functions
>> + */
> 
> This is a multi-comment format. "/* shrinker related functions. */" is
> the right one-line format of comment.

Will do.

Thanks,
Qi

> 
>> +
>> +#ifdef CONFIG_SHRINKER_DEBUG
>> +extern int shrinker_debugfs_add(struct shrinker *shrinker);
>> +extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +      int *debugfs_id);
>> +extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +    int debugfs_id);
>> +#else /* CONFIG_SHRINKER_DEBUG */
>> +static inline int shrinker_debugfs_add(struct shrinker *shrinker)
>> +{
>> +	return 0;
>> +}
>> +static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>> +     int *debugfs_id)
>> +{
>> +	*debugfs_id = -1;
>> +	return NULL;
>> +}
>> +static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
>> +	int debugfs_id)
>> +{
>> +}
>> +#endif /* CONFIG_SHRINKER_DEBUG */
>> +
>> #endif /* __MM_INTERNAL_H */
>> -- 
>> 2.30.2
>>
> 

