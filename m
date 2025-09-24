Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038EB9A6D4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 17:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129472.1469415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Qz6-00056K-Kz; Wed, 24 Sep 2025 15:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129472.1469415; Wed, 24 Sep 2025 15:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Qz6-00054k-IC; Wed, 24 Sep 2025 15:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1129472;
 Wed, 24 Sep 2025 15:00:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CQP=4D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1Qz5-00054e-5A
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 15:00:43 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cc0982a-9957-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 17:00:41 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3194020e86so239496166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 08:00:41 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fcfe88bc3sm1518750466b.51.2025.09.24.08.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 08:00:37 -0700 (PDT)
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
X-Inumbo-ID: 3cc0982a-9957-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758726040; x=1759330840; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zOkKFPq4CC24R3bi95T/aso0CoAmoXY+s+fWRaSHdo=;
        b=NfJ7WowCLDrSrgYPXfo/30bz1aUA38UWOJ1DoLVFuwG+Li83vQfz+wlVD7jsxzX10H
         7NWPUhoPotrMngecIquKW84M8b10TAfcxwTsHvwk2sjjIQ0KDBqzenC9bVe6T1EqTZac
         LQn4mWzRKCr0Q7nIhFJ7yACf3+241nyGe8lch2HXBuasqpRBQNupRIytYVigPVoekiLA
         l5HB+qT4C7gpfBPvMU0xYixCqTa6F+PAWntGR8wAtKzs6mEPFz9FshQ5GO1iUv1B+p5m
         NRk/Fmt4qHTaRaoZAQjToKxn0Rh2RcwfCMFfg2tBatIzbM0lyhZsL291gkKXbe136BsL
         gTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726040; x=1759330840;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9zOkKFPq4CC24R3bi95T/aso0CoAmoXY+s+fWRaSHdo=;
        b=gdBI4b0cJxbqvpeShw04HmlT7Z6LcFDIYhH0J4F+4Njr4K3K7e0/EPPypbOPFmEVZF
         8/l6jz5gwBLvbbIc87YUCOouz7jTyVd6f1XnJvJV3GZOxrFvmrQ9fLM+0zpQMxuBC0RL
         AnDBZBGI5XfGWxE6PO1u8jeCP72dfoElAmjDQFby2CncU1m1MnnkoN+SGdMghsT5tCTk
         yCE7SumX4FB1m8HqnyI1vqXzlMyriQJFmqqtfCvZHIDQQGIt/5+QVcmiM1Xsudl+tVfu
         7YvOGnHpin8QupuekEVDRsl3ASIXl5u4hM2n8mtdBbxd1tqFSQ7IVZJgb9PMAwY7DJT1
         9JMg==
X-Forwarded-Encrypted: i=1; AJvYcCW0cxx3RcXIUoifXN7uzTYnYkPyhxKDgMN6BYxC/s0iJkBgKyVSumIn4UThzHtIcFECNt4OuR1A+3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcBKWJSzdtPAxN8Pl/GoFrT5Jgrot/Vxnbv7NB3cBvcejw3+u0
	6iqN/AchRHExT8jCXq1cJznCxtnfB1fqCvBatmrAovTLAuXCy7mBgXIM
X-Gm-Gg: ASbGnct0+d2ZZepVWsaO8Ym/3e47oNFskPMEpQwYZVCfdherp9b6XSeAFvTyx5I7u/W
	egUChetOjD6fctRbfM5Tat8Gwk7KW1ngIF/142m17f2ckz/ssSV3QGVe6jz6IqztIuMUlTos2Lr
	xYi0thQ6KKtb72Kx7XkcWcPhisLbTh1RfprQ7rb+6w27xFGekGbGl0+fccfmh5FKRKeo2EIH3Xh
	6U38BGp5D5JpuUBfpDS3uYOzg2TxRpwPIsS6w8Uvquluv4u8NxD268ClPQrgL0RyGucg8T/emTY
	1L7JsWd9Cqb0c6/IZl1Fjq332c7Y8N6QC6ihijms3tCMJbR8gwAL7ig34PfEhdsOxzjLmP9JuPL
	qUquucX+OAsxzww/AFb+mr14ckKSESabUqVBEQSzxgTcZM8I1iZZ4mPf4156jQUxtFADOTDIN
