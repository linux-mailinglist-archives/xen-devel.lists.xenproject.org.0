Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD8971494
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794125.1202827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbAx-00051R-6w; Mon, 09 Sep 2024 09:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794125.1202827; Mon, 09 Sep 2024 09:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbAx-0004zO-4P; Mon, 09 Sep 2024 09:59:15 +0000
Received: by outflank-mailman (input) for mailman id 794125;
 Mon, 09 Sep 2024 09:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snbAv-0004zI-PA
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:59:13 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a5b0eb9-6e92-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 11:59:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-374c4c6cb29so3756228f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 02:59:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25952761sm317922966b.59.2024.09.09.02.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 02:59:10 -0700 (PDT)
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
X-Inumbo-ID: 2a5b0eb9-6e92-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725875952; x=1726480752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyMEh3mJIyQkau0LWa6wxkBoLFYyYvhLWDkftEYZWvA=;
        b=X9yz7JkGooKovJOhpS0Yd6j+OB1B56MXVLI+ayPPqHI8SD/Q333p+/LP096aKk+HET
         ULrj9zdDKtcmuCTYOwW+FpxxneUOEHhVUIpznr8/aCfXH6gVzPNswVFiSUR4TGoWOCND
         I9nBSCJaD1Bhlzd66BiIV5yKF/9bhxBrUAc0lny0pLnbIosMYWmFVUc0u23N8Pc50GU5
         8LkmfW5oHwi8pO2WRQrppsbPVs4g1f6F65OE+lRDWOjZyDsnV/cSXzT/B+bgfNeZNutA
         Pr0tj8wWBd6dtwMFKxeLEOhH0hcFl5bMOUxGNU1VTtHftwLbGA9VMcvad+hEkBjRWaPy
         qIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875952; x=1726480752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyMEh3mJIyQkau0LWa6wxkBoLFYyYvhLWDkftEYZWvA=;
        b=eqGND02jz+uBI3WKn4VS0zEheVrlfAwg+42Ei7yc9gqNiMB3EZzXji7GNr0nfPxKgt
         dsU6p6Y2AFnBzXUtkCx9PuSweucTl6m9KSqC/L9FzNJnu6+sUDYa4gX1qsnAGt5N7g+q
         KqF8somc/8+805jHpVI6VUGCCvCVeJGBgm60Un7+K9/dU/SR59I/I+XGqT2uW71ZDXRa
         eD46cqGvh0Hq6+fwNg/RhkD4hMR+HIIfsRdt1MTGdhLul7ojFtJoFQdmoe8FHLIvbktq
         HrYMxRum2eUuDkmglAehKLViAkNCSYwlUl+WM5zAiP+2zafK896x6dtociO+4ZdlNOyj
         XTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5oEwJZ+Xiunnpv9kHLXDHZjM9RR7DldBCpARbKQczGNMXDfNpxWFOgrtRVQdYG4k7oI465bzGWGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEC/YBTAGvpUnzImuAx7s0uFPajcLDVac6S4fYpmiTn1hwSO36
	nJplkehowsPEGjylUNn0YksvsBuxL/oCTlgPmIQdS0GfDx8FjiT5fmc8yeCVtQ==
X-Google-Smtp-Source: AGHT+IGrHZ7npnS4Z+nlYm72331qMVyZbqrIc3XIUAM4GdeqgmqR5nWkcYeVpPPSjrYr61AO1urlMA==
X-Received: by 2002:adf:a457:0:b0:374:c318:2190 with SMTP id ffacd0b85a97d-37892466d2emr5720835f8f.59.1725875951063;
        Mon, 09 Sep 2024 02:59:11 -0700 (PDT)
Message-ID: <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com>
Date: Mon, 9 Sep 2024 11:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate linker symbols
 for Rule 18.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
References: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2024 15:03, Nicola Vetrini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -501,6 +501,16 @@ Deviations related to MISRA C:2012 Rules:
>           - __builtin_memset()
>           - cpumask_check()
>  
> +   * - R18.2
> +     - Subtractions between pointers where at least one of the operand is a
> +       pointer to a symbol defined by the linker are safe.

Imo there should be "deemed" in there, as such subtractions aren't
necessarily safe. We've merely settled on considering the risk as
acceptable, iirc.

> +     - Tagged as `safe` for ECLAIR.
> +
> +   * - R18.2
> +     - Subtraction between pointers encapsulated by macro page_to_mfn
> +       are safe.
> +     - Tagged as `safe` for ECLAIR.

This one is a result of using frame_table[], aiui. Alternative approaches
were discussed before. Did that not lead anywhere, requiring a purely
textual / configurational deviation?

Jan

