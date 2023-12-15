Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280C814790
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 13:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655089.1022752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6tk-0006RE-L8; Fri, 15 Dec 2023 12:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655089.1022752; Fri, 15 Dec 2023 12:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6tk-0006PA-IL; Fri, 15 Dec 2023 12:02:32 +0000
Received: by outflank-mailman (input) for mailman id 655089;
 Fri, 15 Dec 2023 12:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rE6ti-0006P4-CH
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 12:02:30 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1ddc58d-9b41-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 13:02:29 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c9f85eff28so7545951fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 04:02:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x3-20020a92cc83000000b0035d70101e82sm4810511ilo.42.2023.12.15.04.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 04:02:28 -0800 (PST)
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
X-Inumbo-ID: d1ddc58d-9b41-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702641749; x=1703246549; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTDBItIy0DCdfJP3rlkoJxj1NgDtoU20JNs5o4WyJU4=;
        b=MuQdt5W8GIjnXw8L+PMaH7gNlVeV9NDugJd6K5y4Qea1dQ4sV6qv1sET6URa391cN1
         CFItGTqVCqTol0VvYzjJ8JtImr5lgz1mC8FTW/7YlKezqsCAajGZmB46TWdvlQKIO8pm
         s5ZyQqjKZVB3PnFgfSXEAkUS9xKdXUAj0zQMDayuIBBeaelVIxwYOV0vK+a8rLyVswDi
         RpzOq/OTO44GL6sLQ6uP2XgnbdWph5XCYQ/gEZGAYjtmaq9jZaWMd184YPFZ86OFfrzA
         omxKrLoHvvyLb4DWimSQXVIkKgznHBwGWa4jIzOlG8YU9sLhEA7jSJk4ANG1BjlZSWBi
         f9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702641749; x=1703246549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTDBItIy0DCdfJP3rlkoJxj1NgDtoU20JNs5o4WyJU4=;
        b=NVqXj5z/aQWoIhRX65mjwRlAWt9GLTYT1DGFqvGfdK8HUKF44u07aD03Iz1ZfC62Ke
         xSCmumJWjwi6a3EFulStubcEMve8bZVaI5NsZ7DjmLJhNLwgzIg4Jt309Sr8VfISf4j/
         tmAS215E9+T2gIw959zv/Gtg/QESxdyVY/ELGdAZJQPzonWkQkvi/+RwrbLDyCzmRA6x
         i3F5tN2wjp28fdooD+6g+JWOkM9hgAW3FnLA84WnqwphOGflrN7HNP/OCqPlb4+mWXLz
         3YLmGzmlgSHI4weSssT6iScxAEceJrs0p7QAahRnbu8knyTvTz/M8DLyYx4VUcvWo/b1
         zCOA==
X-Gm-Message-State: AOJu0Yy1Yc8hsWR5aYFu4b42b4An/HH7AzHZd7N03zY1b1Yq+pCcG0+e
	gkSuSXftE/0VX9mdO0gI+Hgq
X-Google-Smtp-Source: AGHT+IH2NXjsInDWm9fy2eTCyLRdheeeF8kCXkYtNl/lmQB5PeKlIp+LhpyTi7S15VrZG2meBkfgyQ==
X-Received: by 2002:a2e:a808:0:b0:2cc:1ec0:a75a with SMTP id l8-20020a2ea808000000b002cc1ec0a75amr8621669ljq.104.1702641748741;
        Fri, 15 Dec 2023 04:02:28 -0800 (PST)
Message-ID: <cc41e7e9-13cf-48dd-a0a0-3e0d9d9b4051@suse.com>
Date: Fri, 15 Dec 2023 13:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix C compatibility issue in mini-os
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>
References: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 12:59, Florian Weimer wrote:
> The cc-option check always fails (that, it picks the second option
> unconditionally) if the compiler does not support implicit conversion
> from integers to pointers.  Just drop the initialization because it
> seems unnecessary in this context.

Did you pay attention to ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -21,7 +21,7 @@ endef
>  # of which would indicate an "unrecognized command-line option" warning/error.

... the comment the tail of which is visible here?

Jan

>  #
>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> +cc-option = $(shell if test -z "`echo 'void*p;' | \
>                $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
>                then echo "$(2)"; else echo "$(3)"; fi ;)
>  
> 
> 


