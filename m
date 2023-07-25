Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FD87606A9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 05:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569351.889783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8ie-0003x9-CF; Tue, 25 Jul 2023 03:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569351.889783; Tue, 25 Jul 2023 03:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8ie-0003uX-92; Tue, 25 Jul 2023 03:28:16 +0000
Received: by outflank-mailman (input) for mailman id 569351;
 Tue, 25 Jul 2023 03:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+K8=DL=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qO8ic-0003uR-N9
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 03:28:15 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ea8840-2a9b-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 05:28:11 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso1181695b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 20:28:11 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 s3-20020aa78283000000b00682a9325ffcsm8407714pfm.5.2023.07.24.20.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:28:10 -0700 (PDT)
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
X-Inumbo-ID: 47ea8840-2a9b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690255690; x=1690860490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=;
        b=PknHptOa2Z8+2vaclzexjcjHcgGTKnQ0JRJ89LK+GvkJZyUzNmFYDaw4LaxhrbAB97
         Qlt49eA21cgLfip1YkLzQvNHl9NRE1uu+H3yLMzr5GUQw2R94ASja3LKRc7K2/IuJ877
         /rUQws3HOX4h/pSV0QLIC/txctttQBZDy4goWlpNGxYwzk8J6CttdGDNpskz9IiWFE6E
         W06R7YBvAlwN2Ll/k0WZ+e8J2UJKgy2rlagtK3lUaqPgpyCrwLsDTNoP/0MXBrAUaLK4
         fe8VXE6m3BmotnBeZ7KmASyzpGnPX5FsNzpJdMUNn5TjD0dfcmx5lygJuqraNOT+sjor
         yB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690255690; x=1690860490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wY4cILkEhsrpRf+mNddP0nleKOSU9sayj8Z5h0ToXM=;
        b=JsIYdUKGimVX5XBd+GVVNhsp/VWMfCmRpjUuJyMFDOurNgEUmIcdGPoqlYS3gybF6n
         cUFl30dOZNdpJqG+EJQ60v8OkbSJ0ZkdNJb/Ki4G6soATAbRZcrZ3p1GXwWm/YYi49Ny
         p3F+EKg4TPp7lsQ9qA0c5MqLzw0RsrkUoRc8RIr5jpw2SIcpePbGAObRgyn0H+LzhyGK
         k3i/q+8GQ9KkXF63nGzGk5DFQ8puUjn0hFLFil4P+7YsEKWajpUJ2+XuCbw1Nv76sDPb
         Nk8YfMwAVV3+PcN/33PZ5ohWBCly7zyLGZvc+decM8LNu9rdGX2rJ5SfIT5uA5qoP0A5
         APcA==
X-Gm-Message-State: ABy/qLYYPVzwGKCk2Weq9fLjNk+DX3NOiaYjH3uI001fWAMwX5wa45XW
	yYGSTGfLsnMF06vHngDTMpAWsA==
X-Google-Smtp-Source: APBJJlHvnzRChS6v/nee9rDGEWxm9C29UVXVwYKOSH3HP5ue/guAsHAKmcdiSeukVqd30tCkGAz2cw==
X-Received: by 2002:a05:6a00:cd1:b0:677:bb4c:c321 with SMTP id b17-20020a056a000cd100b00677bb4cc321mr15272930pfv.0.1690255690395;
        Mon, 24 Jul 2023 20:28:10 -0700 (PDT)
Message-ID: <bbd36d96-b6b8-08c3-1092-e3d0b255134a@bytedance.com>
Date: Tue, 25 Jul 2023 11:27:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/47] mm: vmscan: move shrinker-related code into a
 separate file
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@fromorbit.com,
 tkhai@ya.ru, Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>, djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, yujie.liu@intel.com,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-2-zhengqi.arch@bytedance.com>
 <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
 <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
 <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <6FE62F56-1B4E-4E2A-BEA9-0DA6907A2FA9@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/25 11:23, Muchun Song wrote:
> 
> 
>> On Jul 25, 2023, at 11:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>>
>>
>> On 2023/7/25 10:35, Muchun Song wrote:
>>>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>>>
>>>> The mm/vmscan.c file is too large, so separate the shrinker-related
>>>> code from it into a separate file. No functional changes.
>>>>
>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>> ---
>>>> include/linux/shrinker.h |   3 +
>>>> mm/Makefile              |   4 +-
>>>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>>>> mm/vmscan.c              | 701 --------------------------------------
>>>> 4 files changed, 712 insertions(+), 703 deletions(-)
>>>> create mode 100644 mm/shrinker.c
>>>>
>>>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>>>> index 224293b2dd06..961cb84e51f5 100644
>>>> --- a/include/linux/shrinker.h
>>>> +++ b/include/linux/shrinker.h
>>>> @@ -96,6 +96,9 @@ struct shrinker {
>>>>   */
>>>> #define SHRINKER_NONSLAB (1 << 3)
>>>>
>>>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>>>> +    int priority);
>>> A good cleanup, vmscan.c is so huge.
>>> I'd like to introduce a new header in mm/ directory and contains those
>>> declarations of functions (like this and other debug function in
>>> shrinker_debug.c) since they are used internally across mm.
>>
>> How about putting them in the mm/internal.h file?
> 
> Either is fine to me.

OK, will do in the next version.

> 
>>
>>> Thanks.
> 
> 

