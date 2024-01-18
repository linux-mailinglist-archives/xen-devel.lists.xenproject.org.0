Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F08831CAD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 16:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668821.1041295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUUL-000249-Rw; Thu, 18 Jan 2024 15:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668821.1041295; Thu, 18 Jan 2024 15:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUUL-00022W-P6; Thu, 18 Jan 2024 15:39:29 +0000
Received: by outflank-mailman (input) for mailman id 668821;
 Thu, 18 Jan 2024 15:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQUUK-00022Q-Il
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 15:39:28 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c32fe30e-b617-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 16:39:27 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e8f710d44so11446805e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 07:39:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b00337d97338b0sm5496wrm.76.2024.01.18.07.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 07:39:26 -0800 (PST)
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
X-Inumbo-ID: c32fe30e-b617-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705592366; x=1706197166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Bz1mb0Rxr3lhQdlQDcQzHRf2aTaQ9Nmj/7OW08xzSM=;
        b=NS1hhpwvA1Op32aZ66cX3fH+DBiLyEtkB7/+OKIHezZzkzY0xpA4Q8rUh+zBsXFB6s
         pqdm9HSC2xipQfWFJay55/RnG9FnSXF+JVX9N87mJtA7x+nesIcVmRIFiQvV+xNN0Gkx
         3yZv/YErEj9jZMwfeVokubP+KwWvmwjbYYGg1H+i3/z30j6n7IlBi8KtMacuyIp9wzu6
         IX/j56LJDpJeCbu6ZERCCsGAKGddt5phej+QIzmotDLIFSf68oZwWhsK3zdZrcXWb+4o
         ESh8xYOqTMc7QQMj/5Va2bN8tK8CREzg1nP0rxJIGZMIPWvyesxBFMMY/zfgXYS4hFd3
         jDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592366; x=1706197166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Bz1mb0Rxr3lhQdlQDcQzHRf2aTaQ9Nmj/7OW08xzSM=;
        b=tr3+qZejgCdB94JEIX7tVT5ey7/wdqya/TGZiJqmdg7Wu9JdsHXcyBdTuqHBc1vux6
         YqYhkgOmy39j82vC82wGzT9rGUl0bhQ8Wiafg1YiiNdz50bCuEzAmNDgcM22gxoZlXVr
         IPN3IOGJBwNvZ0Ih45X7n3iesHSa+9CRAH4YUSsmd1v6mRAGxEgSPlLxuy6N8gPz08BJ
         97xLa/qE8z21Kb/pj3Ks05w3VpWuEyflFjSHKOX6ua3fFHkK+ZRFTfHYOGBqqZsZAhp9
         9G9jD+T4nvvwfXME/MZPKsIk0d+Yv1/lCNDtHeDbd7P6pSwFnyQVAhKmj5qedq9cRhQr
         rydw==
X-Gm-Message-State: AOJu0YwQOpozhJwY7elmiggN8V3uI+sjTHR6W+aDtAbGBjl3a3voFyzT
	W7USvgisnq6B1J4bb1rvhf/EKUBNku082FUzRGeRlWnYPdCBdufBPfwGF1xwEg==
X-Google-Smtp-Source: AGHT+IGJkDa1lhZFvnmFcmKXF0E48bnuJC8a6vhHNMR+gMmxN9iJ+ce2BXll4adBSggezxubaDVaMg==
X-Received: by 2002:a7b:c5c6:0:b0:40e:4afe:12eb with SMTP id n6-20020a7bc5c6000000b0040e4afe12ebmr586348wmk.188.1705592366486;
        Thu, 18 Jan 2024 07:39:26 -0800 (PST)
Message-ID: <28f1adeb-849a-4c76-8aa1-438c49ecb4bf@suse.com>
Date: Thu, 18 Jan 2024 16:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
 <3fd4bafd-75f8-4352-bee2-1fa6dc64a9d5@xen.org>
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
In-Reply-To: <3fd4bafd-75f8-4352-bee2-1fa6dc64a9d5@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.01.2024 15:06, Julien Grall wrote:
> On 11/01/2024 07:31, Jan Beulich wrote:
>> There are exactly two handlers which care about the registers. Have
>> handle_keypress() make the pointer available via a per-CPU variable,
>> thus eliminating the need to pass it to all IRQ key handlers, making
>> sure that a console-invoked key's handling can still nest inside a
>> sysctl-invoked one's.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks. I had to drop this patch though in v2, doing things differently
to address a comment/request from Andrew.

Jan

