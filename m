Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07910875E84
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 08:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690128.1075868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUfs-00010h-6H; Fri, 08 Mar 2024 07:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690128.1075868; Fri, 08 Mar 2024 07:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUfs-0000yh-3E; Fri, 08 Mar 2024 07:29:48 +0000
Received: by outflank-mailman (input) for mailman id 690128;
 Fri, 08 Mar 2024 07:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riUfr-0000yb-56
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 07:29:47 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2d8a960-dd1d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 08:29:45 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso1963057a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 23:29:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa7c38f000000b00568229390f2sm877985edq.70.2024.03.07.23.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 23:29:44 -0800 (PST)
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
X-Inumbo-ID: a2d8a960-dd1d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709882985; x=1710487785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4TSznoAriWsUNcIPeGIus6j96yiP1D9gFaPIigEgJM=;
        b=aUxr6cKRfVl0Xkbz9UfqQY42H7kgelg4dCSIEzZ7Y0tc77z7NxmokRLRy8sArHmBEy
         558Y7BzmPXveFADht1krkUrWPdNiwHuD36DWm7Kwk49hUvvCuPmO4WIpxWNDPUGqzLMG
         M1juSHU9+dGnB/MSZ03XXTUPPSUh48fQKR9+ZC+0V7xZVelojfh1s3TOQZwwnaScctwn
         n+xTQM7jsrs17nJLmdMiwkUbyFqdoMqBsNv44MzVaFIVRRvXJnpowCsIv2LUy/3igoxZ
         b6ELgNnVidTw6O7CEySplylgxzAmfzc32+T/6iLSHuQ49L4xeJJmgTddhZmgvmvrPd5e
         vwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882985; x=1710487785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4TSznoAriWsUNcIPeGIus6j96yiP1D9gFaPIigEgJM=;
        b=pYcH6086Mg+Aug1fwmsi5gV6d0zAOELoaHeJWkME4qiYjoLYnJw/FkkVf1BNNKfYDk
         JCvkMsJ9Ysz/rjwc9+oRAXzFKy6Nv2sxvt78+lt9DLG8i8cmtOijyrCIiqDjN0765Fll
         ok4XWexyY8mMgeIcwoJ3/KfCvse3rEhw4PPC4tfr47GoGqXnl65m7Tk38EV1xunY1HNC
         lS0XkFFTXT+Fe0pIuvF2e0adopkCpAq2dN1AOuaYcs9U4bfSwz7OKoWLCRzes+waQVqn
         tIfQDnqtRGnKKXCJxbRYmw2iDCZglRvSAOgluN7UX5keI/uvYkyhBfuqJDlZfCv2LnT0
         iFqw==
X-Forwarded-Encrypted: i=1; AJvYcCUtXp8kFPB/LxJDoTLwuRzsiwWS4Tw0Pyh4yKJuB/vKHDzJSDlNYlxFyc1kfTvoRt7YlfLOVrC+kJ6iRJaJPmtacyLGWZftldaqdzG5J+w=
X-Gm-Message-State: AOJu0Yy+rg8aoQq79KZln5i54APghZWFCXLGEAjr3ccfqdcVJrM/nP6z
	P/Qk4w/wxsvnGTHgRVWbTFuXbR5eU0mQ1R5U043dZxC9XkQ/XQq/0+GETvrpbQ==
X-Google-Smtp-Source: AGHT+IFOjqxwB69wkNyorCEMKbKNzwn7ir1b9yKiAyY5+588AN3u+dJXBTao6aGKYGjreGjp+Z4iGg==
X-Received: by 2002:a50:8ad7:0:b0:565:f90c:1263 with SMTP id k23-20020a508ad7000000b00565f90c1263mr1418333edk.9.1709882984739;
        Thu, 07 Mar 2024 23:29:44 -0800 (PST)
Message-ID: <267da690-b925-4679-8462-a7f91f8efd65@suse.com>
Date: Fri, 8 Mar 2024 08:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/svm: Drop the _enabled suffix from vmcb bits
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1709846387.git.vaishali.thakkar@vates.tech>
 <3c419824febca229cedf2a3bd42cb68d3a3d56a8.1709846387.git.vaishali.thakkar@vates.tech>
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
In-Reply-To: <3c419824febca229cedf2a3bd42cb68d3a3d56a8.1709846387.git.vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2024 22:40, Vaishali Thakkar wrote:
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      if ( nestedhvm_paging_mode_hap(v) )
>      {
>          /* host nested paging + guest nested paging. */
> -        n2vmcb->_np_enable = 1;
> +        n2vmcb->_np = 1;

Given the field is bool, "true" here and elsewhere as well as ...

> @@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      else
>      {
>          /* host shadow paging + guest shadow paging. */
> -        n2vmcb->_np_enable = 0;
> +        n2vmcb->_np = 0;

... "false" here (and once again further down)?

Jan

