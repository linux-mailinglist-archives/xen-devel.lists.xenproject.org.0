Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD3A5F109
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911875.1318250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfwF-0001Fv-6u; Thu, 13 Mar 2025 10:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911875.1318250; Thu, 13 Mar 2025 10:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfwF-0001ET-2k; Thu, 13 Mar 2025 10:37:19 +0000
Received: by outflank-mailman (input) for mailman id 911875;
 Thu, 13 Mar 2025 10:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsfwD-0001EN-JN
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:37:17 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 216a0811-fff7-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 11:37:15 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso473862f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 03:37:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7e9f8asm1639658f8f.81.2025.03.13.03.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 03:37:14 -0700 (PDT)
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
X-Inumbo-ID: 216a0811-fff7-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741862235; x=1742467035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bCsFaK1DbMz+wfAmV4eaP5+DgPJvy1c+lDQ5wv8Yy9w=;
        b=BkH2ZAJ6SjyehpIxABLhmk+a4hPktXHekDhOa7uFkoDbdk1nAuZEKG8ufuWK7PFCS9
         IKgEjYEVqcTuWFC1hkiakmVC0oQ6fMyXonlbJm/N0z3B1knSMHCkFa5FTzrsO0c9IPJO
         eQ4SakJoupWJcvAvIY5CHMv4Z69mkCODFKNIyybpATqLnIYDcKewQHoLFL3Lgw1NiHpM
         B2m86sF1XXKvmwZEoPVkg6Rz2hPMIxsFCk8x7Yga3pc3ulNq10myR26Vzun6FCH37GSZ
         tJbE8XABkg+ekfbEC6jDk8lAaKFYh9aPV1p5rAPlK1BqY3mqAxnqQa/JWoRsbj3gMTgU
         o9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741862235; x=1742467035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCsFaK1DbMz+wfAmV4eaP5+DgPJvy1c+lDQ5wv8Yy9w=;
        b=Gsn3tDKVTnN6539yz4uCb7lZVfkXNM5WDLUkG5jewKAxz0bw9D6cQ5MnRi6O7wB3X7
         l3EpZvckDeLUPRMG75fHWB/vPeqc4ALQwjtykgTcyDhJ6ufbpjTI1DmrdBzDT83aeROL
         BiOt1IE3aEGacILb9vTX3bIy2C10X3a8FLIT9hz+lAzt8OwsN2ebQPCPxmFQ0l7Yxofd
         meCjrNWLMSxxbxqvNZjd0vewE2Ib8GY+GqGpEd9WeKrGyojlJ28BZszr0u0DbX7j5nsC
         62xw7DWqg8LHr0gTJBO1LZqjZcuV3Nyung9yb6LEL66nE71kl5W4lhQvOxGxYFVtItAj
         U0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNOi5fCK9IU/s+9eDBnqm6jXUTWc8xtnqf+aS/ZzTcRXez2rt6fWkkmjzjV2O3FIvNsMijROHGkBs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywwi3Jk81y4RgnaFPMP7fof71znZ/HhZQG1NwScRPAq827zfJDU
	v0rwvumlLvGYJHZu+UNqDVhKAnHgzKwVLPPgwZZNGsNTk1ZANvXWJYV0zLltow==
X-Gm-Gg: ASbGncvBVuhVkX5HAhzhlbNtwrNI0oVkxF9tkEGz0TSAys61hGmoVboSL+Emal+d6l8
	snArPYl/epe/tz5wDFECVcu9k6pqW9roztTTSQluyLtgm0ztYpIMoMUrHNyLIDeUQ+dNo6IHHGk
	WpyAKuG/c32306vZStRih0UAEiGA/cje1mwtFy6KvfRs+DEz4hzE5MO087Mk9EtAYiSUXeq1upx
	Q47ooT6ciIeLh72iwGSEkK3436zYlKwSrdH5739lIATJzoyy3Etfcq5M+pxMFzzp2zQ8UdoC1ta
	vNJnbeSfJfK67fcEXbSdfbeWha2+q5uaelBRC/oBtq7o7gGQgLF1P08XeyW7EpmJm0K7feBdPXI
	rZP6obFk9ySfPc0rbtfqZVyUEnnQBRw==
X-Google-Smtp-Source: AGHT+IFE3qs8JCAC3RSNn2MOFrHogcnELgObJYUNA97d4s33+UQ54Z4sMirYynMf9H09MAmu+zUTPw==
X-Received: by 2002:a5d:588f:0:b0:390:f394:6274 with SMTP id ffacd0b85a97d-39132da9214mr19566760f8f.52.1741862234904;
        Thu, 13 Mar 2025 03:37:14 -0700 (PDT)
Message-ID: <0e539290-a87d-4774-8b91-7cf8cd89a574@suse.com>
Date: Thu, 13 Mar 2025 11:37:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Community Manager <community.manager@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Huang Rui
 <ray.huang@amd.com>, xen-devel@lists.xenproject.org,
 Jiqian Chen <Jiqian.Chen@amd.com>
References: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
 <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>
 <Z9G39ULeHr7fp9ur@macbook.local>
 <7977cc2d-d654-49be-8bf9-9d3fe9286857@suse.com>
 <Z9Kp6b3l2YAePqWl@macbook.local>
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
In-Reply-To: <Z9Kp6b3l2YAePqWl@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 10:48, Roger Pau Monné wrote:
> On Thu, Mar 13, 2025 at 08:42:25AM +0100, Jan Beulich wrote:
>> On 12.03.2025 17:36, Roger Pau Monné wrote:
>>> On Wed, Mar 12, 2025 at 09:51:09AM +0100, Jan Beulich wrote:
>>>> On 12.03.2025 05:02, Jiqian Chen wrote:
>>>>> PCI passthrough is already supported for HVM domUs when dom0 is PVH
>>>>> on x86. The last related patch on Qemu side was merged after Xen4.20
>>>>> release. So mention this feature in Xen4.21 entry.
>>>>>
>>>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>>>> ---
>>>>>  CHANGELOG.md | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>> index 7201c484f899..b6de9b72ea7a 100644
>>>>> --- a/CHANGELOG.md
>>>>> +++ b/CHANGELOG.md
>>>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>   - On x86:
>>>>>     - Option to attempt to fixup p2m page-faults on PVH dom0.
>>>>>     - Resizable BARs is supported for PVH dom0.
>>>>> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
>>>>
>>>> Aren't we still in need of SR-IOV support in order to make such an
>>>> unconditional statement?
>>>
>>> I view SR-IOV as kind of orthogonal to this: SR-IOV is not
>>> supported at all on PVH dom0, so it's not just pass through, but the
>>> capability itself that won't work as expected when using such devices.
>>
>> Hmm, yes and no. No in so far as I as someone who simply wants to use Xen
>> would read the above statement as indicating full pass-through support.
>> Which first and foremost includes the passing through of VFs.
> 
> Maybe we can clarify somehow that SR-IOV devices are still not
> supported on a PVH dom0:
> 
>  - Support PCI passthrough for HVM domUs when dom0 is PVH (note
>    SR-IOV capability usage is not yet supported on PVH dom0).

I'd prefer if we made this explicit, yes.

> In any case we should likely wait for:
> 
> https://lore.kernel.org/xen-devel/20250308001711.18746-1-jason.andryuk@amd.com/
> 
> To be committed?

Sure - they're in now.

Jan

