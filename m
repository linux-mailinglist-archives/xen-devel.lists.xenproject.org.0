Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0176846903
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 08:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674808.1049983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVner-0008Q0-UP; Fri, 02 Feb 2024 07:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674808.1049983; Fri, 02 Feb 2024 07:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVner-0008Mo-Rc; Fri, 02 Feb 2024 07:08:17 +0000
Received: by outflank-mailman (input) for mailman id 674808;
 Fri, 02 Feb 2024 07:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVneq-0008Mi-U9
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 07:08:16 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5c07227-c199-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 08:08:15 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so245034366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 23:08:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e25-20020a170906045900b00a3595d6c358sm565046eja.36.2024.02.01.23.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 23:08:14 -0800 (PST)
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
X-Inumbo-ID: d5c07227-c199-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706857695; x=1707462495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qut6hrSVzJQhMvY4HslmBnFgt2PyOl+xHe7+bdJSOB0=;
        b=YmzKSraLy0CUgF5772CygelCgbswZrSjwASKyYg+fYjOLs2ilZDAd9iIMJeOd9LIkL
         JnbRBCdq8nxsqnMTJV0th4wKs9oDtMbBDPwbEf+rVUozcb4krsBj6WMqXHhlOrZGJ6mn
         tl2+7N0BEq8aNgi3jVP1p0tADJvrmYD8uvaXeJrLyj5X+aQWtcFkCzHKQDLq6/ZEOOa+
         0LPdTCNx8p1vM2yPPOrn/nHncmX8dW/uct40fqAAuZzVic5xK7LMxVBP5N+bwaspXLFc
         IeBLTqPb+ZM6+UdyHmgXrPNcXnGjRX1+TMr+fVRN/tNyUtV99mqGrxldRgzDu86H5PBp
         bS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857695; x=1707462495;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qut6hrSVzJQhMvY4HslmBnFgt2PyOl+xHe7+bdJSOB0=;
        b=SxqRd7lEguaMINR5zpjgfUU5lKx1OorS8f+KQyT0OKQwA/NkC3EZSyp42Z1YFzHLad
         mT9SjEyPP5FLYdvvqzouLJV+jGtCznRU900OT9h48rDk0qOQsrm42OHF/GCwpz9CSLSZ
         ZcmdSecIT50Gsotm0CUx1JI6E8WmVNv3vdntgA/aCreBZOwqpek55Dk87y0PFycoI4JI
         mtBXd0p0wUCCn+Udb4qMeJo0TB3KTO50H6FaHLD2OcOgICClSRZ8cD5yJvYRHDoNd8Eh
         5J0OsdnVHRyfnUhR/5ex/TGCTf7gV23EmRXMYG0RqGxs+b7+tNgy9j+zvxu4CUOU0JGX
         L8lA==
X-Gm-Message-State: AOJu0Yyg8Run4vQxzUMJNJ9v7YkOH73qW/XZWZixplYArWmFzXpPy/K8
	SAuRki9hY74M+jDNnwlbTBu17ZUVDeO2XHbh5qQLa3gbHON3OFKu0zCTvXXBeQ==
X-Google-Smtp-Source: AGHT+IF8QUpHOuWGL26Obv9O3MUPTg9JAFlAEzuov8NWx6XZwsj8bBFrGCfH5gDhYcQegapQChvSMA==
X-Received: by 2002:a17:906:1b57:b0:a31:2119:90d7 with SMTP id p23-20020a1709061b5700b00a31211990d7mr4828947ejg.38.1706857695063;
        Thu, 01 Feb 2024 23:08:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+wUiKxQTdHpr+cTlfe/Zp7o489Qh6xsY2+6KaAXjdb+DSy05eBkT0eYtDuE+W8pOwslGeewWtxtCTVkXuoiUAzVAComsNRuh17kgWCPfVRN9hOWN+2Ut7mRA+hpjVpoCHqaY8mBm46dfn/IpbG3J1
Message-ID: <578a6845-6046-4d15-88a8-8a34936095a7@suse.com>
Date: Fri, 2 Feb 2024 08:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] x86/guest: finish conversion to altcall
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65fb766e-ab5a-49ab-a904-01ee9711d42d@suse.com>
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
In-Reply-To: <65fb766e-ab5a-49ab-a904-01ee9711d42d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.01.2024 10:31, Jan Beulich wrote:
> While .setup() and .e820_fixup() don't need fiddling with for being run
> only very early, both .ap_setup() and .resume() want converting too:
> This way both pre-filled struct hypervisor_ops instances can become
> __initconst_cf_clobber, thus allowing to eliminate up to 5 more ENDBR
> (configuration dependent) during the 2nd phase of alternatives patching.
> 
> While fiddling with section annotations here, also move "ops" itself to
> .data.ro_after_init.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I ask for an ack (or otherwise)?

Thanks, Jan

> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -207,7 +207,7 @@ static int cf_check flush_tlb(
>      return hyperv_flush_tlb(mask, va, flags);
>  }
>  
> -static const struct hypervisor_ops __initconstrel ops = {
> +static const struct hypervisor_ops __initconst_cf_clobber ops = {
>      .name = "Hyper-V",
>      .setup = setup,
>      .ap_setup = ap_setup,
> --- a/xen/arch/x86/guest/hypervisor.c
> +++ b/xen/arch/x86/guest/hypervisor.c
> @@ -13,7 +13,7 @@
>  #include <asm/cache.h>
>  #include <asm/guest.h>
>  
> -static struct hypervisor_ops __read_mostly ops;
> +static struct hypervisor_ops __ro_after_init ops;
>  
>  const char *__init hypervisor_probe(void)
>  {
> @@ -49,7 +49,7 @@ void __init hypervisor_setup(void)
>  int hypervisor_ap_setup(void)
>  {
>      if ( ops.ap_setup )
> -        return ops.ap_setup();
> +        return alternative_call(ops.ap_setup);
>  
>      return 0;
>  }
> @@ -57,7 +57,7 @@ int hypervisor_ap_setup(void)
>  void hypervisor_resume(void)
>  {
>      if ( ops.resume )
> -        ops.resume();
> +        alternative_vcall(ops.resume);
>  }
>  
>  void __init hypervisor_e820_fixup(void)
> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -318,7 +318,7 @@ static int cf_check flush_tlb(
>      return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
>  }
>  
> -static const struct hypervisor_ops __initconstrel ops = {
> +static const struct hypervisor_ops __initconst_cf_clobber ops = {
>      .name = "Xen",
>      .setup = setup,
>      .ap_setup = ap_setup,


