Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A130CA22DD8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 14:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879583.1289794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUeb-0002Uf-N3; Thu, 30 Jan 2025 13:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879583.1289794; Thu, 30 Jan 2025 13:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdUeb-0002SH-KB; Thu, 30 Jan 2025 13:32:21 +0000
Received: by outflank-mailman (input) for mailman id 879583;
 Thu, 30 Jan 2025 13:32:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdUea-0002S9-BR
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 13:32:20 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0c0dfb6-df0e-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 14:32:19 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so1298551a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 05:32:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7be3sm120263666b.20.2025.01.30.05.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 05:32:18 -0800 (PST)
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
X-Inumbo-ID: a0c0dfb6-df0e-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738243939; x=1738848739; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ruyuqJjalDkjl6hlRXlmkNz29+c8c580J8tI4J9c7z4=;
        b=DdYs9vjoDdXthh0uePoT+DszpLK1Sif+6poDzGpOx2nxbm4pFXfoy/DnuG6+azx1IB
         lgUDNnK0qnWfqZSI5WsVLXKh7164nyu0gXFqOrqLD0EWvmrodRBCiztD/RQJYjdQ1iPc
         tIeezdIlkmRgzGW7m7BlD+kWwY80AsIf8MVLRJsOyrcNrOWCz2ekHvm7L4UCdA1BDmGH
         6TMmJ2SF6mRgui5O15XOSt++q2W8HuoTMLnN4/Z6xNj5OkzF/VT0/k8j6N6azBocSZiV
         uByn75B+fk+r4CEpdWiZI7EvCERA2Q/5Q3K8M7c9gYWluiteWRom2I/7UfL1CXAOb+fX
         /Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243939; x=1738848739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruyuqJjalDkjl6hlRXlmkNz29+c8c580J8tI4J9c7z4=;
        b=MF/NP7HqkhvOFEitHe3goDqVMmETDaI0M0G6sb3mTNFmi+ao1QyR7KL25i2nbsY1X1
         x/UIfwa8Wsno933y3fMtTWqWAII1Qnl+P/RV0UQWGqCKmy4ZXHk6B/9l4Yl77N7GpXyu
         lsgeA/BK5aSn3RrD8DqmnhjtgWPV4Og5obIuFzHolK3ruXt+UIvTwF8YCF9tcZ/WMvdb
         67J/bE3wTDEkTrpQW5qvw/DASjnz5tV2kQJAXGLqj+vXrdWLEF9zmUdJdzux846ArYQH
         cSYK2thdlIDiQetZa4wXlsGUZbauRHgzYEVfwQO6evQ31+0F6+4HOHeWGQ4t85SZfJyB
         ADKw==
X-Forwarded-Encrypted: i=1; AJvYcCUiP3rvGKyNOjh1fb7OxDxTRN1J2d18daOFii5B/ZU7h3+03Gqc/PPZRDKShmz1ixNZlEdfetDhxrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaZnYJJvaJiyLl/GshrH6TzFZ6J0JJn+9NQ+cFdrdMzJi40y9j
	p7iHhRTjpVG1sIY7TSa1y1QZPDy8X6ZFvB8fOoDOKZqms9qGeFq4JKEjBGYxkQ==
X-Gm-Gg: ASbGncv4IJtOJRA5kZ4X1q3O44ozACEzZAGpQWs/zWJTFws4fonKyId3JoEJU4B4wgA
	+Mbm+CBwe2pGbC6VrQXWxdbgeEfXJuIDtd4GRfPQ1aQ0TATgW2f4JpMLrlCqysBLBz8ObKdO6NJ
	4PLN4G+f9rth4djI9hxWL6UulbKJqp8NiM3QM0SK50GJqfuui/OhCRg/QqCmEkVjfOGhoeZO6xg
	dp363U8dLBrzTfzX53EnSnCJtSJ0lMpxSt6t9KiqFgeRndPBuPOqJkA3WKXH7gAj6hHaVdEH+qK
	gN6JdPfXwWuMh8+GmRP/fYbYij3w8Ts/sd6IjUYq9FejX9HthX4D2HnnOIQbetXuPzP4cVBVyeG
	z
X-Google-Smtp-Source: AGHT+IE8hObwgNh2m8R9dhRmSvp3BkfubjzlkN4r8VjjmS46oOXPOSursUkLwnY7nIav0K9KrFUzqQ==
X-Received: by 2002:a17:906:9c85:b0:ab6:60b5:eaa2 with SMTP id a640c23a62f3a-ab6cfcc6ee9mr505425266b.22.1738243938677;
        Thu, 30 Jan 2025 05:32:18 -0800 (PST)
Message-ID: <56231f2c-d57e-423c-b4bd-19d06aeda6ec@suse.com>
Date: Thu, 30 Jan 2025 14:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <2e8b9c5390019ef66610a21d9a8744282e2badeb.1737452864.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <2e8b9c5390019ef66610a21d9a8744282e2badeb.1737452864.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.01.2025 11:25, Sergiy Kibrik wrote:
> --- a/xen/include/xen/monitor.h
> +++ b/xen/include/xen/monitor.h
> @@ -27,8 +27,17 @@
>  struct domain;
>  struct xen_domctl_monitor_op;
>  
> +#ifdef CONFIG_VM_EVENT
>  int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>  void monitor_guest_request(void);
> +#else
> +static inline int monitor_domctl(struct domain *d,
> +                                 struct xen_domctl_monitor_op *mop)
> +{
> +    return -EINVAL;

EOPNOTSUPP perhaps?

Otherwise looks okay to me, but first and foremost requires Arm side approval.

Jan

