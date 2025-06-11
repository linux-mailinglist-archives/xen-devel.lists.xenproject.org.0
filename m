Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59821AD4A75
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 07:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011299.1389674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPE7b-0004WG-M4; Wed, 11 Jun 2025 05:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011299.1389674; Wed, 11 Jun 2025 05:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPE7b-0004Uo-JI; Wed, 11 Jun 2025 05:35:35 +0000
Received: by outflank-mailman (input) for mailman id 1011299;
 Wed, 11 Jun 2025 05:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPE7a-0004Ui-EX
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 05:35:34 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e250111d-4685-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 07:35:29 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso3819750f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 22:35:29 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b419:d0bf:1423:db44:9404?
 (p200300cab734b419d0bf1423db449404.dip0.t-ipconnect.de.
 [2003:ca:b734:b419:d0bf:1423:db44:9404])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b653dsm14234262f8f.39.2025.06.10.22.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 22:35:28 -0700 (PDT)
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
X-Inumbo-ID: e250111d-4685-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749620128; x=1750224928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V3brsPWTEDu0RaHKwOcYmvWaS0b6yWvh3OrKsmioVpY=;
        b=ff85+UXCnsvmRfWuSaT2TWIPup9ECtvfPbTZIMvQU9WVm54YPcmDQSfCvtghjPL8BT
         ksPQKAvaj2do4PjX4QS/qaY2ch9BxXWukEv5D0YNIADpgGV9JdI6Ca6fyBkuBkI0Ov4g
         N60Qt/GABP/f6pMFYHv1kyfLkvsca9DyTx71qEz3BelPbKICeFFXxo625ttyMSyhPRxh
         grCRKtE+dPpUZ0t2go7TzTIOIAX7ANXN0fSWJXDqICo28BUw8j8p/rHYd8qmFcXybMPY
         5eFMrBDAhAHycxl1aOs9iALl7UkJwskwR93ZQ/OuZaFO5dIhGunMuL/XWvJfZIxsZ/eT
         z9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620128; x=1750224928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3brsPWTEDu0RaHKwOcYmvWaS0b6yWvh3OrKsmioVpY=;
        b=Lj352Ag2ltmWL/Cr0DlsgXNziEF1tfL2iOaihL7wncq4hSxDIdZNxwlSfRBEBt6l9f
         vX8b4SpmMuyx1l81fWQCz0HFxSMiOuoB3UV+EcvoWaIFqNGy/yMm39RMfV3DF8q0kNO/
         tzrJQm6Q+hPP+sU09K/p6s/r4kzbzi/nfipnOZrsK/tl40eTRFHJ7gotn+hcl7Eq8pLB
         WAaIXbS/WC/Fx8htxeK+MQlbAaSV/3YNPcqqAwRBOPw3cQpfNFS0xglm/gd8cPs2QoWR
         jyRTtUruZenBACvmKA/1oKZzPCm4hqLfETFxm41Fgs0dbeSbQgSR2IKi3J3UIEgBnTBX
         rsjA==
X-Forwarded-Encrypted: i=1; AJvYcCVOZxgYaAMc+CWkBDGu8FblPeTASLrX1mzNwHns7Sz+3OChrr6d1TaPUlXDF1U/97kS0agLEcDSO8A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxppjYYxb1Rl8OrJZYTo3CgTcaiEEeiR4PnQniNXrflcdxWAC9u
	7sG+rljUVbhzjD+HkW6VmnyaseJcDrwgu90JTbEe6wvofQ6VW9U9eSg+BBo4QAtfCw==
X-Gm-Gg: ASbGncuxKzJO8m27sYB31spJUf9lPgYgkcrBetlRmFSsoSzVczPPjFSi70xmZRpkIzQ
	71qsg4vCIUU0J07FyRyxvdBOMKUkEdckrciGD8MbD5Uu0oO5HWJNnMyg0lYyfVxkvmjWS8bYG5L
	kaDwm4YHow2BKgIQrtC9WshQ4vG0LG3o7FDCNd9v5/oo6Ag5bcI41aVzYh659MY7Di19bQncB1t
	rtR+2cmCVFOFBPZugpd0CHqwdkhufR4sdb+S+hSg3vsc16EBIqb29mTg0Fzx81FpYJ6/xBFAcZc
	8B35GO6XNrN7GQz/qruY6unsuOC92rTknNIf/HxgRupcRyFj1Tz9LeeVRLxJYFFaM8T0usiahta
	cUPNXdkokc5bvGe2THquc/8At2rJXPFaiQqxOx86smoS6pcd26wDmEmN5Izvy1BGSQ8M6WtECoZ
	+BZKOoHW6VfiuVPaxM684+
X-Google-Smtp-Source: AGHT+IG/57VMqqUUIEyILTVi5t+z3CgCv1A2iklfezP2C/9YNIQmiBDFsLUxXqUJl3t35PurUZE09g==
X-Received: by 2002:a05:6000:4313:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3a5586f450cmr1166272f8f.57.1749620128539;
        Tue, 10 Jun 2025 22:35:28 -0700 (PDT)
Message-ID: <ef46b3ec-af0e-480f-b206-5191c79e62f9@suse.com>
Date: Wed, 11 Jun 2025 07:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device tree
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Denis Mukhin
 <dmukhin@ford.com>, Alejandro Vallejo <agarciav@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-7-agarciav@amd.com>
 <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
 <02ffa9cf-b5cd-431a-834a-a11bbf310196@suse.com>
 <03be429c-063d-4467-91e7-7ef2e148a2fb@amd.com>
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
In-Reply-To: <03be429c-063d-4467-91e7-7ef2e148a2fb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 19:39, Jason Andryuk wrote:
> 
> 
> On 2025-06-10 02:56, Jan Beulich wrote:
>> On 09.06.2025 19:07, Jason Andryuk wrote:
>>> On 2025-04-29 08:36, Alejandro Vallejo wrote:
>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>
>>>> Add support to read the command line from the hyperlaunch device tree.
>>>> The device tree command line is located in the "bootargs" property of the
>>>> "multiboot,kernel" node.
>>>>
>>>> A boot loader command line, e.g. a grub module string field, takes
>>>> precendence over the device tree one since it is easier to modify.
>>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>>>> ---
>>>
>>>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
>>>> index cbb0ed30a2..dabe201b04 100644
>>>> --- a/xen/common/domain-builder/fdt.c
>>>> +++ b/xen/common/domain-builder/fdt.c
>>>> @@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
>>>>                printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
>>>>                bi->mods[idx].type = BOOTMOD_KERNEL;
>>>>                bd->kernel = &bi->mods[idx];
>>>> +
>>>> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
>>>> +            if ( bd->kernel->cmdline_pa &&
>>>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>>
>>> The logic is incorrect - it should be:
>>>
>>>              if ( !bd->kernel->cmdline_pa ||
>>>                   !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>>
>>> If there is no cmdline_pa (which happens with the "reg" property) or the if there is a 0-length string, then check the DT for bootargs.
>>
>> Even that sounds bogus to me: There's a difference between "no command line"
>> and "empty command line".
> 
> Yes, you have a point.  The difficulty is grub always provides a NUL terminated string, so Xen can't differentiate the two.

Which may call for either special-casing GrUB, or at least calling out that
behavior in the comment. (Ideally we'd still have a way to distinguish
between both cases, but likely we'll need to resort to documenting that some
dummy option will need adding to tell "none" from [intended to be] empty.)

Jan

