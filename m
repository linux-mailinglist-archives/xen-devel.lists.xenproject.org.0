Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7949143E1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:47:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746119.1153073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeP0-000747-Ci; Mon, 24 Jun 2024 07:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746119.1153073; Mon, 24 Jun 2024 07:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeP0-000724-9a; Mon, 24 Jun 2024 07:46:14 +0000
Received: by outflank-mailman (input) for mailman id 746119;
 Mon, 24 Jun 2024 07:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLeOy-00071a-JK
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:46:12 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d306e712-31fd-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 09:46:10 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so65037341fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:46:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7066fcbd3ecsm3093847b3a.207.2024.06.24.00.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:46:09 -0700 (PDT)
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
X-Inumbo-ID: d306e712-31fd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719215170; x=1719819970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gK3kglP3CVyQ1tTCGC5HsK/kSpRbybCiwuXxxCoaV5M=;
        b=gAXsiMmn9BIItiTbqWyt7e/KFE0WQEZ63B3e4UBHWjkBnjZ9kzOcS6iHbpej7rBCL6
         7lQtTSdiBY1/tox8tDbSKJ6leuLwLOhWqgTDW7bi4T9SRT7xrvgqX3OpFOINcq5vxSu7
         LGYlsI1lYrztK0yr4ZQO6eXVYeHvwHb8CpiIUYD4QAMEO0HY1csmt1q5MaPeT49wIjGO
         evRxKUZouDRnKoB781P8Hb6HcLMzQcBJJ4bjbECx/XKC/qSig557cjauoYGsEYsc+m8Z
         bM4jKxhXUq4kHPS7+URW/iz6ErX1VMo6EUvzTIuJxvjjqnEHtLS0bIAxajQw0ccSibra
         g/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215170; x=1719819970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK3kglP3CVyQ1tTCGC5HsK/kSpRbybCiwuXxxCoaV5M=;
        b=toeOD8iKYytgSgepDnGSvVu4vU5r7ePLNlj6JTUFtZkUOhZU2ywuNn1bGS58td5Ztx
         dHHhVKzpmGOSaJRgRB+0ryhiaK3rYNiElKhrAKzLHojAP5/g/bLWWSFV4GsAFNFyl9QG
         loMxfARE/27mc1QUsGtJ34ed9LEdeYh90R1Q8YyvsNEz8faPHDyeM238MRphgLsp3Z2o
         DGDHSlYVOXpByJTQRUfwgdOnF68olDsfHIsS7HNCy/O46gMdKiCOiwqL9tHtzEcAaB4P
         uYIwTaYcDleieRMtfSfTUag++SiPWkUhi5kdUjgYR94jLHXoM5n9x65+VD+FBjaMritI
         94tQ==
X-Gm-Message-State: AOJu0Yy8Ef5GJBJnDU+JBol9M280rBUavY8cN0elvVoTQ5oX11N1YKy2
	2LKGftlTGQgNUTadJqBR0fOZDzkIbf8ZympzCQ8r0lYbkvyU0VwQQsw9gVrAEg==
X-Google-Smtp-Source: AGHT+IG4bbUmljlZWIIFoBdbhzKj0f514/Idy0G5GEHTsTzuvqAYPkcYWIMA6oCHkNnjikEWdsHGOw==
X-Received: by 2002:a2e:a17a:0:b0:2ec:4093:ec7 with SMTP id 38308e7fff4ca-2ec5b2e7238mr29272411fa.30.1719215170408;
        Mon, 24 Jun 2024 00:46:10 -0700 (PDT)
Message-ID: <43cf9879-c781-4e05-8be4-f7f8ec87d4a3@suse.com>
Date: Mon, 24 Jun 2024 09:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
To: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
 <ZnWwbJiD6eG85VY9@l14>
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
In-Reply-To: <ZnWwbJiD6eG85VY9@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.06.2024 18:55, Anthony PERARD wrote:
> On Fri, Jun 21, 2024 at 05:16:56PM +0100, Andrew Cooper wrote:
>> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>>
>> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd, so
>> after setting up stdout/stderr, it's only the logfile fd which will close on
>> exec().
>>
>> Link: https://github.com/QubesOS/qubes-issues/issues/8292
>> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony@xenproject.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Also entirely speculative based on the QubesOS ticket.
>>
>> v2:
>>  * Extend the commit message to explain why stdout/stderr aren't closed by
>>    this change
>>
>> For 4.19.  This bugfix was posted earlier, but fell between the cracks.
>> ---
>>  tools/xl/xl_utils.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
>> index 17489d182954..060186db3a59 100644
>> --- a/tools/xl/xl_utils.c
>> +++ b/tools/xl/xl_utils.c
>> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfile)
>>          exit(-1);
>>      }
>>  
>> -    CHK_SYSCALL(logfile = open(fullname, O_WRONLY|O_CREAT|O_APPEND, 0644));
>> +    CHK_SYSCALL(logfile = open(fullname, O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644));
> 
> Everytime we use O_CLOEXEC, we add in the C file
>     #ifndef O_CLOEXEC
>     #define O_CLOEXEC 0
>     #endif
> we don't need to do that anymore?
> Or I guess we'll see if someone complain when they try to build on an
> ancien version of Linux.

I'm pretty certain I'll run into that issue on one of my pretty old systems,
but if the general view is that we don't care about such environments anymore,
then so be it (and I'll take care of such issues locally).

Jan

