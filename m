Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9DA66AAB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 07:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918526.1323177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuQcW-0003UY-JO; Tue, 18 Mar 2025 06:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918526.1323177; Tue, 18 Mar 2025 06:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuQcW-0003Ry-FU; Tue, 18 Mar 2025 06:40:12 +0000
Received: by outflank-mailman (input) for mailman id 918526;
 Tue, 18 Mar 2025 06:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuQcU-0003Rs-Lc
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 06:40:10 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6029e20-03c3-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 07:40:09 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3965c995151so3483076f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 23:40:09 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70b:b4be:a081:f026:906f:3550?
 (p200300cab70bb4bea081f026906f3550.dip0.t-ipconnect.de.
 [2003:ca:b70b:b4be:a081:f026:906f:3550])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8881187sm16902464f8f.41.2025.03.17.23.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 23:40:08 -0700 (PDT)
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
X-Inumbo-ID: d6029e20-03c3-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742280009; x=1742884809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KK8c0LIf839DneG70BT9sRoLodewbEnfBrGBS1atfoc=;
        b=Y173lwIkJZfLHfieSnGXcrS1yHSFsn+IIq07pSu2wCbu5TMtXjKID2hdxi85MuWVkT
         E+c7qFSxVQkJEJtP7NXV5nI48l4/M2NybENvX/59gNJsYoeQRSpb6U11LhtenJwfQnKh
         7PLyaVLfHT6Zkp9zx+KXBYPnk/aIv5Y7EIwUOFAckl34AO2Jb+mss4xF8kRmtE47JkaE
         Sg+cdRJlhfdnoeqfLIIbEeDmVVJ2Kn8orISgAn1OG8Zgi+ZPEllES884ZKtJLH/n5R4/
         bbNEIfYQZ3yvHILGPlv97yx0kQlZbB2SpkEdkRFRO78Lq229hR/PoqEsrHa2ajEmmqhB
         D0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280009; x=1742884809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK8c0LIf839DneG70BT9sRoLodewbEnfBrGBS1atfoc=;
        b=JpQe6uRZTwA0qL8SwqWWv/uRtQI5u6ofxnZ8cOPyIISFVGr1BnWNiiD4q7s5hKVfba
         5suFBZ0bZvMKPLzq7LujuI5nprhDF8CpXFibrtLVULS3ge2ts5neLsxshzTZqwnwsKR2
         i/1mqKUIUWNUD42/YATzLYomywcAc3G/Ac9Zf0CdF0T/U3Y9qHS1SNSTYY6YXHVkzOFF
         wJuzq3mHKz9sst4PVx8FZwQl1PVvgQ/mq3YqH7IBo4n8xe6o2fjrA/YRTMJbVk6Ry8Sa
         2aTB8EQMhd+Dj8mwxdKIjAQX0OuRTOj2WnsV4RDoCnJqM6xhU15dPpvsJpGSah9DRH6o
         zleA==
X-Forwarded-Encrypted: i=1; AJvYcCVkUdc6LfCSx4i97XDxBH2Zt/dFgzRvfVrcOtkmtbWYxSQEj6mFfdVDDdP7BKL5HvtNILL+IC3N4Ds=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH9eoMCYnp9PrGiDGn4NNFRSgtEqayRgVOio8xde1xkEpQKcIM
	oqX7RABIEWkYgzcJbNa5erVZyT7a4WOpl/iG2HrP4TeEwIvCNlBHThSsiwCpBw==
X-Gm-Gg: ASbGnct3GUK1KMn95f1A1KoetNULvHNWJyT3hARIrEtIv1fAz4+fZiaxN7XQU8+pBro
	q4y15BiPTZcnVHVZ72YcNT5hgpX5PgaZtSBL93SfqzSIj/QcCUR0JmtZTO8UeKoEn4nqcNChTeM
	X1Rhz9EMYfHHPRtsa7/N7bxeLpw5ncpjLTOS3LmejZPWpn0FUiYxKWh56pIAGHIw9E5SEIzBlKD
	0pnse9/950ibeyy4iePV5mzgWfp44/FY3MUaphrSDABB3gJj6nakPefVaTTxjA8RslMYF8ramI3
	Ocdx57RVVkf2x6iMwWBE+BAhDeF5dHNtn7NKv6SYdmdH8ZawY1SfHgx4Iq82po/p2qnlhvCvIgp
	TvcM1FZr7cczR0mI1MVI9Iyf+GVaCvKiHQGHZO3ijQuKlkSEbCY0cUwyVL4ICNhwzgoVTe3o3s0
	aLlGw=
X-Google-Smtp-Source: AGHT+IHBzm3bedLzElJOREyHIy0zQqEWM9puiKrTDqNzrNLR0wg0Ga8vv6hPHM8JSrhfaEBPaMpGgQ==
X-Received: by 2002:a5d:6d03:0:b0:391:4231:416 with SMTP id ffacd0b85a97d-3996b499016mr2070267f8f.36.1742280008807;
        Mon, 17 Mar 2025 23:40:08 -0700 (PDT)
Message-ID: <07bd83b1-8c59-4bb8-ab1a-a3b9a6bb7cf6@suse.com>
Date: Tue, 18 Mar 2025 07:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: call xfree() after local IRQ is enabled
To: Anderson Choi <anderson.choi@boeing.com>
Cc: nathan.studer@dornerworks.com, stewart@stew.dk,
 matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
 andrew.cooper3@citrix.com, jgross@suse.com, xen-devel@lists.xenproject.org
References: <20250318040023.4998-1-anderson.choi@boeing.com>
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
In-Reply-To: <20250318040023.4998-1-anderson.choi@boeing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 05:00, Anderson Choi wrote:
> xen panic is observed with the following configuration.
> 
> 1. Debug xen build (CONFIG_DEBUG=y)
> 2. dom1 of an ARINC653 domain
> 3. shutdown dom1 with xl command
> 
> $ xl shutdown <domain_name>
> 
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
> num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:714
> (XEN) ****************************************
> 
> panic was triggered since xfree() was called with local IRQ disabled and
> therefore assertion failed.
> 
> Fix this by calling xfree() after local IRQ is enabled.
> 
> Fixes: 19049f8d796a sched: fix locking in a653sched_free_vdata()
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>

Just one nit on the patch title: There's no mention at all there of which
scheduler it is. Imo "sched" there would better be replaced by the scheduler
name.

Jan

> ---
>  xen/common/sched/arinc653.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
> index 0a3733c04e90..b95492e1d96f 100644
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -463,10 +463,11 @@ a653sched_free_udata(const struct scheduler *ops, void *priv)
>      if ( !is_idle_unit(av->unit) )
>          list_del(&av->list);
>  
> -    xfree(av);
>      update_schedule_units(ops);
>  
>      spin_unlock_irqrestore(&sched_priv->lock, flags);
> +
> +    xfree(av);
>  }
>  
>  /**


