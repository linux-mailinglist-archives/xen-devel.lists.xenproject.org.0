Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8D8A9596
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708132.1106747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNg9-0002AD-Ks; Thu, 18 Apr 2024 09:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708132.1106747; Thu, 18 Apr 2024 09:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNg9-00026j-ID; Thu, 18 Apr 2024 09:03:37 +0000
Received: by outflank-mailman (input) for mailman id 708132;
 Thu, 18 Apr 2024 09:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNg7-000255-W6
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:03:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88b5e902-fd62-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 11:03:33 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-418e4cd1fecso3106675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:03:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c468600b00418accde252sm1963488wmo.30.2024.04.18.02.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:03:33 -0700 (PDT)
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
X-Inumbo-ID: 88b5e902-fd62-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713431013; x=1714035813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h67MkTp4n4uwUyqgd8d56K83qDhvt02GpXNo1Uh8nHI=;
        b=SYVt+RrEXbtr7MFCdZ2n28/hyJl28z4DVgWbVIQf461Y4sdo2B31GzmqOupck3XuVT
         FWDMoYJPbHhWOAD9VXcNMmYDIsUcq0vir/06uNUaFy7UFDtTk4XlrmGMsErPvHKPhiTy
         i2TzPNA3RFdMFJjHb+Fsa/3YQ9ze1FR6qf3ARyKOYXneHDaorGTTn9aPL6yukpcqhI+n
         CRls/xSmHo7x5hOQZHlENTa87zjW6pyhPo2x2OBj6bHCweYA0F9ls9NLZpiTIHL+3Jj5
         Z0BEKO+HI+RdJQsVjOSH5hDozFfftqJho55Z88Zc7Gqys21RYiVjJ7XwezxwuDq0O++b
         9HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713431013; x=1714035813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h67MkTp4n4uwUyqgd8d56K83qDhvt02GpXNo1Uh8nHI=;
        b=wr9dPsWzHykXxDIvo4Xwkpfp1PvOxaNbaHoV5ZFM0z7sVQGGv8n15xYpYHkgNoZ11O
         b454JLEO/2btDejHIXuhX+dM+jtDiFKYMPJVPEwNrqH32fYL0NVbfUyWIdNxfdY0E/aj
         hgzArdTw4Y2bYVb6+T5ajVanZvuDUGN0eAqcpsVnmnP7tx2ML/DDtwOxyy3gKRMMJZ2g
         Tk0xh23rTWePaWSvJkVkSYotsIjYe94s0sdCZEBFeWUyL/7/Ao5wHLa/mHvJakHNc48X
         Fqu+rkPaGm9ond/zT3xm5GQIbsYQr+GzY25vhg0CLC2UNDu+yeu8rpF7sa63ammlH4O4
         4N5w==
X-Gm-Message-State: AOJu0YwGFoLJR7Un+EbtKnfOLG4+aB6xdBQvy000GBCVO2b5jRxYq/y3
	VJbv2CEgZUtGROyn4FiK9LR3vobA5tHefSLBqQC0MhzHufZq1atyA+6CCDagjw==
X-Google-Smtp-Source: AGHT+IEjm4Ae90jh80hDN54FKqG9SIHFv78PIWVrM2+PPhrHSKAikudA/sAheOKtPCzWJsk/Z4mvdA==
X-Received: by 2002:a05:600c:19c6:b0:418:dc26:1b61 with SMTP id u6-20020a05600c19c600b00418dc261b61mr1130724wmq.20.1713431013432;
        Thu, 18 Apr 2024 02:03:33 -0700 (PDT)
Message-ID: <ab27c255-fa41-42ea-85f2-5e8e7107b8ed@suse.com>
Date: Thu, 18 Apr 2024 11:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/gnttab: Perform compat/native gnttab_query_size
 check
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2404151453400.997881@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404151453400.997881@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2024 23:54, Stefano Stabellini wrote:
> On Mon, 15 Apr 2024, Andrew Cooper wrote:
>> This subop appears to have been missed from the compat checks.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> ---
>>  xen/common/compat/grant_table.c | 4 ++++
>>  xen/include/xlat.lst            | 1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
>> index af98eade17c9..8a754055576b 100644
>> --- a/xen/common/compat/grant_table.c
>> +++ b/xen/common/compat/grant_table.c
>> @@ -30,6 +30,10 @@ CHECK_gnttab_unmap_grant_ref;
>>  CHECK_gnttab_unmap_and_replace;
>>  #undef xen_gnttab_unmap_and_replace
>>  
>> +#define xen_gnttab_query_size gnttab_query_size
>> +CHECK_gnttab_query_size;
>> +#undef xen_gnttab_query_size
>> +
>>  DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
>>  DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
>>  DEFINE_XEN_GUEST_HANDLE(gnttab_copy_compat_t);
>> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
>> index b3befd9cc113..53a1bdfc533f 100644
>> --- a/xen/include/xlat.lst
>> +++ b/xen/include/xlat.lst
>> @@ -88,6 +88,7 @@
>>  !	gnttab_get_status_frames	grant_table.h
>>  ?	gnttab_get_version		grant_table.h
>>  ?	gnttab_map_grant_ref		grant_table.h
>> +?	gnttab_query_size		grant_table.h
>>  ?	gnttab_set_version		grant_table.h
>>  !	gnttab_setup_table		grant_table.h
>>  ?	gnttab_swap_grant_ref		grant_table.h
>  
> 
> I am no compat layer expert, but shouldn't there be something like:
> 
> #ifndef CHECK_gnttab_map_grant_ref
>     CASE(map_grant_ref);
> #endif
> 
> somewhere under compat_grant_table_op ?

It's there first in the group of similar constructs. Or do you mean a
counterpart thereof for query_size?

Jan

