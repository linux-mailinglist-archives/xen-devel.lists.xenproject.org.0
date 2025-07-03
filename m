Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C85AF7526
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 15:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032138.1405890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJjE-00078w-4u; Thu, 03 Jul 2025 13:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032138.1405890; Thu, 03 Jul 2025 13:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJjE-00076d-0l; Thu, 03 Jul 2025 13:11:52 +0000
Received: by outflank-mailman (input) for mailman id 1032138;
 Thu, 03 Jul 2025 13:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXJjC-00076U-Du
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 13:11:50 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46bfb3ad-580f-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 15:11:48 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a528243636so5038399f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 06:11:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540a89esm16713250b3a.17.2025.07.03.06.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:11:47 -0700 (PDT)
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
X-Inumbo-ID: 46bfb3ad-580f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751548308; x=1752153108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DD4w0c+odEczAPAqIViUd7g8L5CeZDtJKo/zGztJVmg=;
        b=ZXc9ZnyAo6myJy3C33P7xEnWr0R4f2UndO00wGtht3PjC0abr2BTKDW/H1sEHOy1A3
         /A+U2PXNPLpJhKlOafDQ35PefEDzlppFw4Q/9OTp7AO+BMFRDqjTUC/xevQZATfdRfPA
         k0UZ7uHScvH5RMMaBHDqfPb1Hpj6p9VLHUQUXyhqblCqq9UscWUBy7IadqwTnzYt8nkp
         1lTwqkbNgfqzX9Rtu4F7FGX/3MJDuyGxRefXcPlXsR54t8vm2SBSEgBhhvW+YpODhlKZ
         KxgyLozNnUZPb+lk2UZ9RyRIXaGgH0y0Z+Djj4j0Mw5yQFb1/TY+rcU17H+2LU8P82YG
         pp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548308; x=1752153108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DD4w0c+odEczAPAqIViUd7g8L5CeZDtJKo/zGztJVmg=;
        b=hwzPRnG/kHNrjeKH2NE5o6cwC8zCS+XddxI7hSeP+hyFt/8ggf2yMQyqmlBbAEWNFx
         1qhnR+xxABXbPAEUsPAHSGc8Pu7R3zX9OYbePMBI+GwwYxN7EmBOIwRnS0psEeZHTGrr
         JRmg/H2YOKzsuL4vYpMudXGKmPYuOtsttwlIRPWbxBI5i8mZUAaSBt6FojCJoq4WOMuo
         EoHkLPJNeNZGL/gIeFxxdZxLhvc18eoxK4RSUSee/RuJ+vuYiXNb8q8TfQ1OpGrIwGxe
         7OfaWLavAEzUH06J9ZOABzUGQVH/JiMmmlEJfd7xzIjarxiEFfulb9AZB85qJvDxWjZl
         4Ibg==
X-Forwarded-Encrypted: i=1; AJvYcCV4yQcDG7xT9h2vVNmccpIqNx3yS/WSGFLw2qjwdA8DhlMvQH+041E9+ZQYN+gi/rzGFSpIsKSEYq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQkV1Jc3M/Mb7uujlO1XoCS2HgXsB/soNhYrgz7NFfADSTVBFY
	nzV5Fv96aJNzqCkKhTVrtGP5OZoobxrTEQQJ+n8BwUgNZcu/XJeJwdS7PHRN7uo3fQ==
X-Gm-Gg: ASbGncvpLVdqs8drHrOURzwINb8YiiSLfunSukq2qwzRLoqwMDT0f9BDMxhoOp4mKA5
	TtTO9KqMUMW+RDFURDVw84Vww2DGtRGhyXCBvrPVF9GrZhMJQ/2potxyZALi4yRBTdWDn1XnlWp
	uE9TiQr2iVUYIJ0POCojMxL3bcaWa/SThFk3sKAfeaqK+s1g804O8qpyE8Q9q9lOzBHhVhje7/3
	EXl6IOTNOExpjWkdsR/SFxc3xVi3Qd2CDBHUwPp3R/j3Bc/ggAEo7dLA4Do+ZLPVAIlGZdREdv8
	/EFNaq4RBOS51DXDVU4F9etc0inCDpvOAiFVHuzxTRGr+W3FbW7YDPaJLwpJOYMHd+TKWvSBAjf
	kIwfxNG5MmbWmpyphc1Fb36GiyxI/kSdKLeY5f5Dl9jGHGe4=
X-Google-Smtp-Source: AGHT+IFjcriogCTOFKBW+gt+s44282+Ay/yKde/W1w0YthwRXgVWRV/5xolf53mKPERIWcDAvqj52w==
X-Received: by 2002:a05:6000:4022:b0:3a5:2208:41d9 with SMTP id ffacd0b85a97d-3b32f28d80bmr2784478f8f.40.1751548307801;
        Thu, 03 Jul 2025 06:11:47 -0700 (PDT)
Message-ID: <0c5ec929-58db-4c34-bc8b-5d9c49c2d0c8@suse.com>
Date: Thu, 3 Jul 2025 15:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/idle: Fix buggy "x86/mwait-idle: enable
 interrupts before C1 on Xeons"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-7-andrew.cooper3@citrix.com>
 <5ad4dc09-981f-4ad4-9e20-2125f727046c@suse.com>
 <0b3d68f3-da32-4cec-a73b-ac4b3abb7617@citrix.com>
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
In-Reply-To: <0b3d68f3-da32-4cec-a73b-ac4b3abb7617@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2025 14:10, Andrew Cooper wrote:
> On 03/07/2025 10:43 am, Jan Beulich wrote:
>> On 02.07.2025 16:41, Andrew Cooper wrote:
>>> @@ -461,12 +468,19 @@ void mwait_idle_with_hints(unsigned int eax, unsigned int ecx)
>>>  
>>>      monitor(this_softirq_pending, 0, 0);
>>>  
>>> +    ASSERT(!local_irq_is_enabled());
>>> +
>>>      if ( !*this_softirq_pending )
>>>      {
>>>          struct cpu_info *info = get_cpu_info();
>>>  
>>>          spec_ctrl_enter_idle(info);
>>> -        mwait(eax, ecx);
>>> +
>>> +        if ( ecx & MWAIT_ECX_INTERRUPT_BREAK )
>>> +            mwait(eax, ecx);
>>> +        else
>>> +            sti_mwait_cli(eax, ecx);
>> Actually, I'm curious: It seems quite likely that you did consider an
>> alternative resulting in assembly code like this:
>>
>> 	test	$MWAIT_ECX_INTERRUPT_BREAK, %cl
>> 	jz	0f
>> 	sti
>> 0:
>> 	monitor
>> 	cli
>>
>> CLI being a relatively cheap operation aiui, is there anything wrong or
>> undesirable with this (smaller overall) alternative?
> 
> Other than it needing to be mwait?

Oops.

>  The overheads aren't interesting;
> they're nothing compared to going idle.
> 
> What does matter is that such a transformation cannot exist in mwait()
> itself, as that breaks acpi_dead_idle(), and if we turn this mwait()
> into inline asm, there's only a single caller of mwait() left.

I was rather think of it living in something derived from sti_mwait_cli(),
which could then be called unconditionally from mwait_idle_with_hints().

Jan

