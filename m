Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36131AFAEB2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035320.1407562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhHf-0005z4-JC; Mon, 07 Jul 2025 08:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035320.1407562; Mon, 07 Jul 2025 08:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhHf-0005wP-FE; Mon, 07 Jul 2025 08:33:07 +0000
Received: by outflank-mailman (input) for mailman id 1035320;
 Mon, 07 Jul 2025 08:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYhHe-0005wJ-5c
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:33:06 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb83715-5b0c-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 10:33:03 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so1720926f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 01:33:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9ccf871csm11548128a91.24.2025.07.07.01.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:33:02 -0700 (PDT)
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
X-Inumbo-ID: ffb83715-5b0c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751877183; x=1752481983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VRMgTQgW9LGULsx66LJPzWDgjoucbAcL1gXfKvDB8xU=;
        b=UzLvz+2aVqjRVQiYHOUw1TbKXPBpwnFc+FBbWFF230NCvqSSgcjCSsRfSk8GXxzJ9j
         C0gUJUGbmL4U2fFlnXfmmQPHG37KYng6LI20blIG8xHN71Wr408O0Oww/gG7euYTUPWT
         0bFXB6T6SooOanR/6E8M2K2sFEHN0bVZmdk+dhC0cLYKTbvZbRtCRMjgJgUuyB5xYqQp
         UQJA+y1APEntJoLanBuxYcqN2Y4ZOwh/fsvT1nYCemthdYNid5w2WoFYAy1Oi8h3GRlr
         m8WzLTtymy/zARHOsuLCJTkZDd0WpuVpmUUfUAeE8KSqPhncRq3VH06Sc5HkkSlsNizg
         Bfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877183; x=1752481983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRMgTQgW9LGULsx66LJPzWDgjoucbAcL1gXfKvDB8xU=;
        b=iguSVkEuuC3707WY8YLSIyDwXWwVwIkMMFDJBCJm/wqfIRaAnM9J+Q5czxX5IZjBZC
         YQo6ckNASLk31jWuft6qlh3AQoNRQB4e8WQjW/WW6driPVUZjdpSIY08PVDLwn4AKTBO
         3rQdYykmdQbw038LPLKzRNA+glATYLDoiyLY/dIkTBwFSNJA8tLvUcPZLrPZzt+QnFjX
         Tyql102cC4onF4flr4dpowoSKptpgaJGomeMxnCnOMcGPLL6KcTafofphQDXnk+FjIA4
         1oKLdjzuxcNtz4pRiqQ8M6P6dOIGOFsWoiFC2fbA8ibDPG8JVnRV8wJLYmmXJctP3+m0
         O6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXEFGXsPHEv4Ua/CTgHHVanKnj/UGip12sL3neZIgCblkONw+Fb7cFvohe0whFiA9zDqK8N5+BCy7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxucQxBAtNOMyCmlv1UTFDQJOzRorMTTvProN/6n1aG8SGC0rbu
	VQlBZwPza1NN3tWOgDWMu42jGEq+XFPPEWcVQuJjJysHiahWbN4F0V4YglONOCKYRQ==
X-Gm-Gg: ASbGnctbV7C6Sy7BLGZehYXXPpKYkWHOEw+2yeLkf6oao0feM0N2kHhvS4Ed9bLndrI
	sY8ReDs6K50Ka0MqDllZJKn3lwmz0Yy9ZpZgkuwzqYH8/OF73B2zWb7S18X+polTRDkXnSUwTj3
	JNgxbu3/S9E0LlVpBmFtT0Q8mOZQTx9sN9byEJ2Sm2S2yBNWrB0Ayf/fp3XgyF9u4U58ES1bnLz
	iBBsRMgke5lk7ABYsJ6ocAVqO6vrtME5gqMexXaZHMg3FVddxtwqobgdGIVAMklJykdI3kQVAil
	Zbhk9bFdn3ItOOZFnNzWfNnG6AVMHNMYgx2SKslpmwFbh3hwJicAvLA8DxTUMczUsmvdBrqAB7R
	Jb7Xbv0Lr6kPG5t7S4+qxGmaBc1axmpgO9KG7Oy8OxxkHYLk=
X-Google-Smtp-Source: AGHT+IHZhyidD0/eJwMmCqYxpqc+ZMpK1P01BdRhsKSMA9QTjYN4OphH3S78uNzfphqJu+gRKMKVRA==
X-Received: by 2002:a05:6000:26cb:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3b4964edf3amr9244282f8f.55.1751877183095;
        Mon, 07 Jul 2025 01:33:03 -0700 (PDT)
Message-ID: <b6c747f3-ebe2-4d33-80b3-61720cbc9726@suse.com>
Date: Mon, 7 Jul 2025 10:32:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] x86/mtrr: expose functions for pausing caching
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d6e871f055c2456ab194e49bd470eafd04e454e.1748611041.git.sergii.dmytruk@3mdeb.com>
 <edef4d83-25d0-4191-bd7b-c13c38af34bf@suse.com> <aGqzpGfK5arnH-VF@MjU3Nj>
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
In-Reply-To: <aGqzpGfK5arnH-VF@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.07.2025 19:34, Sergii Dmytruk wrote:
> On Wed, Jul 02, 2025 at 04:57:12PM +0200, Jan Beulich wrote:
>>> @@ -440,9 +436,10 @@ static DEFINE_SPINLOCK(set_atomicity_lock);
>>>   * has been called.
>>>   */
>>>
>>> -static bool prepare_set(void)
>>> +struct mtrr_pausing_state mtrr_pause_caching(void)
>>
>> These becoming non-static without being called from anywhere else isn't going to
>> be liked by Misra. Hence the part of static -> extern may need to be deferred
>> until the new user(s) appear(s).
> 
> Sounds like small part needs to be moved into the next patch.
> 
>> Furthermore this returning of a struct by value isn't very nice, and looks to be
>> easy to avoid here.
> 
> Are you suggesting to use an output parameter instead?

Yes.

>  Out of curiosity, what's bad in returning trivial structs by value?

It's generally deemed bad practice from all I know, to a fair degree because of
this then (generally) translating to a hidden function argument. While not
relevant here, this also is a corner case of the respective psABI, which is more
likely to cause interoperability issues.

Jan

