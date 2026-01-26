Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INcOJ04+d2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:13:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8586807
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:13:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213489.1523956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJat-0001Uq-QW; Mon, 26 Jan 2026 10:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213489.1523956; Mon, 26 Jan 2026 10:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJat-0001SX-No; Mon, 26 Jan 2026 10:13:15 +0000
Received: by outflank-mailman (input) for mailman id 1213489;
 Mon, 26 Jan 2026 10:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkJas-0001SR-G5
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:13:14 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ee917e3-fa9f-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 11:13:12 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so4254071f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 02:13:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1b6e2besm29035708f8f.0.2026.01.26.02.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:13:11 -0800 (PST)
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
X-Inumbo-ID: 9ee917e3-fa9f-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769422392; x=1770027192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b1BNmOoJ0FqwRiXxPXX1bFXKY/+NzSSE+35Bm6yGsoQ=;
        b=S3GmZ/Xj7i6X5P/jJVq+DL8xkUOd4dELsVTadyn6bckwnVMCcqi0QHqdZ8xMkwJXTK
         1BqwRAVoby9EF9mvleff6dqZ8QhK0W/sijHVHMUvf2NIkyZJcDYzLtdR3IuTTqMQEKsH
         wyUK9qDQJDSeefJR5iLyTdv6k7VGToxYbG+7SsTQDZ7qiHtVEr75wSIE9B4v6zxXlHOb
         P8WPVBOE57jqSM7no6oslzXuNvyyKU0DER/CqTopAa3NHFl4twkbD5f2wzjSfMOyNdVx
         uXXYcefaW9sooTSMJtouDX0ZwRPt4bINrzVh9YuefNd1YxlZU40GjTG5eKNnjntoBXQy
         12EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422392; x=1770027192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1BNmOoJ0FqwRiXxPXX1bFXKY/+NzSSE+35Bm6yGsoQ=;
        b=BqcSEmwqxGATDUsZEvr+biSXWkr/w9tIQuuG3lSBv7J3bDdSBMe4DDvQq+/cvnZ+BE
         6SMDD1EOvcZhRnrdSrv9eft5Iwx0aGAC2t/sHVG5HxCM3TTqy1V1/VwOECJiHD4ZSmQj
         NojKTsh/K81YIMqcB12AI8DydQK379RZM4UvU7uadMBgEydS3DJAyQagYrQ6mA/MUKvK
         nJTzhXR+OOPNwqfUqhKlQxNx8MdUFrxGt3elRGi/H2Cmul2wbrvb+psSUPPVXDQIFW6E
         qYfh6KgOxRem9wAlLVSnXa7FQs+V1B2Gbh0lng3UodkxXFrZEMzRi5ln7M8pAO3Jz98W
         CFnA==
X-Forwarded-Encrypted: i=1; AJvYcCU+R0ULplTWCXrFG6W2dNLiVEnqlu+6DpMaCy2s9gbZUmslWJFYTEtja3fcSa+fIl2bWOvCAFFLuWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEZ0blgrYMWq6hZD9iyepqLrPd2/Wx7THI2LO6SN9KJ8lLfKqG
	QGWRHUHYRR9P9toV5NLudYOpc5Jp0sgquh6bTgV1gnP6G18ILifOtJaeHR36qD6frw==
X-Gm-Gg: AZuq6aJjF7fvIOpoY7P33CRK5JfvaXawiojDKOCDJYumYI+7PncvhMq0F+3KW/Dtde0
	AGV/eoeLRM8hms5JC4lJ31ck5U1f68RpN7TOBDTLcPgZdnY47bqN7hwlwvgcz1CX6XI2o7vXBkk
	ylR4RDvgZyJKWlpGMc68ubozmo8iIvJwjxnqgUPnKNeVxPKGjKkeF2iCYLyD2sLAiyt/2x8gk8W
	+Yk7gGAPVrX11ZAGRpvLL/db+xyyWYJ2f3s+OKAxXQWyysECHhXVEUgmGTR07svytgQ8naT54FM
	KnfCPWRrlwxVUSlfAjMyzINKRDiXP0XOCXy5OfSaWBlrbGdZ3SSzQGUF7SY9ae923iAXEyLyKQ8
	o+6mwd5ejLJuhg2+jyiG/XKG0hJjxMRqYho99kQK6f5Y3hID1YxwQS1xXii3xGKtR9VdHTUPZgp
	09Uy73iw5ciD5PMIj7ciChLxBEXVqFbq20kMVzMZtCjq7H4N/Ay+DrAMKcLrLcRsB8CGlgnYDXp
	3Q=
X-Received: by 2002:a05:6000:4008:b0:430:f5ed:83e3 with SMTP id ffacd0b85a97d-435ca123e42mr5980091f8f.6.1769422391594;
        Mon, 26 Jan 2026 02:13:11 -0800 (PST)
Message-ID: <6f4901b7-3121-4dce-bdeb-da3644e719c3@suse.com>
Date: Mon, 26 Jan 2026 11:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: adjust NR_CPUS defaults
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
 <bdce6b74-d6ea-40fe-b7a7-dba62a7535c2@amd.com>
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
In-Reply-To: <bdce6b74-d6ea-40fe-b7a7-dba62a7535c2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 12B8586807
X-Rspamd-Action: no action

On 26.01.2026 11:08, Orzel, Michal wrote:
> On 14/01/2026 12:33, Jan Beulich wrote:
>> Discussion of a RISC-V change revealed that for PPC and RISC-V we don't
>> really set any default, but rather rely on internals of kconfig picking
>> the lowest of the permitted values in such a case. Let's make this
>> explicit, requiring architectures that mean to permit SMP by default to
>> explicitly record some sensible value here.
>>
>> Leverage the adjustment to the "1" case to simplify all subsequent ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

> with one question...
> 
>> ---
>> For not-yet-SMP-capable ports we might go even further and use
>>
>>  	range 1 1 if !X86 && (!ARM || MPU)
>>
>> at the top. Thoughts? (I've not done this right away as it is liable to
>> get unwieldy when we have a larger number of SMP-capable ports.)
>>
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -9,11 +9,11 @@ config NR_CPUS
>>  	range 1 1 if ARM && MPU
> Why not simply && MPU given that MPU is an ARM specific option in our Kconfig.

Good question, to be answered by whoever put this here. I guess the anticipation
may have been that "MPU" might end up meaning something else on another arch, at
some future point?

Jan

