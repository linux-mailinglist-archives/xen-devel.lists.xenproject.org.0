Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A29143E3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746127.1153082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeQi-0007lm-Sl; Mon, 24 Jun 2024 07:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746127.1153082; Mon, 24 Jun 2024 07:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeQi-0007jg-Po; Mon, 24 Jun 2024 07:48:00 +0000
Received: by outflank-mailman (input) for mailman id 746127;
 Mon, 24 Jun 2024 07:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLeQi-0007jX-0K
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:48:00 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 137904a3-31fe-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:47:59 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so47667921fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:47:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7065107c572sm5595165b3a.8.2024.06.24.00.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 00:47:58 -0700 (PDT)
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
X-Inumbo-ID: 137904a3-31fe-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719215278; x=1719820078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuNzFt7Z/PCMwiYpotfhwBC/Onyl8SYYFRCsdTPRooU=;
        b=Tp6fba0zjPyznAjVCUSlRzHcMq7BJnnwV8cbAxJVShBQWOKCU9WB9LGFZpGpBEt/HK
         k/imJxuir6QwZEi11P3lnnTg8Le6l2hsSoV41Eqkk6h4g9bqx0JXg42Ly17OHDwNvGGv
         FAdP70uSN+aoZQWKHQehBAzoDtxyHQqX4ysgcv/xhDA/sdfkxg6FfkpGv0xt8ZO10HN/
         1aEYe5elKC17AFH4jzZ7iw7bDNPWoMphex8+pVjMu9vn1Zdb89e2oQH0+jeWubSXPDDO
         J7LyV18EG0VFc8ZENTLPvq7VMcmLvVTSxqwIEGSevWMJbI+zW082TKBg1VsqQoVnhFdy
         /tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215278; x=1719820078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuNzFt7Z/PCMwiYpotfhwBC/Onyl8SYYFRCsdTPRooU=;
        b=AEr09dbR+f/DggHrReXVxsY0/g30wgf3688mmqBr5wjmaSGNFAVunQTk3uQOaDJw9v
         8HV1TL3zEy42nKxl7nqFW9iB0NOND2mAF5YVKrFtwEqqXo6X7rqrt6Hk3topBrcsba+5
         M03Yr3NDi+G12Th+K/QO+W4JLXsvjJgoz0XtTV0mta3otgNIymfDVXQs5I1+/YJMCYkQ
         0DYZZLHA1PYM+gx7PYcNcpuvanN6AsqpLLwEWY84RxlXL1T2N7NlD2u6veQ4sUSZD2DC
         57TtmxqpRTwNoY7Qo09LpKYu7OwZFo8rLhP9EumF4u8+iaKLSUjiSdAm/WmSX4epZnGt
         pCMg==
X-Gm-Message-State: AOJu0YzInaizG8NH+OUk8DX/eib7AsWNOmon2XpOeJB9c9qT/NlJ4fkt
	JSCxEyIWuJ+TOGRdcFJTrxCzpOAua3HINstj/QvQukvTJnW/DreXVprOyQRg4Q==
X-Google-Smtp-Source: AGHT+IEMkmIdhADXho60NWs0vlZX9UapHgj4IS6ZLkdPw0CWUF9xmFMz5sffemGK9fnLCWZNmjgKkg==
X-Received: by 2002:a05:651c:211d:b0:2ec:5dfc:a64e with SMTP id 38308e7fff4ca-2ec5dfca6demr23504481fa.0.1719215278541;
        Mon, 24 Jun 2024 00:47:58 -0700 (PDT)
Message-ID: <7582f9e6-7b31-47e7-b42a-92c0f87effd2@suse.com>
Date: Mon, 24 Jun 2024 09:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
 <ZnWwbJiD6eG85VY9@l14> <e6262049-21b4-4eb7-9f29-6d5983bfb212@citrix.com>
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
In-Reply-To: <e6262049-21b4-4eb7-9f29-6d5983bfb212@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.06.2024 18:59, Andrew Cooper wrote:
> On 21/06/2024 5:55 pm, Anthony PERARD wrote:
>> On Fri, Jun 21, 2024 at 05:16:56PM +0100, Andrew Cooper wrote:
>>> `xl devd` has been observed leaking /var/log/xldevd.log into children.
>>>
>>> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd, so
>>> after setting up stdout/stderr, it's only the logfile fd which will close on
>>> exec().
>>>
>>> Link: https://github.com/QubesOS/qubes-issues/issues/8292
>>> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony@xenproject.org>
>>> CC: Juergen Gross <jgross@suse.com>
>>> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
>>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> Also entirely speculative based on the QubesOS ticket.
>>>
>>> v2:
>>>  * Extend the commit message to explain why stdout/stderr aren't closed by
>>>    this change
>>>
>>> For 4.19.  This bugfix was posted earlier, but fell between the cracks.
>>> ---
>>>  tools/xl/xl_utils.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
>>> index 17489d182954..060186db3a59 100644
>>> --- a/tools/xl/xl_utils.c
>>> +++ b/tools/xl/xl_utils.c
>>> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfile)
>>>          exit(-1);
>>>      }
>>>  
>>> -    CHK_SYSCALL(logfile = open(fullname, O_WRONLY|O_CREAT|O_APPEND, 0644));
>>> +    CHK_SYSCALL(logfile = open(fullname, O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644));
>> Everytime we use O_CLOEXEC, we add in the C file
>>     #ifndef O_CLOEXEC
>>     #define O_CLOEXEC 0
>>     #endif
>> we don't need to do that anymore?
>> Or I guess we'll see if someone complain when they try to build on an
>> ancien version of Linux.
>>
>> Acked-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Thanks.  I did originally have that ifdefary here, but then I noticed
> that this isn't the first instance like this in xl, and I'm going to be
> using that as a justification soon to explicitly drop support for Linux
> < 2.6.23.

Just to mention that this is a two fold thing: I surely don't try to run
up-to-date Xen on top of this old a Linux kernel, but what is used for
building is still what the distro (with a very old kernel) would have put
there.

Jan

