Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD8984806
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803029.1213422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6sp-0003pG-Qo; Tue, 24 Sep 2024 14:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803029.1213422; Tue, 24 Sep 2024 14:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6sp-0003mg-Nd; Tue, 24 Sep 2024 14:51:19 +0000
Received: by outflank-mailman (input) for mailman id 803029;
 Tue, 24 Sep 2024 14:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st6sn-0003mF-JW
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:51:17 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d86c92-7a84-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 16:51:17 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so10174800a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:51:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5485asm92155566b.88.2024.09.24.07.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:51:16 -0700 (PDT)
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
X-Inumbo-ID: 73d86c92-7a84-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727189476; x=1727794276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz7jdAS1KmHeWKG1b6kqHzRhfXOIxUBsjvU0kFVRIvA=;
        b=NE8GkGe8cyy3UVZnCihJjA74qKUo1R7CxJb+bqRwN44inWCX7RXJA7DInknU/SH6qp
         ZVKdH01znr+a8awfrsxjyQf02mZicl9DpgFJ+Y65eDzK7k04BMon973usVlxLxARnAUS
         o8jmV2IIGF6Y2YLKfWRQjBZizZChLw0gQ8aBd+U3EarVAB6GKP78jQypfbhGkYVNjzxH
         vev3fRbpk8/HgdqKUg3JLtzZwuCxQFxK8b4rw9V2OpmSZvACjsZIIt5TcHrfgtOMCJX3
         zGQF507ETs7+6I+p6lbWcbteRXAyo+Yy2a9rbWs71YBAOwBNHrse33dgwM0a+I848rQH
         4l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727189476; x=1727794276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz7jdAS1KmHeWKG1b6kqHzRhfXOIxUBsjvU0kFVRIvA=;
        b=OWwwXsYb3KgubOYBjHpbr/C8wNukMXrU1tsC/Nr0O/Mrv1c+0UGXJeBce88ZJI8euR
         bAgUlZ1TgGOi4l1/yMTfv2fLnd2yqVGfwdRWh9bqoSQezcqfjKdr6wFeBoO0DeejBXKc
         iPSfvoxr0gtJL7hc0VzZZILyr/oVK4m2eC2PrA+/4yez2b7UmDSKFMRVRM0DfNE8yr5K
         nAh13cv8gTq9uXGb1Q20mGPOdG13fh+f3pe6PiIjpprnowHfX6Fud8g2t8H0Bup3Bmn+
         rQtjnhsBo34SjCEg8tXYu7HMk8KNp2yOO/pyGRv9k7eXjGP6dZ+qSlp4+RGWQcetbcVc
         8Vuw==
X-Forwarded-Encrypted: i=1; AJvYcCXYxPseW4K0sxhFIBeWTA2ozpFQK4O9TfSwUSgcANMH4qXb52bvWurss9HUB+j7jE9kRuULxywzZH8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5VECN2KVAgSKmhIKazp+S+pu+bT4DZnexRApsCworJJ/+phMi
	w80yH/tnm0JKCe5Fya06CGS6oG2sGwaBdputVW0joRhbZVsTjlOGXJJXP9aAKg==
X-Google-Smtp-Source: AGHT+IHPY6BIU6FSppbdSDNrMUy02OFNtRyN5FrdEKU4hQsMbfLOnqwl5xbjieTHB+eSWv687p/cag==
X-Received: by 2002:a17:907:74c:b0:a8d:6dab:b8ee with SMTP id a640c23a62f3a-a92d55a1794mr319513266b.23.1727189476305;
        Tue, 24 Sep 2024 07:51:16 -0700 (PDT)
Message-ID: <17b2f007-feb9-421f-bbb4-ba7c5f0cd8f8@suse.com>
Date: Tue, 24 Sep 2024 16:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
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
In-Reply-To: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.09.2024 16:35, Matthew Barnes wrote:
> With the introduction of mixed x2APIC mode (using cluster addressing for
> IPIs and physical for external interrupts) the use of pure cluster mode
> doesn't have any benefit.
> 
> Remove the mode itself, leaving only the code required for logical
> addressing when sending IPIs.
> 
> Implements: https://gitlab.com/xen-project/xen/-/issues/189
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



