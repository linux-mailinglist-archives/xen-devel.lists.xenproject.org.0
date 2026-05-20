Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE90Mb9UDWr9wAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:29:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3E358823E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313571.1583694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaQQ-0000Kp-Kg; Wed, 20 May 2026 06:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313571.1583694; Wed, 20 May 2026 06:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaQQ-0000JD-HE; Wed, 20 May 2026 06:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1313571;
 Wed, 20 May 2026 06:29:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPaQP-0000J7-D8
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 06:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPaQO-002k04-I9
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:29:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d54a7-5cb7-0a2a0a5109dd-0a2a450b964e-14
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:29:00 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d54ac-212f-0a2a450b0019-d155dd32b16b-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:29:00 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-448528f4e69so2969407f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:29:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c885d5sm343097975e9.5.2026.05.19.23.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 23:28:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1779258540; x=1779863340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ngzefi0PIDnQzGnnI8oUeHXDHAmckTXHl7nx3hjBqf0=;
        b=Ybj/prP/iD7VDoJBkHC3BpK0AHPbydTlfrk9pch+L4QDdSPAqQOMIopf2UdtbMkt0d
         VftZLE8BI5wEBcVJgZYJvjVC4fycHPUDlNeQbYnP/jDXiyt0r8YsJ09RvTgTL+pqjpo8
         CydEfBOvZZY61u9XVji+1hnSyUGsBBCaj9lCInbPpxCogoEigcY+UsmYALpVAm/Jg28L
         MIlNs34rS7BRUAhdibN+/vwU7n1XeI1vOHsuX/B2I+Zud3Iw4Pdei0F6B/zt0SZpk1Da
         +J5O90CnvseoZh6V6ryUg9rAfo9ojfpOUMDBJ4ceKUefMzAfinabltBF6MN9yr/SInzL
         ZnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779258540; x=1779863340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ngzefi0PIDnQzGnnI8oUeHXDHAmckTXHl7nx3hjBqf0=;
        b=QFjHNCsAtRVcnq/Y1o3Eb3CK47/0ZmEGgcUcwTV10kC2rO5GHvn028p1xbpa90Q1J8
         pGRjppr4yLtZtmaULGTSMaosUDoQoi6FxsY7rXloM8Q0DIirGUoseFpNoHbDvibM9Qzs
         Z6nyshNH7xQoBi5ynnHSKVkZ/DtvKc8wAp/9oYOQkKUHifQUqSeVzzgkgzQNdFhkC5DP
         40DdqpQQdY+YG+cQkTkbilihUdNDIXqoP1nTtu3oPDJrMhmnqAOUsO7FXAsYEsb+GyFt
         lILkx+KEdggN4u8vmLqAJyt3i5hWdvIEt/XGfwhvT8+RsDFVEgyf82S98kSgFX5Tuznb
         c3rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wbSfvxlrFk3qSQuXYr7nb/eNOHfAfK2yp42D+PH99Xr8noGSEiEWrPlJLuCiV+TxvRO8VQF/JwZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSB0XxEP91TdNY0evmZNYHUFqQW9VBOMhtv0RuCrRB8nQTCiPC
	qWjim9ShoETmSALNm0DCLaGagsojPTbOi+wx9qKriRvWHD8nbbsmpEvK5X4FIny6ig==
X-Gm-Gg: Acq92OFa/coqm2rbJijmBXVNrK0CZrGwm0VnMymDX0ihy0dZq2mMN5dsG/p5LTaiUiZ
	/Nj5HDk+Wx8rN0QECAEVbCAvBIXEhftqrNkphvLzph61mhZWGOxAvj4aX+D2VKL7HFfwslwJfak
	qLHrA3e2sWs5NDoIgHTiGBGnqDHWedPebpa7CM/bqL8CnzU9PdGABakW5RsYOsJPeeGDdDGB8Ln
	m49s6lUiZGJ9X9TbvP4BSeGrBtxXSiLwQonQCSFY6jE6dJLA5pvCcOdctfviGg5t8wjCx9wCfts
	vmqlGTuHVqmDeh7bECg3sq1CC62r4o5sSRZdHsHwUjOBckmW5aDFpwHzQh7QYuG6gVIonE/8Mwa
	DZgpWiM1gQir9qkyEPkRARj5YwSOZz7bvjQ6bSGzQ2PCJi5zFq69iVQlHrNADT5siLu83b+qS1V
	4j5BSzWwxn+lmIBRTXq+1VqE2xeo+/sBGkM4/dreWJlFsm5PuYynl6rf7RKq/y0hgLFmEypr2LM
	V8knn2znhHV8fILkPSXWOXy8w==
X-Received: by 2002:a05:600c:34cd:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48fe61f2c03mr382547225e9.21.1779258539915;
        Tue, 19 May 2026 23:28:59 -0700 (PDT)
Message-ID: <d636c3f9-6faf-4fb0-8b72-617f70dc1ef9@suse.com>
Date: Wed, 20 May 2026 08:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 6/7] x86/svm: Use the emulator path for VMEXIT_HLT
To: Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
 <20260518131404.3716969-7-ross.lagerwall@citrix.com>
 <1779210132.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@vates.tech>
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
In-Reply-To: <1779210132.8631fc262581453bbf619ec5b2062170.19e41301cfd000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779258540-13D7FF3B-0C40AE67/0/0
X-purgate-type: clean
X-purgate-size: 1456
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E3E358823E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 19:02, Teddy Astie wrote:
> Le 18/05/2026 à 15:14, Ross Lagerwall a écrit :
>> @@ -2496,6 +2491,7 @@ void asmlinkage svm_vmexit_handler(void)
>>       vintr_t intr;
>>       bool vcpu_guestmode = false;
>>       struct vlapic *vlapic = vcpu_vlapic(v);
>> +    struct hvm_emulate_ctxt ctxt;
>>   
>>       regs->rax = vmcb->rax;
>>       regs->rip = vmcb->rip;
>> @@ -2840,7 +2836,9 @@ void asmlinkage svm_vmexit_handler(void)
>>       }
>>   
>>       case VMEXIT_HLT:
>> -        svm_vmexit_do_hlt(vmcb, regs);
>> +        hvm_emulate_init_once(&ctxt, NULL, NULL, regs);
>> +        ctxt.insn = INSTR_HLT;
>> +        svm_emulate_one(&ctxt);
>>           break;
> 
> 
> In this case, most of the logic is hidden behind svm_emulate_one(); 
> however, SEV-ES changes some aspects of the VMEXIT_HLT behavior (this is 
> the same for e.g VMEXIT_PAUSE).
> 
> With SEV-ES, we can't access the CPU registers anymore but hlt can still 
> be intercepted (it's a "Automatic Exit (AE)"), in this case, the CPU 
> increases RIP itself (this is documented in SEV-ES section of the APM), 
> and we just have to emulate the HLT behavior. How would that specific 
> behavior fit in this new design ?
> 
> We can skip increasing rip in this specific case, but it's now common code.

I guess we may need to somehow reflect fault vs trap semantics in the
context, for RIP updating to only occur in the former case.

Jan

