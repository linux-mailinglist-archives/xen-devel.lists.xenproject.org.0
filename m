Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B776DB0F787
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054467.1423277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebpa-0002Yb-Gv; Wed, 23 Jul 2025 15:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054467.1423277; Wed, 23 Jul 2025 15:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebpa-0002WE-EK; Wed, 23 Jul 2025 15:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1054467;
 Wed, 23 Jul 2025 15:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uebpY-0002W8-Vo
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:56:32 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 997391c1-67dd-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:56:31 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so484f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:56:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e51a32303sm1986368a91.43.2025.07.23.08.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:56:29 -0700 (PDT)
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
X-Inumbo-ID: 997391c1-67dd-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753286190; x=1753890990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pWTEL8NwbWKSeMvZkXIzBHKo6mRTZjowmg8rsxh41vM=;
        b=GaCmwxsrTlSrUXOsTf5za3fL9z4c+vyemyssMJGyuQ5A29YTb7x6lvyJ1ZTrTIEVu0
         5KAoNc7ons8cZG2/DztpKg9sZg6GdwFmmdg2ljBhcMitaMnrhHSdKF+XQiT8jdYLjrnR
         KSe+VQPz4x5hQubtE45NBtZYgCzRem/TWlvZcxQZUmiivvjn9vJCUFATqQLSXHnkXuOx
         0DbZYrE7gyNHHtVdBgS0+kYNboaozOK8H2fap/QDpkNdMCKvbZmlhmdE2rZxvBfKwlKg
         Qsin1oviIH244+W8mzTWPQzvCpyMxmKH+kJ8tSgQOxWRLlnAS2NbVNm8kGl9IgsYWZdc
         xPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753286190; x=1753890990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWTEL8NwbWKSeMvZkXIzBHKo6mRTZjowmg8rsxh41vM=;
        b=o3LIf1FAQ2rpRnyjKqNis1Wu3t7qlJhWMPYVDr26fUX1Q+CzjsWVfnrnAZLwuhQn9j
         yCwPXJ1UXQeD+Z8ENbmfPpjq82g7gdY6QXt1r+ip+6D+RnxSzLNyJaNDz1kiPJPdZdBD
         UkDjdMwILacepXw8dam2UrGZlcUHYiQ4Zl894a/rHmNAXHlZq+fNR4Abd5Ed9fV26LbJ
         RdhVWuEyzuSo1cjNt4IHUdBxeVdfnod2xHC3JuXxbMlucVRhl/b+wAZPnrMxwm0EHF8x
         YteTmU6mJqGOz1YHTYeOak1dGRmQm2wREUzLfhEtCfqCPfzDEQ2Irg6j4Gvog7fU6Yqe
         PjoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMdPMzb8P3JJXLRBzs/KznahhoVGbsUGMoBmatCWnWcePvG1OXc43G0UxYVuoPcUIlFIDDqGx2LVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcDDlWSBVoIOJEalVX5R+i787DIcqSeZ7FyDzFHFIRvnRZplpU
	1Ci+aU5wOncXYxY+ccgnkwuyjlWqX2AmWPeODSUkQFHrp1BM6wbqrsMk9rRWSsfb/g==
X-Gm-Gg: ASbGncty9fv4D5WJ6oBNnziNR6/sQckoscp99Q3c/HQHfZeREbB2VKBRVi/TpTyjMpL
	nuVsxFye9pWZLy/iziqQdTIPE0/c//0d5k7iI9dQJFH0P1vhiMuaCpghH6II5H8rLwUlk+YfHhN
	UNfBCsCHzfMc11lvvl6EwL2slSE5rYElYtNZ9gxgKg08keTN4bATtOCeaYpN3tEpvJu/Uwtehxv
	zksHCL7/sjDSTnOq1BtKZ6klmXymdWYi8cfJbANMHy6VAdsppoHSL5b7fjYr+UXmTt5CCRZJuGH
	mQ+vB6KjUnYa8cZ25/pRfIsxuL4J9nExe8kmUlkWJaAH1dm0caSt4vNZ828ktiRwK5201H7ODr2
	fU7URrHYJ4KkscB9uOiHPWWwj2KBFdwh/jR6ZB73CLffVHzcITYjd3UAgvHEA6fiwPtAVvLhikk
	1DrTq+o8I=
X-Google-Smtp-Source: AGHT+IFrDYGyZNs2l8XfbX0Gjc2eiVg5Ry/pvXzMMlmqksxmm11Dc9+AAjQpnRb/no45Cb27Z7mbmA==
X-Received: by 2002:a05:6000:40da:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3b768ef3c90mr2974502f8f.33.1753286190415;
        Wed, 23 Jul 2025 08:56:30 -0700 (PDT)
Message-ID: <9df16790-268b-4221-87ec-829ab4446872@suse.com>
Date: Wed, 23 Jul 2025 17:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/19] tools/cpufreq: introduce helper to deal with
 CPPC-related parameters
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to deal
> with CPPC-related parameters, in order to be re-used when later exporting new
> sub-op "get-cpufreq-cppc".
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I once again wonder whether this can go in right away, ahead of everything
that wants re-submitting.

Jan

