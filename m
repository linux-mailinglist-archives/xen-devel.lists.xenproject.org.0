Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54740A3C033
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892934.1301874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkKq-0007ct-3D; Wed, 19 Feb 2025 13:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892934.1301874; Wed, 19 Feb 2025 13:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkkKq-0007bN-0O; Wed, 19 Feb 2025 13:41:56 +0000
Received: by outflank-mailman (input) for mailman id 892934;
 Wed, 19 Feb 2025 13:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkkKo-0007bF-13
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:41:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46e2ad9b-eec7-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 14:41:52 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-abbda4349e9so92455066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:41:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9da9f0desm576190966b.105.2025.02.19.05.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:41:51 -0800 (PST)
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
X-Inumbo-ID: 46e2ad9b-eec7-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739972512; x=1740577312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KRcmevJQB1pwsT/GUlPR0h4DVWUa2zdjfeLcLS27WK0=;
        b=VF5xU4isO4c6i6i9WZqBmSoIT32hj3ILveJpGP4XeCGJ6E/nyGKCz2Awn1Y8dXS/K1
         OrxrDcjXkIZ3Ws6cAbp0Mh2J+iwhZ8EqFI8YriwgnMeUWzHgQsJOCeHcZt71fK9hrIZg
         lqmo89FwtUd4MoPHzGTstCEwEi1r3FqUD7kFevyC/50NiLHjMMfev90AXrgDsNSX/i7Y
         Whj5fugEED76boIr6RS0uFCGKTVhDw7KeO12AymJMeM9tbtXlfUa52IQ7VXboLIHVgcx
         uuLsCfOmi5Q1z7JV6zb0FG0PX5YHz9Rnu+GXDG5ifh7y5aRPaypNLhJ6uGFRGAUD/Yqo
         r6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972512; x=1740577312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRcmevJQB1pwsT/GUlPR0h4DVWUa2zdjfeLcLS27WK0=;
        b=G8cJaDU1ct/29KhlxLTQ4vbf/MHevNuRCb1Q7mGieUNPRwIJfRgzSztP2gUQiw5xlL
         EiS5CtD4h0Q0w82G+pZoL4bFrw66EL0aj0ZJm11c7hZe/9TODH/Lq8OHV9wmfMPylbyD
         ynXUQLbEuh5lxbW9hjaeHcLoFKDKhpRoh9/Xnw0UW8RCJozem7ZeEvxH+dSQw/GtTQ+i
         qojBaZGHGkw/X9HChuAno92b29wMj2UAfs2fY6iN4+WV1I+78+rvUCg+2vPlXdDtOT8p
         sk8eflSUJqLQR99c566riT98mjj7RrHDqBtIwImmKYhj7Wq4gFxs+HLldNzeL2T5YKGk
         Y1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcQIg7uHrc8FoRM/GK/UDAeV2IfH/JrP692dMSqStvKElvXzailKMXxjvrnpSO/EJ8X5jbkvRNreY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqvwFc+VuNRjsR9/LaoOx2ZpxOdKyTVOFOAPdOPfcdmGnMVtIy
	0AJQVtKNcOsIRLAlo5BawYcKgX+azBvK/4AZDiq9bIynxnuKUCgLG2vzqLQrlQ==
X-Gm-Gg: ASbGncvBF4aN4WrnMuDLG9MrWAAFqomVEH0IDdunwg1ZyL6zaHAUeEamWtEeWPjzOxm
	MHPSNHfC1p8iiunK/YInzu7OqeBFmBCR642f2vLPm9FcmV3YJL8JRx6Vm62WpNYrSKkXaOndo5A
	OybNTH5NunguyofM1ADewrdK2knMVXBygJyr/isayEvuvc5m3S5sR8c4iBP5+sjWOyYLStnftHX
	Fj83kVGqEBBTrr4s7XUP6mgi/EMefmCqlSnGdCFTJKHlRr8Q+jF4y4kcrjxzhuehJvMzg2OcNPA
	/XJEZNeKCp7svwU5ourqB6dFhsbUCmNdyJbOpreyHsDuaahzilVUmf/7BHGuRztY1cQNz/uFPQh
	4
X-Google-Smtp-Source: AGHT+IENbUvC3tRLoI/Kn9wUK+IyVSRQAtDdUeeIWARnZtDcdemdlhwLWzKwE4EqEuigmD8Cw3fnxg==
X-Received: by 2002:a17:907:2d22:b0:ab7:dec1:b353 with SMTP id a640c23a62f3a-abb70de289amr2089809566b.49.1739972512165;
        Wed, 19 Feb 2025 05:41:52 -0800 (PST)
Message-ID: <cdcdab1c-f19f-42a4-820a-bd35dbf4ab28@suse.com>
Date: Wed, 19 Feb 2025 14:41:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/console: print Xen version via keyhandler
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250217213253.2067015-1-dmukhin@ford.com>
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
In-Reply-To: <20250217213253.2067015-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 22:33, dmkhn@proton.me wrote:
> Add Xen version printout to 'h' keyhandler output.
> 
> That is useful for debugging systems that have been left intact for a long
> time.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Hmm, wait - there's yet another issue:

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -129,6 +129,10 @@ static void cf_check show_handlers(unsigned char key)
>      unsigned int i;
>  
>      printk("'%c' pressed -> showing installed handlers\n", key);
> +
> +    print_version();
> +    print_build_id();

Here and in console_init_preirq() you expect to be able to call the two
functions, no matter what the tool chain. Then ...

> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -210,9 +210,28 @@ void __init xen_build_init(void)
>          }
>      }
>  #endif /* CONFIG_X86 */
> -    if ( !rc )
> -        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
>  }
> +
> +void print_version(void)
> +{
> +    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
> +           xen_major_version(), xen_minor_version(), xen_extra_version(),
> +           xen_compile_by(), xen_compile_domain(), xen_compiler(),
> +           xen_build_info(), xen_compile_date());
> +
> +    printk("Latest ChangeSet: %s\n", xen_changeset());
> +}
> +
> +void print_build_id(void)
> +{
> +    /*
> +     * NB: build_id_len may be 0 if XEN_HAS_BUILD_ID=n.
> +     * Do not print empty build-id.
> +     */
> +    if ( build_id_len )
> +        printk("build-id: %*phN\n", build_id_len, build_id_p);
> +}
> +
>  #endif /* BUILD_ID */

... their definitions cannot be inside an #ifdef. They want to move up:
- print_build_id() between xen_build_id() and the #ifdef BUILD_ID,
- print_version() yet higher up, perhaps after xen_build_info().
I guess I can do so while committing.

Jan

