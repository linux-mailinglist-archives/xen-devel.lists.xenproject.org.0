Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C21DBC9998
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 16:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140686.1475489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ruo-0003vj-BE; Thu, 09 Oct 2025 14:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140686.1475489; Thu, 09 Oct 2025 14:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ruo-0003tc-8P; Thu, 09 Oct 2025 14:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1140686;
 Thu, 09 Oct 2025 14:46:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6rum-0003tW-HJ
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 14:46:44 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2a29b27-a51e-11f0-9d15-b5c5bf9af7f9;
 Thu, 09 Oct 2025 16:46:38 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so528817f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 07:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f0392sm35603391f8f.42.2025.10.09.07.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 07:46:37 -0700 (PDT)
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
X-Inumbo-ID: c2a29b27-a51e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760021197; x=1760625997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=86vCcZ0cub0piXT9v6NJ6O7PLKdPN4Uz6TO+S8WmTHM=;
        b=NaU47DcRTJy2CG1fOXEuI1n42OHxP5GpI/Q85ZcHYE2S5bweQrsYPyYyIghgZJZvjC
         HWxaDXU0o3YTwRAwvpCHRqxry7k1rm5zsPDU+eHseVXckUjMN3scsiSSeXIgI6FV0CO+
         l1FVBEErkQNabauY7MCzfKnX/O4v0BLSI7I9pnTtk0yaQJ+8oINmGNIxDUfQ88KgHBKq
         /C5QfZVpY0fVdbXXlIk6gXhgrJyoJe+nxmHG+BugdFHp4cu2cGWdhtiHNGg3De+oBgAC
         AuhNVRSEhYcaGnf7Og8ksSt6c5W3z+sK+3fPBGMLRKHlGWb2Xyaen9Cw2tZv/tEH9OcQ
         mDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021198; x=1760625998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86vCcZ0cub0piXT9v6NJ6O7PLKdPN4Uz6TO+S8WmTHM=;
        b=vn7sWvf0V4QoCOE9G1+2s45n694+3MUc0hnt4xiCxsXlsobv5D02HvotIUsC0j1ZDi
         wYBwsLIkP6ahbHMBtNn8E4swA/cqvVO61lwpM3yGHsWaIf5rnGkfK5IdvBUWzuaLF7Nx
         rOGXs96Jo2O/VgGp1EJG/ELzaadzGqCJZcHikuFggcPmtl/i91FE828dhPc+EnwXaUrw
         yH1Q8Da9I76pA51Ap8fbrASv73eEJv+GLkpptZGusja7A0TMhYNDAImMAECYAZJhFaFg
         Go9x8tjwbA5d6u7i5jTiVMhhPJb7Be6f3WwGtKiMrOCnVuqg+gG9dvxGNvdrzQP5Nu3e
         6AEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfKkRskaVDqTMJMHj80xd/voZ9Da6+FL984CJC/GshcKTOvnE4XlyfLs5Dcbi2T6tAnQxTxfy9FoQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyTIdNaU6uUftdGup7xfu4e3rDwoSZLGmGYr4weYl9IzJfER0U
	5IEoMEBRnilh1NSMyG+wT5A3tt7osaJ20mbbTxPvxApf5IbQdRwP0DmBqelg6MHpcw==
X-Gm-Gg: ASbGncv034uGOyWji4hTBlPIXN7EFqJ3hb0JMvyaOqDOKtE/XZ8tDzUNSw11IfPweoP
	GUelqNLlF/13oPNr2axpa00D3j0TFqlXSVLyeRKZiZZaOsKkCwuRum36GjhtCy3uY+5tJ8oUqtE
	CRelogacaD8EfQ6YPkgMIrnTH4pIfLGIcCht9X5UbZwqEnrD916W0pgQpERGYABXOJfBIN0+b2q
	YKYU0ZWB56AJrRfGoRHhduSxEyuubK+zP48DNfUF17s7v3xudyR9JwYqd4PyJLO57a14FkUyiDb
	0MliYNZbbmuGIbmKqNkp6Kv2zgTqfhUKJDoaI9wB3escved4GITbh5rVciX1Wap7Td96EmEw8PH
	ObBAVkhCFGozNNOdWd063cJZUGucVnKa5/FRHxiZNnhr0DupJLXyOq4XThwhfZvoetnl2MKZGFm
	YB/idUBodJMlyVJ6pkH6FghBOJZWY/MtQ=
