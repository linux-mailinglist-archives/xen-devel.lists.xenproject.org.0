Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55DCACA9BE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 09:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002804.1382191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzML-0001G6-7D; Mon, 02 Jun 2025 07:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002804.1382191; Mon, 02 Jun 2025 07:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLzML-0001E9-3u; Mon, 02 Jun 2025 07:13:25 +0000
Received: by outflank-mailman (input) for mailman id 1002804;
 Mon, 02 Jun 2025 07:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uLzMJ-0001D2-C3
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 07:13:23 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10ab03da-3f81-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 09:13:21 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so3738235f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 00:13:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bd94b2sm64566975ad.72.2025.06.02.00.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 00:13:20 -0700 (PDT)
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
X-Inumbo-ID: 10ab03da-3f81-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748848401; x=1749453201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ysYu7/nTavhdXsRNUmlSp5Kk8buLrns0p+bBB/DCuB4=;
        b=IBMgMQC35aCRotovJ5Xr+fEyAYxTZuUK1qcm20L0hW5J5wWZtnRJ4PjByIFhssMhVZ
         rMuu3/5AgrV/yNVfd+Qi5PzfoqK1iNo358vNsnstNponerdSPZJFD+LytxHXBRyU/bKm
         NpIEF4T9lq5PnjLYikKPNes7mKvZ7AkFmG5eQbhPwSTODQTQ0QQKcMLGrtuBJMRrZ9ql
         83DlBlrPFN59iqd28LuIwybxeKZfTKOrb22WrBBAjeLWzMB4gq6lO1HT5c9H/lPx6KvX
         +YxTZmo+OsnYhsBZrYzTND+GgsTB+pLA/RHGvBIND9ceoU4TaIzNElbLCO+enTpsYKx3
         2plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848401; x=1749453201;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysYu7/nTavhdXsRNUmlSp5Kk8buLrns0p+bBB/DCuB4=;
        b=rGayjt8QyraGWBps2PKVouYcgGyvYulgmn3O6lIEBMrPV7ibkXFITZiGYGmUNoAYC4
         Aoekdqh+jVq49S2/dg2t9x5nDhDdqozN9ggtqeS1TyUsIrBbyrYI2tUOC5UvbVSudia1
         fMBCGXoejw8sMpFru24HdN/aLWO3zA/ZxwJ8QSLUUuJo94SmRdwFCtkQ+m2PThzEDdB6
         LpsmPPPh8+XB36WedQ4adAzIs2ze/Qm+XraEyQeUXzlCLbI+iuxCllyrGBg7ojgh148o
         cKI2nTMI82A0wVB/4rpGlKuQ4xFePWiojbiJ6Xv9fEBRZA6utlgbBINpDEPrCLsziGKO
         rnBA==
X-Forwarded-Encrypted: i=1; AJvYcCXnJzLyLV8ccKNvpah9vKtsInlPeAI1P4oFiF5m7xp1trVnolfMJpJ5qktUFSsHKii9JjsMDs+J6bE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6yfegy23pCLFjX1ayRfgmaPoCdRswM0kH9urVOl/DKlvg0wDV
	luznLcrXXik4yJsTVx0JsAwIbZEWacOjGxXCvXlLisZO2odekka4px9GX5StdFq+yw==
X-Gm-Gg: ASbGnctgF1zwCIk00Twp6HMJyl15RP5vIrX1Z+t58zVsHPseYcQ//ciGJjLxkdmfhsf
	LDAc94B59hLDxrFzoOCXAR4sv5qmnhr1U4jatKjGUmenMfGL5EFo45c3pZhfecclIdOOnS+RsRm
	DpnwZaKEgNcJICeti418lIaOO5JLmo1TxDmr4fLZ+W69M3ZI3d6dCyRXlZKHtvVsN+rx2nykMOf
	ZH6rRDqp5A8Qdv+wrxRKUEAehl6M3cPCkcl2jjS60JcRK1OF094dDeb/XNMzZhUQC35trxSTLic
	TpIJ24WzmLbrNh16dBPf6yb9gnuJqvJ4g8L5vqT0+uyO44HYsEbiMQDbLhj43tGTji98Pvq9wfZ
	UBmGvaR+tk6YGdsXQ4ukxDY+qfwA6LbGaTd5d
