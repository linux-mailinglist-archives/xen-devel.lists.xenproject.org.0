Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD583B03824
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042639.1412721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDlZ-0001sn-2i; Mon, 14 Jul 2025 07:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042639.1412721; Mon, 14 Jul 2025 07:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDlZ-0001rO-03; Mon, 14 Jul 2025 07:38:25 +0000
Received: by outflank-mailman (input) for mailman id 1042639;
 Mon, 14 Jul 2025 07:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubDlX-0001r9-J2
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:38:23 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83a508db-6085-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 09:38:20 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2386946f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 00:38:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42abea3sm93276555ad.60.2025.07.14.00.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 00:38:19 -0700 (PDT)
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
X-Inumbo-ID: 83a508db-6085-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752478700; x=1753083500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sth55OGSa8hQ/SlaQnF4dWi2/hkDBWLDg9Ao6ViL6Bg=;
        b=CnWroc6n1kWJuxSFYRC8wWNA6or+kG/qoC7zt2mBJ27gevhvZxzo2FQ5Th086Aq+rn
         lZ23CbAwAxt47c5Kc04xVy4FE8ep6PwuueJ4j5WRTvvm6i8zAHi9DNs4qy+hNRBrKfq4
         Ejn5Pw9y4axadFDJzjlzEda/ok9amBHVAlf7oNx4EDNVtXFBhbXrGZfb3+h3UGjvoWo6
         lqJwPjSZA/D98IHpoBvow/PIi9e7kh31c7yR1vQy2Y/NaFw4Gz7iATN1VCzslewR9r4y
         ojWSP33niaYjdLL4kQ3cCGHfq6IrTipudv+yUZ14FDF+mvfA5U6J+1ZGSK5fkzJDKSKH
         ZqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752478700; x=1753083500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sth55OGSa8hQ/SlaQnF4dWi2/hkDBWLDg9Ao6ViL6Bg=;
        b=VIUMROf7JauOKrhiiHdtg/1euqOSecQWTXrMLywt8m0K/iU/8O2gtXjhmJ5QsyZRu7
         2im21wzPmOMDj45e9BAcrnzepla/Qlnim/llesoktuXAOTFM8z9J1DCBiA+CsnGMKcdx
         fSH2f/VZCm1NEGvwhEqQ8qeZbrvyMgT/UtW3CfqVplfgVoSemx4cuUi6aFgYRfLCkNKK
         kA1q2gXeMy4gY6p5zIjDqwNL7PQIgJmNXQC2nJJxXZ5sPzoJL/6malENa7iIUXNngkAq
         04DKpR4E/0O6WDQNIFGm8lAT4p0z4uLPc04BR/PiVRx0Ds58qshqYwta8oyPm1/GF1UK
         A/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXh5z+//HlEKzXe4fcX7rCyjzVh/JpZsbENaY7xRlznj8GjoiuvKGjAhBYGFC8ZkZohbt4vKGT+j3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzTeQkOC4AmC7hkz8MW1kx9BXXQZtFXZVnzQU1+Q9oNAVe627M
	cwTNXvxb9Grd+aA+S1cBpq0W2tyCQi8jBL3k0G+m0gnX+SCDkGw8SFRE/5JlmYScmg==
X-Gm-Gg: ASbGnctqccsPuJ5OoNXUpBLHy4KUsOAFeS/+FTx2Xn+xI2Cv8wTQaZ86+SS8sUoa5gz
	Ec08vxDYjzb4mdriv7Xi9tb9aa4QnZshfwxB6UxROrD/tYrYV7XPPJ7JzkwJNAMP5xBjBkcppN7
	NJx1D91ptFUtUJxoZFRP1rWDwpzTYtnPwNw+npTeKYqnCKrmPkVYcStVZine6LQtVuB0+Dgwp0L
	o3HtlGsXig87pWQ08unNLsFXxXOvy6Jpzm3lpeaNpsw7e4KRwj+pQDWAhQgdXaN+d/JSrw4MnEP
	T+GJYIemlIBCwwqAZymQganJsL8wXWydNe87UU+xsbRgCULJJghRLAZPisi0CRW71sCQLIJsYA0
	6DbeOxajnyzT3DKsR4S1+kkZ/zas+N2vdv0EWwK8xzhXwD2oRIpqP9LLWt9yKVsihtfsfcSBoGd
	aUfvCoq/8=
