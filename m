Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3943CC14D96
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 14:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152127.1482658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDjlQ-0005eP-1h; Tue, 28 Oct 2025 13:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152127.1482658; Tue, 28 Oct 2025 13:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDjlP-0005cV-VI; Tue, 28 Oct 2025 13:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1152127;
 Tue, 28 Oct 2025 13:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDjlP-0005cN-0N
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 13:29:27 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e11c6fd-b402-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 14:29:23 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso3553814f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 06:29:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b79cbsm20108444f8f.4.2025.10.28.06.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 06:29:22 -0700 (PDT)
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
X-Inumbo-ID: 1e11c6fd-b402-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761658163; x=1762262963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u7An7cNHcxyhz/j49Ir7rWmIXQajVG+SokXr+pLwHvM=;
        b=X4RKPL7nODR7gx+dmMu1wQnuQ4EP/997R9AFaI8M3/pfB0DvyPsvjCnZyUpmeQn9iD
         +QKTE4sbwBWSr78J9NeYgQj+ShP8Wywv6UuuFLNPme2Z1wxJcAgCYDqSwol352s0FPno
         h2qQcInD0YqDgWfkN/A9ZIoX3CAwVC8nZIRP8B3NSu+MKxQtMk/73sWZI0m5OqfYt5ZZ
         srmS6m8X1WQtH6LXdr1hkwidX3xVJbwV+y0ExyccYBlIPHYuK2ttuUgu1JV0rPAXeeZb
         VpnOuxFAjR2ci8SPunBuyH8/pHtUr4CLO+iq31lcbVkRhrH+CKi/mDCKuVpwW4d1Jl1x
         A5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761658163; x=1762262963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7An7cNHcxyhz/j49Ir7rWmIXQajVG+SokXr+pLwHvM=;
        b=wKpxU14aSKEGwXrImD0ZzyVGI+xHwGyAnPopapPY5EfAdcVZel+BRxTkdvif00EI80
         MT1/P4oh64GwFh/Yb+GQD9g1ZcqnKpTR8B2/UkEqi8zQ4HuUTwUrHeKRJoHiugH01TCJ
         FmKyuLWON1kPOcRyibXyAbD7UOL4w3JFZROwY3xBbnBaCRuVt2n1cdMWDSOcFRcAjIaX
         sOYd96DlNXNXwsaio53UH7vLFss7CCjSPv7bYo4a1Yti0x/yncTPDgvtVMD5pI6Xe8MO
         uiwtJBRjfNfRYlXS0VVE7zuX0pQsXPqtndLopzMnlgc00knCktPZqt+ha4Gx16lnzaem
         MLzA==
X-Forwarded-Encrypted: i=1; AJvYcCXGh2Xcd0WROUl24GTR2YzjUqlrKFbw4C8eMAUpt4/SqMl0P6XaM08dtc6Cx8O4LWHjhlCBZL1qU2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywm2v7wmOmj+653QlxZ1arl2LToAxUfF9ILK7QfqF9Ln52RRpHg
	5pwH9j7MdjfgA4oq6BMVUZtoT97eOy5B9nF+SPbt1s6zEgBmzizXTknJ89Rpreu2Ug==
X-Gm-Gg: ASbGncuhviCr0rOgFegY1ATSo2ogA3bgIqqCSr8xOPnqphO0bRePt3KGET+h8gdfARW
	lHEoyvAD9wrn4qGTvUTRN0mkSwb1cKG1IzNau/dIl492wNtj40aZg+4wS4xnQv3CdU9UZRGlfaW
	+eR59HeXsAG/Uw0Kx2apsGEbx12GCKRerrc20zrnRbXP/21sRPwL67umJZCHoATrrkzxcoiGv3D
	mP+g5JHxV3SA/ff5w76DLZlVfcTYwtFDKMQ+9/ERQjHU5mbr11iIiL+9UsdinQWIPb/VoBZKYRf
	LqfodbnRwsPll3v7bmykaElDmWvRFDpSwJ9iG/6ZpJuMRxkcbqdlgPrwpoyv29FDjRUnvPI/2iA
	UC9ME78t2CSlALZm40q/sOjBGBYbR7VofQJlsW9GDziWCAkIs1TNMr4H72OBCtK8sFXZ/t4XXQc
	lo/h/vqKmsAdQOs/GGcDTkJBbqFU7eWB9MKI8ZgnHVAu3jFd6gN2J32bRXHlvb
X-Google-Smtp-Source: AGHT+IFhIKKnMbqgZZde6KXfvbCPPqeUB8ANwTDNQ5Dxv7sDtNxrhLu17XL66nGqgXYBvDRzlBYWuw==
X-Received: by 2002:a05:6000:2c13:b0:427:167:c2c3 with SMTP id ffacd0b85a97d-429a7e9327amr2634214f8f.48.1761658163063;
        Tue, 28 Oct 2025 06:29:23 -0700 (PDT)
Message-ID: <8fd7c095-429e-41c3-bb55-39f28e98a488@suse.com>
Date: Tue, 28 Oct 2025 14:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/ucode: Relax digest check when Entrysign is
 fixed in firmware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
 <20251027221702.3362552-6-andrew.cooper3@citrix.com>
 <61fcf602-4a4f-4936-a346-a650115e838d@suse.com>
 <ad5d59cb-6208-40be-8212-9dbddbe2a8b9@citrix.com>
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
In-Reply-To: <ad5d59cb-6208-40be-8212-9dbddbe2a8b9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2025 12:31, Andrew Cooper wrote:
> On 28/10/2025 9:47 am, Jan Beulich wrote:
>> On 27.10.2025 23:17, Andrew Cooper wrote:
>>> @@ -603,3 +604,82 @@ static void __init __constructor test_digests_sorted(void)
>>>      }
>>>  }
>>>  #endif /* CONFIG_SELF_TESTS */
>>> +
>>> +/*
>>> + * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.  Firmware
>>> + * fixes were produced from Nov 2024.  Zen3 thru Zen5 can continue to take
>>> + * OS-loadable microcode updates using a new signature scheme, as long as
>>> + * firmware has been updated first.
>>> + */
>>> +void __init amd_check_entrysign(void)
>>> +{
>>> +    unsigned int curr_rev;
>>> +    uint8_t fixed_rev;
>>> +
>>> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
>> Given the function name, might this check better live at the call site?
> 
> Possibly, but I really don't want to split the vendor check away from
> the family ranges.
> 
> A family check without a vendor check in eyeshot is
> suspicious-going-on-buggy, and this is called once at init.

Well, okay, I'm certainly not going to insist. It merely occurred to me that
normally we would call amd_*() functions only once we know we run on AMD (or
sometimes Hygon) hardware.

Jan

