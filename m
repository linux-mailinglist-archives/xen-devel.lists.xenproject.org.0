Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0593B46A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764409.1174850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeNP-0004Bg-7Z; Wed, 24 Jul 2024 15:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764409.1174850; Wed, 24 Jul 2024 15:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWeNP-000490-3P; Wed, 24 Jul 2024 15:58:03 +0000
Received: by outflank-mailman (input) for mailman id 764409;
 Wed, 24 Jul 2024 15:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWeNN-00048u-Ed
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:58:01 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80620957-49d5-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:58:00 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so25164a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:58:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c2f8c10sm9118686a12.76.2024.07.24.08.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 08:57:59 -0700 (PDT)
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
X-Inumbo-ID: 80620957-49d5-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721836680; x=1722441480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bm5XxPL8JVEXsZCYySN+JoxAulKMDqS5gQljFqYacOo=;
        b=JMj9d8GmGkoG5ZOV6LxsyXE14mcrFWGtKaqluyyX6x0VpM2RVr8NsaaivHeOO3gYns
         POKcpZwc8l6zzO5QPpbTl267hqJeN3nY7WxH0FFerA8xz/BmjTM08oVKFZjPnwTP5rLx
         F6OVWfsMxi3yVrw6/UD4Op1G1g3PYjy+ld4/fbszAdYF968UxA4boAtMOHnEusP5i0el
         SFUArvr4HZvXAVXfiPy2K+WmZ8Bq7QV4G/Sqy2wixcG6m53LpAA1xOo1vL5woZ7bcj28
         0sto8mKOh4n1JaBs6oG+ebMYoscfbhXB/JCltY2HkAUKUSbtQd8cxKK612qEXh6C2f84
         u1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721836680; x=1722441480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm5XxPL8JVEXsZCYySN+JoxAulKMDqS5gQljFqYacOo=;
        b=BNRyoG7J4Dob+qyZoXD2CLVReJbgB5jdfn9sqG1lTuw+PEFVslwE5viWn2OhZnBQ7c
         IjWDes2wvjvkymzEcfF2yxCTep0jm/qyDBkOz1+Y2UKSCNzongjOveZCU+K8aluxme9q
         Z0+W0I5Nz0pRYvYKHXZp58T83OUelcUafuLcwvrXj1Lk9e1UkBx977s8B1c6mZSG+y3g
         LvnTOJm6mWVxf6CrorUtvjDrTFd3eRUP8+NaJWtgtR/BulutlRdoj7n9c1UrxfVx3URz
         NP9KtzrHI+zf9HKFWFQS18OI7tgAdQfzuBDIGSql583lMyAv9wTQGjKK5n/zdwTrR6Mw
         TDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDar3bDmpxDsPOt4a1s8vmuamQgmWwD/n304psntWXILoXUoqTvg5Xq2xxamzQHcrNw8aaxKxVRNS5M7RbylqS12uuvaEMLmItRxweK/E=
X-Gm-Message-State: AOJu0YyNULYTfTtgHQ2WYUYBHo4kdjdXAMJeoyk5cyQwR9rj7Td9Z3WV
	fbBv/RgQQATwtR5jIsOKtO0bOtE4N7rjL1EjrhCa9x4IyAVUfeoM7lOBIHF6tA==
X-Google-Smtp-Source: AGHT+IEveIfJdlwA4QfQSHmebcIEugK3yuzY9MGsG6jzNOwAM1iTVhK3/KgRPbsWXal29zTxKYxNEg==
X-Received: by 2002:a05:6402:34d1:b0:5a2:fc48:db2d with SMTP id 4fb4d7f45d1cf-5aaa596c79bmr2654145a12.31.1721836679982;
        Wed, 24 Jul 2024 08:57:59 -0700 (PDT)
Message-ID: <76527d47-8ffa-4d48-a249-fad56012df57@suse.com>
Date: Wed, 24 Jul 2024 17:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 10/17] x86/asm: address violations of MISRA C:2012
 Directive 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
 <20e1d32d9e384f9682fc25d9a55480edd11e344e.1721720583.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <20e1d32d9e384f9682fc25d9a55480edd11e344e.1721720583.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 10:15, Alessandro Zucchelli wrote:
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -105,9 +105,14 @@ xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+
>  xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
>  
>  quiet_cmd_xlat_h = GEN     $@
> -cmd_xlat_h = \
> -	cat $(filter %.h,$^) >$@.new; \
> +define cmd_xlat_h
> +	guard=$$(echo ASM__${SRCARCH}__COMPAT__XLAT_H | tr a-z A-Z); \

The generated living in xen/include/compat/xlat.h, I don't think this guard
identifier is correct.

Jan

