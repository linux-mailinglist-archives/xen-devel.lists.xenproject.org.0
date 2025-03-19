Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A21A6899C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 11:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920222.1324448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqib-0004iB-Ms; Wed, 19 Mar 2025 10:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920222.1324448; Wed, 19 Mar 2025 10:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqib-0004gQ-KG; Wed, 19 Mar 2025 10:32:13 +0000
Received: by outflank-mailman (input) for mailman id 920222;
 Wed, 19 Mar 2025 10:32:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuqia-0004gK-Sy
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 10:32:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 697c9599-04ad-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 11:32:11 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so43318295e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 03:32:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55c3dsm14757445e9.23.2025.03.19.03.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 03:32:08 -0700 (PDT)
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
X-Inumbo-ID: 697c9599-04ad-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742380329; x=1742985129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BBRFFO8agptcsJuTX2gy+p2VorgxsZWzyeM33kaoC3U=;
        b=JoIMHSardXSTbabTBFabg0xJed31o70qGb3DtPtKDpxqGQ8TuGHVS/2v84xaRzvLrR
         aMAMakL8e+Sw2nlff7xGSwSDc1E8/WyhywZvqYiIWxBynPfGiv5TuC43GBbDEo0tyKHt
         W64KRHk5sWOPjRk7k9o+X6OTvGbCAAL7S7QpxO5NmaO5cdpycBME2fVvc4XVMs2BCWBs
         0XCi6KDJcX8eVuPeij7VXnR0pwLTFaLPjVKy2U11xPhSHPL6dKVgZujWF0FsV5aE70f6
         2mRcB1MREqUo8/IbYvrL8x6Gk9AksSYHnVPeBTpH22R+rkFHY8dVAX0eRIIXNMbU7XNW
         BktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380329; x=1742985129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBRFFO8agptcsJuTX2gy+p2VorgxsZWzyeM33kaoC3U=;
        b=G6XBGOjOKMMuMhfS5/PkmqkQnpX2qujdhfjQKGI/R7XAji7NgYhYV1U4/Tw9VwFeMv
         Mll5qP3Qa3lKpzM6NgzQ9CgOrIXadb6vdr9zwjmUyueY2ddvx65MWDX9r2fK3ojQ5Ygz
         k0q39ieMEgBV6ZpOICbE+lrQA8w0oyjkERcxdogN+BTMPi9ZaRO5y/2IdAUEzr9oJXj1
         UYeg9PrSToTEpv9THhMjpfn1GZNKmzJKUrk8AQYao5b9zi1rBxfg5JD3Jjqy2sRGebfm
         BfWsFDbXFxoeIbl/pCWYSsA1yS+OwoaqUECwJN7OOwzAFIl19rPvbs8nS04l44HSfdV1
         IM7g==
X-Forwarded-Encrypted: i=1; AJvYcCUWEGDOhZDZhBzgTSos6O79J/PM03JZ0Rl9osvsm5TKe+2AQJKw6nPtNDbiZYYh7aQrPh5emPX5zek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbQ97Z45ygo1+4mpVbZlUNQgGYCKIGyncQ/Cu1H/VI/OGcI+6L
	xBGdl29kylIkl4NdfmWR9D9LH4Ow06+2XDdcAj5ONBgsxdMd6Yu79mCFGfKZVmh+1RBcfxBTgkw
	=
X-Gm-Gg: ASbGnctW6Bad2X3b1SZO3EVIvlMKX+ytyIfwrHONivZJj4xiOxCHbBeWBsRa25rfR6p
	vYbJjssgcWGidRXGGLgxlr9HW/WWwOG1GUBtNLvYgoSRblxN9U8mRo3S26Qc0OByrcHdHc1wZ0C
	EBBS4jTBeJzFoPZJetC5US+c3igM9qd4mnfxKh2gi2MuxWyeEEsv2HJ5fv1DifYzfhAsKF/WBam
	sMa/8uJ0AuIFu+zkEXqp39kvrlif1LCWucivwjzGF4SYJACcpgClLvcXdEK4a2DCJSlhKtvlcx1
	pYoA0hAYo2wXf6BJF21RzMsEsJNusy/8PazlOP54nw44GQYHM9nhjaHlXyxFfyZTBqEUS42lKLH
	qFxd2c7838oO8Xb11xEseob5cQglYRQ==
X-Google-Smtp-Source: AGHT+IFVMSg2U5FhhGngbR/qm0jZ2AulvgZtFYBwFYWM5wAqQS25QY7D3G95u11wdVsMHZXAaMhjyw==
X-Received: by 2002:a05:600c:3503:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43d436c84edmr15208135e9.0.1742380328882;
        Wed, 19 Mar 2025 03:32:08 -0700 (PDT)
Message-ID: <a3c70637-b354-40f4-9a67-9d2aa7bcdcb0@suse.com>
Date: Wed, 19 Mar 2025 11:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/mkreloc: remove warning about relocations to RO
 section
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-6-roger.pau@citrix.com>
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
In-Reply-To: <20250318173547.59475-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 18:35, Roger Pau Monne wrote:
> Relocations are now applied after having moved the trampoline,

That's two entirely different sets of relocations, isn't it? What we generate
here is what is to be encoded in the PE binary's .reloc section, for the PE
loader to process. And for us to then process again once we move Xen back to
its linked position (by virtue of leaving physical mode). Therefore what
matters here is whether these relocations are still carried out while on the
page tables to boot loader created, or when already on page tables we control.
In the former case any relocation to a non-writable section would be liable
to fault when applied.

Jan

