Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD1FACEA5C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 08:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006263.1385460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4GL-000140-A0; Thu, 05 Jun 2025 06:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006263.1385460; Thu, 05 Jun 2025 06:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN4GL-00012T-78; Thu, 05 Jun 2025 06:39:41 +0000
Received: by outflank-mailman (input) for mailman id 1006263;
 Thu, 05 Jun 2025 06:39:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN4GJ-00012L-Cu
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 06:39:39 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9b3373c-41d7-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 08:39:37 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so4345385e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 23:39:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc8b04sm113474505ad.45.2025.06.04.23.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 23:39:36 -0700 (PDT)
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
X-Inumbo-ID: d9b3373c-41d7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749105577; x=1749710377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fwd3yPHT98LmiMqwu3HWqnIgMVBoMIjtt5dXJw+Tc+g=;
        b=DUeJSXJ6/CIEDSIe+3QjLGbFksK9H5q/lyytfLD7E2yUe8Lfe6k3vI/tXJ5dLbxGoI
         7cgPCqz1yeAba3vevhD8qKM8yGTGTA/jh0doaAQrK6UhsCXNn7J6CIkfVPlKOu3T2Y49
         xmXOplTWmZZbPOF9uCGsQfZLES5irxHPSAppw3uMAiVlFFYfsqCfuGKm/zG29tq6yXi+
         Kha0XSGAsifSNcmgE9fZJeqyWOZge6ueYcWt+2o7V/Lx0b6Vd8Vw5GiX9Sza0/Docukl
         NmQY7Hur4gcKpcaE6EXEnO1xqWoTCGzqfY/iC+0F9I1xnCRVBUjJ+C9dlb89Q2l+bDYe
         cJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105577; x=1749710377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwd3yPHT98LmiMqwu3HWqnIgMVBoMIjtt5dXJw+Tc+g=;
        b=vJA7YAbw9UjjxQIbn4TxBHFRR4UQdFO1vMZ1WiUNB9YxsbhOI477Tn2SNtf1+SRdzx
         icxsdVvxd17PYRnxXwA5XLnt2eNcdcJ2BvTjqr8ZqqAVfsxNoAtQhkZ3tuq2Nt92jyaB
         rnjrGzA/wwFvS2UDqDi+Pf6yzcdt4k1J5KTxZbRqEJEA+NRCjaL0QqWAnOMXxgJhPePH
         4tBKj9hsaCcMj4gc/p2nxwkxHUeC75v0fyKIhcVuOyYVQwZL0MysoXDdS3OC2IHRBHNd
         39x+nErBCkFIa4BQ5JtVbpqbl0BhTY+ojwciK5VZ9VSoFB90trgOL4VsP3Zk3DQOPuMs
         eBDA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqvcDaN0loQqoiGa4albaBycKVZrUGtWRfOSwZPdpey9O53EKcEYJQsjv2RGu2+yWvGg3pDZg0lA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNGBf3McXDbh36emgbGXLJNAFOZdYlLEhsjb9ADeoXOQvG4Sx3
	6leRav5eZUW+H0g6SHMqEB1QXP2OVKc4QxBXdvJCCvH8VtFvp6zhB1YvCJJYmhQxBw==
X-Gm-Gg: ASbGncsSyu4usu+RwXMJ60Ek4O0g9UBXbcf99ALhUZ6pHzqcqlFkU+Jj+PHQdLETogT
	f72AbHiPM/x3QruLJKg1OcspGhUvTS4kx+i641q+P7wBHG5SXpdWMgRPMJm2zHEZg3N20JIXt6P
	9NyEtN9BwS1psr9JQql8aiVoK80uN9APRrbAs8YK8KOBEGReEju3OK2vpI78lUeWBLXcjdkHS72
	s96Umr1ZedOT47Em0z6/pVrm3iW6t0jIFFCieXSn8NkoGVaQ506EU+3W8W15Cn3lshHvqLzvZQh
	eAgsuSvQaUBkR+gzzRtQ8uV4sY8hxTkd0pBNYsQM0ViJMfJtqAOEBO891QjwF/07DlOzKuy5j9w
	b5KmpTffCHMlpGfpboJ2PfHs5hB+Bavffbt90gCY/GLKA8gw=
X-Google-Smtp-Source: AGHT+IFFYPO9uFt0RzK5cboGIq4WkTNLr37wMXWxt18xqBZHV/CEIsr6uH/HgxzF+9IeeQv4833e8Q==
X-Received: by 2002:a05:6000:2dca:b0:3a4:e672:deef with SMTP id ffacd0b85a97d-3a51dc316bamr4424285f8f.36.1749105576900;
        Wed, 04 Jun 2025 23:39:36 -0700 (PDT)
Message-ID: <f5909546-ef4d-4ee3-95b2-1255f2de3652@suse.com>
Date: Thu, 5 Jun 2025 08:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: add header guards to generated asm generic headers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506041605090.2495561@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506041605090.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 01:09, Stefano Stabellini wrote:
> --- a/xen/scripts/Makefile.asm-generic
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -32,7 +32,12 @@ old-headers := $(wildcard $(obj)/*.h)
>  unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>  
>  quiet_cmd_wrap = WRAP    $@
> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
> +      cmd_wrap = \
> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
> +	printf "\#ifndef ASM_GENERIC_$${upper}\n" > $@; \
> +	printf "\#define ASM_GENERIC_$${upper}\n" >> $@; \
> +	printf "\#include <asm-generic/$*.h>\n" >> $@; \
> +	printf "\#endif /* ASM_GENERIC_$${upper} */\n" >> $@

I'm curious: In what is now a0f56da94c3e I had to resort to "define" to
get the rule to work (including a correct .*.cmd being generated). I
can't claim I actually understood why things didn't work the "simple
macro" way, and hence it's unclear to me whether the way it's done here
will work with all make versions.

One further difference to that other commit: If make is interrupted in
the middle of any of these printf-s, an incomplete file may remain. The
cmd_xlat_h rule specifically uses "mv -f $@.new $@" to cover that corner
case.

Finally - is ASM_GENERIC_$${upper} actually correct? Isn't that the
guard that ought to be used _in_ asm-generic/$*.h?

Jan

