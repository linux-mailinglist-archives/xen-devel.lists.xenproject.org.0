Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC436AF90EC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 12:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033308.1406758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXdya-00073g-No; Fri, 04 Jul 2025 10:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033308.1406758; Fri, 04 Jul 2025 10:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXdya-00072F-KI; Fri, 04 Jul 2025 10:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1033308;
 Fri, 04 Jul 2025 10:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXdyZ-000729-6F
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 10:49:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ec6f7c8-58c4-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 12:49:01 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so398677f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 03:49:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359d1a7sm1960596b3a.11.2025.07.04.03.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 03:49:00 -0700 (PDT)
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
X-Inumbo-ID: 7ec6f7c8-58c4-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751626141; x=1752230941; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ardJONfqHzhOBhaWRBllrAEe6PkRlGypdB/E3Ty3B6g=;
        b=EaXb0Y3hw9xppTe2mdgu7837/ba9O+3BrznC7XAlT3gg/qfcCC2rqCV2+71PL4rLdw
         89u7JRRDaEWbCLo7XZ2DLRwYqiGwhVxgGmSCxeEZSxjfA9zGu1sjFbDYMGZDsOpoNIPi
         zyTAYfhLdZvD+heTprQHZ10Pu7OTVRRkoP1zelJpo7xU8zAEjQNYBb8T81XA01MOr+3T
         tCRpnfr6eMhz5rADxbvNciQKW0vItNYh1q+4pXfS/qY31MynR6pF2w0AtFEvmQo38cpw
         2w8q4iA1GvW94BbjRUUasIEfV+iQ0fyjb17gFHCd4OFauOF/fgjOjFGx52PLXG154lsJ
         K6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626141; x=1752230941;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ardJONfqHzhOBhaWRBllrAEe6PkRlGypdB/E3Ty3B6g=;
        b=gGEZFvO6+GGloq82+XG9emok9gpieoGIfb0ihQeBl9/ODdjgGwKB+24VWu1BtJtw70
         UBrRN6RumHM/O04a9+s7F+31EzNxFL2dKN2corBn8Kwiar6ctaJE8rM862NwBfCtUFfr
         D0sCBp2fSlqh7sl+F+lNVzHtwRvPkyRQpNhzl33veFBXOfXVmI5EaZ/JtRIDLFuxqypG
         Rf7XwCWDShS4Lz/Dhq2bBdmPuG50w25TkuMgZvVzk19u+0iZbIQUkl52nWwPLZMfx0a4
         vy+GbEqI+wBCoPKp8wyPcImPmkjQBy+OmctQ0ZT6DD9VJWjkve97FgBhyZYB1veDu6zq
         OCbw==
X-Forwarded-Encrypted: i=1; AJvYcCWmdoPQV1oGQbuIr8y3hV8+lrNOseQXT513ZVny0UKE2v8X5f95pVuUsWaj8EcHLTY5Sud4ccJae1o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5BFKlECNPoG4KRi0Xaxg3d4VJWJpC2XUqT+OtMF0dtJ3Avqhx
	gDGzVDHUDuprtu5OQs9fJFyPzyoptk0OzyYkZvXFTK1CTUAxGf3Xbl1T9GY/ILzMDA==
X-Gm-Gg: ASbGncs6FtWbJhAtVGYHsDofeU/PnV5imfDsfMD1QHG0YyMF2NCLuhiqFKV+bNIN47C
	pgi0UYhs4+ZnnMPcAoHzoaZ9yMet91441QlDzNBMY7MouSHanrQgqsn5xPepokyLKH8Ya84J+1V
	m456sRJL6uFdaVQjq4uinikmVvw/sniiPncgFK1CMz0KEd7e1gfwztudpGTmZsUwZzgR3B3gCst
	Fr0vIfG1M7+iW67gBw9FxKUY+oeMBHFguH5LYS8edQJB+URrpU7HlnMQQC6qaB8j/eTwaXAXD8V
	+GY8ygXaYCl1FG9YUElX0V1O92G4vFJGGE3WAi1n5ZO0a8KAhCaXxBrt254zwmE3SqpVlUqj13d
	rGk58Mql/w82O1PJMQGco4f8CjMv4qZxweW97nD6lGiWgE1M=
X-Google-Smtp-Source: AGHT+IHKh7zIXiMf98fHheEQ06B/lBL888A8W7B+abKxdJVs4WBbJZv6G+ujLGMYfNvNQYiIv6zexw==
X-Received: by 2002:a5d:64c9:0:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3b4964dbdd5mr1739911f8f.38.1751626140579;
        Fri, 04 Jul 2025 03:49:00 -0700 (PDT)
Message-ID: <65b5f767-5ed3-4a7d-a471-4e3f07a354e7@suse.com>
Date: Fri, 4 Jul 2025 12:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/flask: estimate max sidtable size
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250630085559.554334-1-Sergiy_Kibrik@epam.com>
 <d562251a-a6ec-4e2f-b1f7-dd87a97d4005@suse.com>
 <71ca3126-d311-4ed2-8d6d-3ffcb90a222e@epam.com>
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
In-Reply-To: <71ca3126-d311-4ed2-8d6d-3ffcb90a222e@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 12:10, Sergiy Kibrik wrote:
> 01.07.25 13:42, Jan Beulich:
>> On 30.06.2025 10:55, Sergiy Kibrik wrote:
>>> @@ -54,4 +54,7 @@ $(obj)/policy.bin: FORCE
>>>   	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
>>>   	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
>>>   
>>> +$(obj)/%/se_limits.h: $(obj)/policy.bin
>>> +	$(srcdir)/policy/mkselim.sh $^ $@
>>
>> Hmm, that's using the built-in policy, isn't it? What if later another
>> policy is loaded? Wouldn't it be possible to have ...
>>
>>> --- a/xen/xsm/flask/ss/sidtab.c
>>> +++ b/xen/xsm/flask/ss/sidtab.c
>>> @@ -13,6 +13,7 @@
>>>   #include "flask.h"
>>>   #include "security.h"
>>>   #include "sidtab.h"
>>> +#include "se_limits.h"
>>>   
>>>   #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
>>>   
>>> @@ -228,7 +229,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
>>>           if ( sid )
>>>               goto unlock_out;
>>>           /* No SID exists for the context.  Allocate a new one. */
>>> -        if ( s->next_sid == UINT_MAX || s->shutdown )
>>> +        if ( s->next_sid == SEPOL_SID_LIMIT || s->shutdown )
>>
>> ... more than this many SIDs? What if CONFIG_XSM_FLASK_POLICY isn't even set?
>>
> 
> It's using a policy from tools/flask/policy, yes. But not a built-in 
> policy, just reusing a bit of code from that code. The idea is that we 
> can have CONFIG_XSM_FLASK_POLICY option disabled yet still be able to 
> calculate SEPOL_SID_LIMIT.
> 
> As for loading another policy at runtime -- the calculated 
> SEPOL_SID_LIMIT=384 for current master flask policy is still pretty big 
> limit. From what I can see -- much less No. contexts are being used on a 
> running system, because most of calculated combinations of 
> user/role/type are not really usable (e.g. contexts with xen_t or 
> xenboot_t types and user_1 user are not expected etc). So there should 
> be enough room even for more complex custom policies.

But still there could be odd ones. Imo such a static limit can then only be
introduced via Kconfig option.

Jan

