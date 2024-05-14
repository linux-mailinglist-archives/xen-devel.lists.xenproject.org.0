Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC08C4DBF
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 10:39:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721256.1124534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ngP-0004nL-MX; Tue, 14 May 2024 08:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721256.1124534; Tue, 14 May 2024 08:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ngP-0004ku-J5; Tue, 14 May 2024 08:38:49 +0000
Received: by outflank-mailman (input) for mailman id 721256;
 Tue, 14 May 2024 08:38:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6ngN-0004ko-QB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 08:38:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60eaf483-11cd-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 10:38:46 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so549410766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 01:38:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed72bbsm7243366a12.57.2024.05.14.01.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:38:45 -0700 (PDT)
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
X-Inumbo-ID: 60eaf483-11cd-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715675926; x=1716280726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0zy3Vgr26FzbIVrWDxEElw5PwRCEREU9VQ5sdqIaFg=;
        b=Y2FGxuG0DayNUglqgVGvPNqq+hy2sKCK5nwYaC4c7/irmEY/RKrFl+BeOpJ7AGGp7Q
         rmbezcLFkOFBV/hUDwJKaURl9V0PR7y/Uo7LqNiQThosZUBe2ikgMtLOCrmkWsItOQsJ
         e6/XokQZehYeX8FJRgLIV4wvpEXi4JeNOyCnneRoDPxLRjD8p+p5947uGErctPt39su3
         6Jxf2+d+Sr4zgeuDV/IFLGkfJgC/+trQoiV+bUGJWQH3yEszs5aa/+jpIaFEUP17IU6n
         XvekGzU29Lfm07NDYpnmr4sFIkIp2TGfOuvTRS/EW/JKcNjwPOR7blSqUVcWKw8i4+lc
         s/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715675926; x=1716280726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0zy3Vgr26FzbIVrWDxEElw5PwRCEREU9VQ5sdqIaFg=;
        b=oAGgzCDjcJ4BUkZHU2YWryG2pPYahL/Ye84TWYTxg4arcANQAeLqyOhk+WRI95xX95
         lrQFtUl0oV7pgtSWmUA8c/+uGQDfg0XyxSdtGXLByliglz6KKXfqh+Fvyj0x7bjLOcXS
         Shx7Px9pJT4xFXkQyEqc+e+wsWJK6GOrNvueIfT+b/MXritJk/FSYHTwCH4vywkntv8N
         52s79RnYP9T4yLxY+w8SX+AullnnoHReJgZ0OGJIS1Bx3xKJHF8d63Gy7pm1rE48WLGz
         15ICYZQH4pAUCl9H4CJcFt09OLR27zkGEGuribTC7KDzg5yVtQjaWLIoYUakh40wb/c4
         1HQg==
X-Gm-Message-State: AOJu0YzVygqzKBYq+93p1XL3MsXkRo6sCG9R8T9AuxZN6aRs1xvjyg6B
	PAZdZS77Kzxx+BJyJQdM0jD9U59y2jEWCLSHMeKHN2Y8Y5VRD3wUpcKD+U9FTw==
X-Google-Smtp-Source: AGHT+IF3zNqyloY34FyQc7U5Va/1blGyVAfedKwdvwAQ8WlL4ucKPB9NZ3WmaBCdPOfAzeRUxFsY8w==
X-Received: by 2002:aa7:c884:0:b0:573:5c18:c2d5 with SMTP id 4fb4d7f45d1cf-5735c18c2dcmr7146085a12.3.1715675926194;
        Tue, 14 May 2024 01:38:46 -0700 (PDT)
Message-ID: <1250a87c-e6c4-4c57-a7d0-f1fbdf7bb136@suse.com>
Date: Tue, 14 May 2024 10:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix Rule 10.2 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2405101634500.2544314@ubuntu-linux-20-04-desktop>
 <0625f4f2-daaa-4867-8c39-f8e9ce939ca0@xen.org>
 <alpine.DEB.2.22.394.2405131706450.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405131706450.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 02:09, Stefano Stabellini wrote:
> On Mon, 13 May 2024, Julien Grall wrote:
>> Hi Stefano,
>>
>> title: Is this the only violation we have in Xen? If so, then please add the
>> subsystem in the title.
> 
> The only remaining violations are about the use of the "toupper" macro.
> Bugseng is recommending to add a cast to fix those or deviate toupper.
> 
> 
>> On 11/05/2024 00:37, Stefano Stabellini wrote:
>>> Change opt_conswitch to char to fix a violation of Rule 10.2.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>
>>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>>> index 2c363d9c1d..3a3a97bcbe 100644
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -49,7 +49,7 @@ string_param("console", opt_console);
>>>   /* Char 1: CTRL+<char1> is used to switch console input between Xen and
>>> DOM0 */
>>>   /* Char 2: If this character is 'x', then do not auto-switch to DOM0 when
>>> it */
>>>   /*         boots. Any other value, or omitting the char, enables
>>> auto-switch */
>>> -static unsigned char __read_mostly opt_conswitch[3] = "a";
>>> +static char __read_mostly opt_conswitch[3] = "a";
>>
>> Looking at the rest of the code, we have:
>>
>> #define switch_code (opt_conswitch[0] - 'a' + 1)
>>
>> Can you confirm whether this is not somehow adding a new violation?
> 
> No, this patch is to fix a violation exactly there.

Right. With a suitable subject prefix added:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

