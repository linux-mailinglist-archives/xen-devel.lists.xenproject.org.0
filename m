Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988F94146A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 16:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767865.1178575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYntp-0006Mi-Gn; Tue, 30 Jul 2024 14:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767865.1178575; Tue, 30 Jul 2024 14:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYntp-0006KV-DK; Tue, 30 Jul 2024 14:32:25 +0000
Received: by outflank-mailman (input) for mailman id 767865;
 Tue, 30 Jul 2024 14:32:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYnto-0006K5-EI
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 14:32:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88ad5064-4e80-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 16:32:22 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a79df5af51so11904352a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 07:32:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59ca1sm7384226a12.52.2024.07.30.07.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 07:32:21 -0700 (PDT)
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
X-Inumbo-ID: 88ad5064-4e80-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722349942; x=1722954742; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QycotWozVnk298RKfDDGMGGnE2GxMZJvY9TCAU+JQBU=;
        b=UgWB8esbb2EroBgemedm+TLXQ5p4faS7dpyCVVhyOoXwIHEcGudqr5AVZrwJo00seV
         Zh7gveN0bV7/eCBmY3hNpzWSjk3cajUM6bSSMZr7GmZfLVjufsxsxnItrvBfVuYiIgoy
         iaAHGDvNrTjB9PPym/dxoje1zfyDdvLqTemp5NDJlCejOAPoWaUH6BWznFsF0koF/Lew
         9aPpbHTDPCqbNCX9IxcVZK4CXL375ZEXT3gM41AZdIzlSEH4OQDqGnR+scmfymKNDkMw
         MzrA+HI6n3kWnRQZUza7p/u8moBkfWNVwwxcMjejHf+JedT9Q/d4C1JRMD+nxw9sma2Q
         TsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349942; x=1722954742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QycotWozVnk298RKfDDGMGGnE2GxMZJvY9TCAU+JQBU=;
        b=EgDy0IsTpQj8S2YX8WmfEKOQOnFZdIuATwcEYCXDQLMYDz4VL4H0mb5wp6zp4+/AE9
         L8XHVDDn7j8SzWeWMUCFDdjcTD/5zDPHnwzb+KbKvoigoZGdNTFVf3BsBeWysmnEdoHs
         noGPaY+iPzvbO8eEvOvWt+wz2gn4yXxcndCHVS7XNeKNxV+EHyMXfEo308Bhtl+ysf0P
         TiAg8B4SGKFP5ceM9XzW0QoUZekLSSX9jmqtd7yOfv5AfccEjpE2WMY7oGH5+iWbilqk
         SocBHcXtMKRJSCT3mxVUY9Mq/DmUsVs6Fia2oyq9Fu1BAIAd0o7rp/usxUccVxR/e97m
         bGKg==
X-Forwarded-Encrypted: i=1; AJvYcCXM7VICkwioGuoNIcQeABZgjdh887i+Hv3KQk+5HXOc1EL/VruzE+2rWQUpMZJS4iIhyRUT+BsdZIjrzx6iMhI3yTXHsUrmQib6v5Pfl3Q=
X-Gm-Message-State: AOJu0Yy/iyj+vM4PdB7BP1nKVQQTyEETcJpAzXt40rJlFEpZ0yfSzGkh
	7a5ACeKKkVl+UK0TiRx7mF/1ud1+nabpq3xXZrk6Bc+DaZjvrBWuM/6APHErzw==
X-Google-Smtp-Source: AGHT+IGzTmiGYdQsZirL4EDm6drEzdMI6e4DqHJz+XvVU5FWNPlxG0ZtrgyOeei653i9nj2kc+OYfA==
X-Received: by 2002:a50:cd52:0:b0:57d:40e3:2a71 with SMTP id 4fb4d7f45d1cf-5b46ba87630mr2503611a12.6.1722349942078;
        Tue, 30 Jul 2024 07:32:22 -0700 (PDT)
Message-ID: <61d4dccc-f349-4c40-8a7f-e8d1c0437918@suse.com>
Date: Tue, 30 Jul 2024 16:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: split XSM from Flask
To: Daniel Smith <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
 <ef4b21d8-a5a9-4d24-bf18-908b5ee067db@citrix.com>
 <220ebc7e-36eb-40af-9fa0-133bb458dfd5@suse.com>
 <19103be5c1e.1009d7316565959.1812404802621701586@apertussolutions.com>
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
In-Reply-To: <19103be5c1e.1009d7316565959.1812404802621701586@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 15:04, Daniel Smith wrote:
> ---- On Tue, 30 Jul 2024 08:58:03 -0400 Jan Beulich  wrote ---
> 
>  > On 30.07.2024 14:35, Andrew Cooper wrote: 
>  > > On 30/07/2024 11:57 am, Jan Beulich wrote: 
>  > >> XSM is a generic framework, which in particular is also used by SILO. 
>  > >> With this it can't really be experimental: Arm enables SILO by default. 
>  > > 
>  > > It's stronger than this. 
>  > > 
>  > > XSA-295 makes SILO the only security supported configuration for ARM. 
>  >  
>  > Okay, switched to "Arm mandates SILO for having a security supported 
>  > configuration." 
>  >  
>  > >> --- a/SUPPORT.md 
>  > >> +++ b/SUPPORT.md 
>  > >> @@ -768,13 +768,20 @@ Compile time disabled for ARM by default 
>  > >> 
>  > >>      Status, x86: Supported, not security supported 
>  > >> 
>  > >> -### XSM & FLASK 
>  > >> +### XSM 
>  > >> + 
>  > >> +    Status: Supported 
>  > >> + 
>  > >> +See below for use with FLASK and SILO.  The dummy implementation is covered here 
>  > >> +as well. 
>  > > 
>  > > This feels weird, although I can't suggest a better option. 
>  > > 
>  > > XSM isn't optional; it can't be compiled out, 
>  >  
>  > How can it not be? There's an "XSM" Kconfig control. 
>  >  
>  > > nor can the dummy policy, 
>  >  
>  > In a way. Yet how the dummy policy is instantiated is quite different 
>  > between XSM=y and XSM=n. 
> 
> I have pointed this out a few times, the difference between XSM=y vs XSM=n determines how the dummy policy is embedded into the hypervisor. XSM=n, causes the dummy policy hooks to be included directly for the xsm_* hooks. When XSM=y, then the callback wrapper functions are used for the xsm_* hooks with dummy policy set for the callbacks.

I wonder what you're trying to tell me. According to my reading that's what
I said, just in far fewer words.

Jan

