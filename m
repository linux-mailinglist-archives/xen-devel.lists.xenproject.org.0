Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A8968ABF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788116.1197557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8mn-0005Ys-MR; Mon, 02 Sep 2024 15:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788116.1197557; Mon, 02 Sep 2024 15:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8mn-0005WM-HX; Mon, 02 Sep 2024 15:16:09 +0000
Received: by outflank-mailman (input) for mailman id 788116;
 Mon, 02 Sep 2024 15:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl8mm-0005WG-Lu
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:16:08 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ce771d-693e-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:16:07 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c26b5f1ea6so86029a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:16:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c74184sm5624888a12.32.2024.09.02.08.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:16:05 -0700 (PDT)
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
X-Inumbo-ID: 46ce771d-693e-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725290166; x=1725894966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eerfp/j1eoJCJbCbMgfz1VpYzQRKVnXqcTEXx34bAVY=;
        b=Yac4XT3R1FDOJ1GHPtY+vEv2QP3s30ipBAV2PwH5GKNUiouSkBSqFE0TciCgUhd+07
         Htajqm6uAy+3m3mDydywqhzyhOqaL7JP5M003422IxVUsh/5jdVU+Rf9mTWgi/XWKY05
         wo/jR31h6RjncqNBVjdOiRp0EN6xq3Y88pu8F2kOSoBqYDp4sqeAXRryNr41kzBskdzS
         Pmd4t8MfSi7vWUN6CD+WvsVIgqtpL2dhd6DFho1KBhCoC+VTlF6OpeyT2k0qkEh/z/yI
         QL5rw1keIMu3x5YDbpvcKM86DDiLNTf6PFagRQB8rWpMcRTnB5ZtxuIU64eWCDo3uPt2
         5akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290166; x=1725894966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eerfp/j1eoJCJbCbMgfz1VpYzQRKVnXqcTEXx34bAVY=;
        b=ggiV4sqMXtF/uPPbp1pNpUseGBg67tWJBFthVg4GH/v8cZmcJNCEaLqRC+PxmcfSGT
         Xv+N2SlXRrNiJApwcBYngM2BGKbHWNKnREMFDvAy6xFbDS9FFkpvnCakaxoNrSbVs2Gk
         lNKIbF2pTRjeeX3r58kyylBhepI+AoSauKXjNNmf2wQyPhNQsBj3seBQ7st0hxF7Dy1H
         vUsZURIL5eceKiMKR55xV6TILAHXQk0RvEj8DRif9bLzCxsVaU1Y6aW+7OrGtpgP0bAa
         5NNPO1XQ7JsUHCO7Muynduxu0sIebf3SPkvH6t/+8PH9qtYeOqemenLMm/00DlEHkvpy
         4VPg==
X-Forwarded-Encrypted: i=1; AJvYcCUwYVGOJS9hnB1LUAhDGbaIjV1Rrta1csi2dDKZmYTCeJHw50n1vfdgE9CDVDr9F4SaSzx27KFfTLU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVOek/a66O9rx9w8oQnA8ZvI4ovpi7wNWKlD/5pEOiksopnY7W
	m02jxQRLjpXTxdz+IYpl/kGU71yTWR+M009kxadkdQJigfhUMpagyVWjkfRY1Q==
X-Google-Smtp-Source: AGHT+IERRpehovy6Eob3HgGczmQkXfHbEab0dShx+hpCJNTGvnkpd7NcqynDpQIrYwqwFYU88zMvWA==
X-Received: by 2002:a05:6402:5208:b0:5c0:8ecb:d852 with SMTP id 4fb4d7f45d1cf-5c25c3a7192mr2865651a12.6.1725290166198;
        Mon, 02 Sep 2024 08:16:06 -0700 (PDT)
Message-ID: <2a43b16e-8894-45a7-86d0-e78f52f18f34@suse.com>
Date: Mon, 2 Sep 2024 17:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: revert opt_allow_unsafe from __ro_after_init to
 __read_mostly
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240902150016.63072-1-roger.pau@citrix.com>
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
In-Reply-To: <20240902150016.63072-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 17:00, Roger Pau Monne wrote:
> Making opt_allow_unsafe read only after init requires changes to the logic in
> init_amd(), otherwise the following #PF happens on CPU hotplug:
> 
> ----[ Xen-4.20.0-1-d  x86_64  debug=y  Tainted:     H  ]----
> CPU:    1
> RIP:    e008:[<ffff82d040291081>] arch/x86/cpu/amd.c#init_amd+0x37f/0x993
> [...]
> Xen call trace:
>    [<ffff82d040291081>] R arch/x86/cpu/amd.c#init_amd+0x37f/0x993
>    [<ffff82d040291fbe>] F identify_cpu+0x2d4/0x4db
>    [<ffff82d04032eeaa>] F start_secondary+0x22e/0x3cf
>    [<ffff82d040203327>] F __high_start+0x87/0xa0
> 
> Pagetable walk from ffff82d0404011ea:
>  L4[0x105] = 000000006fc2e063 ffffffffffffffff
>  L3[0x141] = 000000006fc2b063 ffffffffffffffff
>  L2[0x002] = 000000807c7ca063 ffffffffffffffff
>  L1[0x001] = 800000006f801121 ffffffffffffffff
> 
> ****************************************
> Panic on CPU 1:
> FATAL PAGE FAULT
> [error_code=0003]
> Faulting linear address: ffff82d0404011ea
> ****************************************

Hmm, I specifically looked at that code, but I can see how I screwed up.

> For the time being revert opt_allow_unsafe to be __read_mostly.

There's exactly one write that an AP can hit. Is it really worth moving
back, rather than just doing

	if (opt_allow_unsafe <= 0 && !cpu_has_amd_erratum(c, AMD_ERRATUM_121))
		opt_allow_unsafe = 1;
	else if ...

?

Jan

