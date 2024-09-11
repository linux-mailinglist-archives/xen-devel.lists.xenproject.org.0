Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E69751A4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796491.1206096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMEs-0001S3-UI; Wed, 11 Sep 2024 12:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796491.1206096; Wed, 11 Sep 2024 12:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMEs-0001Ph-R9; Wed, 11 Sep 2024 12:14:26 +0000
Received: by outflank-mailman (input) for mailman id 796491;
 Wed, 11 Sep 2024 12:14:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMEr-0001Pb-O8
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:14:25 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62526986-7037-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:14:24 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f760f7e25bso39374741fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:14:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8adaasm5640459a12.80.2024.09.11.05.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:14:23 -0700 (PDT)
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
X-Inumbo-ID: 62526986-7037-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726056864; x=1726661664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5VvtAf2eL/i5eSMD1McQUpoW1ljQqVM5sATzI/GMYZE=;
        b=ShpyTXI4oEAF+S/Onp1UUZAg8XZ1EDwXx+5C+jQVyIi0t9bxz2FQ6hAYInKDmJ2fO4
         djCM/ZupdxirHJOh4SldTcAs2cgi7Iz1wS2zxZ1lriBCdafSHn3W83kyPqXdHnBcjXWt
         tmP6lL2u7B/uwKkTmLMP+a4fr83nkF+Y/PUZzPXAA2QEUCcXGHnQXJaZdTQZKmFvAme+
         vV0d7nGTGNfmCEa5idFNvp32x2Vi6PN+bASNLvhb6F/tvLA1s8eLbqdVjtfloojcSDbv
         LnKTeA25jF7WlBrBu4sOL2ZADv1EEENur1GDXnnqDliM7LT81XMUeTcAjQ1XG0WvrWET
         i/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056864; x=1726661664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VvtAf2eL/i5eSMD1McQUpoW1ljQqVM5sATzI/GMYZE=;
        b=jnltbjQGhcCqRCsgMn6hpXGiqjsUchr73MqhTamgjNUi8x38olUG0DgVF4cxmn0mWD
         292yGwcoOwb0BGw6BV3wMWGXCyN1eJobk6eHqnHJPbAC6C2yYwDGVmdbea62VHMta46t
         d1iNGkdZXHn/RYvy66FpeXxph7aWGNFzluquJAXmluVYh3a/Hu8ol6ODxhN3VDF0TBMT
         Foh1RpkYWDpL7qka6ifwXEVG64vXXgYATcujwqiK9GtY/BdaaFMSMv5GKonokyPx8Qai
         VLN4B+pMS7Jg+lLLeFDNcx1TQ9GPV/P+EKL/o4rvj5+nvPr8DTuO0CnpaEgVGqHtxmsw
         7Rcg==
X-Forwarded-Encrypted: i=1; AJvYcCXzKF2Jk3YRDAsgGEIGggZgIHcsbNm5iWEiqXgntEgIuLlSIzv+DwmWMLLB+aoJR3IR335+2n9Hw7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRyHTYO6G3fbq1uIOL+rVov66nDraipVno1erk9NIeRHWgmkJi
	rfqG/9zQrQsxvwxR9asyVFfkthldNN2sBJycJMcEoorlhnmeFP51Ml3K/21pdEmO4peIkSYpAjI
	=
X-Google-Smtp-Source: AGHT+IFTeZtoNDGmEyMSUklxEZ3F06e1ktCgBQ0XzsM5Yo1Vhc2vUvoUV3tWnTu17Uoa8R0RdTNuqQ==
X-Received: by 2002:a05:6512:12c1:b0:51a:f689:b4df with SMTP id 2adb3069b0e04-536588093femr10131417e87.44.1726056863883;
        Wed, 11 Sep 2024 05:14:23 -0700 (PDT)
Message-ID: <1ef2902e-b307-497b-9c97-d1e3771b62af@suse.com>
Date: Wed, 11 Sep 2024 14:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
 <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
 <de3f5c4fd5dd2a8533ea376a013f8e40b85dc6b7.camel@gmail.com>
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
In-Reply-To: <de3f5c4fd5dd2a8533ea376a013f8e40b85dc6b7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 14:05, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-10 at 12:33 +0200, Jan Beulich wrote:
>> On 02.09.2024 19:01, Oleksii Kurochko wrote:
>>> @@ -72,6 +77,16 @@ FUNC(reset_stack)
>>>          ret
>>>  END(reset_stack)
>>>  
>>> +/* void setup_tp(unsigned int xen_cpuid); */
>>> +FUNC(setup_tp)
>>> +        la      tp, pcpu_info
>>> +        li      t0, PCPU_INFO_SIZE
>>> +        mul     t1, a0, t0
>>> +        add     tp, tp, t1
>>> +
>>> +        ret
>>> +END(setup_tp)
>>
>> I take it this is going to run (i.e. also for secondary CPUs) ahead
>> of
>> Xen being able to handle any kind of exception (on the given CPU)?
> Yes, I am using it for secondary CPUs and Xen are handling exceptions (
> on the given CPU ) fine.

Yet that wasn't my question. Note in particular the use of "ahead of".

>>  If
>> so, all is fine here. If not, transiently pointing tp at CPU0's space
>> is a possible problem.
> I haven't had any problem with that at the moment.
> 
> Do you think that it will be better to use DECLARE_PER_CPU() with
> updating of setup_tp() instead of pcpu_info[] when SMP will be
> introduced?
> What kind of problems should I take into account?

If exceptions can be handled by Xen already when entering this function,
then the exception handler would need to be setting up tp for itself. If
not, it would use whatever the interrupted context used (or what is
brought into context by hardware while delivering the exception). If I
assumed that tp in principle doesn't need setting up when handling
exceptions (sorry, haven't read up enough yet about how guest -> host
switches work for RISC-V), and if further exceptions can already be
handled upon entering setup_tp(), then keeping tp properly invalid until
it can be set to its correct value will make it easier to diagnose
problems than when - like you do - transiently setting tp to CPU0's
value (and hence risking corruption of its state).

Jan

