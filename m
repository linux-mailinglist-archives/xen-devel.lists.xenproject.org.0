Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6085398CCB3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 07:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808587.1220509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svsLO-0000Kq-51; Wed, 02 Oct 2024 05:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808587.1220509; Wed, 02 Oct 2024 05:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svsLO-0000Iz-2C; Wed, 02 Oct 2024 05:56:14 +0000
Received: by outflank-mailman (input) for mailman id 808587;
 Wed, 02 Oct 2024 05:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svsLL-0000It-VJ
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 05:56:11 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05b995d1-8083-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 07:56:09 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a98f6f777f1so85988566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 22:56:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bd26sm809675166b.164.2024.10.01.22.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 22:56:08 -0700 (PDT)
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
X-Inumbo-ID: 05b995d1-8083-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727848569; x=1728453369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Y9rvVIdg/iEWvAzvOYjdogVh8CBWNMJBYTDa+w02eA=;
        b=dVo9Fbm7kb4SQQy4Hs/pmJlZCP9XXk3UjUR8mCUpUSN+PHPrBv8g9tTziQlaDLPTH7
         KZZrTtgMdsansa756gaoic3eT7FxsyBfDUXUZ+02ECpjpDMAxppBe3JyR9fTEARaivoM
         tpxOfQonCbhSs70dNSeauk7wSsUWAkw+knEee44c+o+vI59aVlv+DNjfTOtJsXHaEGrR
         e5f1XEik1sws5uU/Rj1OBIYz7aChg+0jY41M8YFHjcSMpaZ+5TiNU8F8daPYzmhQiF5O
         rLKG2TUu/J8Tyc0BHOpjQTR7Evdv5+ReX3+zZl5TuSh+96FgPbjkqUS8NjDIyrrL6Vre
         ud+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727848569; x=1728453369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y9rvVIdg/iEWvAzvOYjdogVh8CBWNMJBYTDa+w02eA=;
        b=izEMah0rUFrpaFpWRHj9NadnE/qOUyjxwHidIPtih31mV20fIb43A6t2+LHqL7/olz
         Mrvh7SPRMStJ+3UIdP2U3iYxhiwXzeqqc1rhcliWHBkDmfCtDK7itlI7zsJlYD4DUWCJ
         3qY7pY+jJu6qjU4fJ4uSPKy88+u5eMUd9nYUkOw88ChJBhuMFPh3GvYa/VhcG2o8hi5l
         Ugi0l6iEwd4AA9oocgWb6VDquMzjsN+iTrwH3jAetrkI531sWx9VWpkAfis0jg9yeO4O
         XgyTEVMJwkSvub13Z0STsgjEpSh5v7TiFF3djWsvgf7gGH54u5B+NoOtAXHbv1yz+y5x
         tlLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAWYcF+5GcdOZEP/fcTUwfRkAf9l3bcWafzmDvipYHvKtzRw7lm2HUMVtTj3OyEQb7YjnT7pVZNbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6nzQVqnO7EABGyvN3r+vAV70kiC2YUfX/aIEHOiDL/eogchQR
	buY5xrOL3hu01ahRSBCViHK+gPq9Apzw7kK8dEapmTZYEpUxgSX3xRFgALDk1g==
X-Google-Smtp-Source: AGHT+IFgE5ALGcm/Evd/st7Sv12iupCZ+hS1NjjdbJlLsJr0mfT9VUmhmzysxx3Xkwehdx+hobyR9Q==
X-Received: by 2002:a17:906:6a19:b0:a86:743e:7a08 with SMTP id a640c23a62f3a-a98f825a9d4mr174251866b.31.1727848569202;
        Tue, 01 Oct 2024 22:56:09 -0700 (PDT)
Message-ID: <0099629c-90eb-4a85-9c23-c1e57c754768@suse.com>
Date: Wed, 2 Oct 2024 07:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/11] x86/ACPI: annotate assembly function/data with
 type and size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <4f828e91-aa90-4b44-b778-234812e4f8e1@suse.com>
 <13168581-c5b1-4c85-a7bf-a865914ad9e4@citrix.com>
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
In-Reply-To: <13168581-c5b1-4c85-a7bf-a865914ad9e4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 18:51, Andrew Cooper wrote:
> On 01/10/2024 4:14 pm, Jan Beulich wrote:
>> Use the generic framework from xen/linkage.h.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> although...

Thanks.

>> @@ -132,6 +132,7 @@ ENTRY(s3_resume)
>>          pop     %rbx
>>          pop     %rbp
>>          ret
>> +END(do_suspend_lowlevel)
>>  
>>  .data
>>          .align 16
>> @@ -142,5 +143,4 @@ saved_cr0:      .quad   0
>>  saved_ssp:      .quad   0
>>  #endif
> 
> ... we do need something for these 3 variables, or they want to move
> into a C file.

We have DATA_LOCAL(). Moving to a C file would be odd, as they're not used
outside of this file (and hence aren't global).

Jan

