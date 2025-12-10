Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28045CB29BE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 10:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182745.1505583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGvM-0000sg-8R; Wed, 10 Dec 2025 09:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182745.1505583; Wed, 10 Dec 2025 09:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTGvM-0000qE-5d; Wed, 10 Dec 2025 09:55:56 +0000
Received: by outflank-mailman (input) for mailman id 1182745;
 Wed, 10 Dec 2025 09:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTGvL-0000q8-55
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 09:55:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6d964e-d5ae-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 10:55:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so86295125e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 01:55:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d31ec4sm39263155e9.8.2025.12.10.01.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 01:55:52 -0800 (PST)
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
X-Inumbo-ID: 6a6d964e-d5ae-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765360553; x=1765965353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t10g5AM0BwV633MQVA5cCi4ChuGEhbb1NFzOH96J87Y=;
        b=DSAiu+y5iTfxPkttnQqWGFofBSlgMR8D2olueBo9Gnvu2m/+PE4UFq01Co83L/CkWQ
         0Q8AFLMprGdNb4ebiXL7wp9hjvybXfWsbMTHOd1b4BcwmAfX9AOWoWurl10fbJkbNq7K
         CL53kE20RvLG1rcr/y9a8ZaU/IYjTHGsltMLPjCrnton45G6d/XxrMvvMvCoErOA5Plf
         bcl9jwEKyIpteG1w3XNkRn+qCAc2wFpF/tmFVDCIuw1JJcvX9XWcK5qQhtKzBmRhwBUZ
         H/48iUfHq5A19T8QVIk0XU5Gz8/8d0jXynyXiQZwYqo8+AMWu+pV8t8jl09eqSndb2OS
         2TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765360553; x=1765965353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t10g5AM0BwV633MQVA5cCi4ChuGEhbb1NFzOH96J87Y=;
        b=WmrmL7PD4FJPxvwrZMvKieIKKk8xguTydc5jDvMPbC3LPfHSx5GqvlOqBXzJQvYoMB
         C8lf4qMgIwi8bUVbZ6yIEniTLqH+Enjv1cjd36sfOV4tprRHDV+X6nKqS0+4MxQOqdOg
         pu3vENN0a37kIDkauNlzBHesyHSy4K11x919Uzdt8ylaKUeP6V/4yW7ubGekqdhLTukj
         oZq2qHAulC3EYVGrs6NV6ILzlXJcxpip2pKroNgI9o9CKdKbOkk4+3j8KAjS7XjaI0Mp
         LfhmwgwD+UV9nlUwSW35mAW8xigdzJCSwQy7BNNhSJuldJG2rO3n4GawdXSqFrcQc4zA
         JCwA==
X-Gm-Message-State: AOJu0YwqSaCt5Sdoi043TAckH3ZI5yDZ91yRSQikc2y84nA0iZScRbXZ
	NeqjJAin+JnCN4rlInAblyc6dnR7bznvgRCfTyKIQJckxNmHPmX0q15MJaBITnHYaA==
X-Gm-Gg: ASbGncuoMRRbQa9AIKfrTsV0D5SpfYUA/Y5BSvf/ClpqslLgQ1diS8nJxl05u9RFW7W
	2SNKXmcyt8+MElyCz+964uoLuLpuyd9V2beQGQG22nmk6XuPcPvLmHtzgGSQAF9tJs4B2yHW+0c
	hfy565RihuHE8KUCA5cBHl/Yb4tICJcsFvJ9p9fyz1BBTPUnX30WrkDHqHj87ztldfs/OJ9RGHt
	xth3MfsNGY9g4n6GC9wOqzDFEivg7B6YnFq2nmN31lu12KolORUIveXpswrGexGiL+fFLVT4vnu
	Yywpu3GZxATZe7fAY5huSA+qHVj1SUdez7JOGZjlqw8tUZTmrPMMpJDvM+6nwAgsnMhyjDXggeG
	k1gLIDIs5dC6pX8FjvC1YqHAvgVJWcrPKDFyQQQ6ieB6Fslqs1UqRcgrUTRhywhoV8AiBoFjQnB
	EqXkdkxGCdLGj6LBytnp/T8r3kywvYbnanehXHTIu/AwKM/X7gpbmIg+tSTlMkShknptM4zbmkq
	hE=
X-Google-Smtp-Source: AGHT+IG1/BxPS8X03VpdE9sJ/Di0tvikrlORANkjofAu6+dJ3d+1fO4UuXIu0jYrxOESPwaJepQzkQ==
X-Received: by 2002:a05:600c:198f:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-47a8384cf91mr18823795e9.27.1765360553026;
        Wed, 10 Dec 2025 01:55:53 -0800 (PST)
Message-ID: <2341ab2f-f185-4bdb-b851-5a19a820b02e@suse.com>
Date: Wed, 10 Dec 2025 10:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] x86/mm: update log-dirty bitmap when manipulating
 P2M
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <d47d01dd-0289-370d-7b5e-bd80f9e0a911@suse.com> <aTlAnH7bei04azol@Mac.lan>
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
In-Reply-To: <aTlAnH7bei04azol@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 10:42, Roger Pau Monné wrote:
> On Tue, Apr 26, 2022 at 12:26:10PM +0200, Jan Beulich wrote:
>> Just like for PV guests MMU_MACHPHYS_UPDATE implies marking of the
>> respective page as dirty, additions to a HVM guest's P2M should do so.
>>
>> For HVM the opposite is also true: Pages being removed from the P2M are
>> no longer dirty at their prior GFN; there's no point in telling the tool
>> stack to try and copy that page, when this will fail anyway (until
>> perhaps a new page gets placed there). Introduce paging_mark_pfn_clean()
>> (intentionally without a paging_mark_clean() counterpart) to handle
>> this. Note that while there is an earlier call to set_gpfn_from_mfn() in
>> guest_physmap_add_entry(), but there's little reason to mark the page
>> clean there when later in the function it'll be marked dirty. This is
>> even more so given that at this point it's only the M2P that gets
>> updated, with the P2M still left unchanged.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -260,7 +260,7 @@ static int paging_log_dirty_disable(stru
>>  }
>>  
>>  /* Mark a page as dirty, with taking guest pfn as parameter */
>> -void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
>> +static void mark_pfn_dirty(struct domain *d, pfn_t pfn, bool dirty)
> 
> Nit: set_pfn_logdirty() or similar?  The function name makes it look like
> it's marking the pfn as dirty (when it's also used to clear it).
> 
> No strong opinion, it just seems to me the name is slightly confusing.

Changed. While making the change I noticed that I had one other change in
there for a possible v4. This is the extra hunk:

@@ -260,7 +260,7 @@ void paging_mark_pfn_dirty(struct domain
         return;
 
     /* Shared MFNs should NEVER be marked dirty */
-    BUG_ON(paging_mode_translate(d) && SHARED_M2P(pfn_x(pfn)));
+    BUG_ON(dirty && paging_mode_translate(d) && SHARED_M2P(pfn_x(pfn)));
 
     /*
      * Values with the MSB set denote MFNs that aren't really part of the

I hope that won't invalidate your R-b.

Jan

