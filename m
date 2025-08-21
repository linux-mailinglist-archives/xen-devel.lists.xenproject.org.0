Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3895B2FC67
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088736.1446464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Fa-00021a-GD; Thu, 21 Aug 2025 14:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088736.1446464; Thu, 21 Aug 2025 14:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up6Fa-000207-Ct; Thu, 21 Aug 2025 14:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1088736;
 Thu, 21 Aug 2025 14:26:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up6FZ-0001zy-9i
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:26:45 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dca9b967-7e9a-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 16:26:44 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb78c66dcso161333366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 07:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded0717ecsm403034766b.0.2025.08.21.07.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 07:26:43 -0700 (PDT)
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
X-Inumbo-ID: dca9b967-7e9a-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755786403; x=1756391203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cyYYYp05zdPE8e+y+YyFn0UWbrwWjLoj2G4zU6x/hnE=;
        b=gnzK8oUR8dPhDPPT9VuaRk8YEIxhRqHl4O8YDT/UoMjaGjGqnKmouPC1XPPZrPia/z
         mPX/whaGKI70bgFskZpzlsgFyiJEuZslOlNTj7/af1DBI9l1gefbMyDsgH9vCMrnk+fC
         nH4yvwTexNnCpTjksMPyhQIXCm6/Nre//7ZLnhe427SPlH2LjN54/0dmS+k3+tadlrCI
         ARsl259+iAklyW6s+AyB5n6qHA6eRYp6flk0rn0eEimKWXklhV8+0PKS36emF6vM8f5a
         xTQluL5ccWhwJQac+2oDGEgSLpUWThuHA044cEBvQEGG9qBszM1MM6Rst6twf4rOur67
         m3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755786403; x=1756391203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyYYYp05zdPE8e+y+YyFn0UWbrwWjLoj2G4zU6x/hnE=;
        b=ItxSp3xUFnn5PICowxD8L0zVv+Y/1AuUs4xuEvo/rP5Y8Ert6li4WP10xpHCgK5yt8
         QN5NxPz3y21tM7wHvl1J8MmXRYC8PfYFSIEVojhLdV7/sqefOtJ8l/JrrZ3tvjLH4wzp
         CWyzv5386XmEEyma3ZIAgzTXHKSL1X4yWVQ7V/a3RtNaVl3Iq9w1IGia10s4dOcy+HMF
         4pFwML17vADka1tF8edolcT/RDHCfsHxjP0bCgnkZBSAajhNYlPhRkbvlqhwzSnLUXdU
         q0EGGJKqNhpVCpbfq+qQjJcZn/i2brzub7vFoHtxvAYmVD+ES6FbgmsXX8/h1DGbYMcC
         34Pg==
X-Gm-Message-State: AOJu0YwsR2cBLlK0MDkLiWxwr9sXLQx2x2yUJ38HW0e3Zb7Er6vd785P
	vzTyw1Fo9he1OCrjlYSGlismK6Ihtsyq1R9SctKJn86AoiqNNUKNpzgxfhctDvJE5g==
X-Gm-Gg: ASbGnctSpavP8NSkzL55uOAogQ73yOFYO7hg92/GdRNKdUiVoZqGaHWkH36vY7b91FM
	tvuJsT8xul+KUgt+zATr6O59SdZve7DhcFphiZrj7s8AufWH8pTOdh5Jsa15isXail+Tk0FnSht
	JduymFcTYMoTIc/pNZcAQ1rp7mITGwpXjtlX4Z6V7KBJAdwELRgq5RbNQJxzrrxkt4y26XdxPFj
	WOXa9kRRicqqbYMkbbWgxMZR85A3+xfV7ovGh51hoIYS9X4DVVsa+qxNRbZm3q5X3Ir3XEX15cm
	57/aopaR0d2TzeDMBhGTHGHdhYBJUV0xOrz5xCMt5ecrt4aRQOpdcOpWAaCD2ntDjyM50mK98Fs
	bD8C1h0dwc39tuZ6VGp9i274mWXhYAjKuu5R0t740lHZ9tndW1snoWCGVx2quj68Fjp0PSOwg4w
	HWastPhn+HUu9Oef8eQg==
X-Google-Smtp-Source: AGHT+IEYjAhrToYww0eYyQ7Bl6IHIolVSriwJuh2+q4J1/rwnYSqM0zTvu1TrOrhAooQdxh9kP+mTg==
X-Received: by 2002:a17:906:ef09:b0:ae3:bb0a:1ccd with SMTP id a640c23a62f3a-afe079f3318mr227248566b.26.1755786403522;
        Thu, 21 Aug 2025 07:26:43 -0700 (PDT)
Message-ID: <cf9f121b-347b-4406-9b93-63375c3bdab7@suse.com>
Date: Thu, 21 Aug 2025 16:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] common/efi: fix Rule 2.1 violation in read_file()
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <4a1a4a3406d227348afa1ad2ce90dc5264fdb44a.1755783750.git.dmytro_prokopchuk1@epam.com>
 <aKcsObV9UssO8ckZ@mail-itl>
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
In-Reply-To: <aKcsObV9UssO8ckZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 16:24, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 21, 2025 at 01:56:28PM +0000, Dmytro Prokopchuk1 wrote:
>> MISRA C Rule 2.1 states: "A project shall not contain unreachable code."
>>
>> The return statements in the 'read_file()' function is unreachable due
>> to function 'PrintErrMesg()' which has 'noreturn' attribute:
>>         PrintErrMesg(name, ret);
>>         /* not reached */
>>         return false;
>>     }
>>
>> No explicit return statement is needed here. Remove the statement and
>> write a justification comment instead. No functional changes.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> ---
>> Link to v2:
>> https://patchew.org/Xen/c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594.git.dmytro._5Fprokopchuk1@epam.com/
>>
>> Changes in v3:
>> - removed unreachable code instead of deviation
>> - updated commit subject and message
>>
>> Test CI pipeline:
>> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1996439444
>> ---
>>  xen/common/efi/boot.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index 50ff1d1bd2..325de05b18 100644
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -851,9 +851,13 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>      PrintErr(what);
>>      PrintErr(L" failed for ");
>>      PrintErrMesg(name, ret);
>> -
>> -    /* not reached */
>> -    return false;
>> +    /*
>> +     * No explicit return statement is needed here because 'PrintErrMesg()' is
>> +     * marked as 'noreturn', which guarantees that it never returns control to
>> +     * the caller. If the 'noreturn' attribute of 'PrintErrMesg()' is removed
>> +     * in the future, compiler will emit an error about the missing return
>> +     * statement (build-time safeguard).
>> +     */
> 
> I don't think this verbose code comment is needed here. Other similar places
> use simply "Doesn't return." next to the function call, or nothing at
> all if the function name already suggests it (which IMO is not the case
> here).

Or simply keep the comment that was already there?

Jan

> The longer explanation may be put in the commit message.
> 
> With that addressed:
> 
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 


