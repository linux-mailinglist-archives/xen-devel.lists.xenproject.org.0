Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B95CFD294
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 11:27:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196649.1514403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdQkx-0001Mk-TB; Wed, 07 Jan 2026 10:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196649.1514403; Wed, 07 Jan 2026 10:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdQkx-0001KU-Pu; Wed, 07 Jan 2026 10:27:11 +0000
Received: by outflank-mailman (input) for mailman id 1196649;
 Wed, 07 Jan 2026 10:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdQkw-0001KN-N2
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 10:27:10 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 645bb741-ebb3-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 11:26:56 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so11395585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 02:26:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f7053f5sm88092155e9.14.2026.01.07.02.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 02:26:55 -0800 (PST)
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
X-Inumbo-ID: 645bb741-ebb3-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767781616; x=1768386416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L09Jd0LwTx6EHCnvoboZZyb95Qnhmt0wJviUl5mKr6Q=;
        b=VV9ADrUeFsvGbVMn3TiVf3UZrsDIjml0r2noMECOF3vPS9QgLka+NYPLG0temBq3qD
         8W3td+Nan52FqFZ51SEkw1dyrlxLQFeyRW72jpZIl3Si2j23znPuDodZUXhdTJ4s4Y4k
         IywPQRJONFfJctFaQInbqnNV8p64m9IRwmUckcT6fvM+3hMvflOH/QPHNrKUAeFMk8SI
         BflQqZP0cTx3CPnRdch/Y4WlOTeuMdz9aFcgulLEodPWgNf3xy4uYX+3lMcaUSnghe1j
         EfE5gbIYJHTqPTnKdN2ac3KF294RV6hG44Sjdw6xvWP1SoQBee/RaA9eUWaLqLaGi8qs
         n2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781616; x=1768386416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L09Jd0LwTx6EHCnvoboZZyb95Qnhmt0wJviUl5mKr6Q=;
        b=vKC4mA1ADEWdwKLjW6oTe1LWL2qTdhgcIgv+bS2Ln5vcDdbXT0zHJh900uceluD/KX
         2zZKUsng4YPCavTMJT7NAFNXVMq7Q78BVb0np7fX8f1WmYGNKqBQahYOM9XuEobfL9WJ
         TM9hdgEEOtc+2wNpxDLknUnalxunR8hEpP8wlGJjiGHKTFq2ImLxmDHqtq8oaxve9nfj
         A8W58Zks/zxmlwEsE0Q5tlf5XKUn3ZZR+zjg19HF/80Gb+gzoqnS30+SLrCVfkpI7YkO
         nEUuvAE/+JWY1I0LHQPlNNJjkSj7SxObiIck6pWkeBx2i+BqaaPIUtWUhvqIRg6Lu2sr
         1XEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK88PDiuZXRk8bUxzkrhg4upNgxOgUPZTGDCsAqDuAE/H3biUIGOGXIGXYbDJ9PG9IbVTGlXon2fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgDaJtqq/caUbtKuP9ghHy8xigySnsePscUflwLA1N6iWLzmeH
	BrnomEFr6P2RZCVyX7gV111vng3Cyt9zvfzTsEv6QFiZZpbmjuVUn4axIG519n0Byg==
X-Gm-Gg: AY/fxX4WoyKg9liWduR2CXsGCKydka0LrrgC5VGH3G0S1BELeNj8/RqZNGVbbmfGfAh
	vns8WQBgr1kjid5gP9bamH4Hq/XIHm0R57ywRiiUUPWcd9aHn10pB/WQSBGpwcSH147e/fjF5Ig
	H05IsW2zc/cqgNHEOYCIuxbVoWiB+6JEZsNEIvhAhFzMmW42rcK2SW/EwWg/tsK5GU1Bdilp3J7
	plGhokQQ+Glnr0yEyXsdlWCJhp8LEaYBX4pV63WbgizKDp3qR/4IXvh+DWdvkjLqAtrCgx3eRIB
	WWARnSRKGR0t7/IVjNdzKsIek3SC3+/cHaz92PBy1xs7+m58u/JwNJRF0syZoGYtEH6pxUgLl7O
	pr1kxMGnXUkm2xSQwRE97NSmHUyk0yvB2gpe7+a1k3RmvdjqBJ6mP96Pnw75+LI+FnlDptGsT+D
	SZRaDzbODl0efWsNvqVqtrF+S8T06T5/wOn4MJ+z0awvxvijOJm5RNWqO8lca5DQ/Ybb9uGsMJc
	UI=
X-Google-Smtp-Source: AGHT+IG5hbHrToE7bNaafsMGZFHscGiCphH4GDRKpw+jgjFWN1z45AbD4CgBpOHwwbXSxQWmP5O4Gw==
X-Received: by 2002:a05:600c:19cc:b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47d84b21227mr24405365e9.16.1767781615916;
        Wed, 07 Jan 2026 02:26:55 -0800 (PST)
Message-ID: <4f19bfd8-2177-4e1b-b5ae-cf945d213e89@suse.com>
Date: Wed, 7 Jan 2026 11:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: determine whether a device has extended config
 space
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
 <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
 <dcf7f6f3-f1bd-479b-ac11-24e972f4446a@vates.tech>
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
In-Reply-To: <dcf7f6f3-f1bd-479b-ac11-24e972f4446a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2026 11:00, Teddy Astie wrote:
> Le 06/01/2026 à 14:50, Jan Beulich a écrit :
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -310,6 +310,41 @@ static void apply_quirks(struct pci_dev
>>                * from trying to size the BARs or add handlers to trap accesses.
>>                */
>>               pdev->ignore_bars = true;
>> +
>> +    if ( pdev->ext_cfg )
>> +    {
>> +        unsigned int pos;
>> +
>> +        /*
>> +         * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says
>> +         * that when forwarding a type1 configuration request the bridge must
>> +         * check that the extended register address field is zero.  The bridge
>> +         * is not permitted to forward the transactions and must handle it as
>> +         * an Unsupported Request.  Some bridges do not follow this rule and
>> +         * simply drop the extended register bits, resulting in the standard
>> +         * config space being aliased, every 256 bytes across the entire
>> +         * configuration space.  Test for this condition by comparing the first
>> +         * dword of each potential alias to the vendor/device ID.
>> +         * Known offenders:
>> +         *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
>> +         *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
>> +         */
>> +        for ( pos = PCI_CFG_SPACE_SIZE;
>> +              pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
>> +        {
>> +            if ( pci_conf_read16(pdev->sbdf, pos) != vendor ||
>> +                 pci_conf_read16(pdev->sbdf, pos + 2) != device )
>> +                break;
>> +        }
>> +
>> +        if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
>> +        {
>> +            printk(XENLOG_WARNING
>> +                   "%pp: extended config space aliases base one\n",
>> +                   &pdev->sbdf);
>> +            pdev->ext_cfg = false;
>> +        }
>> +    }
> 
> Given that it only appears to be the case for PCIe to PCI/PCI-X bridges, 
> do we want to check this for all devices ?

Yes. Bridges are only the main examples, but in the few systems I tested this
on so far I have at least one ordinary device which also aliases base config
space. Also note that Linux, where the base logic is taken from, also doesn't
restrict this checking (if I'm reading the code right).

Jan

