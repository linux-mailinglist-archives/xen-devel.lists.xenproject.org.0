Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CB97EA58
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801910.1211970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgnw-0004xE-BU; Mon, 23 Sep 2024 11:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801910.1211970; Mon, 23 Sep 2024 11:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgnw-0004vN-8Y; Mon, 23 Sep 2024 11:00:32 +0000
Received: by outflank-mailman (input) for mailman id 801910;
 Mon, 23 Sep 2024 11:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgnv-0004v6-32
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:00:31 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c332034-799b-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 13:00:30 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so564019166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:00:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90613315e3sm1197985466b.209.2024.09.23.04.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:00:29 -0700 (PDT)
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
X-Inumbo-ID: 0c332034-799b-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727089230; x=1727694030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FG4a7snmGVmjwRCelUEyytuuMzpdS/e5SGZvszA8DCc=;
        b=Uuff194gxMEQo0w943rKAEdVWlJ0RkGpy5vkjA6S/LyDQNltnrem9C6CH7gH2ncsRf
         PS6ZtkiqHeVm26tmlL8aDK+xGUIE62IPnqE5dQSVXOebTUVDKWeAfIPMnCllm8UF9lij
         LV42CvFdOGyY5l9imrsY/nOXB8JDwDHrf7N4UnIJF2HaDS+zuMInZtj4re7EgI6kU1/G
         Z3VwVDqJsRG9JsO+4Rb3MpBuCnH3+9CUmXxkV0+0SKOqFJouUbzfyaFJJXhvqfdYD77D
         r3zqTEkVG0y2HRAGIOACUrG2RrqP63hsWdxJllACilkl6OaMP85EgDbulz/ttcIQ/tWr
         cxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727089230; x=1727694030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG4a7snmGVmjwRCelUEyytuuMzpdS/e5SGZvszA8DCc=;
        b=CCO7+Ld3kQpmil1bV7G31dUP/btovUaxs2otHbMvuV6LiSy18s7MOBm7UwrP/BeXdx
         H279lvbNafILBDmdw2OYDFganYfJeRPKCAHCa6/G52kp+YXsseB9hALynKiWJrW6/+UQ
         Km0gSTrfBUux7deuejkN90qKtaqO3KA0yAFv1AoQjn3vtExDcuQAY6U/TtiVjNhe3VYA
         MnMJszpCQeezg4UtcEh+sSxHmhW3IV4QtehlFQP+HTkkuLwtvf8YSuLnj/9AF/5TkpfU
         H68awfCkLBzFDqVCznEBxXRZz5sHrc+JwgirhlmBRxh+r2SHXuKr+7VbZdl0Z8s4yNmr
         bayA==
X-Gm-Message-State: AOJu0Yxh18gfF9WONs91tjrFfn+3KKAQpbPVJ0sBMydm2YqOTmwyXLhG
	CQSUcZAPTeiglDWuBWX9ajkd2GTm8q/zlFh5hqa9mtPqrFN7pDWNgTGEKpvryg==
X-Google-Smtp-Source: AGHT+IHpGsaAszEc0ptcewDzaiOKxoIXDdOweORcHOFVzc8GPR6oxED0MN3EbaR/kDFMK2/8glI7Fg==
X-Received: by 2002:a17:907:f14f:b0:a8a:926a:d02a with SMTP id a640c23a62f3a-a90d577a4f4mr1100095066b.49.1727089229995;
        Mon, 23 Sep 2024 04:00:29 -0700 (PDT)
Message-ID: <bd35f4b8-756c-43f1-b5da-988bbf16631d@suse.com>
Date: Mon, 23 Sep 2024 13:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/livepatch: simplify and unify logic in
 prepare_payload()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-2-roger.pau@citrix.com>
 <d7dfa01e-740d-4274-b9fb-8475224ae7a6@citrix.com>
 <ZvEc0qpq2fTJtMjo@macbook.local>
 <3daaeb5f-d907-41c6-89d1-1fe1b89e9fd8@citrix.com>
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
In-Reply-To: <3daaeb5f-d907-41c6-89d1-1fe1b89e9fd8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2024 11:43, Andrew Cooper wrote:
> On 23/09/2024 8:46 am, Roger Pau Monné wrote:
>> On Sun, Sep 22, 2024 at 11:19:01AM +0200, Andrew Cooper wrote:
>>> On 20/09/2024 11:36 am, Roger Pau Monne wrote:
>>>> +{
>>>> +    const Elf_Note *n = sec->load_addr;
>>>> +    int rc;
>>>> +
>>>> +    ASSERT(sec);
>>> This needs to turn back into a runtime check.  Now, if a livepatch is
>>> missing one of the sections, we'll dereference NULL below, rather than
>>> leaving no data in the struct livepatch_build_id.
>> Loading should never get here without those sections being present,
>> check_special_sections() called earlier will return error if any of
>> the sections is not present, hence the ASSERT() is fine IMO.
> 
> Ah, in which case, can we please have:
> 
> /* Existence of note sections already confirmed in
> check_special_sections() */
> ASSERT(sec);
> 
> Just to show that someone did think about the provenance of the pointer,
> and where to look to check.

Yet then sec was de-referenced already ahead of the assertion, which
static checkers may have to say something about.

Jan


