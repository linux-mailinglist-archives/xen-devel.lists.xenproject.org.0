Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679BBAFC58B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 10:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036277.1408535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3gT-0007HS-GG; Tue, 08 Jul 2025 08:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036277.1408535; Tue, 08 Jul 2025 08:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3gT-0007FM-DE; Tue, 08 Jul 2025 08:28:13 +0000
Received: by outflank-mailman (input) for mailman id 1036277;
 Tue, 08 Jul 2025 08:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ3gS-0007FE-5A
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 08:28:12 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b201fb7-5bd5-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 10:28:10 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so27461605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 01:28:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84351a5esm108129095ad.55.2025.07.08.01.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 01:28:08 -0700 (PDT)
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
X-Inumbo-ID: 7b201fb7-5bd5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751963289; x=1752568089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T5v25hRbiY5JGXPxUGw2ih8I98z1n4g6PJ1zAwFACJ0=;
        b=LSw981Y2azde0OEquc8cXu3kIAACLovkmf06wPQlP2Lz++0cO7Q6G1CLVMp8ONmx08
         9ArMrZrwcXN6iR07CAxAFbac9kqKd1h+uazJBgnYvIRjzkxdN5IfI+XorI5xl+6ABTjU
         6ExT1HeYsjT7aPwAPvKmKkRSv8sDY6kyAkphfvLrM/o4U2TgIe1AhP2F9N2nmsCggwiH
         KD8VBjIPUtZl/cWkYQJHM/+HKrauXFSOjDnYfXXOApnk9seSk+V0IuqPzgilDpADVd1W
         8o7yCbqV4lH4/AqCFOfPNb5u03RQryRNZoez/zbokG8dLUIuelvrrR7RDjhwWbjHbuXi
         VSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963289; x=1752568089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5v25hRbiY5JGXPxUGw2ih8I98z1n4g6PJ1zAwFACJ0=;
        b=Sj82PVPYNA7QTpfj7MLuazw6aNHj8bI7NNPAkmjmZJ9fFdSKQflnCbdWFU7608iouW
         vCFDLToo8HpRdul+7uskt1ou8cXbG2BPLF42kHu1Y5bdOSLNj7t8Hqr8DVtobKChbe4c
         TUbMdIYAUgCI0M3WTFVJ9G2KyM6r063DArUrStNK4M0Ek85sUj1G5i9Bi/frjj0CZoTm
         qXoNrzJK9/fTf8TiIoeknMhDAM4vxmFQ6emuxynKKOzVeO6EudP7P2OFWnnkSCK7YveH
         r4W/EHZ0xx3rahBbWUD/ipMQpU9C1/BWHMkSQ9lzAiKlg9MTe9ruDi6SsJKUw4CaZfYU
         XylA==
X-Forwarded-Encrypted: i=1; AJvYcCVfTuDV5wwu0jhCQjM9NID4HKVWbYACGgKSroOeXKcwE+C8VMfC6LB5lekXTn1FSuMVgtqkp9KQXnQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNMoTBHmi1lRJpZ5QBAUdYpUjUdlu5bnUTUOY4VUbLfJa5Woh3
	tPX0+X/TJzOA/gUwET6Z47uWXw3uwVbpW8TVJWixnZ4HGPCyhnunMyg0z+55sBOFiw==
X-Gm-Gg: ASbGncueAHCFJZBoACUqo+0YFA1S4Nrv28WEYKVagdxTm7p6bXJymmC3DOoORiLssYK
	ffUQb7GtgNBT2CvcJ7oM5MFKGWzn7dIO5G84dbAmrvwmfFT0K3dAbYuatzJ6VfVLZfMKlwigKhA
	YumhlVaEYLsRdxEccJleBnXEv6RK7H20wWstsYsKu6TnFh13PcmVmfTYX6IfT1DxcSKWTQnBYG3
	EmrFgNgBKn+UBdejADxuNQHf6Ecwi6c87LoGK09SAk93B9pKa53y3TtCnmt+ouYesY+jxrjFwwd
	I2sOBqqdqxc++IFDbC40A6tCg/CrsbSeOFWFXtl5IqzTIBDbRpb8YbofNxoyjp1eTxaFgVdYikZ
	Qk0/LiN86TROJUuBy/OfA+Es0D6dy9egsJ3w0N35qEilAbGo=
X-Google-Smtp-Source: AGHT+IE59x36eBV+K47yO7fHBiUqC7+8w2nM8lD2MMs8Yz0HS6QyGRjd4RW30hPi/lifNzYJwnjd5w==
X-Received: by 2002:a05:6000:41d5:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3b4964e9ac4mr12090702f8f.46.1751963289554;
        Tue, 08 Jul 2025 01:28:09 -0700 (PDT)
Message-ID: <bff4edce-588c-4805-b4f3-358537f8fcfd@suse.com>
Date: Tue, 8 Jul 2025 10:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Fix crash with initial empty EFI options
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250707151122.292272-1-frediano.ziglio@cloud.com>
 <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com>
 <CACHz=ZiiO4KwSPitaE261oBucAuZkHr3ugp+mCYhCnSbN8FyAw@mail.gmail.com>
 <c31947e7-f786-4213-9d91-28e1fa8908c1@suse.com>
 <CACHz=Zi9CAmdq6CmEF_CCEL9=w1ZLpCp7meA4rwhmQzYz_Et4Q@mail.gmail.com>
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
In-Reply-To: <CACHz=Zi9CAmdq6CmEF_CCEL9=w1ZLpCp7meA4rwhmQzYz_Et4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2025 08:03, Frediano Ziglio wrote:
> On Mon, Jul 7, 2025 at 5:04 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 07.07.2025 17:51, Frediano Ziglio wrote:
>>> On Mon, Jul 7, 2025 at 4:42 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 07.07.2025 17:11, Frediano Ziglio wrote:
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>                                      VOID *data, UINTN size, UINTN *offset,
>>>>>                                      CHAR16 **options)
>>>>>  {
>>>>> +    CHAR16 **const orig_argv = argv;
>>>>>      CHAR16 *ptr = (CHAR16 *)(argv + argc + 1), *prev = NULL, *cmdline = NULL;
>>>>>      bool prev_sep = true;
>>>>>
>>>>> @@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>                  {
>>>>>                      cmdline = data + *offset;
>>>>>                      /* Cater for the image name as first component. */
>>>>> -                    ++argc;
>>>>> +                    ++argv;
>>>>
>>>> We're on the argc == 0 and argv == NULL path here. Incrementing NULL is UB,
>>>> if I'm not mistaken.
>>>
>>> Not as far as I know. Why?
>>
>> Increment and decrement operators are like additions. For additions the standard
>> says: "For addition, either both operands shall have arithmetic type, or one
>> operand shall be a pointer to an object type and the other shall have integer
>> type." Neither of the alternatives is true for NULL.
> 
> Yes and no. The expression here is not NULL + 1, but (CHAR16**)NULL +
> 1, hence the pointer has a type and so the expression is valid.

Sorry, meant to reply to this as well: That's not my understanding of the word
"object".

Jan

