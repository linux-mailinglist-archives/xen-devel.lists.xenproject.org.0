Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAF493173F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 16:59:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758994.1168524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNAK-0002W7-HD; Mon, 15 Jul 2024 14:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758994.1168524; Mon, 15 Jul 2024 14:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTNAK-0002Ud-Dy; Mon, 15 Jul 2024 14:59:00 +0000
Received: by outflank-mailman (input) for mailman id 758994;
 Mon, 15 Jul 2024 14:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTNAJ-0002UF-2c
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 14:58:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2d81827-42ba-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 16:58:57 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso31675605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 07:58:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc451d9sm42165455ad.248.2024.07.15.07.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:58:56 -0700 (PDT)
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
X-Inumbo-ID: c2d81827-42ba-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721055537; x=1721660337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zebVrW7F6yzdvQFEoLslPQPcCyPJFE5wBnVRe/TFQA4=;
        b=DXye3J9nq/V9BsKzXARMQk9xpWWugejH2BE0+G442f19KZyK9qROKbG08oXr9u3NBO
         QimTMM7NwruuANByDX5rgFiDdlZZME2AjE+bmThWJFwQpjw5UfvB49cGkD7m2wjUjeP1
         mJ3h/L/Jd5aJPz0zpBElsXtB4CbmKP1ck21x77fSmjrFfQuhy37L5iJi2je7K3c6Swec
         ESiv2KnkU2pnAB6Gu7jZh9yEpTTrChtg/HWu5RDV+q+amtXUFHM6wfZam7J7nMnJX4aV
         uMB3urwXaajgh8bBPGRFPK6iidWdFO9vurDd0V74qhZKT35TW9LnUbdy2tREpvMnsC/k
         ABGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721055537; x=1721660337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zebVrW7F6yzdvQFEoLslPQPcCyPJFE5wBnVRe/TFQA4=;
        b=Sb+XyMOK5By/JL82v6QR18kP7Um5K2p8Upp1gvDr525zM/TSNzk8gHS64ooDEZS51/
         ZGJ/S22BPsOZ3RaSJ1I/fydU4Wyf102gYEDbyRyC3ZYNL7t7wYvVBv8Rwi+cPKl4AvTb
         sgxhwlvNWWVRNJ770cg/DU7NKRiJnF2TBcoo4K/EIUQ1+e76s0JCczXt3dgTZDG/QLMW
         kQwiiw27Zwu824RfWMtNxv7xmEJeYp9BobhjzuZqBZVAhol+TCTWDBO2GNKppyU1OBR1
         rXtVFxo1QaJbt/vZ7oNHJsF6MtnL2cR4tmXtWn3KeycqaYBnPH7qzzhZk63p72X5eu5E
         //FA==
X-Forwarded-Encrypted: i=1; AJvYcCXXqZde7KPWVx09KGl6GGPZeWf8HFB2uTPjpFpEc1TLxtNTpmIpV91WxfEILnHPltTD2jkQ2GkF4ijp4PlCRsQC16r7SpdQcSqXEJbxzp4=
X-Gm-Message-State: AOJu0Yw+fDJtr7aJAFpu7DIEavJFbZYTNkR06pw8f+FAfqM1EfcipEs3
	Jw15aCJzQzzuO9CQUJN2tMxgoUnmkFdth1LSE0BBmhSl46gnLzrHuv4Fgf4SZw==
X-Google-Smtp-Source: AGHT+IGXSlJPS3EUQz900EDA/HvcbE2K4nhhHySdp1x8J+SFCcJx6E2Tk5R7elV7gzdBCOrmkNd8rg==
X-Received: by 2002:adf:b60f:0:b0:362:23d5:3928 with SMTP id ffacd0b85a97d-367ff6f2ddfmr8465445f8f.17.1721055536771;
        Mon, 15 Jul 2024 07:58:56 -0700 (PDT)
Message-ID: <945afaf1-8223-4e3e-bf6d-98a6fad66f78@suse.com>
Date: Mon, 15 Jul 2024 16:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] xen/riscv: introduce early_fdt_map()
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <4e4f94817fb3bba5f52336ea0b4491f7bc867d49.1720799926.git.oleksii.kurochko@gmail.com>
 <bc8d2e10-0898-4f5a-b296-1bc7f528bb77@suse.com>
 <ba7c72745052429d84e172cf731849c54445d27a.camel@gmail.com>
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
In-Reply-To: <ba7c72745052429d84e172cf731849c54445d27a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2024 15:58, Oleksii wrote:
> On Mon, 2024-07-15 at 10:52 +0200, Jan Beulich wrote:
>> On 12.07.2024 18:22, Oleksii Kurochko wrote:
>>> +    rc = map_pages_to_xen(BOOT_FDT_VIRT_START,
>>> maddr_to_mfn(base_paddr),
>>> +                          SZ_2M >> PAGE_SHIFT,
>>> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>>> +    if ( rc )
>>> +        panic("Unable to map the device-tree.\n");
>>> +
>>> +    offset = fdt_paddr % XEN_PT_LEVEL_SIZE(1);
>>> +    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
>>> +
>>> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>>> +        return NULL;
>>> +
>>> +    size = fdt_totalsize(fdt_virt);
>>> +    if ( size > BOOT_FDT_VIRT_SIZE )
>>> +        return NULL;
>>> +
>>> +    if ( (offset + size) > SZ_2M )
>>> +    {
>>> +        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
>>> +                              maddr_to_mfn(base_paddr + SZ_2M),
>>> +                              SZ_2M >> PAGE_SHIFT,
>>> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>>> +        if ( rc )
>>> +            panic("Unable to map the device-tree\n");
>>> +    }
>>
>> Why this two part mapping? And why are you mapping perhaps much more
>> than "size"?
> I wasn't able to find if RISC-V has a requirement for alignment of FDT
> address so I decided to follow Arm where FDT is required to be placed
> on a 8-byte boundary, so FDT can cross a 2MB boundary, so the second
> 2MB page should be mapped if the FDT is crossing the 2MB boundary.

This explains why you may need to map more than 2Mb (which wasn't the
question), but it doesn't explain why you need to do it in two steps.

Jan

