Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E3B0F013
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053740.1422537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWsy-00086C-4A; Wed, 23 Jul 2025 10:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053740.1422537; Wed, 23 Jul 2025 10:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWsy-00083p-1B; Wed, 23 Jul 2025 10:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1053740;
 Wed, 23 Jul 2025 10:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueWsw-00083j-GJ
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:39:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 551ea658-67b1-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 12:39:38 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so64558125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 03:39:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe8fa73sm8689714a12.25.2025.07.23.03.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:39:37 -0700 (PDT)
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
X-Inumbo-ID: 551ea658-67b1-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753267178; x=1753871978; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4yoVgxWrIVvgzajKOPflUpOAE2gxA6l/HHRc3qcSD+Q=;
        b=MlJl9Eow7d7z2UWo1M5+8BVPWhb/sgkI3bWZwaNHw5jK6Hk9Q66mg9DV1TV7ikUGzL
         ff65EYzFtYmiMr3ZEH/hCqElJkClvviN+/8jQ7nDWxs8wuGWjEEWPrepP2oR8581U/la
         0pdt9T/8ASgOt2TSQJWMiKKD80OlskSJJ+GaVCpLZDUz3x0hXOILYnA5GNWIYB6NG1F4
         CLlW/KY8+NKEGkLpvPcJbhrytSmB6BDAu67vlyawMhn8eXojm8lZkp86NLk6k16loGx9
         I0qTRw92hR5ZTHeLV5NO43ujakdyHAXz1YUCNUrC8/9KtXWOUlM5+BFqQMbbIiXazIi0
         Y9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267178; x=1753871978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yoVgxWrIVvgzajKOPflUpOAE2gxA6l/HHRc3qcSD+Q=;
        b=skbaaj672/PvsPhrHaqMS09PWyIenkKY/abw0BpcQPrwVBLRwkA++LwXJwqSxAZ29m
         7Q7K2rNV8FExMvNrGheABjISyWYuU0kyP4x4yMUdslNEVR93FU/R97WyGHLFWNFH5D3D
         76zA1nbXz7nrF2kw4y85oM0CN47k9Fm6xHCNDgSpbqrkfulYMgHyzcdh1GfzpanEhiSc
         l8JwnguRCBfQsDPS3qsfvUdWyySVpqvKf1vg93X7d02M3stwgYsVa3A7F602Ck0hVZed
         7fX2cViCdcnFIQTOcnX/WvNNFbpm+G1OX4BhRG28bGUZJ5+U0R2harCLfciaUwPN8+cS
         +TQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbwFaWuOCkkUfeusM0pYImT3WR8T+UzkNvJ4aVgdP+BjHWuveb41BzHvWFfwRBY12lbwefbhvhQk0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9+GDw690PnVRORmYs3q/jBuZLL/F2hsdAbbctUe0HOxLPA/aN
	QzDJcZMK0FaLiGmPKOGQIey4JjYE44bP4kfXL2zNoSlI2z6w7R5PJQlRm0sxVLzU2Q==
X-Gm-Gg: ASbGncvzvHJBJPlNG+6N/2nuyCacCr01vjFVzXbHLgjn/Q4q6NdJmcm1/BesqQlqyO2
	C5hSc6rq0xE4pk6PyszavHqrHRn0Uvpw4Q+KtddzaooguThyvcxMQWVxO9WugoYv1js47GgDFI8
	Pmq0Yc24fgURG0XxLAYAJOUbZWJdvGGJlmiatnE9zAnwQroktDxZDsPzIRQAbAvtNy0LPpmd5iI
	V/ivMDTpQHC8eF6Bbx8BhD6mmcL7Nai78RIbQB476p/YobzUVMAqbqMX6JBRoo/bdJdQpaGOKk0
	KP7EFRcGTLw+KeloSYcJfdl28E3g0wFcwCqOtqHg/WpHiLmihgi4xJO9hrHRXffDbJmnsjOhgrF
	dv+/yXpE0N4kvm1ryIWgw43v/NmEyUVmvdJ4dfQYBsxiQU3+kJqsrnzXKVOeuPPPucxmzDjwpBk
	pZjy9WObQ=
X-Google-Smtp-Source: AGHT+IFPVPaXJ8llYkYrHORYDKW7Arpurjky2MYtIlDIM90qRru5U4jUVPE9P1WAQbAUnNrsiG0cIQ==
X-Received: by 2002:a05:6000:2407:b0:3b6:b020:9956 with SMTP id ffacd0b85a97d-3b768f076f1mr1898738f8f.43.1753267177756;
        Wed, 23 Jul 2025 03:39:37 -0700 (PDT)
Message-ID: <132788fb-4b92-4672-8944-77557204f923@suse.com>
Date: Wed, 23 Jul 2025 12:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <20250718101149.3107110-2-grygorii_strashko@epam.com>
 <fd215aae-fd68-4ea6-bc67-33e908ef6c7c@suse.com>
 <8b600c93-b8cc-4828-9a20-90b9245da026@epam.com>
 <e1bc92c2-1a07-4c91-90ee-162cdb879ad6@suse.com>
 <58809e96-d02d-419c-ad31-62665fc6be7b@epam.com>
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
In-Reply-To: <58809e96-d02d-419c-ad31-62665fc6be7b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 12:37, Grygorii Strashko wrote:
> On 18.07.25 17:18, Jan Beulich wrote:
>> On 18.07.2025 13:47, Grygorii Strashko wrote:
>>> On 18.07.25 13:22, Jan Beulich wrote:
>>>> On 18.07.2025 12:11, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> Hence all common PIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
>>>>> arch callbacks become unreachable, so drop them.
>>>>>
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>>    xen/arch/arm/irq.c | 29 -----------------------------
>>>>>    1 file changed, 29 deletions(-)
>>>>
>>>> Can this really be a separate change? That is, aren't we going to have transient
>>>> Misra violations (for Arm only) between the two changes?
>>>
>>> The violation exist even before this series, and applies to arm/ppc/riscv actually
>>>
>>> alloc_pirq_struct - unreachable
>>> pirq_guest_bind - unreachable
>>> pirq_guest_unbind - unreachable
>>> pirq_set_affinity - "reachable" at least from compiler point of view.
>>>
>>> Would you like to have cumulative, cross-arch change to drop above arch callbacks and
>>> squash it in previous patch?
>>
>> If the issue is pre-existing, then it doesn't need squashing and the order
>> isn't important. But it would indeed be desirable to have the cleanup done
>> across the board.
> 
> I can create clean-up patches for all affected arches.
> 
> What's you opinion on how to proceed:
> - re-send this series with additional patches
> - wait for patch 1 and then send arch specific clean-up series
> ?

Largely up to you, I would say. I was actually about to commit patch 1, when
I noticed that it's still lacking a scheduler maintainer ack.

Jan

