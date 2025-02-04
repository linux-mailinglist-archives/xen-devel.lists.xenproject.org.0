Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08982A26CCC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 08:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881121.1291239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfDcm-00069W-A6; Tue, 04 Feb 2025 07:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881121.1291239; Tue, 04 Feb 2025 07:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfDcm-000683-7L; Tue, 04 Feb 2025 07:45:36 +0000
Received: by outflank-mailman (input) for mailman id 881121;
 Tue, 04 Feb 2025 07:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfDcl-00067x-0M
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 07:45:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03c29072-e2cc-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 08:45:33 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so870175966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 23:45:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7e7asm878541966b.18.2025.02.03.23.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 23:45:32 -0800 (PST)
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
X-Inumbo-ID: 03c29072-e2cc-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738655133; x=1739259933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=48ZaHs3MxBou4JQGvZEx0TjL5g5JaaYlhsocOO+18o0=;
        b=VicVteBsdynl4hNn6V1REy+RqJ6X3QJWyNYfphSgxp7XJemRfLUEGQ1k25CQnj8brm
         Gz+2UOJmjVyuvkJj/OYV9BLjLTGCud3kLpCG9USpxb9LrCmQGzHzasIy8uniLFoEA2/u
         6fzzJIzDsUQLH8UFiUDdweTy7/W+qs7Cv9kdpnXxJlxdkaA7bqy3L+C+QnP5MrBiGXzp
         T4o9NYoxV9T4/fDDJzgAo6vAPw363GznlJmGiRV6nodv4Om3B4qro4dY9VGjmMJzLS6s
         pZQFWH2EtICW3ngD23rYe+RlD0ErOuXXhz4KsnXeOxyrCKGtjnEz5rKia68r80He7Mhk
         br0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655133; x=1739259933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48ZaHs3MxBou4JQGvZEx0TjL5g5JaaYlhsocOO+18o0=;
        b=h8ncArXv9yA0eZEHV1pNLeD9+3R77sw7NaGP7SybZTSbNpF0Wi9nL5Km9k5K7kvOOj
         vWDTnw+Lk7eUrd5EGEFuHqyKlHs+C9nqGCNanfaGQAbO0xsGQAeP1DGYFrQ/Utphvg4j
         SYZVIV4lSmRWWvkQmN8XlDZbGYgR45Wepu6Oag5N8FfP8m/gH5yXlq66kYPRGCFfhqDG
         B11nd+AGMByPWPpC2VTMDyqZHZ3Ztyq86P8RnjLax42uz+wBuJ2ytzydBkIkJIKCjjjv
         VNpqXXuPE0wU/HzlvhL8TqJE8AT1nVg60MATAyELqC0i/LdSlGHwwi6JzjCxF9ndWEYK
         oKdw==
X-Gm-Message-State: AOJu0Yx0TifK0ReluZunWSm3Ms5b4QY8Tm/EnIQ3Kdyr1pox/Y5zC0ol
	GxhB5RTDWMEx8I7US3anNsSYbf4daaMau17MSCueEjkI7abvIhlKE/A4NIkwgg==
X-Gm-Gg: ASbGncucIhk7paw6M2ERkstpeVLqNP6ER1bUk62Dn3+bOIDlH1I6O5Ej3mrINRKBETw
	2PDXQEWcjg2vOPRDjRmgA5q1hpGFgQx1fzprqIO12DDmVnyJeIk5LUj/tJ2ge0QxK4dVWuI6q6j
	Ve1dDG5XyR3RBZVFAuf0QCSjIPFrlg1lZnhswPAo1w1Xo6wm5TaXloyKFSPAHFKIWNAWPF7mkW+
	CG+2k6fZUHalxEU7y1oVYXo2bU/NjMr8MxjWFx3/kQOQ6cMfgUbRyh2kLDZlpwJuIrWUWWLAlyj
	c/WAzUyUy2hIp/kKtsiqpi9x+Q7roSO9K0mhj22I85UdAcJ6JP3yJMhrwxajNmSlfSmNcjbX9yI
	w
X-Google-Smtp-Source: AGHT+IGiot5h1oBBEDULS6ZlMQvnY5ANL7bKtNDZJzSpivk3mIsje/1b60XagGIcVAh+R2DnnNWgjA==
X-Received: by 2002:a17:906:4a4a:b0:ab6:d9f7:fd72 with SMTP id a640c23a62f3a-ab6d9f837eemr2259104466b.50.1738655133160;
        Mon, 03 Feb 2025 23:45:33 -0800 (PST)
Message-ID: <8b0d0446-04d9-4aab-8ede-d12f3442ac1b@suse.com>
Date: Tue, 4 Feb 2025 08:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
 <Z6D6c69hJrxUdnJG@macbook.local>
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
In-Reply-To: <Z6D6c69hJrxUdnJG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 18:18, Roger Pau Monné wrote:
> On Mon, Feb 03, 2025 at 05:27:24PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>> @@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
>>  {
>>      bool valid = true;
>>  
>> +    if ( pci_add_segment(0) )
>> +        panic("Could not initialize PCI segment 0\n");
> 
> Do you still need the pci_add_segment() call here?
> 
> pci_add_device() will already add the segments as required, and
> acpi_parse_mcfg() does also add the segments described in the MCFG.

Well, in principle you're right. It's more the action in case of
failure that makes me want to keep it: We won't fare very well on
about every system if we can't register segment 0.

Jan


