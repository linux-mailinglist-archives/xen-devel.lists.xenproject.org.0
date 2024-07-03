Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFB925492
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 09:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752742.1160965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuLi-0000fc-DX; Wed, 03 Jul 2024 07:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752742.1160965; Wed, 03 Jul 2024 07:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuLi-0000dE-AN; Wed, 03 Jul 2024 07:24:18 +0000
Received: by outflank-mailman (input) for mailman id 752742;
 Wed, 03 Jul 2024 07:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOuLh-0000d8-9l
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 07:24:17 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4107571f-390d-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 09:24:16 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso54808131fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 00:24:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708044adb16sm10036432b3a.171.2024.07.03.00.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 00:24:14 -0700 (PDT)
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
X-Inumbo-ID: 4107571f-390d-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719991455; x=1720596255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap6akTOkQuOKPK8gR7bTK+B4Jw1qtcFu2IqYB2NX1uI=;
        b=bOh33N8J2T0dFbmu025MvHwojLfHnjSX4NPg5z+EB5HuUYM72DafnzW51HAkxcZCPL
         fMLULRUtYtTMDpBhOW5al/MVOgiZAcWrv7VBGFeEgnhvrnrwfbWDzXXbGwifY2Otwf7w
         /oWwQqir7DoXRpruLORj0XSrfWmzAOScXTwQG4Rd8mQ5XjwDIRfkchsWSyAx1YgAuvPk
         pB/jVjKTztSk9dLUKI/gkDVziGtZ4BQHsd08ZtYCuquSqfuy5m9wstYQtBclTO6iDPwp
         Hbt/p0/N/iLbXjg6lV/rmcly4rq87Gy3OxgdZElR3+LpZUoPC+TEskEU8WHlTLiwdtt9
         aY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719991455; x=1720596255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap6akTOkQuOKPK8gR7bTK+B4Jw1qtcFu2IqYB2NX1uI=;
        b=N0vAMGD4Kr5BORG3rz0B9HFcTNxLPcqR5560JrUttdCStiJxgJplGFJJMnoLewT7mG
         R3f1TrwSQdumL8ougLP3cP4jGJoEG86nMOz1XqWJCwqyHr/P5Syxe38z0lHFfKxh0UEc
         Lsde0KvhgrzjmtI/N0HtxMdV70awEfKCS3EyxDhzd0qMMZ+qMokCJkx43PG8hau4qnbT
         5oam/ibsk65aAfQgK0WNM4delmzBvBaF8IOPrfuJojk4IYa/329WawSON2FOQhzHaqcD
         UCnQueXiCpIKKZer+ELBdfSeE6/0XPoxdx9wUEAqoSmXqXPTuG7a2DYTXlFjTX5cjDSY
         gq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMqnxZlBl1kFGpIOkfAVkY8xKbSHHQU0e7X5gFgDosHetGJcyXYTF9B5pK0piLaDalk9xEBTOLiSxtALg6blcfOoP3G0matMeezia7exs=
X-Gm-Message-State: AOJu0Yzq3cbIKYckBbOp1e70QivdOF/Pz+qugb1OQZj+faXsgooxCyat
	VgPcpD9rVgS+yvoq1srKXBHIporYh0skoabmM6tgihOMfgUaJ7BUpYWJxzUGOg==
X-Google-Smtp-Source: AGHT+IF59u4vPzgixtBiTZ2CtdI4vwzjybd8UGJ38TVD2aFaIrLxyLwysNPVVX/7NKlKpzrvpuWUyA==
X-Received: by 2002:a2e:bc88:0:b0:2ee:6b86:b0aa with SMTP id 38308e7fff4ca-2ee6b86b2c6mr61380081fa.17.1719991454491;
        Wed, 03 Jul 2024 00:24:14 -0700 (PDT)
Message-ID: <630de29e-e350-47ee-b451-5312befde5ce@suse.com>
Date: Wed, 3 Jul 2024 09:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/9] xen: introduce generic non-atomic test_*bit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
 <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2024 13:01, Oleksii Kurochko wrote:
> The following generic functions were introduced:
> * test_bit
> * generic__test_and_set_bit
> * generic__test_and_clear_bit
> * generic__test_and_change_bit
> 
> These functions and macros can be useful for architectures
> that don't have corresponding arch-specific instructions.
> 
> Also, the patch introduces the following generics which are
> used by the functions mentioned above:
> * BITOP_BITS_PER_WORD
> * BITOP_MASK
> * BITOP_WORD
> * BITOP_TYPE
> 
> The following approach was chosen for generic*() and arch*() bit
> operation functions:
> If the bit operation function that is going to be generic starts
> with the prefix "__", then the corresponding generic/arch function
> will also contain the "__" prefix. For example:
>  * test_bit() will be defined using arch_test_bit() and
>    generic_test_bit().
>  * __test_and_set_bit() will be defined using
>    arch__test_and_set_bit() and generic__test_and_set_bit().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V14:
>  - Nothing changed. Only Rebase.
> ---
> Changes in V13:
>  - add Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V12:
>  - revert change of moving the definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h.
>    ( a separate patch will be provided to put BITS_PER_BYTE to proper place )

Oleksii - seeing that this wasn't actually done (as noticed by Michal), my
intention would be to adjust the patch while committing. Please let me know
shortly if there is anything I'm overlooking, possibly implying the intended
adjustment shouldn't be done (and further suggesting that the revision log
then is wrong and/or incomplete). As indicated, I'll need another reply of
yours here (and for subsequent patches; maybe simply the entire series)
anyway, as a release-ack is still missing.

Andrew - this is going to be the last time I ask that you please come forward
with any concrete objections to this or any other patch in the series, if
indeed there were any. Without you doing so, I'm going to commit this series
(or the parts thereof that are properly ready) as soon as a release ack has
arrived, but - to allow a little bit of time - no earlier than tomorrow
morning. That'll be on the basis that so far possible objections of yours are
purely hearsay; you never voiced any on the list, and even on Matrix it was
only along the lines of "there is something".

Jan

