Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA159C3E0F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833669.1248853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATHI-0003Lj-NF; Mon, 11 Nov 2024 12:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833669.1248853; Mon, 11 Nov 2024 12:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATHI-0003Im-KS; Mon, 11 Nov 2024 12:12:20 +0000
Received: by outflank-mailman (input) for mailman id 833669;
 Mon, 11 Nov 2024 12:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tATHH-0003Ia-Rs
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:12:19 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30852ced-a026-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:12:15 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d8901cb98so3131917f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:12:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053ff08sm177046635e9.10.2024.11.11.04.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:12:14 -0800 (PST)
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
X-Inumbo-ID: 30852ced-a026-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzUiLCJoZWxvIjoibWFpbC13cjEteDQzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwODUyY2VkLWEwMjYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI3MTM1LjcxODI2NSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731327135; x=1731931935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3oMaOn2JZZi/iEhm1P2NdKkF6Ub7BkbtadullinisAI=;
        b=G0SYsFtPzaCEsKeSXbEewjfXYdgGkYOkYjRHtL4dqBHDXWP52XFxJSNKiIFrunpB8O
         +DhgPxN/vq5bdSG+xohzk5jsZU6RVQigtNiUoojn9ICqWULwn+qvZECfaVsnYoiiMlhF
         U/57S/SyWuMagPAiZ9DNDtTJ6jvbDeLSvOQappRf0ckwEci7XXRo1acfCNBWVpYcGjzV
         DBm+ReJdHcy8m+5Tz2Kiy367a0lNVXprbF3V2fE6Dv6TDJW4uIgUAvhRz3+icZnNGQrc
         VVrtzD8sR48Jnv9BEx0BDZ/KqNggZDiUaHdbxRUekS/yXdl9tjYoF9L0g1SviJFYvOh4
         lefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731327135; x=1731931935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oMaOn2JZZi/iEhm1P2NdKkF6Ub7BkbtadullinisAI=;
        b=PW/V057utnPzgbb9wbBjGLGBeG4l0HcReL8TnUcF7u8wRUHq1gZ2imlrrWg0Fh0258
         ZiADlTPhzb8cRJOheAHnCwnXBUJCpF7rJFzgtLOaw65uDdYq0s65OU3idowdvEIVOIxk
         g09QT450BEkezfpcyfms5zzBDOjlDXZ9pbDrXy/nxG4Ay6GNTZxtcuhn9ffU8NFU6QBn
         c85UfEf79NfePNSmpj0dA1PoJzEwvzbkfwh9/lSUh6lFCeO7/K3+Ti2EBiiFXeYbHiku
         1By7hrKgAe/eFKVWdjT/ax363d2ucyL4qg8yXRKVk9RDWSdlBCDlTDjGVaLX4MTKKkKB
         52Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUTkljV13Kra7CbeSyDMBD0qGQMPsGqVF1f9G5rCdv45ReLjtGpOn51GwY8Y9x5d23Y/CPWixU3VXM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrYwC1CUuMQCADaBeFslBq0fR/jjG91XvqVI8+nQ/1wHghyTqO
	io+f7nrTbhGpU7nEwK4Z1Vqb8edOThqUkwmw7zeXtL27ngWszG9i4aVRgpeKAA==
X-Google-Smtp-Source: AGHT+IFW7AMjKr10IoC5ZwVlKPFa8SIqYfqsdR1y7hcIENw0M3k9dVc04oovR129hcTOBObguX9BXA==
X-Received: by 2002:a05:6000:4107:b0:381:f587:1c2c with SMTP id ffacd0b85a97d-381f5871d05mr8276592f8f.20.1731327135111;
        Mon, 11 Nov 2024 04:12:15 -0800 (PST)
Message-ID: <89d6aedb-1ccd-4bc1-a75d-065e830ffec1@suse.com>
Date: Mon, 11 Nov 2024 13:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] x86: Delete mach_apic.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108195820.789716-11-andrew.cooper3@citrix.com>
 <20241111120551.987090-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241111120551.987090-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 13:05, Andrew Cooper wrote:
> All useful content has been moved elsewhere.
> 
> enable_apic_mode() and multi_timer_check() are empty stubs.  Remove their sole
> callers and drop them.
> 
> apicid_to_node() and bios_cpu_apicid[] are entirely unused.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



