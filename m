Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE319C5512
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 11:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834361.1249989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAob2-0005AI-30; Tue, 12 Nov 2024 10:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834361.1249989; Tue, 12 Nov 2024 10:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAob2-000586-07; Tue, 12 Nov 2024 10:58:08 +0000
Received: by outflank-mailman (input) for mailman id 834361;
 Tue, 12 Nov 2024 10:58:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAob0-00057o-Ni
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 10:58:06 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd21792f-a0e4-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 11:58:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso69199435e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 02:58:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6bee9asm248081475e9.19.2024.11.12.02.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 02:58:02 -0800 (PST)
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
X-Inumbo-ID: fd21792f-a0e4-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZkMjE3OTJmLWEwZTQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDA5MDgzLjM1MzI4Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731409083; x=1732013883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RPuFwaL3me5rE1rrWrcYUqVhle61hcZ5cCjlmR55mtM=;
        b=dgv9M7IZZ/vS75j9xjH1y+gYwWQOTYyWcHVN/uM9TeOS/SRkVcbhsHrCZpux7xCLJ0
         S1goqsdxMWJ512FYZ37TUc0TgiEoXTPP/1sgVniDScPlikMPsTno2bhm4OZz/Thk+q5s
         ipcIZfS6dkZV4/oBse15M5SxZwYLRVSuIkSELA3KoO2KB0ZL9jHvJ/0herLogm94i5wX
         9CSJS4u8Y0T4/U0uXkl/PI+F9GE5dE1QTOW+S0QqltVZzfS1yzuyoc9AW8yRK2eSikks
         m7htHPh1l+ySGFUitXl2K2CQa8duowMAHaeY+knkqlBDt2UBgRCEdTDNrojeyc5+0Z71
         g3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731409083; x=1732013883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPuFwaL3me5rE1rrWrcYUqVhle61hcZ5cCjlmR55mtM=;
        b=aUeU44GtFNRcU8MmZRLoWkpKnyuZQK7R+BBdB4Qh8ilP2RsSGVG8oCt2RTn4ThtH/P
         S//iOlSxsvLg/d+RLtK6qz9XRRi1yZw1WJpQL47pUABstQeJt/8yrYmHDIvesVOaFe/D
         Ziqb9QYvQ9UsQQF9f1AcaQX/MexQZKP4QW6W6bKoH3NFpsp58sC3qgXkd3KlBWqZmIQu
         KPNtvgVMdBv4TMuNM+sfvgzxjucNcU7Q/3zrBwTyqcBfysAXZjUHd4PiLNPGn9OxSzxc
         4wzoWd4swvwFbV46IgkuH0qcBTC0siRvWYJFUbCZEYEpojUmJMGTj8Z/uDbgcznU820S
         N1og==
X-Forwarded-Encrypted: i=1; AJvYcCWHQUBPsEAcFob9Iq+UCRxLAx9vtB6mvkEE2Nt8Dmeao4cZG79PiSrmKim7S+eCmshZ928fb0p7vlc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiqiGaejXN1JisW8GHUgYjnZXr6jYM6/ZXfTgU7vBxbwrPtB8O
	bkT3dCYWzHR5lDBRTt7q90DFdmWbZsf82aWJloZI7ZL4ttSuh8/yznJNuWiLq38tbHy6TSM+4BA
	=
X-Google-Smtp-Source: AGHT+IHPasvj9xMOPTVMKwILgqKoXOexJdH+LG2I+tjFMPJ1SHhXL8Xi5dSRlrxyyNulCguP8o5ARw==
X-Received: by 2002:a05:600c:3b87:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-432b74fec0bmr177737075e9.3.1731409082814;
        Tue, 12 Nov 2024 02:58:02 -0800 (PST)
Message-ID: <73bdda88-da57-475e-87dc-943d527b3e67@suse.com>
Date: Tue, 12 Nov 2024 11:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/ucode: Rework AMD's microcode_fits()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108144252.315604-1-andrew.cooper3@citrix.com>
 <20241108144252.315604-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241108144252.315604-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 15:42, Andrew Cooper wrote:
> This function is overloaded, creating complexity; 3 of 4 callers already only
> want it for it's "applicable to this CPU or not" answer, and handle revision
> calculations separately.
> 
> Change it to be microcode_fits_cpu(), returning a simple boolean.  The
> checking of the equiv table can be simplified substantially too; A mapping
> will only be inserted if it's correct for the CPU, so any nonzero equiv.sig
> suffices to know that equiv.id is correct.
> 
> Drop compare_header() too, which is simiarly overloaded, and use
> compare_revisions() directly.
> 
> Notably, this removes a path where cpu_request_microcode() inspects
> currently-loaded microcode revision, just to discard the answer.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



