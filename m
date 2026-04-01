Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBIyHn/VzGnnWwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:21:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFA376ADE
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269979.1558831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qp2-00035t-3J; Wed, 01 Apr 2026 08:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269979.1558831; Wed, 01 Apr 2026 08:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qp1-00034Q-Vy; Wed, 01 Apr 2026 08:21:07 +0000
Received: by outflank-mailman (input) for mailman id 1269979;
 Wed, 01 Apr 2026 08:21:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7qoz-00034J-Ot
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:21:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7qox-000YMk-If
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:21:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccd55d-2eae-0a2a0a5409dd-0a2a4501a526-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:21:05 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ccd570-6fc9-0a2a45010019-d155802cbd2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:21:04 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-486ff201041so64693665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:21:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e86ecf6sm101587655e9.14.2026.04.01.01.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 01:21:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775031664; x=1775636464; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=seIAo9jazCSzDuMCur8dal7aJZxneO3k2hNmp9zzh8c=;
        b=PFKCIDKAJ6jXP2A9+cvAkQRlCOTgjhXQJm7InWvMO4Bl4evTlKjyr7b4GdOxwVbfG9
         Kic/INHeNLQhaxhVNLoPngpS5wYrZNcPGXB0Hul/uhbZRlfy9GQJt7RpCp1s14w9Velj
         DXksiqoGzjM9MNfU7cJL/qKOa3K+BiFvwOV+zsZT31IguoUSX3TnD78uuMJQbJ/zt1UY
         XxazMDS5tYOzDXOpos1ANocX8B18SnkwZtBAlolMy8n391gt4ftEpW7ihKWFI63ZzZwu
         x2RZJkXDwdw2O849nKWyxRr5uc9BbWmlowUDVwsjOMCX/5nvrvpnaonmDlNQI43/i6ay
         tVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031664; x=1775636464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seIAo9jazCSzDuMCur8dal7aJZxneO3k2hNmp9zzh8c=;
        b=WhZ2HRL1Y1DIjNOW2QUq0lTybXD2yXr/kMtr8dTYMT86zW09b6fJqPSh2dzk/w+g+0
         qv0z855bQeNyy1CIvmN51LvR8C/xWWllq5DaS7DTo3rMYExhvrNLe/D5XovOWwWDgNYl
         nsY6bDV2oW8s8U2Zdl0ogxc7VoKH3H42J7aI5YOtW3h8O4hEKUWsnj/6KW+zNnJCAWit
         sr7bpZzVxOKAVa2gIr/b+MCU3LPP1OOK1PDAsgXj0hfyWTitOPpEtoBIy5C7Z3XvcNLN
         yR6ZOTyvQ4BVB053KX9Jgq4TMuT/uIBNo08t6cQudB08I/xgWOE9FO62ddkXdzgft6x2
         AIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUSrTZywa3Y7Fd4ksPosvpGlneG6fdoilpP/t83Up5f+5wGEse58PRRcuS2hIQD65Ms1yQAuGl2LU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyrv0MvX6hK9OV3EWIEmJ+koZoGoswgs9C+frw6Auw/ZYe1gbm3
	cHzUzethsTL/V0DHQFqKL+RrrMdAq2uzCMhgXdIxv+01JvegvComomP1uYPBMTxVDQ==
X-Gm-Gg: ATEYQzzN3qGLIsFJgLxLl5DEtWLK8uFwyixbcOE6Y8NnS/alacMxM5oz+5aCgNc/ItL
	b9zX2FyzVyCREEOk48FwaaXuC0jvBE5BqyYn0FGCAjmYuXRZjVC1adqK4oK8/uU3aDiDuSw4w1u
	zAsd02kpe3esPXfmbcxwm4vLNS4QwXGSGAXDcnDja6OAGqPyOKoGux+y7rNBCtNhPM5Wgcb/d5v
	izOT51NQltSkVAXGjOJZyHlBu5qK29UL/dQUFwPEajbnkjURQ1kQX+B4t1jetn30y2QOHPxoJUd
	gI8l+L4CkQFbCabXZcRDt3xyj2Jv8gCx5fN6kZpARPOqOMed1LzTgHMUe+iXoXY5UgSMGlKR+fY
	tV+gkrp08900D5uIN6ZB2ulDtwSAT7KewMsm1aaVN7OHO9jKBvzEw40r275qBgUh4gVHhNXvjUs
	sEXysB02WbnQt2E05H9CzkWxU3twuey6qs/b1kpu5Qo/Vm1rzLbpc4t0mcFeCRLAUnbvI2+1q2P
	+8SBo66pn6w/LY=
