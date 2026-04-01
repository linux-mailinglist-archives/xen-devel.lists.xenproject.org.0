Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBd6I24ozWnTaQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:15:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0913337BF5F
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270389.1559069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wLI-0007Cu-7m; Wed, 01 Apr 2026 14:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270389.1559069; Wed, 01 Apr 2026 14:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wLI-0007BT-4q; Wed, 01 Apr 2026 14:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1270389;
 Wed, 01 Apr 2026 14:14:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7wLG-0007BN-O1
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:14:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wLF-00Bn3l-Ov
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:14:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd284f-e002-0a2a0a5209dd-0a2a450c9d80-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:14:45 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2855-f40c-0a2a450c0019-d155dd2dbd07-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:14:45 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso2226729f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:14:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a7223sm189136f8f.5.2026.04.01.07.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:14:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1775052885; x=1775657685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hL/cATlmDI+H92KCyzPoZzMYt2GziKP7L0ibyB0fKAE=;
        b=AgW1rP6p5Vg4ocDC3a2M5ucoRJ37n5NtQjmoTyaawsGkxcSuJ2xtsxV84JIBhmu/ow
         4mMElM60jz6ktVsxEVdVaeqFotU/WlugKx/XHd/pKEntChy8bCNcGWJQy2onzF5vdnql
         vM06zk052YFln3egLVWW8sqUsYXbX9kR37eH+K34c1OjIT0Kg4X87gt2b120cnZy3hGf
         cc4Wpmaz/8WdqQqmMgwQ6AlO6aYqL0w62HS6thu7t8VJAMUFU2EAko8pzoj4gilDkayS
         3dCCu+81GnLpCuwVTDLG2WzG6toUWjQDw9fi6u+ACZc3Jzb7RlsO8+LTkamAenUxV7bK
         6Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052885; x=1775657685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL/cATlmDI+H92KCyzPoZzMYt2GziKP7L0ibyB0fKAE=;
        b=VJPeaJ1j28KEM8300ASF+1S8XAkUYuYbpbL5FbjV5VNbsy7S4wHydU/fCBz2PvVU6K
         8/uhEIxGbOiKYYxCNMdbYBqQ+5Cysf6x9qqsAssuGMo2ImcCLXV4eRS8kORtQlsdQPAi
         AosXS8zfEKG3WxCuYf3tasVewjG360hkVQHpBjwXGDg0gj4XJEN4oe8BOtewaazFO1Lc
         3ae/REflKHQ8fQP3wGrbgFaX4ExH9B1Ltnl/sHzdXtj5qpzAOn86/dtUzFJ7tsnKraQt
         Y1XrS0ROFyq/KrJSEOykn0hsLHBITvpYv9Mp2Ck6zrbhMlsIxtPau2m/bUHKsEXhbn2h
         0BcA==
X-Forwarded-Encrypted: i=1; AJvYcCXidl/QhQfUhiGFM6J/cQSlQOjwdLSuG+jNZsFwMEhClVP47ZrPNHdt/lely4TcfY8qWVQTkWA6W+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJn9rqalaCQiPRXcLNsbkwOcigwzhzXWBifOU+5gleRBCk2kMq
	qUOvq2/WeQ75c+0EL0y1TSe4Y5ir3CTSnmUSFEneYMVeQvlYfDiGvf6QloD5tVfFNQ==
X-Gm-Gg: ATEYQzylyrmvM+/Ofp8yOATtqdRRWCCOZFCrkqYvNuaJu6SICrzV7KMMpEsKPzGQ5jo
	wypv0mCX8ZgSZJEY7IcYoXV1bYHoHAb1qjg3dw/7ftxTrzJRuPadcl6PHEBJTFtTV02UcMEq5m9
	mKmUgwE4UjVx4sYeNZ6Y/JIA6VqiPAnZEhB8YIfg90S4AVF2+mtpeHaAm6+SBIXtdpPzxIKy2T+
	FHKNdyaWqvR9MycWMmzYwSWSTx50IyiKKqun3RRk7DgBsR1AkMi/dUpVfB3+UsZeAov0M8kB0xx
	1HQUK0Rb5yBt8dRagqOV6udO42/amjUXTcATSI9oPOE7Olc2+SLHxYDWvDymSLyyOkN2DO94m6b
	IznIAdp8y2EVEjt6w65hjnkEuPfwSqE0fUI98wnPrga+i2VJOo/3pfttFYCfFPzNNgeeQy+Qcbi
	ZYEbcL8ckY0QzGxGhDbwNR6sYekJHAM0b0RKAbXeNxF0LT4cgp51Cy45iDwBbRDmualgOOjoagM
	0VRC+1P6X15BWs=
