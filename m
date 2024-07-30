Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E289194117A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767672.1178354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlaR-0006Dy-C0; Tue, 30 Jul 2024 12:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767672.1178354; Tue, 30 Jul 2024 12:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlaR-0006BG-9C; Tue, 30 Jul 2024 12:04:15 +0000
Received: by outflank-mailman (input) for mailman id 767672;
 Tue, 30 Jul 2024 12:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYlaP-0006BA-J7
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:04:13 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5126462-4e6b-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 14:04:11 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34722so9223461a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:04:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3c29sm7109005a12.59.2024.07.30.05.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:04:10 -0700 (PDT)
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
X-Inumbo-ID: d5126462-4e6b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722341051; x=1722945851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HZKFikV9T8407QvCk0mbySiwJQj1JdBUYVZmSaBepoc=;
        b=XqYh3gmQ1P1Y1nAJ8LaZwHdqYWUHRbJI2XJiO2a1VxkKCKM0ziY2o8+hqVkq/WV4pO
         WN8209py8BGygb46zh7a3VC5EBiviI4hVWXdW4mjLHHaJ4jXQ+vNPpPIDnO2ll2iZ7k8
         N1E2vMh/ZEoBoZp0LwTLVmkYLgNkexgRNoLETWL2BU6pQBC2+I11Ldcw3qeSPDGgUPXf
         l4nI+OmNMd3r4azz6MrGeak3WI0J1MV+SinWmPJKV5mlLaBirQZa+7AKtAKGJ9LfBWQc
         lm6ANXCdOrizB+neY18AgmY46wrpLR7xlug4t6ZVLV4kduOdLOjqC0uMqu3bDP2SOOlm
         xSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722341051; x=1722945851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZKFikV9T8407QvCk0mbySiwJQj1JdBUYVZmSaBepoc=;
        b=OLh+ukgE5IGKV1aLIh8pzzC3JO3e//OApMsfW8tQD0htZjGvePcNwAGTHWIk704gRT
         1vT3/7xMMEb5WUmQxj68SP++WraqtRaMzAw4UE1r14F+C4/Re8s0Z+oft5y526teTmqM
         xQ2pb8X/VHPnXW/xP9WSjMJX/XN+qPbaWI/WqvVzl/qgD1gB4wMxkLslEtspb9l/WyCB
         yJRjUgtwXDtvOHKVuqkHmkpH5clmQT8F9XUO+ycRIJUbLLGryH6DRte11Q9+8OgeEQJO
         w6JGkmijd7eVOZd1sEd3QSnwFC26eSxfMxxOxzAKvv77TyqUcNWrnut9QrntL7EfkYpS
         kWQg==
X-Gm-Message-State: AOJu0Yy9lI6dgc1PIh8XAuTYAu52dZCduxArWhnxbADUiM42QgSNFq40
	FuXzlLv0KB7MaSrFGXjIHW9vcNwK6RdcaiaAb9UlHWixSv3rRTq2CYoEWyZl3A==
X-Google-Smtp-Source: AGHT+IE1uws4CAdZOI6WCo+3ym3kgGzTobeyS3VIGYcROaca6T4pVH5kg5ttpZet0r2LfM4QNtjw7A==
X-Received: by 2002:a50:c30f:0:b0:58c:b2b8:31b2 with SMTP id 4fb4d7f45d1cf-5b46cf13951mr1622142a12.17.1722341050906;
        Tue, 30 Jul 2024 05:04:10 -0700 (PDT)
Message-ID: <67f1bcb7-8924-413f-a8ec-6a01f90e7836@suse.com>
Date: Tue, 30 Jul 2024 14:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
To: Daniel Smith <dpsmith@apertussolutions.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
 <191036ec4af.b419d861552194.691516900344490021@apertussolutions.com>
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
In-Reply-To: <191036ec4af.b419d861552194.691516900344490021@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 13:37, Daniel Smith wrote:
> ---- On Tue, 30 Jul 2024 06:57:08 -0400 Jan Beulich  wrote ---
> 
>  > XSM is a generic framework, which in particular is also used by SILO. 
>  > With this it can't really be experimental: Arm enables SILO by default. 
>  >  
>  > Signed-off-by: Jan Beulich jbeulich@suse.com> 
>  >  
>  > --- a/SUPPORT.md 
>  > +++ b/SUPPORT.md 
>  > @@ -768,13 +768,20 @@ Compile time disabled for ARM by default 
>  >  
>  >  Status, x86: Supported, not security supported 
>  >  
>  > -### XSM & FLASK 
>  > +### XSM 
>  > + 
>  > +    Status: Supported 
>  > + 
>  > +See below for use with FLASK and SILO.  The dummy implementation is covered here 
>  > +as well. 
>  > + 
>  > +### XSM + FLASK 
> 
> To me it would make more sense to say XSM FLASK Policy than XSM + FLASK.

I thought about using "policy", but then deemed that wrong. The "Flask
policy" is what you load into Flask. Whereas here we're talking about the
code actually carrying out what such a policy says.

Jan

