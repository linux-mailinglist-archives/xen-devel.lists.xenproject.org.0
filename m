Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6815AB904
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 21:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397912.638636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUCjr-0007j3-C5; Fri, 02 Sep 2022 19:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397912.638636; Fri, 02 Sep 2022 19:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUCjr-0007h1-88; Fri, 02 Sep 2022 19:54:03 +0000
Received: by outflank-mailman (input) for mailman id 397912;
 Fri, 02 Sep 2022 19:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sPbf=ZF=kernel.dk=axboe@srs-se1.protection.inumbo.net>)
 id 1oUCjp-0007gs-7J
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 19:54:01 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc28bfd0-2af8-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 21:53:59 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso6451115pjh.5
 for <xen-devel@lists.xenproject.org>; Fri, 02 Sep 2022 12:53:59 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170902c1c600b00172ccb3f4ebsm2008369plc.160.2022.09.02.12.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Sep 2022 12:53:57 -0700 (PDT)
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
X-Inumbo-ID: fc28bfd0-2af8-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BgSQRPeP2vU+fzfPkC5136xUIsrQV+zIPc0zX8WqYvQ=;
        b=4q1ObG8WZYb+BFWPgZh7N7aITtmlNIGPzQtvKE2aYuRrU3oMZQ76tQz2zqxy31cTLt
         d8rIjpGYxzTxBhay1NPxlOw7vaD/UOVOLVL9kTH97EOmLP9jqiD95DNmZFsZ1Ptc8XmN
         SpoCT9nh9ECoUVn4HyZ7Qsn6ksQUfbOmmaLZNC8YNvNZJ0mYksYatinKwvYndzY1XvJm
         nky6nJQ50OCGfppKmlv+KompjFnK/xiaX17J7WZx+2ulxNlRcgnWzxkBWjasiiHjJ4Jl
         WgqrWN7XLOnHrvW9WLg3mCJ+/TAuDw9lCpZSCR3GLv/KhadF9BUUSKQnQ8/gjIX8jzxs
         EhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BgSQRPeP2vU+fzfPkC5136xUIsrQV+zIPc0zX8WqYvQ=;
        b=mIojooQogDCoZEgR6EODEX6Wtw+S6yp04ibQMLf1eubZN38bz3Yh8y3iERxyHeKaz9
         pGrB43xQP4FyK0kzKmDP4tZWAoJ8ZL7I5Ul0bhOEIlyGxZJzeqwV3myKdNWqir0H7gz1
         c5edMlWbmJOCNNbYy1aEAk1fsjI1QBsXGJ4mlGgx73RQFqTfn5G+90snsiUfjyOdYkNT
         VnXTHcU8Mpl240wipiLW6c80RokZ85V6j0QsF3ZZ5Vv7RK76YjWuySXqtLnxiEXZmatG
         KmJUWdtgKZhSMcLMCS7CZsPADuR+FcDUaTYDBWzCD4TvBcjQfFiRKxRzrxE6Fb1CUF7b
         vcsg==
X-Gm-Message-State: ACgBeo3/wrgME5/mk/7NnUcFGJJLLcSXvVmhs/4Ga2MwGZk1iCYsU/Hk
	oRN345oB/sisqrzgBDKjarFxXg==
X-Google-Smtp-Source: AA6agR5BylTPZ3Gegvy/NzTiavEg8hhtbTLj8aGfOurXCnjCbkfIWop802MX5aLKWWzJpm5rxypzOA==
X-Received: by 2002:a17:90b:b16:b0:1fd:b47c:6ab with SMTP id bf22-20020a17090b0b1600b001fdb47c06abmr6698292pjb.203.1662148438176;
        Fri, 02 Sep 2022 12:53:58 -0700 (PDT)
