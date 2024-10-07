Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CABC9927C9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 11:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811774.1224430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxjfk-00055p-9Z; Mon, 07 Oct 2024 09:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811774.1224430; Mon, 07 Oct 2024 09:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxjfk-00053y-6h; Mon, 07 Oct 2024 09:04:56 +0000
Received: by outflank-mailman (input) for mailman id 811774;
 Mon, 07 Oct 2024 09:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sxjfi-00053s-N6
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 09:04:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36a10b48-848b-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 11:04:52 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37ce8458ae3so3899532f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 02:04:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99594a1e57sm84006666b.116.2024.10.07.02.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 02:04:51 -0700 (PDT)
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
X-Inumbo-ID: 36a10b48-848b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728291892; x=1728896692; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DoRRoVHbPFblqfjZIAeEt9phoNZleCDvQy8rWxFLdno=;
        b=KnlKjMbsWd7nNpXdg5YZZsFs1xsIuCkRNHqcNqyCu1o0K7XPRj5U/bieTxh9SqKItX
         MYaB2iCGZP4aNaj9btKDHtufe/lHOpj+mVzvI7H0Gssr0TVDFpzBbDyRbQE2fxlbIi3N
         +FHccQM+qHrCnvY1ftPgBYgICc7yQGplnvhE4Hai7oM/cOU/A/KQWiujwgA0msRF2arg
         3yFyrLDiiIaBJl2uOsn285XFAbfKo3UZmvDJVqk1h1MSUG5MfKNWIUjUgZEhSeXi15LM
         7M9olCGPHtTFGnRNqCmRhSaiJWUC2+vnWszB02679edvp66kLzMnPSPnEhCov+ShS8f6
         j4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728291892; x=1728896692;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoRRoVHbPFblqfjZIAeEt9phoNZleCDvQy8rWxFLdno=;
        b=ieOOcWlk7a+b1goP5pStOnYWun2JfIJlrzVGwU5lY5dn2jLrUZpEUYyx8AaY4v9UIC
         UMpR6QcbokmgbnKHKuAXh66Pes/PI+MeRALUMPSumbct4XqjffwqFiSTOPlnOSaOETO1
         mZJBAq3f0iQSvsHWdir2Bajk38Qswa/FUn24bPwGLwXQea65u+mEcpNug3Tp0FtCtQfr
         TVRCDwkMHYJX1JzK2JjmlZ3Bx2XqqIZjHInVnPNtFUDkHSG1RA2KZkfVANYp4WNh384S
         dEXVfaEfjmtU8clXiU3xQSblkJjm7MNctfJJIVgNm3lmoIf8tCpwANfW+U6jlDGGDco2
         YVLw==
X-Forwarded-Encrypted: i=1; AJvYcCUz0eZPWW6ijMqs1L49Hb/J0fxzapO9+ogsupS+trufb53nGIe0F8kBNfl6LnsqWa8oTbhFVhddyaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyGKhkT9WHgxwKL4naAD3H2inRwOa4WrVM6f4n839yTKZsH5cG
	uQ9D4lyvS8kuX55TgOAKwWrYGMiC3WdQrlin+cQ2xvNMppVi4fLecJ9SiVN1iw==
X-Google-Smtp-Source: AGHT+IFskJ3TpdHyGqZZhl51F4nsOeUheIUbG0SHO1/Ha5J+FKLmItvd5kBoU16F8L6G4lP6cYoumQ==
X-Received: by 2002:a5d:43d1:0:b0:37c:cfbb:d357 with SMTP id ffacd0b85a97d-37d0e77743emr8855075f8f.30.1728291891954;
        Mon, 07 Oct 2024 02:04:51 -0700 (PDT)
Message-ID: <0439f313-1360-47b0-ae7e-a2a74ee4d51e@suse.com>
Date: Mon, 7 Oct 2024 11:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com>
 <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
 <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com>
 <CACHz=Zg3R4Ybr0GwhSaYsOo72mWtapnpQ7w-Wb=wjrf-or1J_g@mail.gmail.com>
 <CACHz=ZjCAEE2kiWdce0ApQqtA-3urSMFJYRdKv8Qa_-BrZZ8bw@mail.gmail.com>
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
In-Reply-To: <CACHz=ZjCAEE2kiWdce0ApQqtA-3urSMFJYRdKv8Qa_-BrZZ8bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.10.2024 10:15, Frediano Ziglio wrote:
> On Mon, Oct 7, 2024 at 9:07 AM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
>>
>> On Mon, Oct 7, 2024 at 8:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 05.10.2024 15:21, Andrew Cooper wrote:
>>>> On 05/10/2024 9:02 am, Frediano Ziglio wrote:
>>>>> --- a/xen/arch/x86/boot/Makefile
>>>>> +++ b/xen/arch/x86/boot/Makefile
>>>>> @@ -1,6 +1,6 @@
>>>>> -obj-bin-y += head.o cbundle.o
>>>>> +obj-bin-y += head.o cbundle.o reloc-trampoline.x64.o
>>>>
>>>> Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch wants
>>>> introducing here.
>>>>
>>>> That said, x64 is the one name for 64bit that we reliably don't use.
>>>> Also...
>>>>
>>>>> -head-bin-objs := cmdline.o reloc.o
>>>>> +head-bin-objs := cmdline.o reloc.o reloc-trampoline.o
>>>>
>>>> ... head-bin-objs isn't really correct now seeing as they're not
>>>> binaries in head.S.  Also ...
>>>>
>>>>>  nocov-y   += $(head-bin-objs)
>>>>>  noubsan-y += $(head-bin-objs)
>>>>
>>>> The no$(foo)'s needs extending to the 64bit objects too.  They're also
>>>> used early enough to explode.
>>>>
>>>> In Xen, 64bit objects are the norm, and it's 32bit ones which are the
>>>> exception, so how about we special case *.i386.o instead.  Then
>>>>
>>>> obj32 := cmdline.i386.o
>>>> obj32 += reloc.i386.o
>>>> obj32 += reloc-trampoline.i386.o
>>>
>>> I'd like to advocate for ix86 or i686. i386 gives a wrong impression imo.
>>
>> Why not simply x86 ? We already use it.
>>
> 
> Looking at current files, we also use (to distinguish more clearly 32
> and 64 bit) x86_32.

Either would be fine with me; as to x86 I took it that Andrew wanted to
express the 32-bit-ness, which x86 alone doesn't unambiguously do.

Jan

