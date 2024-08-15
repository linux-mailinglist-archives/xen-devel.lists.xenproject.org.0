Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E000C952AD8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 10:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777898.1187955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seW9A-00006J-3v; Thu, 15 Aug 2024 08:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777898.1187955; Thu, 15 Aug 2024 08:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seW9A-0008WF-12; Thu, 15 Aug 2024 08:47:52 +0000
Received: by outflank-mailman (input) for mailman id 777898;
 Thu, 15 Aug 2024 08:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seW98-0008W9-AJ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 08:47:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cc323a3-5ae3-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 10:47:49 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ba43b433beso986186a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 01:47:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cf0c4sm68081366b.51.2024.08.15.01.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 01:47:48 -0700 (PDT)
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
X-Inumbo-ID: 0cc323a3-5ae3-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723711668; x=1724316468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F944DroWBmv6b8y45tlawqP+JI0ZJYRiFEdbDFYeIrk=;
        b=HTyXaOdjetHQ9IfAkyBYhIf4lA90tqW90LR7bVeeVnRsI4g/VaJgB3mBmvYJmVfD1R
         FZbUwU+3usyVRe+/NCm1mKO99Z4SYKeUHWNhq0IVs+ELNxF8HEHfpl2SRCpFHohXjvQJ
         B4Hw8OO0kHmodRhf1hbYB1ENmqcpBMpKTQ7IUjG+X3i0GDMloMIcSomyHteHE7QZHUT1
         z6aEoPtq9htztnPKVOcnK80zGmnqfkWbDB7DlT7qKB4+DHFFWerHKxQ2C+7NTOL740JR
         i8ry+J7HEYCrHW/2X+buRtieelJK3dhDt7Aj18kw4HGlfu/tEZn9yIiJrT6FcHtHC0dF
         /jTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723711668; x=1724316468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F944DroWBmv6b8y45tlawqP+JI0ZJYRiFEdbDFYeIrk=;
        b=MGWkJDicy+fCDY7gx+rYVHCNpfgdNz0jwKHsCnSIxceUGeYd0DcWFn2zdFjVub2O/t
         bu0/KKv2m2373PAkTsAsy+QE+jqNNIWknzcgKtem8fpgjjGlUC0Kn93+nJzpk3OMq2QZ
         YoV+PQNT/J7GcBbsb1FSP77oZEbi9p98CfBdxTSu6DolliInBFL+tNNDVP4sDO6Cmawa
         9NNIUskHSGt8xBewvGFKP9KDre+OCAw4fZ3e8cl/enPzt2uBtnxNR48pIKQJAY5J0i+G
         ndr33GIh28O4xGJxHctVbFH0nWWEyeE6k4uFoteR49dacq61KMS8juK8OFYKVVhkz3bp
         GK0A==
X-Forwarded-Encrypted: i=1; AJvYcCW0reOFQdmpxmnOfJQT4ArJmRNtWpElVhUiMOa7eF9vC4k2XjK/Rty3RJUmRqlTHlw91LBZh9XTspaNhm8ZcisTfIBxBQEsTf29Tv8GgQM=
X-Gm-Message-State: AOJu0Yzev5pWPH56HF6OjEK+3jtx8zzyKGDbfwjH4jQTdMvzEQ6fjrhd
	4gFBKVdRQsmb5TogvPN1+DftmATiJ/vsVfHeguf0w6pway9Nf98LyQbH6EWGyA==
X-Google-Smtp-Source: AGHT+IE/WMiDEw+8bjhICHvJfRp6lhHz3YAmmumSiZ0OkL2JNMV4DMlaUVJL0CQRVyjsufnnXhTT2g==
X-Received: by 2002:a17:907:c7e4:b0:a72:44d8:3051 with SMTP id a640c23a62f3a-a8366c421b6mr382524666b.16.1723711668449;
        Thu, 15 Aug 2024 01:47:48 -0700 (PDT)
Message-ID: <5dd50f94-6d0a-4a78-ae80-a6105ce57d62@suse.com>
Date: Thu, 15 Aug 2024 10:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Support EFI multiboot loading using PE binary
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
 <2d0f0c05-1ee5-4972-868d-c94e45f71044@citrix.com>
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
In-Reply-To: <2d0f0c05-1ee5-4972-868d-c94e45f71044@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 23:31, Andrew Cooper wrote:
> On 14/08/2024 9:34 am, Frediano Ziglio wrote:
>> Testing this feature in preparation for UEFI CA memory mitigation
>> requirements I found some issues causing the loading to fail and
>> other minor issues.
>> Details in series commit messages.
>> This is adding an additional way to boot Xen, using GrUB2+EFI
>> (xen.efi:__efi64_mb2_start).
>>
>> Changes since v1:
>> - Changed title, apparently this is a kind of new mode;
>> - address lot of comments (see "Changes" in other messages).
>>
>> Frediano Ziglio (5):
>>   x86: Put trampoline in .init.data section
>>   x86: Set xen_phys_start and trampoline_xen_phys_start earlier
>>   x86: Force proper gdt_boot_base setting
>>   x86: Compensate relocation in case of EFI
>>   x86: Rollback relocation in case of EFI multiboot
> 
> Patch 1 is one part of supporting NX_COMPAT in the PE header, which is a
> requirement from Microsoft in order to be signed.
> 
> It has nothing to do with the rest of the series, which is about making
> the EFI+MB2 entry point work.
> 
> It would have helped a lot to not have mixed these together in a series
> claiming to only be about the latter.
> 
> 
> Now, as indicated in our documentation (yes - this is one of the very
> few I have managed to get committed),
> https://xenbits.xen.org/docs/latest/hypervisor-guide/x86/how-xen-boots.html#xen-efi
> 
> The MB2 tags existing in xen.efi is a known thing but came as a surprise
> to some.  It exists because xen.efi is a strict superset of xen.gz,
> including head.S which contains the MB1/MB2 tags.

Which in turn so far was just to keep build machinery as uniform as possible.
IOW I'd rather call the tags being there a side effect, not something that
was intentional. And for MB1 I don't think that's going to change with the
effort made now.

Jan

