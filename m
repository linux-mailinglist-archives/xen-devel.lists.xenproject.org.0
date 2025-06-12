Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E29AD6B37
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 10:44:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012562.1391049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdYF-0006TF-1W; Thu, 12 Jun 2025 08:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012562.1391049; Thu, 12 Jun 2025 08:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPdYE-0006Rn-Uu; Thu, 12 Jun 2025 08:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1012562;
 Thu, 12 Jun 2025 08:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPdYD-0006Rh-DD
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 08:44:45 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c4adf44-4769-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 10:44:43 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a528243636so423552f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 01:44:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2364e61b557sm8906275ad.2.2025.06.12.01.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 01:44:41 -0700 (PDT)
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
X-Inumbo-ID: 7c4adf44-4769-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749717882; x=1750322682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lauzLp4/BtyBk+0Qg2N8B8scQ9CseikuBjgHC7SlwKs=;
        b=Oi0bFUStnusOoEvO176C0QfDe+cekK6ZWdf1+8z6VHpYr8L+ZkAt3hyi8k7yhES9l+
         bnyj9hasf1DY5uK6DxNZM/X+V6PwTtuKKV/NzGy2iZ+to62ggG2Pz3R+OG9VmkUB6H4k
         4bpqYC1J6eLXf7ElDTyNmoQg9bQSFJm/Fo0hdFnS6GGzrVHb8nRXBZM9xA5/spE1PPrw
         rLEfCFxVs3x79Q4qzKVwOm8ZG5uK9Rmd98HsDSJfqC70+a3BzHcPwZ4tIBWO7xKEBiUI
         Etd+lH0qe2iVnsU8i/U50fPbtBQQEYUTL3hgxwoG0nAAQ0b9UCWspQOnlblUyB6UL+iv
         cziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717882; x=1750322682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lauzLp4/BtyBk+0Qg2N8B8scQ9CseikuBjgHC7SlwKs=;
        b=NbCSIX7qCnRKHCj3wSRKYDCoy1Y4Zjj15too870tz9FPTDP76t3zCTcAsle10xKKKd
         eTQ3wzeNxZgk8GkYi8zm6upXWhNvJHWOeJZZf8CUVM9xZk7FyCptiXivkcEOGhYSjRgL
         eoo3PTMqz0lEGkADnKz6dC15BKBF8e5OAb3tr9ATdwhzDSvTb1TmHzaOoX/0Qc43sKlL
         Lvbvw1u9p76TZj4mHn8IpDN6PF4f2Qj5/lEVdzatXg/iSeohdRo4ytAQ6FguE8egCvSs
         N1ultF8svAbkjIc73qUhMMcK9HU8ApgYbzAZ81DXutkd4GwQbR09/bC9HZG9kxadFCHt
         aNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo73ezeTvqRcqqxJqmXJH3OA2oc3WSXfPY3JSSqD3yk9OpxwOQYu2LLqgyU0iKk0Mv5E8zigv1zkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBdU7vM2psHd/gMDoyyCquEcgWAfUvmwXBfKty63zrJOoGw14D
	UqP7rsQdpk5brXOjxpDFldwGRVfn2IXfHGMh1AiaXG9rxhLBOIGjCmNEDBM14YgxfQ==
X-Gm-Gg: ASbGncvPYlREdqAW4OtYp2e2eZqePzRg+fwYB678F8phb8fnfcGGhtL/Qyvgq67c3kc
	0r6qagjkb1KstamPhbMrW/NvxQkO/Y3MBvCDj06WV9inHCL6duxDQNTk3Vew4Rw2P2MFUkXGC7w
	EKN2NMqkBp+Hw+8RYrPPVY917vVTCSFdeAG6vNW/U+epXdxFnaqELxTkxoTeYvP5f7p/bTqHmMS
	D/EqCtlNbeQ0SzzIB8CFJq0HzEz6kuRNJcM/XlrvdffcLzSilOmnfDCeeu4vFDeJ2e8BYfF0gEA
	UPvBZIcP/VLZnc4EIDGiOddBhq7uNCCLgmCwocDLe3uXeudkYVZTWaR9HqyISiRLvWvcuHXkIhh
	nnuX/1WDTLAaeuuBlOKHt7vd5luOM96iVEKmyxT/iD85/qo0=
