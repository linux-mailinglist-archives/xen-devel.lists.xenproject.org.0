Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMi8EhVhg2nAmAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:09:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B3E801E
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220887.1529302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneUW-00083w-9Y; Wed, 04 Feb 2026 15:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220887.1529302; Wed, 04 Feb 2026 15:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneUW-00081k-6p; Wed, 04 Feb 2026 15:08:28 +0000
Received: by outflank-mailman (input) for mailman id 1220887;
 Wed, 04 Feb 2026 15:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vneUU-00081e-Hh
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:08:26 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59861940-01db-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 16:08:23 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so4299176f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 07:08:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e37e78sm7539071f8f.10.2026.02.04.07.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:08:22 -0800 (PST)
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
X-Inumbo-ID: 59861940-01db-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770217703; x=1770822503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5Swr1gu7g8IwH+hQRLhGbq1xJnMD+8mL67FG1ybo2U4=;
        b=H5NmjbMI6fIb/VQkcnXlc93rwpMjeooRezKvAyYkZMP3xgTsFI2MrmDfLebAL8Pj35
         ef3LFnR3j+GCT4Ge2R3HHWhHxbaGlgLBGxuEXLCgr+GLyBZ0pdIga6JFXJgnpIRjPPy6
         mKwT2fb1kW8/dLCELTh4j5Oi8xL8mTA92fiaKfykEWSQhEAemOu/Bpgpm0KFHRg7/e59
         jqdkhp+SQDJK6eMTfYb5+zC/5Ph5H8uUUQXOznNDwhYRixtuPAvG5UahRPM9roZ34lkY
         Z9o/zcCnX8Km8JGu/6ExP5MOq+Dzo0sO4eJmsyI+agGLzdN9Ox8HEJY/Pdz63K6VZWem
         W5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770217703; x=1770822503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Swr1gu7g8IwH+hQRLhGbq1xJnMD+8mL67FG1ybo2U4=;
        b=L86eZOnEyy3qOwFLUm7s7MYHg/hMv6ftpGciu5IiK8H2TYCijlSSx/mTfNbZjKKIb9
         yVFK1/+ZxF56mT857ry+iHBBW1j55Mq9q2t4z1vxQhgzDr5t6FOYu8Ytzd45LF0vfA+O
         f3Chzp8WHW+z+1ogcOGxOOQE/l/aKZ8RZl8yZ7v60ZnxkNxuGimmwiYnqWcN7GpaneO0
         cknSEMB8hvrsWtiKh1liu63KFrPOpAq46F2pJQtkGdziMu5nn/M5uzwLpYxj5vIFdCn6
         VtMoxmSLUZlh2nl8qvgf6RJDPGwTMR4bQQc8J91mg+H332S2De2FvfMvM4Ni4OHAte48
         2Z1A==
X-Forwarded-Encrypted: i=1; AJvYcCXxniDPhEYBWeTy/jS/4FsjXW3HgXDw6AZ8N6Zu2XIL/ryqxrFaWxjxDwwBU79UmFa3eVMuw9MYa3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj/fgyfdG8Q+oXPQkP/FsQj3B+OhKxSwKXkH+h6fJshT4a2cRV
	NTSBmv5Vy4Seaxf72V3iBg/m2airYbab3y40icfUJRHN0QZSieCjfZHM+DRC2Xwe7Q==
X-Gm-Gg: AZuq6aLJdoSRO4/ftVII/V+LKx2ATTB1HCgEANwZF7GNuToLMkwd7EsPlNPy7dJc7fv
	gZtU1EZJ/Pgn1aA4lFOz4gYCZsuc4i7/b1mweV3m+0yb2pia284KnVklMJROHJlc5/SG7cD/CQD
	vw2uXf9IWxtYwYDNlp2KA40vqG/ZziIZz035/NxS+GaFS3N1PPDTe9MROngBaIn1r3KZqb+Gtvj
	2Tr3Ya2SiYlYD/XJAcaAxPMpMy9pSAvjzMaSiu3HBvjxTdpYABalkyAAYd1Cwg6BpxOkGE1XyBm
	RR5DAmzB0H0vkYf3rYqaQCUh3K5GSBRHM/8nd7GLrTH2AVMjS0vEQL4FaGq59o0F9D5AN0tbYxP
	6d9rYZrJvI8/X1nPOtLPtRvjejfzTBEjY+1XXicqAnOQwaCnHEE0hKY4BUv3v4w7cgn+6uGu0qW
	AGFytEnUKLT9i43uyBjzFPJE000p/oRw4ZWq7Fg7iDmQYx9btmwMM2hp0bwHXr69j2tLT7x5w+2
	7c=
X-Received: by 2002:a05:6000:2c08:b0:435:9f1b:8d19 with SMTP id ffacd0b85a97d-43618052916mr4846663f8f.38.1770217703182;
        Wed, 04 Feb 2026 07:08:23 -0800 (PST)
Message-ID: <3f9b4337-3e0a-4693-b97f-46505bc1349a@suse.com>
Date: Wed, 4 Feb 2026 16:08:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <82540f88-ffcd-46a9-9813-ebe42ef0b0ec@suse.com> <aYNdJ6sb4GPaSEyY@Mac.lan>
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
In-Reply-To: <aYNdJ6sb4GPaSEyY@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AC3B3E801E
X-Rspamd-Action: no action

On 04.02.2026 15:52, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 03:06:52PM +0100, Jan Beulich wrote:
>> On 04.02.2026 13:25, Roger Pau Monne wrote:
>>> The limitation of shared_info being allocated below 4G to fit in the
>>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
>>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
>>>
>>> Drop the restriction in arch_domain_create() and instead free and
>>> re-allocate the page from memory below 4G if needed in switch_compat(),
>>> when the guest is set to run in 32bit PV mode.
>>>
>>> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
>>
>> The tag is here because there is the (largely theoretical?) possibility for
>> a system to have no memory at all left below 4Gb, in which case creation of
>> a PV64 or non-shadow HVM guest would needlessly fail?
> 
> It's kid of an issue we discovered when using strict domain NUMA node
> placement.  At that point the toolstack would exhaust all memory on
> node 0 and by doing that inadvertently consume all memory below 4G.

Right, and hence also my "memory: arrange to conserve on DMA reservation",
where I'm still fighting with myself as to what to do with the comments you
gave there.

Jan

