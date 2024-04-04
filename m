Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3389829E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700725.1094314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHz2-0000JD-TW; Thu, 04 Apr 2024 07:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700725.1094314; Thu, 04 Apr 2024 07:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHz2-0000GF-Qh; Thu, 04 Apr 2024 07:58:04 +0000
Received: by outflank-mailman (input) for mailman id 700725;
 Thu, 04 Apr 2024 07:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsHz0-0000FF-RN
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:58:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f46bdfe-f259-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 09:58:01 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56e1f3462caso234869a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 00:58:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cn20-20020a0564020cb400b0056dfc8d12fasm2033320edb.21.2024.04.04.00.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 00:58:01 -0700 (PDT)
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
X-Inumbo-ID: 0f46bdfe-f259-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712217481; x=1712822281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vV5guyyhcUI9/PM2esUQVcAnV3zlTfsBAd7rcrK12bs=;
        b=JqEcW6kdRWC3eclKhRaY/0DlJrflqac7sssB+y2U+OFFHY8IRJuql3dzG9t6HMXGZE
         4qyjFULFlVm4RfwuBamec+YwvlonF3XkYz6or1vZdfIeG5bBwBwYNGlZ8qwG5xsPB0eF
         olkzOnSMdM+5wcvZpd6sXba6Pgcu4L+1oGt4uFuxPRX/yy+xFABucliBYyPFEbPviqmD
         c54g9Y2BX6218FEsPdlJT/xOKNz2feXcrrmh5VTGX58V3mGYMbgXIiccs/npU/CYX02k
         N49EJaPfm/Z1qXCbSL/fv8EZxwua9W1GJ7YoPxivXDArV6hl0eD4JATXR10vvkOcJuo4
         U2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217481; x=1712822281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vV5guyyhcUI9/PM2esUQVcAnV3zlTfsBAd7rcrK12bs=;
        b=i5e4hI/uIH2py3w6qqyn2pnnzHqsHLoVZt4kYfrWp0U3uGrSaX3O9X911DfZP8BAbU
         0Q+hL+8H3Xm8k19yjwoTvqzfPUXPCe7bLOGXmMDuihNZ4CiIiECbSibe1bjC2+EvZGqB
         cjWcEelnhzv18r+M/ZEHXfzR1W5bJWmqkeHNel92qkd8QFxDkROiTuW1dT77A5uHZ+ac
         NrGcqw9HR5Oou1oTuaHgR3thqXPkUhWi1wACz7P8eMOgzaWGqOLIgiATCL62k689g1Ag
         dffo4lPdBLIa4XfqZMEIZyPm98ie8V0FDA9D4ZEf60S28urs1rmwxO8+J6tltvllZZFC
         olpA==
X-Forwarded-Encrypted: i=1; AJvYcCVO3I+Y6LG+iRKRj369aM2Hc8nJQS3vk2yp+8zNOomvN+A31x0G9urcW5JvipjHhrTWdlqBG+8l+C4/MkCtSLD66zJd3nWr92TprEV0rfI=
X-Gm-Message-State: AOJu0Yy8aN2aHNiyormNpV5fZ0FikVReHDzJ6fRRmYK5z7WgELeyE3D/
	TY5+Uy1jctiycWxWP+8qrGsWoH4JGLf8/h3KFDDVxasERs/tvoNvBWnLm3j1UFdKxoa2zsCm5Cc
	=
X-Google-Smtp-Source: AGHT+IE2k/phCkqn7sBjqaVbzWgHpE7whWObMMP5z3SaZ6CjHfjb+TRDgrbevOBMF/0S7S3RS9TkOQ==
X-Received: by 2002:a50:d4d5:0:b0:56d:f79a:ec1f with SMTP id e21-20020a50d4d5000000b0056df79aec1fmr1170880edj.18.1712217481719;
        Thu, 04 Apr 2024 00:58:01 -0700 (PDT)
Message-ID: <728f72f8-c105-4cad-bad8-1dfb7dbd0e3a@suse.com>
Date: Thu, 4 Apr 2024 09:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] xen/sched: address violations of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
References: <cover.1712215939.git.federico.serafini@bugseng.com>
 <08c449728221c9c2b9e87f22eb9d0cffbf7ecf68.1712215939.git.federico.serafini@bugseng.com>
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
In-Reply-To: <08c449728221c9c2b9e87f22eb9d0cffbf7ecf68.1712215939.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 09:49, Federico Serafini wrote:
> Add break statement to address a violation of MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> Replace deprecated comment /* FALLTHRU */ with pseudo-keyword
> fallthrough to meet the requirements to deviate the rule.
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