X-Google-Smtp-Source: AGHT+IH5acxiR+LiqzrlaqbDD78/RRFeItz3s6x8W6APCnK6Q3D/1CxtdS6BzGpofqrDr3NlAS7GRA==
X-Received: by 2002:a05:6000:3106:b0:3a4:d975:7d6f with SMTP id ffacd0b85a97d-3a56076b241mr2124525f8f.39.1749717882576;
        Thu, 12 Jun 2025 01:44:42 -0700 (PDT)
Message-ID: <51b5ddd4-6abc-4228-a2d6-fec349a16bfb@suse.com>
Date: Thu, 12 Jun 2025 10:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] x86/hyperlaunch: obtain cmdline from device tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Denis Mukhin
 <dmukhin@ford.com>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-7-agarciav@amd.com>
 <59f37fcc-9226-46c5-8dc8-7bd2100d8f59@amd.com>
 <02ffa9cf-b5cd-431a-834a-a11bbf310196@suse.com>
 <03be429c-063d-4467-91e7-7ef2e148a2fb@amd.com>
 <ef46b3ec-af0e-480f-b206-5191c79e62f9@suse.com>
 <DAKEPTAU5XB4.3NA0LU38UFH6L@amd.com>
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
In-Reply-To: <DAKEPTAU5XB4.3NA0LU38UFH6L@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2025 10:20, Alejandro Vallejo wrote:
> On Wed Jun 11, 2025 at 7:35 AM CEST, Jan Beulich wrote:
>> On 10.06.2025 19:39, Jason Andryuk wrote:
>>>
>>>
>>> On 2025-06-10 02:56, Jan Beulich wrote:
>>>> On 09.06.2025 19:07, Jason Andryuk wrote:
>>>>> On 2025-04-29 08:36, Alejandro Vallejo wrote:
>>>>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>>>>>
>>>>>> Add support to read the command line from the hyperlaunch device tree.
>>>>>> The device tree command line is located in the "bootargs" property of the
>>>>>> "multiboot,kernel" node.
>>>>>>
>>>>>> A boot loader command line, e.g. a grub module string field, takes
>>>>>> precendence over the device tree one since it is easier to modify.
>>>>>>
>>>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>>>>>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
>>>>>> ---
>>>>>
>>>>>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
>>>>>> index cbb0ed30a2..dabe201b04 100644
>>>>>> --- a/xen/common/domain-builder/fdt.c
>>>>>> +++ b/xen/common/domain-builder/fdt.c
>>>>>> @@ -219,6 +219,12 @@ static int __init fdt_process_domain_node(
>>>>>>                printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
>>>>>>                bi->mods[idx].type = BOOTMOD_KERNEL;
>>>>>>                bd->kernel = &bi->mods[idx];
>>>>>> +
>>>>>> +            /* If bootloader didn't set cmdline, see if FDT provides one. */
>>>>>> +            if ( bd->kernel->cmdline_pa &&
>>>>>> +                 !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>>>>
>>>>> The logic is incorrect - it should be:
>>>>>
>>>>>              if ( !bd->kernel->cmdline_pa ||
>>>>>                   !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>>>>
>>>>> If there is no cmdline_pa (which happens with the "reg" property) or the if there is a 0-length string, then check the DT for bootargs.
>>>>
>>>> Even that sounds bogus to me: There's a difference between "no command line"
>>>> and "empty command line".
>>>
>>> Yes, you have a point.  The difficulty is grub always provides a NUL terminated string, so Xen can't differentiate the two.
>>
>> Which may call for either special-casing GrUB, or at least calling out that
>> behavior in the comment. (Ideally we'd still have a way to distinguish
>> between both cases, but likely we'll need to resort to documenting that some
>> dummy option will need adding to tell "none" from [intended to be] empty.)
> 
> We can add suitable comments where required, sure.
> 
> About the dummy option, note that even if we have an option for Xen, that does
> nothing for the kernel cmdlines. If there's such dummy option there I don't know
> of it.

Indeed I meant we may need to introduce something.

Jan