X-Google-Smtp-Source: AGHT+IFZSGZ4L39d/bFsUa7gfK4s2fgyR+7IytjjyOq+2DiRCwBG+WQwRM2iby6cLJCKX1qmiLXOtA==
X-Received: by 2002:a17:906:6a13:b0:aff:9906:e452 with SMTP id a640c23a62f3a-b34bbbd9a07mr13896166b.31.1758726040063;
        Wed, 24 Sep 2025 08:00:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8L7dDMun6u8WXMmZV5QmgvQm"
Message-ID: <9777e972-8ea1-4dfa-bab0-ee7e13f0a0e6@gmail.com>
Date: Wed, 24 Sep 2025 17:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] xen/riscv: detect and initialize G-stage mode
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
 <b7fa50ae-8094-4451-8326-53c975f7b441@suse.com>
 <0c4e446b-abe1-481c-91a6-60a49459b486@gmail.com>
Content-Language: en-US
In-Reply-To: <0c4e446b-abe1-481c-91a6-60a49459b486@gmail.com>

This is a multi-part message in MIME format.
--------------8L7dDMun6u8WXMmZV5QmgvQm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/24/25 1:31 PM, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/setup.c
>>> +++ b/xen/arch/riscv/setup.c
>>> @@ -22,6 +22,7 @@
>>>   #include <asm/early_printk.h>
>>>   #include <asm/fixmap.h>
>>>   #include <asm/intc.h>
>>> +#include <asm/p2m.h>
>>>   #include <asm/sbi.h>
>>>   #include <asm/setup.h>
>>>   #include <asm/traps.h>
>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>>   
>>>       console_init_postirq();
>>>   
>>> +    gstage_mode_detect();
>> I find it odd for something as fine grained as this to be called from top-
>> level start_xen(). Imo this wants to be a sub-function of whatever does
>> global paging and/or p2m preparations (or even more generally guest ones).
> It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
> when the latter is introduced.
> Probably, I will move the current patch after p2m_init() is introduced to make
> gstage_mode_detect() static function.

Maybe putting gstage_mode_detect() into p2m_init() is not a good idea, since it
is called during domain creation. I am not sure there is any point in calling
gstage_mode_detect() each time.

It seems that gstage_mode_detect() should be called once during physical CPU
initialization.

A sub-function (riscv_hart_mm_init()? probably, riscv should be dropped from
the name) could be added in setup.c and then called in start_xen(), but
is it really needed a separate sub-function for something that will be called
once per initialization of pCPU?

~ Oleksii

--------------8L7dDMun6u8WXMmZV5QmgvQm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/24/25 1:31 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0c4e446b-abe1-481c-91a6-60a49459b486@gmail.com">
      <blockquote type="cite"
        cite="mid:b7fa50ae-8094-4451-8326-53c975f7b441@suse.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -22,6 +22,7 @@
 #include &lt;asm/early_printk.h&gt;
 #include &lt;asm/fixmap.h&gt;
 #include &lt;asm/intc.h&gt;
+#include &lt;asm/p2m.h&gt;
 #include &lt;asm/sbi.h&gt;
 #include &lt;asm/setup.h&gt;
 #include &lt;asm/traps.h&gt;
@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     console_init_postirq();
 
+    gstage_mode_detect();
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I find it odd for something as fine grained as this to be called from top-
level start_xen(). Imo this wants to be a sub-function of whatever does
global paging and/or p2m preparations (or even more generally guest ones).</pre>
      </blockquote>
      <pre>It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
when the latter is introduced.
Probably, I will move the current patch after p2m_init() is introduced to make
gstage_mode_detect() static function.</pre>
    </blockquote>
    <pre>Maybe putting gstage_mode_detect() into p2m_init() is not a good idea, since it
is called during domain creation. I am not sure there is any point in calling
gstage_mode_detect() each time.

It seems that gstage_mode_detect() should be called once during physical CPU
initialization.

A sub-function (riscv_hart_mm_init()? probably, riscv should be dropped from
the name) could be added in setup.c and then called in start_xen(), but
is it really needed a separate sub-function for something that will be called
once per initialization of pCPU?

~ Oleksii
</pre>
  </body>
</html>

--------------8L7dDMun6u8WXMmZV5QmgvQm--

