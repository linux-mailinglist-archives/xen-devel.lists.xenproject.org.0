Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIDMCHjejmlSFgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:19:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BF133EB7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230308.1535804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoO4-0002nm-2j; Fri, 13 Feb 2026 08:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230308.1535804; Fri, 13 Feb 2026 08:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoO3-0002lE-WE; Fri, 13 Feb 2026 08:18:52 +0000
Received: by outflank-mailman (input) for mailman id 1230308;
 Fri, 13 Feb 2026 08:18:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqoO2-0002l8-3K
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 08:18:50 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d9fa8bc-08b4-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 09:18:45 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so474964f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 00:18:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5f0sm3837325f8f.11.2026.02.13.00.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 00:18:44 -0800 (PST)
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
X-Inumbo-ID: 9d9fa8bc-08b4-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770970725; x=1771575525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dY3u/9nTRSPA9y4YkZVrlfn9hXNiY6wZRXrr0bZHeLQ=;
        b=O7tJzfwKcYnIytPOwRL2YIczMjvHALACRpk13V+1nEnl+iMKTu1F1J02KQMxBynsMg
         7N79d/Lc0OPVbpQe8rqpEm4eD+EywVYLT2pPgtQjFL8lTEsQvOsusSNnM0t7JdVXwMrK
         Wcswy+8Ik+su/BUYnhdmM3XKU3Y3uWE4S0Q5s50EebjXRlWp3G09O7wgvXKXxRhMJUui
         h9kHcmyHpYX2CvfZ6Dk4Q1FjkzIJR8fYp9kNrdZmxydexs24BPSTIO3vedBYhZW4MuoJ
         yOwUv1ctrtrclJ9ew1lSb7c3wVC3KvTnIG4/E9IlacfVihBS3gbVvyxt0B9ZQBXPsUB5
         b/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970725; x=1771575525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY3u/9nTRSPA9y4YkZVrlfn9hXNiY6wZRXrr0bZHeLQ=;
        b=SR2sq1dKJ1WtEbnnCVtdYfkiFbBNfXVb8UoZDOqTPdniwrGsjjw2FcK0EH9RHsNcas
         sh5OYSeZL+oiJF/p2+3NQ25jycoTcUPNi6WMMZvedaAYQaCxVNTUXcH4x8DL1UKoG9Kt
         EO30BZKeDRce2+f72gXPwm8Zl6M73cKD6MheBGCW6MA35ktiyY/jXKdOSlsEw9XeVtL6
         HrotcId6yaM6uErMuctKdO+LQGN9HZgXuvsAmVW04JbnZ+6kX6cM6S/R5Ap4hv6m3210
         UYEQbWMu+Uh6gsAfuRqjjRu2kAnKIRd2rP6zOAUF25ufq+kBctyb4rGmFhlInpCrrYS5
         mH/w==
X-Forwarded-Encrypted: i=1; AJvYcCWUpHOqv7uGOSvdzYihmmeaTUwSC46QrUCdYutTkvF1Myb5uK/dpfeL9v6A2XzKRTbxWRPGE64+cK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBsFLkUyrhJ8OPG+2RgDX1nWRp+qsUBbk5NboJZwH3o0n2+Re8
	dZrvKXcPgbCzigEUndPqvX6lvuR1sGIu3wI9ucTe9GzCrR3nhfWSVZhHNbUzJOcPXg==