X-Received: by 2002:a05:600c:4f43:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-4888358cebemr44468135e9.18.1775031663675;
        Wed, 01 Apr 2026 01:21:03 -0700 (PDT)
Message-ID: <46f4a4c5-cc44-47d7-8d6d-03ddaa75bb7f@suse.com>
Date: Wed, 1 Apr 2026 10:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
 <f546ae19-2107-469e-847b-7a4cde2c95fd@suse.com>
 <0275be7d-d1d9-47ee-bec2-bfbbb90b4bae@epam.com>
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
In-Reply-To: <0275be7d-d1d9-47ee-bec2-bfbbb90b4bae@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1775031664-B78FC185-2F43AE5F/0/0
X-purgate-type: clean
X-purgate-size: 7091
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DBEFA376ADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 09:59, Mykyta Poturai wrote:
> On 3/31/26 17:55, Jan Beulich wrote:
>> On 09.03.2026 12:08, Mykyta Poturai wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -175,76 +175,92 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>>   
>>>   bool vpci_process_pending(struct vcpu *v)
>>>   {
>>> -    const struct pci_dev *pdev = v->vpci.pdev;
>>> -    struct vpci_header *header = NULL;
>>> -    unsigned int i;
>>> -
>>> -    if ( !pdev )
>>> -        return false;
>>> -
>>> -    read_lock(&v->domain->pci_lock);
>>> -
>>> -    if ( !pdev->vpci || (v->domain != pdev->domain) )
>>> +    switch ( v->vpci.task )
>>>       {
>>> -        v->vpci.pdev = NULL;
>>> -        read_unlock(&v->domain->pci_lock);
>>> -        return false;
>>> -    }
>>> -
>>> -    header = &pdev->vpci->header;
>>> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>> +    case MODIFY_MEMORY:
>>>       {
>>> -        struct vpci_bar *bar = &header->bars[i];
>>> -        struct rangeset *mem = v->vpci.bar_mem[i];
>>> -        struct map_data data = {
>>> -            .d = v->domain,
>>> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>>> -            .bar = bar,
>>> -        };
>>> -        int rc;
>>> +        const struct pci_dev *pdev = v->vpci.memory.pdev;
>>> +        struct vpci_header *header = NULL;
>>> +        unsigned int i;
>>>   
>>> -        if ( rangeset_is_empty(mem) )
>>> -            continue;
>>> +        if ( !pdev )
>>> +            break;
>>>   
>>> -        rc = rangeset_consume_ranges(mem, map_range, &data);
>>> +        read_lock(&v->domain->pci_lock);
>>>   
>>> -        if ( rc == -ERESTART )
>>> +        if ( !pdev->vpci || (v->domain != pdev->domain) )
>>>           {
>>> +            v->vpci.memory.pdev = NULL;
>>>               read_unlock(&v->domain->pci_lock);
>>> -            return true;
>>> +            break;
>>>           }
>>>   
>>> -        if ( rc )
>>> +        header = &pdev->vpci->header;
>>> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>>           {
>>> -            spin_lock(&pdev->vpci->lock);
>>> -            /* Disable memory decoding unconditionally on failure. */
>>> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>>> -                            false);
>>> -            spin_unlock(&pdev->vpci->lock);
>>> +            struct vpci_bar *bar = &header->bars[i];
>>> +            struct rangeset *mem = v->vpci.bar_mem[i];
>>> +            struct map_data data = {
>>> +                .d = v->domain,
>>> +                .map = v->vpci.memory.cmd & PCI_COMMAND_MEMORY,
>>> +                .bar = bar,
>>> +            };
>>> +            int rc;
>>> +
>>> +            if ( rangeset_is_empty(mem) )
>>> +                continue;
>>>   
>>> -            /* Clean all the rangesets */
>>> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>> -                if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
>>> -                     rangeset_purge(v->vpci.bar_mem[i]);
>>> +            rc = rangeset_consume_ranges(mem, map_range, &data);
>>>   
>>> -            v->vpci.pdev = NULL;
>>> +            if ( rc == -ERESTART )
>>> +            {
>>> +                read_unlock(&v->domain->pci_lock);
>>> +                return true;
>>> +            }
>>>   
>>> -            read_unlock(&v->domain->pci_lock);
>>> +            if ( rc )
>>> +            {
>>> +                spin_lock(&pdev->vpci->lock);
>>> +                /* Disable memory decoding unconditionally on failure. */
>>> +                modify_decoding(pdev, v->vpci.memory.cmd & ~PCI_COMMAND_MEMORY,
>>> +                                false);
>>> +                spin_unlock(&pdev->vpci->lock);
>>> +
>>> +                /* Clean all the rangesets */
>>> +                for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>> +                    if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
>>> +                        rangeset_purge(v->vpci.bar_mem[i]);
>>> +
>>> +                v->vpci.memory.pdev = NULL;
>>> +
>>> +                read_unlock(&v->domain->pci_lock);
>>>   
>>> -            if ( !is_hardware_domain(v->domain) )
>>> -                domain_crash(v->domain);
>>> +                if ( !is_hardware_domain(v->domain) )
>>> +                    domain_crash(v->domain);
>>>   
>>> -            return false;
>>> +                break;
>>> +            }
>>>           }
>>> -    }
>>> -    v->vpci.pdev = NULL;
>>> +        v->vpci.memory.pdev = NULL;
>>>   
>>> -    spin_lock(&pdev->vpci->lock);
>>> -    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
>>> -    spin_unlock(&pdev->vpci->lock);
>>> +        spin_lock(&pdev->vpci->lock);
>>> +        modify_decoding(pdev, v->vpci.memory.cmd, v->vpci.memory.rom_only);
>>> +        spin_unlock(&pdev->vpci->lock);
>>>   
>>> -    read_unlock(&v->domain->pci_lock);
>>> +        read_unlock(&v->domain->pci_lock);
>>> +
>>> +        break;
>>> +    }
>>> +    case WAIT:
>>> +        if ( NOW() < v->vpci.wait.end )
>>> +            return true;
>>> +        v->vpci.wait.callback(v->vpci.wait.data);
>>> +        break;
>>
>> As just indicated in reply to patch 6, busy waiting isn't really acceptable.
>> This is even more so when the waiting exceeds the typical length of a
>> scheduling timeslice.
>>
>> In that other reply I said to put the vCPU to sleep, but you need to be careful
>> there too: The domain may not expect its vCPU to not make any progress for such
>> an extended period of time. This may need doing entirely differently: Once the
>> command register was written, you may want to record the time after which
>> accesses to the VF registers are permitted. Earlier accesses would simply be
>> terminated. You may still additionally need a timer, in order to kick off BAR
>> mapping after that time. (Yet better would  be if the BAR mapping could be
>> done during those 100ms. After all that may be a reason why this long a delay
>> is specified: Firmware on the device may also require some time to set up the
>> BARs accordingly.)
> 
> I am not sure it would work that way. If we look at how linux 
> initialized sriov, it writes VFE and MSE bits, waits 100ms and then 
> expects VFs to be operational. If they are not operational at that 
> moment, then it considers the operation failed and removes all VFs. If 
> we also wait 100ms before enabling access, the probability of a guest 
> trying to access something before we allow it would be very high.

Well, not really. Our counting of the 100ms necessarily starts before Dom0's.
Furthermore it may be acceptable (or even appropriate) to stall premature
accesses (because they shouldn't occur in the first place), by blocking the
vCPU at that point. A middle route may be possible: Terminate accesses in,
say, the first 90ms, and stall the vCPU for any access past that, but before
the 100ms expired.

Jan

