Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA34BC921AC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 14:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174799.1499743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyNh-0007VA-Ib; Fri, 28 Nov 2025 13:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174799.1499743; Fri, 28 Nov 2025 13:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOyNh-0007Sv-Ex; Fri, 28 Nov 2025 13:19:25 +0000
Received: by outflank-mailman (input) for mailman id 1174799;
 Fri, 28 Nov 2025 13:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOyNf-0007Sl-KK
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 13:19:23 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bc0563-cc5c-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 14:19:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so10923565e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 05:19:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0cc39csm157664805e9.14.2025.11.28.05.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Nov 2025 05:19:18 -0800 (PST)
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
X-Inumbo-ID: d8bc0563-cc5c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764335959; x=1764940759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XmWgLA/LYnaxDZ0rkriYPulBqsL19NUbdjrGgB/L3gM=;
        b=gdxi1/4g2tNSJY8cJse4DMAQlGIhq62cVwnBERoalq48i8bs6d42dCT6tHGexBOlJ1
         6fHnDjd7g5NaIJfbRTeiV9zx6/iBkk+7rVRGSv38lB8g/Lwqmy0Jz+CMrZX3UO8Uu0Mz
         M1Zffjy/ISvc0D219lsA2RrqrWamhm+INBRFiE3k+hRwdEOvy2cL1eI5nFFp+LAWvpNC
         oo8l8tq2Sq3TF+bKqUN7QWwdfGhN8IemJQa/kXSmNG8G52jsOIoanI0b9dC1gk9D7vuE
         XUaRcwvLP50QlmIjclOFftBUK5F5nNlAUr8FmW5aP8WOAX+xAQiQTrCndMDkav/+xa0s
         u0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764335959; x=1764940759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmWgLA/LYnaxDZ0rkriYPulBqsL19NUbdjrGgB/L3gM=;
        b=q6Q3wdFrwwnfIxv9b7oc/NVQp/8tDLr+ZomZHBdmhDLMHmOEgfDB0a+h1vxSGJNWmG
         RGxBDb38hDRG/EXUk+eMBff9gmQGjIzVNY6Wh3O8RfuFg6trkRFuyXw4Eez5v1wjK18+
         wsMijV0pja3n+t6hD7fBfw0UkG5TKJITxtjvetlaWpQWmvebz35hZA+ivRz0D5R2vJci
         1RGOuhTdLlRReGwKgfWGL1QNtEFyYXzMBnOav21D9QIpcwX7bp4DvxK3Ag47hKpb06qS
         Cx1DTS9qNrljn4WYdLBoF7i8vVXPK5jfyHg2WgOyVpKG3ZwnQA8MVU30XoMP+6eQqI36
         AZkw==
X-Forwarded-Encrypted: i=1; AJvYcCXVs/AYHIUzjwg3ePYbVIYmrHixoIkHLcV9zCo8IKyd488m7H8qrvaURKFGINXsc5k1+cX/W47OAZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPDVah9gBDOZJiN3TpDJn+4vqy/l7utv3FTdZ87DwPDDcDbdjH
	AiXHS0C+6yyCtNiV86NlwOHtNr3HYpRjJ+oK4VFqiqGfl/9dc60gTGwWVXuxmgWWaA==
X-Gm-Gg: ASbGncvaEsZ596tt04bnvG+IG77i66WeHjtQA5OZWSKMiSmYhlWj0X5fyi3PM4d2dpB
	mPIZcuwUeBcFW55MOwYQcRy7qROI2jCUYrk2hQU/OsPL1sW5/eXKNJGoqj6MAZzJVndqrK6mgXX
	tjb+Ls0Arno5BcCRWYgEvCHtvitljz0YYEuotkAn94sKw3VS7WtekX6pzyNlGamZcH8wl2THx3r
	x1lhmjKJ0Wx9yR6yn5+WFfpOvu58/9tIN5DxrvtFqXqRwZCGS0+MyRF5KJ9QOMeesCCMphKSVdV
	Igstfn464FjlVcCULFApL/fZPLeYj4ch7Ou7YdqLfWuE0m16X4QIOjvqVunxt16VFGvtVPHJ3Hx
	Ziieww/LNRtp0v8IAIQ5BaWhfFDNIxnFAAwlWhsEesa2/uBXbPK9YqH1NBtohlNY0OITpqs5UFo
	7qDzRikhuTzUgNZXdFxUPXpuo4T4EPTzzQ/KOqLMbVeRzuU2uDBvI4kFeiUkZFikIH31nSeVV5O
	DY=
X-Google-Smtp-Source: AGHT+IGIEeD+MRPbm5ALD0bsSRU+6+VMjjax6lsEZ8jwFKfoXgRdg125HqteKDlbOgAS74JXJFl2FQ==
X-Received: by 2002:a05:600c:4fc9:b0:475:da13:2568 with SMTP id 5b1f17b1804b1-477c114eb1dmr236173065e9.25.1764335958727;
        Fri, 28 Nov 2025 05:19:18 -0800 (PST)
Message-ID: <467b9a77-6e90-4877-be8f-59deb72d1827@suse.com>
Date: Fri, 28 Nov 2025 14:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <0a66c71356e8d6ea788022438d7a73dbff8aa5b9.1764243466.git.oleksii.kurochko@gmail.com>
 <fbb420d8-499a-48f9-91d0-06469f265ff7@epam.com>
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
In-Reply-To: <fbb420d8-499a-48f9-91d0-06469f265ff7@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.11.2025 13:11, Grygorii Strashko wrote:
> On 27.11.25 18:26, Oleksii Kurochko wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -799,6 +799,28 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>       return arch_sanitise_domain_config(config);
>>   }
>>   
>> +struct domain *alloc_domain_struct(void)
>> +{
>> +#ifndef arch_domain_struct_memflags
>> +# define arch_domain_struct_memflags() 0
>> +#endif
> 
> Is it really the right way to
> hide part of common interface in common code instead of header?

If it had multiple uses in different files, surely it should be put in a header.
In this case though, with (even long term) there being only a single use site, I
don't see why we should even bother figuring out which header would be an
appropriate place for it to live in.

Jan