X-Google-Smtp-Source: AGHT+IHNod+xfvxIR1KRV7KJVgc4dGt9nRaEdg+gkPFzwZDivLGa8sx1ca1SDxBE2GXkdyku4DY5vg==
X-Received: by 2002:a05:6000:1acd:b0:3a4:ee3f:e9a6 with SMTP id ffacd0b85a97d-3a4fe3a6edemr5509470f8f.54.1748848400968;
        Mon, 02 Jun 2025 00:13:20 -0700 (PDT)
Message-ID: <2b004c3e-b9b8-4ed5-b54c-0f00f6b78da6@suse.com>
Date: Mon, 2 Jun 2025 09:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] xen/domain: introduce CONFIG_MAX_DOMID
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250521000024.2944685-1-dmukhin@ford.com>
 <20250521000024.2944685-4-dmukhin@ford.com>
 <54945bd5-333e-4ffd-8ff1-bb89d22c7ef4@suse.com> <aC5rRwyN51pdRRCM@kraken>
 <3b203f39-756b-4fb3-b0e5-0f790701c23a@suse.com> <aC9oCJB/xt3xM6VX@kraken>
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
In-Reply-To: <aC9oCJB/xt3xM6VX@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 20:08, dmkhn@proton.me wrote:
> On Thu, May 22, 2025 at 09:01:51AM +0200, Jan Beulich wrote:
>> On 22.05.2025 02:09, dmkhn@proton.me wrote:
>>> On Wed, May 21, 2025 at 09:31:34AM +0200, Jan Beulich wrote:
>>>> On 21.05.2025 02:00, dmkhn@proton.me wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
>>>>>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>>>>>  	  working alongside the colored one.
>>>>>
>>>>> +config MAX_DOMID
>>>>> +	int "Maximum number of user domains"
>>>>> +	range 1 32752
>>>>> +	default 32752
>>>>> +	help
>>>>> +	  Specifies the maximum number of domains a user can create.
>>>>
>>>> My prior comment remains: The description and help needs to be accurate, in
>>>> order to not cause any confusion. In a true dom0less environment I'm not
>>>> sure the "user" can create any domains (post boot, that is). And when there
>>>> is Dom0 (or late hwdom), the number specified already isn't the number of
>>>> domains one can create (again, post boot, which is how I understand "user
>>>> domains"). If someone picked 1 as the value here, it's unclear to me how
>>>> late hwdom or dom0less would work in the first place.
>>>
>>> Do you think something like the following will be more accurate?
>>>
>>>     config MAX_DOMID
>>>        int "Maximum number of domains"
>>>        range 1 32752
>>>        default 32752
>>>        help
>>>          Specifies the maximum number of domains: dom0 or late hwdom,
>>>          predefined domains, post-boot domains, excluding Xen system domains
>>>          (domid >= DOMID_FIRST_RESERVED).
>>
>> Especially the mention of DOMID_FIRST_RESERVED is too much of an implementation
>> detail here, imo. Beyond that - maybe, but I'm not overly happy this way either.
> 
> Will the following description will be satisfactory?
> 
> config MAX_DOMID
>        int "Maximum domain ID"
>        range 1 32752
>        default 32752
>        help
>          Specifies the maximum domain ID (dom0 or late hwdom, predefined
>          domains, post-boot domains, excluding Xen system domains).

This is better, yes, yet ...

>> As an aside - MAX_DOMID and "Maximum number of domains" are conflicting
>> with one another, too: Do you mean "maximum ID" or "maximum number of"? The two
>> are different by 1.
> 
> That would be "maximum ID", thank you.

... imo asking for "maximum" of something is perhaps a little odd. Asking for
"number of" is the more usual thing imo.

Yet as before - I remain unconvinced we need such a Kconfig setting in the first
place.

Jan