X-Google-Smtp-Source: AGHT+IEj5+crxItN/hK9WVfFBS9EOBI5hb+HTKh/GHDzJUOB0nVg1/K3agB1dV75FOLcRxGLAvF+Zg==
X-Received: by 2002:a05:6000:1a85:b0:3f3:c137:680e with SMTP id ffacd0b85a97d-4266e8e0825mr5022043f8f.43.1760021197571;
        Thu, 09 Oct 2025 07:46:37 -0700 (PDT)
Message-ID: <0d678d1a-3c0d-4d83-949d-b840738cc353@suse.com>
Date: Thu, 9 Oct 2025 16:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251008201106.36204-1-jason.andryuk@amd.com>
 <cf852476-8a51-4623-b4aa-d9fc42622b1c@suse.com>
 <0923545c-ea7d-4b57-af37-351ede01d5e4@amd.com>
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
In-Reply-To: <0923545c-ea7d-4b57-af37-351ede01d5e4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2025 10:19, Jason Andryuk wrote:
> On 2025-10-09 08:36, Jan Beulich wrote:
>> On 08.10.2025 22:11, Jason Andryuk wrote:
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -220,6 +220,23 @@ F:	xen/drivers/acpi/
>>>   F:	xen/include/acpi/
>>>   F:	tools/libacpi/
>>>   
>>> +AMD IOMMU
>>> +M:	Jan Beulich <jbeulich@suse.com>
>>> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
>>> +M:	Roger Pau Monné <roger.pau@citrix.com>
>>> +R:	Jason Andryuk <jason.andryuk@amd.com>
>>> +S:	Supported
>>> +F:	xen/drivers/passthrough/amd/
>>> +
>>> +AMD SVM
>>> +M:	Jan Beulich <jbeulich@suse.com>
>>> +M:	Andrew Cooper <andrew.cooper3@citrix.com>
>>> +M:	Roger Pau Monné <roger.pau@citrix.com>
>>> +R:	Jason Andryuk <jason.andryuk@amd.com>
>>> +S:	Supported
>>> +F:	xen/arch/x86/hvm/svm/
>>> +F:	xen/arch/x86/cpu/vpmu_amd.c
>>
>> What about xen/arch/x86/include/asm/hvm/svm/ ? It didn't need specific
>> mentioning on the X86 entry, but it would now. Also F: entries generally
>> want sorting alphabetically as well.
> 
> Yes, that all sounds good.  I based this on a revert of 
> 8395f275ebd11b4cacb12da09911e7918ccc7518 and alphabetization was 
> incorrect there.  Sorry about that.
> 
>>> @@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
>>>   S:	Supported
>>>   L:	xen-devel@lists.xenproject.org
>>>   F:	xen/arch/x86/
>>> -F:	xen/drivers/passthrough/amd/
>>> +X:	xen/arch/x86/hvm/svm/
>>> +X:	xen/arch/x86/cpu/vpmu_amd.c
>>
>> Didn't the v1 discussion result in there being no need for these X:
>> entries?
> 
> I thought Anthony said they should be split out for proper nesting:
> 
>  >The exclusion is likely unnecessary, and ./get_maintainer.pl will just
>  >get the information (email, ...) from every sections that a file match.
>  >But the duplication is necessary due to the "The meaning of nesting"
>  >described in the MAINTAINERS file.
> 
> I took the second sentence to mean they should remain.

But the 2nd sentence was about duplication (i.e. splitting), not
exclusion.

Jan

