Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40296760660
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 05:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569344.889772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8QP-0001UM-PS; Tue, 25 Jul 2023 03:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569344.889772; Tue, 25 Jul 2023 03:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8QP-0001SQ-MI; Tue, 25 Jul 2023 03:09:25 +0000
Received: by outflank-mailman (input) for mailman id 569344;
 Tue, 25 Jul 2023 03:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+K8=DL=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qO8QO-0001SK-IG
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 03:09:24 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a76882fa-2a98-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 05:09:23 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-267711d2b43so714282a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 20:09:23 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 21-20020a17090a199500b002633fa95ac2sm9540001pji.13.2023.07.24.20.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:09:21 -0700 (PDT)
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
X-Inumbo-ID: a76882fa-2a98-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690254562; x=1690859362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
        b=T37460khNMPot0VVWdDz4lB6VWzVdicUBxVfz7CttLqrgD8g0MkXpwdKxm81+5qM3E
         yM+KFmnDFeQa0ZY5ZeNvvyumpxFJqPDg3oixgT5YKKGKOt9qmtbXs6vK0nUKy4kqsaDS
         iJ3utK1jXEfJapBrHYjK+SRbiAPBWHkzR4mO0jKk+qC4Stl39POzbhCCP4MwAtpmSso5
         ynGZ9erR4hLoA8pCdH+sRZpUbw1kMvKh2ycfFI2IzmOqd8Zq8Q0hlgUcK6mejCeashGS
         UzcYSPHM74qvjYTTAriMRhyDbW62IR+NfEc7uD2qj/U2RIYLpDl8fGFG28yoLGatJrqh
         GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690254562; x=1690859362;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLkcXzJjvvDBLgu5DbJbwRAKtejO8FK7VlKqBEYpGhg=;
        b=JGHD0aUE2+3jZ/GlNARM9v4a4dR2/cXHnFW3W1EhmXg0D4oy3Ur0srtMACM/da5L88
         D7dYszzxyz3km/nfafCHFGnr3yWKjns+ML2PmC3pmrHH3Pm++EJ7A5yyripe3tXKcAXV
         belGdXyKa1JsN8fLseh138JFIyd8Ba7C+F4+eb1lEoYwdCAGgA6582/2TuMickFx8Gcn
         YCvNAiogH0H/S5khJeNBJgm9BIo7A/6cS5SiSCW71zdRnZSFsZ1xzh5ngsVvSJaHk42I
         zOwqIIZkSZvmii6jFj5f1zHSlZnl52EFQkTW+quAQcL03GBrEGe2F3UNfyXJe5bogLQS
         vzaQ==
X-Gm-Message-State: ABy/qLbkqDl49y3p+mQViANta0u5ef9vfLE+RdxXsUAwbN9C90Fg+xf9
	1V3dbfu9aodYIscbyybgu48/eQ==
X-Google-Smtp-Source: APBJJlEruF0WFFXXZAOwcLJKfTF/P8Yek4Wx/bwgxp4VRr2IRHJr9OEk7izXq54CPTEEiNehAqKYyg==
X-Received: by 2002:a17:90a:50f:b0:263:730b:f568 with SMTP id h15-20020a17090a050f00b00263730bf568mr10246975pjh.3.1690254562043;
        Mon, 24 Jul 2023 20:09:22 -0700 (PDT)
Message-ID: <d2621ad0-8b99-9154-5ff5-509dec2f32a3@bytedance.com>
Date: Tue, 25 Jul 2023 11:09:07 +0800
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <97E80C37-8872-4C5A-A027-A0B35F39152A@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/25 10:35, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> The mm/vmscan.c file is too large, so separate the shrinker-related
>> code from it into a separate file. No functional changes.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> include/linux/shrinker.h |   3 +
>> mm/Makefile              |   4 +-
>> mm/shrinker.c            | 707 +++++++++++++++++++++++++++++++++++++++
>> mm/vmscan.c              | 701 --------------------------------------
>> 4 files changed, 712 insertions(+), 703 deletions(-)
>> create mode 100644 mm/shrinker.c
>>
>> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
>> index 224293b2dd06..961cb84e51f5 100644
>> --- a/include/linux/shrinker.h
>> +++ b/include/linux/shrinker.h
>> @@ -96,6 +96,9 @@ struct shrinker {
>>   */
>> #define SHRINKER_NONSLAB (1 << 3)
>>
>> +unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>> +			   int priority);
> 
> A good cleanup, vmscan.c is so huge.
> 
> I'd like to introduce a new header in mm/ directory and contains those
> declarations of functions (like this and other debug function in
> shrinker_debug.c) since they are used internally across mm.

How about putting them in the mm/internal.h file?

> 
> Thanks.
> 

