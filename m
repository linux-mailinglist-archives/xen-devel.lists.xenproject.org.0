Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31F5EC618
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412659.656049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBbD-0003py-EO; Tue, 27 Sep 2022 14:30:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412659.656049; Tue, 27 Sep 2022 14:30:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBbD-0003mt-9h; Tue, 27 Sep 2022 14:30:15 +0000
Received: by outflank-mailman (input) for mailman id 412659;
 Tue, 27 Sep 2022 14:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sZUN=Z6=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1odBbB-0003lE-Cv
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:30:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4d071f9-3e70-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:30:11 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id n10so15247246wrw.12
 for <xen-devel@lists.xenproject.org>; Tue, 27 Sep 2022 07:30:12 -0700 (PDT)
Received: from [192.168.8.100] (94.196.228.157.threembb.co.uk.
 [94.196.228.157]) by smtp.gmail.com with ESMTPSA id
 a5-20020a05600c224500b003b4fac020c8sm14022447wmm.16.2022.09.27.07.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 07:30:11 -0700 (PDT)
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
X-Inumbo-ID: e4d071f9-3e70-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4qLPtvUWN+AfrLhyVfZ91N3yZnBEIddv2rouQHzCYLA=;
        b=LSvdUNSjYwsgaB1ny7A29I06dZuPVvZasJ53PSj2IRqPVKq1ohmeHh9Z6CkkhwtJQf
         85O+gH6Z/IdRrelbEU0k1mMXu+6fxxn2WMN9doOp+loYLAuRiKZyPsNuFdcRNJn8dsQ8
         lRGEVEdnN3VzNzjA7sb4HgBPlDNeuOXWP9VvdICO7KXryKqpFA3ehg94nCKxwk0Gpl0X
         I+5MDhB4PGTBCY6571kzJwU8c1BDIDcYu4PmD8hWvxk6btQMMwVeIkdHwp1kUu0xXGSI
         v+WsS2ry+SxZHb8HRxtcqqy322vcXEZOmSjORm3FjfTCAcEhB2XwEz0Q5vPUPRONX/Nv
         BdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4qLPtvUWN+AfrLhyVfZ91N3yZnBEIddv2rouQHzCYLA=;
        b=yKbPaVmI3ra8alejMA823aPQ0GoyAy+fW4kgd1y+MbwOgFvSX7Jaker6hl9nlH4/z+
         i6L+U8TaqJ09rmQSx2WkedvMN4ovLoJctEPGJTCFBzDbjGNS4hr25ZB3QO1uiz6IEmax
         VCbe0CvqE3h+kyp/fdeJKfcdTRVErK53Y/rYcg5AvFGEhpDT55ks//fgiOFO2UWRHH0g
         dqhFoRmh+8+39ki1P4von0wz4zGOuMgmSy/xLQtQGTfOPWg4t63K1QnWDYWJJvb5/aMR
         +TCYdLmfg4pd/ke33XwVD+pfy5z4F6ub8U5b4djJ8ThBlD66ArjEV4bBxPexHC9Fm9X0
         5X6w==
X-Gm-Message-State: ACrzQf3434KnLZpYDPQZ0qPfkgle62jqWJ/bMgNe/1oABtuc9a0xiHuo
	2HhdNiJF9OsucapBGjsAgBkZbl+m8Zw=
X-Google-Smtp-Source: AMsMyM7wIF7Q/yLHfL4qpto23LFzYlOodjB18WlyAhMXTZyo5ET7oeG7w+FroLjnnh5vWx2LP52ZzQ==
X-Received: by 2002:adf:f347:0:b0:22c:be39:4e38 with SMTP id e7-20020adff347000000b0022cbe394e38mr2077945wrp.151.1664289011650;
        Tue, 27 Sep 2022 07:30:11 -0700 (PDT)
Message-ID: <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
Date: Tue, 27 Sep 2022 15:28:34 +0100
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
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Paolo,

On 9/27/22 14:49, Paolo Abeni wrote:
> Hello,
> 
> On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
>> struct ubuf_info is large but not all fields are needed for all
>> cases. We have limited space in io_uring for it and large ubuf_info
>> prevents some struct embedding, even though we use only a subset
>> of the fields. It's also not very clean trying to use this typeless
>> extra space.
>>
>> Shrink struct ubuf_info to only necessary fields used in generic paths,
>> namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
>> make MSG_ZEROCOPY and some other users to embed it into a larger struct
>> ubuf_info_msgzc mimicking the former ubuf_info.
>>
>> Note, xen/vhost may also have some cleaning on top by creating
>> new structs containing ubuf_info but with proper types.
> 
> That sounds a bit scaring to me. If I read correctly, every uarg user
> should check 'uarg->callback == msg_zerocopy_callback' before accessing
> any 'extend' fields.

Providers of ubuf_info access those fields via callbacks and so already
know the actual structure used. The net core, on the opposite, should
keep it encapsulated and not touch them at all.

The series lists all places where we use extended fields just on the
merit of stripping the structure of those fields and successfully
building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
again uses callbacks.

Sounds like the right direction for me. There is a couple of
places where it might get type safer, i.e. adding types instead
of void* in for struct tun_msg_ctl and getting rid of one macro
hiding types in xen. But seems more like TODO for later.

> AFAICS the current code sometimes don't do the
> explicit test because the condition is somewhat implied, which in turn
> is quite hard to track.
> 
> clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
> before this series, and after will trigger an oops..

And now we don't have this field at all to access, considering that
nobody blindly casts it.

> There is some noise due to uarg -> uarg_zc renaming which make the
> series harder to review. Have you considered instead keeping the old
> name and introducing a smaller 'struct ubuf_info_common'? the overall
> code should be mostly the same, but it will avoid the above mentioned
> noise.

I don't think there will be less noise this way, but let me try
and see if I can get rid of some churn.

-- 
Pavel Begunkov

