Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD8917AE6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748487.1156208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNzc-0002vh-Dh; Wed, 26 Jun 2024 08:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748487.1156208; Wed, 26 Jun 2024 08:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMNzc-0002sw-B3; Wed, 26 Jun 2024 08:27:04 +0000
Received: by outflank-mailman (input) for mailman id 748487;
 Wed, 26 Jun 2024 08:27:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMNza-0002sq-Nu
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:27:02 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc9618ee-3395-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 10:27:01 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so100635611fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 01:27:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8d81b9d74sm1039134a91.45.2024.06.26.01.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:27:00 -0700 (PDT)
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
X-Inumbo-ID: dc9618ee-3395-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719390421; x=1719995221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NxObYwcS1Kk14LV5To0HwEsnoV7XQC+0TAuppa/SzQc=;
        b=OeUwKFH/69urj6GnCS15NuAnkcHYbcxbD7h6qk9uhTT+YNyTP5pHSN/fDDbgXhoJgb
         TJZgpCo4JVciYxWHhmVIj10Deax90gDYjx7jlnkp+pHB/RdhVzxBH/Qm2b2JXlP2TzNU
         0YusJgAG21PJW6RfwD+ILl2m9okqo+oOj9578g1ju442lmsZukqRrACUHdJkV0dqqI5L
         dAp2C+wWv22qMkBhpyZDyaqUCxykOuKWtdPZRCyY7oTDtWYOeeayB6pqoTkT8ozpUwXh
         wFOMQjBGAWKPxqkRyq66Uu0V/9jtNgWDAMj9DDNxxFwLrgvd44JQNkRTkyemWUGFD97H
         1siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719390421; x=1719995221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxObYwcS1Kk14LV5To0HwEsnoV7XQC+0TAuppa/SzQc=;
        b=lv8bGOqllMqHJvDUduotCr6VYMFRuQbk8jY0K81+ngonpxrfZUWlyD10hqiUN/qj7q
         cp56cneMD/IaWwEUlHySkApByYyzfEh2uZryvDHBGSHro7t8l0aODxvx8HqLVLQtUMfe
         aopqLv43sCwVOyMpa1GaWqBZihNOzeCB7WQSB7Pm2g3/XC2uWEQpvaUxoxQ/YIQOM16w
         cS2D1bU6IuHZEncw2iMBYB3JziO9BWEG1XV8WjmEG386kIDM0zhQIqErPNA5WUhbAhnw
         TrVIjfhgcNDovmc/SuIi6HssB7xFCh290QBAf1KxnYo93gZvwdzsmzqX3erUg4uxV+vm
         goOw==
X-Forwarded-Encrypted: i=1; AJvYcCXEI1445hmkJZogFjEVh6YLECq77kXvKPUig0VpX92VDE0ZF8FHDujvsShGKIboykf6ZRSESlDqBPMlEkkKWjAWQd+2wqqY2lHRC3rfV6o=
X-Gm-Message-State: AOJu0YzmRSN9VUTyy7F2fkNh/ENfigUpxZkvRPHoS3aUTeLBrDQ/g6cA
	SSZwLek0Ym5tbeDWT9KwrObJEgmEI1PYD73TXJVvIjjgHESvu9tkq33fbT87nw==
X-Google-Smtp-Source: AGHT+IEuPd1fXvIw/AC14GXd1g1yOf6vr5X9Uppy9wEGyZtuhvCmkWJUHChyZjg6shHh+F1Bcop2+g==
X-Received: by 2002:a2e:9e18:0:b0:2ec:5488:cc9e with SMTP id 38308e7fff4ca-2ec5b2e5a63mr71673891fa.26.1719390421043;
        Wed, 26 Jun 2024 01:27:01 -0700 (PDT)
Message-ID: <c96d725f-632b-4cde-be3b-4060b40f390f@suse.com>
Date: Wed, 26 Jun 2024 10:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/10] xen/riscv: change .insn to .byte in cpu_relax()
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
 <b5ccb3850cbfc0c84d2feea35a971351395fa974.1719319093.git.oleksii.kurochko@gmail.com>
 <8be2c7c0-0aa0-44e0-b3d3-d422fecc29b6@suse.com>
 <9de5a3235f2bce8e7ab5c5dd5faf36e1774c97a7.camel@gmail.com>
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
In-Reply-To: <9de5a3235f2bce8e7ab5c5dd5faf36e1774c97a7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 20:09, Oleksii wrote:
> On Tue, 2024-06-25 at 16:45 +0200, Jan Beulich wrote:
>> On 25.06.2024 15:51, Oleksii Kurochko wrote:
>>> The following compilation error occurs:
>>>   ./arch/riscv/include/asm/processor.h: Assembler messages:
>>>   ./arch/riscv/include/asm/processor.h:70: Error: unrecognized
>>> opcode `0x0100000F'
>>> In case of the following Binutils:
>>>   $ riscv64-linux-gnu-as --version
>>>   GNU assembler (GNU Binutils for Debian) 2.35.2
>>
>> In patch 6 you say 2.39. Why is 2.35.2 suddenly becoming of interest?
> Andrew has (or had) an older version of binutils and started to face
> the issues mentioned in this patch and the next one. As a result, some
> changes were suggested.
> 
> The version in the README wasn't changed because, in my opinion, this
> requires a separate CI job with a prebuilt or fixed toolchain version.
> At the moment, it is supported only the version mentioned in README and
> that one I have on my machine.

So from my perspective, if you go to the lengths of making changes to
support anything older than what you put into README, you will want to
at least briefly mention why this is needed / wanted.

Plus, as to "separate CI job": That makes little sense to me, or else
we'd need to have separate jobs for each and every compiler version
out in the world (and within range of what README says). Not just for
RISC-V, but also for other architectures. This imo simply wouldn't
scale.

Jan

