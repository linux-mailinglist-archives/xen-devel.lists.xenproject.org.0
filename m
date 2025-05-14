Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B61AB6BD1
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 14:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984298.1370452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBbI-00056M-03; Wed, 14 May 2025 12:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984298.1370452; Wed, 14 May 2025 12:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFBbH-00054g-TQ; Wed, 14 May 2025 12:52:43 +0000
Received: by outflank-mailman (input) for mailman id 984298;
 Wed, 14 May 2025 12:52:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFBbG-00054a-Il
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 12:52:42 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52660867-30c2-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 14:52:41 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so1092488766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 05:52:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd2c0sm931739266b.130.2025.05.14.05.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 05:52:40 -0700 (PDT)
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
X-Inumbo-ID: 52660867-30c2-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747227161; x=1747831961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePKQMdg0HfkFJRMwMJzfA4x2E8fptY8CYBTRd6KUVxA=;
        b=MWN1C80BlVr/afbFbBsaLDUxpCEW0evvsc+s6UOSZRTrLc4JiTpjzb8sta+7DCgit7
         VhmcuyEymsXw5jEl3989R+EF6wzJPd2JR++V/iynAnbJngMEkXwdkhXpYfwZpThtxcf3
         AldhuLgCmBme1Q9CitUkZPTeeqp/nXUB6uqZDs/aGLUt2UYx6vgcck/pLoD2/p4i/mgl
         +Nll30uZrCkwW6cvfqP29hj0+euNbrG2xQ528ibm4sONqsk9vPA9YjCtDyGV9m8i6XOy
         6amZWtcV3DOt06e3u2Z1z5CNO4h1q4EhQ5aXP59k/RSKHAYpn69ygHHB4graNVo1ox+d
         7ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747227161; x=1747831961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePKQMdg0HfkFJRMwMJzfA4x2E8fptY8CYBTRd6KUVxA=;
        b=Hskxh2hsQjdf4KQf/msRMxRtQV5fMM+IADxAd0Sgf3PYXY3xEvDsh/EV+XwYgi9wiG
         L2ViV7D3HwmFg2VHEk2VSN8I2oIqyrvKFQID3TrWyFPfJ5Hu1lYvX01JGfCyh0OXY8dN
         GR1NdEVd2mD8acmsTX/LjZnZPVoJ/BcGl0/WSUXN7z9+PYNi/bLlEryABdRGFbrnDNDT
         PbTIN7n//HtiNU7XGkkTRx6frBgonR18UTKZVO9sgWdy6WDqsRfyTjzG5vIKF90QHsvw
         aXQrnMvnZn7jF6J9shKtKjj/mugdCDxml36TLt8cnfRkQpYLTXyWBSrKXyLByKmiT7Jg
         Y2MQ==
X-Gm-Message-State: AOJu0YySu6fl0oR9qswiqAXGnppipEY9O/hEx9KeetBJjs63xXM+7PYr
	dYZcgKYtGb/ezslGvuwQeG5Dqop5YxeQG4AGp0PwdW3/Il/MLn4e4MNVSqi5WIiKZYqWuUd9ZEg
	=
X-Gm-Gg: ASbGnctv3p6JCSgX5r5LG1U607VD6wjg19sGFeP0avYunQCy/DqyszDvL7uwttmk7Wg
	pXjjYWQq9zMPJbum9hK95Qw+yI/sjF6iJMYE3ua1KLQ0j+aVqS4K6lNlAi92O6fAKNpY+KBEdQo
	WvbhleNlVTcG1WtoqNH9iCIaCRKK38Zvq3wXcYxeA7gs+TDEHycvEp9zlh7ySffHpGBf8gkEBeT
	7KxFaQ3KhAieYay9QAPQDx5mcfWAjnHfzUitZFWBzgrIW4j4x8ZNuXCsxUaa0yRUHV1OD+7H5TN
	VsiaZPZ1v7pWATJZ0Q7YlSc+jAWdUyoFVBNTNubTZ9zoRVj7Eahjku6jIJO4U5QC5NJ9jgrZYkI
	9mBGqg1IAn/mFGKdudVaE3IO4Nh93qwZXeyts
X-Google-Smtp-Source: AGHT+IFUDbpPYhHLaAwWhcFAxMnHAB2gDj8LuI1AsP0GOC1zALwos7nmOVnN2b75vLF3iEs/Stmg8A==
X-Received: by 2002:a17:906:dc92:b0:ad2:50ef:492e with SMTP id a640c23a62f3a-ad4f717e01dmr340251866b.32.1747227161096;
        Wed, 14 May 2025 05:52:41 -0700 (PDT)
Message-ID: <5aeca684-4ff1-4299-ab07-95d02be12f46@suse.com>
Date: Wed, 14 May 2025 14:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <ca63920c-b349-bcd3-8c1d-c869d8de4d99@suse.com>
 <aCSCNUGdbuwrJLd6@macbook.lan>
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
In-Reply-To: <aCSCNUGdbuwrJLd6@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 13:44, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 11:46:41AM +0200, Jan Beulich wrote:
>> This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> This is however missing the previous calls from SVM/VMX that at this
> point in the series have already been switched to write-back instead
> of evict.

Hence why it's this late in the series, i.e. ...

>  Maybe this patch should be the 1st of 2nd, so that changes
> from evict to write-back are done afterwards?

... I wanted to avoid touching those places twice. (IOW re-ordering would
be possible, with the extra changes you mention, but I'd prefer not to.)

Jan

