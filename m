Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA1ACE981
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 07:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006231.1385420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN3Za-0002XU-D5; Thu, 05 Jun 2025 05:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006231.1385420; Thu, 05 Jun 2025 05:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN3Za-0002VG-92; Thu, 05 Jun 2025 05:55:30 +0000
Received: by outflank-mailman (input) for mailman id 1006231;
 Thu, 05 Jun 2025 05:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN3ZY-0002VA-SZ
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 05:55:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abcbfced-41d1-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 07:55:23 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a366843fa6so292201f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 22:55:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe9639csm12504925b3a.17.2025.06.04.22.55.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 22:55:22 -0700 (PDT)
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
X-Inumbo-ID: abcbfced-41d1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749102923; x=1749707723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4v2PFWgrpkN9/X6bYuWG9tQ8K+a6jECdX4qVTa/Ndjk=;
        b=G8f4QtYZvDZbjkKzF0on4HE77vA5GEAD48+y7ZL7ZeHaN7jLMbzTG7wAtFS4It1XXP
         09sJTnN+wfm1vmeN33WqnzgbBocg8puFdNdgtw3RAQl8I553eb2LC8wyB1oDWxyAuk2h
         icylwT7IFa2TFdCIDg/Cz5Sd1K/Bkq35UPVav1IookuUZ/gRuJ/GqJnZMyl1orUGaLLl
         5rOf89TYd5CLJhULCBsjycNeToCf51ro5d0IgnrcPMwHh6CHwdVwoNragbAVYf/CYuTl
         VwZjyqvcJeVT54vYuADccgJaWOS/xFnyvCaE+IlTmCLVJVyeAwJugByiBHGGlqQQh1hA
         V9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749102923; x=1749707723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v2PFWgrpkN9/X6bYuWG9tQ8K+a6jECdX4qVTa/Ndjk=;
        b=Zr5pBZiE/PZAm1keE7uZjahBkTFOM8vV+EfTxu/C3Qv08C0pCpbLcXF/Pm/3+nBvyL
         nWl5ZSZbzsIg2TbDFgcOGax6u7lAB9nAmi5YQGuf9tZp/XanBdk9lP6+OSVUks/iNbzQ
         aQ9P/RMf5oJpgudFHK8VASQWmZdcPiftRIReZfAC96bxAYfmXJF/f4rHJ9fMfhRPRxPl
         sV1hatXqgdYdwtLes0D0VdGk++ZBAjOjSwZwW/GhRD/sh8+enFouYEspNSruvPOJX34C
         M4D1JUQttbq9GE0QSqOZq/RcEkXMTFwcyevFhdP+ZmbXKW+Esr1rgkEgbSVXHU3yg8DU
         z2/g==
X-Forwarded-Encrypted: i=1; AJvYcCWkmBXdQuHzH/eEaHi2JGLcH+pN8uALTtLEWNKhqCLAbyt/bdkV5l+wjVQhm/Z2P3tFOOfkgitJWQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmmRSYJOzj103adoXAhPz2J68ffsGJLZwGQs+GRDioWIs3iDNm
	4EJUTKNrgnU8efYtMDMq4X8JyGbrLsk0y+Fh/V/crjfcaVn0uim4Q7hJV2D6aAL/KA==
X-Gm-Gg: ASbGncsVii7BC76mAMuJ/CNXceMbeWgCNzu/g+/BQzJJYDZU8/k6YcFplx7gIvjVuOl
	qYHs3KZncezoTBEnhXuPKklXVhcWklQ8fGmDW/kA8m+PmoXmDpPmYk4vj9zpxnDW2tcYUSeEmtN
	sZpagJCLJPONpRz06/1lbKpGOB6bU5QBLhIUyFXDDtTf5dt8Zig18Yrw+xd02sCOJqZuXMK7X9e
	Z51L/myvfbIdG2MddHALCR/5Z2OWSE+HCGk993CRslvbIyUQ6k8D5K0yK9WRzjl15mMQCyR/xeD
	qNN7II8zbk2/AwVzIiazwGa/VikJdpgQmiZC0FeqQoRWpqlw14mj2JMJEhjGEZ1L/KZCJkJVLfN
	unvLt7/9dykWGgpAhso6dpMuPidLw+BHG4lDb
X-Google-Smtp-Source: AGHT+IExBX3PDnWv73qdy8MeSxoX+0zw92+HcCpsQKWY/+MQfdqKpSQ4ejrjy18MeEriilHeO/mtew==
X-Received: by 2002:a05:6000:1a87:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a51d9306d8mr3935384f8f.22.1749102922788;
        Wed, 04 Jun 2025 22:55:22 -0700 (PDT)
Message-ID: <8cb2ec09-d806-4ee8-8e49-188f278ff2a4@suse.com>
Date: Thu, 5 Jun 2025 07:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Process pending softirqs while dumping VMC[SB]s
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Aidan Allen <aidan.allen1@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250604130253.2805053-1-andrew.cooper3@citrix.com>
 <b212dffb-0efa-48e4-9899-104db4754446@suse.com>
 <7c3f7bb0-b7b9-4909-8d8b-d412498aea59@citrix.com>
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
In-Reply-To: <7c3f7bb0-b7b9-4909-8d8b-d412498aea59@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.06.2025 17:20, Andrew Cooper wrote:
> On 04/06/2025 4:15 pm, Jan Beulich wrote:
>> On 04.06.2025 15:02, Andrew Cooper wrote:
>>> @@ -246,6 +248,8 @@ static void cf_check vmcb_dump(unsigned char ch)
>>>              }
>>>              printk("\tVCPU %d\n", v->vcpu_id);
>>>              svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
>>> +
>>> +            process_pending_softirqs();
>> It's only an RCU read lock we're holding here, but it still feels somewhat
>> odd to do this with any kind of lock held. Then again (I didn't even
>> consider this upon earlier insertions of such into keyhandler functions)
>> we may even be holding a real lock (the sysctl one) when getting here, yet
>> apparently that was deemed fine in the past. Plus dump_domains() does the
>> same as what we end up with here ...
> 
> The debug keys are debug functionality, and do play rather fast and loose.
> 
> While the Xen watchdog does hit first (5s), spending too long does cause
> problems for the vCPU that's interrupted (usually soft lockup).
> 
> I was wondering if we should force schedule to idle before running most
> keyhandlers.  That prevents holding a vCPU hostage (and if it's hard
> pinned, then tough luck).

We already invoke a tasklet in most situations, the main exception being
invocation via sysctl afaict.

> We would want a way of blocking further sysctl-debug-key's while one is
> pending.

That's guaranteed already by the sysctl lock, isn't it? Or did you mean
blocking sysctl ones while a non-sysctl one is in progress? (Along the
lines of what you say in the first sentence of your reply, right now we
simply assume responsible use by the host admin here.)

Jan

