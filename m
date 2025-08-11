Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D13BB200E1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076999.1438097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNLD-0002AU-LZ; Mon, 11 Aug 2025 07:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076999.1438097; Mon, 11 Aug 2025 07:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNLD-000293-IZ; Mon, 11 Aug 2025 07:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1076999;
 Mon, 11 Aug 2025 07:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulNLC-00028x-A9
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:53:10 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38ca145e-7688-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 09:53:09 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61564c06e0dso6491679a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 00:53:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8eff596sm17983224a12.5.2025.08.11.00.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 00:53:08 -0700 (PDT)
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
X-Inumbo-ID: 38ca145e-7688-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754898788; x=1755503588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UYq3tbyq5L2/+OjRE1tWnYqj1uRI8eS2QwLZ90xBb4Y=;
        b=B1MIUB2ZjqSta3BcO+kgtFlZfsuLn6jPYvNuX5EPnqUwOylNK04iO7p1Cc0cwiZHjc
         hCKgHp2rJ8GhUfgMCo2f9Fi2A4Pfubknv6kj16WKWRUTZBN0JxJSwDnVBzfArNHC49ia
         UGxrk+uZ4nhAMMo2KPAqZQzUChtkcH/SYIJmPqF+TDEdbyAjaNLGpq/XiC7yEOuJkrZP
         9sf0LA9n4vj/Y6sZ6IQ6j2GSNxXNhl0dN1xLX0Q2IXXZd0M2Qj8anA8pNT+Bsf+EmT65
         PnNjIGECNfx75c5Bw3LzOE/3No8blB17zKyZuV+B+NpactZEKd/aiEi3zW/EqtZz3gzA
         EYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898788; x=1755503588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYq3tbyq5L2/+OjRE1tWnYqj1uRI8eS2QwLZ90xBb4Y=;
        b=DyJesP2dp8uWW42tkjsLgR1y2Sq6IBQIBvU1ybhXvNgp53xvkrPTATu9+LLB84JRgW
         LHdClX6TRd68sIQZ78XjpKrRWc1QsIg5EimtVV34f0ydKc/Nl4RuqZhqG2vunzAeGm3n
         grdyRkFj2IeganHU1ET3JEvrLJtxTe1JYl4wvTsZcFbvBT4OTFo4D3GTJM+Ptg0zI9HE
         GoZ7xnwx+kbXCS4YNRt+KjjU6JjeYry275nlEN7wl+/ExaSLxbrDTxgwUg/IUI0A0THa
         kmqCK59n4iU9fekHkjCxa+Oi2J90zDYXNebCXMo4udty/hhjco/Hj6FFafwEDQgp3HQQ
         4jFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq6nJEVUGcCxIzUYPsIfuZBMyLaOmkmGJi8YaN6BhWdui9ZrjsTsO3OPFGnEOyoHOrFIETSwOkUDI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLaujmdfO48CrzPNGPsO3mucjZ40j4lAiZIh6m5Y3MiiuqelC6
	kWtCahJ+MjF14bWVZpTBMTLjtfRU1/8VFW88X7zx26HSc8eeM8zeiE2d9pjRbfYJ8A==
X-Gm-Gg: ASbGncsqQRb8v01YEguyKuDNrU0455yHvA0ToN7Gx9tu7bs6jdx85tYq1iulDysp6Xc
	pHXvtZLIw2pP+7ty4WXEsLyDMzoH02ir0qZkQ1hbZRn4CGBrZgytkx4nWe/IYwxbAX0TyHkNz7s
	w//gs1Jj8GclBpkRxP/kd70aTUxPQK7jWp/bRX+yDc1GIABmlkq5atd4YUcR7WXmwFzDMF8EZTQ
	RJY0n6gH3qfkCMvJCG+nemvqlFUOnSjgqF0RxhMAadJvcJSb22isEWDy7LdPnV0RpF9yN45b6Qs
	f1UJWoeoxPRPMOsVlnK1lsvc2V/QXSqnh7lu9IDZzFBJ3AF0Im9K+m1PDTXUys7hbtvUwGYwnjy
	BDnmo068QAy3rVrarKoGqkejgy4f46OcDHPcVBtdKzUv08uVrdeHnWQ7TegBv4ZvzWwgBeMP/07
	l6qn9icmc=
X-Google-Smtp-Source: AGHT+IG/YPwzYCI21EGwXGQjZiz4zdr4CKgfBPJxkcs3CAadTxyLNpCqKqTN9WkViDH7gGQ/QaKDcw==
X-Received: by 2002:a05:6402:5108:b0:615:8b0b:7c6b with SMTP id 4fb4d7f45d1cf-617e2becb29mr9918460a12.13.1754898788461;
        Mon, 11 Aug 2025 00:53:08 -0700 (PDT)
Message-ID: <977c6c31-af2a-4108-8b28-172dc3916731@suse.com>
Date: Mon, 11 Aug 2025 09:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: irq: add missing spin_unlock() in
 init_local_irq_data() error path
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <bd707bd0fd88fc53974a1214313a9b9103162bcc.1754749899.git.mykola_kvach@epam.com>
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
In-Reply-To: <bd707bd0fd88fc53974a1214313a9b9103162bcc.1754749899.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2025 16:32, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> If init_one_irq_desc() fails, init_local_irq_data() returns without
> releasing local_irqs_type_lock, leading to a possible deadlock.
> 
> Release the lock before returning to ensure proper cleanup.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Pretty likely wants backporting, which would best be indicated by a suitable
Fixes: tag.

Jan

> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -94,7 +94,10 @@ static int init_local_irq_data(unsigned int cpu)
>          int rc = init_one_irq_desc(desc);
>  
>          if ( rc )
> +        {
> +            spin_unlock(&local_irqs_type_lock);
>              return rc;
> +        }
>  
>          desc->irq = irq;
>          desc->action  = NULL;


