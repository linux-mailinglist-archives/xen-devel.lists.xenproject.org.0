Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA7EBC1C40
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 16:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138935.1474515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68m7-0006au-7f; Tue, 07 Oct 2025 14:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138935.1474515; Tue, 07 Oct 2025 14:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v68m7-0006YC-4B; Tue, 07 Oct 2025 14:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1138935;
 Tue, 07 Oct 2025 14:34:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v68m5-0006Y4-M2
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 14:34:45 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c45be293-a38a-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 16:34:44 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-62fb48315ddso11223730a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 07:34:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4fd7112dd8sm144886166b.30.2025.10.07.07.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:34:43 -0700 (PDT)
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
X-Inumbo-ID: c45be293-a38a-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759847684; x=1760452484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YRUj0TBKzX2J3jkotI77AWt91ZVy9bJjzMsr0saeuwk=;
        b=TYxAMKPCuGjRMoN6BWGo8oylIeg57ltp22FdobAW/NGSZHlr8L3CM0L7Sypdpp5n12
         OruWODYRU63Vn/pbk7Vo2FYLWsvW8vj3KhvHuuZimN8a0CJAFuFv9YDXH94vAa3PLS7H
         hkm3VppSEYRddZ5zy4SVBkK5GhQ0ma9WMdjEtWdnCip+s+e+iDfm9DQIv0jCKypW8NM4
         Q14ge1rxQaTydlZNRIAhhoqDahCE8Gj8pcsujFif+0tGp9VlERn173Tuqp5sQOTfmEFq
         u13Rth2NOHCdTrCrlFBfCqh5PvFsI1PgAakH1fWJqDbb0AE9o0+4HBsefRcBsy48p3th
         1kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759847684; x=1760452484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRUj0TBKzX2J3jkotI77AWt91ZVy9bJjzMsr0saeuwk=;
        b=MAEUPfkgiM+cTabKBr44X6J8KeepYCeGDU3UqyNgu052imTU5GNcVUH7fiUX33kIrr
         0mv2gYUG5UxcPYVovkNgqbqg98YBC7vTYkmpkTGpXM23WMSCk9LFrwJL3wi7TgVaVJhF
         0tUzr8IrX/q+gg10Ue9AU/SfFI7vIRQEUK/VLFDProF0BsjpDJXt9UmMdl6uOAeJRXhW
         P10HxvQSIDK+b/xamV9q0NjgcRRTMJFFFXtsNsaznvo+vH7cX35Gr01agbn3qAk6eeSo
         TF+U25S3m5MI+2hInHFw1XnTufNRi/NYscIdNZJa26wdvDym4S9y2eCUb35+Z+8TTYb7
         i1Rw==
X-Gm-Message-State: AOJu0YxFxTuqjW9uSEJuBJEhgprqhv9YEplStCYKTurk8XWFJuDMXpTc
	CLkweh09AmgNjdzZQHeNFkn6/FntDlm8NVK+JpgDO5JW7Kz6D8F7cXiMQDUc6az6Rg==
X-Gm-Gg: ASbGncud2qmGN3VXYTxZ703rpLFsSijXoPeq+zAnXT4LLEGMpnHMTSsp2Iu+MRL8zxK
	GnjC8ZquETm/MWLaXcPeU3vUAMGR/yF2CTFQipdbv28MsuuoIYJdwTXV7WKljY6AVahDgwTm8aQ
	j/XXiLWTX0qf16VpnEatV5wNnKWAJzEl1gPyXp60jgA9mlyQV65u6nej9Wjs+qDJg3sbU5dOFo+
	YmEHOOOXraC4aCVl7vLJ18fKkl/VXw8RjytDQkPCnfTfVGfvzUL80nE7ZF5jwzoyusN+p9HAusv
	Wj7l86WVtQ22n+l4mcjTdk5aKlUnf5dKi4kkUz9IvKCrONSNo/rieH9cOV4OrE8dWyliD6FZNFL
	e4IvYDh/WlRYoPOulGQVORpOBZKvY+lkRoHUgl8zSmwW4ayJ57nx7Hwm9RBSJLtdprWtZqAtPdT
	0MrYPABFC13JNFHkAEA9XRSDFU1AzL83c=
X-Google-Smtp-Source: AGHT+IHP8TFjRvDuBcw675Rhk7iC7voVFgfcouuF5Y9EBscXZdCcjS6ZVkXtMaFAxoPdDUptQFqPMg==
X-Received: by 2002:a17:907:1c90:b0:b41:1657:2b1d with SMTP id a640c23a62f3a-b49c3936312mr1940467766b.50.1759847683848;
        Tue, 07 Oct 2025 07:34:43 -0700 (PDT)
Message-ID: <50e77f5c-ec6a-4e90-a13e-66717dcc6a41@suse.com>
Date: Tue, 7 Oct 2025 16:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.21.0-rc1
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20251006200840.2171113-1-andrew.cooper3@citrix.com>
 <20251006200840.2171113-3-andrew.cooper3@citrix.com>
 <aOS5O2h767J1QPxs@Mac.lan> <dab0d59a-4a72-454d-aa3d-3bebe9caf146@citrix.com>
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
In-Reply-To: <dab0d59a-4a72-454d-aa3d-3bebe9caf146@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.10.2025 10:28, Andrew Cooper wrote:
> On 07/10/2025 7:54 am, Roger Pau Monné wrote:
>> On Mon, Oct 06, 2025 at 09:08:40PM +0100, Andrew Cooper wrote:
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>>  # All other places this is stored (eg. compile.h) should be autogenerated.
>>>  export XEN_VERSION       = 4
>>>  export XEN_SUBVERSION    = 21
>>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>> +export XEN_EXTRAVERSION ?= .0-rc1$(XEN_VENDORVERSION)
>> In previous switches to start cutting RC's we didn't add the 1 to the
>> XEN_EXTRAVERSION, see 19730dbb3fd8078743d5196bd7fc32f3765557ad for
>> example.
> 
> Correct.  That was also buggy and complained about.
> 
>>   If we do add the rc number we need to remember to bump it
>> each time and RC is released.
> 
> Last time we had truly buggy early rc tarballs, the middle ones were
> bodged somewhat (incompletely, and not a straight git archive), and by
> RC5 we had a commit with the correct XEN_EXTRAVERSION to make the
> tarball correct.
> 
> See 4.20.0-rc5

Yet then the question still is whether it is perhaps the tarball making
which is what wants adjusting, to not use "$(MAKE) -C xen xenversion",
but rather go from, say, the tag in git.

Jan

