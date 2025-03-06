Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94515A5576A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 21:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904025.1311937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqHn5-0005gQ-C9; Thu, 06 Mar 2025 20:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904025.1311937; Thu, 06 Mar 2025 20:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqHn5-0005eH-9N; Thu, 06 Mar 2025 20:25:59 +0000
Received: by outflank-mailman (input) for mailman id 904025;
 Thu, 06 Mar 2025 20:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZnl=VZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqHn4-0005eB-37
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 20:25:58 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 352a2604-fac9-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 21:25:56 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso633135f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 12:25:56 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdff57sm3121608f8f.37.2025.03.06.12.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 12:25:55 -0800 (PST)
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
X-Inumbo-ID: 352a2604-fac9-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741292755; x=1741897555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zsQEXenOUTs47C+xftYn6ATvYNZ3NiQAPYk4EFnyEc0=;
        b=WBs9Kj5Mux1UXcF89IVWqIiH8qRLX5lMPRR596lN+ch1hJ8vDX7M9zz3ac8GbInzsi
         ZxMHRqnohDHqczvqRhiV7QMC7oPZYBuRwR3Na3uqtrwF8OmB+B7wRNvDwdN1kGqgV4hE
         xg7TesDH+chs634evq1qnu6xXyTEg8t1iA/5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741292755; x=1741897555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsQEXenOUTs47C+xftYn6ATvYNZ3NiQAPYk4EFnyEc0=;
        b=jo8RkhDW6MxZ015mjFT2qw377dJqKLa+1Zwqk7geLpXkDvRM43+CHJHo79CNezn/MP
         iD1Op0dLtvvq1wseC7CSUwlrDuuHStfWHcJX0XJysyT+E0hoJqnzqrhz09uc5sGGCVhf
         3sZXorE1p81K9flVi9da9Ki4DbdNTc5t22tXy/c8Mwn+ubmnD0+7fcXdNR+f+CdGTAGL
         WnS2/rRfdfbicTyCnwjZbYpeL1d3ugWUzeAz/d0SGo3ISZkfjc1uK20MXe0VBeK9BkW4
         N/0SxUBKq7pknA/2y0Y84DHXR4UpREk6xedR4vSkR12P3ML/haIntwfp0xC1RqHPcpyh
         Nieg==
X-Forwarded-Encrypted: i=1; AJvYcCVcXDaxk1sgbmNYPNg6jukezG0TnMmnjnqpHnKvv1EMI6D62UjB3BlqmlrKHFwstGI3kDbej69U4fg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI8Qaiy6lNpHelkD+WflDnMDd/SlckQbBLgOl+8PCWsmxwKLoY
	XdTEWX/x88cBwhaPSSzXUKqwhuveMQBPBWQQX2fns9eqjhJSRf0kTuCsYen87ek=
X-Gm-Gg: ASbGncuIKju81IpdReaRXtw30K7T9z9tjmCC7UjrbyG3JREXi1FbQvbENbFoS8wYmi4
	oA8xpySY76c6okQH+DSX5JRo3gbiaiKq4OBmgo8lUeZ+Qa+QmjFl/1t7EsR4bWqu7VZ2eQnIbrz
	c42MF+if3yLNa3ttCVZTic91IiLkHl8B6S0o1ciglBCdJhKDT/ot60MaFsJcywXKZDBV7fVSq09
	G0+vL+BoKxD+OfUBFkjr4RTywTbLCedVChf8mcj8HBzYXTWHpliRCGXflxjyaee41Pt0iRt1nB8
	YbtixaEJGSXGu9x0t4QoH4J5L4uhZaZUsDPKQlF0cNaSqUUNE2J29RS645t4aAnt7YYEhYnj7gG
	vxXcvKgt5
X-Google-Smtp-Source: AGHT+IGcJXYKrWjP9l2md5S1zzO40Vga8xn8Ack/aDb+r7gRrvrMvdNgAF7aPsgogbGVQ2SVZdASdw==
X-Received: by 2002:a5d:598d:0:b0:391:23e6:f09b with SMTP id ffacd0b85a97d-39132d8f220mr441274f8f.27.1741292755506;
        Thu, 06 Mar 2025 12:25:55 -0800 (PST)
Message-ID: <93b94674-f669-4e3b-9b83-d63b3e504310@citrix.com>
Date: Thu, 6 Mar 2025 20:25:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/watchdog: Identify which domain watchdog fired
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
 <20250303232941.2641306-3-andrew.cooper3@citrix.com>
 <7fc9ee31-dfce-4fba-ac11-4d6ff2acc2f9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7fc9ee31-dfce-4fba-ac11-4d6ff2acc2f9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 9:27 am, Jan Beulich wrote:
> On 04.03.2025 00:29, Andrew Cooper wrote:
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -1534,12 +1534,19 @@ long vcpu_yield(void)
>>  
>>  static void cf_check domain_watchdog_timeout(void *data)
>>  {
>> -    struct domain *d = data;
>> +    /*
>> +     * The data parameter encodes the watchdog id in the low bits of
>> +     * the domain pointer.
>> +     */
>> +    struct domain *d = _p((unsigned long)data & PAGE_MASK);
>> +    unsigned int id = (unsigned long)data & ~PAGE_MASK;
>> +
>> +    BUILD_BUG_ON(!(alignof(d) < PAGE_SIZE));
>     BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
>
>> @@ -1593,7 +1600,17 @@ void watchdog_domain_init(struct domain *d)
>>      d->watchdog_inuse_map = 0;
>>  
>>      for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
>> -        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
>> +    {
>> +        void *data = d;
>> +
>> +        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(d));
>         BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(*d));

Well, that's embarrassing.  That explains why I was having issues, and I
was clearly asleep when writing...

~Andrew

