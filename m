Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C782A937
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 09:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666010.1036396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqYw-0005LM-VR; Thu, 11 Jan 2024 08:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666010.1036396; Thu, 11 Jan 2024 08:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqYw-0005IE-Rw; Thu, 11 Jan 2024 08:37:18 +0000
Received: by outflank-mailman (input) for mailman id 666010;
 Thu, 11 Jan 2024 08:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqYu-0005Hi-PS
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 08:37:16 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f193eb4-b05c-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 09:37:14 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e60e1373bso2038115e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 00:37:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b0040e4914f28dsm4860973wmq.18.2024.01.11.00.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 00:37:14 -0800 (PST)
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
X-Inumbo-ID: 9f193eb4-b05c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704962234; x=1705567034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqDaRMWjxFa+sEz0bxzLptucoToC2rAxXO+kGP63rF8=;
        b=e7PoZpBM45mIsX64wbtlHY27sl/q4q5/JZTZfdglxityEGktnM9sRXX7RUkrr66P8Y
         H5VAe4luHjK06LX92bX6DKcifR2GLGAMt2cflNbohaQ/uVdcFGMr/51UEn+NAavya6J3
         neVU4HoDfhhchoDHSo4t9y789zI44WmghD5xMA7hpefO2WRiO6qq/aCdN/uG/lU6FDkO
         QYYW8YeoXYjUZwyAoKCCHO8yef73ErS5tydQDwkYCoOxt+kBQ9+opqDNFU3Ar30WEaKg
         CwjYlByDGXisL9JvHZ5OIhvchl5ivCWuNYY6C3FzR8HYL1zxWd7rV/xagUY8ItWytwrf
         CKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704962234; x=1705567034;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqDaRMWjxFa+sEz0bxzLptucoToC2rAxXO+kGP63rF8=;
        b=kNNjVcpo+/PXjvtolV3ysDVp7s8asg69Jui9E2RvmZ2Px8joZnkUsRHb+FNWe75iwM
         FY2Lx6C7F9gdQkLeSiyAfX25VuATUQmxT8EFDPmO+PLsnPLB44G+9CkmfHj+vpurTDoy
         BZiHT4xs08EzDnchOV2atcHqrmkUJRnl8o4Dp9+9Ktarw23KiOqey5maUcFrJCKJDy6D
         IPBqa+DZZ2qcFk5Fk4ZXcGCgA2GoeCvBWDcgUTRMQOZDbdgN7TDzsuMnOmspXCm2IYNY
         kIgopoPQeotl1pO5NDnz9MRmAK1f8K7Ir4AIMaJ/CoYXaofD6PdxJEikBfsE9ckrxs74
         1ToA==
X-Gm-Message-State: AOJu0Yz9is8SFxpy46WWieqPbKDHst9NQuC62omHX6hBnPwo+YPKAI90
	Z2iofcSd0loioi3I8JAegG7+adObJz55
X-Google-Smtp-Source: AGHT+IHGhWt2atID/9nE+GUTF3q/5l0aTWqBhl4vvCCceO/JAEs8nmLU1qNpAnvRrsZ+K7eDPBk1AQ==
X-Received: by 2002:a05:600c:501f:b0:40e:6106:3e53 with SMTP id n31-20020a05600c501f00b0040e61063e53mr199151wmr.11.1704962234291;
        Thu, 11 Jan 2024 00:37:14 -0800 (PST)
Message-ID: <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
Date: Thu, 11 Jan 2024 09:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: Patrick Plenefisch <simonpatp@gmail.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 03:29, Patrick Plenefisch wrote:
> Hi,
> 
> I ran into a memory allocation issue, I think. It is the same as
> https://github.com/QubesOS/qubes-issues/issues/8791 and I saw at the end it
> was recommended (by marmarek) that the issue reporter forward the issue to
> this list. I searched the list, but as I didn't see it in the list already,
> I'm doing that now.
> 
> Hardware:
> I have an AMD Threadripper 7960X on a ASRock TRX50 WS motherboard. The
> Qubes reporter had a Threadripper 3970X on an ASUS Prime TRX40-Pro
> Motherboard. I saw a 3rd issue report of a similar issue on another
> Threadripper, so I think this may be Threadripper-specific.
> 
> Setup:
> The QuebesOS reporter was using Qubes Installer.
> My install was that I had a fresh install of Debian 12 (no gui), and then
> did `apt install xen-system-amd64` and rebooted.
> 
> The issue:
> Any boot of Xen on the hardware results in a halted machine. When
> monitoring the logs with `vga=,keep`, we get:
> 
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 644kB init memory
> mapping kernel into physical memory
> about to get started…
> xen hypervisor allocated kernel memory conflicts with E820

So first of all (the title doesn't say it) this is a Linux Dom0 issue.
Whether or not needing addressing in Xen is unknown at this point.

> (XEN) Hardware Dom0 halted: halting machine
> 
> None of the settings I or the Qubes reporter have tried have been able to
> get past this failure.
> 
> I am happy to provide debugging support.

Well, the crucial piece of data initially is going to be: What's the
E820 map Xen gets to see, what's the E820 map Dom0 gets to see, and
what address range is the conflict detected for? The first question
is possible to answer by supplying a serial log. The second question
likely means adding some debugging code to either Xen or Linux. The
answer to third question may be possible to infer from the other
data, but would likely be better to obtain explicitly by adjusting /
amending the message Linux emits.

Jan

