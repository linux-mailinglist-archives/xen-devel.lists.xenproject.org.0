Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88939D01F7A
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197487.1515008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmkf-0000hH-SH; Thu, 08 Jan 2026 09:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197487.1515008; Thu, 08 Jan 2026 09:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmkf-0000fM-Oq; Thu, 08 Jan 2026 09:56:21 +0000
Received: by outflank-mailman (input) for mailman id 1197487;
 Thu, 08 Jan 2026 09:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdmkd-0000fE-TJ
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:56:19 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46837529-ec78-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:56:17 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43246af170aso963144f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 01:56:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5edd51sm15337048f8f.29.2026.01.08.01.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:56:16 -0800 (PST)
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
X-Inumbo-ID: 46837529-ec78-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767866177; x=1768470977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hqOFAR/5dSs+X6gblmJlD6usFQ5OMVq3F3YVCBe0U44=;
        b=PdWn4McXcF7JOexjxTVZ7B4O5Ui39E7K8swpE+urFlSRbNg6BOopQR6dVOlXTH/gDs
         kH/FYDIOZx+F7KBgA2M5LD288Cp/Hfy/T8WrnsjIkTBoaRny9F0cI3k/gbhNFitBtXsu
         1K3Q8VwoP4LPK1QQLQHiVUvd9PM1yoll3kfBZZwM4AZxHqn8aBV8CYnW1l01GQSwO3/t
         3hwbldaAzNvbczGFQetoY2E5Irj5RCEVY9FMershvKdqiVKfn/vqtCU9LGPW2lnoAArI
         lzfXGI478fRmKWHxRl3SA6BfKWZwkzYnwAOBlffNM5susdI5Ej49jyCpUn0Sv0w0k/cR
         WiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866177; x=1768470977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqOFAR/5dSs+X6gblmJlD6usFQ5OMVq3F3YVCBe0U44=;
        b=cXITmUt8dmAdZcdRrGfUO3XDnbVpuS9sulOWUs9/6lMrHMPJ13VY9H1AhHqfgFsX9e
         Hx68JpsPSv6XsbMlMPBpXTFpWSKKhc/UOkhaaSuFjL4bwsRHobhbBRV7IkQZtWefDujl
         8PSRupxOol3cKobz2ut0tvlj2ljfERpSEBbpaXRk++sg7KGo3PQmLN9SjbwUGdN6Prh2
         htQ1hxNwCze6MAQpemK8UADYZxsSRuNZ5XAcKxeDRo2EpNe0XmqNU+rOZg4bk7c2KyxP
         cvdRMC2ss1BNgKW1gofbgNHbvXBI6gSMTYgbV90hOhHQtgtNyt/t7WMtLHpxAjh6/QaB
         msIw==
X-Forwarded-Encrypted: i=1; AJvYcCWxitkLTloKKBEZL6z3VPnfkjNPmFNGeMMG1I0Dq348o+uASTrEge7z4CraNXR8VefaQbQu95snByI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjSpNuhrTkixZO6+ZCpydMQYXuoUf0wcEgX2JImVlXweFjyW9o
	MpPGdqFEBK5vgEwoZijE5HjWvcybpWEOn0M5/Lg3jIZ2UzkPUBIdK69zkctNwQIhlg==
X-Gm-Gg: AY/fxX7hh2Rx/xpFTebnupARtv3s99BNj40UyBvpMLALcuyipKsljX6yuFU2cjSPbB5
	rigKSjOkAZ0ZL6RW6PnNPYDilYhCpmi/WAJXVZ8LbcG45ExqRjYprCsFiTnx+hhtluy5dq1ksBL
	oi/sfF6BCPfyNFwUr4/5K7GCnDtKMeebrRYNVUSjAs0Vk5LBzNI0SdJ3lwFMQro9rDXBdI0Y4av
	ebltIJ9QTz4l7K8vRvkYuS+3buVmZafFHooHTZJSQ0IvyEwsznzWgO4p4/nuCtIgIWoYaWpISNM
	NDJR2VzOHsBzqqNotrzfGFZt29BeqsUXqvBfkBjr6hro2yld/+k2sil6HSCAp6LO/9g15cZ66Ze
	KaeMpzzs9ze4BwNTsqfhhrFgWz0oB3Yq8hcDDFYjRJC6VCryTx2uqWvlC9CdNgnIU41TcwS9TL4
	mJh+4JgI13DV+WhovvkMO6M98yIN1/cjfq1V/ABDxBhBRHVw83zG5M88Lu4imbgasb9IBbBqPKj
	os=
X-Google-Smtp-Source: AGHT+IHzmjkKaAO/grGEadXL71Tyj4dev7esVW0hvuQna5AKqnwwcwvLFW0OAvoecmRwC3U0JYLLuA==
X-Received: by 2002:a5d:5d87:0:b0:431:de5:93c7 with SMTP id ffacd0b85a97d-432bcf9a0ffmr13486297f8f.2.1767866176745;
        Thu, 08 Jan 2026 01:56:16 -0800 (PST)
Message-ID: <a461e3fd-8fb9-4868-97f6-8c242a69bb94@suse.com>
Date: Thu, 8 Jan 2026 10:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] x86/pci: Prefer using mmcfg for accessing
 configuration space
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1767804090.git.teddy.astie@vates.tech>
 <27c85c2cded576b3d5253c6e182e24341201c3ea.1767804090.git.teddy.astie@vates.tech>
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
In-Reply-To: <27c85c2cded576b3d5253c6e182e24341201c3ea.1767804090.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2026 17:54, Teddy Astie wrote:
> Current logic prefer using CFC/CF8 and fallbacks on mmcfg when accessing
>> 255 registers or a non-zero segment. Change the logic to always rely

(Minor: Many mail programs, like mine, will mistake a > in the first column
as being reply quoting.)

> on mmcfg unless it is not available to avoid locking on pci_config_lock
> if possible.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Are there x86 platforms where MMCFG is the only way to access PCI configuration space ?

If there were, how would that fact be communicated?

> --- a/xen/arch/x86/x86_64/pci.c
> +++ b/xen/arch/x86/x86_64/pci.c
> @@ -14,62 +14,56 @@
>  uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
>  {
>      uint32_t value;
> +    int ret = pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, &value);

Along the lines of what in particular Roger said in reply to the cover letter,
I'm unconvinced we want to slow down (even if just minimally) things by
unconditionally making this call (and similar ones below).

Jan

