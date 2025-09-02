Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE67B400C2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106323.1457030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQEZ-0002y0-HT; Tue, 02 Sep 2025 12:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106323.1457030; Tue, 02 Sep 2025 12:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQEZ-0002wX-Dg; Tue, 02 Sep 2025 12:35:35 +0000
Received: by outflank-mailman (input) for mailman id 1106323;
 Tue, 02 Sep 2025 12:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utQEY-0002wR-3D
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:35:34 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50b81685-87f9-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:35:32 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-619487c8865so11060871a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 05:35:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61d3174074bsm6371063a12.35.2025.09.02.05.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:35:31 -0700 (PDT)
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
X-Inumbo-ID: 50b81685-87f9-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756816531; x=1757421331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MVrRlgI3NdINquJMa1Z1E0HRvulqn/Sw7JVhHhLKaLg=;
        b=Sd8KBJ3Fc/VEcMt5qm8OE+SNwE3X2U5oyGiGmQE9tqE9XkhC2Mf54toFw0Eg9xlibm
         rN2PYuzlZRzGWnMDdMe1zJA3v5s3Jr7dLLzEWoFyyKYc1dg/lShtWoBgMBAueD4srFf4
         KFGH7qey1w1UIrx12rfZ5gP1pPTniYKO3DbI00HuyrLrwGPOZKgWPIWBJoGHY06srQ+N
         cV6PkT5Ez5/TVMmK5Iv8Xm9bCoi/eaHMgTalA4H4tmkrCCWkeBMERBroy6f02wOyovRS
         wMt00iWy2COiwfORZGvxP39awD0dm+mw0cUqNwV9qEZ/Yr4FKEHlu9TH04g6sQkkYQmN
         3wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816531; x=1757421331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVrRlgI3NdINquJMa1Z1E0HRvulqn/Sw7JVhHhLKaLg=;
        b=irUzCG1NyENJUlkYEKWVc9Sr1ty1rfLl/6Bh6MIwr02eBZeakmQ/8OhSmvQyXLJy9+
         YN9FADJokEtyFhlGEzp4uPsi2YfxOBOCyiuU9SpG5ecMba/JRLHDh4loNT4ihPg51TCS
         DCtJfE++jni231xgESTd+3+YaavQ3zTvWpCZr2slHWZ3cn443NZqHxZlEwd/ao4ZqmRx
         UyFjY4I+RnLIJOFr2004imZS0+OBvT62E1iNXvo5Hwny979FBcktbvxcYlgIe8ug8/45
         vrVqcjVRDSi0MaSFjTheOHCc007wO49/W3Zsx/Jjp1nNO00KUhAp0oiZS7U9FbYEskLz
         Etig==
X-Forwarded-Encrypted: i=1; AJvYcCVrOb/j2PoutPiZgSUrntCedhejI454QVCRtcF91ORjK9Rp/dX+Ohu0DIUMkgU2ZIAja7EJiaMWSic=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCpS8jjUFS851lOF/wS5c/mEF2AI3pC8v23KxHqKEsNeAscvFl
	Lwu1rsyV7PSJoRGlx8vppYtkm3ZfnaK/1ApC7mQb0owE76cLbwKeCkUYbLsWdx/DWA==
X-Gm-Gg: ASbGncuuLRyfyaQ7W/0EZ8gNjqCz6gE5ya65huOTruEupZEiAaAAlj1KlvrFE2K918i
	Aq391Ln+5ZNSeNmhuUg9d9HvG6/A7OSvSqyGH1FInU6fp5KvrtAWp8Xr9cDgTIEetYCoxUWAPbO
	RYafLrjzGdawn+8PMBu1FaBlBAN3osbBswe5fYF+7TIZH+0s6rYRNW6E47515ttl9KrPgW+mitA
	6pJSrmQ8dZYkypXG4xtFKaRXv/DdfJkaS1Zv+YujAZeoEVU8v6uoxiGq9mZDQDxRDrKHGDSDXSo
	O/3eHZcvoc3mAYLV+AJBoMEI5ZJUTxcZbxD8BFYW8taPKUer6Wt6oOvY8/YMxIseV3pRUes3Sry
	IbDw1gi3szPo3q9FSYemAFqu56zpioBnOfpM+ngr3WE61Sv7jFUgQ8vBL0ln2cqNSoiwRRlaDqK
	2shureELF/8TfQwCCKKg==
X-Google-Smtp-Source: AGHT+IFnAXfYbBskkEYYda6XSlHfUUXH97e5Lrn7rbfQ9HsF0/SYlwyIhB3iIOnPc7u875fbYfYvuQ==
X-Received: by 2002:a05:6402:2356:b0:61c:e287:7ad3 with SMTP id 4fb4d7f45d1cf-61d22dfbd0emr12464067a12.6.1756816531436;
        Tue, 02 Sep 2025 05:35:31 -0700 (PDT)
