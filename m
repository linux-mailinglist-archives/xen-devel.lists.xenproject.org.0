Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7488FBD203E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 10:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141831.1475991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Dpa-0003Nb-L6; Mon, 13 Oct 2025 08:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141831.1475991; Mon, 13 Oct 2025 08:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Dpa-0003Kq-HW; Mon, 13 Oct 2025 08:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1141831;
 Mon, 13 Oct 2025 08:22:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8DpZ-0003Kk-QG
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 08:22:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2406527-a80d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 10:22:56 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so20741085e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 01:22:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489197dsm177963985e9.10.2025.10.13.01.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 01:22:55 -0700 (PDT)
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
X-Inumbo-ID: d2406527-a80d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760343776; x=1760948576; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dEHYiQm5SufHmglUw98qam1ZxeS9M37DvQYw/3sx3ZI=;
        b=fk9/lL2bl4WiNVA3DgtvixdE8GqJ0dd5Q4JASkjqGXcHdzFovBPhHMww0AA6v5QeOE
         MoTm8zxc14q1FLrETYtL84co5KnpIr2PXGJ5dm+EQxZ31hHWdIHjzJ141bAbCSINta2k
         JpAhI5jIGwb5SOIvVfnVhfCYH7wHomJEXi3xhgNiy9Se/2wWl5QuJXnCGEbMx2WUlO1K
         T+4xYxvSIvbik2P+TDGXFoNAR45R7ol6pRnQ8qYTXrk8YXHjJdw8V6GZVIgSZPQeubIo
         Af0wJk9cXn8j5/fGJB6eBJmi72/X+9sWlFwPzIQRzDlLqITxcxARNu9HcSuuWVHSOaag
         Ik/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760343776; x=1760948576;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEHYiQm5SufHmglUw98qam1ZxeS9M37DvQYw/3sx3ZI=;
        b=U893JtRqte7v3DrvH39PNo8C/04J73ciLkypivpRtmv2jN8Qi/PmUKiLMnEP9QA3Aa
         0DZZJazsx+5LzOAkIVNQXZIWMj+1do9SImjjYPdp6rmEMLfv3ve87nHNdtkm1dkreVQR
         Tf95Qvo82gDoVl58E0SmBlors3vOTeEnwaFyqQN9eKH5PkrEz6C8nKK7aVxdpm44vRBQ
         lXrzTlclmy8wWW8CTo8LpYejvlPLMkuSLcHKybD10fMl+q5Aue5Jm4b/AHnBUDD1mdqw
         mgW0qbjCsHoe4NEzySt7zMsGnIq/Mz6jXXvnnuWId9Fe7X/neJFa20uJqiPEDkj3Iqo1
         s4HA==
X-Forwarded-Encrypted: i=1; AJvYcCXjxCnnuzOL9sfhMApBI4liWwJadvs1IEqElA72pkvM+llxq4okHjzDQGfP9okqUHgnVPS2/AvGnF8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywhoyd6uj/OvcBom0i4kN4i92m/zCYpP+6ALmFoCRybGxv1HpT3
	R/AJJ6ssC9s5vk4PPcjEpjwEKQSyOwR0wrzFJP8UXAHYI6GkIUQsC58vFWFSddkggA==
X-Gm-Gg: ASbGnctHWlC7nvYP6HxRLg9scsHowQ035I/ZqNIUQwnKp6KllueqnO6pWQ4LBrcUIud
	LBZwgLM6rsfu94UJIFjQnBCXV1hBPGWC6OZGwy4+lIIY3lWL/Q2cQdE1W3ycBE3H/pXRR5Cvjmu
	c4701IZonXoOvEX+EbtyLV2eBmJfPtMcrgthGusPOc/cfH9RfcocYE6YUu50AptJvKSnKuZ1v/c
	9TuJ//5JVfV/qZXeTNGSzAKRNFSzO0fBSrrT4ZHMDvCp+MoHHF58F+cfW0fRLazcSj144koUarv
	TOfMYiwWXEoJLxjp2eHFPGwvp5MRYp7JpsIgrNaKg/2u108sHIL0L9KODMiPFTXWmUJZncEedXE
	P4CzetzmjGR+OQFkjK4ayJtrnv4ejnTngvQZx950UYwFL073ndUnjgwlFgMeI+2cuU/fkaAXUue
	AW2DSajuP6nGEXF0W5N5S7L4bY5KxSq8NrxCFy
