Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11021A96020
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 09:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961762.1353093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78U5-0008Kl-PH; Tue, 22 Apr 2025 07:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961762.1353093; Tue, 22 Apr 2025 07:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u78U5-0008Ie-Mk; Tue, 22 Apr 2025 07:56:01 +0000
Received: by outflank-mailman (input) for mailman id 961762;
 Tue, 22 Apr 2025 07:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u78U5-0008IY-4y
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 07:56:01 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a48e5bc-1f4f-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 09:55:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so4741043f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 00:55:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5a9dbesm163834925e9.7.2025.04.22.00.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:55:58 -0700 (PDT)
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
X-Inumbo-ID: 3a48e5bc-1f4f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745308558; x=1745913358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2tcTu37YtIsT1En3wmhK2gW1hGg3NOVbVAan2hVjtKc=;
        b=Rh9Fv2/tz6LInKyYbEaGtEFWxFVMThD2VxzHxb2KlnHc3IvDD14MqjOmy3bFzwS9Pg
         ThADEZZ2vpHgRD5XQZDHZxty4PABvl5/88/jraIcG0OneVrUnxZjx0pFvkRucsoJluQf
         9UpnciQfMIC9HpZVdiJi8Snvi8b7q82mNg6198XfyoGp5mnuRTVUUT5jXUPacfyQhySp
         yM5kZWk97A+zCPyasHg3ICvvNYFYtRLNOSBrDdliDdEKNo3p1CKuGfALsL//ejrBxHr+
         TFltlTQmzTJMMD449flUGwoqxHpAj+ob/BCLXiNcgfpR0r0n4x+RoHHl5WsaOsa/gCcC
         cgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308558; x=1745913358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tcTu37YtIsT1En3wmhK2gW1hGg3NOVbVAan2hVjtKc=;
        b=bM3p1IItOrnXMpmfqWo0tRLDBSR1MPIV3d1xu+XSgnUkHiRzw9AFvjvR8AU+4P/8kJ
         PFaSRVkX8Xi1aFRTlAF+973+KLMeSokZo9/bZbPLbuSWG0vzOQAmU4foyxmYW6DAjLpy
         UqKM05DIwEP2LuOxSsMqQtCoBUCs7B2Wp5qcm3JG/k7CkaRGj8jwGKkT8Kk5upnGAVKD
         W+AMHgqsZq6wGlyXP1P7ythRY+xX9dJV79LBTQjDr5ThVFSI9Ca+sWD/8wxgtcYuzKSt
         UkaJCRoO7ZiQ5HR4K7F/Ke6DAPIqRbN73DjEIPgyACep+dEITDWYQobG9Ga0x4R1bKNk
         3zjA==
X-Forwarded-Encrypted: i=1; AJvYcCXpI6TgX0CrVbPXZpbGRJ7J20urx1mK3EdFYlRxnhWDHOGgXK8cJtzaJgoEl33EUEu6ujMsaeMHim0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyamjLmVsaMVmdYAxZ5w7UNKYgBNIEamz4XwcQlzrNRf/OfXXYa
	vSTRP1AzRvMGT4L1RQBYb5rAvPI3uBTW3Zgm63+naiDtFR2zftAyLVKOCty6zA==
X-Gm-Gg: ASbGncusczDjbfbjjHgxQ/a5yDtgVGU2aSMCZMH6c60o0d2LxFQkbLTIRU3t1sh7WYq
	D+V1efe718/IuYqUh/HblUKM/FzxANKPfvPH2ceDUUPE/lSrv0dH+VavEIPkrih1sbD9MxKAYBg
	gJmwb2CDqhNCqVqt/hJs2fJZb8+kfvhJgOf97Ji7zmMuOwtarvnLvSM62506d7d2JT/Z3u6BYlb
	asDJ4wz24TfxDMhVS5ILojBUTj9P9GJz8ftRujQA97wfmiGr3jxg3tYoUXJmG7jGG3B714V29rm
	xrJOmJ2cs5W7krj+rtdHwzrIZOWiQPVFJ3D5iE4F/11DOxoaDpR27QRL5I0SOHGnwT9yv4dSikB
	bCpIL6pIQ6zmxeCl2EA+SomQSxCZuZURYc0ct
X-Google-Smtp-Source: AGHT+IEz5I3dCPsLNn9XIGWPS6j0SL8bQXczrrllReovYkMDIUYgdlbWj9QjlHIhcJRIFP4m7HoRkw==
X-Received: by 2002:a05:6000:4205:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39efbb1f40dmr10383039f8f.58.1745308558516;
        Tue, 22 Apr 2025 00:55:58 -0700 (PDT)
Message-ID: <c76427bb-87b4-4c51-a057-1942b9c3d92c@suse.com>
Date: Tue, 22 Apr 2025 09:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Update __vmread() signature
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com
References: <20250422011530.3010312-1-dmukhin@ford.com>
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
In-Reply-To: <20250422011530.3010312-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2025 03:15, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Current implementation of __vmread() returns the result via pointer argument
> which leads to having excess code in some places.
> 
> Update the signature of __vmread() to return `unsigned long` and drop the
> pointer argument as per suggestion in [1].
> 
> Update all call sites everywhere in the VT-x code.

You did read Andrew's reply to v1 before posting v2, didn't you?

Jan

