Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F47C575E6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161175.1489181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWLR-0001dl-9l; Thu, 13 Nov 2025 12:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161175.1489181; Thu, 13 Nov 2025 12:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWLR-0001bl-6F; Thu, 13 Nov 2025 12:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1161175;
 Thu, 13 Nov 2025 12:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJWLP-0001aD-OQ
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:22:31 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c230061-c08b-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:22:29 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so1444035a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 04:22:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f961bsm1406684a12.14.2025.11.13.04.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 04:22:28 -0800 (PST)
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
X-Inumbo-ID: 6c230061-c08b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763036549; x=1763641349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jm0gTsTwjScTg9mbFP7NxCqhw2blGsri3tA9v7qd8Lg=;
        b=UCbSdq8cFJO9THsIhf5btpxJDll1G8tQhXY5ao7WUnq+lK82Uc+6kJpZWJmRIlSOdQ
         GE44dz8PRMlNwkcOvtTEdygn7qQOE0y3m8S3kouoXxrivsSDglkhd6QXjGXqGpiRgil1
         9mWum204fy8NLDRf+1cDlDpC17cgb67E7RP9kBCehrii3wztabAxBeGcEX06E+ywORKp
         /RNZ+uaZgAQzI8tI/havFD2oKmUNvisoav6cfKF2ENiAKO9Wra++vcLNwuaFSV/lGi7+
         Klq961mZvZRIYVROsWI9vuQI3J08bBcumhst7oRp/JjUyeV4Q+6PMET//mFJEnPSW9dO
         vyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763036549; x=1763641349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jm0gTsTwjScTg9mbFP7NxCqhw2blGsri3tA9v7qd8Lg=;
        b=GlPd/+IYI58DbcmbixHwvmrcVvS1ljLx6gIH7cnVM5PU8UymSnDDUzjRbf3beJrF9u
         ZcoZGUMrbGk0JhCGr465Xq+oOzKfbZWAGxlAddVNObGj0hY4fQXCWd3xmW3AFK9q6fO2
         0NoQ0l20MBG0InMCrM+rfEXO+CMh2+2mrlqic0LjueMNO9kSWp+kKWnSxUFZR+YjxlHa
         rqWnjdV8iMxtcUYxESpI7e2AYbJZOuZpeOH1JeukvElrydOHeXhY/ERKpOhO7d+YsF0F
         f7vsDCfhskTAua2HoUymoSBPAYlDYjh6SfQzFLIJT6wq8vg0rLw7VQRQJyTDIWy5pfQ8
         aKnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0t1qmDHPHThEhdIbNnBiX1XCI6gS/0T2U6d6v3nZLcoyC2jxttUsLeB/q1urbTqqwvzmnYYwvtng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLr8kKxY9mxLe5oBaevbJYFH8Up+FpsvcN2lvCV4ZpNeMoJufM
	wQzB3osdRSFUa/0zyIp2Xry2TLnFF4v6naSMjn14YUOhdrwWhTbaofjb3uvsxDxXOA==
X-Gm-Gg: ASbGncvS9NOAWwbDWzpA+2GEjLmdG2qVxmIHVhbPSieA92fiDVrD37H5z2NCvGhVleo
	jzMZGyTH1aKuXVU+D2b3SGyQyRztH8p8MB8qp5vWYyLnX4juvk9kw5VcZJQQBUQUVSfu77YOUZS
	4zfuTeUx22Eou+1JC3gGcqB1bTaypKlu1o05C2xIFGuMTXg+jge/uuYJWrYXUYIvRbJb2iolfgz
	Qt/SjIcrFgNJ0yNdV6KXEhZNKyJfADnOsvOt22pQ3PfaswsB+RHBzdXfOmODVCovz+pE+SoNL9s
	mzgHb+HCfdcJKTybMi6hqZWPfpsqx+sSHd5DAPaI8IAyJGJ4T9l5SbYI5L4yyJaBow2pWGT+cfY
	QOP//cMkciTmG3/7Us2XtMMxAP56zWWDtaDEgWUxDRev5Ii4EV2+HNI7dBwa63DY9TC3YL7wAR3
	p/kFw1VsEcQh8vVzvWdCOcZfH3ilSMYSDw27rC7lHe6hWs8RubkUoemx8G/9sAO/G+GHJ6Orgq/
	DY=
X-Google-Smtp-Source: AGHT+IG/wI/VI+lnR2BBEVZqL2sHhkVhgpNwCcXbulrXP9Hdv8XMKxiO4++03DWMB4xtUe8l9heCBQ==
X-Received: by 2002:a05:6402:51c7:b0:641:8d6b:88cb with SMTP id 4fb4d7f45d1cf-6431a56b637mr5650314a12.28.1763036549129;
        Thu, 13 Nov 2025 04:22:29 -0800 (PST)
Message-ID: <da0d003e-a593-4b40-ac79-c889a6be683f@suse.com>
Date: Thu, 13 Nov 2025 13:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/5] x86: hvm: compat: introduce
 vcpu_is_hcall_compat() helper
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-3-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111175413.3540690-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 18:54, Grygorii Strashko wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -311,6 +311,15 @@ struct vcpu
>  #endif
>  };
>  
> +static inline bool vcpu_is_hcall_compat(const struct vcpu *v)

Does the vcpu_ prefix really buy us much here? The per-vCPU aspect is already
conveyed by the function parameter, I'd say.

Actually - is a parameter in fact needed? It's always current afaics. (Then,
if the parameter was to stay for some reason, it would want naming "curr".)

> +{
> +#ifdef CONFIG_COMPAT
> +    return v->hcall_compat;

As long as you don't remove the struct field, ...

> +#else
> +    return false;
> +#endif /* CONFIG_COMPAT */

... why not

    return IS_ENABLED(CONFIG_COMPAT) && v->hcall_compat;

?

Jan

