Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A7AB6E8E
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984420.1370562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDUE-0000E4-BD; Wed, 14 May 2025 14:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984420.1370562; Wed, 14 May 2025 14:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDUE-0000Bs-8Z; Wed, 14 May 2025 14:53:34 +0000
Received: by outflank-mailman (input) for mailman id 984420;
 Wed, 14 May 2025 14:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFDUB-0000BV-Vn
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:53:31 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32ceddb9-30d3-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 16:53:29 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5fd1f7f8b25so7737913a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:53:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad4feab49absm103137666b.110.2025.05.14.07.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 07:53:28 -0700 (PDT)
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
X-Inumbo-ID: 32ceddb9-30d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747234409; x=1747839209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ceAguSr653GAv4wg7Y0WeCfpzvoB1roHPqu+hG0j7ms=;
        b=KRTtjFEjNZivx/vjkwQjKrlXhLc9jHK0gsSQE8Fq5Kh4QZGHE/qPl7m/eof+22Jxxx
         zVZ3zSe5x8DDJrbIcXunYNIZ7+2DuhIesEC6IUASSMoAQIMG4mqWmQ6+w+kdeaZJQ+jo
         N32L51dU23Bw2RHaO21/E5u7P+UW1tVl8X9+vkCvzaTp7Yu97JkqfV/9pztSn9lDujpI
         TnYLs9XVDAGi99bNBkcziIS4MRzTPshbUQ+ir5zR82s9F0u2AUKPsX02XJAJyKa/egOv
         csrp7NQhQO9Wg+sGuXtqSgNzyu9IkXQMK0KSNnnZ1kVjzI5vIwvsaUtA4rkcgf0kiGns
         pF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234409; x=1747839209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceAguSr653GAv4wg7Y0WeCfpzvoB1roHPqu+hG0j7ms=;
        b=SB97V9YOydXItH2Lgcq1w6rgZZehWvjgUqVoVVMo2HVneD6RLrbFXlPf/poDAcUOgl
         FW3C0SvHo5eVKXmhZnIRxkCLyY2ZcrCqgwl4slCXSpMaUIKwRplXCe+TSqyDpiqML/0a
         5ThqUXDYKqkOlTE4Aou0q35kgaRMK7CKAQXD2OiQmdhNJ98z7jroeSImX+2Qk63+/Z42
         fFw5RZncywXRMvmyra8hsbaM3UArTPOnXhur+OOXzucdNLWGVRBS8TWhFxld3vpSuZBi
         dQvMqgPqs8G7kCa8gd0yRz2HvblceM8zNrBklZXJD4i7tyV9PqmBTOOmbgDqeEBzjAZA
         9uSQ==
X-Gm-Message-State: AOJu0YxtbyyTTgquq/i1zTHnlYlrSBw60E8k01nnLkbCLtrfI0GgjYZx
	gXYjBlclUaTT0qmEB6fJalkZjmvMtnSzMZnsaAvMxr0ZFKOX4qEC0pUyebJ/LtFjDbAazZc5dOE
	=
X-Gm-Gg: ASbGncuE7Se/mL00mmHLVU+TRMn1W3c3BbpuKfC270zp8t5te0x+b59XsY5MmWorXOL
	phtHMl8oAx5y0yALk8IYedt9I0ik0uokVjY7ri/RxX5wwY8/jw9eg5fprPz8ver78UZnBPa7GU3
	B+9n/PFKFGjyzsCdm/YfaMMKTJTuaj4WmDtZROSskMexRktMSXc8HPAJ6Q5HVF+0WEUXBB9VCpr
	IlGnxnZPcI9JyaemamAZHWyWelZGrckYFl5+fCl1QiGVaYzQQSJPdlGUFjSyWSZUM/sV2/vwDT+
	dW4/yRqv2dgH6xJWk9vWpkVIUA5Pe5qLOdUbqjq6ucaLTZ8eFOKq5bQIkmg/5NsbUuQ3CKc9/Yh
	L4U1i3Do2u3RpvLYBl94R7FRqYDXBwNfB2Zgm
X-Google-Smtp-Source: AGHT+IGGpZ6vTR2vEV2E5QJFD7GbHIiwI+pC+AD7o92sf7QpHAPOKwRw+/TnDWVNU5rjf1dJoikqqA==
X-Received: by 2002:a17:907:97c2:b0:ad2:51d8:7931 with SMTP id a640c23a62f3a-ad4f71164c3mr340334366b.21.1747234409271;
        Wed, 14 May 2025 07:53:29 -0700 (PDT)
Message-ID: <915f3134-3095-4a70-bdfe-a8fdfdb031b6@suse.com>
Date: Wed, 14 May 2025 16:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
 <aCNMEadsYoIKLbSp@macbook.lan>
 <80ab4cdf-dbbb-4daa-831e-c6d92f5dcf13@suse.com>
 <aCR-xQlo9LQfeLmb@macbook.lan>
 <66603689-429b-4bf6-8792-e4feae346a13@suse.com>
 <aCSr4rfRBj_Yajed@macbook.lan>
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
In-Reply-To: <aCSr4rfRBj_Yajed@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 16:42, Roger Pau Monné wrote:
> On Wed, May 14, 2025 at 02:46:32PM +0200, Jan Beulich wrote:
>> On 14.05.2025 13:30, Roger Pau Monné wrote:
>>> On Tue, May 13, 2025 at 03:54:56PM +0200, Jan Beulich wrote:
>>>> On 13.05.2025 15:41, Roger Pau Monné wrote:
>>>>> It's my understanding that the same is possible on native, as the CPU
>>>>> might speculatively pull lines into the cache.  So there's no reason
>>>>> for an OS to use wbinvd if wbnoinvd is available?
>>>>
>>>> Speculatively pulling data into the cache is possible only when page
>>>> table entries permit caching. Hence after changing all mappings of a
>>>> certain page to UC, an OS may have a need to ensure that no data of
>>>> this page is left in any cache (and it can't be pulled back in
>>>> speculatively then).
>>>
>>> Is this realistic taking into account the OS is running virtualized?
>>>
>>> At least with Xen there's the direct map, so once context is switched
>>> back to Xen (for example to execute the wbinvd itself) there's no
>>> guarantee the CPU won't speculatively populate the cache with entries
>>> from the direct map.
>>
>> Well, we've been knowing for a long time that we're not doing things fully
>> correctly there. Once a guest has changed all mappings of a page it owns,
>> we ought to make the direct map one follow suit (or simply unmap it from
>> there).
> 
> Keeping track of guests mappings seems extremely complicated - maybe
> doable for PV, but not for HVM with HAP I would think?

Indeed.

> Also we would need to do something similar if guest enables CR0.CD and
> switch all the direct map entries to uncached?

Likely, yes.

> Address Space Isolation (and the removal of the direct map) might
> solve part of this, but still I don't think we can fully guarantee Xen
> won't have any mapping of guest pages with a different set of cache
> attributes.

Yet for correctness we ought to, I fear.

Jan

