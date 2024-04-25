Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47F8B1ADA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711819.1112075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsUT-0007wB-JN; Thu, 25 Apr 2024 06:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711819.1112075; Thu, 25 Apr 2024 06:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsUT-0007tz-Fz; Thu, 25 Apr 2024 06:21:53 +0000
Received: by outflank-mailman (input) for mailman id 711819;
 Thu, 25 Apr 2024 06:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzsUR-0007tr-M6
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:21:51 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a18c37c-02cc-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 08:21:50 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so297182f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 23:21:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b0033e9d9f891csm19124952wrb.58.2024.04.24.23.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 23:21:50 -0700 (PDT)
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
X-Inumbo-ID: 1a18c37c-02cc-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714026110; x=1714630910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlyMsT4P4AoDqwyxOKfsSZEUYehZYOxVPOM87MuqqxM=;
        b=TkJiCP7No6F7alvkB8KEXTbfJgwfIS/lNV0AtuMnXcOHNwCgDGIR+SNizqhkjGKr3g
         /YidHaF2OVW3lLAjUKcpKCqULl0832TswavBCytcmzL7MdZtIe1H3E7sIet1ONAB3dSU
         lA4CDD/nD4JnnSdZmBCxM/p6HhbpnIFFp6BkLers0FQu2xYhWSRuQEv3yNYzAlwKvAq0
         aUN4f5V2Q9ZiCwpZdIeVkOJ2r+BA9T/OdaFfWwsC5Xm2pJAtU5I6/BQB/loUW2Nt0Mh9
         ZRvEtQ2EE+grR7U1URbYce2Jk6u44oY+ct8nB3jOGJB9OvR/phUgVVUCnj2rfwnPM776
         JOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714026110; x=1714630910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlyMsT4P4AoDqwyxOKfsSZEUYehZYOxVPOM87MuqqxM=;
        b=podG0oXWPC1ybPNYImSgY3bj+xagXgMoMgCM8a5+Rt2cghWsRyB5aZ/IimBn9zxwmc
         Xe8z9logqlcBvn5HEns1hp9SrbttFqbvG/1scq09Phyw22+bI5Ise8rccbRkcs6OENHI
         fGkKawErtWJnajUTCytVgHYlan5JrGELr2HQ0N1MAWWjCuJ2l2vWUxxvbDxvV7msIGyd
         wCBl4hFWsrrNSWXri6UlaZupWHVhz7MCC5CMt5LtPrpL4uC9yhcbC8ORDVVp4aT9Vy/s
         45c8KzIiGikXA/CEPH3g4RK1IoVG+bIH07VmXZ3WSSg/hrscPdfYUU/oFL56WbayLWo4
         835A==
X-Forwarded-Encrypted: i=1; AJvYcCU+gO55SjeVAgcWXfCpPhP4JLrwb4CKf0J7K63M3ZJPyPSmwB918rannqzyvIIYx6n4IQj/+bTcdaVWfVJNm+3f9g3bY6e4gsM4scF7QuI=
X-Gm-Message-State: AOJu0YwiPJFg5XNwBmkx6TVcPa1nFp4IZJoQC/fHDSiRCmzUltc1Q+TB
	olh73sW+yvBxwqljZZUpTsZq3LGDmEcikV/kb4nOj00MefQr+/H+I0c32iK5TQ==
X-Google-Smtp-Source: AGHT+IGe75ueJX/rBjhueyknUMxRF4GmBmciM88W1+EdRfwy102jBhJdI3r7vMK8BJtbN1xW01tBpw==
X-Received: by 2002:a5d:4ac3:0:b0:348:b458:56b8 with SMTP id y3-20020a5d4ac3000000b00348b45856b8mr1014067wrs.17.1714026110257;
        Wed, 24 Apr 2024 23:21:50 -0700 (PDT)
Message-ID: <470e0d7a-918b-4df6-a7b2-e8ee2d98dbde@suse.com>
Date: Thu, 25 Apr 2024 08:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/p2m: Add braces for better code clarity
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713990376.git.w1benny@gmail.com>
 <2e6e4f07b9e8f50ae65697c8644995aa4851cdac.1713990376.git.w1benny@gmail.com>
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
In-Reply-To: <2e6e4f07b9e8f50ae65697c8644995aa4851cdac.1713990376.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 22:41, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> No functional change.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Hmm. I don't really mind the extra braces, but I also don't really see a need.
IOW this is not an objection, but it'll want to be someone else (if anyone) to
ack this.

Jan

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -106,6 +106,7 @@ void p2m_change_entry_type_global(struct domain *d,
>          unsigned int i;
>  
>          for ( i = 0; i < MAX_ALTP2M; i++ )
> +        {
>              if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
>              {
>                  struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
> @@ -114,6 +115,7 @@ void p2m_change_entry_type_global(struct domain *d,
>                  change_entry_type_global(altp2m, ot, nt);
>                  p2m_unlock(altp2m);
>              }
> +        }
>      }
>  
>      p2m_unlock(hostp2m);
> @@ -139,6 +141,7 @@ void p2m_memory_type_changed(struct domain *d)
>          unsigned int i;
>  
>          for ( i = 0; i < MAX_ALTP2M; i++ )
> +        {
>              if ( d->arch.altp2m_eptp[i] != mfn_x(INVALID_MFN) )
>              {
>                  struct p2m_domain *altp2m = d->arch.altp2m_p2m[i];
> @@ -147,6 +150,7 @@ void p2m_memory_type_changed(struct domain *d)
>                  _memory_type_changed(altp2m);
>                  p2m_unlock(altp2m);
>              }
> +        }
>      }
>  
>      p2m_unlock(hostp2m);


