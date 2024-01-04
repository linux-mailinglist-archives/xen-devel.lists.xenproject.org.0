Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504148240C5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661646.1031344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLM4E-00078u-Rq; Thu, 04 Jan 2024 11:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661646.1031344; Thu, 04 Jan 2024 11:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLM4E-00076i-P3; Thu, 04 Jan 2024 11:39:18 +0000
Received: by outflank-mailman (input) for mailman id 661646;
 Thu, 04 Jan 2024 11:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLM4D-00076c-Ph
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:39:17 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e382b8bb-aaf5-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 12:39:15 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so388823e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:39:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p18-20020a92d492000000b0036065754088sm305953ilg.18.2024.01.04.03.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 03:39:14 -0800 (PST)
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
X-Inumbo-ID: e382b8bb-aaf5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704368355; x=1704973155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ckAMSxSujkrjk1V1U2vRFCQFyTKfXn8M8XVYfl6MZY=;
        b=Mb97eW4/gpfGdjv+yCbVbd7iPyAF15gXi4RdFDs8toADS/U6X3yGx6MgSEuKsnZwas
         KcBTkrzaU8sQIgI3FibujkCUyAB/BrRx94NO8dGx2FTfFxJRffGf8rpcUy76FHPPHvTk
         OLadWMsyBxS3VPPEY4fWun5wvgPDMKwXGGUE38wFQvR/WZVU6kMw3jPm/0o35Jd7+ZQw
         EJTOvD6wF+YRF/zKNIRlc90oYW16v8Njc2flXNlaN+YVvTL66tST+hHhbC8UCKwKhuzd
         ExiBZP3rjvlFbpYAU74FENRkkr+NCtTn9Fmbe80Vsuemoqy0ksPLdhhg2baUR9Bv8y+W
         neHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368355; x=1704973155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ckAMSxSujkrjk1V1U2vRFCQFyTKfXn8M8XVYfl6MZY=;
        b=UiOTj0pZBaXhPzP5QBlG3wRKFvJGzMhfuDxlo4J5AThgdjW+Cw8mt9XKl2qT1afc7J
         i7Bpp3Fk/dHMgR8AxpQ4L0t22dqQh2uD+9d/95X2YqeKJgm4Y1FLy2CkSj0cGRYxH2Ej
         O77YdV/V0IE/bhHBhGpbNrgjKRwi27TgUIHVJTKjbOmTnUVZE7Qje6g1LQhUOlT9wXKa
         iAuKccWhoW4lk7sPiG/c0mb5UHHyr004VNNQFEJsxnuMPBpR5LUGgYXFdyVlXr+/hQNP
         +Os6jlTCI8hJAtw64xaKw5HwGF/M6GxdYAe/57PDVxC6MvHpXNj7FcL5jLCLeVuElqNj
         CUug==
X-Gm-Message-State: AOJu0Yw5IGwN3lyYEXKmasZbE1fryWCpdXtx/2Pdhr3ZlNWskIKCNisj
	4VI0NqyxrjzCL2Lu+Axdbv7wtJe3X15Z
X-Google-Smtp-Source: AGHT+IG0D923rEfJk5lhHFljZtnPK1Tc34TumSK5L9lJfzNDXZF83rPI70tCeLVAORBnpaijwdKoJg==
X-Received: by 2002:a05:6512:5cb:b0:50e:75ec:26ed with SMTP id o11-20020a05651205cb00b0050e75ec26edmr163294lfo.47.1704368355081;
        Thu, 04 Jan 2024 03:39:15 -0800 (PST)
Message-ID: <f5a8bcf4-6d07-4e9a-9da9-917aa4f0c769@suse.com>
Date: Thu, 4 Jan 2024 12:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xenpm cpufrequency settings don't work
Content-Language: en-US
To: flamv3421 <flamv3421@proton.me>
References: <syS1MXE7yvGnsDP-cXFUjca-0S1PkY-H2thU-X7ECmFD2VnugsyWnS-7y386-LTwhazuSggAuZI4d7F0Myq1tjLuw18CeOXErRKHJFCowpQ=@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <syS1MXE7yvGnsDP-cXFUjca-0S1PkY-H2thU-X7ECmFD2VnugsyWnS-7y386-LTwhazuSggAuZI4d7F0Myq1tjLuw18CeOXErRKHJFCowpQ=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.12.2023 12:28, flamv3421 wrote:
> I used xenpm to disable turbo mode and set the maximum frequency to 800000 and governor to powersave, but my laptop fans are still running at full speed when I am using xen and the average frequency shown does not match the maximum frequency I set with xenpm which is 800000.

What do you derive from that the maximum freq isn't 800MHz _after_ you set
it? All the CPUs are in P15 as per the output you supplied, which is a good
indication that no lower P-state is in use anymore (as even the CPU where
the command was carried out was still in P15). Lower P-states would of
course have been in use prior to you running xenpm. Sadly while there is a
way to reset the statistics, the hypercall subfunction isn't wired up beyond
the libxc wrapper function.

> Why are my fans running at full speed and why doesn't xenpm maximum frequency setting work?

I'm afraid I can't answer this question, as I don't know how exactly fan
speed is controlled on that system of yours.

Jan

