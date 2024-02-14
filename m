Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4185447C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680267.1058283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raB83-0006Dc-Oq; Wed, 14 Feb 2024 09:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680267.1058283; Wed, 14 Feb 2024 09:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raB83-0006C3-Lg; Wed, 14 Feb 2024 09:00:31 +0000
Received: by outflank-mailman (input) for mailman id 680267;
 Wed, 14 Feb 2024 09:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raB82-0006Bx-Qx
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:00:30 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2f5d57-cb17-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:00:28 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b4e6972f6so2684540f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:00:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a056000038e00b0033ce40eee9fsm1798089wrf.58.2024.02.14.01.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 01:00:26 -0800 (PST)
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
X-Inumbo-ID: 7f2f5d57-cb17-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707901227; x=1708506027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwQM1N90LXQ5crfNmukPzfyN4MW+nE2j5dkoQyyKrvo=;
        b=uOKXYwtHM546LmsXu8DZqX5Qnh7AWC5eeKYG/gLzCpyVqE9ngPPgaGDQrp3IRcvTBt
         H0I77Ilk6q4bPHVY9giMzbymfJwrvtKVBKe0O+B0QGsvkHKBOKHyjU3iOR2QjOOGNRPp
         E5ZOaV3vwWGwl6GcI74Cx20qI70TyJMx2wgVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901227; x=1708506027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwQM1N90LXQ5crfNmukPzfyN4MW+nE2j5dkoQyyKrvo=;
        b=I5CmtJJyahUPPYnlbewO5viAiYKz/WCioccwKMf8kHUJeabnsxm/Z7LMk/bu9w5Q8+
         8/sJsqVqqt1Mav5mFxePwIRUm8hVDPdSmAnSV/BNQ8hBIA3xik4cfzJf8StBwbngwdCO
         LDMpRWfefM7eRJ3Pu8BlHd2WHQ4v1LNJWjpZm6zLgzIZdvi1qiwtThco3l6QpWbZnlWl
         kImKJFsrgyLVh0lZhD1G3fCPr6Z5UgsutTwmo4KGDm+zy7JKRmVga2Z1JI8KocUoQcZd
         RyIl6kyViitDCe7jpP6Eta4FStc4HbqYshTbO7sKWFqUyOjsOWUW74XzcGmWMeQ/z3w8
         44Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVi5CgvV83QvVS8Q6XLgRKY/8LK3qSFcCr3KXxBvgSynvMFwAAyPkFbYvUUtRPkj6gO/SkxP40JDEveU93U4GHoZ+XHRv9YI+Z3fyfPDC4=
X-Gm-Message-State: AOJu0YwM8B7h4Wr4a4s+lZCyJV3n7MFH84ILj0nxbe1dNBrq24jJQRef
	w5/UFr11yzuToLjDDjQmKee5CyxzGZJczlYY3KIKBn0FEFmxkLwOXL4vLedrey0=
X-Google-Smtp-Source: AGHT+IEg8k9qQcWB/80LknhA8qSv44R3lHhwppCC9PHFfdJm8V+FLB7InMkyqC4zgrWZyDlGhYypMA==
X-Received: by 2002:adf:f106:0:b0:33b:6369:6485 with SMTP id r6-20020adff106000000b0033b63696485mr1374153wro.24.1707901227002;
        Wed, 14 Feb 2024 01:00:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXM1DXQZ1ouIIfSmPq7iSf1qy489WAwMvyjKOP5NF+WnbNn/q0Dxu5msb7WQ6O3rbu+WAFdsG7+YPoRIplFQ16R6hPzt4VFVHAqPoGyctJi0hqsZXwn9iWXG5V6Ry/ZKdhK
Message-ID: <c84a640e-3332-4f2d-9c4a-c6806bb2da67@citrix.com>
Date: Wed, 14 Feb 2024 09:00:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common RMRR
 checker
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
 <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com> <Zcx9w5eZkXiN9s66@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zcx9w5eZkXiN9s66@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2024 8:45 am, Roger Pau Monné wrote:
> On Wed, Feb 14, 2024 at 08:45:28AM +0100, Jan Beulich wrote:
>> On 13.02.2024 23:37, Andrew Cooper wrote:
>>> On 12/02/2024 2:38 pm, Jan Beulich wrote:
>>>> On 07.02.2024 16:34, Roger Pau Monne wrote:
>>>>> Use the newly introduced generic unity map checker.
>>>>>
>>>>> Also drop the message recommending the usage of iommu_inclusive_mapping: the
>>>>> ranges would end up being mapped anyway even if some of the checks above
>>>>> failed, regardless of whether iommu_inclusive_mapping is set.  Plus such option
>>>>> is not supported for PVH, and it's deprecated.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> XenRT says no.
>>>
>>> It's not clear exactly what's going on here, but the latest resync with
>>> staging (covering only today's pushed changes) suffered 4 failures to
>>> boot, on a mix of Intel hardware (SNB, SKL, SKX and CLX).
>>>
>>> All 4 triple-fault-like things where following a log message about an RMRR:
>>>
>>> (XEN) RMRR: [0x0e8 ,0x0e8] is not (entirely) in reserved memory
>>>
>>> not being in reserved memory.
>>>
>>>
>>> First of all - fix this printk() to print full addresses, not frame
>>> numbers.  It's obnoxious to cross reference with the E820.
>> Perhaps better indeed. The stray blank before the comma also wants dropping.
>> And while looking over the patch again, "mfn_t addr;" also isn't very
>> helpful - the variable would better be named mfn.
> I can adjust those in the fix, see below.
>
>>> It's very likely something in this series, but the link to Intel might
>>> just be chance of which hardware got selected, and I've got no clue why
>>> there's a reset with no further logging out of Xen...
>> I second this - even after looking closely at the patches again, I can't
>> make a connection between them and the observed behavior. Didn't yet look
>> at what, if anything, osstest may have to say. Do I understand correctly
>> that the cited log messages are the last sign of life prior to the
>> systems rebooting?
> I've found it:
>
>     for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
>
> Should be:
>
>     for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
>
> mfn_add() doesn't modify the parameter.  Will see about making those
> helpers __must_check in order to avoid this happening in the future.

There's only a single thing in this function which wants an mfn_t. 
Everything else is operating on raw paddr_t's.  I'd suggest converting
types at the start and using plain numbers.

Also, while I hate to nitpick, iommu_unity_region_ok() really ought to
be iommu_check_unity_region().  It is not a predicate (given the
additional fixups), so the function name shouldn't read as one.

Also, the "not (entirely) in reserved memory" line ought to have an ";
adjusting" on the end to make it clear that it's making an adjustment in
light of finding the range not reserved.

Finally, the "can't be converted" error should render type, even if only
in numeric form.

What do we do when there's a region that's marked as RAM?

As to the triple-fault-like nature, given that it's an infinite loop, I
expect that it was our test automation getting unhappy and power cycling
the systems after seeing no signs of starting the installer.

~Andrew

