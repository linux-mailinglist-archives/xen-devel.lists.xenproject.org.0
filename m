Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6561A78B47
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935420.1336837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuaC-00085b-Vq; Wed, 02 Apr 2025 09:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935420.1336837; Wed, 02 Apr 2025 09:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuaC-00082T-Sj; Wed, 02 Apr 2025 09:40:28 +0000
Received: by outflank-mailman (input) for mailman id 935420;
 Wed, 02 Apr 2025 09:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuaB-00082N-Hr
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:40:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c03788-0fa6-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:40:26 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so70667645e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:40:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb613aabesm15049185e9.39.2025.04.02.02.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:40:25 -0700 (PDT)
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
X-Inumbo-ID: 81c03788-0fa6-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743586826; x=1744191626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=InMwXKqE5qe8NGSs3K9c17Beqvph34pwUmT987hRlCc=;
        b=VpqQegJ2HrDh+n8mGGt02cNm+pUFLMz34rHZbwzlZ36YHFaxI7tAxybsJB9I9+OgFM
         YmYjmJahwUIbJulrT/tWFFsJakie0IJZsfXAfWea8mQqKNXSEGWqNwsqgi3L6en9qUE4
         gYxdoFAuKjoETdi3KpuzroR8ZRhPSIZ1fX2G0BKOR37hF3yYw/35+KmhrAM4jLH2Ka20
         5ufBSbC6etsSWTRlRT45O//QQtT7w/UnZmOUx9s0MC0bO5UiQweVUgQg+IkgBjlShpQi
         EF7DVqYUhS8NPX8bsSaeHZrEZWaZD6hsZi+JcHyklJbocoPr2pRCHj393XlgHb4u9u1W
         sQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586826; x=1744191626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InMwXKqE5qe8NGSs3K9c17Beqvph34pwUmT987hRlCc=;
        b=jmbJLrv9meT+O304M8jIGYnbyM8WlDFSxtAMwfxrkPcpvXoYgPy7i8X+iqWO0zI2Fe
         aTxFV5cjYVoLKN7worztfHVHyTsloak0op2V5EAHP94Z4uKC/iRn5xGudoErGdN1YjYR
         M/iwI7trZ8wjOnzs6rG9wajo3RC2odugeRzgvSaIMu4+31OBMVVz2ZlSgXfxizX9FaS4
         xOug209FbY8/HN3s+8iY+m3i89qXX0/xACAi5KJlAQBRkhbwL2TdB0xEH/MZbCH1hBzZ
         kUCAyxlb2IYCndOpjpZJe0yA8HSgK1ktdzw2eZORiyxveX3/q7yHRFuOQ4WMio8M2D7O
         qOmg==
X-Forwarded-Encrypted: i=1; AJvYcCWJs6HN0rvrO+UhvyNR0jmrgknskDiz3VrW1aXpEDxxL8T5ZpfVIwmb4UWBbgx7qUT0FrrsZgsww+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMrUtusExGoIRiermd6/d74B+/FUp2UJoo05HhtYuig17AhjM8
	p/B5Xb2njgD5ffEYR0Vm8j1cBdhTIDjYWn7W1au9CL43Lq8v2oQBRE0ajwgE6w==
X-Gm-Gg: ASbGncukU1AenzRXjlhGTJsI/ZxABAZL3OKyzNpW3u/6LJXmDDWArvItGHIg77QqrFg
	+qQn63YSxGatTi8y/Yh2vqY/AJjuaUo355jSenUxKWTQbfo1yboR4awV3fI9RLBXpSYG7ku1JdE
	EIfXSfZBEqOBErMcBrxGN5F1McwQ4Kj5FrjRqwhwGQlYfkSEugqZ1rbbKgFJ4mvbfoiJxV/fPIg
	AkJMLT8oZZ9y3C4ZKHiIPdiEVcHQDdp7NmFOBljzRILLVGIDMsFCpWmHNy+9IlDOXsVE6v5nWel
	jSo8g0ZEVC3czGLvelfH9LRIPXvIzz1TeVHANz0ofePBLbx5T6PZAPU4asXoHlCMTJpEevUTYrr
	8qwsDZNCIqRCrF2zyuqJmK8lnsSkGe1Nk49FOo1xB
X-Google-Smtp-Source: AGHT+IEWYYoz3km9Zpy8u6oaAaE0mb6oF4dMBp9jAx927mae0CjwYrjBDZAv9WeL3k98zQC26bCO+Q==
X-Received: by 2002:a05:600c:5108:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-43db624be12mr140553625e9.18.1743586825975;
        Wed, 02 Apr 2025 02:40:25 -0700 (PDT)
Message-ID: <c84ee77b-2a5b-49d9-ac4e-018ce359f67c@suse.com>
Date: Wed, 2 Apr 2025 11:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/vmx: Use asm goto() in _vmx_cpu_up()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmkhn@proton.me,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2025 01:34, Andrew Cooper wrote:
> With the new toolchain baseline, we can make use of asm goto() in certain
> places, and the VMXON invocation is one example.
> 
> This removes the logic to set up rc (including a fixup section where bactraces
> have no connection to the invoking function), the logic to decode it, and the
> default case which was dead but in a way the compiler couldn't prove
> previously.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: dmkhn@proton.me
> 
> RFC.  To be rebased over Denis' general cleanup.

LGTM. Can't this actually replace some of his cleanup? Judging from
base-commit: at the bottom this isn't based on his work. In which case:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> In principle, we can split fail into fail_valid and fail_invalid, allowing us
> to spot the VMfail("VMXON executed in VMX root operation") case from the
> pseduocode.  However, getting that involves a VMREAD of VM_INSTRUCTION_ERROR,
> and error handling in case there isn't a loaded VMCS, so I think the
> complexity is unwarranted in this case.

+1

> Bloat-o-meter:
>   add/remove: 0/0 grow/shrink: 1/1 up/down: 13/-32 (-19)
>   Function                                     old     new   delta
>   _vmx_cpu_up.cold                            2460    2473     +13
>   _vmx_cpu_up                                 1803    1771     -32
> 
> The if ( 0 ) isn't terribly nice, but it's the least bad option I could come
> up with.  It does allow the structure of the switch() to remain largely
> intact.

For the purpose of the diff here I agree. In a subsequent change we could then
still move the whole blob to the end of the function. Especially if some of
the static analysis tools didn't like the "if ( 0 )".

Jan

