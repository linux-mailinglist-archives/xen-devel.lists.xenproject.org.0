Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E597EB20
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802007.1212120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshfL-0004Nq-M8; Mon, 23 Sep 2024 11:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802007.1212120; Mon, 23 Sep 2024 11:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshfL-0004Lc-IG; Mon, 23 Sep 2024 11:55:43 +0000
Received: by outflank-mailman (input) for mailman id 802007;
 Mon, 23 Sep 2024 11:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sshfK-0002pA-Dr
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:55:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c15f9bc9-79a2-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:55:40 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso584694966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:55:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061321568sm1207401066b.191.2024.09.23.04.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:55:40 -0700 (PDT)
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
X-Inumbo-ID: c15f9bc9-79a2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727092540; x=1727697340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wPFXRDbgqKqpusgpdRVwTMjYzReKCIns00/a50n5N+E=;
        b=ObdDDgItzRmPD3lB0XCQcVox5AWjhg+TR9k037WITYRmVSuarCP+8gPpRp+vhmxcxp
         0WUEC87ktOngJQ/8slCBRVFPo7AUKsH8Gg4hyR858GnWh9iJ8e1SvR0dAMIi541UUbN5
         i/mHf01heWh4SQmsb49E1aIi+tppfdtSoJy+TqQ2x/lSTYX7Vtz9re9XQ0aImUHmz21r
         PLGX7GQbNlwF+EAjXsme8/OBSMkGe1C9oYYtic10tuEk/lqr1L7wF+xfD6m9qAE2briq
         0kKa2QX+29ZV/BnmhE2Mi8zRtQREaEphVEBjB3588VGM+hTdEIyqivOiQfnULjVa4Osv
         GCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727092540; x=1727697340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPFXRDbgqKqpusgpdRVwTMjYzReKCIns00/a50n5N+E=;
        b=d/EblN8P21cSJ3BrgUN1c0bWs9zZ9QbnnrSmlvmRxTD3Z2sIytZ6JhSA3sAI+xPauR
         74EAOhfR7XhwwGTOknVfx4DJzTHblKo60MHiNP+n/dR6HJKxfkQQDJ4jpEtCUHa/lPnJ
         bfuYz0oDpmH3Yq8z7ptGE09BMyB38XEh0YMIVjTXnMWKuBUBKb6ZnKLpQ9nTSjwIJfFO
         iFUKXpyKktrexR2AfdD4H7wsbFQzP8OCzP0S81OWW/G5ELrKr6Uh2XybaYTX24WyAhzD
         6WUil8XCKL+tZ3z6ZqeV3awS730fJ71vaQSLpR1BMUE2aG2PIcXiWxmp9AYOy0wlB8h5
         bZng==
X-Forwarded-Encrypted: i=1; AJvYcCU3AZePya66tpIsBpxfaS0l5C+PxZdPSQwrAXhY6IVjJqavCUNHVcpXdUpOZlFOEzKYvwyUINZnrGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6ODu/qHdhhM6JvOXSoa2XevxEpZkM4sdrond2D55Ax51yh5T1
	PXns1Bv9QZcbbFxUa9lIL79CG11cEBaP8JWmhOft6DBou3Y0oG/7i/oeDzuesA==
X-Google-Smtp-Source: AGHT+IGekZHSQkyx8fwAUsg/tuCRq/rqm8AjCg+q7+GVZogF9Emr3vAoGRt1qnC1iWrJj/n3yH7k+Q==
X-Received: by 2002:a17:907:987:b0:a90:349e:2465 with SMTP id a640c23a62f3a-a90d517e6aamr1370295666b.65.1727092540347;
        Mon, 23 Sep 2024 04:55:40 -0700 (PDT)
Message-ID: <1ea5c701-ec2f-4ce8-afc6-34bcf6e9ec10@suse.com>
Date: Mon, 23 Sep 2024 13:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen: introduce common macros for per-CPU sections
 defintion
To: Andrew Cooper <andrew.cooper3@citrix.com>, oleksii.kurochko@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
 <a4e3de2c-2316-435e-b22f-e6efb3aa4216@suse.com>
 <3caf9e9f66a00b8c85b723a90ef830c3c0feca1f.camel@gmail.com>
 <55638099-629d-4ed6-b4ca-c1dd62c1e5dd@citrix.com>
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
In-Reply-To: <55638099-629d-4ed6-b4ca-c1dd62c1e5dd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2024 13:53, Andrew Cooper wrote:
> On 23/09/2024 12:48 pm, oleksii.kurochko@gmail.com wrote:
>> On Mon, 2024-09-23 at 12:56 +0200, Jan Beulich wrote:
>>> On 19.09.2024 17:59, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/x86/xen.lds.S
>>>> +++ b/xen/arch/x86/xen.lds.S
>>>> @@ -321,14 +321,7 @@ SECTIONS
>>>>    DECL_SECTION(.bss) {
>>>>         __bss_start = .;
>>>>         *(.bss.page_aligned*)
>>>> -       . = ALIGN(PAGE_SIZE);
>>>> -       __per_cpu_start = .;
>>>> -       *(.bss.percpu.page_aligned)
>>>> -       *(.bss.percpu)
>>>> -       . = ALIGN(SMP_CACHE_BYTES);
>>>> -       *(.bss.percpu.read_mostly)
>>>> -       . = ALIGN(SMP_CACHE_BYTES);
>>>> -       __per_cpu_data_end = .;
>>>> +       PERCPU_SECTION
>>>>         *(.bss .bss.*)
>>>>         . = ALIGN(POINTER_ALIGN);
>>>>         __bss_end = .;
>>> Like the _SEC in the other patch I question _SECTION here, albeit for
>>> a different
>>> reason: This is no separate output section, and it's more than one
>>> kind of input
>>> ones. Perhaps PERCPU_DATA? With that
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Sure, I will drop _SECTION here too. Thanks.
> 
> Can we call it PERCPU_BSS?  Just to highlight the fact that it really is
> BSS, and not initialised DATA.

Fine with me.

Jan

