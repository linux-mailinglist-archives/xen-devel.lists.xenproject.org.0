Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96D855E80
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 10:49:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681455.1060226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYN6-0002eE-45; Thu, 15 Feb 2024 09:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681455.1060226; Thu, 15 Feb 2024 09:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYN6-0002b2-13; Thu, 15 Feb 2024 09:49:36 +0000
Received: by outflank-mailman (input) for mailman id 681455;
 Thu, 15 Feb 2024 09:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYN4-0002aw-CJ
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 09:49:34 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 854f354a-cbe7-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 10:49:33 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so374814f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 01:49:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n12-20020adff08c000000b0033cf60e268fsm1218247wro.116.2024.02.15.01.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 01:49:32 -0800 (PST)
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
X-Inumbo-ID: 854f354a-cbe7-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707990572; x=1708595372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVgEOvZrCtGQjEE1SZTaMaOUll3qd7mZLtDI+zzisLQ=;
        b=ARB3JBLkGlgqLtIx/tWqnxJ5wbtgxv+uKX95xL8CsT+4R2R0jKyrf3276do8efDBvh
         BwizhIghZ2BfgAF4T6k9+RWqXK6+vwEIpR1iIKayOWXC9Z3RrJrc475wyW8Z2v0vdg8C
         GkWJ7VXVsr7rp04/4t1st60AI53yCmr7f8jWzmJGZ89zissRWYQ8P+Zp74hqZKMHecBM
         gCqnZ7CsG2/igV7ijsB/qaknzl9eVZ76cQEAIA+JjhV74YBLhB4/r1Se/LFBGn2AE4o6
         erVKRNRUBTH3O3w0/1yrFIvVCP9a4mpxhr1KNbXE5KXdF6XedM0+ChMpoZ+6U7/IUwp2
         bPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707990572; x=1708595372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVgEOvZrCtGQjEE1SZTaMaOUll3qd7mZLtDI+zzisLQ=;
        b=BttrbnpCS5xJbpwCPw/lEEO8usSUsok3xhj0JKEl37RsLUbAnot93yC4W2HWaNfo17
         qvR0AyBORWMvqOOs9FOO6O98w+HYxTCWQdfTTw/ebPFs63PowT5ootuH2PoOzqUBDWot
         4s1lsEEYUO5HYkQti2g7p0qsPGh1nOslOwM1NxA1Hpkkz8H73KTnbm06rfg/f3w7AxdB
         dEkY2OyYGr43xnkJ4x7K0nq4yo1/VzArqGuhFAkbWd9JYxod5aIzCQrX4MBFPJPDGjw6
         VwWLtTaefJmtHpq09WKXL++2JksWfn5bUVaiKpIEEbRVrN/og4cchgiP1ktr2D7O7dQN
         K3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdUWqg1jO8eDVzijkVxUAlLE8D+o9zMu4Vcl3A56g/BzkOyScVW0fyMxkeoOLbKs5oGrrvH24EjxyCuqdfGdHs+IBBDdjVTQpS11IF7jE=
X-Gm-Message-State: AOJu0YwhxznBsuVqOEl7+pW/sv/RlwxO3ix/YpX8OJvKrt703NU9jVXB
	cdNiqmC0miPnNO280dljS/3Gum1BuEv3hdlpp3DTP0a52AbgDksWJS1roL2nQA==
X-Google-Smtp-Source: AGHT+IFfKANbjMcmyz6TEXKKZZSJIdOoxdNcPrqEzD19b1tjxsq8Zt6GmxV0lox3iv29DgcJp8qKMQ==
X-Received: by 2002:a5d:58cf:0:b0:33b:3b86:b845 with SMTP id o15-20020a5d58cf000000b0033b3b86b845mr758626wrf.58.1707990572575;
        Thu, 15 Feb 2024 01:49:32 -0800 (PST)
Message-ID: <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>
Date: Thu, 15 Feb 2024 10:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: anthony.perard@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240215093002.23527-1-roger.pau@citrix.com>
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
In-Reply-To: <20240215093002.23527-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 10:30, Roger Pau Monne wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -358,10 +358,10 @@ config: tools_fixdep outputmakefile FORCE
>  else # !config-build
>  
>  ifeq ($(need-config),y)
> --include include/config/auto.conf
>  # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
>  # changes are detected.
>  -include include/config/auto.conf.cmd
> +include include/config/auto.conf

With the - dropped, ...

> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>  # This exploits the 'multi-target pattern rule' trick.
>  # The syncconfig should be executed only once to make all the targets.
>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> +	rm -rf include/config/$*.conf
>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig

... is this really necessary? The error status from the sub-make is ignored
only because of the -, isn't it?

I also don't really follow the need to re-order the include-s above. Their
ordering ought to be benign, as per make's doc stating "If an included
makefile cannot be found in any of these directories it is not an
immediately fatal error; processing of the makefile containing the include
continues." While the description talks about this, I'm afraid I don't
really understand "... the .cmd target is executed before including ...":
What .cmd target are you talking about there? That's merely another
include (and what is included doesn't provide any .cmd target afaics), so
will be dealt with the same as the config/auto.conf one itself.

Jan

