Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FC9BF0D9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831171.1246356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hRE-000222-Tl; Wed, 06 Nov 2024 14:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831171.1246356; Wed, 06 Nov 2024 14:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hRE-000200-PE; Wed, 06 Nov 2024 14:55:16 +0000
Received: by outflank-mailman (input) for mailman id 831171;
 Wed, 06 Nov 2024 14:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8hRD-0001zS-0S
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:55:15 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ee5d2e5-9c4f-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 15:55:10 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cefa22e9d5so765065a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 06:55:10 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aafe0asm2819476a12.23.2024.11.06.06.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 06:55:09 -0800 (PST)
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
X-Inumbo-ID: 1ee5d2e5-9c4f-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFlZTVkMmU1LTljNGYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA0OTEwLjgxMjI0MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730904910; x=1731509710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JgqN6sR5UD1PdYwuMkpfyRkRhRTaQoIDTKuF/rDdOX8=;
        b=Kv4zTdrCjnuwCnpsx7yoh9C/6kHpEbIIy/VVC9lTAOU5+NKxcBpXrnRa4rCtFgVftU
         4fUllhy5G7B/JIbzdxlsxE8JsPpIIy7kNGoBTupXULJmBEvfYBlik33iGlAoFJEeLwxW
         ou444RS/+FhfjVgAmGARN8b1pqpJ0adn24mh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730904910; x=1731509710;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgqN6sR5UD1PdYwuMkpfyRkRhRTaQoIDTKuF/rDdOX8=;
        b=SNZ4HBhAiZWXJqGGcKYshtquAG8KOucIMHkl6udY+xrgXKNwylwG50fEFCJdUYmrUB
         2SANa3zL5VRnzfxvVEvv4z3NGnp+S+iMEDWnmICC9VQDs8dUVklw4Np4Yfhk7WpFSy3w
         KfZyrv6+vu5q+27kPtY/vc5xFyQyB4A1dxkdctBlw+rxI/O76J2fKalEozAECzJJjN2o
         xNJCLDya5KzwIdf+kmrYXlEsGAxeY2bO8Db+eynYSLgE9a9CTZSfykicC8jH4oVLTWiR
         hNj8okHb2cRhoVF1EqTSqBcJvCqdUslGneqr1xsXj9PmIK4Nmm7Q9vJ7unBzSblmTYjM
         Vxyg==
X-Forwarded-Encrypted: i=1; AJvYcCUUo8ve7H+xNwjo9nRzwW6M1PA4hp62Lt3g7e7NUS3Dp3YEl7ACsWDZ+8lI14l6aYAobtuv76P0bTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUEhfkgCgWJQuW2KP5i3fr4fftmQhiMjDC/jAZnlNbkknyIX7w
	TGMyMnULlHhHKTndgAGl4WAjF0cyyFPwezX7+GE4412IS6A35lQMXpqgrgLwFok=
X-Google-Smtp-Source: AGHT+IGV6pzu4QWw5cA2rKECJXIiSDXsOFxXYRDgJ+eib8oCokspuB2rqevBByNoLWdxgA+ADg0f9A==
X-Received: by 2002:a05:6402:51d0:b0:5ce:d4db:ddb5 with SMTP id 4fb4d7f45d1cf-5ced4dbded9mr8745557a12.32.1730904910174;
        Wed, 06 Nov 2024 06:55:10 -0800 (PST)
Message-ID: <68d95851-0938-4efc-b885-de564600b40c@citrix.com>
Date: Wed, 6 Nov 2024 14:55:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
 <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
 <111206f7-2a87-4a31-a6fd-003b5941cb85@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <111206f7-2a87-4a31-a6fd-003b5941cb85@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2024 2:50 pm, Daniel P. Smith wrote:
> On 11/6/24 09:34, Andrew Cooper wrote: 
>> However, despite looking at this many times, I've only just realised...
>> This semantically changes things in a direction that we won't want.
>>
>> Today, BOOTMOD_RAMDISK only happens a side effect of being "first
>> BOOTMOD_UNKNOWN standing at the end".
>>
>> But the EFI boot code ought to set bi->type=RAMDISK explicitly from the
>> ramdisk= argument (it can probably set type=MICROCODE too), and future
>> plans with a large HL config probably will be similar.
>>
>> Anything which sets type=, and type=RAMDISK in particular, prior to
>> early_microcode_load() excludes it from the search.  This is definitely
>> not what we want.
>>
>>
>> It's a latent bug for now, but I'd suggest keeping the plain for
>> loop, with
>>
>>              /* Search anything unclaimed or likely to be a CPIO
>> archive. */
>>              if ( bm->type != BOOTMOD_UNKNOWN &&
>>                   bm->type != BOOTMOD_RAMDISK )
>>                  continue;
>>
>> as the selection criteria.  Probably also want to start from idx=0 to
>> remove assumptions about the dom0 kernel.
>>
>> Thoughts?
>
> Yah, as much as it would be nice to use the helper, this is the
> exception where there is a complex match condition to be handled. This
> will be switched over to an explicit for loop.

This is simple enough, and I'm happy to fix this all up on commit.  Save
it going around the loop yet again.

~Andrew