X-Gm-Gg: AZuq6aJI4xyX0MEs62cCLgpDZ73erzuO5a6q4kdIlxk1zTFrWHPDgMQV1PRzrUtNpf/
	TK4LtnqR2pNlr+0YxKIVh/VCYG/awIlk7TD7JeYNj38rZ08vRHHDiy0RDf4wTk1W+yVNWZ+gLXo
	FX0EGj+/6TH+3NBudiz3oO9abeQ5bGXxvfhLqjJDC9ROZynrvpJfAb3MqWR25U1bsKLkRKK8HZg
	UcuCE0qwqzeD2a/VQ8i/lu7EE+gc7BgsSmT6yTUT9fRtCnkBL/iey9iQLC5ZdrZhgsaJAUI0U56
	W9LygKiyEDN+bRQdX3mpTLgwbNXUTO4L6mTuoMs7HNBoV3vnxpPqAISeUy/K1tNhBOGH/uMWm3O
	IjLjMYDnuKRNyYOMOcjtzKiXXdxavzZWrQctBZBVSgtOITUGWiw8bXoDdO8xY82pPEwoqXTXWLQ
	+/EWRWmQDhPGaQ8EsvG3XMyIwcMYEoqDNL6tv5ZwhW4y/SR2E36ZteXul6tgyLNLHdu2ciERohW
	6mrQayI9KXoQHo=
X-Received: by 2002:a05:6000:2586:b0:437:6f6b:4f7d with SMTP id ffacd0b85a97d-437978cdd9dmr2051798f8f.19.1770970725140;
        Fri, 13 Feb 2026 00:18:45 -0800 (PST)
Message-ID: <50a017e9-700d-487c-a04b-8a2ef5e7b3b3@suse.com>
Date: Fri, 13 Feb 2026 09:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Put wait.c behind CONFIG_WAIT
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260211170118.109946-1-jason.andryuk@amd.com>
 <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
 <cb5da09b-66c2-4dee-8cc1-f67f596a3c18@suse.com>
 <37fd63a2-786c-497e-9bf9-de9ea9708509@amd.com>
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
In-Reply-To: <37fd63a2-786c-497e-9bf9-de9ea9708509@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 859BF133EB7
X-Rspamd-Action: no action

On 12.02.2026 20:14, Jason Andryuk wrote:
> On 2026-02-12 02:38, Jan Beulich wrote:
>> On 11.02.2026 18:30, Andrew Cooper wrote:
>>> On 11/02/2026 5:01 pm, Jason Andryuk wrote:
>>>> wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
>>>> CONFIG_WAIT, and use CONFIG_WAIT to control building it.
>>>>
>>>> Provide stubs of functions called from common code.  entry.S needs an
>>>> ifdef to hide the symbol from the assembly.
>>>>
>>>> Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
>>>>
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> I'd really rather see the API/ABI changes required to purge wait.c
>>> entirely, but I guess this will do in the short term.
>>>
>>> Two things want further thought.
>>>
>>> First, because ARM uses per-vCPU stacks not per-pCPU stacks, it doesn't
>>> need this infrastructure in the first place, but it looks like it's
>>> still compiled in and half wired up.  I suppose you don't notice because
>>> you compile out VM_EVENT on ARM too?
>>
>> But if we want it compiled out altogether on Arm, ...
>>
>>> Second CONFIG_WAIT isn't great name because there are many things it
>>> could be.  I'd be tempted to just reuse CONFIG_VM_EVENT and go without
>>> CONFIG_WAIT.  I do not want to see any new users of wait.c, and it will
>>> disappear at some point.
>>
>> ... don't we need a separate kconfig control, for it to be selected only
>> on x86 (or for it to be dependent on x86, and then imply-ed)? Imo
>> CONFIG_WAITQUEUE would be okay, as long as it won't have a prompt. We'd
>> then simply want to prevent further select-s / imply-s to appear.
> 
> ARM VM_EVENT=y won't link without wait.o.  Undefined references to:
> wake_up_nr
> prepare_to_wait
> finish_wait
> destroy_waitqueue_head
> init_waitqueue_head

Hmm, okay, assuming that then also actually works, ...

> So I think that points to re-using my original patch, but with either 
> CONFIG_WAITQUEUE or CONFIG_VM_EVENT.  Since CONFIG_VM_EVENT is the only 
> user, and we don't want further uses, I would use that.

... please do.

Jan

