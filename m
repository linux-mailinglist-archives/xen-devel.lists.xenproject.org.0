Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF25ECA9F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 19:18:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412892.656350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odED7-0001mz-ER; Tue, 27 Sep 2022 17:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412892.656350; Tue, 27 Sep 2022 17:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odED7-0001kw-Bq; Tue, 27 Sep 2022 17:17:33 +0000
Received: by outflank-mailman (input) for mailman id 412892;
 Tue, 27 Sep 2022 17:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZUN=Z6=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1odED6-0001kq-QN
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 17:17:32 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4511fb45-3e88-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 19:17:31 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id cc5so16004474wrb.6
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 10:17:31 -0700 (PDT)
Received: from [192.168.8.100] (94.196.228.157.threembb.co.uk.
 [94.196.228.157]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c4e0500b003b339438733sm2507299wmq.19.2022.09.27.10.17.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 10:17:30 -0700 (PDT)
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
X-Inumbo-ID: 4511fb45-3e88-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gFJ/H+N6WAC6t6IyMR0gZxkOzHl2iN3HsUIPG8f/u4I=;
        b=L4/iTXFz7DuL5Uib4WIGjsIg0VrC7CXY9Nc3a6NaRVNsHglXDiLDyualTpBH2xBe4C
         NbHbXeBPxgHCg2zjPKSLOPE0Sx+LhUwzz7pp0Dp9YLLALpGgQYqFsEWeP2nObb9r3A0J
         JN/YeMF4UbQx3cskpQj0nbelj2yYEjpZlCyEanouYFiW5VOoN/SAc4hjNz4N1X/nUq2g
         TRifOA+0L3tNFcxDdUJASxezuirH17L9jRkrcMn1ujmRvAXJRQhZi6ik68pDy9zmmuCL
         fBixtkxBQPhzk0/an7ggX0q/eDguyIMRuNBjlWGO9qW19gRk00YQ540+09bEN/R85APk
         z8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gFJ/H+N6WAC6t6IyMR0gZxkOzHl2iN3HsUIPG8f/u4I=;
        b=XULXXR9rZhs5sI3VvchOnQvAOt29Pj5leqrE4D1Lc3fGM+Q1VBsddFF6vRTue15iIU
         3TJUdA+IKBOpVfrNRPDIlUZOLnuk/oulxWraz1G8rKrnKKAgl/fZ2Acd9mHd+6njJFtu
         NBTdH5WTtQsMT/MVvbNVRa9ARTO5qvM6ORPiTNogqhlWRUc74nBnyfXOTb1OYRF5sr5K
         oStap2Lg5gsiX7J6M4QXXUvAuAlI5vy04hZ1aPljo38qpaZKfMUJbf6Sr3UFBSzsI+Hs
         9Z0MB7BKG0ET3zsvvMTD+wMYoasmEMmtSNfU1TvammjAYE8OqUv7RJ39CECpXWkh+HRJ
         ZjGg==
X-Gm-Message-State: ACrzQf3eKp1z9PAJvskXLkEoRUkc+VURHLissevgRyBZalLrHQwwj7+0
	Gp484CAmKx0p/W7Hgn12Bck=
X-Google-Smtp-Source: AMsMyM4RKN4LBXcpsUki/a4beJoIwOEKU0REj/xTHR6CD5uBK9Mb1sJXwhpfSrm7yyiPg6HtYG8mfw==
X-Received: by 2002:adf:fa08:0:b0:228:c246:2a4b with SMTP id m8-20020adffa08000000b00228c2462a4bmr16991498wrr.630.1664299050980;
        Tue, 27 Sep 2022 10:17:30 -0700 (PDT)
Message-ID: <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
Date: Tue, 27 Sep 2022 18:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
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
In-Reply-To: <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/27/22 15:28, Pavel Begunkov wrote:
> Hello Paolo,
> 
> On 9/27/22 14:49, Paolo Abeni wrote:
>> Hello,
>>
>> On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
>>> struct ubuf_info is large but not all fields are needed for all
>>> cases. We have limited space in io_uring for it and large ubuf_info
>>> prevents some struct embedding, even though we use only a subset
>>> of the fields. It's also not very clean trying to use this typeless
>>> extra space.
>>>
>>> Shrink struct ubuf_info to only necessary fields used in generic paths,
>>> namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
>>> make MSG_ZEROCOPY and some other users to embed it into a larger struct
>>> ubuf_info_msgzc mimicking the former ubuf_info.
>>>
>>> Note, xen/vhost may also have some cleaning on top by creating
>>> new structs containing ubuf_info but with proper types.
>>
>> That sounds a bit scaring to me. If I read correctly, every uarg user
>> should check 'uarg->callback == msg_zerocopy_callback' before accessing
>> any 'extend' fields.
> 
> Providers of ubuf_info access those fields via callbacks and so already
> know the actual structure used. The net core, on the opposite, should
> keep it encapsulated and not touch them at all.
> 
> The series lists all places where we use extended fields just on the
> merit of stripping the structure of those fields and successfully
> building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
> again uses callbacks.
> 
> Sounds like the right direction for me. There is a couple of
> places where it might get type safer, i.e. adding types instead
> of void* in for struct tun_msg_ctl and getting rid of one macro
> hiding types in xen. But seems more like TODO for later.
> 
>> AFAICS the current code sometimes don't do the
>> explicit test because the condition is somewhat implied, which in turn
>> is quite hard to track.
>>
>> clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
>> before this series, and after will trigger an oops..
> 
> And now we don't have this field at all to access, considering that
> nobody blindly casts it.
> 
>> There is some noise due to uarg -> uarg_zc renaming which make the
>> series harder to review. Have you considered instead keeping the old
>> name and introducing a smaller 'struct ubuf_info_common'? the overall
>> code should be mostly the same, but it will avoid the above mentioned
>> noise.
> 
> I don't think there will be less noise this way, but let me try
> and see if I can get rid of some churn.

It doesn't look any better for me

TL;DR; This series converts only 3 users: tap, xen and MSG_ZEROCOPY
and doesn't touch core code. If we do ubuf_info_common though I'd need
to convert lots of places in skbuff.c and multiple places across
tcp/udp, which is much worse. And then I'd still need to touch all
users to do ubuf_info -> ubuf_info_common conversion and all in a
single commit to not break build.

If it's about naming, I can add a tree-wide renaming patch on top.

Paolo, I'd appreciate if you let know whether you're fine with it
or not, I don't want the series to get stuck. For bug concerns,
all places touching those optional fields are converted to
ubuf_info_msgzc, and I wouldn't say 4/4 is so bad.

-- 
Pavel Begunkov