Message-ID: <d422e3d6-48c5-478a-bf76-6aa39492d767@suse.com>
Date: Tue, 2 Sep 2025 14:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 2/3] hvmloader: Update to SMBIOS 2.6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1756460430.git.teddy.astie@vates.tech>
 <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech>
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
In-Reply-To: <57c674cc364d3b8f4c6d03533b9e2b45728d2c19.1756460430.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 11:58, Teddy Astie wrote:
> @@ -505,7 +505,22 @@ smbios_type_1_init(void *start, const char *xen_version,
>      p->version_str = 3;
>      p->serial_number_str = 4;
>  
> -    memcpy(p->uuid, uuid, 16);
> +    /*
> +     * Xen toolstack uses big endian UUIDs, however GUIDs (which requirement
> +     * is clarified by SMBIOS >= 2.6) has the first 3 components appearing as
> +     * being little endian and the rest as still being big endian.
> +     */

The SMBIOS spec I'm looking at (2.7.1) doesn't mention the term GUID at all
(except of course when discussing the EFI System Table entry). It's all UUID
there. Here and in the description I think this needs expressing better, to
not raise extra questions.

As to endian-ness: Since everything from byte 8 onwards are merely bytes, I
don't think it makes much sense to talk of endian-ness for that latter half.

> @@ -716,7 +731,7 @@ smbios_type_4_init(
>  
>      p->socket_designation_str = 1;
>      p->processor_type = 0x03; /* CPU */
> -    p->processor_family = 0x01; /* other */
> +    p->processor_family = p->processor_family_2 = 0x01; /* other */

In the hypervisor we need to avoid such double assignments for Misra's
sake. I think we're better off avoiding them in hvmloader as well.

> @@ -736,6 +751,22 @@ smbios_type_4_init(
>      p->l2_cache_handle = 0xffff; /* No cache information structure provided. */
>      p->l3_cache_handle = 0xffff; /* No cache information structure provided. */
>  
> +    /*
> +     * We have a smbios type 4 table per vCPU (which is per socket),
> +     * which means here that we have 1 socket per vCPU.
> +     */
> +    p->core_count = p->core_enabled = p->thread_count = 1;

Might we be better off keeping them all at 0 (unknown)?

> +    /*
> +     * We set 64-bits, execute protection and enhanced virtualization.
> +     * We don't set Multi-Core (bit 3) because this individual processor
> +     * (as being a single vCPU) is only having one core.
> +     *
> +     * SMBIOS specification says that these bits don't state anything
> +     * regarding the actual availability of such features.
> +     */
> +    p->processor_characteristics = 0x64;

Unless nested virt is enabled for the guest, I think we'd better avoid
setting the Enhanced Virtualization bit.

> @@ -870,8 +901,8 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
>      char buf[16];
>      struct smbios_type_17 *p = start;
>  
> -    /* Specification says Type 17 table has length of 1Bh for v2.3-2.6. */
> -    BUILD_BUG_ON(sizeof(*p) != 27);
> +    /* Specification says Type 17 table has length of 1Ch for v2.6. */
> +    BUILD_BUG_ON(sizeof(*p) != 28);
>  
>      memset(p, 0, sizeof(*p));

With this, ...

> @@ -890,6 +921,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
>      p->bank_locator_str = 0;
>      p->memory_type = 0x07; /* RAM */
>      p->type_detail = 0;
> +    p->attributes = 0;

... I don't think we really need this. In fact I was considering to make
a patch to strip all the unnecessary assignments of zero.

> --- a/tools/firmware/hvmloader/smbios_types.h
> +++ b/tools/firmware/hvmloader/smbios_types.h
> @@ -147,6 +147,11 @@ struct smbios_type_4 {
>      uint8_t serial_number_str;
>      uint8_t asset_tag_str;
>      uint8_t part_number_str;
> +    uint8_t core_count;
> +    uint8_t core_enabled;
> +    uint8_t thread_count;
> +    uint16_t processor_characteristics;
> +    uint16_t processor_family_2;
>  } __attribute__ ((packed));
>  
>  /* SMBIOS type 7 - Cache Information */
> @@ -185,6 +190,9 @@ struct smbios_type_9 {
>      uint16_t slot_id;
>      uint8_t slot_characteristics_1;
>      uint8_t slot_characteristics_2;
> +    uint16_t sgn_base;
> +    uint8_t bus_number_base;
> +    uint8_t devfn_base;

Where do the _base suffixes come from? Nothing like that is said in the
spec I'm looking at. Also "sgn" is imo too much of an abbreviation.

Jan

