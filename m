Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969DAD2F43
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 09:53:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010554.1388678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtmJ-0001vV-MY; Tue, 10 Jun 2025 07:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010554.1388678; Tue, 10 Jun 2025 07:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtmJ-0001su-Ja; Tue, 10 Jun 2025 07:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1010554;
 Tue, 10 Jun 2025 07:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOtmH-0001so-LO
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 07:52:13 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc30dc15-45cf-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 09:52:03 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so30888125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 00:52:10 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e155ce7sm130848755e9.10.2025.06.10.00.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:52:09 -0700 (PDT)
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
X-Inumbo-ID: cc30dc15-45cf-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749541929; x=1750146729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KY/jOI8qYpQJ+ZeafdeIyn8phetCCWvIhpbSGUsnip8=;
        b=KRDnMRshFHVIkuO9zVbeCHT/UrLfKxDe8Yb+YgUcdANdNGa/+VtLMWFjdVvqLRzI7w
         g8lJAQFXNbrwceIAoTW5J4Yeo3WzkzlP/7E3eLVwbgvA55NLwr4+hs0lUJN2Yfh2n4Tm
         +iSyOvDrioxKwCQRCYiz1qwPY2JH1EiV/YjH6SZjFGG5RLJVGLb3JjXJpTKTiHsmb926
         +FSQG+uiCaH9ypSO9dmwBEVIdzV6UYNrRQEUVyqwmmdr2k/twcxwAMbdUyqcW/AnQghU
         zNF/Tt9pl3k8A0BJxfmZc91jR1KvOdH/g8lFt3B+XW6pnWx/EtccKd4DQMjQztqlLx2k
         PbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541929; x=1750146729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY/jOI8qYpQJ+ZeafdeIyn8phetCCWvIhpbSGUsnip8=;
        b=sAukoR184K3TbcPaacSQV1xgn/JAc+F5gTZphiqd74NiphpsaQBhw1mktqzdBDvB+5
         gUI17rlXZCzqGz+ZUgqI/61cLztc5HutPwLmVjWb6PHXuntAoF9AooXVuVCgmeSTpTlM
         cWE10RzoR7zIE7cZkLxVzu5BoyFlX5+DzLcuv/2pA9fz0ipyF+eTZbSbS/94y+oRPFiG
         b3NuaNc5cqF2/UiyXo5guJiQAltPnehH92lj0lt1scF0WfU3/QM4QCn2bq3LmVmAhmgg
         ebwmqzmvKlyznU44HcBNKY4ACMon7xoyjpP5tvKDxJaYKktaTmjf28yVOwpt4EfCa2bS
         gsDw==
X-Gm-Message-State: AOJu0YwAZPplqSUD8zmYPLaaSwMj9Tc2EIrQP69jdb8rnTNUjkLsJ/yl
	4nXIWG9Y+8mxacgiPRfpzd1npSopR9KHwZ3YrWhKlyZ+quz+NGTxnH8LU32FOdL9sA==
X-Gm-Gg: ASbGncsP3pPYB8L9PZEv8N4frj8+8k6ZSraJIXoFOIgoRrblaUajGI7Eb34tFzBPnoF
	a54rzUm+5Mn5Tc5Xp6juYYZzUSE8AtED+1dZkJO0w92M5Wt0Cz0SuVCGl21SYZtTWiyKoUuy/r8
	5JtahmBcwhG0JhxVmuTMWaYoiRiVXdPLrT7napbAQYcwoo3taIG+NeT2j4izOaMgcYb8h0QuRFM
	IMYF+NYWTfQM5yVtmHUkoOEzhMN2fwml7ltJ0zabqt88w9kLxHRbIx3LBRaxq89cn8uMR/DNfVr
	lpm92rEKQ+3ARKqeSX4SaNBq7ufnO/FrTz2T8uSMB0eHS34gI057KQ6V2azhGF2CpVMjm0aQlHw
	nMhXK/a12iHp7FOTfGmhjSzkX3sGNwy7UIXqD1un8//d/lezoPkHLMOwiam0564kuVBZobVR5qH
	7EP3MaYGnVrCYrXYUcQNgpy8HKyRCyQ2o=
X-Google-Smtp-Source: AGHT+IEBvhmq6OLscxvxgZhDTcta1KkQd0Yh9W3dpRnzVaFg0PYi+8esUxhmPV9bTlryNb4o9YIoFQ==
X-Received: by 2002:a05:600c:1d1c:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-4531dde6bc9mr13579025e9.4.1749541929571;
        Tue, 10 Jun 2025 00:52:09 -0700 (PDT)
Message-ID: <cb408883-c6c7-4cd3-819c-0e5978086dd2@suse.com>
Date: Tue, 10 Jun 2025 09:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] console: add relocation hook
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
 <4f1889dc03ec4aa2cc0cd2bd14523a2c6f670bdb.1748182535.git-series.marmarek@invisiblethingslab.com>
 <0b17da9c-57db-4a8b-90af-e53e45cb1243@citrix.com> <aDSLNeFRZWoxMTEt@mail-itl>
 <66cfdee6-5dc2-4139-8550-ef441fa7a7a0@suse.com> <aEGu6-6dGqc_WUlg@mail-itl>
 <ea285192-c39c-43b4-a879-7ca4ff7f9b4a@suse.com> <aEHBAsLFvZni1_5Y@mail-itl>
 <83c22da9-62c5-4fb2-bc2d-f34ad5956d3e@suse.com> <aEMPMa0-1XwlbsPM@mail-itl>
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
In-Reply-To: <aEMPMa0-1XwlbsPM@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.06.2025 17:54, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 06, 2025 at 08:26:33AM +0200, Jan Beulich wrote:
>> On 05.06.2025 18:08, Marek Marczykowski-Górecki wrote:
>>> On Thu, Jun 05, 2025 at 06:05:02PM +0200, Jan Beulich wrote:
>>>> On 05.06.2025 16:51, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Jun 05, 2025 at 04:42:53PM +0200, Jan Beulich wrote:
>>>>>> Why is it that this ring is dependent upon Xen's position? If the ring was
>>>>>> dynamically allocated, it wouldn't change position when Xen is moved.
>>>>>
>>>>> The console is setup quite early, I don't think I can allocate memory at
>>>>> this stage, no?
>>>>
>>>> But you allocate before Xen is moved, I suppose.
>>>
>>> Well, I have those buffers in BSS exactly to avoid the need to allocate
>>> them (or rather: have bootloader allocate them for me).
>>
>> Yet them remaining in .bss is now getting in the way. Imo moving them to
>> .init.* and adding proper allocation is going to be easier than the hook-
>> ary you are proposing.
> 
> So, when would you propose to allocate them? Wouldn't that be yet
> another hook?

Exactly one, yes. Given Andrew's earlier reply my understanding was that to
get things correct in your proposed model would end up requiring more than
one. However, the point in time where move_xen() is called is still too
early to allocate memory a (somewhat) normal way - even the boot allocator
gets seeded only later. So I guess console_init_preirq() may need to inform
its caller how much memory is going to be needed later on (and what address
constraints there are, if any). Then a suitable chunk would need setting
aside kind of like it's done for kexec. That address would then need to be
passed into the new hook.

Jan

