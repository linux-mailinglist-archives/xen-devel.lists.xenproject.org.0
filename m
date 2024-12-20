Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C79F9A55
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 20:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861966.1273977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOia5-00040d-D9; Fri, 20 Dec 2024 19:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861966.1273977; Fri, 20 Dec 2024 19:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOia5-0003xU-8W; Fri, 20 Dec 2024 19:22:37 +0000
Received: by outflank-mailman (input) for mailman id 861966;
 Fri, 20 Dec 2024 19:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tu4b=TN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tOia3-0003xO-0N
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 19:22:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c27c0a71-bf07-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 20:22:32 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso22833755e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2024 11:22:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366128a44fsm53090345e9.43.2024.12.20.11.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 11:22:31 -0800 (PST)
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
X-Inumbo-ID: c27c0a71-bf07-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734722551; x=1735327351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bVjHd0/0ywe10HByXomswP6Y7iAKPeiI1PZPjKZ2HkA=;
        b=XIENb8DFzwjt7VcOkdKd3LlWZdm6CaD+/noLeqsfKNJtTE+lDbB6TqFae7lKx/QZ6r
         /uvdQzi0egXjMBW3ed9uIulhOOQucNNxU09hQP0tY/jWNoGKNqEf4w4gh2JhCe7pb48u
         0UgJqPy5LgcG5/bPpaltet89ua7xUquqhzc+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722551; x=1735327351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVjHd0/0ywe10HByXomswP6Y7iAKPeiI1PZPjKZ2HkA=;
        b=qS5UnlwJ6LopAh7WRqOJ6V0IESr0Wvc5wf+PF+KbeYqS1dpRz5dWn0bbnC1ueuXMsb
         8M18rWT21LJBW1YZXo7e3Zko6xY4yP0MgAC2UldeBrDb0997RGgD8J4147suFaXPWzxF
         L2R3OAVAggI3P3fAZAHZ4pBO65UmsFgoPTazD3zMUaWAEV4L2OQ/0fs66608tub+w6qv
         +SJ9K3kg4dKLZUPVfyMWHfgAS3COyfOu+F4IP4FGx3fL2ycxZR1YiMWvHDCzDFTS0YsJ
         QHOKMa9Id1ILu2BEaMyc/FpZYyvdLSL+x9irfQKF9MjvbZEyxnCiwls5BEFtDdmtAjlE
         xucQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZAwZKERP7hT1+vEuyeHH5oOJAnxkNNgU9iTZVLKe2GwNuCcBDtmbdtTVPa9ET/v7Gmjt2231vCcM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRKSPvLtg7Jc2LiANwL44oGeLSPrkRfWZMBYWZAtAR/NJGXzZV
	ZuvnjB2xF5uPdsNxu1Bh9WW8OE3Ngtl2KqSvZ1bC/GYrvdUSd4B2lJ/mOFXPIpc=
X-Gm-Gg: ASbGncsbOVhWtuva1zhnAbmfI1DEhMMaTKxunzRVu5PJ1dyFWQ8Ce5pIkl9IZxTpNT+
	mbVaKybWvCIYeH/rH5L4jT0UEMlfx1jqvDjTA5TDImGXJMP1OxIRoBUYkul/bgJ/6BVpm0V6m67
	XJjP3e3bZpw15B1M0P45eh6JBULHt9fqOC63smSz0X8aNLnXcBnwleppkgNeTgve3EUR7dUX3Ni
	VWAWId0vH5TRAqABBGEucTM4srAPu7viQGqGsKbgELa31YBOGYD2U246++e2bUkkOAiNIZEjLcF
	QYEmO/U2SnN4vEK1UOH0
X-Google-Smtp-Source: AGHT+IHmIXR20tZrwwMEz3x4n7QenphXZXgUnosSJCHpvvmHTXLyRlpZq3SlrOh0GLDZ+dD9I7OT6w==
X-Received: by 2002:a05:600c:3c9b:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-4366790f1a3mr44073225e9.0.1734722551533;
        Fri, 20 Dec 2024 11:22:31 -0800 (PST)