Message-ID: <d5526090-0380-a586-40e1-7b3bb6fe6fb8@kernel.dk>
Date: Fri, 2 Sep 2022 13:53:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Content-Language: en-US
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
 Yosry Ahmed <yosryahmed@google.com>, Michal Hocko <mhocko@suse.com>,
 Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>, dave@stgolabs.net,
 Matthew Wilcox <willy@infradead.org>, liam.howlett@oracle.com,
 void@manifault.com, juri.lelli@redhat.com, ldufour@linux.ibm.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, Steven Rostedt <rostedt@goodmis.org>,
 bsegall@google.com, bristot@redhat.com, vschneid@redhat.com,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com,
 glider@google.com, elver@google.com, dvyukov@google.com,
 Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>,
 arnd@arndb.de, jbaron@akamai.com, David Rientjes <rientjes@google.com>,
 minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
 Linux-MM <linux-mm@kvack.org>, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <CAJD7tkaev9B=UDYj2RL6pz-1454J8tv4gEr9y-2dnCksoLK0bw@mail.gmail.com>
 <YxExz+c1k3nbQMh4@P9FQF9L96D.corp.robot.car>
 <20220901223720.e4gudprscjtwltif@moria.home.lan>
 <YxE4BXw5i+BkxxD8@P9FQF9L96D.corp.robot.car>
 <20220902001747.qqsv2lzkuycffuqe@moria.home.lan>
 <YxFWrka+Wx0FfLXU@P9FQF9L96D.lan>
 <3a41b9fc-05f1-3f56-ecd0-70b9a2912a31@kernel.dk>
 <20220902194839.xqzgsoowous72jkz@moria.home.lan>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220902194839.xqzgsoowous72jkz@moria.home.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/2/22 1:48 PM, Kent Overstreet wrote:
> On Fri, Sep 02, 2022 at 06:02:12AM -0600, Jens Axboe wrote:
>> On 9/1/22 7:04 PM, Roman Gushchin wrote:
>>> On Thu, Sep 01, 2022 at 08:17:47PM -0400, Kent Overstreet wrote:
>>>> On Thu, Sep 01, 2022 at 03:53:57PM -0700, Roman Gushchin wrote:
>>>>> I'd suggest to run something like iperf on a fast hardware. And maybe some
>>>>> io_uring stuff too. These are two places which were historically most sensitive
>>>>> to the (kernel) memory accounting speed.
>>>>
>>>> I'm getting wildly inconsistent results with iperf.
>>>>
>>>> io_uring-echo-server and rust_echo_bench gets me:
>>>> Benchmarking: 127.0.0.1:12345
>>>> 50 clients, running 512 bytes, 60 sec.
>>>>
>>>> Without alloc tagging:	120547 request/sec
>>>> With:			116748 request/sec
>>>>
>>>> https://github.com/frevib/io_uring-echo-server
>>>> https://github.com/haraldh/rust_echo_bench
>>>>
>>>> How's that look to you? Close enough? :)
>>>
>>> Yes, this looks good (a bit too good).
>>>
>>> I'm not that familiar with io_uring, Jens and Pavel should have a better idea
>>> what and how to run (I know they've workarounded the kernel memory accounting
>>> because of the performance in the past, this is why I suspect it might be an
>>> issue here as well).
>>
>> io_uring isn't alloc+free intensive on a per request basis anymore, it
>> would not be a good benchmark if the goal is to check for regressions in
>> that area.
> 
> Good to know. The benchmark is still a TCP benchmark though, so still useful.
> 
> Matthew suggested
>   while true; do echo 1 >/tmp/foo; rm /tmp/foo; done
> 
> I ran that on tmpfs, and the numbers with and without alloc tagging were
> statistically equal - there was a fair amount of variation, it wasn't a super
> controlled test, anywhere from 38-41 seconds with 100000 iterations (and alloc
> tagging was some of the faster runs).
> 
> But with memcg off, it ran in 32-33 seconds. We're piggybacking on the same
> mechanism memcg uses for stashing per-object pointers, so it looks like that's
> the bigger cost.

I've complained about memcg accounting before, the slowness of it is why
io_uring works around it by caching. Anything we account we try NOT do
in the fast path because of it, the slowdown is considerable.

You care about efficiency now? I thought that was relegated to
irrelevant 10M IOPS cases.

-- 
Jens Axboe

