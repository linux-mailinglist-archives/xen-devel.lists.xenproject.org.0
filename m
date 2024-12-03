Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E178D9E1B1E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 12:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847978.1263011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIRDv-0005et-Ia; Tue, 03 Dec 2024 11:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847978.1263011; Tue, 03 Dec 2024 11:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIRDv-0005ck-FH; Tue, 03 Dec 2024 11:37:47 +0000
Received: by outflank-mailman (input) for mailman id 847978;
 Tue, 03 Dec 2024 11:37:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIRDt-0005VL-N0
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 11:37:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0344d2ab-b16b-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 12:37:44 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso784582866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2024 03:37:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599955662sm607383966b.190.2024.12.03.03.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 03:37:43 -0800 (PST)
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
X-Inumbo-ID: 0344d2ab-b16b-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733225864; x=1733830664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eJZM+UHf9Bf+4TYP3ZJ/KjCeoxpJHlhgAHhZPjXHN78=;
        b=do/WV5RAJSKVvJbc12RPg6M4K4uiglinEvU5Y2jvLmaUyyMbWAQjaGBPPc3R8OO+Y+
         7EP9vu9nKKvanYh9PT3R9O5T/cGXvmh4LZ8M0ODeiQPhKOJ5uhVP/WKMoEmLBVzzdfce
         34GrV/Dst1eeWN7n249vPyciZdFTzy4e9fRYWxJy1qBHBRZU6cKYFz9fs79MIRZvOi85
         Z7PARJ5vDo9/nXuwqKhFa/qaFxPKJmJ4id3UfkHwpw8ZwRm4S46ZpA86MwPgbc3vurdP
         0SNejJ/Sp/Sppa3X8apa1J5dgvQbh9HWd+VnxTgTca6XEiBdxLmIHQroZCX1hxaeUQKk
         +rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733225864; x=1733830664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJZM+UHf9Bf+4TYP3ZJ/KjCeoxpJHlhgAHhZPjXHN78=;
        b=H5WYJfvvi/7tcD+P4ACVl6jX3XLz5recQRGywVI2D4+MS8NhU/M9z0Dj+AQFaiESHF
         /0kckWsF+VmahtzQePpi2snSpQbX0Piv+FBYb8h5wqeYoyoUP8u9TsDtLDfVQEArBdmc
         FU1QHjAAd9qejH4P0GZq/Idk4aNPOhJQwnDsCjc1daz0r1lBdrzo+6+rPiW5V37Pc8gt
         sklIAeB/dtw5aFWIt22G0u5+KZuqfOupVuPkizrcsKnpx9rXAdz8sRp8Yqv7QWIvk3JO
         3z9lr8drmv8KTRQoRpizIUQE9J2ihbeEKQxlREg/NCXz/hKjy/je40bpZnWiNIuoFscM
         341Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIF+Frlu2nVNTWN88dQdiNgPe7503HnXvd/a3H78xi4i3OteXnlHLPYADkiiLjT0GOk4QiyuObdIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJsOsFB2TPvWE+He5J4yIiTEufdqfSA1JL77mzOo6lWBMHLuy0
	5hkiKirX545ixHZGGOAQUUTXrK3EhQFbCMBSsSINUsAtrRpIQQ/eyQPH7OnXUg==
X-Gm-Gg: ASbGncuxW9jLEBiuSUjrOCmm1iBRrSW51bed4gie0qyCwTmZxWyFUOX9zb8y3TI3g+d
	XtD6/wS4jXqpbTS59olRLWatx94ONKSR8hs3uQY9VlqrnlTlx4Y+bjbhlVtcncl+JkbjG8xGDh/
	vgWzgctRyP3n3H6QuQOTQnRch6vXQIS4CYUiDSJ5nKooBZZR+kMPoM4LXL5zpBu8h2VJgaxF0Xy
	RPySaKq/VLaMQlWxiG4WCobwLB3FMxBuOxVPeqOzAU/AMUAmeyErj5BPTTZ8pfgVw42ML7mBjFE
	HQAcDl2P28LNPBzqpYcYfiE0Eo8JdSSDg+g=
X-Google-Smtp-Source: AGHT+IHon4OVEqF/GM+y4l1CHbmYKI739FN7P590YZtPSeqcHG3Ou8BaBhmWCIAWAEoMg9G83eF9KA==
X-Received: by 2002:a17:906:32c2:b0:aa5:52db:eebd with SMTP id a640c23a62f3a-aa5f7daba8amr165197366b.26.1733225864216;
        Tue, 03 Dec 2024 03:37:44 -0800 (PST)
Message-ID: <0299582c-7261-4947-a2ac-bf3d62ccac14@suse.com>
Date: Tue, 3 Dec 2024 12:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] SYSCTL_numainfo.memsize: Switch spanned to present
 memory
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <10466e8c29b5f69774915bcf6562985c75e98bb7.1733224306.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <10466e8c29b5f69774915bcf6562985c75e98bb7.1733224306.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 12:12, Bernhard Kaindl wrote:
> This the 2nd part of my submission to fix the NUMA node memsize
> retured in xen_sysctl_meminfo[].memsize by the XEN_SYSCTL_numainfo
> hypercall to not count MMIO memory holes etc but only memory pages.
> 
> For this, we introduced NODE_DATA->node_present_pages as a prereq.
> With the prereq merged in master, I send this 2nd part for review:
> 
> This RFC is for changing the value of xen_sysctl_meminfo[]->memsize
> from NODE_DATA->node_spanned_pages << PAGE_SHIFT
>   to NODE_DATA->node_present_pages << PAGE_SHIFT
> for returing total present NUMA node memory instead of spanned range.
> 
> Sample of struct xen_sysctl_meminfo[].* as presented by in xl info -n:
> 
> xl info -n:
> [...]
> node:    memsize    memfree    distances
>    0:  -> 67584 <-   60672      10,21
>    1:     65536      60958      21,10
> 
> The -> memsize <- marked here is the value that we'd like to fix:
> The current value based node_spanned_pages is often 2TB too large.
> 
> We're currently not using these often false memsize values in XenServer
> according to my code review and and Andrew seemed to confirm this as well.
> 
> I think that the same is likely true for other Xen toolstacks, but of course
> to review this change or propose an alternaive is the purpose of this RFC.
> 
> Thanks,
> Bernhard

All of the above reads like a cover letter. What's missing is a patch
description, part of which would be to clarify whether the field is
indeed unused except for display purposes, or why respective users would
at least not regress from this change. What's also unclear is what
comments you're actually after (i.e. what question(s) you want to have
answered), seeing this is tagged RFC.

The code change is in principle fine, just that ...

> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---
>  xen/common/sysctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index d02f44fe3a..cba6d3cfea 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -316,7 +316,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>                  {
>                      if ( node_online(i) )
>                      {
> -                        meminfo.memsize = node_spanned_pages(i) << PAGE_SHIFT;
> +                        meminfo.memsize = node_present_pages(i) << PAGE_SHIFT;
>                          meminfo.memfree = avail_node_heap_pages(i) << PAGE_SHIFT;
>                      }
>                      else
> --
> 2.43.0
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---
>  xen/common/sysctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index d02f44fe3a..cba6d3cfea 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -316,7 +316,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>                  {
>                      if ( node_online(i) )
>                      {
> -                        meminfo.memsize = node_spanned_pages(i) << PAGE_SHIFT;
> +                        meminfo.memsize = node_present_pages(i) << PAGE_SHIFT;
>                          meminfo.memfree = avail_node_heap_pages(i) << PAGE_SHIFT;
>                      }
>                      else

... everything appears twice in your email.

Jan

