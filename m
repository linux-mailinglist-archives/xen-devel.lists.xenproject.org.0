Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05C971B89
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 15:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794540.1203525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snekO-0004QX-8d; Mon, 09 Sep 2024 13:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794540.1203525; Mon, 09 Sep 2024 13:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snekO-0004Og-4I; Mon, 09 Sep 2024 13:48:04 +0000
Received: by outflank-mailman (input) for mailman id 794540;
 Mon, 09 Sep 2024 13:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snekM-0002VR-Tf
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 13:48:02 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21b9a6bd-6eb2-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 15:48:02 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so8234141a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 06:48:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46819sm2999819a12.31.2024.09.09.06.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:48:01 -0700 (PDT)
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
X-Inumbo-ID: 21b9a6bd-6eb2-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725889682; x=1726494482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZmHaEvF+3wqCx1Rspp6LJ+p2eHSWh8pO2gvAyds4uk=;
        b=DqSLJmb1xIw4ifBsLIzfC8FaYrmOooK61NmwMxs5cTlG4tDrv4amD6z8nWk0mG8+5E
         Iw3to2YQx2GnlaQg7UDm+ppCnE+lmJqof3iRav7gxBMG7f9s2FW4+ULU1cDMnQizVzta
         ewXn9rQNqvG/AzMtB4vRsM9hymPmg5FnfjjZ/o3Q83Nc4qxGey7PqebLTHINpjKs7Ci/
         Mmjh3NchB7f692dYSM0hFxUwcYVfJ6LU/mruGJlqnei9riN3CEIvQZoURSiTDiFMDT2O
         kGQcRBIgsT9wI4gssghJbkvqRhr7t3u0nos1xyN8YE5v2jgRJZ9BsyHANI3HqY2ytGih
         Hr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889682; x=1726494482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZmHaEvF+3wqCx1Rspp6LJ+p2eHSWh8pO2gvAyds4uk=;
        b=lSl3hI1H08A7dUj5RJ9G7xGtazT2R0AMPfg8xl6AwNkW5P/BLSmSqbD1yz96xEw5dK
         eeNy/g9Lmu6uuhgL3Q/AjnD0qYOtrykZ4CnpN1ccZ/5bJcfZbOCFQUeLOxoscyWwocw3
         c/wOSuOKawIqMyv3piup+IQ92l/M+9yNB+MIXg9VDNDQNSIngJeyuHSgQDTLkl3QzCM8
         RcgJLxOKzarlV8FUh744jsCVsG+bCcUOzuAQfmRen3+tj3STQZSuuuTNibJFd9DLQKgc
         9QYpxiCEtNNaX+/OgmLh6Ov4WhsotwJFMFtPwekmZvLw/L3Enhn1c5kExEOi4vEZCXsU
         H6CA==
X-Gm-Message-State: AOJu0YxgGBVr/elCoXixHYWjGgxqo28airZjDvj/VCf9RsZz3QutqstZ
	N9Oa8XvvL3WaXabJcfyqW3OwHLk6wfCmTMvNgJLivgYTy9MjSX3//pKnen5o3Q==
X-Google-Smtp-Source: AGHT+IHtF6c3D1Ja2fPdJ1uyPMA35NhH87ngUtrth76n9+oIESFTLDoc2XOFvGwpmvj98Wq0sh0Omg==
X-Received: by 2002:a05:6402:4020:b0:5c2:751c:64ef with SMTP id 4fb4d7f45d1cf-5c3dbcc037fmr11818043a12.13.1725889681560;
        Mon, 09 Sep 2024 06:48:01 -0700 (PDT)
Message-ID: <ef819387-1523-42a1-b80a-24b9a6a337fb@suse.com>
Date: Mon, 9 Sep 2024 15:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/mm address violations of MISRA C:2012 Rule 5.3
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
References: <201625791b87a4ab20e6fb38642ed64f88ce8b2d.1725888742.git.alessandro.zucchelli@bugseng.com>
 <CACHz=Zj8wu9Rm5H-OqYTSys3-zij64uEB9M5iAsfL8=-eFXDVQ@mail.gmail.com>
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
In-Reply-To: <CACHz=Zj8wu9Rm5H-OqYTSys3-zij64uEB9M5iAsfL8=-eFXDVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 15:46, Frediano Ziglio wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -4708,7 +4708,7 @@ long arch_memory_op(unsigned long cmd,
>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>      {
>>          struct xen_foreign_memory_map fmap;
>>          struct domain *d;
>> -        struct e820entry *e820;
>> +        struct e820entry *e;
>>
> 
> Couldn't we use a more meaningful name, like e820entries?

No excessively long names please.

Jan

