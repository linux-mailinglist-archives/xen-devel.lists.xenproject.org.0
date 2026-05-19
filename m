Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFoUIS5ODGpIeQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:49:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0857DFFD
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312848.1583012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIwQ-0000nn-9A; Tue, 19 May 2026 11:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312848.1583012; Tue, 19 May 2026 11:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIwQ-0000lr-5i; Tue, 19 May 2026 11:48:54 +0000
Received: by outflank-mailman (input) for mailman id 1312848;
 Tue, 19 May 2026 11:48:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPIwO-0000lf-KV
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:48:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIwO-001v21-00
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:48:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4e20-bab6-0a2a0a5309dd-0a2a4507b1c4-10
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:48:51 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c4e23-229c-0a2a45070019-d1558033f114-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:48:51 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso35861235e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 04:48:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5cab818sm333760075e9.14.2026.05.19.04.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 04:48:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779191331; x=1779796131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6W3n8aTIsPypIm8HYvpHEaTDHRf/e3rY3aHufZK+De8=;
        b=TY/j9R76YR3Yf9KuREEfzlj7V2d3vnmPv00p+xfOvPlb4gB7CF4ssW73Wjl3yYOWR1
         BIJTzr0Y0Jx00g0k2QymyZLrvrJk6yiMwfgQRXG75Hb6hDFzst9Eh3ad7P2bECM31d/U
         HZ6muIaPSUzwCEwx4WYIj5Yzo/aCmfZ795EvU4n1cnOwD8hXXi6gYaW8p7EBfXS9llA5
         kTPYQJa0X4GRrPu4f1e5hNP8Tz4T3T5HCFoRvT9PbHN9o4pUvqHQ9dxtu1OAUaM860UT
         bAq7bmJXBEe2+i6azVhwBHcHNHo6Epj6DC6ai3fm395jqOXJn7MBYCmzWUt9Aqvt/chq
         LPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779191331; x=1779796131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W3n8aTIsPypIm8HYvpHEaTDHRf/e3rY3aHufZK+De8=;
        b=Cja8T2hRVM6LSrgXi6mIlO5Ai1mED/uK7VUJo7c7LI93+nJ1P5Mi0jJZlu+T2dHVBh
         BbWHvDKtObWARMfWz5GeHHPHOuf2WnLADUKB4rW+mqcG+XGC3Q5cVjZZMzWzRlUvED4P
         ntO8Um1wuStcyf7jU0nVDkXOZv2RkdMFQViSk7h+gIVPocAhLfQRFtcyaTNPk06vN7zI
         Swn/x6eb2GV1INEm6gllQQWL1MnzAlkC5VLDv8xCTxyJ38YOmoXPwX3Ud8qn0kJZLdPl
         ik/QuRgLmazqUjqwu+0SEixPK2ooJY79uaBb1PI8wK4b6yVrLA33sK4pA2bECnnNuzP6
         VO6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/1MC+IQvJ1wAVIgcZaJD0LOvh7tqpAryLG0b4uDGtZTpjgbw7zcti8d4aWKHEd/BG9McC92UYk3Lk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz3mzD3l6G72IycVWqFA4ZuHo+6H9ETs2qWqn7glKNp5xy/tFd
	viyZcoMYM0vCwSRjTUhYcAG1iYPiyip/W7mkjUPVP3tEBR+TkIWTc6WgRQlsqwBBKw==
X-Gm-Gg: Acq92OGS5h0vbcnOiMcgQmNDLGd5H3JYxTt1hgDELEvr9zo0vi/cwJREJyoyeFGOKmF
	cXxeplKMbiA8knQMZsLl0jGkb8uC0fxOV3uG58bTK6yWNpC5fA9uioSka4dwWpHVd5OMBSGpjck
	M4GbOgzai3Kc53g7wOkX4U6ftlZNYKDZtcfvDP3cxM25IcGz6v5wcSAccqXRWG1rLtQ1A+MImMW
	39xFjm2+0K45PLeLIKqBgwePwuUb+imLDns/N99JfjSo/v+LaWLq8dKTDzOmRFPHG6YJooTmi0r
	gyGNJ0P/ttpVMPq64Z12816XSuHQycK1OkPyaX0s6FS1+wSjnpf6oPsP5ejSQO/mJQTwxMEMZad
	rM3VrzOVrvqzwf70OSA1C+8s1RzfTW62u09IUy3HV+lt0bANgI417uULQTVzV/8l8MR+ERvm5jh
	GWMhap0cpnphIh1Ki68eSM3B0xzzNYAQyFxH2ftr9/8+od4C9r/6FCnXnvUn08ywXixk5az9AIW
	gZh1jcZs/qDyOA=
