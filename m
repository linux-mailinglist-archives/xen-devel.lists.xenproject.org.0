Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66831CB5186
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 09:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183640.1506258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbxv-0002Q0-Es; Thu, 11 Dec 2025 08:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183640.1506258; Thu, 11 Dec 2025 08:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTbxv-0002OI-CB; Thu, 11 Dec 2025 08:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1183640;
 Thu, 11 Dec 2025 08:23:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTbxt-0002O5-9K
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 08:23:57 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb8b3ca3-d66a-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 09:23:55 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so5607755e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 00:23:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d9a174sm23498105e9.3.2025.12.11.00.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 00:23:54 -0800 (PST)
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
X-Inumbo-ID: bb8b3ca3-d66a-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765441434; x=1766046234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j7LMydaAXChFSGiONcnEvTsTxDWWWR/TBL4AqqtXITo=;
        b=XBoUCab7mljmApNJhOsauuI0ICuss1yDvErHk2+SZDWkLNnlmLtZE8u25O/5AUmxp0
         KjNf2MRm/TV1CFfrr4XeZ/ottTJkwG0w6RUmxV9IOMvo7n4q9m2TLA1yAFYR/pkTuybM
         wTmDmBSXGyVVeRz2eprXlW5V505ruPsQuepPWIomhJq60eYr148+lnEF4avV/9JLrvE+
         iaXmK+AdFPJ4D0sw5sSDRIWon4HyrXu+itwWRM2O6J91ZM8E5tKcuyh9Co2R/ozxrSmQ
         8qaus9tMaz3L0r/iTNsNRKaIzTkr16OFvpdiX+FBHW7dLFXq7VL+Wz70rBOtzVuHWZuc
         ryKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765441434; x=1766046234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7LMydaAXChFSGiONcnEvTsTxDWWWR/TBL4AqqtXITo=;
        b=coYG6Tez8YXAmoeor5vO3iWW3yjwIQEXzGpd+UcgHqKhlKWANM1xkz4wQNlnXSiZXe
         fIpbMFMD/gtR1S0LVZ0E9QmeWDPfw1u538FZiqH1p4NprFqnSMnlO6gTt1binIfJ/CMt
         MCVB8Mhg+nn8kVW0zoLAf6KIsxAwkbvr2907IW+PmHyvWxy8b13Pq9+/0tFokis8Bn7c
         g7WZPPRvN7enn+ueJCpdD9qRthFs6sdJpJI2zw8HRu4XE0aVUeh/d/OU5SkLG6Dg1oxO
         tdFYa4HDQh8GyQDPMsTalboMpOXJNrwPVpvf0h71GJL06S4hViU+LCi76MLg57q9eXUQ
         QkNQ==
X-Gm-Message-State: AOJu0YxEdcrK3ZFFGUgMXPb91KyKodjaefxPUXMfhuZqtOGIhd0PDsk5
	96Twg11Wf0E5j98jJBqKnJhe/aLn4Oh2VhVaTClt4WoQyGWDgnFvBi3TS5L3lEkrWQ==
X-Gm-Gg: AY/fxX78AhvLUlvjV8+9lKvVrTS2vcakhjKlYMPqBPhnR+lzHtIP8E+eDzqfohIlhXb
	+KmJXC3B7ls06C5mox4Cb5rNL6JIEnspdIgq0DOIhxdZ92GmifNPc4S7pxL5RG76sQ02IjcEi3n
	DnMl9V0avjOW1YCWqPGBKvaOp79tNgkr9f+ef5HGwSLJ3Oq5ytCmD0i7yc6Pa22/NsBZSz3unEc
	ejURMc95qeTkyzivFAmhnMNxuklooIZA5tduupg9XqkN7815Jb9EBN8PZ9w6kUevACDXNkxMBek
	1lL2Ympdm1iHalA+p9Qc05LrGsvwdY9C4QyCJXCLffbaTHN9N7WHvPR2fF5idf3aJ+jxkHa7tXs
	ITPPHFhhl3f4KUQ25slO89Wb2DOS9z43Enh38YOCJ+c7poya8IsuA/e5DYOBCPgutGD4o4E7PzV
	Ow/jwo44dEtxwwghF5Gh2mvCQBcxCItMQWk70vbELZK5NKchRHTkaFKWCx8k1BO3l2frbY3rkDc
	5Q=
X-Google-Smtp-Source: AGHT+IE/zPKUoHR7dBbS39aCe2sUKVFnUMcB5mK5j5+Yjvcm7F3jSDPdKcovkk4sw1+DtlTByS9r6Q==
X-Received: by 2002:a05:600c:c171:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47a83795f6emr61653905e9.30.1765441434513;
        Thu, 11 Dec 2025 00:23:54 -0800 (PST)
Message-ID: <9b7f6d06-a23e-42b3-bc6e-bee5bc6e4186@suse.com>
Date: Thu, 11 Dec 2025 09:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Victor Lira <victorm.lira@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com> <aTmGTWIO2ZKWuQeu@l14>
 <a6d3737f-19e0-4a52-a5d9-70bbfe7630a8@amd.com>
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
In-Reply-To: <a6d3737f-19e0-4a52-a5d9-70bbfe7630a8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2025 18:08, Jason Andryuk wrote:
> On 2025-12-10 09:40, Anthony PERARD wrote:
>> On Tue, Dec 09, 2025 at 04:47:28PM -0500, Jason Andryuk wrote:
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index e6cf287425..aeb5dcf2ee 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>>>   
>>>   include $(srctree)/arch/$(SRCARCH)/arch.mk
>>>   
>>> +XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections
>>
>> Is there a good reason to add this flags after the arch-specific
>> makefiles? If not, could you move that just before, and right after the
>> definition of "$(all-symbols)" as it's a variable that is used in the
>> same phase of the build. (With Jan's other feedback)
> 
> No, there is no reason for its location.  I can move it.
> 
>>>   # define new variables to avoid the ones defined in Config.mk
>>>   export XEN_CFLAGS := $(CFLAGS)
>>>   export XEN_AFLAGS := $(AFLAGS)
>>>   export XEN_LDFLAGS := $(LDFLAGS)
>>> +export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)
>>
>> "FINAL" isn't very descriptive. A completely wrong interpretation might
>> be that we should use the "final" variable instead of "XEN_LDFLAGS". How
>> about a name that describe where this set of flags is going to be used,
>> like "XEN_LDFLAGS_xen_syms" (which unfortunately doesn't exactly fit
>> with x86 xen.efi target), or maybe suffix it with "_target" or just
>> "_xen"? (In Linux build system, they use "LDFLAGS_vmlinux", but I don't
>> know what would be the equivalent of "vmlinux" in our build system.)
> 
> I plan to use "_xen" unless anyone objects.  "_xen_lds" could be another 
> option, but again that doesn't match efi.lds.

_lds would also be wrong - that rather refers to the linker script than the
final binary linking of which these flags influence.

Jan

