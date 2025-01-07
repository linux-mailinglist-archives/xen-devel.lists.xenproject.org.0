Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9767A044F0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866572.1277877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBhm-0001Cs-RL; Tue, 07 Jan 2025 15:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866572.1277877; Tue, 07 Jan 2025 15:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBhm-000187-O3; Tue, 07 Jan 2025 15:41:18 +0000
Received: by outflank-mailman (input) for mailman id 866572;
 Tue, 07 Jan 2025 15:41:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVBhl-00015x-E1
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:41:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d46f2266-cd0d-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 16:41:15 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso150265455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:41:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3d5sm606688405e9.5.2025.01.07.07.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:41:14 -0800 (PST)
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
X-Inumbo-ID: d46f2266-cd0d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736264475; x=1736869275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0+QZO95Hmr0Soi19Crmg6U7O1qj+4Ygg5smIKX/o9KY=;
        b=epVCSXQdT93tRae43sewV3aLcIUOsTjJIx2r9x13cwiKyfcHlF9PPF3OQcjq24ixf6
         TI96/HbOANmaxDqXH/mU4yKOK4/DR5mZ8K+saTqRMZoP9yPjaPHGm8WxLTXyIjYnYqn8
         tq7ExulJ/rd+ouVMvl0l5cx5tO7uVrw2HANwOoPnwCXiaaCrr5UMezxJvpZfcrXSCodE
         xRYpP1yWHV7bEkYDnZrZuy8vk5OBxVPpkHHq5MaQ56gZ4hH8WQSRcVvqObL7Euaumy2k
         sImuFPOW/PIHzIHFw4vTiQz1LcUrVtQJkgr2Ct2aaNGDfngFJCfTmY0YPtp6Wvo3fR6z
         uibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264475; x=1736869275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+QZO95Hmr0Soi19Crmg6U7O1qj+4Ygg5smIKX/o9KY=;
        b=pA9zCBrr8owZ2tvQK5U5pk9DtpAflP0N+ygoYFxgEc7aMYto3eqTavBSvC/iBRfYOL
         IvMrh2bIFFYanDx65MNRjqZKXbsBdz0kc12LbOdzRrbbOO8LWgmWjoI61FuU8T5pYqms
         U7vgYFqUMQyf3BEHgpUH9kknNOI7nZYDJMKaNkl8IRqljpYC91hLqZuDYeYU+nemLAcF
         vsUJwYtpMe52UgMJEY/nPHyCdT9kxGJfADC+9qKk72rEMRf5i1Oq/P7LvPGHIFMEN6+w
         EkiTFfYDW1lwoghEUgXam5AzOBxPqP1Ewcv1D17eeurnsRbOUrW/XeGl4FQlwc6v4xpE
         0pXw==
X-Forwarded-Encrypted: i=1; AJvYcCWWf2eOA6Joyx3UiQd2ot7pSHicOPHHqCcaYEV8HnceQt5Rpd6NMIEjYS24tvOx/yjahRGIhglHQWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6WrsqJXrE7H5BwU2h4hGKpx+9baX2NojiXMqshZ90xLX0Pu7a
	/BSf7YNQUJ+wF85fYJUe3BXsTdS1TsAINbICKdIHyXO5DigNg4TGS/A8XOrACw==
X-Gm-Gg: ASbGncvPh9efghfd4OpHdyapLZahfuhoYU8UKg2HNekrTsN83NGx2DlwgMv2G3rZMnG
	/uRK2Oav8RHeilBY+eKvOyBUJ4nG9YoOr73bUWXnjjhe6PBd242WQdrcjSxPw9f9WIejziNYROC
	6xRNXLKT42p9Zq1EDJexabKKkg79Z76pvYYPwph4QbpSgzCT0lhID3kSticJmWuwL+axFO5Fo5y
	FDptqYTYovD03NsIkB3eI5zTNYO1B9aH6orr1ZCuu7AmBckWqjqkWGV/hJnz1zjRLP7sNuA9nah
	CfmwxxvGZE0Deba+KUx0H6rzKWZnyt2cFmZjZlif3Q==
X-Google-Smtp-Source: AGHT+IGP1EGt9iYvJ+5dvLciEiyK2GygQsIomOiN0XPH9ytrKXPtAxsv/+Azl/JxSaNrXH0poiKOZg==
X-Received: by 2002:a05:600c:4509:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-4366864722emr576919105e9.17.1736264474966;
        Tue, 07 Jan 2025 07:41:14 -0800 (PST)
Message-ID: <526672ec-4140-4c51-b67a-3b4b803314c2@suse.com>
Date: Tue, 7 Jan 2025 16:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: correct put_fpu()'s segment selector handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <81428267-e963-4403-989d-d96fb0b59ffc@suse.com>
 <8db5b675-385f-4ea7-a2e9-7a8a54d96f72@citrix.com>
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
In-Reply-To: <8db5b675-385f-4ea7-a2e9-7a8a54d96f72@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 16:37, Andrew Cooper wrote:
> On 07/01/2025 2:33 pm, Jan Beulich wrote:
>> All selector fields under ctxt->regs are (normally) poisoned in the HVM
>> case, and the four ones besides CS and SS are potentially stale for PV.
>> Avoid using them in the hypervisor incarnation of the emulator, when
>> trying to cover for a missing ->read_segment() hook.
>>
>> To make sure there's always a valid ->read_segment() handler for all HVM
>> cases, add a respective function to shadow code, even if it is not
>> expected for FPU insns to be used to update page tables.
>>
>> Fixes: 0711b59b858a ("x86emul: correct FPU code/data pointers and opcode handling")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The code comment may want adjusting in the course of FRED work.
> 
> It compiles when displacing my temporary patch in the FRED branch.  I've
> not got the ABI compatibility in userspace working yet, but
> regs->{ds,es,fs,gs} will be staying, so the #else case should be fine
> (assuming they're populated properly).
> 
> So, tentatively, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> That said, I think it would be nicer to see about excluding the FPU in
> these cases.  Both cases lacking read_segment() hooks are pagetable
> emulation, and I'd say it's more likely to be code corruption than there
> actually being x87 instructions in the middle of a dual 32bit PAE update.

I considered this case, but decided against going this route. We shouldn't
be stricter than necessary towards what we permit guests to do, however odd
it might look to us.

Jan

