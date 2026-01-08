Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885FAD01723
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 08:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197330.1514897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdkjB-00045R-Lw; Thu, 08 Jan 2026 07:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197330.1514897; Thu, 08 Jan 2026 07:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdkjB-00043T-JH; Thu, 08 Jan 2026 07:46:41 +0000
Received: by outflank-mailman (input) for mailman id 1197330;
 Thu, 08 Jan 2026 07:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdkjA-00043N-2L
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 07:46:40 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28c64155-ec66-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 08:46:36 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so16972805e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 23:46:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8717d78fsm30472935e9.9.2026.01.07.23.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 23:46:35 -0800 (PST)
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
X-Inumbo-ID: 28c64155-ec66-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767858396; x=1768463196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v/UXwuMlHkoNNlKHbuPzCDtvPmo+hVbp0oZ5TVGc/hg=;
        b=ecylWw1kl1hMBJr+5BbLNbQm/pDUi/AxQXO3zAztmiR0qsYzr82Bl3AdDnud/SMbcD
         A2wj7VRO6SqDwLmkzvihkN0hSadteCKyR61BCLsoFT6uA+NUHS6nO0gXau1vESCx1q/N
         Ymd6ehT72uj1YbPTMqkIuCJ27vquWtqxXJ6Zr4fvL4Hs4EQepkLh3an3YVHVDrvun91u
         ji1Sra2rQ7Y5kiOxIAZ+Re3u/HScAwQK+m5wTJA0hvibgicJ8ymV2wsCLDQ0geldoTaA
         fbreVvQyy5HZUt5nBRBP8cxhYLaV1eDsDTStsc5Ga+3XcQnzzXoHquL1DjlugcTHrIma
         cViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858396; x=1768463196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/UXwuMlHkoNNlKHbuPzCDtvPmo+hVbp0oZ5TVGc/hg=;
        b=mixt127j73eyYcv06baMf1w2XqJ8/z3kBiTo0N3DGL6SEAtsZMfotnVM6FVdBewc4n
         ReL92c8iFpwe3mNG2aIFFubxUIyY7xFUwRAW6wq3ezlIPlbgbMAvaly5AAPDF77css4j
         8C9m6oOxok67E38Hp3D/12yptRlO9xRR0ZdR1vrtBPTfUMSf3DLrMGZKFLtYREFqzUoP
         jahvFVGKJeBsNEz+Yyjca3Vqglo77MdMFvbFGDwiTq8oQIuOrRrfqh0uMglhtVu1WhL1
         RxrGRyCIjAy1W/h46NLNuA1RtAmOnkg2cD3fy83hIkJhjiW06Wojv1V3RZIhbr0XMp4y
         t0hA==
X-Gm-Message-State: AOJu0YxMpmgzylqR8HyxJ9Qhu6V/yayegd4+L03/JXkkmRpjgAzYu1Eo
	Q+NYd3UosBBLMPU3/g90bIR7XAXd57zsRSIvY+1po9agZlqknsmn7moxIr5FhiI05w==
X-Gm-Gg: AY/fxX4KWQ0erwNXsPBBQL/o977NdjKueqAbJk6Lrugg1s1MV7Gm3fNuWQzf5/mSAzr
	LoOSZqYTRKvKnRdjBcDyL7nZBQJE4YPGgvP3z9pkEZO23VHAfIsoKrk3tQCi3NG6AwEmokIr+jZ
	foRqdHXn/s1ZXXMWadn3eAiGumz/Ip2+bf49YYs73scjkLvXlgP8Wr//2y4Ygg6KUwFv2ce032H
	YTRJvJi7X2Uo4aLa1EijOg3nM/BXNujGqw33nU4Vba2hWrXZVf/T2lqihiDjHCicEtxHw4LdcOX
	QlDfLOjgVaFutm8lAlTpG/ekOVAuteB61KD9lZtoRe0R6MBwImdAM3V2L2/rBXB/bgwup3Jq/wQ
	QAXNkkIUUzPAMGa76kXdW3g8u1zsOhJBTPdKloIO4Fm7EwbS+qpZ1d+u5HXd3Dzt3M5Ix35Lt4J
	6GE0D1EN7xDrDG4ph7Vzl3XuSMGj/9Fw3cbPh2+SMJdyNz7tYKC3ruxOFhiAqn2oN3+ZrmQ48EN
	s4=
X-Google-Smtp-Source: AGHT+IH+No0vPR9q250Eccs8tc9S5N6s53hZVJizMJIwtQjTBEE5WA4aYo6Af/YCk/NiUH9AH7Z8Dg==
X-Received: by 2002:a05:600c:3b15:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-47d84b36bcbmr56826065e9.18.1767858395749;
        Wed, 07 Jan 2026 23:46:35 -0800 (PST)
Message-ID: <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com>
Date: Thu, 8 Jan 2026 08:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cpufreq drivers not working on T480S
To: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
 <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me>
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
In-Reply-To: <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2026 21:02, Milky wrote:
> On Tuesday, January 6th, 2026 at 1:06 AM, Jason Andryuk <jandryuk@gmail.com> wrote:
>> You could de-compile the ACPI tables and see if they have CPU info.
>> Something like:
>> mkdir acpi-tables
>> cd acpi-tables
>> cp /sys/firmware/acpi/tables/* .
>> iasl -d *
>> grep -r -e _PCT -e _PPC -e _PSS *.dsl
>>
>> That could help confirm the tables are missing.
> 
> Unfortunately it would appear so. Grepping doesn't return any results. 
> 
> The same is also true under Debian Live; does it mean that frequency scaling, since it seems to be working under Debian Live, doesn't always rely on this?

Yes, that's possible afaik. Which driver is in use there?

Jan

> I'm currently trying to find someone else with a librebooted T480S to check their ACPI tables, since I'm wondering if I botched my libreboot build.
> 
> 