Message-ID: <5d662133-6cdc-427d-bdc9-ba1da5eb83c3@citrix.com>
Date: Fri, 20 Dec 2024 19:22:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/mm: Update page APIs to use unsigned long flags
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <7e3cd1dc48e30f19f2ac97794e21d1b78bc0c082.1734717055.git.sanastasio@raptorengineering.com>
 <f335aabf-18c2-443c-af52-1b6786c3ee92@citrix.com>
 <b4eba262-69fb-43f8-9baf-9b27787930be@raptorengineering.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b4eba262-69fb-43f8-9baf-9b27787930be@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2024 6:51 pm, Shawn Anastasio wrote:
> Hi Andrew,
>
> On 12/20/24 12:23 PM, Andrew Cooper wrote:
>> On 20/12/2024 5:53 pm, Shawn Anastasio wrote:
>>> Xen's memory management APIs map_pages_to_xen, modify_xen_mappings,
>>> set_fixmap, ioremap_attr, and __vmap all use an unsigned int to
>>> represent architecture-dependent page table entry flags. This assumption
>>> does not work on PPC/radix where some flags go past 32-bits, so update
>>> these APIs to use unsigned long for flags instead.
>>>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Funnily enough, the same is true on x86 too.  NX and ProtKey bits are
>> from bit 63 downwards.
>>
>> x86 funnels all PTE flags through {get,put}_pte_flags() which compresses
>> a 64bit PTE's flags (top and bottom 12 bits) into a 24 bit number.
>>
>> This was allegedly for the benefit of 32bit builds of Xen with PAE
>> paging.  I'm not convinced this claim was backed up evidence, even in
>> the 32bit days, because the areas of code working on flags separately
>> from a 64bit PTE are minimal.
>>
>> Nevertheless, it's been 11 years since we dropped x86_32, and it's
>> definitely tech debt and unnecessary overhead in x86_64.
> Interesting -- I wasn't aware that x86 was running into this issue too,
> and that approach to solving it definitely seems a bit dubious from an
> overhead standpoint.

It is history and inertia most likely.

Original paging in x86 had 32bit PTEs with attributes in the low 12 bits
only.

PSE and PSE36 paging were next but not interesting in this context.

PAE paging changed to 64bit PTEs, and the NX bit was added in bit 63. 
This is where the upper 12 bits got introduced.

However, using uint64_t's in 32bit code is somewhat unergonomic and Xen
had a bunch of optimisations to use 32bit frames (== 44 bits addressable
memory).  To this day, we've still got this limitation with a __pdx_t
which dictates the size of the frametable (and CONFIG_BIGMEM to switch
to something larger).

x86_64 has a hard dependency on PAE paging, and added other bits into
the upper 12 range, but at least now a PTE isn't larger than the GPR size.

>> I firmly support making this adjustment.  It's been on my todo list for
>> years, but never high enough to get started.
>>
>> However, instead of just a plain unsigned long, perhaps we should have a
>> concrete type, perhaps pte_attr_t ?
>>
>> This lets different architectures handle things differently, and also
>> lets us make it TYPE_SAFE() like mfn and friends.
>>
> I fully agree that introducing a TYPE_SAFE per-arch type for this is the
> more robust solution. I went with this approach as it requires the least
> invasive changes to other architectures, but if there's sufficient
> buy-in from everyone then I think that this would be the better route.
>
> One other consideration with that approach would be the ergonomics of
> using the TYPE_SAFE macros for these flags which are often OR'd
> together.  I know mfn addresses this by offering mfn_{add,max,min,eq}
> helper functions, so introducing similar bitwise helpers for the new
> pte_attr_t type could work. typesafe.h could even be expanded to include
> macros to generate these helper functions for numeric types to reduce
> duplication if you think that'd be reasonable.

I was thinking of TYPE_SAFE() as a second step.  I'm certainly not
asking you to do make it happen in this patch/series.

But yes, the ergonomics aren't completely great given how many bit
operations we do.


>> Most importantly though, it makes it less likely that we're going to end
>> up with paths that accidentally have some long->int truncation.
> In this patch some of those paths are explicitly present, for example
> in arm's pt.c. The thinking was that these architectures already
> obviously have no issue with 32-bit pte flags, so the truncation won't
> cause any issues, but I agree it's not ideal. At the very least, it
> presents a potential pitfall if architectures like x86 transition to
> using the full 64-bit field in the future.

Ok, in which case you want to start by introducing a per-arch typedef
defaulting to unsigned int.

Then rearrange the code necessary for PPC, and then change PPC to use
unsigned long.

This results no changes to other architectures until they take explicit
action to switch fully over to the new typedef.

~Andrew