X-Received: by 2002:a05:6000:1445:b0:43c:f969:2e1 with SMTP id ffacd0b85a97d-43d15094489mr7559208f8f.6.1775052884969;
        Wed, 01 Apr 2026 07:14:44 -0700 (PDT)
Message-ID: <8856a1d8-51f7-40ee-9def-570af5c6d42f@suse.com>
Date: Wed, 1 Apr 2026 16:14:43 +0200
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
 <46f4a4c5-cc44-47d7-8d6d-03ddaa75bb7f@suse.com>
 <13714c88-838b-4dc7-bc0b-b6ca590fd944@epam.com>
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
In-Reply-To: <13714c88-838b-4dc7-bc0b-b6ca590fd944@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775052885-A4DBDA3D-365E61DC/0/0
X-purgate-type: clean
X-purgate-size: 8059
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0913337BF5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 16:07, Mykyta Poturai wrote:
> On 4/1/26 11:21, Jan Beulich wrote:
>> On 01.04.2026 09:59, Mykyta Poturai wrote:
>>> On 3/31/26 17:55, Jan Beulich wrote:
>>>> On 09.03.2026 12:08, Mykyta Poturai wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -175,76 +175,92 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>>>>>    
>>>>>    bool vpci_process_pending(struct vcpu *v)
>>>>>    {
>>>>> -    const struct pci_dev *pdev = v->vpci.pdev;
>>>>> -    struct vpci_header *header = NULL;
>>>>> -    unsigned int i;
>>>>> -
>>>>> -    if ( !pdev )
>>>>> -        return false;
>>>>> -
>>>>> -    read_lock(&v->domain->pci_lock);
>>>>> -
>>>>> -    if ( !pdev->vpci || (v->domain != pdev->domain) )
>>>>> +    switch ( v->vpci.task )
>>>>>        {
>>>>> -        v->vpci.pdev = NULL;
>>>>> -        read_unlock(&v->domain->pci_lock);
>>>>> -        return false;
>>>>> -    }
>>>>> -
>>>>> -    header = &pdev->vpci->header;
>>>>> -    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>>>> +    case MODIFY_MEMORY:
>>>>>        {
>>>>> -        struct vpci_bar *bar = &header->bars[i];
>>>>> -        struct rangeset *mem = v->vpci.bar_mem[i];
>>>>> -        struct map_data data = {
>>>>> -            .d = v->domain,
>>>>> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
>>>>> -            .bar = bar,
>>>>> -        };
>>>>> -        int rc;
>>>>> +        const struct pci_dev *pdev = v->vpci.memory.pdev;
>>>>> +        struct vpci_header *header = NULL;
>>>>> +        unsigned int i;
>>>>>    
>>>>> -        if ( rangeset_is_empty(mem) )
>>>>> -            continue;
>>>>> +        if ( !pdev )
>>>>> +            break;
>>>>>    
>>>>> -        rc = rangeset_consume_ranges(mem, map_range, &data);
>>>>> +        read_lock(&v->domain->pci_lock);
>>>>>    
>>>>> -        if ( rc == -ERESTART )
>>>>> +        if ( !pdev->vpci || (v->domain != pdev->domain) )
>>>>>            {
>>>>> +            v->vpci.memory.pdev = NULL;
>>>>>                read_unlock(&v->domain->pci_lock);
>>>>> -            return true;
>>>>> +            break;
>>>>>            }
>>>>>    
>>>>> -        if ( rc )
>>>>> +        header = &pdev->vpci->header;
>>>>> +        for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>>>>            {
>>>>> -            spin_lock(&pdev->vpci->lock);
>>>>> -            /* Disable memory decoding unconditionally on failure. */
>>>>> -            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>>>>> -                            false);
>>>>> -            spin_unlock(&pdev->vpci->lock);
>>>>> +            struct vpci_bar *bar = &header->bars[i];
>>>>> +            struct rangeset *mem = v->vpci.bar_mem[i];
>>>>> +            struct map_data data = {
>>>>> +                .d = v->domain,
>>>>> +                .map = v->vpci.memory.cmd & PCI_COMMAND_MEMORY,
>>>>> +                .bar = bar,
>>>>> +            };
>>>>> +            int rc;
>>>>> +
>>>>> +            if ( rangeset_is_empty(mem) )
>>>>> +                continue;
>>>>>    
>>>>> -            /* Clean all the rangesets */
>>>>> -            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>>>> -                if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
>>>>> -                     rangeset_purge(v->vpci.bar_mem[i]);
>>>>> +            rc = rangeset_consume_ranges(mem, map_range, &data);
>>>>>    
>>>>> -            v->vpci.pdev = NULL;
>>>>> +            if ( rc == -ERESTART )
>>>>> +            {
>>>>> +                read_unlock(&v->domain->pci_lock);
>>>>> +                return true;
>>>>> +            }
>>>>>    
>>>>> -            read_unlock(&v->domain->pci_lock);
>>>>> +            if ( rc )
>>>>> +            {
>>>>> +                spin_lock(&pdev->vpci->lock);
>>>>> +                /* Disable memory decoding unconditionally on failure. */
>>>>> +                modify_decoding(pdev, v->vpci.memory.cmd & ~PCI_COMMAND_MEMORY,
>>>>> +                                false);
>>>>> +                spin_unlock(&pdev->vpci->lock);
>>>>> +
>>>>> +                /* Clean all the rangesets */
>>>>> +                for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>>>>> +                    if ( !rangeset_is_empty(v->vpci.bar_mem[i]) )
>>>>> +                        rangeset_purge(v->vpci.bar_mem[i]);
>>>>> +
>>>>> +                v->vpci.memory.pdev = NULL;
>>>>> +
>>>>> +                read_unlock(&v->domain->pci_lock);
>>>>>    
>>>>> -            if ( !is_hardware_domain(v->domain) )
>>>>> -                domain_crash(v->domain);
>>>>> +                if ( !is_hardware_domain(v->domain) )
>>>>> +                    domain_crash(v->domain);
>>>>>    
>>>>> -            return false;
>>>>> +                break;
>>>>> +            }
>>>>>            }
>>>>> -    }
>>>>> -    v->vpci.pdev = NULL;
>>>>> +        v->vpci.memory.pdev = NULL;
>>>>>    
>>>>> -    spin_lock(&pdev->vpci->lock);
>>>>> -    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
>>>>> -    spin_unlock(&pdev->vpci->lock);
>>>>> +        spin_lock(&pdev->vpci->lock);
>>>>> +        modify_decoding(pdev, v->vpci.memory.cmd, v->vpci.memory.rom_only);
>>>>> +        spin_unlock(&pdev->vpci->lock);
>>>>>    
>>>>> -    read_unlock(&v->domain->pci_lock);
>>>>> +        read_unlock(&v->domain->pci_lock);
>>>>> +
>>>>> +        break;
>>>>> +    }
>>>>> +    case WAIT:
>>>>> +        if ( NOW() < v->vpci.wait.end )
>>>>> +            return true;
>>>>> +        v->vpci.wait.callback(v->vpci.wait.data);
>>>>> +        break;
>>>>
>>>> As just indicated in reply to patch 6, busy waiting isn't really acceptable.
>>>> This is even more so when the waiting exceeds the typical length of a
>>>> scheduling timeslice.
>>>>
>>>> In that other reply I said to put the vCPU to sleep, but you need to be careful
>>>> there too: The domain may not expect its vCPU to not make any progress for such
>>>> an extended period of time. This may need doing entirely differently: Once the
>>>> command register was written, you may want to record the time after which
>>>> accesses to the VF registers are permitted. Earlier accesses would simply be
>>>> terminated. You may still additionally need a timer, in order to kick off BAR
>>>> mapping after that time. (Yet better would  be if the BAR mapping could be
>>>> done during those 100ms. After all that may be a reason why this long a delay
>>>> is specified: Firmware on the device may also require some time to set up the
>>>> BARs accordingly.)
>>>
>>> I am not sure it would work that way. If we look at how linux
>>> initialized sriov, it writes VFE and MSE bits, waits 100ms and then
>>> expects VFs to be operational. If they are not operational at that
>>> moment, then it considers the operation failed and removes all VFs. If
>>> we also wait 100ms before enabling access, the probability of a guest
>>> trying to access something before we allow it would be very high.
>>
>> Well, not really. Our counting of the 100ms necessarily starts before Dom0's.
>> Furthermore it may be acceptable (or even appropriate) to stall premature
>> accesses (because they shouldn't occur in the first place), by blocking the
>> vCPU at that point. A middle route may be possible: Terminate accesses in,
>> say, the first 90ms, and stall the vCPU for any access past that, but before
>> the 100ms expired.
> 
> Is there any real benefit to doing all this work instead of just waiting 
> for Dom0 to register the FVs? Implementing it the way you described 
> would require a relatively complex state machine and two timers per 
> sriov-capable device. And will also probably require some hacks to 
> handle partially initialized VFs in Xen. This adds a lot of work and 
> many possible bugs for not a lot of benefit in my opinion.

Odd that you ask me this question. If there was no benefit, why did you do
it this way?

Jan

