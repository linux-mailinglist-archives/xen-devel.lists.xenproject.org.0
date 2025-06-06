Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0EACFCC5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007903.1387072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQbx-0003F2-9J; Fri, 06 Jun 2025 06:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007903.1387072; Fri, 06 Jun 2025 06:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQbx-0003CN-6N; Fri, 06 Jun 2025 06:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1007903;
 Fri, 06 Jun 2025 06:31:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNQbw-0003C1-8M
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:31:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfd9be80-429f-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 08:31:27 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso16769955e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 23:31:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b127f6esm595828a91.26.2025.06.05.23.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 23:31:26 -0700 (PDT)
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
X-Inumbo-ID: dfd9be80-429f-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749191487; x=1749796287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ4L3al+6jhMV6LDrCNwkecQvy/feUGeb88f6h/wgwk=;
        b=JHvVtSe/i3tzkVyH/kWG8pTaVSLBLR3pmycibYGLlXmAaxpyWwnt3vErNyA469oQw3
         Rfl0nRA5LzcCQVM82Nr1Tk689go3TTH9a/ADFWwW+9V135fdelRLiY0p7MkW5xJwFODE
         vCheC6kL+d6YSE2yNpUvvBQf4jGon/FIklew3XRwigQkmsxJzsDyBT1Qz2bG5OrTZMIm
         IiZz8iGGDGsg2SdHyoELp9tfZkOwMc8N83ANc8PcgDTVEKMybBo2MNQA4eWRLotqoOTt
         zKiLvfn7t/VqdRst3eWVpmIJnBdPzTIGsaPh1TnJkP1EYkKhYqFk/92XfBC94Q16v8tr
         /Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191487; x=1749796287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ4L3al+6jhMV6LDrCNwkecQvy/feUGeb88f6h/wgwk=;
        b=Hox///Oat5fxL1P6XqUbefy1wU8sYlyFBr50GBMwyPp+wF++b/V2socbLgXgav189Y
         A//TbZCDdSsuxNUnpbLo3Xp5QSSktWr+Dgzdrk/z4zlYd/8jLGhzMQjafmJ7HUwivjz1
         6xUL+JHkCNNfW2btgZPh6CozKCEQ5yBGUyXmZcG3Jr6M4qiXExzdJoZT75r2PqbEn/62
         Uw2xb4DoOVvWOdgn8C5Kcesslz6YeF9EfX4vC34w5iD/vWxm406ElGYoZksKmn8h0D33
         ICOQShtNeLdUO/EENptD/A/UDuSxyor/6MyXk3UmExaE69cG4gTlww6auKh+uC13XyZB
         G7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEJXJKTMUTAMbKcHaehV7SxQYGp0axzoc19HysrhBSb46y+ICD6XRDX8vVwhlMIzgxtrcTjLzOBFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGJTyFHO1Iq7qa4Cq83265n7CghQPR50kEgPQOYbPiarHziKj3
	LxccHNBGI5LIGRK2QwoFje0ASMmR6TPANVrZGOuyDDgivqWEkOWA9MySqC8+bWcQfQ==
X-Gm-Gg: ASbGncv0Z3hbaepgUgILL/H0XsCDin7rQWA0ySKJvaMCzNjHJP76YqJQZ9dJSEnetpk
	gCuuTynfInUHcjxQlf7h2v9ca1UUc5PTAJGTLx9pqNnRsKfmuvi0hxdOpvayXpsgoHUjAhvP4rR
	x7Jodz2XMPoYh4nY96DvyjjPh3qskTwpE4loh2RzJh8PhwlKbAIqw2tkHPxvO0N2dCwBWEIe09h
	cw2wC5+oj1aSRt77UHy6UuAuelgB4Udm8ljaMu/RosgZmHdrkzq31IPZu1WMXL+Dg1he+S2Fvdc
	gBFVE7nPZ/btBpdj2XrsK8yEcuya3VX4B52x4bimcmNQtxmOBFCNLQgTTk10VrF1EKWdyCAjlS0
	mChhW5xmKkp13iqKZ9sgWVST13573kADC/R8oY9HreyDqnTbVYCmQ/eFujA==
X-Google-Smtp-Source: AGHT+IGW1nMeCN1vPl7+cN5+bc8GgG2aELXo2yNLtPa2evzvyQ7e1On6lPIRON9YXMoFNo6+gGAD1g==
X-Received: by 2002:adf:f147:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a531ce1495mr1428146f8f.45.1749191486650;
        Thu, 05 Jun 2025 23:31:26 -0700 (PDT)
Message-ID: <d9c75b84-fe60-4825-a00c-6b36dce5b904@suse.com>
Date: Fri, 6 Jun 2025 08:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add header guards to generated asm generic headers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506041605090.2495561@ubuntu-linux-20-04-desktop>
 <f5909546-ef4d-4ee3-95b2-1255f2de3652@suse.com>
 <alpine.DEB.2.22.394.2506051649010.2495561@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506051649010.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 02:07, Stefano Stabellini wrote:
> On Thu, 5 Jun 2025, Jan Beulich wrote:
>> On 05.06.2025 01:09, Stefano Stabellini wrote:
>>> --- a/xen/scripts/Makefile.asm-generic
>>> +++ b/xen/scripts/Makefile.asm-generic
>>> @@ -32,7 +32,12 @@ old-headers := $(wildcard $(obj)/*.h)
>>>  unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>>>  
>>>  quiet_cmd_wrap = WRAP    $@
>>> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
>>> +      cmd_wrap = \
>>> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
>>> +	printf "\#ifndef ASM_GENERIC_$${upper}\n" > $@; \
>>> +	printf "\#define ASM_GENERIC_$${upper}\n" >> $@; \
>>> +	printf "\#include <asm-generic/$*.h>\n" >> $@; \
>>> +	printf "\#endif /* ASM_GENERIC_$${upper} */\n" >> $@
>>
>> I'm curious: In what is now a0f56da94c3e I had to resort to "define" to
>> get the rule to work (including a correct .*.cmd being generated). I
>> can't claim I actually understood why things didn't work the "simple
>> macro" way, and hence it's unclear to me whether the way it's done here
>> will work with all make versions.
> 
> This works:
> 
> cmd_xlat_h = \
> 	printf "\#ifndef COMPAT_XLAT_H\n" >$@.new; \
> 	printf "\#define COMPAT_XLAT_H\n" >>$@.new; \
> 	cat $(filter %.h,$^) >>$@.new; \
> 	printf "" >>$@.new; \
> 	printf "\#endif /* COMPAT_XLAT_H */\n" >>$@.new; \
> 	mv -f $@.new $@
> 
> I made these changes:
> - tab instead of spaces
> - printf instead of echo
> - escape # and add \n

Hmm, out of these I guess it were the un-escaped #-es then. In your rule
I think the simpler "echo" would also be preferable.

Jan

