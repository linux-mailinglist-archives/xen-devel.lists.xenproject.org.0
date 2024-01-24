Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9336583A2E1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 08:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670729.1043695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSXgJ-0002FQ-2r; Wed, 24 Jan 2024 07:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670729.1043695; Wed, 24 Jan 2024 07:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSXgI-0002Cb-Vz; Wed, 24 Jan 2024 07:28:18 +0000
Received: by outflank-mailman (input) for mailman id 670729;
 Wed, 24 Jan 2024 07:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSXgH-0002CV-KM
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 07:28:17 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2360b9b1-ba8a-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 08:28:15 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cf0390eddbso29594731fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 23:28:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bp15-20020a056e02348f00b00362768a8dccsm2544939ilb.30.2024.01.23.23.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 23:28:15 -0800 (PST)
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
X-Inumbo-ID: 2360b9b1-ba8a-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706081295; x=1706686095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13J/573p5yTOl4Bv2jB6f75mu7N4YGoeH7GAbsuZwXk=;
        b=U+XySo6RRQVHFvO3S/ZtfD0G+VkJKB9UcuBwwUCxc0Tz9DUU1yR2vjxo+3Tu6bPec4
         Qg9KsTzbrC+lwUKjY1Pis15uINumvsep79tJhZMlBW9vvsZoRLE3IpmnKZ32629kOZ2e
         7J8+t+hqHXmefBOi5flxgNiDkxtflkSiPPe0hR1BHv1mIagrERUxTLRI0bf4O6IwhJEN
         w4GmOTfXzwEMGp5Fh7e90JMeYJRbjjKOeE6bNf9yXsNmhBjdsYTFqEN2UuJ9LKJqaeTe
         nThxaoUy3uZ/CxxVi1q5ZD8FbRVKNLrCkLfJi1YTdu5IMHRaiAGgngbAfuh9H8Wsygts
         QLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081295; x=1706686095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13J/573p5yTOl4Bv2jB6f75mu7N4YGoeH7GAbsuZwXk=;
        b=G0e6NvtkaFxQHvhDLfddxxTgS3+Y/8QbhgskWDURd/btTlkYB1AAEv0baY7I6q+3cc
         xFvJUOJGtlVLHdu+zf/YTSPRXTVylNKZop+Py3PqVSJWuo/mTaqBANKuZPlflTtUZiHv
         MRaIqXFt2FP7cyuGNWi3CE/xizHxc1ejvwE4dUurfAG5UCoc7LiGlphFkCTuMHPJ0So9
         jQABzQFDAXnRFYtYJZLEY8W665U7dIpj6Dsl93DvRA8LFZ1Zn9nz9gB1/Nh9jKEowc6A
         FN9q3R5oADV2yoRWyv/C+nqbNvawNRNrha1jkdpvhIZsbAKN8ZTkDoP7TBYiX7Ub/9qx
         DdWA==
X-Gm-Message-State: AOJu0YzOnuO4XUjyO/Pn4V0gIhoP8UpC295bCoHhzavaEWd6GFfBVwRP
	sKt3gIECtdobntO2hYdwiVDFS11cIcY5thZ49KoOARyHWT3+WbkVCgJxyD2ZoA==
X-Google-Smtp-Source: AGHT+IFevQRJWrlFfmpyhLUhWszya8KaKTrlU+ZT1o+xmbzitNjTi+zr+uP17fWY3tmz1gEmlrnTnA==
X-Received: by 2002:a2e:b163:0:b0:2cc:dcb6:5191 with SMTP id a3-20020a2eb163000000b002ccdcb65191mr567619ljm.62.1706081295529;
        Tue, 23 Jan 2024 23:28:15 -0800 (PST)
Message-ID: <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
Date: Wed, 24 Jan 2024 08:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
 <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 02:34, Stefano Stabellini wrote:
> I managed to get back to read the mailing list and noticed this patch.
> 
> Is it still relevant and needs to be reviewed?
> 
> Are there any outstanding disagreements between maintainers on the
> approach to take here?  Or should I just go ahead and review it?

It is still relevant from my pov, and everything that may be controversial
is said ...

> On Tue, 9 Jan 2024, Jan Beulich wrote:
>> The type not being used in do_bug_frame() is suspicious. Apparently
>> that's solely because the type uses a pointer-to-const parameter,
>> when run_in_exception_handler() wants functions taking pointer-to-non-
>> const. Drop the const, in turn requiring Arm's do_bug_frame() to also
>> have its const dropped. This then brings that function also closer to
>> the common one, with Arm's use of vaddr_t remaining as a difference.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is an alternative proposal to
>> https://lists.xen.org/archives/html/xen-devel/2023-12/msg01385.html,
>> albeit without paving a road towards Andrew's desire of getting rid of
>> show_execution_state_nonconst() again. Retaining (and propagating) the
>> const would imply the need to cast away the const-ness somewhere on (at
>> least) the path to invoking gdb stub code. Personally I'm averse to such
>> casting away of const-ness ...

... here. Without Andrew commenting, I'm afraid it's not actually clear
whether he objects to this approach, or is meaning to tolerate it
silently, or actually views it as a step in a good direction, even if
not quite getting where earlier on he thought we may want to move to.

Jan

