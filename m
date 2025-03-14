Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF5A60B54
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:26:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913964.1319801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0My-00064H-Cd; Fri, 14 Mar 2025 08:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913964.1319801; Fri, 14 Mar 2025 08:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0My-00061v-9Z; Fri, 14 Mar 2025 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 913964;
 Fri, 14 Mar 2025 08:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt0Mw-0005yT-9U
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:26:14 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd8259cd-00ad-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:26:13 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390fdaf2897so1604047f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:26:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df344dsm4969432f8f.10.2025.03.14.01.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:26:12 -0700 (PDT)
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
X-Inumbo-ID: fd8259cd-00ad-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741940773; x=1742545573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IF2zOYedI4KkuUV0EmcyNGux7EbwCaCv3DcoObu87fI=;
        b=C0ddhSDJmU3CVvDMvnDUlDlbsYx7i0Xa8Vq26XDMS3GPqPJecOVEvIBliA9GftOVYn
         YWKbu3AerFiSh7Xi2Pw/405rtZd1nrziHfc7QNoafNdbnBI47HM81Y+kyDRX/pG1V+TI
         gs8haA+Gyt/u1XT8u6OQbgOCmrBBeyVtLlCpX/hvUsNOHypW8H6dnx7uDKk0o35zHtRk
         /ovZFjclxCCPRCOAZyLfxQ/7E9S0Pjt61ysBI1y/OXiDwti7dCcHCC5qAXK6PAM0EaSK
         MYyN5CxYYltc/9Y+W4I/yDeIA+B0v6DYjMhF2M5ymzUWaAGPIHVJju90WEdZkrDkUYl9
         sELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940773; x=1742545573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF2zOYedI4KkuUV0EmcyNGux7EbwCaCv3DcoObu87fI=;
        b=jGMgV7Tt7LMIYjMN20P4fVYxa1qhM2Mak3NK/UCmTEU8347qXkUryUOhHUuP528fjM
         plGz/ZbHd+xYY5u7+kK4vAD9FE0wZGQqvvOTelW2Y3zWV4ijjRtdELlE8TpDEcOUVQf8
         c97rzJnMdJdnDap20eOLM9cxjXut1DYCMmRawYS/rf+VO28MHttRCMEAm9DRnGFHTC8R
         FLOJm+wsLdOqEan8UlXTC0hYo7OfvUKnhnVtcwsnXhjqI4lHpO1yg6UQ/TaL8qbHQ8bb
         IcKME93YdTPBMORHYIn1qmWR1+XjAvcuTlQdFlewgDeXXb8RGI0l+bEzwpGTBE13h/r5
         LN7Q==
X-Gm-Message-State: AOJu0Yyj4zfUdUJ/uDDVlULDGIoN+7q6MOUWHk+nL1ILxNsT1rlESG6K
	JwgYv5OEJh933iDZE5xhXJiQtRjOBnbVcbiFyMTO/uHrPF/f+sD9EnxCMYTcmA==
X-Gm-Gg: ASbGncuqzrk9mlf3Yz6BTrELmepL0LOj6wbzyGqf4Mkaj7rmn4TIE7LLTIpQh8/RDwX
	ha+6E+bCNJ1nLw/eqnrkrT6A4pQ8cJGVe3zHEfbDwivblJA4TciGQehm7V/gN1ES8MDbgzRNFKZ
	uXvmzyF+GPFCLwLBTZ56MTunJIQ/Jj7vx35bk4NlmleIS4fJMMnL2q22VkBxV5vF3fCob0rbZmn
	15lf23TzKcdvPxUIApAO5EfaS2ShGYfCETpDO7oSDZuh94YrImu8lmHd0FJc1W9hN01QMfDIw2z
	30Lu5qK+JgLsfHH6y2lkhAF1WEueomwy9KS1f0WknLiNWo4OgwuBlLhxaEruTeonwk6H/J4H8uR
	Cr0uQyQxRLuYrBFdswoFeZSaTH3zxP4g4lGIRSJiE
X-Google-Smtp-Source: AGHT+IFpu67XOuQ3xCNsuX8MtWI6vHtlwtCC6nUp3JvtQbBAauGELfr2NyFe5R+KGscSog8gL48x8g==
X-Received: by 2002:a05:6000:1786:b0:390:ee34:228b with SMTP id ffacd0b85a97d-3971e876832mr2140463f8f.24.1741940772638;
        Fri, 14 Mar 2025 01:26:12 -0700 (PDT)
Message-ID: <cc789c05-3a10-46cf-b979-57b4c29bac4c@suse.com>
Date: Fri, 14 Mar 2025 09:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <Z9MaZVMtI86eAmDJ@macbook.local>
 <9e619631-a7f7-4f69-aff8-13202d61b79a@suse.com>
 <Z9PnDOn4t0vzApaQ@macbook.local>
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
In-Reply-To: <Z9PnDOn4t0vzApaQ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 09:21, Roger Pau Monné wrote:
> On Fri, Mar 14, 2025 at 09:04:55AM +0100, Jan Beulich wrote:
>> On 13.03.2025 18:48, Roger Pau Monné wrote:
>>> On Wed, Mar 12, 2025 at 03:50:17PM -0400, Stewart Hildebrand wrote:
>>>> @@ -585,10 +601,31 @@ static void cf_check bar_write(
>>>>      {
>>>>          /* If the value written is the current one avoid printing a warning. */
>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>> +        {
>>>>              gprintk(XENLOG_WARNING,
>>>> -                    "%pp: ignored BAR %zu write while mapped\n",
>>>> +                    "%pp: allowing BAR %zu write while mapped\n",
>>>>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>
>>> If Xen now handles BARs writes with memory decoding enabled the
>>> message can be removed.  It's only purpose was to signal this missing
>>> handling.
>>>
>>>> -        return;
>>>> +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>>> +            ASSERT(spin_is_locked(&pdev->vpci->lock));
>>>> +            reenable = true;
>>>> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>>>> +            /*
>>>> +             * Write-while-mapped: unmap the old BAR in p2m. We want this to
>>>> +             * finish right away since the deferral machinery only supports
>>>> +             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
>>>> +             * be better to defer the write-while-mapped case just like regular
>>>> +             * BAR writes (but still only allow it for 32-bit BAR writes).
>>>> +             */
>>>> +            /* Disable memory decoding */
>>>> +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
>>>
>>> I think if the guest explicitly avoids toggling memory decoding Xen
>>> should also to the same, and not touch the bit.
>>
>> For Dom0 I'm inclined to agree, but for DomU-s it may be unsafe to do so.
>> (You may have meant it like this, but you said "guest".)
> 
> Sorry, I'm not sure I'm following.  For domUs the BAR register write
> is not propagated to the hardware, it's just the p2m mappings that
> change, and hence it's even safer to not toggle the memory decoding
> bit for that case? (as there's no write to the device BAR registers
> for domUs).

Oh, right. I'm sorry for the noise.

Jan

