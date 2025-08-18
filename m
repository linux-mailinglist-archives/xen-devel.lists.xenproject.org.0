Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F531B29BD0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085548.1443864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv14-0003rs-Mg; Mon, 18 Aug 2025 08:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085548.1443864; Mon, 18 Aug 2025 08:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unv14-0003pL-JM; Mon, 18 Aug 2025 08:14:54 +0000
Received: by outflank-mailman (input) for mailman id 1085548;
 Mon, 18 Aug 2025 08:14:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unv12-0003pF-TT
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:14:52 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 629cbb32-7c0b-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:14:39 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b1f1cso4600092a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:14:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618af9d31c1sm6806716a12.2.2025.08.18.01.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:14:38 -0700 (PDT)
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
X-Inumbo-ID: 629cbb32-7c0b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755504878; x=1756109678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DXjbF+VjIPB80im+h/kRtTWNnlFN0sSNMIBdpKsZsRA=;
        b=DyI1tzzKYOWPPOs618uvE+5rkmjxba/D74oSExg63MMXWSd6mSsaNtaXwAsqS3/Nii
         FcYtFRe0ZCJDQ2UY8w5VrDeSvIC14X+hK/6SMCe185aFwBZlyg7N9dlJaV2sW0e+wXk7
         dlgtc/Vy40fIZmLydOfEmAdm00fKPInWHQvbWBEQcAEXn6D2H0LB/vO0aFxMZ90sSpug
         OrtWFUMGSMczhwnlVDtRmeUB6qTyAFhvPX9+c7ogIwGh4kLVYd0W7OWLn/CMD3rrjZKk
         NlATzb1jBgiSISOn3W2FqdxQpB6Mzl53b9zKdwU7bJy6yPaOLjlnWl7Y5/jMskq+xAvz
         GQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504878; x=1756109678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXjbF+VjIPB80im+h/kRtTWNnlFN0sSNMIBdpKsZsRA=;
        b=v6m77L5ajRQeQR+QBBKXQf3tvbKi4/+YgBhjgOnePuoEdjSsRIiJZPZzmnMynpFnCj
         xYeZrllMjNixKG4AQx+q7Xk7K1/XIf/M+DJqlLso6D8tSzMpNYDFJBl1lqP2IdqK7f+K
         A+maIgRq1jUzrKuioaqNghNroBSR5dx3Zl0aNx6qYEOrmGfWJDKgt84WHaSkxKdT3lyV
         kbX2CwQasXlVycYgk95J/9LigGssXKocTOGjlmVgR++8WHoXuUWn/6AmzFt/9PoMZ+ue
         MmYxTmMWotw5i320teRMgTwwdSvK6GQotrJMJd0LmAeywn9GLnXlUhal2z/nnRIN+KCW
         qb4A==
X-Forwarded-Encrypted: i=1; AJvYcCU0v4Z+Yg2Mmi45r3Kj3eJ4nwxmlR8INvWKJOe2mCmSEQLBoibRSloSXajjX4kd8gjYhuq3CoZ5K7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygNwWIdUSPu+MnOEEMG90htOl2qmRO1/UYHSF9/VsaDHSFbijh
	TXCJ/Ny1Fvrulw6XZQ41rOVEiUQZ/hFJn606wKQX9hicrsDPQOSmmlyN8q2ccayhQA==
X-Gm-Gg: ASbGnctrAc68YF0K1clUOFxrJaEogodsoVhgbiNpuGKc8sn2fnR48YVFdoT6cnJHPo/
	yk/IG1CxvMan86IoNrOefke38y09qYVeXdDpfSSbnBrA9pYo0iwlovjMSi8yP9pMN8gI/zKYmQn
	DPqSdGxLvjInj5RkNyujswAtYzYWxb06YppfWudri4bJhLVlggZHMIIXKeCHNxq/Ibmdk8lv+/r
	SkGklJh9UFVfmqmkQ6entdLciO3os8xJW2+eWvJWmIqTIuycPLIiCM0mzb2DMBcy/Rqixw3pJBk
	nEC3mGFB6zb85hiaNmXUS61Q5xbhqJl1emXHFOC0qZMosObfry9r9Twa1CPJjgKyvG4CNZLs8Jq
	QBvtSg9HWf/GNvDj61OxkU39IqBQKqM8jiQcS0P/a/gtAv6fpYmcO2R73uKDX1taVSmogtTaGm0
	Arj1IXeBs=
X-Google-Smtp-Source: AGHT+IEdscER3D0PnJYRJ7ZFpOw2gD63w1Z0nw5nNYG3S2PRz3fvk+9pGmV4ny3KBCVWf57+bTQs5w==
X-Received: by 2002:a05:6402:1d53:b0:615:920d:4de5 with SMTP id 4fb4d7f45d1cf-618b054689emr141322a12.12.1755504878358;
        Mon, 18 Aug 2025 01:14:38 -0700 (PDT)
Message-ID: <3f51c424-da0d-49be-9f8d-3f5f259e76fe@suse.com>
Date: Mon, 18 Aug 2025 10:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/irq: Delete the pirq_cleanup_check() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce37bdf7b5189d314c0f41628dbfb3281358bcf4.1755361782.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <ce37bdf7b5189d314c0f41628dbfb3281358bcf4.1755361782.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2025 18:31, Dmytro Prokopchuk1 wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> MISRA Rule 5.5 objects to a macro aliasing a function, which is what
> pirq_cleanup_check() does. The macro was originally intended to ensure
> the condition 'if (!pirq->evtchn)' is always checked before invoking
> the function, avoiding errors across call sites.
> 
> To achieve MISRA compliance, the condition is expanded inline at all
> call sites,

That's not correct. Andrew's description specifically said "..., and
one path in evtchn_bind_pirq() where the expanded form simplies back
to no delta, as it follows an unconditional clear of info->evtchn."
Imo this wording wants adding back, with adjustments as necessary to
make it fit the rest of the sentence. (Likely doable on commit, if
no other reason for a v3 arises.)

Jan

> using plain C constructs. This ensures clarity while
> retaining the original behavior. While this complies with MISRA, it
> shifts the responsibility to developers to check 'if (!pirq->evtchn)'
> at call sites.
> 
> No functional changes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