X-Received: by 2002:a05:600c:4fc9:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-48fe60e4794mr275877675e9.3.1779191331252;
        Tue, 19 May 2026 04:48:51 -0700 (PDT)
Message-ID: <51bee66a-6b52-4c14-9832-d1a5dae8c221@suse.com>
Date: Tue, 19 May 2026 13:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: fix switch_stack_and_jump()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <1ac102874c8f7190ea09787a035692b03e4b46cf.1779179301.git.oleksii.kurochko@gmail.com>
 <5f8850b7-11db-4d78-8353-6e0580bd397b@suse.com>
 <5c348320-099e-4511-842b-4d352d641c10@gmail.com>
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
In-Reply-To: <5c348320-099e-4511-842b-4d352d641c10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779191331-0B374C48-E5C0CB79/0/0
X-purgate-type: clean
X-purgate-size: 3378
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ECB0857DFFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 12:50, Oleksii Kurochko wrote:
> 
> 
> On 5/19/26 11:28 AM, Jan Beulich wrote:
>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>> The following compilation issue occurs when UBSAN related stuff is enabled:
>>> prelink.o: in function `smp_processor_id':
>>>    /build/xen/./arch/riscv/include/asm/current.h:46:(.init.text+0x274e2):
>>>    relocation truncated to fit: R_RISCV_JAL against `init_done'
>>> make[2]: *** [arch/riscv/Makefile:45: xen-syms] Error 1
>>
>> There's no init_done() as of yet.
> 
> It was found based on downstream version of RISC-V port.
> 
>>
>>> The switch_stack_and_jump macro uses "j " #fn which assembles to
>>> JAL x0, init_done is a RISC-V J-type instruction with only ±1MB range.
>>>
>>> Without UBSAN, .init.text is small enough that init_done (which lives in
>>> .text, not .init.text) is within 1MB of the JAL. With UBSAN enabled, all
>>> the instrumentation calls bloat .init.text well past 1MB, so init_done
>>> is now >1MB away from the JAL. The linker tries to truncate the 20-bit
>>> J-type offset and fails.
>>
>> .init.text is well below 64k right now. Are you telling us that it grows
>> by more than a factor of 16 when UBSAN is enabled? IOW while the change
>> may indeed be needed, I question this explanation. .text growth may matter
>> as well, and e.g. .rodata (living between both sections) might also grow.
> 
> No, it won't grow so much.
> 
> With UBSAN enabled:
> 
> $ objdump -h xen/prelink.o
> 
> xen/prelink.o:     file format elf64-little
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off
>    0 .text         0011c79e  0000000000000000  0000000000000000  00000040
>                    CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>    1 .init.text    000285fe  0000000000000000  0000000000000000  0011c7de
>                    CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
> 
> With UBSAN, .text itself is 0x11c79e ≈ 1.11 MiB — already exceeding the 
> JAL range on its own. Even if .init.text directly followed .text (which 
> it doesn't), a call from .init.text to a symbol near the start of .text 
> would be ~1.11 MiB away. init_done likely sits somewhere specific within 
> .text rather than at its very end, but add the .rodata + .data sections 
> on top and the gap is comfortably past ±1 MiB.
> 
> As a result, the target symbol init_done may end up outside the range 
> supported by the R_RISCV_JAL relocation, which is limited to 
> approximately ±1 MiB.
> 
> Without UBSAN enabled:
> 
> xen/prelink.o:     file format elf64-little
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off
>    0 .text         00044618  0000000000000000  0000000000000000  00000040
>                    CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
>    1 .init.text    00012c72  0000000000000000  0000000000000000  00044658
>                    CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
> 
> Does it make sense now? I can use the text above for commit message 
> instead of what is mentioned now for more accuracy.
> 
> Would it be better to send this patch when this issue will occur in 
> upstream?

Having the change right away is fine, but the description needs to match
what's presently upstream (i.e. mention any non-upstream aspect as such).

Jan

