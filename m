Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A640DA97F26
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 08:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963949.1354841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TZc-0001qC-TU; Wed, 23 Apr 2025 06:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963949.1354841; Wed, 23 Apr 2025 06:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7TZc-0001n8-PZ; Wed, 23 Apr 2025 06:27:08 +0000
Received: by outflank-mailman (input) for mailman id 963949;
 Wed, 23 Apr 2025 06:27:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7TZb-0001mx-09
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 06:27:07 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f92a0faa-200b-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 08:27:04 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso5838420f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 23:27:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4c0fsm17511391f8f.88.2025.04.22.23.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 23:27:03 -0700 (PDT)
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
X-Inumbo-ID: f92a0faa-200b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745389624; x=1745994424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=COfbRuIFrf9h7CbonrEVgc2mLz03aPLcJOHh9QDCIkM=;
        b=cjbNqbnCvzB2lD9ebP+p8Z/Z1FCwAbyYnuzx0BJBUmVb+8Zq5dyqJ9llvKjBIiL8Y5
         ZN33DuNP+7zxgQpZ36yMyKb1DJYTjAPlp3k2/Hd7uiG50QiQNi7th6Ri7FOEh0/H0gYK
         cFalUIRMgv5ztzSYDuKjYhEoVY09c/t1VqHX4sQbljE2Q9vOcYmBj0grXl2wpCoAlFjN
         UrB4QhtsNBhV4A+nqm/Qmovlw/fLgZP5DlpiHWPRpi9XfQplf07k/w23nCd0K2PBwkYL
         kYEfKaIOLifdxQa5NcVRsYy42iWbACNloEIgKxApU+FXR1QWEGKfm2EN+30XFxZcHwtH
         2ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745389624; x=1745994424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COfbRuIFrf9h7CbonrEVgc2mLz03aPLcJOHh9QDCIkM=;
        b=mQ3NrWuQms9CNacJbcStXM98dKQxY+uH4Vn3whY/nlon0vUNFJXGKAu4dHL0U6rza0
         78OgsfvnpttyzYDSdkzeYVpR9qCBcgZlnvuNbTDHGUlLOXI+pZn3uF+vFl0skiAy4f+w
         s2Cb40eL/aPlEG6qbhkSn2V2hEhLk3VBmtmKxxxuh6tJVEaTe5bkXHeAR1dIxqdYSMwS
         etLcFHoM6fiueFUirYYpK0D5KJm8Y9Y6KI+nKvpTDDwN3WnBqSAVG7jSHONnV3mhUXkp
         a9fGnx/a0I6AYa7yCyoNNGtE1xjIieuz2kQfEoOdSM1kwBE3SPOmQ4SeAspXiIzEn5QU
         mQOA==
X-Gm-Message-State: AOJu0YwN8HicYDaUXaxrsx1yzQQLcoFlMT0lLISmROmpqang/nhHCh/w
	MLoGkiiSuBuFBeu+6Zm2ekKfZy+qQe26Mxw+3vF091j/YFdlB2xekMC/8IHIVg==
X-Gm-Gg: ASbGnctC1vpsurKszm2Ziqy2BNN71b/6jBeHFfsJ621E8LR6bYduGyZ3A3Ov12kY/dA
	eR+4i/XZwuIIhggP4t++uHHzUjfDGGpUbhEBZqqS3BgXw6LE5zSEB2dLsvFWuYLPcXWEntj/kKM
	+qDrOX8R0N7uk1vmNkVW/405qNhvnnQJv0ObcZIk0VgSgl0IU06fC1eFJlCjqBE7OEI3TkxAey0
	jk79dYjJ8gTmn/47VqSAdozAYGYgH6XfLgOz1ODPyxR9zcEf8DqQUmfhjA+0GydvIy1iUEYeJuL
	CjxnGpEYt+6r+gnJPQG37TErcXFl18pvVjmPmToxDkaTVVAM39u58DHlatmDWzx3hnrPNDFdHOE
	KOR4ccwKaMCYmIBc9CISUrnenpiYg1+qRK00z
X-Google-Smtp-Source: AGHT+IErImIRuySM8NipZRXVIoYqKQ2X9+rpQu8BMAPV5jVDpTc4bX64Z4PDorOpES5IlE6uVvO1tw==
X-Received: by 2002:a5d:64a5:0:b0:391:4914:3c6a with SMTP id ffacd0b85a97d-39efba5c644mr12786814f8f.29.1745389624093;
        Tue, 22 Apr 2025 23:27:04 -0700 (PDT)
Message-ID: <8296e9e0-0834-4255-8e3d-ff3f455e3c28@suse.com>
Date: Wed, 23 Apr 2025 08:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] misra: add deviation for rules 21.1 and 21.2
To: Stefano Stabellini <sstabellini@kernel.org>,
 Victor Lira <victorm.lira@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com>
 <alpine.DEB.2.22.394.2504221650500.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504221650500.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 01:51, Stefano Stabellini wrote:
> On Tue, 22 Apr 2025, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>> identifier or reserved macro name shall not be declared") violations
>> are not problematic for Xen, as it does not use the C or POSIX
>> libraries.
>>
>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
>> __builtin_* functions from the compiler that are available so
>> a deviation is formulated for all identifiers not starting with
>> "__builtin_".
>>
>> The missing text of a deviation for Rule 21.2 is added to
>> docs/misra/deviations.rst.
>>
>> To avoid regressions, tag both rules as clean and add them to the
>> monitored set.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> 
> This makes sense and it is noncontroversial.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This entire series will apparently need re-sending, as the list address
was typo-ed. Patches need to be on the list before going in (with perhaps
the sole exception being XSA fixes).

Jan

