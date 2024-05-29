Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351698D30D9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 10:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731641.1137266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEWc-0000kO-6c; Wed, 29 May 2024 08:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731641.1137266; Wed, 29 May 2024 08:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCEWc-0000io-3l; Wed, 29 May 2024 08:19:10 +0000
Received: by outflank-mailman (input) for mailman id 731641;
 Wed, 29 May 2024 08:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCEWb-0008Tu-51
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 08:19:09 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e4f7402-1d94-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 10:19:07 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57863a8f4b2so1827896a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 01:19:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a629ecfabfbsm545782266b.178.2024.05.29.01.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 01:19:06 -0700 (PDT)
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
X-Inumbo-ID: 1e4f7402-1d94-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716970747; x=1717575547; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wNjNbYaLsyT5Jwixw5X30ALmJK/jdlxR7zI+m87qCns=;
        b=Q773CwPe8RFSe5fQABnph7NMNIM4pglEoEHrIy+Rlbr5Sk6yAaoWI6RZtiCbKwM7/m
         B40BXMEjwSsXm3Cumf4UKNLk9TSGUa6sHDEPREYUypk334StfAWuh+TLju3sW70XkXZL
         qjNgCZe6HbKak0J1JqMNeqUGohwpmuBUiuD8pdcLMTZ1fIN5ThdeU8/inyCMAkrfZjwy
         BGCuammFhSO57as42+dWvBfynBFu0WSQUb9TdgctivrCIsrsRpg91ZLIU1DY9i+25cTf
         ENpzZ0+3tD1fw3cYeS9IPqYm8kZZwBJDI8sYPrbjkY+zYwB2kQ+tIL6equDmGlEyebkN
         argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970747; x=1717575547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNjNbYaLsyT5Jwixw5X30ALmJK/jdlxR7zI+m87qCns=;
        b=GshR91820P06pVGhrzLIW1r4DB8VJpbt3/acpYcp5niJ/kMR0YQILY3goRYMoev9+V
         8+yPaHwsRglnpyc9RKuoJHM+3XgKYDgpj6rBogG5apO3Es6zs0QuQY/wM6QBwWR5yVqW
         5SGxYvuyjNieG32rV1gA4/U/R55OS2rwMFH5mRtwxkBsNyCoPBfkv5mUBs1VmXT8C7S9
         JkC8Efha5CtB+V6Zpz0ZQ908MBJ8mhZk26/33WbosAzezGCrJiSjZ/rQ2eqbgeN64tWS
         IzT21B4lTJZtpWzL/z9NJ97YKBqnX5qzYUILKnldbD6WmiUK5Gg78XlzWiWvPbkImP1I
         yX4g==
X-Forwarded-Encrypted: i=1; AJvYcCXAv0IkoKv2cd44+v3lI3iF++XOtdwXNFaWuLpUyxJMVfQdef2typj9x0EL+W6l32H+o6J0sZ5nFzdSNVBvW3G8JpQUTPUOvQQYlTxOFr4=
X-Gm-Message-State: AOJu0Yyc3lpddP0GlVb1UcgkTiwBZ94Rh1OLkX1mVQCsTREhq6xg199I
	sv835ZkkSaaVWWc8Jo9xYZRCLKThqSWnuuFPLo4nn/1t3B03LmIxjWzRfVbM1Q==
X-Google-Smtp-Source: AGHT+IHoSb/Y+bhFzOWre+Eg2rYo0Jgk5qRFk95FWLV4po2FB51JRnNHZcgSVim0z68MvXkyMFLWnQ==
X-Received: by 2002:a17:906:140d:b0:a63:15c1:4334 with SMTP id a640c23a62f3a-a6315c144a4mr450190966b.26.1716970746756;
        Wed, 29 May 2024 01:19:06 -0700 (PDT)
Message-ID: <495de773-bbd6-4a05-b6a4-e00cda301a96@suse.com>
Date: Wed, 29 May 2024 10:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Updated Xen 4.19 schedule
To: "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
References: <e9514fa9fc0a0ea9eae2f0c4accf9b3060e95f9e.camel@gmail.com>
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
In-Reply-To: <e9514fa9fc0a0ea9eae2f0c4accf9b3060e95f9e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 10:03, Oleksii K. wrote:
> Hello everyone,
> 
> I would like to announce that I have decided to update the Xen 4.19
> schedule due to the extended feature freeze period and the upcoming Xen
> Summit next week.
> 
> I propose the following updates:
>    Code Freeze: from May 31 to June 7

This is almost fully the week of the summit. With ...

>    Hard Code Freeze: from June 21 to June 28

... this, did you perhaps mean May 31 to June 20 there?

>    Final commits: from July 5 to July 12

Somewhat similarly, what's between June 28 and July 5?

Jan

>    Release: July 17
> The release date is shifted, but it still remains in July, which seems
> acceptable to me.
> 
> One more thing:
> No release ack is needed before Rc1. Please commit bug fixes at will.
> 
> Have a nice day.
> 
> Best regards,
> Oleksii


