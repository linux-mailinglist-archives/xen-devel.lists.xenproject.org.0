Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A85D186F3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:21:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201483.1517112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcSR-00024c-2O; Tue, 13 Jan 2026 11:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201483.1517112; Tue, 13 Jan 2026 11:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcSQ-00021g-Vt; Tue, 13 Jan 2026 11:21:06 +0000
Received: by outflank-mailman (input) for mailman id 1201483;
 Tue, 13 Jan 2026 11:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfcSP-00021a-N6
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:21:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f261ca61-f071-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 12:21:03 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso67996685e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 03:21:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8384646fsm366812425e9.15.2026.01.13.03.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 03:21:02 -0800 (PST)
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
X-Inumbo-ID: f261ca61-f071-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768303263; x=1768908063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dv2fMYB5hXbUhgUcJfGY2lZ7/ed8hkB0GLSLrm4lgq0=;
        b=YnsVdG7xrH4KXsT6sreXz7k/IVFeLIfv+NQq8Xl/toneMO0ydQ3+Ir/wSSck8Syxd9
         J1EHgi+cD+1O20MAjuQiyT4hL9pE8TGj1WOD720buNjzxwJFbMSxm8DJVDH1Kgxf+U59
         P0DmkL68OHMVj8P2f/6WfcPAL3qdZfK6UZa29UD+Pjo2chBeUaRXLrmri2O+1RAFQ4SQ
         EfiwH+YI/qB2bnyOOvyp9z4+8xzqldPWBrkeROfbHZMw47UNhh8Q5K2lsYzdwCfJIwDw
         FXBVHedF4lsnxr0uN6caYtiasvZTfm0EKgiZKXNiAk8i5YuMS9kPDeBIicxAhzf4RBh1
         64rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303263; x=1768908063;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv2fMYB5hXbUhgUcJfGY2lZ7/ed8hkB0GLSLrm4lgq0=;
        b=rONbsXq7/1n71yQdsZ8aVHOpZJtU/Ypv+bxdHrowIep9XPnPE07LijWYl4bwecYIwq
         m16s0E+9qxF9/gzPDyP6fiPDDG7naeDnz9c2W7HACXgb7ndUemCdbpo5DglxID9+f/Cn
         NfsEoKo/1RTMn8bEJr2XYJ0VV23N1X0xzaI8dZQIVjj9jPp1PMUchJIWBFkFLDF6IkBJ
         uax9Veioh5/MTQoXqTxsQCjxwaUmk3c9AuIuOWmOaL7iCeZUFbJ7zhLm8LoX7QbPYMOR
         cZ+upMZMiwWqHmdOFtSsnDnhb7ngLwei/5jJ6tqlra/CfcXh2LtvD3tkEXyrN4K5xvn6
         4Plg==
X-Forwarded-Encrypted: i=1; AJvYcCUCr8YPZgrjr+loQ+godVC0UA6f/9pzsll2rONiNSGcLMVagVetgcGwtfLRwb/DEI+11FN9RXyf2XU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVWZS896zRi74Ip5rNiXNbz09jUgqb4y6XMDB5U5E7m6z1VYnm
	iI2n28BFe1FTj4hqS4CTdoDt8813iTvbfw51c1d2uVs1VxfTm0kS1a7WgYKj5dku7w==
X-Gm-Gg: AY/fxX7CEXELSjYNYPz+7ZyVoD8n6asMNUT2O9mW7pLZkqong/Ck3S+1cQraA5o/5KP
	ONdcZTYzhCLE4WxCo4nIC3NKInMVUKAHK3tZbRFcIRShwTy9+HT7rI5zh5OhMG6hIv6WbQkY95/
	07R3+DSSb4rMXm9/jGZEG1mnBtr2n9p14OKzUi0MMiiM33llTbpItIarHFU/Bohc6RrrIoMmWIu
	U51uvPAzFeov0W3lIXMEZbbUY9ofKse07agdj56b0J8FLw3D0HvEFczzhFdV9vX0HH4eFxWHjQj
	hqMrk4C2sTaGaCK0Gg/CeEJFkQh0CraGtsm2pZhWOtstrT895BSf/Xwwk4Cy1Xsb9NG9O/bTYgL
	IDi9+Y1uzS/OIaveO2vpWoIpRBo74DRe1xQmAkU/oefRKXOTAGHq4uGnloi2FsUDniaI4l+AX+t
	Ggr8anFrIR8QxVnej8HpahE+vU1ofcMNam5g3MCqWavKzGeQAEfuM/Ss/yDXBXd/PRBfzbKfU/i
	Us=
X-Google-Smtp-Source: AGHT+IGIJRuX67/wERrWdvomKYNqbZi/bFpj1d5NQ9VUq1panRFoHql6VTFIYlOkgVajF2gHQ+D+xA==
X-Received: by 2002:a05:600c:1992:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-47d84b18eecmr263758425e9.12.1768303263194;
        Tue, 13 Jan 2026 03:21:03 -0800 (PST)
