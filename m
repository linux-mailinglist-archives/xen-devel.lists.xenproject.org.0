Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7876D08855
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 11:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198519.1515438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9dl-00037I-0I; Fri, 09 Jan 2026 10:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198519.1515438; Fri, 09 Jan 2026 10:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9dk-00035F-Sj; Fri, 09 Jan 2026 10:22:44 +0000
Received: by outflank-mailman (input) for mailman id 1198519;
 Fri, 09 Jan 2026 10:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ve9dj-000359-Mv
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 10:22:43 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2170e00c-ed45-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 11:22:42 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-432d2c7dd52so1105874f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 02:22:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5feaf8sm21674096f8f.39.2026.01.09.02.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:22:41 -0800 (PST)
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
X-Inumbo-ID: 2170e00c-ed45-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767954161; x=1768558961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lsCqmuzqktYxl6WeQXdwoJ8q3loePMtShd3yE+Se1Bs=;
        b=aWL47M4qngho0b/1+xZptQuXlmpmZ8wUdXzw50VxPMQ3w7Rlu2z5+9/sKNqDi4OC+G
         2M5XlyHcJljCuY2RuIkLzjMtI6iWc1yGVDtg4pSImyI+xDdGsbzd5i9G88AKpIqrefvw
         yZPASfne7OKZTDIg38m5Hu7HAaZ7oV+3zRnTqmdO6V135XZaOXIzH/9KBONlxw/XBEVw
         HWzeKpisAkyBH9+rF1rjWqi8dzuxpNYf/a+HOPuoBa/3GlT7adNCp1XnMwGitfTlPxIL
         dt949hk2wlZLlxjSLeSu7psFBMhRp8AoDFg+EoRw7bgUXO5DMbS6IZcszOV/+CWtLHAS
         JIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954161; x=1768558961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsCqmuzqktYxl6WeQXdwoJ8q3loePMtShd3yE+Se1Bs=;
        b=I6Vb4AJIcNBN5XWxZ5/aBhyOKj8cbIbZ0eJjdDH01YxiaJP1Ww3rVO/PJmTBSiA0ss
         HctX5VzaRxA9XphPvDAtxj23vTTTEOGzgsupo9CWFQuU6ARC+BGc53kh7trqb3YhixrV
         ebfAEkynT+HWPmLzDsYqlMbGoIoPOKiipYVA4lVL9yljzKZaQ0XbSb1AfetjyoTIecCU
         5WTlnMwmmd7ICE1m7+EPObEUpu4b/O34orbp4QEGd+I1InjQD3W0WvwKe5uDqIRXTMON
         8DlTI7TKP5arB5TWSD1RcWg9WgeG4qc7kxKI5V0Y2qAZLvd2bsKMaZK8fO+UR3n8yQ7W
         GEhg==
X-Forwarded-Encrypted: i=1; AJvYcCUtu/6rYEVRfZjplQ4i1GteOGZ4oAa2HwE6jmwZZPBuKWbkn6KQO48gGGQuVO18gHMiIoHk2YPvdX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuTZ61aFHukRI1Q/ODU6/3ZI0/t2MWt2j9fSjEE4AcuG+mx7GT
	OHMf4IZ+T9jCjqStebu0++Wol3fUBv268yVjcXfpGlMuMNGhpwvVxAe83KNSuIpvPA==
X-Gm-Gg: AY/fxX5LI32cvPM9vTKfJBbhHUzWn2Xkxj4HuQchFM+xIGWjqFiBXY+8aAeCRafZ6Oo
	sSSKKnZb6Pxw1gL+BDzipIPJ/dYe/fBtoLUvzylS1GQTARzUTtLLE5C8ZLxR8ri1Elzs918yWTr
	XmTh6+jTXSp5u2FmdhX2/PuxQrurIPtoIg2intRAyb+cFU53L5sR8XFYkvkKxYszZ5LHeAREkko
	AQ2gCrbzmWy6wOCGWDiEIjU2Ek1iM6Jk3pJLfgDe9oLEy0DVyuK2AoIUcmOg+6B6+8NZ5C2cE80
	eLyqgS0NvP2GW6NVzUyg9hdk0pVEHZKxm0Cknw5eDuJYVhxQT2uTS5NHqtOXom+t9UVKsmtYOWI
	D5RMoFLQCyukE/qkxvEZN36GQFTrZPwqA58grAjuRBIrKuV2Zv0H/0dOmrFIZ6A0RGj6lW9RJVA
	fj+KSxE0mq0ISCdpyaA8B9xTUi/LyUod9X38fUB4z+HRLkip6dnzUp1LZGuyJk+MiJbQXHtEkoq
	nU=
X-Google-Smtp-Source: AGHT+IEDWjj5W7I7H/yMMgwr4pePoGQeLQ1B4bXcP3lo+7E9p9gJLPEVketVHnd5GBpLmVmnyEwnIw==
X-Received: by 2002:a05:6000:2584:b0:432:5bf9:cf22 with SMTP id ffacd0b85a97d-432c3760f0amr10665727f8f.3.1767954161301;
        Fri, 09 Jan 2026 02:22:41 -0800 (PST)
Message-ID: <a8d09b82-3013-4476-b358-08b5fdc14cf1@suse.com>
Date: Fri, 9 Jan 2026 11:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/mm: add a NUMA node parameter to
 scrub_free_pages()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-2-roger.pau@citrix.com>
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
In-Reply-To: <20260108175536.82153-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2026 18:55, Roger Pau Monne wrote:
> Such parameter allow requesting to scrub memory only from the specified
> node.  If there's no memory to scrub from the requested node the function
> returns false.  If the node is already being scrubbed from a different CPU
> the function returns true so the caller can differentiate whether there's
> still pending work to do.

I'm really trying to understand both patches together, and peeking ahead I
don't understand the above, which looks to describe ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1339,16 +1339,27 @@ static void cf_check scrub_continue(void *data)
>      }
>  }
>  
> -bool scrub_free_pages(void)
> +bool scrub_free_pages(nodeid_t node)
>  {
>      struct page_info *pg;
>      unsigned int zone;
>      unsigned int cpu = smp_processor_id();
>      bool preempt = false;
> -    nodeid_t node;
>      unsigned int cnt = 0;
>  
> -    node = node_to_scrub(true);
> +    if ( node != NUMA_NO_NODE )
> +    {
> +        if ( !node_need_scrub[node] )
> +            /* Nothing to scrub. */
> +            return false;
> +
> +        if ( node_test_and_set(node, node_scrubbing) )
> +            /* Another CPU is scrubbing it. */
> +            return true;

... these two return-s. My problem being that patch 2 doesn't use the
return value (while existing callers don't take this path). Is this then
"just in case" for now (and making the meaning of the return values
somewhat inconsistent for the function as a whole)?

Jan

