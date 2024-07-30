Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B2941281
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767747.1178445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmKS-0005iN-Ri; Tue, 30 Jul 2024 12:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767747.1178445; Tue, 30 Jul 2024 12:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmKS-0005g9-Nz; Tue, 30 Jul 2024 12:51:48 +0000
Received: by outflank-mailman (input) for mailman id 767747;
 Tue, 30 Jul 2024 12:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYmKQ-0005g3-Ml
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:51:46 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79b3b24e-4e72-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:51:44 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f04c1e58eso5899809e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:51:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad903f1sm642605866b.152.2024.07.30.05.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:51:43 -0700 (PDT)
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
X-Inumbo-ID: 79b3b24e-4e72-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722343904; x=1722948704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o8545QigfXVaF1KsEMarV5g9cqBKF88cQWB2WemE7S4=;
        b=fEadpkzRpDbpxVAIdzixIyzvlBNf3jKntADv/HyGsSwZ1YFSk0Kxd4ml/EVkbrSRH8
         WbhraS3xJt+llu8AK2cgx9QqLvCqTFdWHnNZCteYRodIXDvHfOo9xx7yvbPg1acZJ9A8
         n+pGoqiYChbt2J6/E7XNAP2LUzHSSs1h/4WJSMG04HUk6Bx6+IBrRBuq97Owy/ajrgGq
         dCN671Fh2xbzzZyJQucQ3Dw6GoO1mF29/p95w9HymrXJbTmQPLYZhsGgONZ6wwyekeCX
         Lczqfjq6vfoVM5FVUclBBb+sJXU59EtVLQXKqKcxVVEVjuqWQtZhpeNyOy0J+mhRyAZW
         oCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343904; x=1722948704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8545QigfXVaF1KsEMarV5g9cqBKF88cQWB2WemE7S4=;
        b=A5DG87IF6rAiFewuiNmlKh8d6pygU1+djEDTe1LZ80dTzH2xw+0eiDUyXOoub7yJlw
         cMqqzV90nD35I9wemmEQUkUwF/hteWWF2y7Bas0pLyF3GYYeLFvZF/8bbetlNyObcjYI
         qqyF19xWOzcXSN42fT2zX9Ish+wSINhNFwRYKc6lmzaOjzGhCH6gQXz9OTv/xmmWBGG2
         eMW+Mtxd6oNtv0ipvL7oh1qoxqgvAkbj8KgPBcV14koMFE9YDIKrIm4eSe7e10vag0m/
         VSknCqXXptlGqyiRkKadppbjN1QA4j7dBNshLtyhaENho7rEkQRfi7uOxJSghaTKKnzv
         oRgg==
X-Gm-Message-State: AOJu0YwDyQkBf02EUxpEaziferVVITRIQ5br8jz6H/OcI7198KD9CqJB
	j6NcB5wQ+Fxzet94RVzWJt0oezh/mHogRqNeeqL1DwtKVIhw5aCOyCPnzBuLEw==
X-Google-Smtp-Source: AGHT+IEgS2i0UR+EovQjDxGklbjM5NMRlUmTJdDr7LuIpCHCL/afAcfgI+p2wP7D7rhRemUvTcpl2g==
X-Received: by 2002:a05:6512:68e:b0:52d:3ada:4b6b with SMTP id 2adb3069b0e04-5309b269a7fmr11197903e87.1.1722343904050;
        Tue, 30 Jul 2024 05:51:44 -0700 (PDT)
Message-ID: <ece36e0f-da36-410d-b785-ee80399097e2@suse.com>
Date: Tue, 30 Jul 2024 14:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
To: Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
 <191036ec4af.b419d861552194.691516900344490021@apertussolutions.com>
 <67f1bcb7-8924-413f-a8ec-6a01f90e7836@suse.com>
 <191039f639c.eee6b8a8560183.5020758529681496430@apertussolutions.com>
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
In-Reply-To: <191039f639c.eee6b8a8560183.5020758529681496430@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 14:31, Daniel Smith wrote:
> ---- On Tue, 30 Jul 2024 08:04:09 -0400 Jan Beulich  wrote ---
> 
>  > On 30.07.2024 13:37, Daniel Smith wrote: 
>  > > ---- On Tue, 30 Jul 2024 06:57:08 -0400 Jan Beulich  wrote --- 
>  > > 
>  > >  > XSM is a generic framework, which in particular is also used by SILO. 
>  > >  > With this it can't really be experimental: Arm enables SILO by default. 
>  > >  > 
>  > >  > Signed-off-by: Jan Beulich jbeulich@suse.com> 
>  > >  > 
>  > >  > --- a/SUPPORT.md 
>  > >  > +++ b/SUPPORT.md 
>  > >  > @@ -768,13 +768,20 @@ Compile time disabled for ARM by default 
>  > >  > 
>  > >  >  Status, x86: Supported, not security supported 
>  > >  > 
>  > >  > -### XSM & FLASK 
>  > >  > +### XSM 
>  > >  > + 
>  > >  > +    Status: Supported 
>  > >  > + 
>  > >  > +See below for use with FLASK and SILO.  The dummy implementation is covered here 
>  > >  > +as well. 
>  > >  > + 
>  > >  > +### XSM + FLASK 
>  > > 
>  > > To me it would make more sense to say XSM FLASK Policy than XSM + FLASK. 
>  >  
>  > I thought about using "policy", but then deemed that wrong. The "Flask 
>  > policy" is what you load into Flask. Whereas here we're talking about the 
>  > code actually carrying out what such a policy says. 
>  
> The main issue I have is the "+", so I checked how the different security models/policies are referenced under LSM. The documentation I reviwed lists them as modules or security modules, e.g. AppArmor module. How about one of these combinations, FLASK Module, XSM FLASK Module, or FLASK XSM Module?

Either of the latter two are fine(ish) by me. My (smaller) concern there is
that the M in XSM also stands for Module.

Jan

