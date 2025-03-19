Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84878A68D14
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:41:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920621.1324740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusjD-0006pW-Hd; Wed, 19 Mar 2025 12:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920621.1324740; Wed, 19 Mar 2025 12:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusjD-0006mu-Dl; Wed, 19 Mar 2025 12:40:59 +0000
Received: by outflank-mailman (input) for mailman id 920621;
 Wed, 19 Mar 2025 12:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tusjB-0006mm-TZ
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:40:57 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675b5904-04bf-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 13:40:57 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so5872831f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:40:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df413esm20457085f8f.20.2025.03.19.05.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:40:55 -0700 (PDT)
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
X-Inumbo-ID: 675b5904-04bf-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742388056; x=1742992856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ADrKtkmrbb4yXil4M1R24B7CmmSgxM0Dukn9aN6UYc=;
        b=VpkJT3MBmTYin5pIX9bWJEZSUnybZBlRm1WiS8BUe7U6NSK5sOx7JzhPylzEY9z9/d
         uWTQ8xEv4iqexhi3ac5C10GGFL5TEiaZYTzuRHU3LI38c0xLEkS/YogOHM9Oys/gFYzU
         Ds3uRHXvFHLIPRg7Za1iErUx+tbJAuEqTw8Svf3Y0FPVj22CodgLAdJrloT51XLqj5AH
         LdBXosdHAC8f+/4cLocrujyn9q6/xyIEWu6JstUaMXWTMpWdjX7wpplYd75yAYkcb5XO
         zxSjzXe1x99NDpbgYwcfhjqnn90e+2psbD+QZGIA4Ft1B6crlGiWA388qGIh1MwuoBdA
         hGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388056; x=1742992856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ADrKtkmrbb4yXil4M1R24B7CmmSgxM0Dukn9aN6UYc=;
        b=VxC46SweHjtiBzh58xbdVPkqSUeZ9VoyV4mJmL/DK/GTBKN8jT5RlZuGYJs0q3OYC5
         CxMzpqIIdofw7qPOMFZyd5NUrNaQnks0WTJtF7pzjEUjWbfPqP5t/OS6n2c9B0YcAtAs
         sT7xIA5C/0Fnitea3a6m3sWqISO5RUAe4wVx9+sSYZNACsU0LbnuGHlmdN3/zQKbZnFk
         hfyKJ2I4di65Q2hklHrOJKR559W/On25118nEA3/gGG9v1fmloo3zWUkx4Hsyp8+8kXo
         jye3gpN0hcQK8oAdZRjtPjxE+iKFZousLw68KjH34AQua8UFt2mpxaqnv6rhD87G8SJc
         ALOg==
X-Gm-Message-State: AOJu0YwjaRVPC/h2K0Nm8euAqmhURpMlCLE9fuQGvZ7H8/w5V8m+Fase
	v/e69BaqEa7epX20qMkN7+NXe5BLvIEQb4H8c9Gv1PosxBDwd2t8yCtIxKMXNg==
X-Gm-Gg: ASbGncvLe0vrXu4HajsJBR5pwVoXQErpFf9bXcT9WBEvLTZmwQdZKJ+brP/zYIuxixG
	QLG6iVdtrZ0AatWQZQ+Z79fhlS6aKyR0t8JVKzWPCG1deFSooNFU9zbWNaBBWAKSlt3hreFXyRl
	0Q2CPiUmBg5yy0ARYs0ZN+9UDiVcVvaEvF2HEQfA0RDZnhgnBKNTUnyMVlu+6qXTdQdvYjKEORy
	wJRuShvW/U4428LKeLUKZ7SDrNmJIO1Flv8xB9THs1FA4v7MmZgSpCF66VEcZXi7TI9shGtJxAZ
	xP5Ghvf09/SOIvglNxRBY+VQ9VG5dSlvOIx0Vg7qIT+s06r7mfVrNJ3sjUxOr/+zomeKGAoz5yD
	pqmOmWhHhuzof1Fjnk0IdxI2GjLeHqajZbu7Po24U
X-Google-Smtp-Source: AGHT+IEWg1JpvkGatTmrRpQkHzxF/kfYAcvyRKPD3kHmNsWxpdvYgJont8f1/hqCj+WHHsFl0wQAJw==
X-Received: by 2002:a5d:5888:0:b0:391:2932:e67b with SMTP id ffacd0b85a97d-39973afa2ddmr3543931f8f.35.1742388056219;
        Wed, 19 Mar 2025 05:40:56 -0700 (PDT)
Message-ID: <b396cdb8-8a5e-448f-b574-1cfc797356d2@suse.com>
Date: Wed, 19 Mar 2025 13:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/setup: correct off-by-1 in module mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <f346b510-dbd1-431a-ad35-3f1b8fe76c58@suse.com>
 <Z9q1Zv9IEJOCycan@macbook.local>
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
In-Reply-To: <Z9q1Zv9IEJOCycan@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 13:15, Roger Pau Monné wrote:
> On Wed, Mar 19, 2025 at 12:21:53PM +0100, Jan Beulich wrote:
>> If a module's length is an exact multiple of PAGE_SIZE, the 2nd argument
>> passed to set_pdx_range() would be one larger than intended. Use
>> PFN_{UP,DOWN}() there instead.
>>
>> Fixes: cd7cc5320bb2 ("x86/boot: add start and size fields to struct boot_module")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1730,7 +1730,7 @@ void asmlinkage __init noreturn __start_
>>      {
>>          unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>>  
>> -        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s + l) + 1);
>> +        set_pdx_range(PFN_DOWN(s), PFN_UP(s + l));
> 
> Is the set_pdx_range() provided smfn, emfn range inclusive?

No, it's exclusive at the end. See all other uses in this file.

>>          map_pages_to_xen((unsigned long)maddr_to_virt(s), maddr_to_mfn(s),
>>                           PFN_UP(l), PAGE_HYPERVISOR);
> 
> Isn't this line also bogus, as there's no guarantee that the start
> address is aligned to PAGE_SIZE?  And hence the length should take
> into account a possible page offset of s?

See Andrew's reply.

Jan

