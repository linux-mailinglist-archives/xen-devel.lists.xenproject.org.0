Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88672A96B3E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 14:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962651.1353821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7DCJ-0002Hk-KX; Tue, 22 Apr 2025 12:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962651.1353821; Tue, 22 Apr 2025 12:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7DCJ-0002GH-HL; Tue, 22 Apr 2025 12:57:59 +0000
Received: by outflank-mailman (input) for mailman id 962651;
 Tue, 22 Apr 2025 12:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7DCI-0002GA-0b
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 12:57:58 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695a76e6-1f79-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 14:57:56 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so3464807f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 05:57:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43bef1sm14938907f8f.49.2025.04.22.05.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 05:57:55 -0700 (PDT)
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
X-Inumbo-ID: 695a76e6-1f79-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745326676; x=1745931476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XeEWnGwG0q3dUrLy23IGzh+gE6GAFlLjKebReEEWiD4=;
        b=Z/BFEROsQhI6qFOy4jdU9tFm8jdn4+QzH3cdLWxF5vFwkChL3v5qNDRdxiqYYbHnhw
         FMQ9bDIErlbYr8EEuAl2ryTepn84hzaOcrIcBqDD/byGk7zChmb0AmLTarQnwmGuJTgR
         7pFGvkK0OAsV7vNcmHQI047X9StvxJQQBKcA8KElnY2vNte0RTZfULW/2ZXaDDYEmDrs
         JqrlA12iJejLOAPr7agtgZXphZwpjxE/jIHpBRXdVH0sh2Sp7Dgn5Cp7WhaDtOii6hSt
         yEja7soZ89zthH5jdKFhvVuJxymEUwp6pQeobkagO06JZKuzWvYvIp8V69FHlKnUFCEN
         kONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745326676; x=1745931476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeEWnGwG0q3dUrLy23IGzh+gE6GAFlLjKebReEEWiD4=;
        b=DwwM6yARQ5JgjmzwMvkp9jxpuibklLU+EDuWvmp8jvseo8HdsE52guSI3WvFCxkNum
         zwhDVZ4RmovagBTTi31jtaUzNNTR1naSYtzcbyskI14kiuc5yCzaeJc918NgMpEcbQBK
         9s4oHM7UDmGrccbal4mBG9EtLa1QiWpdklyUbmynPfwc7AjxomG3V9x78vyQDPcXeQN4
         SLRBgIX99P2Wd+9ltHfHXmFxZwphOt/fJdRok2ggPS3yPhxkTrwQT0e4fHZwjFg52FP4
         PBC5L468T4lLeOK0r2TzzlTZcvk98w2LpgVVxU+4T5n/MbMDEoi3zc362/LZWtXbocuu
         vOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVibDUdKMIBODCMPQL1nM5fVaGpU+WaRrje3wgCsHRT1OULyHjRY7l4oruHi/e+fGeVITo81qVaDIU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGhVVI8kFtOZE17RSOhj+nLLFClimi0HFh60yEAkEDf2xYZI7o
	7aFIRzAKc9l+YjT1CJozf2ju401IrbIA3VScOw520EPtVfRJJ1DvhpgxhUn6iA==
X-Gm-Gg: ASbGncuefDGsjpZUBB/YN+zS1GGVPfTxDX0kO9q4+5GoapnTyyJSUjUJXoAp+MuFosf
	0sqLL6DgWYucj7meRDqiXhZ+bdYSV0+dmXe+c5SKxCin+x5GyYlVUNVYoKtZwwpwmLxZUWGL7q4
	mFFWYA7ZzOhMIkd/WlGarmNCdYFcd/STkwnjSWUom99yls7ij0FqSNn8d99czCExxrb7Ob6oBAg
	NvTq7Jnwtups4E7TgBK1rwKnwBQToUQogH2mLnjVAhKVpDjkHFY7czexAOi7cqwfqPvw1Scolhq
	E6F79YxvFOOuq2ulPYGL1h3oA115fNZ9RvUiSt/3mjMnRoEezzEAP9IEQbKv3eaHeFRlnt3mr9n
	X1OLWMo9a1ucLBqtQbjzayQgsCxgy4rD9xdj8
X-Google-Smtp-Source: AGHT+IFBY1RfGcULCf+SFTYFid41qr3bOAVTqUxl5ZXZjq0+2P6hDxTviQ1CRoE87Y+ykUxhLqcxFw==
X-Received: by 2002:a5d:6d81:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-39efba2e660mr12481150f8f.5.1745326676207;
        Tue, 22 Apr 2025 05:57:56 -0700 (PDT)
Message-ID: <d2a16309-2a28-4669-bb14-6e348034d93a@suse.com>
Date: Tue, 22 Apr 2025 14:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Consistently use alignof()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250422114134.1291254-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250422114134.1291254-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 13:41, Andrew Cooper wrote:
> We have a mix of all 3 spellings in Xen, as well as having compatibility in
> compiler.h for older C standards.
> 
> Remove the use of __alignof() and __alignof__(), which reduced code volume a
> little.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
as it seems sufficiently unlikely that ...

> ---
>  xen/arch/x86/xstate.c                |  4 ++--
>  xen/common/coverage/gcc_3_4.c        |  4 ++--
>  xen/common/device-tree/device-tree.c |  8 ++++----
>  xen/include/xen/config.h             |  2 +-
>  xen/include/xen/percpu.h             |  2 +-
>  xen/include/xen/xmalloc.h            | 16 ++++++++--------
>  xen/include/xen/xvmalloc.h           | 16 ++++++++--------
>  7 files changed, 26 insertions(+), 26 deletions(-)

... the headers here might want re-using from outside of xen/. As mentioned
on Matrix the other day when a question was raised about asm() vs its
similar alternative spellings, I think it's generally a good idea to keep
headers tidy of possible name space conflicts. Just that for the ones
touched here this seems pretty unimportant.

Jan

