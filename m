Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC035A9B35
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396725.637001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlmq-0006CW-Be; Thu, 01 Sep 2022 15:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396725.637001; Thu, 01 Sep 2022 15:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlmq-00069d-8q; Thu, 01 Sep 2022 15:07:20 +0000
Received: by outflank-mailman (input) for mailman id 396725;
 Thu, 01 Sep 2022 15:07:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuHz=ZE=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1oTlmo-00069X-94
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:07:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c336c4d5-2a07-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 17:07:15 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-xZVN_o7tM8GA-eH8zf09NA-1; Thu, 01 Sep 2022 11:07:13 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so9988652wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 08:07:13 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:9e00:fec0:7e96:15cb:742?
 (p200300cbc7079e00fec07e9615cb0742.dip0.t-ipconnect.de.
 [2003:cb:c707:9e00:fec0:7e96:15cb:742])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm9303786wru.76.2022.09.01.08.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 08:07:09 -0700 (PDT)
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
X-Inumbo-ID: c336c4d5-2a07-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662044834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n51zgqgBl470PB0vgcZT4BRIRHbxoQSrqhNCiStba2E=;
	b=ObDiSLMfQ9MXDmrGnlC1LZZNZWle7oseddosLR97XfdCMFtq6NiEU84hrrYb+YIX+PVJ95
	lMwvk1ghQb+NVS3Q/a+XVJLVsH26CMN+7TkcbwgomSX2qCI1PUwBoHSpVpz7igyTQh4Sou
	4X/G4lPfE32Y+MmVTqFcZL1HZ3QkZEY=
X-MC-Unique: xZVN_o7tM8GA-eH8zf09NA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=n51zgqgBl470PB0vgcZT4BRIRHbxoQSrqhNCiStba2E=;
        b=dzzpvXOyPjeqLESS9FEyHH5VqIAr2JV0YT80SXaKkd6R47pory0tF0ST/BiySsTRrc
         V+Us2eAtGWDo7rJAjCv/dMQMKsVB2SkSw7LSQIIleK77HDytmy9IpuquMlwCk2TP5PwM
         c2IcTWAxdf1J0SDV875PSl2uV+2tblJO2nwa6PxKNkGCX5iM28CQhW0VWUEhx7cp7FPM
         LNIJEfQw8BrDlXjpRg0QOnX97xw2S/8Wna+v2mKvCNrk2a0kmAlW75u95q71heWRjoe8
         +sqkmx8/GzvgaKzanwyb9jLtFnwnXzEZK+wthVIfZOCA8r/gvdEjfq+N+b7XNI02IUUB
         uMwg==
X-Gm-Message-State: ACgBeo2bibmcFkHu4AGvZhLwsFcRR390XxRwu1mBjKiOtDgUR9BZyRQT
	1TxZxEUKcdqKJCsmSQDkOecTKZshPv8MjSNdle/YDBt8kI345XGsT4yI1Yr+c7ig0INpHJZv2xl
	cfRCcdMCoCsk8NQ2t0IIlPjKhyuI=
X-Received: by 2002:a7b:ce13:0:b0:3a6:34f8:e21d with SMTP id m19-20020a7bce13000000b003a634f8e21dmr5628133wmc.22.1662044831145;
        Thu, 01 Sep 2022 08:07:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4MsTHzosmA7E7hGiZjHmjlTUlB0s2DWeDkp38EpmRPnqXeJG3hehRWe5SqC6TIKnfqy7LhVg==
X-Received: by 2002:a7b:ce13:0:b0:3a6:34f8:e21d with SMTP id m19-20020a7bce13000000b003a634f8e21dmr5628080wmc.22.1662044830813;
        Thu, 01 Sep 2022 08:07:10 -0700 (PDT)
Message-ID: <78e55029-0eaf-b4b3-7e86-1086b97c60c6@redhat.com>
Date: Thu, 1 Sep 2022 17:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Michal Hocko <mhocko@suse.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, akpm@linux-foundation.org, vbabka@suse.cz,
 hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
 willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
 juri.lelli@redhat.com, ldufour@linux.ibm.com, peterx@redhat.com,
 axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
 iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
 elver@google.com, dvyukov@google.com, shakeelb@google.com,
 songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com,
 rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
 kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de> <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <404e947a-e1b2-0fae-8b4f-6f2e3ba6328d@redhat.com>
 <20220901142345.agkfp2d5lijdp6pt@moria.home.lan>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
In-Reply-To: <20220901142345.agkfp2d5lijdp6pt@moria.home.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.22 16:23, Kent Overstreet wrote:
> On Thu, Sep 01, 2022 at 10:05:03AM +0200, David Hildenbrand wrote:
>> On 31.08.22 21:01, Kent Overstreet wrote:
>>> On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
>>>> On Wed 31-08-22 11:19:48, Mel Gorman wrote:
>>>>> Whatever asking for an explanation as to why equivalent functionality
>>>>> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
>>>>
>>>> Fully agreed and this is especially true for a change this size
>>>> 77 files changed, 3406 insertions(+), 703 deletions(-)
>>>
>>> In the case of memory allocation accounting, you flat cannot do this with ftrace
>>> - you could maybe do a janky version that isn't fully accurate, much slower,
>>> more complicated for the developer to understand and debug and more complicated
>>> for the end user.
>>>
>>> But please, I invite anyone who's actually been doing this with ftrace to
>>> demonstrate otherwise.
>>>
>>> Ftrace just isn't the right tool for the job here - we're talking about adding
>>> per callsite accounting to some of the fastest fast paths in the kernel.
>>>
>>> And the size of the changes for memory allocation accounting are much more
>>> reasonable:
>>>  33 files changed, 623 insertions(+), 99 deletions(-)
>>>
>>> The code tagging library should exist anyways, it's been open coded half a dozen
>>> times in the kernel already.
>>
>> Hi Kent,
>>
>> independent of the other discussions, if it's open coded already, does
>> it make sense to factor that already-open-coded part out independently
>> of the remainder of the full series here?
> 
> It's discussed in the cover letter, that is exactly how the patch series is
> structured.

Skimming over the patches (that I was CCed on) and skimming over the
cover letter, I got the impression that everything after patch 7 is
introducing something new instead of refactoring something out.

>  
>> [I didn't immediately spot if this series also attempts already to
>> replace that open-coded part]
> 
> Uh huh.
> 
> Honestly, some days it feels like lkml is just as bad as slashdot, with people
> wanting to get in their two cents without actually reading...

... and of course you had to reply like that. I should just have learned
from my last upstream experience with you and kept you on my spam list.

Thanks, bye

-- 
Thanks,

David / dhildenb


