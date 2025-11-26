Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36030C8A1D0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172830.1497924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG2U-00047a-7Z; Wed, 26 Nov 2025 13:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172830.1497924; Wed, 26 Nov 2025 13:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOG2U-00045Q-3r; Wed, 26 Nov 2025 13:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1172830;
 Wed, 26 Nov 2025 13:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOG2S-00045K-Ho
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:58:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd2e42ac-cacf-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:58:30 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so59446015e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:58:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adf0b2asm43223625e9.11.2025.11.26.05.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:58:29 -0800 (PST)
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
X-Inumbo-ID: fd2e42ac-cacf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764165510; x=1764770310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7db6qDzm8YIm7kDoOgVpJk8fmKjTV73UtbLjlLE9gMY=;
        b=ZNItB5O51/SrTodUsWCccycmyla+Vhn3TbnNU1ZZ/v9JX2pqSF3wviZjKG4knQ6nnt
         tB/0gHYvOr8DHO4GwaD5miaE9ATQD3bVcHXaxvZxfzLRpadqb4QRDiYNS2RLSTSlb9Oo
         ODU14Bh9GVELPUvTby/Vqj7G5Jc8FrEWSWhhbvqQZ+nhn5MaERgxJuiZ5C4AZ75eHgRh
         3uUvRDsIMlwtkSppKI+KPUEvUhcHz6sqwAifx3kutDvr1gAIIx6dton+l8cDvLm9aLql
         Iv53IVxuZUjCbyIrk4fgrNdoEgbKxOx2KL8Wv74e/6Hu4IujvqPRNcx2RjefgIPBnBR0
         fGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764165510; x=1764770310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7db6qDzm8YIm7kDoOgVpJk8fmKjTV73UtbLjlLE9gMY=;
        b=Mn4Zo2rokue2Y2yl+66aYrk40CRviFckvfDl2qgX/VgZh3rxmJ0gFDof1VURs9ejeX
         AhBNQNpWBHMBvP2W2LeqS06yzM5twgvasVPZwZkAzc1M+p7FFLJI2nX4pPUGH7q4F4gN
         U6DIVH6FBvHiWjO9HETz0waaZbHRobm9fgr4Amm08uouOLf0ojaxPqhEnk/i9bumz6VB
         2EC1tiAwZMj+2V2EYLksE1CwP25zY34L184b57KqyjO4K5s51RWab7vjpnkebGhEGrmg
         cNjdu02JeOscZ1yYcH31uVE1Agk7Uxt3rPx5CcouIGLL75JFNfhTJI0lbE/kcisyCs4U
         5Azw==
X-Forwarded-Encrypted: i=1; AJvYcCXdAAb9fBNof6N+GO2ZqeWSOcylZAqCmqlu2MEM+pxlF16kuz17r3vhnp6hWM/AmeXRK3+lYWMkBlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz72Qz90fiPYGA5D4rUovV2uISyu8bD4yFaxsQg3oLSeacfrH0d
	Q1z+uKPPXV2W7GBaYmlwt7tJUYUFo8VV+F8pmJNPQD23uEXose1ZW+uKba2QZPuZwg==
X-Gm-Gg: ASbGncskkVQGCZrC+EZs5/6sQgfksY2SakOvOcXo84aSMp/lm59QOGRMvwVhXc9EQ73
	rM8uCy0UmeQ9Dz4/eYE+MA86waPdW5XQUkgBkpC0YQH7rURLOp1a9GGh7pSPb1NSaumOoJ3rQaF
	auI/B/LyDyx695pJ2BZ3zFI2xen/jnjJtR1twnQEe0/8Zj5VRloTuJY7KWoIvCSpHJlUPqPmeY7
	BGaM1imIRENv65XtzDMV+OhVuyvs+JHzvogQpWS0Dj0pd7xlUIXVFEGlfToNNgzV4rAaY4yoRZH
	LQZ9WkcRvRk2l1Jw7MM93kCc+YWTTOnes6rNc/n33prO0eYUiMOyV/2DJc1IpVzi8qupfesCA3f
	sY6DEz6WXBONXSAIuB06OmcYn6HdF3ZiJkgtU14kh+qJxVxvzVNaHNjxmKCQPP1iOVuHGsvwmUx
	fS9dovfbeDDJc3f4cbCMeaG3tMfp5JGd9MkGUlqMAgSkKDNV8fKpNvNZSyC80VYNHzdGOG/Xbyz
	eI=
X-Google-Smtp-Source: AGHT+IGWm6iAYLsBXmKCkOL+MoZ8EqedCr0JhD8/XYFo+8th9mTr5N+ANt9Oc1gCMVeLMI25QN6jYQ==
X-Received: by 2002:a05:600c:4515:b0:477:3f35:66d5 with SMTP id 5b1f17b1804b1-47904b1fb79mr56360325e9.26.1764165509790;
        Wed, 26 Nov 2025 05:58:29 -0800 (PST)
Message-ID: <3e6d9b74-f606-4774-8767-c71391b9c741@suse.com>
Date: Wed, 26 Nov 2025 14:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86: move arch_generic_hweightl() to arch-specific
 library
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
 <859d60ce-165d-416f-a1f1-89ba11de2839@citrix.com>
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
In-Reply-To: <859d60ce-165d-416f-a1f1-89ba11de2839@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 14:51, Andrew Cooper wrote:
> On 26/11/2025 1:24 pm, Jan Beulich wrote:
>> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
>> index 16368a498bb7..a0ee050c931b 100644
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -3,6 +3,8 @@
>>  
>>  export XEN_IMG_OFFSET := 0x200000
>>  
>> +ALL_LIBS-y += arch/x86/lib/lib.a
>> +
> 
> Oh, I'd realised it was this easy, I'd have done so straight away when
> adding x86's custom arch_generic_hweightl().
> 
> I assumed it was going to be more complicated getting the order of the
> arch specific lib correct with the generic lib.
> 
> More concretely.  Given an x86 lib, we should move things like
> arch/x86/memcpy.S to it.
> 
> Therefore, when we have common/lib.a and arch/lib.a, do we guarantee to
> have arch/lib.a with higher precedence so for matching functions the
> arch specific one guarantees to be taken?

Not with the change above, it would need to become

ALL_LIBS-y := arch/x86/lib/lib.a $(ALL_LIBS-y)

to achieve that, requiring that ALL_LIBS-y won't change into a lazy-expansion
variable. If that's okay (please confirm), I can adjust the patch.

Things would be yet easier if every arch had a lib/lib.a, as then in
xen/Makefile we could simply have

ALL_LIBS-y                := arch/$(SRCARCH)/lib/lib.a
ALL_LIBS-y                += lib/lib.a

Alternatively we could move the setting of ALL_LIBS-y in xen/Makefile to
after the arch/$(SRCARCH)/arch.mk inclusion. I'd be a little wary of that,
though, as it would then be different from ALL_OBJS-y.

Jan

