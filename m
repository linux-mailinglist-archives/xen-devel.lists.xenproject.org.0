Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D8958768
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 14:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780378.1190007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOMn-0001kg-9o; Tue, 20 Aug 2024 12:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780378.1190007; Tue, 20 Aug 2024 12:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOMn-0001hq-6l; Tue, 20 Aug 2024 12:53:41 +0000
Received: by outflank-mailman (input) for mailman id 780378;
 Tue, 20 Aug 2024 12:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgOMm-0001hO-OB
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 12:53:40 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37c12bdd-5ef3-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 14:53:37 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso8302280a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 05:53:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383934564sm755321066b.126.2024.08.20.05.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 05:53:37 -0700 (PDT)
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
X-Inumbo-ID: 37c12bdd-5ef3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724158418; x=1724763218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tqL6KJwHijGWE8p+gVbOgEAibadQLjqxyFvRKxEk5k=;
        b=JrDK6mKzJopPEkYeyX07VvzJbwd+Neb8Q/ms1IsttyfYCU41ykvcNd1kncpzgj5Di0
         tA8Bb1Cr26U8/7n814J1wfFjQg40AjzZKQRt7iZW8Bxyo+JewZAitwFlvZMRMPUT89HA
         5qds5yn2YTByW0UZjZYSBQ+QnLxlRBzOggmRHBIoJzN5KzqBufDRECltCq9ISGeBxSmf
         znvb9su7/0EMzld35tpC3cCLljku5rRVSfyvKzipU+QBk2G0XiUsZiOLOdHbrLPDFPNK
         TpIGet4NBz1FYjVoeNkKEkkiychL5uV6syjw16/QIU1gDBBG03/8bgFn6g7x6zFppRGj
         1DmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724158418; x=1724763218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tqL6KJwHijGWE8p+gVbOgEAibadQLjqxyFvRKxEk5k=;
        b=FUnw4V2QcUuEyoxOFOOnHd1BNh3Yc1lHI+puRVwkXbCCaKMF49VseZ6+sW489sw8zR
         pa9CVyu6gn51GJ6p3kU/w+MzIY5/ylEPzM7k5gpJvHICzHgU/jYJ8RGdtoD+CR6ZFf/y
         33Uk66WtdYdZPqXkVTh/sdZfGhOeEo/mUNQPm1Vp2O/Tnx4rCuPovHO1xDp0wgoqCIHQ
         /jQGkuSU3KLBl8hBWZMZbTLJQHeaoGc2gcw3rM4dghTywhxh10n57LjkPLbl5IurlKUG
         aaHP2VXG6M8fbN4VbHEJSfxWQcTZH9TtqZcqB18NYSIspQX7ramtmaohoRok0b7v6qsw
         jU0g==
X-Forwarded-Encrypted: i=1; AJvYcCVOWpXaKASRtc1jhFUNaJ56QrA5wxmvuKvik9/ey5LwJ27w59IQ8GfXNJJg9U8y69sZfuc0ke9+NvY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbzfxfYvTSEs+iGzwKjbVytHMHXfF/Y0mRNRMFeqolrJ1tvDge
	MWioQNz9HvsrUglPiZ2ZWekwak5ObfpvjSMTiUSIkx83gObNNFIVv47QfDQyaw==
X-Google-Smtp-Source: AGHT+IFi1wPUNJcNjE9Zsx5hzbitTRutX9cfgKBtyw1lubV9H01bHFGgxeV0uZMFu3JN84biB5iGvA==
X-Received: by 2002:a17:907:e212:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a839292deecmr1020809466b.22.1724158417647;
        Tue, 20 Aug 2024 05:53:37 -0700 (PDT)
Message-ID: <fa441335-bb76-462b-b64c-160cb1fa28ac@suse.com>
Date: Tue, 20 Aug 2024 14:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mini-os: mm: convert set_readonly() to use
 walk_pt()
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
References: <20240813134158.580-1-jgross@suse.com>
 <20240813134158.580-4-jgross@suse.com>
 <20240820115743.teyoiov6qx63flna@begin>
Content-Language: en-US
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
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
In-Reply-To: <20240820115743.teyoiov6qx63flna@begin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 13:57, Samuel Thibault wrote:
> Juergen Gross, le mar. 13 août 2024 15:41:58 +0200, a ecrit:
>> +    if ( ro->count == L1_PAGETABLE_ENTRIES )
>> +    {
>> +         ro->count = 0;
>> +         if ( HYPERVISOR_mmu_update(mmu_updates, ro->count, NULL,
>> +                                    DOMID_SELF) < 0 )
> 
> You need to set ro->count *after* calling mmu_update.

Happy to move the line while committing, so long as Jürgen agrees.

Jan

> Apart from this, 
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Samuel
> 


