Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1580697F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648973.1013125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAn5a-0001pb-Bh; Wed, 06 Dec 2023 08:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648973.1013125; Wed, 06 Dec 2023 08:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAn5a-0001mL-7n; Wed, 06 Dec 2023 08:17:02 +0000
Received: by outflank-mailman (input) for mailman id 648973;
 Wed, 06 Dec 2023 08:17:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAn5Y-0001ls-D3
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:17:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d28af3cd-940f-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 09:16:57 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso44704405e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:16:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b00406408dc788sm24722408wmo.44.2023.12.06.00.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:16:57 -0800 (PST)
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
X-Inumbo-ID: d28af3cd-940f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701850617; x=1702455417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IS2NIFF20MdsmJ4P4D6nHB/F14y4z6qF1Zqlz/EUFF0=;
        b=ME54wuwXfVNRPRUE0cTIwXjlJ52XddsajvjBbmcH86xAZdfZdxtyaEBXxCpWE9pQwd
         bVPwvG/bGRkRj/WwRyVh/kXYkUPy9IeL1TZPLr+CsGm+pZF76I65UKFJCDRu/wtmyp/b
         9HpilvekoUCpSOwEH7WKs24GAl5wYdT37UUEejWtdSH4USB2qYW6j1ZzZWm+ArC7cFcn
         Ulx+ZVVzqkiPcS70XqJ059VLUBAPYezyH1y82YVmPXEOqxnCjbRWG9vFiC8Zy8YmaSw9
         +xOg8hkUrrbn1Kkc6rdXhsouswALgcrYyr4oNSxB15rBdORqyJ8b4j51hsTY18tgXe4J
         cKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850617; x=1702455417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IS2NIFF20MdsmJ4P4D6nHB/F14y4z6qF1Zqlz/EUFF0=;
        b=L5CS3IL6z/OYTroD3sOPd/BCsFC1XX+oBlWJfPOllUQ/3js5NmJAbjtdN6+0pJiqm7
         EnDFyKhkHnp4/0yXAw0YVjuiOd9fV5xLHBKah0RbAGYuDJoY737yErcGitUTHoUBKGQD
         QCWYnoTAfFJ4R9gucz/Nbt8aZ+MMAEYnri1+lKXchuqIH1wokNUUr3hvBoQdAyaFjFgl
         IDUqw7MKN++j+qYIVj3Yrd80gGM8KmuVwMxxM0fcPrKRr2szB8xXPC0u6sVYheVed8zd
         LoPnCg0Wx2NvhCMKg05F+qijBAn3m0BP0m4IlqQDO0tnrmkQWlU98Xi9hlfZgioW7o+/
         CE+A==
X-Gm-Message-State: AOJu0Yz8TouRMwziA2nD3/9EnOy1vijnZ6shOdoxHJ7kh5MdxDWGGYnH
	xj0usi3t6wwh1JMEFL0Ru2jw
X-Google-Smtp-Source: AGHT+IE90nHlxrIWL/TOAgNLWaipK84uMmwzPW2bEVxlWjQBK0u4JSof0kBURH8lVb17S5fmPA7Gmg==
X-Received: by 2002:a05:600c:4586:b0:40b:5e59:cc9f with SMTP id r6-20020a05600c458600b0040b5e59cc9fmr370382wmo.128.1701850617390;
        Wed, 06 Dec 2023 00:16:57 -0800 (PST)
Message-ID: <96f31a47-ee5f-41ae-976a-35663d5b51b6@suse.com>
Date: Wed, 6 Dec 2023 09:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/6] AMD/IOMMU: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
 <c529cb0d8eba253436c5bba22f8bceddeaaf5831.1701764980.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312051913190.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051913190.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:15, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Federico Serafini wrote:
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -138,10 +138,12 @@ struct ivrs_mappings {
>>  extern unsigned int ivrs_bdf_entries;
>>  extern u8 ivhd_type;
>>  
>> -struct ivrs_mappings *get_ivrs_mappings(u16 seg);
>> -int iterate_ivrs_mappings(int (*)(u16 seg, struct ivrs_mappings *));
>> -int iterate_ivrs_entries(int (*)(const struct amd_iommu *,
>> -                                 struct ivrs_mappings *, uint16_t));
>> +struct ivrs_mappings *get_ivrs_mappings(uint16_t seg);
>> +int iterate_ivrs_mappings(int (*handler)(uint16_t seg,
>> +                                         struct ivrs_mappings *map));
>> +int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *iommu,
>> +                                        struct ivrs_mappings *map,
>> +                                        uint16_t bdf));

(Note this for the comment near the end.)

>> @@ -361,14 +362,15 @@ static int iommu_read_log(struct amd_iommu *iommu,
>>  
>>   out:
>>      spin_unlock(&log->lock);
>> -   
>> +
>>      return 0;
>>  }
>>  
>>  /* reset event log or ppr log when overflow */
>>  static void iommu_reset_log(struct amd_iommu *iommu,
>>                              struct ring_buffer *log,
>> -                            void (*ctrl_func)(struct amd_iommu *iommu, bool))
>> +                            void (*ctrl_func)(struct amd_iommu *iommu,
>> +                                              bool iommu_control))
> 
> instead of iommu_control it should be iommu_enable ?

What purpose would "iommu_" serve? It would be actively confusing, for
colliding with the same-name global we have. Both functions passed here
use simply "enable".

>> @@ -1158,14 +1160,15 @@ static void __init amd_iommu_init_cleanup(void)
>>      iommuv2_enabled = 0;
>>  }
>>  
>> -struct ivrs_mappings *get_ivrs_mappings(u16 seg)
>> +struct ivrs_mappings *get_ivrs_mappings(uint16_t seg)
>>  {
>>      return radix_tree_lookup(&ivrs_maps, seg);
>>  }
>>  
>> -int iterate_ivrs_mappings(int (*handler)(u16 seg, struct ivrs_mappings *))
>> +int iterate_ivrs_mappings(int (*handler)(uint16_t seg,
>> +                                         struct ivrs_mappings *map))
> 
> Instead of map it should be ivrs_mappings ? Actually it reads better as
> map and I know it is not a MISRA requirement to have function pointer
> args match. I'll leave this one to Jan.

The name is entirely meaningless here (i.e. not helping with anything),
so imo "map" is not only fine but also (see above) consistent with other
code.

Jan

