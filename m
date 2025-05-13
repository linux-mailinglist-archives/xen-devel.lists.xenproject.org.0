Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6BCAB4C65
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 09:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982549.1368902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEjcj-0001Ly-Lo; Tue, 13 May 2025 07:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982549.1368902; Tue, 13 May 2025 07:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEjcj-0001JU-JA; Tue, 13 May 2025 07:00:21 +0000
Received: by outflank-mailman (input) for mailman id 982549;
 Tue, 13 May 2025 07:00:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEjci-0001JO-RQ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 07:00:20 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec06d2d0-2fc7-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 09:00:15 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so2087200a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 00:00:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e6fsm6772501a12.62.2025.05.13.00.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 00:00:14 -0700 (PDT)
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
X-Inumbo-ID: ec06d2d0-2fc7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747119615; x=1747724415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NkBNxfQQ88AqlkyHVp9Jd9bltM+w4yzjC8GBY46+yE0=;
        b=UzP5hT2SK3S0xjrFnkfW+35dkE+Biu45dfg1G5Q/H4q+0OTpqgFzl5z1LLX2hI9DoU
         YUDc21//v8/yI7Zo3vSDSG5hPhdYooegcdHlwPqt9LWGBoU05oABNdSf1z72oqrALZeG
         TwVBWVxAwn7U2b1JrgMeAiJO+ANyP/G3cvsOww80VwJ0dGEHASHvgcGKCrfyNcEuWnGy
         c/kBOgQJ81yv11+QnCMJgOVJUT1cdsO0F4H5RQDHw3lqfmg/4gTranaFX176TrDuGTPU
         kwM5perU8qdzwTdwTZ8YqSu2Th/9JHBs5c0KaeFB8RfdRaSsf4uUgsuYm2t4Z/veELOh
         YtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747119615; x=1747724415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkBNxfQQ88AqlkyHVp9Jd9bltM+w4yzjC8GBY46+yE0=;
        b=fxEYUrKE78woWw6+RwoZiiuWR4PFDU6AT8UZSYIeXr4u6hxNK/R1yoMhUVLaHY0lpy
         Cj67Ri6VU5ex7x47YH4lNLP2AullHtBa6t2flEl7ksbyrbDzMLKv+lBRfIlDVzEbnPV5
         jHA0kIvipdJaKVyEyeaZbtTiCcnbBtZSkRbstITzWaots5sgVJtL3bFNdG8l5En5I5Ar
         JogTfGT5c6tQ9o29VRf6/qDLGxzNPgNhbo0MoxvcXp29m2xgtZVcYbe8VgPxpDHpdNjz
         yeBPvfxJbdnf2G2Y6wYkab6h1l0MUSQPfa4CfvsrCKUwFkUyxfzHJV5YoZNA/7/A+uai
         h3uA==
X-Forwarded-Encrypted: i=1; AJvYcCVrWOLg/XH84A+/ryaxFM/sCNtz+KpRKHh/Vdt0AOAMCRxKbp29GUInBF1BmRiBJ401iOVtYa2WgFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJlbzJrJfizgbJEV4BOxP88dyaB0quqKEZNkZTNeDgZBr+wY4J
	1j48RwnwRjCJCcj+wvZcYK9aqHHWAo+bobQFO0DOCDVEWmxBMx2k+Rl9rJXrAQ==
X-Gm-Gg: ASbGncvaH81BGVUW7i56j0wQRNeX60DTyZHiacN77Sn6bv78Ri4AHgrS1U6U3e7OaGn
	WFGW0H6xgEabWqCifHCz42BPpWfgl+hUi8xoq0I/P77dvKTBp1N0vZXtac+/ZxmO4N3MJB8Jw5H
	YP1+IA9kdfZqhnw2bmETgkjcSnlmUquMgeV1OgTpMB0hwfjWluppp6r3xRHVICeUnYQzfyGVbca
	EdiUJi9EroTDuebbxeGDRHe1uYBynH9s4mdRTsFrcQNf25dpH3gGeuwKNbc7mz434p+mOfrNRn6
	N5RUw3s7c3HOivZVJABCY1rvU+itzZSj9YmZ3CvbSfgxYevwucnfErV3RxnV4lyINcug8OmM4Z/
	59pj6Rk6iG9GnH4q4Q4Kgd+bqmkTJIPPV21zT
X-Google-Smtp-Source: AGHT+IELlTuv1kUCKwLFsoLQep42gHF0B5u5SDbDdmnf4Lf8TWj1atJIQWJlnlDmOE/hPkEgnCsByg==
X-Received: by 2002:a05:6402:370f:b0:5fc:994c:b6cd with SMTP id 4fb4d7f45d1cf-5fca075e225mr10919952a12.13.1747119614808;
        Tue, 13 May 2025 00:00:14 -0700 (PDT)
Message-ID: <504f0be0-91fd-4847-8fcd-505771674814@suse.com>
Date: Tue, 13 May 2025 09:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
 <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
 <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
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
In-Reply-To: <CAHaoHxY4W2bbi3i+R_-tk7PG+4s2OdU9OSf1+o1wDXTvMBJozA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.05.2025 21:51, Kevin Lampis wrote:
> On Mon, May 12, 2025 at 11:39 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> I can't spot the effect the comment mentions anywhere in this patch. Is the
>> description perhaps lacking some detail? It's rather odd after all to see ...
>>
>> ... such custom token splitting ahead of normal command line handling.
> 
> If the UEFI firmware reports that secure boot mode is enabled then Xen
> lockdown mode will always be enabled.
> 
> But we also have a command line argument to enable lockdown mode without secure
> boot. This is the thing that lockdown_init() is looking for.
> 
> It is important to know if we are in lockdown mode or not before parsing any
> other arguments. Otherwise there will be a race between parsing potentially
> unsafe arguments and finding the lockdown enable argument.

Well, there is an alternative: Require the lockdown argument to be absolutely
first. (There are further alternatives, but likely less usable.)

Jan

