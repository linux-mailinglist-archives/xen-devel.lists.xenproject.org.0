Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5242AB3C52
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981749.1368160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVEJ-0004Zr-Me; Mon, 12 May 2025 15:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981749.1368160; Mon, 12 May 2025 15:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVEJ-0004Wz-Jw; Mon, 12 May 2025 15:38:11 +0000
Received: by outflank-mailman (input) for mailman id 981749;
 Mon, 12 May 2025 15:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVEI-0004Wt-LD
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:38:10 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aaf2a4d-2f47-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:38:08 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5fd0d383b32so3167973a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:38:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fe943484e6sm1315048a12.24.2025.05.12.08.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:38:07 -0700 (PDT)
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
X-Inumbo-ID: 1aaf2a4d-2f47-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747064288; x=1747669088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MG1uROywJGEjyfQbCjXiFOg6F5BMz/3WanvKrrzvY2g=;
        b=Pg0GHIt5Wnvee3/al2oPwamUKljr4LUURYl+jowz/Sub7WqJoclwvTqufBwsC3hlPX
         bTL3BO7vgMbK7zYGi3zy9obKA4N6J7muLR5DOV1+6+rDQmWpEYPHklQs2tAJavX/eFoL
         AZGHmne0IQ2cx6gM2m9zRi6VRK8d2WVC22zckUybAvHnm2zjHLjKLWB20Y989YNpYIEM
         t1ayxNlfKO+ENALt/Zj12G4buFu55+qSDOANDdSLOu8nWPVN3Y15zUutYlZIeKmoIKbW
         JxpY4yEMDIW0B1c67fXj7+xNY/6NCJHaX9fzyaHaevC4cXJHemhhweUy45vyZzbzMPTI
         kKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064288; x=1747669088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG1uROywJGEjyfQbCjXiFOg6F5BMz/3WanvKrrzvY2g=;
        b=XqMqX6or2xbG2a57dv2qKqFJ6fr2sRMVWTkWZ8kochvrh+o788JLrfERLfEeTxm3J9
         ujEnTCmUgoQqISzLsAUvbSOD1zdDMFvXln55uQnMq1SSzNwabnteyEayf12MhI+C0FoK
         1ul9mEGAJCvQ4zlPQtJpXKN5NL9m5UYyeu25Mf6OQg3HSb8AgmMvtS4x72zG5AjkrIuD
         GtnzAexwvuRUFItf2+nluyN/uli3Z0zGIqC4P00hQJ+99t/0+j8Jumzn4l9JQgfoB/SB
         cF4KM9JmSz/LNTGMeG+gNChvrFxHcY++Cz0Fv2sFe9921VasaKRai1bP8YeC3M+FAvsB
         /oWw==
X-Gm-Message-State: AOJu0YzGQzxQLB4o9jgV1lJQRPmH1LrduXNEhw3MWGlp7Klmh0L9xOlB
	flWiAabBMo7BAVYgQDODnpsWirnz25u8whi6/MQJeTC/3/Wf6g9RI7kQhFSGGQ==
X-Gm-Gg: ASbGnct06MONNYgyC5SklWLs0Utq4LIGYLF5XKR8OGitHWLQ7b5a3YbaMcqQAbqtmhh
	N1jkXXIKnwM3yU7lig3CdTPCn1OnFGvMFYQSMW8m8uSW4YBGFm2fJnUfc7bVJHBJLVjCgCwb79E
	44Zf+qfIRde19IL2w5epjUQatZ2+q5fOE/9aAc5M5XPy/zhvcC4Dy2ATqHHIuilfvLQTOWMb6de
	jDGccsWb6Nk7X0gat6rRzuk1h/kAgiTV/UPBr5JG7NS4sBAiUCgMp/eckOnx+/vvHMtY/pXu0Yb
	q8WYmVQSMVBDKDq0iC94umZ2oKafpNSLcKFs30ZcwNSEzWR1adsJ4d6MbF+M56GDydeI7OHmVkA
	jiF6KXjSfnC61R3KO4J0eQ/NgRePQmJQ+x7KY
X-Google-Smtp-Source: AGHT+IEHSeMTKrvK9dL59lb3BXVTQPPUkdhwQ4O3JadntKeohaOG0mf6TcDvQNBhaPO/ODJ+n7B9cQ==
X-Received: by 2002:a05:6402:2686:b0:5f6:218d:34f3 with SMTP id 4fb4d7f45d1cf-5fca11dd3b6mr13630921a12.28.1747064288165;
        Mon, 12 May 2025 08:38:08 -0700 (PDT)
Message-ID: <d9a960ba-9690-4d0c-8b1a-1fa9275bcf22@suse.com>
Date: Mon, 12 May 2025 17:38:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-10-roger.pau@citrix.com>
 <cecf40ed-9cf2-4e86-aa82-e0c33643868d@citrix.com>
 <aBoGyekf9KZeZCrK@macbook.lan>
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
In-Reply-To: <aBoGyekf9KZeZCrK@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 14:55, Roger Pau Monné wrote:
> On Tue, May 06, 2025 at 12:16:00PM +0100, Andrew Cooper wrote:
>> On 06/05/2025 9:31 am, Roger Pau Monne wrote:
>>> When a guest is allowed access to cache control operations such tracking
>>> prevents having to issue a system-wide cache flush, and rather just flush
>>> the pCPUs where the vCPU has been scheduled since the last flush.
>>>
>>> Note that domain-wide flushes accumulate the dirty caches from all the
>>> vCPUs, but clearing the vCPU masks will require pausing all vCPUs, which
>>> seems overkill.  Instead leave the vCPU dirty masks as-is, worse case it
>>> will result in redundant flushes in further calls.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> I'm afraid this doesn't work.
>>
>> Unlike TLBs, dirty cacheline can move sideways, e.g. by foreign or grant
>> mapping, but also naturally because of how cache coherency works.
> 
> Does such sideway moving also imply that local WB{NO,}INVD on native
> could be equally bogus?
> 
> According to the SDM, cache lines can indeed move between processor
> caches, but the memory controller must always snoop such moves and
> flush the data to memory:
> 
> "Here, the processor with the valid data may pass the data to the
> other processors without actually writing it to system memory;
> however, it is the responsibility of the memory controller to snoop
> this operation and update memory."
> 
> So a cache line moving sideways will always be propagated to memory as
> part of the move, and hence the data in the previous pCPU cache will
> always hit memory.

But that's only one of the two aspects of a flush. The other is to ensure
respective data isn't in any (covered) cache anymore. IOW dirty-ness (as
the title has it) isn't a criteria, unless of course you mean "dirty" in
a sense different from what it means in the cache coherency model.

Jan

