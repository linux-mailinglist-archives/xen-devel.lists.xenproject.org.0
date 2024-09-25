Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF319852FC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 08:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803480.1214054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stLcU-0000ia-LR; Wed, 25 Sep 2024 06:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803480.1214054; Wed, 25 Sep 2024 06:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stLcU-0000fr-Ip; Wed, 25 Sep 2024 06:35:26 +0000
Received: by outflank-mailman (input) for mailman id 803480;
 Wed, 25 Sep 2024 06:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stLcS-0000fl-TN
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 06:35:24 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56afda5d-7b08-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 08:35:22 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so811753966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 23:35:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f4f8b1sm173317266b.53.2024.09.24.23.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 23:35:20 -0700 (PDT)
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
X-Inumbo-ID: 56afda5d-7b08-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727246121; x=1727850921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JQta3MKUn1bTeafZ9XdiWq2GGWWWu64RSe7FXbP3lRY=;
        b=CNr4rqJpw/N1lcwWZiuLgD2eI5W2MBDSAE9NKuL7w+dZIYLPEH/f+z2l+nzwyJUewI
         OTUTK9oDTHsfgZbNSOho4ULD93xMbFvVdM/JS/u31UdCqKqlj1DzrzrDeyGjPs0IL1GO
         6MAQRqMxZPBof3hIF/p8+Oon5Xa9VzhcDT90iHEHScQVvk4lxlz7ivlAYCGdBc4fE+vO
         vyQ7GZ+a2g/K6CHNvyR3GizriwyEiR0hHB419GpHOiqrigeeB9SlpO1xEdJvW8soK4kI
         PFSQCXGb5+EvJCV3ZqdBKs6eiKtHrt0SEJTu/cMMMQayAvCdnM5l4V5GWhUWkDZb9gTi
         Gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727246121; x=1727850921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQta3MKUn1bTeafZ9XdiWq2GGWWWu64RSe7FXbP3lRY=;
        b=I5ldwOV2dYtS2svwfAJ/3OFTPyOVPhnzsqYRoIVqZkq0gdriXX9YIS3DeFgH3UZd51
         RSPZzVJ2b7q2/q8+QfyRsSg1ZrI6O3PnIS2EanWdoRVcTXyD+3SRToTm0lUQIPoTHiKF
         fSBnNETMtBsxelHK9IdoiEphjBCAfC85fiEf24Ps5JP2SAIfCshhiZShfAgGeWMDCFU3
         StgVP3NUjK4sXhwMV72u/udfDZbfpjdtcUxUW4wQVVELDS7FTrYF0+OlpQF+K2409+3b
         StypUEPYWOCDwGENKZQN6frFLVCashtGYtX7Iz8kAoBDgSXrsdlRxgrSl0yzHLIgZFbi
         /Gkw==
X-Gm-Message-State: AOJu0Yzq8u8DnjZE88NuWJSDOkvcuMS6NwItPfoi4ubxOAh+81V9bw8X
	yMU7TD62ooDCBwCklYFLL312njMRQs2/M38WPSbBfWTEVKRtZtdUM0pKdyBrJQ==
X-Google-Smtp-Source: AGHT+IH2/P+MZg6JwvtPV+q2/uc3SQxwjQJWCZQnEQVIdb0wpFsl6g+8j2xbz6spt1TbHzjnDi3D/Q==
X-Received: by 2002:a17:907:e253:b0:a8a:5ff9:bcd1 with SMTP id a640c23a62f3a-a93a035e75bmr135572466b.21.1727246121198;
        Tue, 24 Sep 2024 23:35:21 -0700 (PDT)
Message-ID: <208589d3-aff2-414b-8bbd-89d0753f346a@suse.com>
Date: Wed, 25 Sep 2024 08:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
 <Zu2Cyan46VVs2oef@macbook.local> <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
 <4fbfcaf2-f317-4b4f-9655-0f0c9e1e453b@suse.com>
 <30c4303c-81a3-4507-80b5-08b1dbda6104@citrix.com>
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
In-Reply-To: <30c4303c-81a3-4507-80b5-08b1dbda6104@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 20:36, Andrew Cooper wrote:
> On 23/09/2024 2:03 pm, Jan Beulich wrote:
>> On 23.09.2024 12:14, Alejandro Vallejo wrote:
>>> On Fri Sep 20, 2024 at 3:12 PM BST, Roger Pau Monné wrote:
>>>> On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
>>>>> Moves sti directly after the cr2 read and immediately after the #PF
>>>>> handler.
>>>> I think you need to add some context about why this is needed, iow:
>>>> avoid corrupting %cr2 if a nested 3PF happens.
>>> I can send a v3 with:
>>>
>>> ```
>>>   Hitting a page fault clobbers %cr2, so if a page fault is handled while
>>>   handling a previous page fault then %cr2 will hold the address of the latter
>>>   fault rather than the former. This patch makes the page fault path delay
>>>   re-enabling IRQs until %cr2 has been read in order to ensure it stays
>>>   consistent.
>> And under what conditions would we experience #PF while already processing
>> an earlier #PF? If an interrupt kicks in, that's not supposed to by raising
>> any #PF itself. Which isn't to say that the change isn't worthwhile to make,
>> but it would be nice if it was explicit whether there are active issues, or
>> whether this is merely to be on the safe side going forward.
> 
> My understanding is that this came from code inspection, not an active
> issue.
> 
> The same is true for %dr6 and #DB, and MSR_XFD_ERR and #NM.
> 
> I think we can safely agree to veto the use of AMX in the #NM handler,
> and IST exceptions don't re-enable interrupts[1], so #PF is the only
> problem case.
> 
> Debug keys happen off the back of plain IRQs, and we can get #PF when
> interrogating guest stacks.

Hmm, yes, this looks like a case that is actively being fixed here. Wants
mentioning, likely wants a respective Fixes: tag, and then also wants
backporting.

>  Also, I'm far from certain we're safe to
> spurious #PF's from updating Xen mappings, so I think there are a bunch
> of risky corner cases that we might be exposed to.

Spurious #PF are possible, but __page_fault_type() explicitly excludes
the in_irq() case.

Jan

