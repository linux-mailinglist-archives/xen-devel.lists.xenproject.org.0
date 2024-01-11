Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08D82A888
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665979.1036346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpnL-0005j7-40; Thu, 11 Jan 2024 07:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665979.1036346; Thu, 11 Jan 2024 07:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpnL-0005gi-12; Thu, 11 Jan 2024 07:48:07 +0000
Received: by outflank-mailman (input) for mailman id 665979;
 Thu, 11 Jan 2024 07:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpnJ-0005gc-95
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:48:05 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0693d13-b055-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:48:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e5f615a32so2841605e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:48:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dr18-20020a5d5f92000000b0033677a4e0d6sm491559wrb.13.2024.01.10.23.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:48:03 -0800 (PST)
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
X-Inumbo-ID: c0693d13-b055-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704959284; x=1705564084; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzf1Z1/LdxTvPW5MTdHruq1krKzlVUJGRi+TTE6vyTk=;
        b=Mr1m3pwhISWUsiUb/mb/quEtaYexlnQb72OxMLxt9DHt6zqqPfqF/Ba+9z30rW6gjG
         oxM9Po5YsDO9DjHUr1YVR15mC0vy7Kuo1j/ItvyB7+8snJIlNqvHxLgWk1SCJSmRrNLz
         WwzEJcO/2VscEChKB7G+2JR395qqe2IHz4X5jd7kjstV0yVDZ90CmzsvSTsG0A/n4IlO
         b+guyVdZVg/7jbweyMBPP7AxrcVeLCs7BHqHy7dH4NHUWnnspaklog/UAJB4Yjr8D0ae
         Kwyqfy4G3eadCEuVaa7ugIosl+aucoMsydTBDPH/+UyflyyXNmk4BHk5LxAinsJycESB
         0ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704959284; x=1705564084;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzf1Z1/LdxTvPW5MTdHruq1krKzlVUJGRi+TTE6vyTk=;
        b=P8JXQm7rLFWtQTceLM2b34SiGhU+NV3HGoXuyYRzwg/R4mUBgu4SYUuS6WfOnMl+mx
         4uPV1xoRg3BAZ7dAo4OYUnZLQPlBhoQ07er4SpYeMF2N4uX3Y4eIq4wJbq1hdPsWHm99
         gczrgywEfrfUrDO+ImyVLmVbYaE361CQCqz890qIHEre87BZNQ7pDDNCXYa2wupqSMNt
         QesO5GLUrI5ZQ+pdlRqBufW7LrjdNRNcqKfI6wSkfBsPDxfGRsF8gOjTatzem34WfBKk
         lrMc0n36rrz3kN0V+MMNKzdGmWjLuBvaifQck9VIULLbZckfxHErDgcu0yAPNcujWjMG
         +Y0g==
X-Gm-Message-State: AOJu0YybnO4kYr/cA295T7KgqmwXMP1uYtpsVWDLBqRMDbPdcinhlR0I
	pT//yoZ4XnGd7+4KKfeRg62X/hCL2heI
X-Google-Smtp-Source: AGHT+IFKeBt2YMbfrpuDJU/WKSSHjGnv9fXHma0CDLQLu0KDWY27oeRZTVlmd08SBijJfhu810chdQ==
X-Received: by 2002:a05:600c:3b29:b0:40d:5b0c:768b with SMTP id m41-20020a05600c3b2900b0040d5b0c768bmr75967wms.206.1704959283753;
        Wed, 10 Jan 2024 23:48:03 -0800 (PST)
Message-ID: <195c7cfb-2495-49f5-96e0-fe6bd0942a83@suse.com>
Date: Thu, 11 Jan 2024 08:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vmx: Fix IRQ handling for EXIT_REASON_INIT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Reima ISHII <ishiir@g.ecc.u-tokyo.ac.jp>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Takahiro Shinagawa <shina@ecc.u-tokyo.ac.jp>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231101192058.3419310-1-andrew.cooper3@citrix.com>
 <20231101192058.3419310-2-andrew.cooper3@citrix.com>
 <8ea5ad46-dbdf-2d9b-1d90-14ff20d94ab8@suse.com>
 <9f8524b4-735e-4f8f-b12c-006dd178b575@citrix.com>
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
In-Reply-To: <9f8524b4-735e-4f8f-b12c-006dd178b575@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.01.2024 20:11, Andrew Cooper wrote:
> On 02/11/2023 8:57 am, Jan Beulich wrote:
>> On 01.11.2023 20:20, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -4097,10 +4097,6 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>      case EXIT_REASON_MCE_DURING_VMENTRY:
>>>          do_machine_check(regs);
>>>          break;
>>> -
>>> -    case EXIT_REASON_INIT:
>>> -        printk(XENLOG_ERR "Error: INIT received - ignoring\n");
>>> -        return; /* Renter the guest without further processing */
>>>      }
>> Wouldn't the printk() better remain where it was, and just the "return" be
>> purged?
> 
> Not really... that would hit the unknown vmexit path in the second.

Well, I didn't mean to suggest to purge the other hunk. Instead I meant ...

> We actually have a variety of empty cases in the second.  We could add
> another.

... something along these lines - do nothing but "break;" there.

Jan

