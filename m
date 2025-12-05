Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FECA7B8F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 14:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179049.1502696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVfD-0008Rw-5F; Fri, 05 Dec 2025 13:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179049.1502696; Fri, 05 Dec 2025 13:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRVfD-0008QJ-2F; Fri, 05 Dec 2025 13:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1179049;
 Fri, 05 Dec 2025 13:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRVfB-0008Bk-HU
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 13:15:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 882507d2-d1dc-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 14:15:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso22590615e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Dec 2025 05:15:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b02e84dsm59391795e9.4.2025.12.05.05.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:15:54 -0800 (PST)
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
X-Inumbo-ID: 882507d2-d1dc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764940555; x=1765545355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TmVkS0mBsvMoV+aSqeWYw2jZmkWE2k0wgkDJpOUd1ug=;
        b=PnDCmXCNUaiHoeHjQGJ/0qyzwBilLIxsT+tLo19IlpgbW7PSZje47A3yTyli98DEQg
         wrHSwrpPg2OUoCX8dlK1Oofm90xLHZGaGbU3f/01bZECQ6hoUbppOVpQPq3/UTwbr/qf
         /Y4jDQHRddbTf/Nx575wjsbnPsQ2Hg9JhPHjKpvQwHa3ZaSfT1iArR6KZLTRB6DSjFrN
         YTAW4upuQDlio+xnZonO6xHUuQkgoxgYsMOhBWdrnEausiNWVJRDz/XSj3SqMbEvS96f
         jhSwfUNL5UcmfgdoyTsgYUsiTmWwIE7Eid595i4QJlH0Abd6DYltQRAj8JhCnzjuiczh
         ACdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940555; x=1765545355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmVkS0mBsvMoV+aSqeWYw2jZmkWE2k0wgkDJpOUd1ug=;
        b=jkeUWjr01O7Aq3XcjIF5ypISCQOrrNiDqhL/Z8hKCW3z7ra2iUNaAGtMAN/LGaYpal
         2wtm+17qh4RRaGkxkbrEv7F0ZyvAcz+OH7IJHmjDqfjXAMKs8F5+CfS1tegI2HVr3PML
         lZKsSmBFcbEN7a8HTUkZ0sr3QTQJXgGMjikUQ8QkbgkfKcnDsCEkCEGriGx9kY3G7TIw
         Q2Db8zOllU3f/mdK8xJen355WaXxaKIRMOGB38KxPBEDIEClNGp1+xHpKqmMdoCwVk3a
         BKqTac6pYJyrhqjjE9J1gHfY0mMhOgNc02zk8iAfdllzc1GTtGGhq3N+A7qisB9V9Mn7
         D7dg==
X-Forwarded-Encrypted: i=1; AJvYcCVISBgQAL8QdFXvsWu2FNHHs0gjiKBzlzXzqabcE1bnBV09GdDbZ6lEj31NWR+IGaETQ71kAjBCNkE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6mxl/u9lO24QEUKgrKy6EctANQrf6Ceiqr/cGrS1x71E9WfCK
	0aluZZwQAJIo34pxDq/6L/7pIkLn42mpWAiqmgZxx1M4JGgZly65YDa7Dr/x1b2zkTzu0OqInvL
	SwSI=
X-Gm-Gg: ASbGncvS1iAEiRJ1ujIy0rfTedF/fLkbThJD+5ApYDik2xV2fMAKkR0cNuwss4UJfs4
	9UL34nG3zdXNpjlf6a9uzOlfi1QTUcNya1xMVihIy82mxTXCgMgzAndw+Uf+Cp7X+BnV5mEtRWi
	pS6e8XxNhsBKjl7ki5vYADRCho0HUax35uSK8DbqheuI+Lx007Ns0yhcGhftujz0ypAhyASFBrk
	tM3Dh+ec50tJ1m7euBgIPZnIJdgRbbJzDPiqk5QBtwvahAVPqLsfTGGEX+ngf+SivlxTNAJc5pL
	t0pl2LeaKdcyoKVVov0dUAXaQZ1X5tbfap6wC4fTOCQK4uAq3sbuJN9x35jBOXP6wASFAnDkU83
	2QAy5yUvxf2g3HUdlGX2bcuM9TdAqDvAWq6FfRddP4m53PJIyl85lk/IXbijKUYgQ1LPirJhgSR
	6HLhBi8hVyK5g72gYgH9NxcH+90creLM9buTCJLWMm1I1eTjoKi7m8PyXLaBbMHkrYue9PojBxy
	oM=
X-Google-Smtp-Source: AGHT+IFkz9z/QNRcOwQnUtlRIid1DqPyfMp6rfrSx+5mJRSEw7auXLA3sq5WuOYZIy3Oovyu3Y9Psg==
X-Received: by 2002:a05:600c:45c6:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4792eb4caf3mr89945195e9.15.1764940555023;
        Fri, 05 Dec 2025 05:15:55 -0800 (PST)
Message-ID: <c4346077-d110-48ef-acf6-343cf9ce87aa@suse.com>
Date: Fri, 5 Dec 2025 14:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
 <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
 <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
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
In-Reply-To: <846afe9d-458f-4ec8-a58e-faf0617707df@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2025 13:40, Andrew Cooper wrote:
> On 05/12/2025 12:01 pm, Andrew Cooper wrote:
>> On 24/11/2025 3:01 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/bug.h
>>> +++ b/xen/arch/x86/include/asm/bug.h
>>> @@ -21,7 +21,7 @@
>>>  
>>>  #ifndef __ASSEMBLY__
>>>  
>>> -#define BUG_INSTR       "ud2"
>>> +#define BUG_INSTR       ".byte 0xd6" /* UDB */
>>>  #define BUG_ASM_CONST   "c"
>>>  
>>>  #else  /* !__ASSEMBLY__ */
>>> @@ -37,7 +37,7 @@
>>>          .error "Invalid BUGFRAME index"
>>>      .endif
>>>  
>>> -    .L\@ud: ud2a
>>> +    .L\@ud: .byte 0xd6 /* UDB */
> 
> P.S. Presumably binutils is going to learn a udb mnemonic at some
> point?  Can we include a version number in the comment?
> 
> I'm trying to organise such comments everywhere so it's less effort to
> figure out when we can drop it in the future.

For them to be useful, wouldn't we need to settle on some canonical form
first? Else how would one locate them (other than by coming across them
by chance)?

Jan

