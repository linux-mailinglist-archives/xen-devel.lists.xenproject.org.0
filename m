Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5F3057F6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 11:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75918.136885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hpL-0002Vn-6O; Wed, 27 Jan 2021 10:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75918.136885; Wed, 27 Jan 2021 10:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hpL-0002VP-2y; Wed, 27 Jan 2021 10:13:31 +0000
Received: by outflank-mailman (input) for mailman id 75918;
 Wed, 27 Jan 2021 10:13:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4hpJ-0002VK-8p
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 10:13:29 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c723dc63-5e9a-4376-8d12-ceaaaa6a592f;
 Wed, 27 Jan 2021 10:13:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f19so1412656ljn.5
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 02:13:28 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j20sm454653ljc.47.2021.01.27.02.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 02:13:26 -0800 (PST)
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
X-Inumbo-ID: c723dc63-5e9a-4376-8d12-ceaaaa6a592f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=iaK+Vt8sTfVXUflYNwjUsIAmHrTK+lmXqg3dQohnBTU=;
        b=gPPjQODL/k14TX/ylzY2WE2UyNd/ntlgy/AnW9wn1kZdzBMUW1P6c1fCsPVkx/4uvq
         d1ENyvkQehb2KqOQzk3yrbrehpawnuQ9KKb1Vcma7/xMER8kUG/A1jZ21B6ecMwSt1xk
         nHBLSNwoWlEnoqQKYtcXLG7oO/r1qoCvbXRF2yL52wclz0f8eslhdPhAUC7hMs6IbKzi
         RoPjTvWVWA3dEsxIVgdIXcANXMv7hIG39capfbEr5adjKKr5vEzWiKRv+aPXv/baHbYv
         rs8F3Expm9VG9tMKL1ZvWan3ZGT12FGLuVVvVkqEFjtOtk4PiAwwelX5IzGTTwPuVP7y
         po8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iaK+Vt8sTfVXUflYNwjUsIAmHrTK+lmXqg3dQohnBTU=;
        b=VP8zJJ5L8dYAMuXSr2hQzIfyabahU7Nnan8+cOEchfZd2FSLOZR3LtDIvdrlPGQTc9
         kjESJuIQ7Lu2t4k9n/fZE0zKKGkVOdu5h2t+JdBmxsuIUpQPZrt1UnyLW4o8cTGYMEPo
         o/Xw4ns7Z6UIXfsD77Bn6vT2LZ6DkKQeeUog3zwIMfgzLBfeu6S2c+FwIZyjISHevaVz
         tAmCxcfglCFYByZ6OaU9swfTDCgZ2xDyvsvYZwT4pIk79GG7jtk+YgQF1q1M3ButRP7v
         Qwbi4PL/YobvgRSJEqMl/JkW206jMW+sGeV5ft4krAjaTx7iN5mGidXDTw8AoGIZpwrN
         G+yA==
X-Gm-Message-State: AOAM533QTUBtUlZXLKfnul+1Q4S6sUMXpJjns0gEkIIFWpg/viiR0++f
	fSlJCoW0YnbcxI6y0Ir3L4w=
X-Google-Smtp-Source: ABdhPJwua+FBEPq2ZA2nwgzqii8yCUlljsfOvi7We5EDLqLfZPqMO+ua20xHXz9SWPeuA1kSQky+ZQ==
X-Received: by 2002:a2e:5016:: with SMTP id e22mr2242196ljb.166.1611742407254;
        Wed, 27 Jan 2021 02:13:27 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, famzheng@amazon.com,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <161160798888.13183.15031685460985886988@c667a6b167f6>
 <alpine.DEB.2.21.2101251255430.20638@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2YpESuHGfZXoRTGj5mxhwar37Na3eYkX90QffYKf1r1Q@mail.gmail.com>
 <a277d66a-0bb4-22ea-badb-c3f415a5d09f@gmail.com>
Message-ID: <e305357a-2c2c-7e48-7cdf-9bce97db6b4c@gmail.com>
Date: Wed, 27 Jan 2021 12:13:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a277d66a-0bb4-22ea-badb-c3f415a5d09f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 26.01.21 02:14, Oleksandr wrote:

Hello, all

>
> On 26.01.21 01:20, Julien Grall wrote:
>
> Hi Julien, Stefano
>
>> On Mon, 25 Jan 2021 at 20:56, Stefano Stabellini 
>> <sstabellini@kernel.org> wrote:
>>> Julien,
>> Hi,
>>
>>> This seems to be an arm randconfig failure:
>>>
>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/246632953
>>> https://gitlab.com/xen-project/patchew/xen/-/jobs/985455044
>> Thanks! The error is:
>>
>> #'target_mem_ref' not supported by expression#'memory.c: In function
>> 'do_memory_op':
>> memory.c:1210:18: error:  may be used uninitialized in this function
>> [-Werror=maybe-uninitialized]
>>   1210 |             rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   1211 | _mfn(mfn_list[i]));
>>        | ~~~~~~~~~~~~~~~~~~
>>
>> I found a few references online of the error message, but it is not
>> clear what it means. From a quick look at Oleksandr's branch, I also
>> can't spot anything unitialized. Any ideas?
> It seems that error happens if *both* CONFIG_GRANT_TABLE and 
> CONFIG_IOREQ_SERVER are disabled. Looks like that mfn_list is 
> initialized either in acquire_grant_table() or in acquire_ioreq_server().
> If these options disabled then corresponding helpers are just stubs, 
> so indeed that mfn_list gets uninitialized. But, I am not sure why gcc 
> complains about it as set_foreign_p2m_entry() is *not* going to be 
> called in that case???

This weird build error goes away if I simply add:

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 33296e6..d1bd57b 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1136,7 +1136,7 @@ static int acquire_resource(
       * moment since they are small, but if they need to grow in future
       * use-cases then per-CPU arrays or heap allocations may be required.
       */
-    xen_pfn_t mfn_list[32];
+    xen_pfn_t mfn_list[32] = {0};
      int rc;

      if ( !arch_acquire_resource_check(currd) )


Shall I make the corresponding patch?
But it is still unclear to me why the compiler doesn't recognize that 
*non-yet-uninitialized* mfn_list[] won't be used if both 
CONFIG_GRANT_TABLE and CONFIG_IOREQ_SERVER are not set...


-- 
Regards,

Oleksandr Tyshchenko


