Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92491901F03
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737118.1143269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGc0v-0004kC-78; Mon, 10 Jun 2024 10:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737118.1143269; Mon, 10 Jun 2024 10:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGc0v-0004hv-3S; Mon, 10 Jun 2024 10:12:33 +0000
Received: by outflank-mailman (input) for mailman id 737118;
 Mon, 10 Jun 2024 10:12:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OhkP=NM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sGc0t-0004FU-96
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:12:31 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f074dc-2711-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 12:12:30 +0200 (CEST)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-25488f4e55aso1021899fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 03:12:30 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-795758dfe3asm111014985a.105.2024.06.10.03.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 03:12:28 -0700 (PDT)
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
X-Inumbo-ID: f1f074dc-2711-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718014349; x=1718619149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Yq7nVrlyB4+bTuo8fkH9BXvZhOByQ/M4/xpYdLoCT8=;
        b=dFq8h6sNTzmY56G3CJQHgtbP/FqUj1WU0b/sAhmgCu04LhxmIrOw4woA2F6snXKz4U
         OtEwzFhXX/GRtTqf5kvZCAIchmCT/RDcg74dnxY1Sel3oJKlwUVlu8Th3zT03oBASJXA
         l4sl56WXb5jjVva67+lh78lVb/4+LEmZXWA9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014349; x=1718619149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Yq7nVrlyB4+bTuo8fkH9BXvZhOByQ/M4/xpYdLoCT8=;
        b=f/ZXdBetA3W/F4mV03/wGrDB0sJsYHDPBXdBMjwMexKyEkLhf6xyfS/sRjCiVUqYE8
         KHzZkC+9D32nLt2mUcTZIpIYn3jl+IhB1O9FB/pw9BU0DMKjeMM3qWIHdSg3gid3JKgz
         a8oXXlJVXCyZBaBgD5km8TE/3sQ69l8QGsMDtP5s3HZOhxhFKSPMfBJvYYZrhGyuQPgo
         H4eWJdGv3ZsgjBZuBokAqDzHP0r6GKxEnVSescwAJHVv2dIemSYqAbqrabe44k1Z1Imm
         4Xp3Er4b1HuMdrSUO/Ky4Yzof1hE7Fv4M7coWXYsvJiLjDjdjS3zuMcjxhNnGU6xheyM
         5Ybg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zd6KzE9hBxj9FnM2Zi+PC9W9GdnQ2SYYI/ZjATVoWDU8xl5Hy0I5kQupNSUzV/Xdf488Xb5L0jhje+OoRrVvbnWtKg5QYR/32igqWUs=
X-Gm-Message-State: AOJu0Ywf3bL8q+EOPcD9TsqfXgUT3GOIELJ5jdvW9vus5eqAFCgLLR7n
	LG0kD3j8SGnRPR4lQmDk+s9i0Oaj5bZ41nz0a3naEytrEIrpbXl4gwUf+B9x6QnUKokxUTsUb1h
	R+qA=
X-Google-Smtp-Source: AGHT+IEWO2epNIxWRQ6A5n0Id/ENs/Rn1RjQOADBpcesO9xbbcYR3sc9vIQIFtLAI5itj+UtbAQAXg==
X-Received: by 2002:a05:6870:71cf:b0:254:b73d:fe14 with SMTP id 586e51a60fabf-254b73e02cdmr3307281fac.52.1718014349237;
        Mon, 10 Jun 2024 03:12:29 -0700 (PDT)
Message-ID: <e56a4519-9d4e-4267-a189-e8e2fec1518b@citrix.com>
Date: Mon, 10 Jun 2024 11:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vcpumask_to_pcpumask() case study
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
 <c5951643-5172-4aa1-9833-1a7a0eebb540@suse.com>
 <1745d84b-59b7-4f90-a0a8-5d459b83b0bc@citrix.com>
 <afc347c0-ca2f-4972-b895-71184b1074ea@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <afc347c0-ca2f-4972-b895-71184b1074ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2024 8:15 am, Jan Beulich wrote:
> On 07.06.2024 14:35, Andrew Cooper wrote:
>> On 03/06/2024 10:19 pm, Jan Beulich wrote:
>>> On 01.06.2024 20:50, Andrew Cooper wrote:
>>>> One of the followon items I had from the bitops clean-up is this:
>>>>
>>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>>> index 648d6dd475ba..9c3a017606ed 100644
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -3425,7 +3425,7 @@ static int vcpumask_to_pcpumask(
>>>>              unsigned int cpu;
>>>>  
>>>>              vcpu_id = ffsl(vmask) - 1;
>>>> -            vmask &= ~(1UL << vcpu_id);
>>>> +            vmask &= vmask - 1;
>>>>              vcpu_id += vcpu_bias;
>>>>              if ( (vcpu_id >= d->max_vcpus) )
>>>>                  return 0;
>>>>
>>>> which yields the following improvement:
>>>>
>>>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-34 (-34)
>>>>   Function                                     old     new   delta
>>>>   vcpumask_to_pcpumask                         519     485     -34
>>> Nice. At the risk of getting flamed again for raising dumb questions:
>>> Considering that elsewhere "trickery" like the &= mask - 1 here were
>>> deemed not nice to have (at least wanting to be hidden behind a
>>> suitably named macro; see e.g. ISOLATE_LSB()), wouldn't __clear_bit()
>>> be suitable here too, and less at risk of being considered "trickery"?
>> __clear_bit() is even worse, because it forces the bitmap to be spilled
>> to memory.  It hopefully wont when I've given the test/set helpers the
>> same treatment as ffs/fls.
> Sorry, not directly related here: When you're saying "when I've given"
> does that mean you'd like Oleksii's "xen: introduce generic non-atomic
> test_*bit()" to not go in once at least an Arm ack has arrived?

If we weren't deep in a code freeze, I'd be insisting on some changes in
that patch.

For now, I'll settle for not introducing regressions, so it needs at
least one more spin (there's a MISRA and UB regression I spotted, but I
haven't reviewed it in detail yet).

But yes - they're going to end up rather different when I've applied all
the compile time optimisations which are available.

~Andre

