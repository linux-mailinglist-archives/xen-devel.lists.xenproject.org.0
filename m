Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6B804B48
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 08:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647435.1010553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQ3M-00027U-SW; Tue, 05 Dec 2023 07:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647435.1010553; Tue, 05 Dec 2023 07:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAQ3M-00024k-PR; Tue, 05 Dec 2023 07:41:12 +0000
Received: by outflank-mailman (input) for mailman id 647435;
 Tue, 05 Dec 2023 07:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAQ3L-00024e-0D
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 07:41:11 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7fc3b80-9341-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 08:41:09 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09d0b045so24411045e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 23:41:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b004064e3b94afsm21308607wms.4.2023.12.04.23.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 23:41:08 -0800 (PST)
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
X-Inumbo-ID: a7fc3b80-9341-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701762069; x=1702366869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7WxAKZQAgaTWVKUhYpVD8IpfnSvWa1qBDTj64N7VOtA=;
        b=S8vG8iaro5kX/qoZlXA3xSPuPh0X10heBRd6qEMTtKcJEqaK8r9lAqVlq76Ys/b5m0
         hX64FbVa6BO9ZJZvUdjaf3iaICMZ+7BZTw4429sSIojjyirkF241HNglVJ+oxk1YhS1a
         DGU6e0f7gtfLGSy3eQwA2u5zIKi32AtYDmrjyYWmEvWNSyL7EkUsouwxJHCqdeJ10D0R
         rI8SWaA9nITNewAOiZrT9NzLAblMsRL51fyqaPt60SxEJUcRYCKhySS31/XbUCpjb/oe
         EppzqmARhGeC9G35jAk0Yjojoc115yL1FQXHsd/GA7rOy2W7NE0gpzN5pKGdOpxq/Zec
         CvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762069; x=1702366869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WxAKZQAgaTWVKUhYpVD8IpfnSvWa1qBDTj64N7VOtA=;
        b=WJlsYeAYXyqw6tOf/cowlY7TaGumcaRijzL5O02sAx2nUxIxD3qfESVLfcy88UOpc/
         hH1NcfRzeLKPCKxCW/5J/G47SqZQs5FWFBnCWqYGAIrSpIAmK/8SiwV8SBI6pRlV2Pv6
         uopMHmWWn9RvNMUclacrqT2Ri02Q4qwB0NJb0N14zxJ6bACBUVVrRBvIedrU/g1UIIvP
         oTqMeNe8nil6b1joZ7J46myYLGUKJqHSdYhN3Sgyf3AGqigQigM2x3pj5ZAaF/f0jmKv
         wqDV8/k42MSh592i+ZN2Q5U6ep6uLYEDZGK7cZQoiLJ8LF9rmrik3DRUwPpWnpdpVYNf
         Ls1Q==
X-Gm-Message-State: AOJu0Yydu72XK6pDcZFSMzG7L0zhGWUksE6r6DHlJTneOQx55x/Vb3No
	Etwqw7yiIXuXgGljPCfll/rt
X-Google-Smtp-Source: AGHT+IGDqOX1TzNDG6qND3b8PII9E9GJhJQHy07GYTjYNCXNkNBNBi7lWDRwXhMgUie80GYRJxdJlA==
X-Received: by 2002:a05:600c:4fcb:b0:40b:5e21:c5b5 with SMTP id o11-20020a05600c4fcb00b0040b5e21c5b5mr136954wmq.131.1701762069141;
        Mon, 04 Dec 2023 23:41:09 -0800 (PST)
Message-ID: <b5de9652-c421-4236-90d6-3d166a006e0c@suse.com>
Date: Tue, 5 Dec 2023 08:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231201184728.31766-1-julien@xen.org>
 <0e20592b-9800-4b9d-9f2f-a996f9ac00bd@xen.org>
 <cfaf75cf-f658-4df0-b654-f1c3af279b15@suse.com>
 <f40d6838-9a82-48cd-9a6b-a298c281f8cf@xen.org>
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
In-Reply-To: <f40d6838-9a82-48cd-9a6b-a298c281f8cf@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 20:05, Julien Grall wrote:
> On 04/12/2023 09:39, Jan Beulich wrote:
>> On 01.12.2023 19:49, Julien Grall wrote:
>>> +Naming convention
>>> +-----------------
>>> +
>>> +'-' should be used to separate words in commandline options and filenames.
>>> +E.g. timer-works.
>>> +
>>> +Note that some of the options and filenames are using '_'. This is now
>>> +deprecated.
>>
>> I certainly appreciate and second the intent, yet I'm afraid "Naming convention"
>> in the doc would (to me at least) first and foremost talk about identifiers used
>> in the various source files. If this really is to be about only file names and
>> command line options, then I think the heading would better say so. Alternatively
>> a clear indication would want adding that text about identifiers is supposed to
>> be here, but is yet to be written. (The text itself, for the intended purpose, > reads fine to me, fwiw.)
> 
> Right now, I don't have any plan to document the naming convention for 
> identifiers. In fact, I don't know if we have one...
> 
> So how about renaming the section to:
> 
> "Naming convention for files and comand line options"

That would be fine with me (with - nit - "command"). Then
Acked-by: Jan Beulich <jbeulich@suse.com>


Jan

