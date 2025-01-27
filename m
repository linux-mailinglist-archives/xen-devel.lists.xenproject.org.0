Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C1A1DAEC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 18:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878110.1288286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSU0-00083W-Bt; Mon, 27 Jan 2025 17:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878110.1288286; Mon, 27 Jan 2025 17:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSU0-00080j-7w; Mon, 27 Jan 2025 17:01:08 +0000
Received: by outflank-mailman (input) for mailman id 878110;
 Mon, 27 Jan 2025 17:01:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcSTz-00080b-0C
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 17:01:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b71eff4-dcd0-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 18:01:05 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab69bba49e2so250952866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 09:01:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e631a2sm602601766b.48.2025.01.27.09.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 09:01:02 -0800 (PST)
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
X-Inumbo-ID: 4b71eff4-dcd0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737997264; x=1738602064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E674n3a+gS5tMIjjNhkIj0q/e8xeaW+qEgcRrq2WvHA=;
        b=I1kCAX8ag3rLv3KBNQIBhi0tmyje/2A05mGqJ905ESzvlXi/Xr6dAZlIgfGEhtesKA
         yPOj6DJgRbRjJwMb9XF6koaFyhumGWl2PdiZsJTuRRkhCCHEWR6aN+ZSm3wQXrmJP1bM
         boDbtfz0LoGFmJK3AS8+hFv1zlOLs0k8e3gKqWdkdR7XPWXpU/v4IWl8aIOR8sPnguOF
         izxc693Eqcg6Kk4xZWKcwJbKPR1SYeEhIf8NAD1JrGwGhSXVQOxiioXQyb1OVPi/bV3B
         pFG2VbLbVnI1bwJCoMyB2GACV5h3QLGjM4abC1oCVD2IAJJLNg9uN63M7Vd/6pzENBHY
         wpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737997264; x=1738602064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E674n3a+gS5tMIjjNhkIj0q/e8xeaW+qEgcRrq2WvHA=;
        b=Qw74wIaQV3SHhL5acj3AZ3zDS9URPmEOft7Y6CmoaA/wPmBuWVkm6Lho1NFRGagqEd
         6Em5NT0e4LWfz0Z6Pq+LNBFgz+05sCtDbVoToSuPbPRZOzMfpWdPyE/FM5mKS+FIFHe0
         2kfprl9lvtOd2rHw+EvwIlXasIFUwQh94WnrgZvxcXc1WcricoqvMwtaf/HjkVWCBpeq
         U1IQc7YytoouHX8FNYsauxKXXVU4hS/SNZkULJKscSyKfFeZJUn+m/Br7odtLGGge3Vw
         YcNsHcW8vHCXP10k2R0RWfi/0aQBb5SvYK/2gBSXzhaBKSyjfcyGcHNgBAUUnCvgpKpP
         zTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmaLtXO3ZDGfw4RTQGZ/ch3cQ16sLUQbWavMuCoFFOTzb0QtGWf7lejMYoM0rINHgtlNZP/ekm88w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcbREw/pXkVCBwOIbJsUKYC3Daj4Dk1yO5t0B6VPFOxNT9qcR4
	yqZCF0p04Sw6IUrUbKaNbkBzDlv0FZRMzvFNosUHCfcOUjelYRnc2gB4odfpjWqq7frH/Bu4IOU
	=
X-Gm-Gg: ASbGncsEs30vzhRhiWujndV0A+kErufVfp++rO6EWZxB6qKhtVjeiP9P91MB5ZDzzHj
	5+iSxvAMumBzF2rSPV6PZ7SNDMx8LzgS6WtysD9Fy4337I+bRM4MIqQBzdS1dKM51zMVjtQDTB7
	1pWeiSISry+RZEFQo+UkfiNlWHUQrA6VREo5rFJv+6+mgKdY4gOF0xWf9Dn88YAkSoBfbU3Npl0
	LvUWyFe4Sq/MrOR0k9vN5yVJtIt+dUfdff1an7563FneeEnuJ2etTY1D/buDoZx42tle7P7vGEH
	Zp28s+5Baqozg2zVFxrJg9nbPIinUvkYsxbPq6RH8wh7/QJ/FiLA9Psn5vopxCxXqA==
X-Google-Smtp-Source: AGHT+IEVfvO2wIHdHAkS9swpCj5kZI3UsBU/tT8RIxigQ9UdHBQd06po5PnJGBV0kBNP7yr/UbhFBA==
X-Received: by 2002:a05:6402:3587:b0:5dc:100c:1560 with SMTP id 4fb4d7f45d1cf-5dc100c1768mr44550411a12.18.1737997262532;
        Mon, 27 Jan 2025 09:01:02 -0800 (PST)
Message-ID: <c4575574-45b0-4742-a58e-1fb9c5bd03bb@suse.com>
Date: Mon, 27 Jan 2025 18:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xrstor()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-12-alejandro.vallejo@cloud.com>
 <1f1ab2d4-73ad-4562-b3c5-0b423b56aed2@suse.com>
 <D7CZ23KACJ16.A4EFWQ1X682K@cloud.com>
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
In-Reply-To: <D7CZ23KACJ16.A4EFWQ1X682K@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2025 16:48, Alejandro Vallejo wrote:
> On Mon Jan 27, 2025 at 11:05 AM GMT, Jan Beulich wrote:
>> On 10.01.2025 14:28, Alejandro Vallejo wrote:
>>> No functional change.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>>> ---
>>> v2->v3:
>>>   * const-ified v in fpu_xrstor()
>>>   * Removed v in fpu_fxrstor()
>>
>> On this basis the parameter could also be removed from fpu_fxsave(), by
>> passing in fip_width instead.
> 
> Could be, but there's not a whole lot of gain to be had? The access must be
> done either way before or after the fpu_fxsave() call, and a parameter must be
> passed (be it fip_width or v). Passing the vCPU encapsulates the access of
> fip_width where its actually used, which seems more desirable, I'd say.

Not much of a gain indeed, largely for symmetry between the two sibling
functions.

Jan

