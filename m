Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKBWLstJ1mkFDQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:27:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232DB3BC06D
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 14:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275979.1561634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAS0S-0006Sr-2l; Wed, 08 Apr 2026 12:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275979.1561634; Wed, 08 Apr 2026 12:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAS0R-0006RP-VW; Wed, 08 Apr 2026 12:27:39 +0000
Received: by outflank-mailman (input) for mailman id 1275979;
 Wed, 08 Apr 2026 12:27:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAS0Q-0006P0-7h
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:27:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAS0P-005uX6-Fw
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:27:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d649ac-2eae-0a2a0a5409dd-0a2a45049042-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:27:37 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d649b9-bb33-0a2a45040019-d1558035e112-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:27:37 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso42082445e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:27:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5dc5fefsm24317405e9.7.2026.04.08.05.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:27:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1775651257; x=1776256057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=767zxZHIRCtWhGXH/ZDZCM7Lq38tBtrWOZdavbv1gw0=;
        b=Vo3kbHgQX/KE88juydFadGchoiI1lpe2upOIlBfOWv0z/u1f990toxsoSz4KaKUJ3V
         cuykDQnXA6MSdOPeL+WJRWtXDwpmGMW7nQlwvfCoysKSTZ4Rv/922wR3XXs91klDdQI7
         dQJKuhLfc9+0+KIWJopY3umcnlgqghMXjIUyvbJNd423nOihdn2zO9VQhov1T5u8gkyg
         zN5PxhGsPqgOUX+5OWDhc5vOXOGE1kB0rXvST00aVlMItr8jFCPRKS0e3k3naG4FUQqP
         H/5jVMcEqR20shxQPWn/zZF6nKt58zBvmKo0sJ3P+eR6eSFVNtYiGMhYBp9Hh9whZyqJ
         FYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651257; x=1776256057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=767zxZHIRCtWhGXH/ZDZCM7Lq38tBtrWOZdavbv1gw0=;
        b=OGVPXA33iCL5wXgDokkPyHyTtPURZFlQMzamgR+6Rqygo+Dx1OyflPQfYAxr/RBwAR
         mbaTlbJgYVcVKcQMn3ZK8gsGlMADZFt15blnyxefDiJxVLOwPKXHp248iyTmrcPT7LHV
         izfiCKJmk8K9wLgdbI0lmAkL0liPUhBoOJU1bVnwpUM7RC7ZUTe5LJiyHeGhg6vaidJt
         D3fuM6Jz1pjPk1JnMs4bFGF2sGYaho3lKISGbSdLcP3hCSiU822CfH12j5QdcxeOZSzw
         SjmGoGmuTrM60fZsQjEFQM3ZldTIXUhgANVB6dho7l3GcaGVJZtGt49UfVPkACSFJ99c
         pyyg==
X-Forwarded-Encrypted: i=1; AJvYcCVeoNJfuhQtp90XZUvAfZeAXWPhtaf/x2OmQv+88X4DiM6GYw/KNpEMFeugHKJwnNBlQULuoeZYZMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyNmnc7lVwJeCfZtsOa06MFRHQTw3+A+t3vNEeMioVrozTtL0S
	l44wWdeQDmvv7b57eR8yXU7p5JAJcJ+3aJ/7CxUXUIqEgYFGTL/lv1gi7MYte58KVA==
X-Gm-Gg: AeBDieu5lVN0sfjdg1JwftNfyVN7Cw3NeqNizkSDIK/EDG01qbuw9HIHc5CSxqGkNQD
	AfrZV8n68c8bjproNRpIYCeMqP9Ek+ZIS/jpyuIy/XDsDCrzRjciCylf9puCpS686CLsSj5kRKV
	M62MOTJc8K1uvF0Jm+1M6PlDcdLDce2k0DWAOHA4N6E4Cb8lST1Uu83JMMhws1sJ5rBcKaadq7M
	yENrfUf2uGbq2iK423J/k6dv/fO6zyOlCpxFVKlhrFvOzfY5ot6EyxqVO3zsrOg58eXWHk8WSLv
	eoTEhkDHPOz3ZSonIN2iT1+70QqQ+uvZxy/vZ7ixn/S79eVgNR9w354actk5T69AsPTp5ftOg/Q
	jCJ9B+ICXelTS4DxlMx5Ix2izSw6JiQ/kwG1q/Qhy8PZvK0LzmvMc+vpuM9UzV7g+jVzIe6+7bx
	9yqmOYFhesZykCv70Cn8R2YPJJbruSlR7bEz8cI3dpTpAmDdy86UH3Kob1m2hLaZdJVIvWKmsn1
	mCN5+N+tW6ISOw=
X-Received: by 2002:a05:600c:1381:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488996a351bmr295447375e9.4.1775651256821;
        Wed, 08 Apr 2026 05:27:36 -0700 (PDT)
Message-ID: <3bd1b2a8-475d-411a-bbe0-61b251079558@suse.com>
Date: Wed, 8 Apr 2026 14:27:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] Kconfig: Make cpu hotplug configurable
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <f3c523ef5b94e930902016d69b440032c9e6c3bd.1774871881.git.mykyta_poturai@epam.com>
 <e37330f7-96ca-41a9-81b1-14d7f3947dd6@suse.com>
 <00a42bdd-8d9b-4828-b789-8d6163c0314c@epam.com>
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
In-Reply-To: <00a42bdd-8d9b-4828-b789-8d6163c0314c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775651257-3132C51B-8C895C61/0/0
X-purgate-type: clean
X-purgate-size: 1999
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,epam.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 232DB3BC06D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 14:21, Mykyta Poturai wrote:
> On 3/30/26 15:19, Jan Beulich wrote:
>> On 30.03.2026 13:59, Mykyta Poturai wrote:
>>> For the purposes of certification, we want as little code as possible to
>>> be unconditionally compiled in. Make CPU hotplug and SMT operations
>>> configurable to ease the process. This will also help with introducing
>>> CPU hotplug on Arm, where it needs to be configurable.
>>>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>
>> Looks largely okay from a technical pov; one nit and one (repeated) remark
>> below.
>>
>>> --- a/xen/arch/x86/sysctl.c
>>> +++ b/xen/arch/x86/sysctl.c
>>> @@ -53,6 +53,11 @@ static long cf_check smt_up_down_helper(void *data)
>>>       unsigned int cpu, sibling_mask = boot_cpu_data.x86_num_siblings - 1;
>>>       int ret = 0;
>>>   
>>> +    if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        return -EOPNOTSUPP;
>>> +    }
>>>       opt_smt = up;
>>
>> Another blank line above this one perhaps?
>>
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -637,6 +637,14 @@ config SYSTEM_SUSPEND
>>>   
>>>   	  If unsure, say N.
>>>   
>>> +config CPU_HOTPLUG
>>> +	bool "CPU online/offline support"
>>> +	depends on X86
>>> +	default y
>>> +	help
>>> +	  Enable support for bringing CPUs online and offline at runtime. On
>>> +	  X86 this is required for disabling SMT.
>>
>> The name of this option may need input from others; I'm not quite convinced
>> that this is a good name, as there's no true "hot-plugging" involved here.
>> IOW I fear the present name is misleading.
> 
> My first idea was "CONFIG_RUNTIME_CPU_CONTROL" I can switch back to it.

I could live with that, for at least not being misleading. CPU_ONLINE or
CPU_ONLINE_OFFLINE might be another option, possibly better suited to
later become a dependency (select) of a true CPU_HOTPLUG. As said, input
from others may be helpful.

Jan

