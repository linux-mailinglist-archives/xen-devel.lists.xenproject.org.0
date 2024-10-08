Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A21994B5E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 14:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813078.1225860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9XO-0000pN-19; Tue, 08 Oct 2024 12:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813078.1225860; Tue, 08 Oct 2024 12:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy9XN-0000mK-UO; Tue, 08 Oct 2024 12:42:01 +0000
Received: by outflank-mailman (input) for mailman id 813078;
 Tue, 08 Oct 2024 12:41:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy9XL-0000mE-St
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 12:41:59 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f0f5a2-8572-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 14:41:58 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so6956330a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 05:41:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05ecda3sm4264912a12.73.2024.10.08.05.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 05:41:57 -0700 (PDT)
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
X-Inumbo-ID: b4f0f5a2-8572-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728391317; x=1728996117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BySjep1xRxNNS1Z9IMZ19XGhLwkUK6QE0n96zBZDpCw=;
        b=eMGBwlI52b9ti/NJk3CXiSvhn9uOHSN6R5AXVDHrM5mtjFfEyVzISkTnMnvS8580IX
         bHY8RKwfR0Xf8gjUZ+CTD2M4a3mwu1sVytAV7iDtd7hX8gHJZ/FuoTm1JYMNCmYxUlp4
         jyWPaHH4a4NH/AE/KdyjJe4Q8nTBznDlxrkbeDpZ5CxEUHPLdWvKMBceZsL4xf2L3Wgx
         jSQaeo4Q06w1C1bTvPJs+1BPlFB+niVJG7abRHFMAWDpru7oAcELTh1pCzHBYqiaYQ+W
         rpWNMWD5uX6XxmLG169NKzLLzy27mi8QyRE7E/YpAf7maR/J7bYNU2wQyz9sR49t/V1e
         pArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728391317; x=1728996117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BySjep1xRxNNS1Z9IMZ19XGhLwkUK6QE0n96zBZDpCw=;
        b=f72tz4jhOk3qs/s34hpaf2WTR3Zkeqe7GdsSZyPg0qkXw1INDO5lyRAn+/huC/U+68
         o+GqdKyJjNgabN1ZDN6cpIajUqV0sq17Y4mHg5sRlOhYKjaHBQ7JdsE2SGPA60nWdo8/
         No7Uco/e2cSRnAQR8TMIJ4a1Jw1Jf3inYzU5eOx8R7PCXexWYOzaejuSqSkRYJYylj1J
         7mpHusTF83OJ28Xe7fqB+DLI8J3UzSrtK5FoLk5AvWZuzMIIH+Z+8IBK8RorKcj/RFh8
         tjtYfjsF9gazwgN9G4KsyHCCTu8i5X24Gd1lAHavNEj4PPj1UNVLI2mCAK0l1+AszXlf
         LmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXung8sB4e7GJMv4lvsxwqCbfW/GFfsxcbSw9B6wgZxoKZNZ7m/4r334YyCiG1tv5Ait2uIQHneas0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiA9glUwwnzqFxjyv5gChLvYKaafEie40BZgx29IT/0lmH11pn
	ZgMNQYJD1qEWnCzYM5gmzeiV6nAmB6abz23P2toTx4urBq0xsILqe3az9xGwYQ==
X-Google-Smtp-Source: AGHT+IGAlu+cKaCVckdsg3uxp4v+w6rA+Mc10Zlx1d75GCxMMDHNYGM8rocZjRFfZS/PnTRQ71K4/g==
X-Received: by 2002:a05:6402:51d0:b0:5c8:b983:cf35 with SMTP id 4fb4d7f45d1cf-5c8d2e73414mr13622212a12.22.1728391317524;
        Tue, 08 Oct 2024 05:41:57 -0700 (PDT)
Message-ID: <24ac3cd7-5c49-49d2-9a74-9e8572c62dba@suse.com>
Date: Tue, 8 Oct 2024 14:41:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/msr: add log messages to MSR state load error
 paths
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241008083901.72850-1-roger.pau@citrix.com>
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
In-Reply-To: <20241008083901.72850-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2024 10:39, Roger Pau Monne wrote:
> Some error paths in the MSR state loading logic don't contain error messages,
> which makes debugging them quite hard without adding extra patches to print the
> information.
> 
> Add two new log messages to the MSR state load path that print information
> about the entry that failed to load, for both PV and HVM.
> 
> While there also adjust XEN_DOMCTL_set_vcpu_msrs to return -ENXIO in case the
> MSR is unhandled or can't be loaded, so it matches the error code used by HVM
> MSR loading (and it's less ambiguous than -EINVAL).
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Changes since v1:
>  - Add messages to PV MSR loading.
>  - Return -ENXIO from PV loading path also.

I'm not fully convinced of the need to change the error code, but I also don't
mind it.

Jan


