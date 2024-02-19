Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F004985A471
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 14:13:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682846.1062040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3S0-0006Hj-Ik; Mon, 19 Feb 2024 13:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682846.1062040; Mon, 19 Feb 2024 13:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3S0-0006EZ-G6; Mon, 19 Feb 2024 13:12:52 +0000
Received: by outflank-mailman (input) for mailman id 682846;
 Mon, 19 Feb 2024 13:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc3Rz-0006ET-2D
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 13:12:51 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 939dfef0-cf28-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 14:12:49 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso29787235e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 05:12:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b0033b48190e5esm10330769wrq.67.2024.02.19.05.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 05:12:46 -0800 (PST)
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
X-Inumbo-ID: 939dfef0-cf28-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708348367; x=1708953167; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+SQhz9bz5DkV8QKGE2lk//F5x/WEOKaWqPgS8b52BRQ=;
        b=ZtNkAtrRlCFtHBoQ16uZdDmrfaC1ikpOMc68/5revpwZ98uNb1Dh4ye6Tvvt/uK+ic
         U20YH/FvwxyHwKbxWCNfwSqnmmPdCPci3r2zJaGBNUXE2q8HX51nuOdcOTjsGYi5Vcxs
         eSY/6i8Onjngf+63ewbIbfAZOnvFSLV741LKl01wC0ZASfmwqSCDuPUPywYNetx/ia9e
         fOPYLbOROk6hajSfVKS5PQUAAeEfckH3vfeaV6WpQ6LCAXm9UQ4yaC9ZF8hkocc/BqTj
         e8rwiqEItUKXz07nK+7tutE9jYEGDKPYB63z5ututNyaOTa77uf5BaSkt7YWkZxg4oSF
         PTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708348367; x=1708953167;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SQhz9bz5DkV8QKGE2lk//F5x/WEOKaWqPgS8b52BRQ=;
        b=SNkyBIIYvnnO3MtIj7kdVnOcvsYA4As4ZsYg2iqXTG1dKVOoFztITrCnrFb+3uS/Ld
         iazBbmoSUROcfPkDEV0pXusFhf8aFdob5qCwRrGib6EK+l51FKvYArBnKksF+JWL2Hn6
         IC3gsfka3K1xvBIlEyXIwXYSbmbLVj83C/St00YyaxFwYky+XmbYqmN7CFGIvXDwATaC
         dkC/7ZrK4vIIpZCCNBNVA3VhNUHJ46/Odt2bnQqxqvi3lAeTKuG4IJjYwmsKtGIO8HAF
         kMRUAA65uLveRoJ8yYuG32lK41u2VWfK5VI1hwz/zmfIO7RQKEDJtalAJyV0VVKdhH1i
         Mpdg==
X-Forwarded-Encrypted: i=1; AJvYcCVyC+EM6oe37wKzt+RXTndjBZ1wNsV9aDxVkE9Bv7x+lCrt2E2X2BI0mUxeF3YQw6NwE7q4MYiUkvbllHnj3zCG0B7Auy5qlt21oxDloHM=
X-Gm-Message-State: AOJu0YxP+ps0lYKcF7t8vQ/Oysl4nhXT5x0CGDbTclCDG9l0rLryZ2x2
	VYT1P3oNPZ01ivgg8rIHAaBCjiH0bsjZuV/7pDon10n7r+0bJamhmuIqkPo6yA==
X-Google-Smtp-Source: AGHT+IG2UxnGZZICregw2HZKS8TCYBUvJRgU+tkohDP1e3pbPoACQ+yLbuyFaV51CaVq+TABtsVu4g==
X-Received: by 2002:adf:e947:0:b0:33d:2567:995c with SMTP id m7-20020adfe947000000b0033d2567995cmr6009730wrn.1.1708348367244;
        Mon, 19 Feb 2024 05:12:47 -0800 (PST)
Message-ID: <39e8845b-8d41-40e5-8e7a-49e734012d78@suse.com>
Date: Mon, 19 Feb 2024 14:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13.2 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <20240219114750.151730-1-stewart.hildebrand@amd.com>
 <8e807612-fd14-4d01-b200-1deb583afa22@suse.com>
 <68bb972c-5e45-4706-a06f-0dcd65c40581@amd.com>
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
In-Reply-To: <68bb972c-5e45-4706-a06f-0dcd65c40581@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 13:47, Stewart Hildebrand wrote:
> On 2/19/24 07:10, Jan Beulich wrote:
>> On 19.02.2024 12:47, Stewart Hildebrand wrote:
>>> @@ -895,6 +891,15 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>>  {
>>>      unsigned int i;
>>>  
>>> +    /*
>>> +     * Assert that d->pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
>>> +     * is not suitable here because it may allow either pcidevs_lock() or
>>> +     * d->pci_lock to be held, but here we rely on d->pci_lock being held, not
>>> +     * pcidevs_lock().
>>> +     */
>>> +    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
>>> +    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
>>
>> There's no "d" in sight here, so it's a little odd that "d" is being talked
>> about. But I guess people can infer what's meant without too much trouble.
> 
> I can s/d->pci_lock/msix->pdev->domain->pci_lock/ for the next rev.

Or simply drop the d-s? That would be better for readability's sake,
I think.

>>> @@ -313,17 +316,36 @@ void vpci_dump_msi(void)
>>>                  {
>>>                      /*
>>>                       * On error vpci_msix_arch_print will always return without
>>> -                     * holding the lock.
>>> +                     * holding the locks.
>>>                       */
>>>                      printk("unable to print all MSI-X entries: %d\n", rc);
>>> -                    process_pending_softirqs();
>>> -                    continue;
>>> +                    goto pdev_done;
>>>                  }
>>>              }
>>>  
>>> +            /*
>>> +             * Unlock locks to process pending softirqs. This is
>>> +             * potentially unsafe, as d->pdev_list can be changed in
>>> +             * meantime.
>>> +             */
>>>              spin_unlock(&pdev->vpci->lock);
>>> +            read_unlock(&d->pci_lock);
>>> +        pdev_done:
>>>              process_pending_softirqs();
>>> +            if ( !read_trylock(&d->pci_lock) )
>>> +            {
>>> +                printk("unable to access other devices for the domain\n");
>>> +                goto domain_done;
>>> +            }
>>>          }
>>> +        read_unlock(&d->pci_lock);
>>> +    domain_done:
>>> +        /*
>>> +         * We need this label at the end of the loop, but some
>>> +         * compilers might not be happy about label at the end of the
>>> +         * compound statement so we adding an empty statement here.
>>> +         */
>>> +        ;
>>
>> As to "some compilers": Are there any which accept a label not followed
>> by a statement? Depending on the answer, this comment may be viewed as
>> superfluous. Or else I'd ask about wording: Besides a grammar issue I
>> also don't view it as appropriate that a comment talks about "adding"
>> something when its adjacent code that is meant. That something is there
>> when the comment is there, hence respective wording should imo be used.
> 
> It seems like hit or miss whether gcc would accept it or not (prior
> discussion at [1]). I agree the comment is rather lengthy for what it's
> trying to convey. I'd be happy to either remove the comment or reduce
> it to:
> 
>     domain_done:
>         ; /* Empty statement to make some compilers happy */
> 
> [1] https://lore.kernel.org/xen-devel/98b8c131-b0b9-f46c-5f46-c2136f2e3b4e@amd.com/

This earlier discussion only proves that there is at least one compiler
objecting. There's no proof there that any compiler exists which, as a
language extension, actually permits such syntax. Yet if the comment
was purely about normal language syntax, then imo it should be zapped
altogether, not just be shrunk.

Jan

