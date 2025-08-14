Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2BDB25D2E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080898.1441068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSMU-0007pK-6E; Thu, 14 Aug 2025 07:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080898.1441068; Thu, 14 Aug 2025 07:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umSMU-0007n0-3Q; Thu, 14 Aug 2025 07:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1080898;
 Thu, 14 Aug 2025 07:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umSMS-0007mt-Tf
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:26:56 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e41c85f-78e0-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:26:55 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb78da8a7so101200066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:26:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c076sm2513275466b.102.2025.08.14.00.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:26:54 -0700 (PDT)
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
X-Inumbo-ID: 0e41c85f-78e0-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755156415; x=1755761215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWklxH0cXy9GUis6gE8FtNwQT8EjVlYxc++UJH65nHE=;
        b=YMvs9/rBgyL3Jvq25ur5h6iRm0uXSIg1eltr3NbE6JhtWEzQ8witzV9VlYeLkrX6S1
         NoXvAGrpSf1hiXFSsPb2DomjjsyjOHNn5mHa+r9aUOGB7KaF3inbSbhPDMD7jb4udFL6
         x/9Z5ktpy/5RyQHNEtmSnsnFgOTMriTIIJUA9p4dwlm9imuT9aZfp0aMJhUiZJsKJK16
         k0O4cQTh1Ayd7149+5PZop2p28hdk9ruW3efUKK1MKQ53UPFEKj37EQYtxikEdEG46R8
         +6IJ/RJAIvI1B6zc/h8VHIYYSSQGkHHyUgP/PuOrgq6RAeSLKwEbc245fvv+WgOtL4mA
         +jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156415; x=1755761215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWklxH0cXy9GUis6gE8FtNwQT8EjVlYxc++UJH65nHE=;
        b=VH9tM1VOfDJrt2JGuLBYMTGus+YpF+aJsljOLL5G1uWMrRgFW+vHFcSXZ/ee8LHmwZ
         bbSdAodbEdOWe1SpKudcDR6RrAtitBKyfyck4Ba/lA0zeVqnWdPuMcBddozQ9BNb2AC6
         XFbJJhBM1SdLDdNhN2zYXtDmL740tb5Y9tjMRGS8k/HLHA/ybsx7vPANqwRzrRx84Imv
         kPuPfN5dscBXD3X8dwi8nvp6RPcaCzw1wWRHGxT7iPQcw2SjPRZmkb0e3Xd9NHADuUY7
         UCmMRZBpoJskK5jAcGjl6dUR6bFqZObLBZPx92gWiMKC/jhzF18bew7WRGnzAYoR4rhM
         66LA==
X-Gm-Message-State: AOJu0YwiVhUnO7omYqYtji+7tYSOkJqHBbm/HT4ejeVKol2YRq1obpXr
	2fGTrnzds6I9sP9UN6a3nXckdMUsnVkwXXDBxLexa+4vbFiU18F9sW0Ib29OJ1fMm4DmS35j37z
	JO0g=
X-Gm-Gg: ASbGnctTD1pugVeTZiBi1dNYrHjUpmjFfb94tpo1TaYRNnAF4nl/Lfy6JE9lCOknbgS
	Qe6X6G7Ja5oypZKVnSZvxIzfN7wd6q1guTtCzi8Zlgr8eXEWUaL9/r16GeZyy3g/hfPSSmkPaKL
	THnlVb1/kjF4x2O08gTpVcOuJuCrOzU27lSeq65NIFE47F3ORWajZdoESJH2YBB7hUwU0t+r47Q
	zEqomkmB20MXPAFPdyGtKEr1HHi391ZvX/3PEa3thByeIjH8Ve5J28brEiBCZrYToFxWLngKKwo
	E6ihkrooVNzQLdLJA4K79jjT+Nbrl8fEiQqZ7U0N20P9GNrlIu6YsQ1YymRwmrv3mwEUY/Y5b0W
	vyEiYL1zztk880flh8Fj8dFRrc7lFfOXR5fdA0Y59l2gOB5CowJypZlxqv8v5G3wl+9btsP9CcX
	6ttZCSoKYCQSqP6fOVnw==
X-Google-Smtp-Source: AGHT+IHf+chiCYCdjn0poyjloX8Gq248Zkt78egNnsQeH93Scmtr8FzICzQdujpnMvVahoHBKfsQ3Q==
X-Received: by 2002:a17:907:6d0c:b0:af9:d705:9f19 with SMTP id a640c23a62f3a-afcb979b5cdmr180721766b.17.1755156415043;
        Thu, 14 Aug 2025 00:26:55 -0700 (PDT)
Message-ID: <aab37ec2-33bf-403b-978a-dc3c4bc282f7@suse.com>
Date: Thu, 14 Aug 2025 09:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
 <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
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
In-Reply-To: <7e906964-b07d-4205-a683-e665f19d5edc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.08.2025 13:36, Andrew Cooper wrote:
> On 12/08/2025 10:43 am, Nicola Vetrini wrote:
>> On 2025-08-08 22:23, Andrew Cooper wrote:
>>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>>> index 8ca379c9e4cb..13b8fcf0ba51 100644
>>> --- a/xen/arch/x86/traps-setup.c
>>> +++ b/xen/arch/x86/traps-setup.c
>>> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
>>>
>>>  void nocall entry_PF(void);
>>>
>>> +/*
>>> + * Sets up system tables and descriptors for IDT devliery.
>>> + *
>>> + * - Sets up TSS with stack pointers, including ISTs
>>> + * - Inserts TSS selector into regular and compat GDTs
>>> + * - Loads GDT, IDT, TR then null LDT
>>> + * - Sets up IST references in the IDT
>>> + */
>>> +static void load_system_tables(void)
>>> +{
>>> +    unsigned int i, cpu = smp_processor_id();
>>> +    unsigned long stack_bottom = get_stack_bottom(),
>>> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
>>> +    /*
>>> +     * NB: define tss_page as a local variable because clang 3.5
>>> doesn't
>>> +     * support using ARRAY_SIZE against per-cpu variables.
>>> +     */
>>> +    struct tss_page *tss_page = &this_cpu(tss_page);
>>> +    idt_entry_t *idt = this_cpu(idt);
>>> +
>>
>> Given the clang baseline this might not be needed anymore?
> 
> Hmm.  While true, looking at 51461114e26, the code is definitely better
> written with the tss_page variable and we wouldn't want to go back to
> the old form.
> 
> I think that I'll simply drop the comment.
> 
> ~Andrew
> 
> P.S.
> 
> Generally speaking, because of the RELOC_HIDE() in this_cpu(), any time
> you ever want two accesses to a variable, it's better (code gen wise) to
> construct a pointer to it and use the point multiple times.
> 
> I don't understand why there's a RELOC_HIDE() in this_cpu().  The
> justification doesn't make sense, but I've not had time to explore what
> happens if we take it out.

There's no justification in xen/percpu.h?

My understanding is that we simply may not expose any accesses to per_cpu_*
variables directly to the compiler, or there's a risk that it might access
the "master" variable (i.e. CPU0's on at least x86).

Jan