X-Google-Smtp-Source: AGHT+IFemPI2z9nHFs6Gq2soZG6GxM5ACoAl/iHd2bKDVziW/lLl1niGIfs5HyX2zfCwZP1oHOkFoQ==
X-Received: by 2002:a5d:64a8:0:b0:3a5:1c71:432a with SMTP id ffacd0b85a97d-3b5f1880597mr8293508f8f.14.1752478699801;
        Mon, 14 Jul 2025 00:38:19 -0700 (PDT)
Message-ID: <3abfdde8-9b1f-462f-9a2d-0f3def792a55@suse.com>
Date: Mon, 14 Jul 2025 09:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/22] x86/boot: add MLE header and Secure Launch entry
 point
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <916c87847457552583f1defb1aced37ea3ff58df.1748611041.git.sergii.dmytruk@3mdeb.com>
 <d9ab3803-c7e0-4a67-93e2-4f32bf9b3ad5@suse.com> <aGxCFFEU9BzLx96O@MjU3Nj>
 <01fe310f-a19a-4392-9215-8942c2bb9b86@suse.com> <aHPyIqo7vnZo6gnc@MjU3Nj>
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
In-Reply-To: <aHPyIqo7vnZo6gnc@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.07.2025 19:51, Sergii Dmytruk wrote:
> On Tue, Jul 08, 2025 at 09:02:55AM +0200, Jan Beulich wrote:
>>>>> +         * - DS, ES, SS, FS and GS are undefined according to TXT SDG, but this
>>>>> +         *   would make it impossible to initialize GDTR, because GDT base must
>>>>> +         *   be relocated in the descriptor, which requires write access that
>>>>> +         *   CS doesn't provide. Instead we have to assume that DS is set by
>>>>> +         *   SINIT ACM as flat 4GB data segment.
>>>>
>>>> Do you really _have to_? At least as plausibly SS might be properly set up,
>>>> while DS might not be.
>>>
>>> "have to" is referring to the fact that making this assumption is forced
>>> on the implementation.
>>
>> But that's not really true. The Xen bits could be changed if needed, e.g. ...
>>
>>>  LGDT instruction uses DS in the code below, hence it's DS.
>>
>> ... these could be made use SS or even CS.
> 
> SS can be used, but is it really any better than DS?  CS can be used for
> LGDT but it won't work for modifying base address because code segments
> are read-only.  Or do you mean that the comment should be made more
> precise?

Exactly. I was specifically referring to you saying "have to". Which is fine
to say when that's actually true.

>>>>> +         * Additional restrictions:
>>>>> +         * - some MSRs are partially cleared, among them IA32_MISC_ENABLE, so
>>>>> +         *   some capabilities might be reported as disabled even if they are
>>>>> +         *   supported by CPU
>>>>> +         * - interrupts (including NMIs and SMIs) are disabled and must be
>>>>> +         *   enabled later
>>>>> +         * - trying to enter real mode results in reset
>>>>> +         * - APs must be brought up by MONITOR or GETSEC[WAKEUP], depending on
>>>>> +         *   which is supported by a given SINIT ACM
>>>>
>>>> I'm curious: How would MONITOR allow to bring up an AP? That's not even a
>>>> memory access.
>>>
>>> See patch #15.  BSP sets up TXT.MLE.JOIN and writes to an address
>>> monitored by APs, this causes APs to become part of dynamic launch by
>>> continuing execution at TXT-specific entry point.  It's more of a
>>> redirection rather than waking up, just another case of bad terminology.
>>
>> Okay, (just ftaod) then my more general request: Please try to be as accurate
>> as possible in comments (and similarly patch descriptions). "must be brought
>> up by" is wording that I interpret to describe the action the "active" party
>> (i.e. the BSP) needs to take. Whereas MONITOR, as you now clarify, is the
>> action the AP needs to take (and then apparently is further required to
>> check for false wakeups).
> 
> I'll try and in particular will correct this comment, but I might still
> miss things due to being used to them.  In general when code is
> developed over the years by several people doing other projects in
> between, things just end up looking weird, so please bear with me.

That I can surely understand. Still my expectation is that when one takes
over code, everything is being looked at carefully. Much like a non-public
review. After all once you submit such work publicly, you will be the one
to "defend" that code, including all of the commentary.

Jan

