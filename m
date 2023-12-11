Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC980D475
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652458.1018312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkPj-0006xP-Ml; Mon, 11 Dec 2023 17:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652458.1018312; Mon, 11 Dec 2023 17:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkPj-0006va-KF; Mon, 11 Dec 2023 17:49:55 +0000
Received: by outflank-mailman (input) for mailman id 652458;
 Mon, 11 Dec 2023 17:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCkPh-0006vU-Pp
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:49:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd95fcd-984d-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 18:49:52 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-334b2ffaa3eso4304771f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 09:49:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e17-20020adf9bd1000000b003334992c578sm9119941wrc.10.2023.12.11.09.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 09:49:51 -0800 (PST)
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
X-Inumbo-ID: afd95fcd-984d-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702316992; x=1702921792; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkUttsOpW4IqN80kv8DGkUH4EeyJefkMnW2lAw/C8lU=;
        b=MZGtAEml0HOIevV71Sm2cn8KNejlq9CPhYR0Yvwrn1ikO0HzxDJoGEEuGOE2d8Is4n
         M9d7FjebKvjLhhZC37igAPbL1JRWX/vgmKivwZRlfNEfMP14QMlc3LeTtfoTFbAlUKeC
         aTzh20wRQ3QvhVGTAgApn23CTncKWlBLqw2FD2pmusew9jduV8+v+AhbMfQlczE+HyiZ
         mwis0jSouTJlonKtj8EuT+Gb3D37XO/GnZCeb8/M9n896Wdsn4apB81qDVB9AmdoUgp4
         cXr0Xu5Gu6u1T5TI6rXAZ0ylIo/peGxJ8Ptsz75mEla4kdS6LXso90mUXcSSynTrITfM
         z2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316992; x=1702921792;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkUttsOpW4IqN80kv8DGkUH4EeyJefkMnW2lAw/C8lU=;
        b=UgFytOAC4mmF7Vsh2KF1ViB9kSWy1HeacBMYAVGGWMTPnWmgKB+i1fI+wXFdjcENtq
         DOLMtC6k+m1sAGmJfalg3FCvzIqu0Gf9dfz1lFUQpS26eueU7N2Bwt6uj9SSZ5MkF6Eg
         0DURXHpRuW01RRxVMJrmkc3XXCoEiHFkK38T1aOfuHc3ojkAj5cCaTMkrg53cg1IScqz
         vmhaa/X233DZZbh3a7BS8GgrOAGOQpNuP3yIV9GIitPS2vM3gGI/fsF3o3EC/ynKG3OT
         LWzmuLzvdAl5EyOMF6GXf6WbxXtrou9rfzq+BEHM/20Ll4vt49UzzH8vVoUQ7Jbtovcn
         goTQ==
X-Gm-Message-State: AOJu0YyhD3y340DsxpHY5fSF1ctex4i/WAQFypjA7qBqvI6qOQIKcB0u
	mpY/MJa5r/HC9fWd/z7ufz7x
X-Google-Smtp-Source: AGHT+IGjOpM6TNpnmlzjxcnqE6qw9hRKdYDtL0Auze3x5k/UkR/XXmy7STwdw02mbHz9XLaDR9tlVQ==
X-Received: by 2002:a5d:534d:0:b0:320:8e6:b0cf with SMTP id t13-20020a5d534d000000b0032008e6b0cfmr2338360wrv.42.1702316991851;
        Mon, 11 Dec 2023 09:49:51 -0800 (PST)
Message-ID: <6592eb30-a8eb-423b-81ae-89acccc4e751@suse.com>
Date: Mon, 11 Dec 2023 18:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
 <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
 <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
 <ed29735f-2d2e-4b29-b5d1-efa78480acd6@suse.com>
 <bad7c686af22aef9124891f5610976687452e784.camel@gmail.com>
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
In-Reply-To: <bad7c686af22aef9124891f5610976687452e784.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2023 18:37, Oleksii wrote:
> On Mon, 2023-12-11 at 17:02 +0100, Jan Beulich wrote:
>>  In which case the approach taken here may be fine, but
>> it still wouldn't be what I suggested. It may then be Stefano or
>> Andrew
>> who you could consider for such a tag.
> I'm a bit confused again. In this case, it seems that both you andStefano or Andrew should be on the suggested list.
> You proposed the approach with "#ifdef CONFIG_GRANT_TABLE #include
> <asm/grant_table.h> #endif".

But you're not meaning to use that approach anymore, are you?

Jan

> Stefano and Andrew suggested how to disable CONFIG_GRANT_TABLE for the
> config.
> 
> Could you please clarify where my understanding is incorrect?
> 
> ~ Oleksii


