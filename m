Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05FBBC3F73
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 10:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139406.1474777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Pw9-0001Kw-AT; Wed, 08 Oct 2025 08:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139406.1474777; Wed, 08 Oct 2025 08:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Pw9-0001I8-6J; Wed, 08 Oct 2025 08:54:17 +0000
Received: by outflank-mailman (input) for mailman id 1139406;
 Wed, 08 Oct 2025 08:54:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6Pw7-0001I2-Ck
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 08:54:15 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ce493be-a424-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 10:54:13 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd68bso15106829a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 01:54:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9bf1sm1590871266b.13.2025.10.08.01.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 01:54:12 -0700 (PDT)
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
X-Inumbo-ID: 5ce493be-a424-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759913653; x=1760518453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tGUOWlooVM6ju6kF0MZQsxSBmAp5YoVHWUCm0BnJM34=;
        b=I1pi4+akaPjYxMciiaUu1KikQ4zeVc45Oa05n7NNPWFbDwWXaRFacuTFLfOgOm3g4z
         7mnX1qlHag6+0B2HKAbyjBEH0SpICeZrV/pGS5JjJ0MiGo/PryJyRk7Kktw6FRHZGD1a
         hFkEfSRhnM0+y4cOjm6i87I7RCwZ5OmJYIh5C1dbsyqN9pun4hIGJEwzbcyyxuArn0RF
         P1VToksRP6YdDJZST3J6unaSLHQ50iIoMNWVoCSLAzAdTNsXkQqY5jvR+XEjgckCkiGt
         Ook8tWV+nAmbhzDoJ5h4aN/kUTv6JAOR+bxWLzWTEcNv7SE3yAl6Zt7NrBbe9U2pbp4A
         ZMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913653; x=1760518453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGUOWlooVM6ju6kF0MZQsxSBmAp5YoVHWUCm0BnJM34=;
        b=isT5P3zs/Gy/jFQUrj/afPuBYSk2XARcfD4GuqbOWRUzzwPx3yohqUogrfHv6bic/7
         go+39OrcQVYAayTjrZf28oH0vuq7dqH5a1ml7lTf4xRj9kVzXqSHSfj/DbrCHqahrqtx
         dwjUDrfIZO6WT30lvAJ+JlvCmjJQ3Uf0KdTrY6gcWJfvzZMlP/VF879YdtI7ZAipsAQC
         CdC2OklUk3/iJp9b6eRwTkfN0NNAi7JtxsLW/Zgx5GZBiWP+jxryyMf1q1lsHFdjuPD4
         GZeau19xChAXzNWsK4dYhxC6gKF9VsoVhiQeJJp/q3kRfhio0KKKotpgB3K/wKAlUMCA
         QGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpP7N2elaB/3vrHF9upjTnHafl2jzB2XWKAva3CJOYz+4r8nEyTKrINlniN1Y6+BpM+woEOa1UUOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdtrgjE6GArrBHU2AqIApDz46ruhYCYtvUO6dTB8oPUMEGjMit
	Vo9Fxa4pvl8Y7Q3AjSFrqIyzIvQTkAZJr7RtPwvGl1THj+bLmpokfjkR13Px7zzqig==
X-Gm-Gg: ASbGncsqPtsgeIJuwh5RWUWFTJHT8EsMl9Uq1BcuugugkECeBe9WHVAO+oDjipjGB+K
	CUBS1zgDA9DpJHSF2HLh0hbpRC1lZUTIDvVHuDWIofd2Gy1BwpxymnYNoGwVfBbHx2UBJU+p2KV
	TZTZEZzQv5upoX8/GHKmzJhtpFiSZ7lU1QkC9Qd9oKG4g79vztrGFiDpxnf9FPFmMgbpCdtYzYr
	XoadtsRq9yy5G6P887Hsl+EGJGEvQIXTm5vaG8kBkJcOaaMnTTYb6Sx1TKOE34XN0lsPuNo40cX
	wvU5qYs1cKaXDwKvSDsv8JEX3ibFY+14R+kpdbPOLhdD6FC028Inbr6MPVAtlKfcMAa/2l66LFP
	k9jj++ZejYEP7CCR9j1tUD04NEnkIXCXT1xDSqtvKItLZBTJamh0+qmnPFYB5UKhV6iDSN5nurX
	CDv055OzsgBdFJqGVgEVyUVyXBWACenkujefk4A9yM0g==
X-Google-Smtp-Source: AGHT+IGVrYjgMtlQ91x2itJB+rssp2avrEPVDKb8zPLsVTsmtANywrdR30F91s57nC3rWIK0V71TJw==
X-Received: by 2002:a17:907:7b9d:b0:b42:f820:b7c with SMTP id a640c23a62f3a-b50abab5c0bmr294564966b.41.1759913652893;
        Wed, 08 Oct 2025 01:54:12 -0700 (PDT)
Message-ID: <bcd01902-421d-48c2-94c7-a8c0db1a8b48@suse.com>
Date: Wed, 8 Oct 2025 10:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/22] x86/traps: Enable FRED when requested
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-14-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> With the shadow stack and exception handling adjustements in place, we can now
> activate FRED when appropriate.  Note that opt_fred is still disabled by
> default.
> 
> Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
> MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
> when CET-SS is active.  Otherwise, they're all new MSRs.
> 
> With init_fred() existing, load_system_tables() and legacy_syscall_init()
> should only be used when setting up IDT delivery.  Insert ASSERT()s to this
> effect, and adjust the various *_init() functions to make this property true.
> 
> Per the documentation, percpu_early_traps_init() is responsible for switching
> off the boot GDT, which needs doing even in FRED mode.
> 
> Finally, set CR4.FRED in traps_init()/percpu_early_traps_init().
> 
> Xen can now boot in FRED mode up until starting a PV guest, where it faults
> because IRET is not permitted to change privilege.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


