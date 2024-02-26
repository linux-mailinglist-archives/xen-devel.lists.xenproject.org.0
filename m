Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67752867874
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:29:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685572.1066500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebzB-0001YX-MT; Mon, 26 Feb 2024 14:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685572.1066500; Mon, 26 Feb 2024 14:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebzB-0001X1-JY; Mon, 26 Feb 2024 14:29:41 +0000
Received: by outflank-mailman (input) for mailman id 685572;
 Mon, 26 Feb 2024 14:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rebz9-0000sF-O7
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:29:39 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 786cb726-d4b3-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:29:38 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512bce554a5so3938520e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:29:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b00a3d99dc3f3asm2448125ejc.67.2024.02.26.06.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:29:37 -0800 (PST)
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
X-Inumbo-ID: 786cb726-d4b3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708957778; x=1709562578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BaaFxXwDVZJ2mUArreBYJzy2ZfGo1vhOiJJyArOICp8=;
        b=f8rgxSqPw5+MLVImmlisQp5aZh987JxRuoz/G16/HHUPwHg6tKd/60c/Uh9suIAS3P
         Ii2DzTEyLlKwILiXWOKwtkwmtg5UdnhbzKZqvgfBiI7NfZl4RtYNmI0moVVQ3cpq0Mm3
         Um/i3hGgpe79KiXOdIbdOCFC8YIW23hcjTkCdIbTS0U2FzlsNhyaKfycZ17+OsLbK4ER
         5Ac0xaTPMvd/ofykxvWmG1MumtWeA+Uit2eBQgBiTwh8mLMpizqDNPHm+r+NyzYAhB/M
         ccYsOsLWvK/+Tr1YushMKKCVjQ51hP3SudYjOmPjCvDUBLHfsI1ooqx7v3HTtkK2FmfI
         Heew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957778; x=1709562578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaaFxXwDVZJ2mUArreBYJzy2ZfGo1vhOiJJyArOICp8=;
        b=olUQicDR6Lp5YW6zCMJBpGIOTkxqQSMZWynNOISyLxTYaoFPWF/fYvfJuEkDHAupL0
         OXb0x0H0BJM5A2FYX6qlVxKSWqq4EuKUqeFeHpzcMIisnAcYr0iwM5NqblGqk14miMH/
         aF7k2q/fIsSXsZLrd+lGi5e6YfKTKe7o/r/er1+1XJEm0NJbPLaSISKxbbvGu5aNQQy7
         BpJYKPLzE9Ade31e6xg147wxjSBMvUBehbKWeqrz9YrnKbiTFfRLWBKSEpfp/e/qm/h/
         a6vSwvfnhctGwEMXtjU5lOxNZ12fMuGkgecD223nPnJeWOg3Ji0Nyq4qnWUOh5XHqeN9
         RBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0S2Y26EaLroU3w3ooOl8qHa98OJzDrTKCfkD4GgG7KVwrHDgA19w9UjpshdWx9GHq+p1rTjKyULLbliOPgYUWQTs3jUJCoKvfMpSNcG4=
X-Gm-Message-State: AOJu0Yxhq0R3gxlx0MdEl0tvqy4WIcWOvYNiCYwX6+BYz3Xcia5hnyDm
	7DzQAuXQbZMTHIAUyJTyzuAyWthRSS1RI26SLW0iEBd+GELP76RRrEn7oaQaHA==
X-Google-Smtp-Source: AGHT+IE3X4a5BHCW2jViG//VrdrAL9LZrocslKZgqFXV8XXHANZxZLiMnw/tSWyni8lI903g1vpyBw==
X-Received: by 2002:ac2:5b1a:0:b0:512:eee2:d8d0 with SMTP id v26-20020ac25b1a000000b00512eee2d8d0mr4080251lfn.59.1708957777797;
        Mon, 26 Feb 2024 06:29:37 -0800 (PST)
Message-ID: <5f884442-df10-44eb-b748-c6b359b24910@suse.com>
Date: Mon, 26 Feb 2024 15:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/entry: Simplify expressions in
 compat_restore_all_guest()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
 <20240226125501.1233599-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240226125501.1233599-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 13:55, Andrew Cooper wrote:
> compat_restore_all_guest() already has SPEC_CTRL_EXIT_TO_PV with a documented
> requirement for %rsp to be both regs and cpuinfo.
> 
> Use the now-normal annotations and simplify the expressions which happen to be
> a subtraction of 0.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



