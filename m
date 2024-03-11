Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03D877D8B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691353.1077255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcTy-0001IG-8A; Mon, 11 Mar 2024 10:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691353.1077255; Mon, 11 Mar 2024 10:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcTy-0001Fv-4y; Mon, 11 Mar 2024 10:02:10 +0000
Received: by outflank-mailman (input) for mailman id 691353;
 Mon, 11 Mar 2024 10:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjcTw-0001Fn-Jk
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:02:08 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b6466cb-df8e-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 11:02:07 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so348614966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:02:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fx3-20020a170906b74300b00a4380e85e5csm2694420ejb.202.2024.03.11.03.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 03:02:06 -0700 (PDT)
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
X-Inumbo-ID: 6b6466cb-df8e-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710151327; x=1710756127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbg+vF7i72557q4DEOv0RK5/78u1N0LCfCUG3/X9Hlc=;
        b=Hohm33CR08NIau6PTuyM2DeJkXsZ6IZPQS3hLeclxMUbdbsTqrZERDqtKXRcGjMzgS
         44q8+fG62GMsw5gRauWA9UGjrOtDQcYonX8KK2/XOX46zOxMZ/5xvXrKmKNIFyw6gpmV
         MbZiAJLpqFTRB9gok2O7gUyHtFIX3BGi9u/F/iKKRyGOi97wfsjUM3geHy+a1NB7h1Kj
         N9pw0tuNjvBWSM2qA1NIbArADZIB+oCGZVe1ZyTj80KUGkg7b/G7JmXxhe8Ur1QXkxnl
         zi0fACYI2TEn8QqrKUFofBh9cqeEQpMT1wBlN/e3CiY5/B8Ysofak9JnmT0GMAPaMDrh
         qQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151327; x=1710756127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbg+vF7i72557q4DEOv0RK5/78u1N0LCfCUG3/X9Hlc=;
        b=vbBnOQWYEy0S7kLhUGdwpul/rEd/TsbT3dBldpR1k6SlixmehUSOITjc43OEjEEPDF
         5CjryyH+3Um75OLHqc6WAUHux0MWrByyPUtZRDLNxB1mZd8gtvt7BtUC34y9OluoRcWi
         FNkpgRtaKR9JQ9jc+wOttXQKXovZS0hpR/vZvT1TTds4lYrkCVgAVR0zdQ7r5fNKPV5k
         vBJvo9c5Eo0jtgWZcAh4G7FREaEbKK9XbPNVYogG2g0s7c9qM/Fz6geJ8rKd2+Jv/ejQ
         UQ1aVOCNLliBbGk3V0OuvC/qzN+RrVCLCKT039EhlXwnYF/abox37F7gasYczFTQRn3Q
         oKrA==
X-Forwarded-Encrypted: i=1; AJvYcCUom+7YHp/C+gD61frXkumfVoI+WfoiavAybVAoOc2cMJdxh/DUOyfCrQ0JZThQsS92l6s9dDim4fhtyEuwkm1LKb49Mn2IOQY1sBjazfk=
X-Gm-Message-State: AOJu0YyFD6fVkYxUGOCCirgslvH7GLAqvZCPRySE4M+zp1XFADDzxXF9
	VhGggkMDwM/hah3AGnlWki6qIcIj90M5OS3kPagQCTyUTUjG5I2p/ryKNLWDefSIWMcMx9T8U9E
	=
X-Google-Smtp-Source: AGHT+IEeDrQduDtSQsmtJ852fLDutA1VfLEa0Kl36lYhEk1p6XjIVPeUNxvtTMkoRRIwBn8mYqE2Ug==
X-Received: by 2002:a17:906:6897:b0:a45:a2cc:eb8b with SMTP id n23-20020a170906689700b00a45a2cceb8bmr3445154ejr.13.1710151327159;
        Mon, 11 Mar 2024 03:02:07 -0700 (PDT)
Message-ID: <def59c84-13e6-4175-ae5d-e0ba7770f68e@suse.com>
Date: Mon, 11 Mar 2024 11:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 01/16] misra: add deviation for headers that
 explicitly avoid guards
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <310fe4a0ccd0ad45bcf1cd9811ac56c9a560dd0b.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <310fe4a0ccd0ad45bcf1cd9811ac56c9a560dd0b.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> Some headers, under specific circumstances (documented in a comment at
> the beginning of the file), explicitly avoid inclusion guards: the caller
> is responsible for including them correctly.
> 
> These files are not supposed to comply with Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of a header
> file being included more than once"
> 
> This patch adds deviation cooments for headers that avoid guards.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v3:
> - fix inconsistent deviation ID
> - change comment-based deviation text
> Changes in v2:
> - use the format introduced with doc/misra/safe.json instead of
>   a generic text-based deviation
> ---
>  docs/misra/safe.json                        | 9 +++++++++
>  xen/include/public/arch-x86/cpufeatureset.h | 1 +
>  xen/include/public/errno.h                  | 1 +
>  3 files changed, 11 insertions(+)

I understand something wants doing, but having such comments appear in public
headers feels wrong to me. I'm afraid I have no good alternative suggestion.

Jan

