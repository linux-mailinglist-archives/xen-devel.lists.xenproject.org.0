Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629C5A9190
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 10:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396318.636416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTfCM-00046b-CK; Thu, 01 Sep 2022 08:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396318.636416; Thu, 01 Sep 2022 08:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTfCM-00044j-9f; Thu, 01 Sep 2022 08:05:14 +0000
Received: by outflank-mailman (input) for mailman id 396318;
 Thu, 01 Sep 2022 08:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuHz=ZE=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1oTfCK-00044b-W2
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 08:05:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf2f8c7-29cc-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 10:05:11 +0200 (CEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-u-dYLgivMEqUsEiZhqSvVg-1; Thu, 01 Sep 2022 04:05:07 -0400
Received: by mail-wr1-f69.google.com with SMTP id
 h3-20020adfa4c3000000b002266f5ef273so2827227wrb.14
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 01:05:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:9e00:fec0:7e96:15cb:742?
 (p200300cbc7079e00fec07e9615cb0742.dip0.t-ipconnect.de.
 [2003:cb:c707:9e00:fec0:7e96:15cb:742])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adff908000000b00223a50b1be8sm14023827wrr.50.2022.09.01.01.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:05:05 -0700 (PDT)
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
X-Inumbo-ID: ccf2f8c7-29cc-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662019510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAYRQilXBeVPqddsxUYpdqrwWan1aH9ZFdN7uQibkcg=;
	b=CKGQGhYp0OzEWICOOMjhOTqvbuhCf81dUcj+HORrFde1xoDrqG7bxLijd7CbyWwddRQBxp
	av5qudocy7U2fL1sRN5Taf1MMLFggXVgi2qJ16L+FKfD0deyuWNJkD/L8IykcF/cW+oaUI
	jq7FU0r3tZlDSVigYNuvYFTHc5D//KQ=
X-MC-Unique: u-dYLgivMEqUsEiZhqSvVg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=fAYRQilXBeVPqddsxUYpdqrwWan1aH9ZFdN7uQibkcg=;
        b=yncPs2ggaDz3a0ElvM+zG8RVmECk6zb9gfxTF5vuGNSuO/a1C6zbjGUISotsbgrRjj
         L4LKx1RZ8PlU8z9Ps/unsrayGh0Zl7ux/G7T0d1XsWZ4n4HxOttuXYILSeljsaHa0/V4
         A/U/jdsxbZ1cJQUMnpiQfobyn9sJvh+ZhdyL/9JZjJWTa9oiqa4d/SiJWx/iusI4jxqV
         BQo+3xjs0AMPxGFR8vj3ZfTNkz4d5ORDyIVWrXFMFoCWJSoGQdAHPwmf7QVm0DVt8CBp
         kBOc47MNYlCDxIvQ/zDKsth1zijxNRxrVdHXSgbW+/RJwaLe5WYGFK0B60vnOljRsAGb
         bEWw==
X-Gm-Message-State: ACgBeo1qISlkQ/qg0GCNlzjhpx40WAoYv6Ftq7UVpVYqB+p1OiUvCGfh
	MQIX6kSk9EuP/BBPzrLsoC2TWH5t+IJFkaXYKJ3O2nXd+s1MmN2sJfau5EFBIUqY0YwddHy8J7f
	yTzLzeNzTVzDyfB4xZe5TwcvKuK0=
X-Received: by 2002:a05:6000:1e02:b0:226:f21c:e192 with SMTP id bj2-20020a0560001e0200b00226f21ce192mr2042384wrb.7.1662019506249;
        Thu, 01 Sep 2022 01:05:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5QM6ydwWB1hA+IwFTy9+Av+xz2gk8FSGg7uVj19TAsR85EeUD5rGAvr1bryTm2SFDb+vhc5g==
X-Received: by 2002:a05:6000:1e02:b0:226:f21c:e192 with SMTP id bj2-20020a0560001e0200b00226f21ce192mr2042345wrb.7.1662019505980;
        Thu, 01 Sep 2022 01:05:05 -0700 (PDT)
Message-ID: <404e947a-e1b2-0fae-8b4f-6f2e3ba6328d@redhat.com>
Date: Thu, 1 Sep 2022 10:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Kent Overstreet <kent.overstreet@linux.dev>,
 Michal Hocko <mhocko@suse.com>
Cc: Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
 vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
 dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
 void@manifault.com, juri.lelli@redhat.com, ldufour@linux.ibm.com,
 peterx@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
 penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
 glider@google.com, elver@google.com, dvyukov@google.com,
 shakeelb@google.com, songmuchun@bytedance.com, arnd@arndb.de,
 jbaron@akamai.com, rientjes@google.com, minchan@google.com,
 kaleshsingh@google.com, kernel-team@android.com, linux-mm@kvack.org,
 iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
 linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de> <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
In-Reply-To: <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.08.22 21:01, Kent Overstreet wrote:
> On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
>> On Wed 31-08-22 11:19:48, Mel Gorman wrote:
>>> Whatever asking for an explanation as to why equivalent functionality
>>> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
>>
>> Fully agreed and this is especially true for a change this size
>> 77 files changed, 3406 insertions(+), 703 deletions(-)
> 
> In the case of memory allocation accounting, you flat cannot do this with ftrace
> - you could maybe do a janky version that isn't fully accurate, much slower,
> more complicated for the developer to understand and debug and more complicated
> for the end user.
> 
> But please, I invite anyone who's actually been doing this with ftrace to
> demonstrate otherwise.
> 
> Ftrace just isn't the right tool for the job here - we're talking about adding
> per callsite accounting to some of the fastest fast paths in the kernel.
> 
> And the size of the changes for memory allocation accounting are much more
> reasonable:
>  33 files changed, 623 insertions(+), 99 deletions(-)
> 
> The code tagging library should exist anyways, it's been open coded half a dozen
> times in the kernel already.

Hi Kent,

independent of the other discussions, if it's open coded already, does
it make sense to factor that already-open-coded part out independently
of the remainder of the full series here?

[I didn't immediately spot if this series also attempts already to
replace that open-coded part]

-- 
Thanks,

David / dhildenb


