Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E9A838A07
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 10:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670301.1042958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSCnh-0006Cp-74; Tue, 23 Jan 2024 09:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670301.1042958; Tue, 23 Jan 2024 09:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSCnh-0006AO-42; Tue, 23 Jan 2024 09:10:33 +0000
Received: by outflank-mailman (input) for mailman id 670301;
 Tue, 23 Jan 2024 09:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSCnf-0006AI-Sm
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 09:10:31 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4091828c-b9cf-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 10:10:28 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd33336b32so53290611fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 01:10:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f69-20020a0284cb000000b0046e4a8367c0sm3621954jai.140.2024.01.23.01.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 01:10:28 -0800 (PST)
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
X-Inumbo-ID: 4091828c-b9cf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706001028; x=1706605828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihJrOyY9MpuNfuAwcIceINBruwbUfjSSDbHMFrPqTYg=;
        b=Dy+kly2Eok98nPKYPKSA3pzbfIJQtlIvaPk8whOFttOL9iof4+mhcrgtwMbJY82ZB/
         ciox8Pl94T8iLdxqTaxE9kvJprVd5YWTVIXDBQy93BR669aKqivv+K54uTKE88BftcLK
         sD5wNsEVXatKhONUzSYRwRk5nQr0Tg0aIjKRq0AT+karRfYX5+Uh01MEa1c8bJRYcvT5
         DGmklOJL8CLVobxNcCPqAL4MLxE67QlIdL3G44aPAFfwlOsjnZYzUbFN8tRhTnxMHvQj
         OHqwDYqUVaUuc/slwtvdkxu/EyqBeTPgwNixZhT7hKnU3+f1aH+9sW79gkRzCulyessg
         PuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706001028; x=1706605828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihJrOyY9MpuNfuAwcIceINBruwbUfjSSDbHMFrPqTYg=;
        b=PjTAql38u8mOd/oQJfJ9qZvNghnd5KY82Yo+CLpDpojKytGoF0hqwoaIWyCur2BNDb
         9I6nwDgzlzmZhq+gHIroYXFzPverg1oEu4L7mk3vhCdAVREb9ViqT1cA+0yGnY5VphXr
         M/55zF/lw0P63QNert4DJwt7TMONe2WTLZZeztYLwKYVtA4Q+IZy/ZYomGkUw5IsYgRh
         zSV9jix0PZFxtha7TrrJGdU09gkWwyympxsrGonLVkJ1OnP83L7LGrcJnbkfjsjNJN7o
         E2ckicf0oB0C84RHMb7+1RJrODwakkJphJels8RlNUtJZvJhjWgIcK1RiveT6lZ6rwth
         Qakg==
X-Gm-Message-State: AOJu0YznXiTsGc6AJbfj+/BQSZ5O9X0S4OpgBnfZiJX2DfIVmPTU9yib
	pVAbPO2HCKPYYn/wHsg9BktJroED18AwIrSpXBy6SNJrQrRiFeKv/LVAcsrMnr4UJJkFDI9XsXo
	=
X-Google-Smtp-Source: AGHT+IHG5GMhJwDLyzRRVewsAWqxfeymqzexnyQo7avOqfPQ9/92TvROtDbNIOI6lMwYRw++C+k3UA==
X-Received: by 2002:a2e:7e11:0:b0:2cd:2c8d:1ee6 with SMTP id z17-20020a2e7e11000000b002cd2c8d1ee6mr2600952ljc.83.1706001028401;
        Tue, 23 Jan 2024 01:10:28 -0800 (PST)
Message-ID: <6b67b05d-fba0-47a7-8b89-573b7c88e3d6@suse.com>
Date: Tue, 23 Jan 2024 10:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/entry: Fix ELF metadata for NMI and
 handle_ist_exception
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240122181714.1543738-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 19:17, Andrew Cooper wrote:
> handle_ist_exception isn't part of the NMI handler, just like handle_exception
> isn't part of #PF.
> 
> Fixes: b3a9037550df ("x86: annotate entry points with type and size")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

It's a matter of consistency, yes, but personally I wouldn't consider this a
bug (and hence I see no reason for Fixes:). But I can see how different
perspectives here are possible. One this went in, I'll have to remember to
also deal with this case in "common: honor CONFIG_CC_SPLIT_SECTIONS also for
assembly functions".

Jan

