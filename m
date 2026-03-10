Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCwhN4ZDsGlLhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:15:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBFC2546A1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250289.1547755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzjM-00077t-Pu; Tue, 10 Mar 2026 16:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250289.1547755; Tue, 10 Mar 2026 16:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzjM-00075F-NB; Tue, 10 Mar 2026 16:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1250289;
 Tue, 10 Mar 2026 16:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzzjL-000759-8J
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:14:47 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d026b3d-1c9c-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 17:14:39 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso9525843f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 09:14:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dada9116sm34495246f8f.14.2026.03.10.09.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 09:14:38 -0700 (PDT)
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
X-Inumbo-ID: 3d026b3d-1c9c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773159278; x=1773764078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xtI+z3R8YsFXQL9uSgC7sP0cd+QLnw4JPhISRguRJyc=;
        b=Nlhnb8TtX2FboJx/TTAa09bLRhnTjSOo7kSqxYf2HF7asJT+V/OEeTl2DueTVCl/Zt
         iMloZ8LdswePQYk9K43WyHXcNA9P/j8CmqjhokGTsHMqLnRLqCUPf1Q4HmO23D/vY37B
         amX9ilVNlhMj7OTeoFhXoEnY1j4M/bYimbx6vAPRW8AsjdY72n9F3lMUI8RS3s4iCNE2
         sn1OCR3OGtYpOy9AGqNYEBzJEAVC6AZrr9HGvd8GEYr1AT1G6lAU+Ym69nfIQuVSbA3Y
         +j+HiIQS6StVWEI07XSiZ+Tf6+TYqygYvcxwQ7DCHmMaFYvLCwAdasmt/CkILeK/GLak
         SFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773159278; x=1773764078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtI+z3R8YsFXQL9uSgC7sP0cd+QLnw4JPhISRguRJyc=;
        b=lbUmWjwz54SsjW4BfmG84efQo7cahM9O5KAzSfhHdky6jxmUrMe1B78SKpIVXhHMgT
         bP6xChsgh3YArhQmWf6Yk6oFBNVzyq68+BrtJ+LshBFfhRCXs96VKXGU+8PYux521RjM
         +uz9K/eyUPVKd4QWLFHkRSzpPXLSp8xZTxWjBwxit+74OBh7fCYnf4F9lt9MUua4t9fN
         DKNM0upF2dqk2Y3aOWVDtCwmPyjJ3QeM5im4gd8d7CYA1cOzgopV2FbIjrNdhIvt8xzm
         ZdUHWLiDIU8d78rJU/5FUCAMasQMxgLexLGbb3sdLT+WUlGQ0D6T83bHhxgENLTg+FqL
         QLpA==
X-Forwarded-Encrypted: i=1; AJvYcCU5fcieNf3rBIEEcwbP3SB0GL9s/yA7Sb0sSwXCkHlYMK0oXIZIJ830js7yEqQLxHpROgSdhyxIQ70=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7tq5Sut9qqDRObhlEpxa200qSWubLS2c1Dqv6vSoLzN3wiR+z
	xhq6IJXtRyYk2k2CXd5hZpl4PK7juRUJf0VveCPx9RKCtpJaddjz7IRU7bJaIXPOHg==
X-Gm-Gg: ATEYQzw0inbWydp8/Wj4qx9FbKp6MNMXQAo7N0SKy/oC81WudTMh1SS0S3LVMh0bQE2
	wqvT67h+YUjITJFsvLhD5bW7+YXT8IKiYjmKJx3PAfzOl1UykzxUcdrwe9ZUIphdjXQXMwKaM5m
	6Ul5Fz9HKD5WINHTEjOFtS7aRHtNV7c+oHPQI/Zx0YquGmC0U5ou40mmrl3808xTH0HCRTE4b6V
	/zfNgwh4rODQHVv2pF4Y/ZFJEO33LMRP0whmqkl68BFMf/54V5RqWFL/vsy4aWQ4++atNcEZlV1
	zt5TWGrPMKv0wngRubymRfh4wK4lPzJGG/kcKwg0AHZvcYSWtsedzKGyEXqqITwXZ+Ry7jXI5Oh
	O7gJWqnHFkNm/XE7aWTlNsLGPyJjpmqpvzKOODmOPU+OFGcubVl3uJePDHxFzUEijnPLzuj//OK
	aE1yJz4ZX2NVw5I5qDWsiasjdIHmz2pEnutyiFXbMC1MnuvoZFTiL0hnNFfBItRV5njdh5YkkY+
	r0j9S+zg+KE+YQ=
X-Received: by 2002:a05:6000:2888:b0:439:afea:aff2 with SMTP id ffacd0b85a97d-439da337f97mr27539193f8f.23.1773159278406;
        Tue, 10 Mar 2026 09:14:38 -0700 (PDT)
Message-ID: <45b66d43-07ad-4acc-bb0a-f311fef0261d@suse.com>
Date: Tue, 10 Mar 2026 17:14:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <3201951150104f17593e16c7ba00ada51ac1e10f.1772814110.git.oleksii.kurochko@gmail.com>
 <2de7f459-00b3-4968-aaa2-9067cb0c4aa4@suse.com>
 <5d15bc9b-ead9-4690-b5cd-3b63d83537b6@gmail.com>
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
In-Reply-To: <5d15bc9b-ead9-4690-b5cd-3b63d83537b6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2BBFC2546A1
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 17:00, Oleksii Kurochko wrote:
> On 3/10/26 9:11 AM, Jan Beulich wrote:
>> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/domain.c
>>> +++ b/xen/arch/riscv/domain.c
>>> @@ -2,9 +2,66 @@
>>>   
>>>   #include <xen/init.h>
>>>   #include <xen/mm.h>
>>> +#include <xen/sections.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/vmap.h>
>>>   
>>> +#include <asm/cpufeature.h>
>>> +#include <asm/csr.h>
>>> +
>>> +struct csr_masks {
>>> +    register_t hedeleg;
>>> +    register_t henvcfg;
>>> +    register_t hideleg;
>>> +    register_t hstateen0;
>>> +
>>> +    struct {
>>> +        register_t hstateen0;
>>> +    } ro_one;
>>> +};
>>> +
>>> +static struct csr_masks __ro_after_init csr_masks;
>>> +
>>> +#define HEDELEG_AVAIL_MASK ULONG_MAX
>>> +#define HIDELEG_AVAIL_MASK ULONG_MAX
>>> +#define HENVCFG_AVAIL_MASK _UL(0xE0000003000000FF)
>>> +#define HSTATEEN0_AVAIL_MASK _UL(0xDE00000000000007)
>> It's not quite clear to me what AVAIL in here is to signal.
> 
> It signal that these bits are potentially available for s/w to be set.
> If you want to suggest the better naming and can change that in the
> follow-up patch.

I'd either omit the infix altogether ("avail" after all often means
"available for software use"), or use "valid" or (less desirable)
"defined".

>>   It's also not
>> quite clear to me why you would use _UL() in #define-s sitting in a C file
>> (and hence not possibly being used in assembly code; even for asm() I'd
>> expect constants to be properly passed in as C operands).
> 
> I thought it is always be good to use _UL() for such type of constants as
> ULONG_MAX also uses UL, but not in form of _UL() macros. If it would be
> better to drop, I can do that in follow-up patch.

The suffixes want to be there, at the very least for Misra's sake. But
you can just write 0xabcdUL, there's no need to involve a macro there.
That's only needed when the appending of the suffix needs to be
conditional upon is being C or assembler code that includes a header.

Jan

