Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F835ECC69
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 20:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412930.656408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odFeR-0004uT-4v; Tue, 27 Sep 2022 18:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412930.656408; Tue, 27 Sep 2022 18:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odFeR-0004sB-2B; Tue, 27 Sep 2022 18:49:51 +0000
Received: by outflank-mailman (input) for mailman id 412930;
 Tue, 27 Sep 2022 18:49:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZUN=Z6=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1odFeP-0004s5-75
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 18:49:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28f8cd80-3e95-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 20:49:48 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so7600570wma.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 11:49:47 -0700 (PDT)
Received: from [192.168.8.100] (94.196.228.157.threembb.co.uk.
 [94.196.228.157]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff58a000000b002285f73f11dsm2848176wro.81.2022.09.27.11.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 11:49:46 -0700 (PDT)
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
X-Inumbo-ID: 28f8cd80-3e95-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Uy/Lr8Tfy+eWDjAiAzx45YwI3RpsjEElaf8OKPLhdUU=;
        b=CBghdfSs0ZPHWHMsOLsBnh5ZpxNT2s3g56DctsO8Mf9mTpDTB6p+jLVy8bOu2+/Gdf
         tHL+M2v6uQVCGGRhWriixY2hCCodfeT0NIK+rYSYcft3K607LdN7ljgevSDIHv+kB3Gr
         HMsq/7WpVUVStI31bLmpFEsfqmJoSciNbeX25w53xC6CZIpTPnuQqWDor1eo5aXCW7wo
         SZpbfEGfJ6MzmHDdU111Gj1BibSRBV7O+ut5u/8Y9GWObPkyxRBc09l85ScndiwvQ9n8
         YzhcWh35A87K/iIPqzydlaTmJwgvg0mI8E1jMY79EiCdwUXdWqrJ8HQb6RvUBox+QqTC
         T43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Uy/Lr8Tfy+eWDjAiAzx45YwI3RpsjEElaf8OKPLhdUU=;
        b=rFXaxLZ+Ze5bEMTAejY5+6k0PCssHocQThbSApO2KMYMtB97ZkarJvaqOheqYbKo78
         kdV8JFPS6xREkZ7LtE5V8umnDWkPwq1pZrsL5Pa1Wy/Qe1Qg6bBh64ObL/gdOu1WRyFr
         vKjhNiv28r1c84IXUwpyArkM6RpjClGh9brmaSsud90G+GppFP4cI96FUCtTfZJJx1PE
         q7ZkXVUwv3uAWdvI67k0CF1Dk7FZ0MrmuedCeF5mi6kWeOr+ELahrzlVKSY/1rYaMEAG
         FyikD5GTaz86NOHbUo5T7GqeyHxYQ5dIUbTHtQu+J1ufd5njxs2YSMmyWb/6FIMmET5E
         pb7A==
X-Gm-Message-State: ACrzQf0xJADdFFElonKYFBj4OiFb3iANokp2OGSQIJdQkD6KPfc8hgjt
	mRV0w/OZXIJuTV0ePZJW6mQ=
X-Google-Smtp-Source: AMsMyM5I8+ROinB1laAu4ZG/L6R5Rm2MX5ZivMTsJ4uvWRtjro0IKjNXqFxx0x9bEj5jkdygW04R1g==
X-Received: by 2002:a05:600c:3cd:b0:3b4:8372:294c with SMTP id z13-20020a05600c03cd00b003b48372294cmr3852346wmd.191.1664304587170;
        Tue, 27 Sep 2022 11:49:47 -0700 (PDT)
Message-ID: <c06897d4-4883-2756-87f9-9b10ab495c43@gmail.com>
Date: Tue, 27 Sep 2022 19:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
Content-Language: en-US
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
 <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
 <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
 <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
 <85cccb780608e830024fc82a8e4f703031646f4e.camel@redhat.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <85cccb780608e830024fc82a8e4f703031646f4e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/22 18:56, Paolo Abeni wrote:
> On Tue, 2022-09-27 at 18:16 +0100, Pavel Begunkov wrote:
>> On 9/27/22 15:28, Pavel Begunkov wrote:
>>> Hello Paolo,
>>>
>>> On 9/27/22 14:49, Paolo Abeni wrote:
>>>> Hello,
>>>>
>>>> On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
>>>>> struct ubuf_info is large but not all fields are needed for all
>>>>> cases. We have limited space in io_uring for it and large ubuf_info
>>>>> prevents some struct embedding, even though we use only a subset
>>>>> of the fields. It's also not very clean trying to use this typeless
>>>>> extra space.
>>>>>
>>>>> Shrink struct ubuf_info to only necessary fields used in generic paths,
>>>>> namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
>>>>> make MSG_ZEROCOPY and some other users to embed it into a larger struct
>>>>> ubuf_info_msgzc mimicking the former ubuf_info.
>>>>>
>>>>> Note, xen/vhost may also have some cleaning on top by creating
>>>>> new structs containing ubuf_info but with proper types.
>>>>
>>>> That sounds a bit scaring to me. If I read correctly, every uarg user
>>>> should check 'uarg->callback == msg_zerocopy_callback' before accessing
>>>> any 'extend' fields.
>>>
>>> Providers of ubuf_info access those fields via callbacks and so already
>>> know the actual structure used. The net core, on the opposite, should
>>> keep it encapsulated and not touch them at all.
>>>
>>> The series lists all places where we use extended fields just on the
>>> merit of stripping the structure of those fields and successfully
>>> building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
>>> again uses callbacks.
>>>
>>> Sounds like the right direction for me. There is a couple of
>>> places where it might get type safer, i.e. adding types instead
>>> of void* in for struct tun_msg_ctl and getting rid of one macro
>>> hiding types in xen. But seems more like TODO for later.
>>>
>>>> AFAICS the current code sometimes don't do the
>>>> explicit test because the condition is somewhat implied, which in turn
>>>> is quite hard to track.
>>>>
>>>> clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
>>>> before this series, and after will trigger an oops..
>>>
>>> And now we don't have this field at all to access, considering that
>>> nobody blindly casts it.
>>>
>>>> There is some noise due to uarg -> uarg_zc renaming which make the
>>>> series harder to review. Have you considered instead keeping the old
>>>> name and introducing a smaller 'struct ubuf_info_common'? the overall
>>>> code should be mostly the same, but it will avoid the above mentioned
>>>> noise.
>>>
>>> I don't think there will be less noise this way, but let me try
>>> and see if I can get rid of some churn.
>>
>> It doesn't look any better for me
>>
>> TL;DR; This series converts only 3 users: tap, xen and MSG_ZEROCOPY
>> and doesn't touch core code. If we do ubuf_info_common though I'd need
>> to convert lots of places in skbuff.c and multiple places across
>> tcp/udp, which is much worse.
> 
> Uhmm... I underlook the fact we must preserve the current accessors for
> the common fields.
> 
> I guess something like the following could do (completely untested,
> hopefully should illustrate the idea):
> 
> struct ubuf_info {
> 	struct_group_tagged(ubuf_info_common, common,
> 		void (*callback)(struct sk_buff *, struct ubuf_info *,
>                           bool zerocopy_success);
> 		refcount_t refcnt;
> 	        u8 flags;
> 	);
> 
> 	union {
>                  struct {
>                          unsigned long desc;
>                          void *ctx;
>                  };
>                  struct {
>                          u32 id;
>                          u16 len;
>                          u16 zerocopy:1;
>                          u32 bytelen;
>                  };
>          };
> 
>          struct mmpin {
>                  struct user_struct *user;
>                  unsigned int num_pg;
>          } mmp;
> };
> 
> Then you should be able to:
> - access ubuf_info->callback,
> - access the same field via ubuf_info->common.callback
> - declare variables as 'struct ubuf_info_commom' with appropriate
> contents.
> 
> WDYT?

Interesting, I didn't think about struct_group, this would
let to split patches better and would limit non-core changes.
But if the plan is to convert the core helpers to
ubuf_info_common, than I think it's still messier than changing
ubuf providers only.

I can do the exercise, but I don't really see what is the goal.
Let me ask this, if we forget for a second how diffs look,
do you care about which pair is going to be in the end?
ubuf_info_common/ubuf_info vs ubuf_info/ubuf_info_msgzc?
Are there you concerned about naming or is there more to it?

-- 
Pavel Begunkov

