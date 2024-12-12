Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F639EE43E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:35:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855703.1268539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgXB-0006tO-GX; Thu, 12 Dec 2024 10:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855703.1268539; Thu, 12 Dec 2024 10:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgXB-0006qr-DC; Thu, 12 Dec 2024 10:35:05 +0000
Received: by outflank-mailman (input) for mailman id 855703;
 Thu, 12 Dec 2024 10:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLgXA-0006ql-4A
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:35:04 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bee8d263-b874-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 11:35:03 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa67333f7d2so61728166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:35:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa68ef79bcdsm528053566b.205.2024.12.12.02.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:35:02 -0800 (PST)
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
X-Inumbo-ID: bee8d263-b874-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733999703; x=1734604503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DJumWVxw0xvXsyApHorOyLcvrgYJJTcjbrkIuT/FZyc=;
        b=d8Ae7zcJFc1FNhOR//axp8GUEhYOUUppLtdy21HVsX2xYiHTWsv83c+bE8VaaolppP
         lzDOI8QQ2gvpDXpyP9Nfmurcl+9+DxvOCN3ZxzAp3ybX+xTqwwKJZw6a/7W5i0X7/hki
         CNKEu7t9KR8RKIi2kx/X61VyH6b7jtUNEN9+D/z6kHhNxCYdP6TUCFQ1Ge4zgm8jLdcd
         cKlFr6IT42vkHFCd5FZHyrnOO8CDqck0G0ryMDInlWVidMRQs+DURikkCMGfFgfGA3i4
         zFTPYcH3ugYdOivMUHisUgZ63zeM3E1JrpRrtOuXLQcEzcR84ca8c8SC7NhyAwqWpNF+
         kuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999703; x=1734604503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJumWVxw0xvXsyApHorOyLcvrgYJJTcjbrkIuT/FZyc=;
        b=QM6ir/Gc8a7oWQnUqJdyB3C8qchlSu+nqEZpHnpdmnFSq0P80WrRGolWnx6F+gJmck
         a6+J1jcx6ZqDi5iUG/cDDXSmGDh5shlaJpIivUaAFyfEaXv3ZbuXstb+Np/prMkG25Ft
         Y74m1DKIn81Bf3oZdESiPsKNhGo7kQAQdLDGr1FpZ8elQO1bTTPwJGqxUJ8IZj1XyfWr
         J5/DJsWwunu2yE3jlB2iY2kfVzG1CGNbNr4ZIIytUtQ0RgFYX7iHhwxJzCZOm97MJwhQ
         AIzegFXrLA1w3ewo1eQv25afWb2CBedcW0v1OTYTEWFSAhR4OounQ0fpKti3jbi8RLnb
         p/RA==
X-Forwarded-Encrypted: i=1; AJvYcCXfhs/Q+jHRB3+jeI5Vkgf3gyKeeZGX0opacD8n4b4lwx4Kt1EIaWUjanS9H5hjst+nC/YGh83t4lk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu22Zb2xUXdEU4TxtwGgwQFEK/zFVxjKWVHg6c6tQpdo6rapcL
	gIGAdzC69lYz5PUjASq9MfIwlxVQ/ICjNfuBd9ngY3+diwdM5bBnatf/OYn03w==
X-Gm-Gg: ASbGncvcEFontafP7yV8VqxmTp10R+ucBTDyxjsPERtkDYBOjoSxm5rJm1m9pY1ahM1
	G/4pfWMZOhaGmSluPyANCnHo1EjPW5d32QMPdqbKU0bkJ+e/rdZBZwjumI1KyGPCirvA5JuZMOb
	4tbSdHq0Xs7+rUyucPM4/nwU2G7AOL66GktSyqlZrQF9ZOg0h3L9JQAgfNvXUEK3OV5ecTxKbuB
	NIfe7aGlQvzzCKsJnzAZndv7RVARZ2n2wADwCc/dG6YQqW4tG18sYUvhZ+oDrq8ZlZp3xZIzDoy
	lN8C+uOOKetOIXazuqy16pplL3nRB5KCaMQ8nIjsPw==
X-Google-Smtp-Source: AGHT+IHKB23+dBx0gLcsp6nP+GxrAFs42YNvfmKY0xoqrBaaSV4aizIXIpxCXUvB/m0j7LhPtCpc+g==
X-Received: by 2002:a17:906:318d:b0:aa6:8bb4:5035 with SMTP id a640c23a62f3a-aa6b11ed581mr596948766b.31.1733999702675;
        Thu, 12 Dec 2024 02:35:02 -0800 (PST)
Message-ID: <032d2e7b-7828-4a7f-a2d2-c2df46831507@suse.com>
Date: Thu, 12 Dec 2024 11:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule R11.1.
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <8db58416ce215a3c5fdba8074dc21f32116e8a41.1733915076.git.alessandro.zucchelli@bugseng.com>
 <e413574c-f7ab-428c-a95c-30a73c0f30c8@suse.com>
 <alpine.DEB.2.22.394.2412111827540.463523@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2412111827540.463523@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2024 03:29, Stefano Stabellini wrote:
> On Wed, 11 Dec 2024, Jan Beulich wrote:
>> On 11.12.2024 12:05, Alessandro Zucchelli wrote:
>>> Rule 11.1 states as following: "Conversions shall not be performed
>>> between a pointer to a function and any other type".
>>>
>>> In "xen/common/bug.c", in order to get additional debug information,
>>> pointer "bug_fn_t *fn" in the data section is converted to a function
>>> pointer, which is then used to get such information.
>>
>> If the pointer converted pointed into the data section, it would fault
>> upon being used to call what it points to, for the lack of execute
>> permissions there.
>>
>> The change itself looks okay to me, but the description imo needs
>> updating, to be as precise as possible.
> 
> 
> What about:
> 
> In "xen/common/bug.c", in order to get additional debug information,
> pointer "bug_fn_t *fn" is converted to a function pointer, which is then
> used to get such information.
> 
> ?

This may do; I, however, was rather hoping for the description to be
extended rather than shrunk. E.g. '..., pointer "bug_fn_t *fn", obtained
by arithmetic on a pointer originating in the data section, is converted
to a function pointer, ...'

Jan

