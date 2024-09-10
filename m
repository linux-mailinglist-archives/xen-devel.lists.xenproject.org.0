Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29B972E6D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795197.1204394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxOH-0000Jj-Hm; Tue, 10 Sep 2024 09:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795197.1204394; Tue, 10 Sep 2024 09:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxOH-0000Gg-ET; Tue, 10 Sep 2024 09:42:29 +0000
Received: by outflank-mailman (input) for mailman id 795197;
 Tue, 10 Sep 2024 09:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snxOG-0000Ga-E1
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:42:28 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd7eb37a-6f58-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 11:42:27 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso238523066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:42:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d63c0fsm458658966b.213.2024.09.10.02.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:42:26 -0700 (PDT)
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
X-Inumbo-ID: fd7eb37a-6f58-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725961347; x=1726566147; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqk8PCi+oNuzgxeDOT5K5s2WQp7VXfpnSt08KbrspLA=;
        b=Z6iKmjdoGuMBwA+/YrBJWKSbpws564M3PUB/t/fLbNy43x7zTgKupYb3+ZsygKQCdx
         o8JpncUslHjJhrRjMrVK9TOBE5mTJP6Qy26ctI+whbvQOxU1rscX33J02p/E+y3YN2W1
         Y3+iDVtdOvsn4eOxvfqd4P00b+m1gdI/vw0FUiaSPe1qi4DJfJAY7sOxYTegcC2/fcEE
         4tb+DYfzRwKksuB4Sif1Ae8xqAB4ZFFm975il3aDJw8EhNzwFCTQuXhDxO/a5d/Alx/e
         //1HscYcrMfULsGea938QmCyuqyFYBmgwpSUD92r6ddzbKoDGZohcMO7bNzEMA0J2tMx
         ZCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725961347; x=1726566147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jqk8PCi+oNuzgxeDOT5K5s2WQp7VXfpnSt08KbrspLA=;
        b=w0qoPPEsolo6JOfnK0Ynlk0fqaf9+E9XNDrVJMjOeeajbFECb5s3+/XQbN0V2F/jNO
         jEi2Gio4ckCQsngLVopMjnwtmKP7BLQwBQZz0u8GKWCx3E0I/mBNC+1vnJaHherw3Keh
         JBRSHyesJLdkTGQGBcaA057ZSAIvaFAF0MhIii78ZPPBxTpSmZEx1BMxgIw15dJW4/fR
         hvwJBHwwH4v5nmCrmD4acS717KcMBO7vyeRErlRTtNozBpOSYcBN4FXkVTcApyvhjPhx
         fpcgxScTqSFDCR4JLoAk79uM84lHS4BHvmoUfgtY+es1CQkWHs/23lrkfufKJKwvbguY
         yZug==
X-Forwarded-Encrypted: i=1; AJvYcCXASDj5EOEE3pYZkK3wCGU64WSBsLaNntXvqQrZw3qZUrtf3Qp8rY3AcoMM/YhTDle775jLi8Om4AY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbRewyaHR0aoLkF443rteu3SSE+mGVsxydlHvWH4fSX3NpybeQ
	vgxK4+xFViCpXPV/xjXFvhZS+/Mx7+ti+zINvNenLZP5sM0mr2/38Sl92qvlaw==
X-Google-Smtp-Source: AGHT+IHXz3vp0AeNfHFJrnKR3bb7X1JIBspfudLZHD6fbk1Ng7GKx+ao4ji8iXvBIh8RubJ+Zqi5TA==
X-Received: by 2002:a17:907:3da0:b0:a8d:498f:640 with SMTP id a640c23a62f3a-a8ffae03f50mr16143866b.21.1725961346627;
        Tue, 10 Sep 2024 02:42:26 -0700 (PDT)
Message-ID: <dca99470-8f42-43fd-b690-50ba2ee3d01e@suse.com>
Date: Tue, 10 Sep 2024 11:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] xen/riscv: prevent recursion when ASSERT(),
 BUG*(), or panic() are called
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 19:01, Oleksii Kurochko wrote:
> Implement machine_restart() using printk() to prevent recursion that
> occurs when ASSERT(), BUG*(), or panic() are invoked.
> All these macros (except panic() which could be called directly)
> eventually call panic(), which then calls machine_restart(),
> leading to a recursive loop.

Right, that pretty likely was an oversight. Yet then ...

> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -53,7 +53,7 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
>  
>  void machine_restart(unsigned int delay_millisecs)
>  {
> -    BUG_ON("unimplemented");
> +    printk("%s: unimplemented\n", __func__);
>  }

... you still want to halt execution here, by (re?)adding a for() loop
of the kind you at least had in a few places earlier on. The function
is declared noreturn after all, which you're now violating. I'm
actually surprised the compiler didn't complain to you.

The same is also going to be needed for machine_halt(), btw: As soon
as you get far enough to parse the command line, "noreboot" on the
command line would have crashes end up there, not here.

Jan