X-Google-Smtp-Source: AGHT+IHVl/cWr/IqalH/uVoeRFf3vc3mRN7QYao9WHRxI8lIT7f8+C/nPvoSQG6krLfu/alSF1z8Wg==
X-Received: by 2002:a05:600c:3e1a:b0:46e:1d8d:cfa2 with SMTP id 5b1f17b1804b1-46fa9af9842mr124450175e9.20.1760343775915;
        Mon, 13 Oct 2025 01:22:55 -0700 (PDT)
Message-ID: <13cbd826-540e-4352-8e0d-ae0c9fbd2faa@suse.com>
Date: Mon, 13 Oct 2025 10:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/xen/xenbus: Replace deprecated strcpy in
 xenbus_transaction_end
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: linux-hardening@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Thorsten Blum <thorsten.blum@linux.dev>
References: <20251012195514.39003-2-thorsten.blum@linux.dev>
 <ebee3406-d515-4e29-9d7c-f54bdb143080@suse.com>
 <65bad926-22fc-41da-b9c4-5857a002b377@suse.com>
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
In-Reply-To: <65bad926-22fc-41da-b9c4-5857a002b377@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.10.2025 09:36, Jürgen Groß wrote:
> On 13.10.25 08:59, Jan Beulich wrote:
>> On 12.10.2025 21:55, Thorsten Blum wrote:
>>> --- a/drivers/xen/xenbus/xenbus_xs.c
>>> +++ b/drivers/xen/xenbus/xenbus_xs.c
>>> @@ -546,16 +546,13 @@ int xenbus_transaction_start(struct xenbus_transaction *t)
>>>   EXPORT_SYMBOL_GPL(xenbus_transaction_start);
>>>   
>>>   /* End a transaction.
>>> - * If abandon is true, transaction is discarded instead of committed.
>>> + * If abort is true, transaction is discarded instead of committed.
>>>    */
>>> -int xenbus_transaction_end(struct xenbus_transaction t, int abort)
>>> +int xenbus_transaction_end(struct xenbus_transaction t, bool abort)
>>>   {
>>>   	char abortstr[2];
>>>   
>>> -	if (abort)
>>> -		strcpy(abortstr, "F");
>>> -	else
>>> -		strcpy(abortstr, "T");
>>
>> While at least in principle a compiler might be able to transform this into
>> code not using any library function at all, ...
>>
>>> +	strscpy(abortstr, abort ? "F" : "T");
>>
>> ... the use of a n on-standard function (without equivalent compiler builtin)
>> doesn't permit this. IOW why not simply switch to e.g.
>>
>>      char abortstr[2] = { [0] = abort ? 'F' : 'T' };
> 
> I would even go further and drop abortstr[] completely:
> 
> diff --git a/drivers/xen/xenbus/xenbus_xs.c b/drivers/xen/xenbus/xenbus_xs.c
> index 528682bf0c7f..c891af7165f5 100644
> --- a/drivers/xen/xenbus/xenbus_xs.c
> +++ b/drivers/xen/xenbus/xenbus_xs.c
> @@ -550,14 +550,8 @@ EXPORT_SYMBOL_GPL(xenbus_transaction_start);
>    */
>   int xenbus_transaction_end(struct xenbus_transaction t, int abort)
>   {
> -       char abortstr[2];
> -
> -       if (abort)
> -               strcpy(abortstr, "F");
> -       else
> -               strcpy(abortstr, "T");
> -
> -       return xs_error(xs_single(t, XS_TRANSACTION_END, abortstr, NULL));
> +       return xs_error(xs_single(t, XS_TRANSACTION_END, abort ? "F" : "T",
> +                       NULL));
>   }
>   EXPORT_SYMBOL_GPL(xenbus_transaction_end);

Hmm, which xs_single() indeed takes a const char *, it then casts away const-
ness before handing to xs_talkv().

Jan

