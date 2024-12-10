Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802C9EB283
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852470.1266251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0oF-0004P2-U8; Tue, 10 Dec 2024 14:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852470.1266251; Tue, 10 Dec 2024 14:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0oF-0004N4-RL; Tue, 10 Dec 2024 14:01:55 +0000
Received: by outflank-mailman (input) for mailman id 852470;
 Tue, 10 Dec 2024 14:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0oE-0004My-AS
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:01:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f27f97f-b6ff-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 15:01:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434e69857d9so19234175e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:01:53 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f7160599sm80630135e9.23.2024.12.10.06.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:01:51 -0800 (PST)
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
X-Inumbo-ID: 4f27f97f-b6ff-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733839313; x=1734444113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FhyBiK50u5Rd3uOWBiKxO6LYM0ifTZtCXe5MmUy31r8=;
        b=d9AR4isoDVCjR2nRdHJouT6IRM7/jwSKDNE7uOmsahsNMfFv40MtVMPmlTuxkZuu5F
         byeGFTnVoLM3d4PCo8tKPjRYHKgiYzi3V913D6QBUN55tHtLL+IQi+W+InMy3n0HBr5R
         ZOilNoxxr3mqsi+0vyXAw+8LQ2f3uZ8ev/7th71qeU8xjPu7j1DVj2KaMtryF/SkC+/a
         L8krHF0by9I4w7tGeuus3aFQQ4fC7M/Qcmbo/R0QBgZyaGi+JHNnHa2G//Q9vQ8WjyBV
         pXOZFC/3KXZ/zUA5x8HsFTiJPbCzyxXDPAGVE8FGJBkgCaT1/e+k1+NosL4jQpj6Wtbh
         rIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839313; x=1734444113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhyBiK50u5Rd3uOWBiKxO6LYM0ifTZtCXe5MmUy31r8=;
        b=rrKAwNdfgLMywxffT/ryZOs4XqAEYjM4Gprm9+M0jTON6zDMFwCEm7OwF1jvI2YT/m
         /4iFboWgF1aTBdoQviRbvcc+KxXQx2UslBB6KqaE2sIJgr9UPQEZ4/jVhVXLWsYqpSIH
         IzoztUxImiHdSI4fPjAKZ9tLB1xm3nsXyarldAMOh9VBAir31V8U9UuwhVeTj8ln3ibL
         o3ueXcNpL4TJfrfN6v+Qo+36hn2OSumKjBL1qyYcBX1/y5jBYXMbahSaGqCbD1v2B7pL
         uyyCBI4M2AnOC+SazDMHSMcytLNSV4Fu/GK2mvVK10zNcxtf+lG2hxwwdvno0kNzV0Fg
         PMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/6OXRCNdeXyOj/P5AGpAGDLBqmIVnfbfpRKrJX0o8zGNphDvcI2fGlAh7AIWiX55w4j17lWPhZFE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyP+MMAx4M4keLzN8hGHWtBr5EOcD5vDBmsoozacNBaWwy8mGLB
	Xp+5ZZYtv+H8nhBd3mOneyhkOeFYp5Ma52EadTtJv3wsEr34QNz9v1My+bzPSA==
X-Gm-Gg: ASbGncsv6Q/zweoXFhYIuZDgPnjPqkZOP5ORe5NcEy3bw/lFXk4AP31yrLpQzg2GEZf
	8zr8zHZy7xyKAtRAGBN7Qeor+0Ffb77E/bTsYlROB0Rf6xVwaCVNc2VFf+ju8BAekOe0ln1APrn
	bN596DiZSRZwFVriLPIiEe3hVe3KodFCqMWYhOGAcblw+P5bp+Rupr5mi1dQheC1FIsh9U7wE+t
	dJkieHQXKkERTS6xLK7LPyzQzemy35bixgxdHu+kT7zZqZbVLSH/89H+QiqmCLgE6maw/B1F9hx
	/9bxaWU/yVLnMtsUcA0LKStJStRaizjnW7M6BiNab2dipPCi2m2MhgIAnAnOJRudkgyPCE/vm7Q
	nxbqWkn/wNA==
X-Google-Smtp-Source: AGHT+IFPvNa89RJ2EH7MzLqGmZipbEFkMLfA0VNKlZBj9TakpSiv7RIPDCX+e+gofaYn3JKQ054Dgg==
X-Received: by 2002:a05:600c:510e:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-435edb05f57mr15977715e9.9.1733839312129;
        Tue, 10 Dec 2024 06:01:52 -0800 (PST)
Message-ID: <16b43ca4-d56d-4c1c-b43e-1e3bd4919857@suse.com>
Date: Tue, 10 Dec 2024 15:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/35] xen/console: rename console_input_domain
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-13-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> console_input_domain() takes an RCU lock to protect domain structure.
> That implies call to rcu_unlock_domain() after use.
> 
> Rename console_input_domain() to rcu_lock_domain_console_owner() to
> highlight the need of calling rcu_unlock_domain().

While I can see where you're coming from, ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -477,7 +477,7 @@ static unsigned int __read_mostly console_rx = 0;
>  
>  #ifdef CONFIG_SBSA_VUART_CONSOLE
>  /* Make sure to rcu_unlock_domain after use */
> -struct domain *console_input_domain(void)
> +struct domain *rcu_lock_domain_console_owner(void)
>  {
>      if ( console_rx == 0 )
>              return NULL;

... the new name no longer expresses that a domain pointer is being returned
(out of thin air). I'm uncertain this is an improvement.

Jan

