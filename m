Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D583BA893B4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951929.1347540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZWx-0003Wx-7m; Tue, 15 Apr 2025 06:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951929.1347540; Tue, 15 Apr 2025 06:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZWx-0003U8-4S; Tue, 15 Apr 2025 06:12:23 +0000
Received: by outflank-mailman (input) for mailman id 951929;
 Tue, 15 Apr 2025 06:12:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ZWw-0003U2-66
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:12:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97454d33-19c0-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 08:12:21 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so2882947f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:12:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9640fdsm12996679f8f.7.2025.04.14.23.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:12:20 -0700 (PDT)
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
X-Inumbo-ID: 97454d33-19c0-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744697540; x=1745302340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cazy3gUj8mUNe484tHWK7n2hEwkLXx1amQlFPBuKfaY=;
        b=L3p0jRxcs2w67cQtP8tV5XAK0ER4H4yHhID6Y5RlRl6s98FB9/Vv2eByah++6SHxXG
         i7RvwcfL53VPw/YTU2U/zJSVj4kGz8RYaD2id5V6Tvnhno2165yrzhdvb8pT28XUo4ft
         aS2jMoSD5c25AUlSss+Hue5XV+dZXlSKVXyzvHFsvI2v9iUlCgYUNSQftB2AqJsqwkxc
         /ofwQdW8Ays99EzL8S8+qFu6ARaYeIk3TJnLOarbm52iIs3bzlHvAunE1v7zt0FPKqi3
         6VvkJDaErDl2MVjoHTDK6NmfIi5Jb178RqRmHZavKN5f95+L/RSuCZgxJTfpyjmkEulG
         r67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744697540; x=1745302340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cazy3gUj8mUNe484tHWK7n2hEwkLXx1amQlFPBuKfaY=;
        b=m/2A/BXwR9ZrCuL2pRMv7ou4eQQMsnYvEZuorCyPRVD4Yx7JzrGAMKX2noIZx7OrzA
         ICFNbi5QRDXY0S3t1Cqn6EBNhW5BTCeqjV0NmMFBOJ8sULv7Kkz2trkg4sQEAeDQy4Yg
         g6BslEui9KZGcmKviQiGOyXtaWpa1TM2uRxVZF9h6+cyldtYFHgNhz5FNNFdYG9wgiCi
         179F3AiN5B+K1zDY3fljrciJJ/RLNqc05YGsluKp3vhl6r1gvN5yekeHRxJlYhNe1sOt
         8nAZLyBpx4hgs1T36lwSW0wxdiiDRn/+aO290Fp/4RgLqV+sGD7Wm1WwwEYynPfeaNeu
         H8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVGWkjl9TzvxEwVnR/YWBxEdBvCT1Kz7zcZ613ApL00bcaeSsA8rvryEqW3hMXNPXC4UWQ3UDCsk0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+c1Nqrub6Uj3eemWFir0EFGnmOJn2X56Ip0Wyv32OuIxExOCu
	cFNNSWNOa+D7HvsdHxNgptXxg/I/urlSRCMQvUXUJzQ1AePBypzhZdKGUBjdYA==
X-Gm-Gg: ASbGncsZEQHnTd2is0lA7P6xU5p5mhbUn9/TiyKc0RzKbz889ODriP07p5mJYuyGCKy
	iRl+oQAtB6776dmsGRQi8zN7Z7Ec5giHxzCgsj3KF5LWYwoDPDynjnomPqULBDSa1pybVs1y50F
	3IBimVUqMqhZw8FpuR/u6AfeYFxTzk2ilXp+dAYCTIMpdZLldaYvOIcFfeh1FCNaTOpyREvgvuW
	hZLdOGfUhr3sbtPxSp2mFSqhF6/jK7MDpszSo0pFCzRx04sjX/zgDLsBcDdzUOFHVYXM5gD77sd
	RUKI5F4d1Laxar95HRf4nFR38dKQ/gCHmsRhHFQVKZP7fc43/b71u1A2u9NA8gwFrnTLSzjOme+
	mJ3agWAZyljnEV/yIBhypFlUexA==
X-Google-Smtp-Source: AGHT+IEmVw30DPuFhCvXtESIWOqd/amnBn/49z+OtHDROXXOe4HMBlZ9MHO8BUpE53YG8Z63/oyXqQ==
X-Received: by 2002:a5d:64c8:0:b0:390:f738:246b with SMTP id ffacd0b85a97d-39ea51f58f3mr11563877f8f.15.1744697540677;
        Mon, 14 Apr 2025 23:12:20 -0700 (PDT)
Message-ID: <93e8be80-ed6b-48ef-8e14-e8ae880b5cf7@suse.com>
Date: Tue, 15 Apr 2025 08:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
 <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com>
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
In-Reply-To: <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 19:06, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 12:34 PM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>> @@ -195,6 +195,35 @@ static int __init process_domain_node(
>>>                   !((char *)__va(bd->kernel->cmdline_pa))[0] )
>>>                  bd->kernel->fdt_cmdline = fdt_get_prop_offset(
>>>                      fdt, node, "bootargs", &bd->kernel->cmdline_pa);
>>> +
>>> +            continue;
>>
>> With this ...
>>
>>> +        }
>>> +        else if ( fdt_node_check_compatible(fdt, node,
>>
>> ... no need for "else" here?
> 
> Sure
> 
>>
>>> +                                            "multiboot,ramdisk") == 0 )
>>> +        {
>>> +            int idx;
>>> +
>>> +            if ( bd->module )
>>> +            {
>>> +                printk(XENLOG_ERR "Duplicate ramdisk module for domain %s)\n",

For context below, note this message.

>>> +                       name);
>>> +                continue;
>>> +            }
>>> +
>>> +            idx = fdt_read_multiboot_module(fdt, node, address_cells,
>>> +                                            size_cells,bi);
>>> +            if ( idx < 0 )
>>> +            {
>>> +                printk("  failed processing ramdisk module for domain %s\n",
>>> +                       name);
>>> +                return -EINVAL;
>>> +            }
>>
>> Along the lines of what Denis has said - please be consistent about log
>> messages: XENLOG_* or not, preferably no capital at the start, initial
>> blank padding. May apply elsewhere in the series as well.
> 
> I don't mind dropping that and making everything flat (uppercase + no
> padding), but there is some consistency. Albeit, it is true the
> rationale is somewhat obscure.

Obscure or not - it might be fine if stated that way sufficiently
prominently, such that future additions here then will adhere to that
model.

> ATM the consistency is: "padding spaces + lowercase" when giving extra
> information on hyperlaunch. It ends up creating a hyperlaunch block in
> `dmesg` with a "Hyperlaunch detected" line on top so it's easier to
> know what lines are hyperlaunch related and which ones aren't.
> 
> Do you have a preference for a specific reporting style?

XENLOG_* or not want to be consistent, no matter what. Generally I think
that log messages shouldn't start with capitals, unless it's e.g. an
acronym. The padding to help grouping would be fine with me if, as said,
properly spelled as the scheme to use.

Jan