Message-ID: <fcf49001-149a-48e4-b2b2-ad1f445b1405@suse.com>
Date: Tue, 13 Jan 2026 12:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: Anton Markov <akmarkov45@gmail.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
 <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
 <CACQYvN-fiATs2dtdboYxCreF8kF5RsgoH-zgWtQ59iVNOT_wVg@mail.gmail.com>
 <CACQYvN_JbPs9TAs4GYO3myVbehwU9Zz_BhQqj1jVT2Sfg30qUQ@mail.gmail.com>
 <4b03cf36-d2d8-420c-82df-55d6a9ac9d68@suse.com>
 <CACQYvN9cLwXy=rtYgEyTUsqxCYvP0-qFsEW=y8B3Fo9mauNx-g@mail.gmail.com>
 <6ea436ce-6ecb-47f8-8d8a-98b0badeb14e@suse.com>
 <CACQYvN_dZxXmvhBd8pZ41Kws_n_TXcwp5mMQ=H0Vu89Px8M+PA@mail.gmail.com>
 <b70e2c0e-7e8d-41d8-97da-5b975ad0ed47@suse.com>
 <CACQYvN8YtN4Q5MSH4i=MPjtOaxmPwr+oOKBSsrpqBq+=xAYhuw@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CACQYvN8YtN4Q5MSH4i=MPjtOaxmPwr+oOKBSsrpqBq+=xAYhuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.01.2026 17:41, Anton Markov wrote:
>>
>> That calls on_selected_cpus(), but send_IPI_mask() may then still resort to
>> all-but-self. In that case all IPIs are sent in one go.
> 
> Plus as said, how IPIs are sent doesn't matter for the invocation of
>> time_calibration_rendezvous_tail(). They'll all run at the same time, not
>> one after the other.
> 
> At the hardware level, no one can guarantee that the processors will
> simultaneously respond to the signal and execute your code nanosecond after
> you send the ipi. Especially when we're talking about NUMA configurations. I'm
> afraid the possible and impossible in the laws of physics is also beyond
> the scope of this thread.

You did read my recurring explanation beyond the IPI sending, didn't you?
Of course IPI arrival may vary across cores / threads. Yet the term
"rendezvous" is used because CPUs having received the IPI are then held
in a waiting loop, until _all_ CPUs have made it there. Then CPU0
indicates to all of them simultaneously to move to the next step. There's
going to again be some variance (especially on NUMA, where the memory
write needs to propagate to all nodes), but at least within a single node
that should be pretty low. The main source of variance I would expect
there would by hyperthreads competing with one another in a single core.

> Since further down you build upon that "IPI lag", I fear we first need to
>> settle on this aspect of your theory.
> 
>  I've already provided the delay logs. It's not hard for me to repeat.

Sure, I don't doubt you make those observations. But we're still trying to
converge on a theory on what these may be caused by.

>  2 hours of work:
> 
>> (XEN) update stime on time calibrate 0, 8564145820102 -> 8565145861597
>> (8565145862216, 0)
>> (XEN) update stime on time calibrate 1, 8564145820129 -> 8565145861609
>> (8565145863957, 0)
>> (XEN) update stime on time calibrate 3, 8564145819996 -> 8565145861491
>> (8565145864800, 0)
>> (XEN) update stime on time calibrate 2, 8564145820099 -> 8565145861609
>> (8565145865372, 0)
>>
>> 8565145861609 - 8565145861491 = 115 * 3 (3.00 GHz) = 345 lag

The log entries aren't in CPU order, and CPUs 1 and 2 actually have
identical values on the rhs. That doesn't quite fit what you have said so
far. CPU3's value is also lower than CPU0's.

> 3 hours of work:
> 
>> (XEN) update stime on time calibrate 0, 22914730829200 -> 22915730869993
>> (22915730870665, 0)
>> (XEN) update stime on time calibrate 1, 22914730829073 -> 22915730869889
>> (22915730870693, 0)
>> (XEN) update stime on time calibrate 2, 22914730829052 -> 22915730869841
>> (22915730872231, 0)
>> (XEN) update stime on time calibrate 3, 22914730828892 -> 22915730869696
>> (22915730872096, 0)
>>
>> 22915730869993 - 22915730869696 = 297 * 3 (3.00 GHz) = 891 lag

While CPU numbers happen to be in sequence here, the rhs values aren't equally
ordered.

Also really here it is

22915730869696 - 22915730869993 = -297 * 3 (3.00 GHz) = 891 ahead

> 2-3 day of work:
> 
>> (XEN) update stime on time calibrate 0, 254477161980127 -> 254478162020920
>> (254478162021549, 0)
>> (XEN) update stime on time calibrate 2, 254477161977638 -> 254478162018429
>> (254478162022187, 0)
>> (XEN) update stime on time calibrate 1, 254477161978192 -> 254478162018972
>> (254478162022776, 0)
>> (XEN) update stime on time calibrate 3, 254477161976832 -> 254478162017636
>> (254478162021394, 0)
>>
>> 254478162020920 - 254478162017636 = 3284 * 3 (3.00 GHz) = 9852 lag

Similarly here. Yes, the gap increases, yet that's not a lag of CPU3 past
CPU0, but exactly the other way around.

>  As you can see, the core lag is strictly determined by their sequence
> number.

As per above - no, I don't think I can see that. Or maybe I'm misreading the
numbers as well as what you have been saying.

Jan

