Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6372DADF0EF
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 17:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019265.1396081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuWK-0008Rh-JT; Wed, 18 Jun 2025 15:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019265.1396081; Wed, 18 Jun 2025 15:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRuWK-0008QE-Gj; Wed, 18 Jun 2025 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 1019265;
 Wed, 18 Jun 2025 15:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRuWJ-0008Q8-0K
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 15:16:11 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28cc8cb7-4c57-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 17:16:08 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3471260f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 08:16:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b1d95sm11067857b3a.120.2025.06.18.08.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 08:16:06 -0700 (PDT)
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
X-Inumbo-ID: 28cc8cb7-4c57-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750259767; x=1750864567; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FHmsySBBC46aeM4dE5bYOQxQJPC9oS9TIj1GtE606vM=;
        b=X3lErd4JhjuJQ7vMZYlKghmPEhrQSzk7PWUcLWZ4G9AC7FtFtzKt/8JMmle1116vYH
         xbb9K59ePVSJE7OYB/IQIK4X6S3TgpCjBkjA7/nRdrCHP767NZLyGcw4pNQFKcUflSBq
         SFylTiWoQJYIXLRelANkRWZ5FNA2jMMyKB/cvv7CSjENDV1TfjRzzbYpzoIq9FrV7mEr
         FrvKiauz1tafGiVaXbMlbitzovXY34OXkbYcZvZpXR/htmI44Z8TB9mltNdpgrCpInM8
         YzDKqCy3mB4RNW0fBpchJ8ikvzb/d3XPekZGxLqAOf2LaC9yUjR6gptaEn3JGZxXfbDi
         krsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259767; x=1750864567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHmsySBBC46aeM4dE5bYOQxQJPC9oS9TIj1GtE606vM=;
        b=UQ4e91T9mmGNbu6tYypQ5G8hujy/iN6yNlNYmkGTaeGwrnNhXRLQA3qnf+vwJopqht
         mB5VGXzuCNYWUoXrtCcHD2R7kCprW85u0hyzTWGS+P/XHBw2bKWF0xgVS/KuFNxA/asw
         QjwmVio6EpSpzR1RLrshdcCwiwGWavshYVOxbxst1t2zzn/zyo572HxD8bIjIr1fWHvK
         iNCGXL5B62kXwnr+loEr1gZkZeks+bElMQKqvVdq4BDeP8M/mt7EiXhmA/pNKsH//N5x
         yWYYkLO4+3KcvrPs69hc5oxxl8czzood8vYwtULsGbXEnwcfn80ew6SKSAVk6ub15k12
         wMDg==
X-Forwarded-Encrypted: i=1; AJvYcCU9KsnD8JSlaSf60tD33fnY0Y15UrXc6xLgTXRzsYDfTj9HXB9OP8kVu+pg/0Cja09FXmwWb15YoKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYE/qrfRgrF1qLYf6+064dnzD9XSIxdvwMGkmltA4cx6x7V+BB
	QYLsmCYA7owO9j8ITnI+uRmQ0mG3+VWei5Aq0L+Nd7dTJmZYuK+7ZiBj/dfg7cT4hsbzs4PyzpR
	ObRs=
X-Gm-Gg: ASbGncuG9LcGUC8sqZb84HMKJhAAR2UyGvPMWuXzpkaYJ6IbV061D+No26pj8aTL1Fw
	273FrjQf8+2aBzyNsxe1cV4BE1zvRnghccIyVS5lvut9m0GR25yhBXgjG0amb6m9SCQChflzhe0
	mFsP8HYinSRJM1GbINlIzijfz4oURrMxWgV6bzej7biIFyL18A4M+mZO3yTin852NMmQ7mZDf13
	iWlTGVx0IpOLUWF70ZYZ52Lc2qBpT4zYcbCBEz76GlQb9wwwTrk3dHz52UwYl3Z/izoSkyFd/yB
	QEZiqgo3tBtsY5BSCx8V6jYuB76nsOpaJb6+YkSyDyH9upet/mQp92QR0y4+wKN04dNLP84KYDr
	nyEpusiao9DYnisc3wgSTEDTi9waejXSJfgsvzCWlKtaL0q/IBICdBmwDXw==
X-Google-Smtp-Source: AGHT+IEvzpGLTBCUzoiVYM6ZZTyeYWpJBXZYt6fYRrbNd/Ul/0arbZGgazDUQkPexLrypiyHSjGs3g==
X-Received: by 2002:a05:6000:2002:b0:3a5:25e4:264f with SMTP id ffacd0b85a97d-3a572e6ba0amr14537488f8f.31.1750259767356;
        Wed, 18 Jun 2025 08:16:07 -0700 (PDT)
Message-ID: <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>
Date: Wed, 18 Jun 2025 17:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
> covering the range of guest physical addresses between start_addr and
> start_addr + size for all the guests.

Here and in the code comment: Why "for all the guests"? Under what conditions
would you require such a broad (guest) TLB flush?

> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -258,6 +258,15 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
>                        cpu_mask, start, size, 0, 0);
>  }
>  
> +int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
> +                           size_t size)
> +{
> +    ASSERT(sbi_rfence);

As previously indicated, I question the usefulness of such assertions. If the
pointer is still NULL, ...

> +    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
> +                      cpu_mask, start, size, 0, 0);

... you'll crash here anyway (much like you will in a release build).

Jan

