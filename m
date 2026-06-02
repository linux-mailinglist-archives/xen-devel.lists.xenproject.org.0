Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLuWESShHmquDAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:23:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C762B61F
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324654.1590141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULKj-0003OE-GC; Tue, 02 Jun 2026 09:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324654.1590141; Tue, 02 Jun 2026 09:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULKj-0003LQ-DB; Tue, 02 Jun 2026 09:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1324654;
 Tue, 02 Jun 2026 09:22:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wULKi-0003LK-3h
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:22:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULKg-002Xfa-Vo
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:22:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea0dd-2eae-0a2a0a5409dd-0a2a4502d2a8-14
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:22:46 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea0e6-af86-0a2a45020019-d155802cd091-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:22:46 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso100059215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:22:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e0de7bsm46881825e9.3.2026.06.02.02.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 02:22:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1780392166; x=1780996966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivvbtj2cciRanJPag8tyBUluJhJ+ZAG6wtXJVSrLlVM=;
        b=W/0mTw+P6ceATJQYS5zxv2cOed52p8qlFPeTLp4wVotjTQxYjwEtSIqvV+USb1QJnK
         XDb8k+pkFxHaD7UInL8TMZcm9mvJim1Q7ac7W+E/b0SaI7gtqLYED5mzw3F1NhkZp/5U
         9iceTp8kfu5kyB1mb+YpHyGbrW8rtcHhDUE3e1Ll+oFxp7td7kE7Ab1SUK45TrMtYCQM
         uigFX/p3+SeXLysCwGG875KjMwIRGxGGOo99XGirsahxdgbLq2l1ZM3szoSndKp4K9AY
         MWKM22Ut4EIOxa+rcZS1E108uxzC/TuGkrlFu9q4HMCDuIbnvBK4Lk17oAMUHUEI6FVk
         cZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392166; x=1780996966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivvbtj2cciRanJPag8tyBUluJhJ+ZAG6wtXJVSrLlVM=;
        b=C+S592HHXgYFHKep/fgDHKTSANg7FU+1Z2zSMRxvtTmOOUX3ijPaBjj0AGxKFo//p5
         eigbZev+2VPmifBHTsIy7ReRwgsUbS9PQhcSgTUf6qSvumuIZEx3fFd6qMYO3BEaXGKi
         NxwiNTw+cmn4JMVYss1l7vb2rOr0M8jZGURjptcvrrlnkRyPZ5wgH7NDZbEKIlskVUFl
         zryyz0h7zqydyEObBJ0QyssMC9Gr+YEUEGgc2SnvKhBnvJzTGUCD4VZ3ZOCZ/CIoiWry
         wQvrNK68T5hCJ862A8PQ5+4+WznSPRwrj+0OWvHJ25G19ot8eCBkfHh06sc50IXmzp9T
         2uPQ==
X-Gm-Message-State: AOJu0YwspOWRvxAOJMu/aBZlHcfvHOedvL4c85htFdPgVxhrGYP569nQ
	qygazQ9hvNi/TJmRnt0wulntiDoBCv6dpkMiaHZSMpyvDzN6we+NzHdCq3aUWE/gVw==
X-Gm-Gg: Acq92OEmbDrJByXIgvN9vPIJ/pJv4NKvNoCbILtzqysDjPBR4Z1AGd++GDjSfN0NQgT
	Zkb41BDl93ZnO07dKNfJgnfgKl+DCwY4b05IHRjRO57qA1m9FkcNDkig+nBCK339iIowLIzGdGJ
	mE+mtUPJjIrIfB3QSEx2YHfuSg4pGTv1RVW1tk7jZ0MzaNIIxNlCbDczFmBBetBn3Z4Z8Bt6Q93
	Bf9tmH21B89O0k/+z5HOsU2+skjg+QiHK+m8khHUEN1FmWAI4LC3zirTx50dfc8LMdwwyHXmmu/
	xVVUfKLvbffLXCHEtD1fNa88b07pOhvmXmvrv/+ylizQNIYvB9XIPPaHJiKQcTorBoPmFEvottZ
	orPZMBsuKSQlbdVUEI7LaHnyZSyOzJ3EpMmT5mEYyxcBSdc8K6mtyRsW3NyhQQZQ1l9zTzmtfsz
	ccvLVR3mDQdqMdmNxvwXvEdvUOmX4yJ9kT6FP1G9aGd7wfpa0cpvJvHlvTz/xwx92rY3z8vu9nz
	BRF9USVt3pt7sAuGvZaX9torg==
X-Received: by 2002:a05:600c:c108:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-490a290de68mr239215145e9.2.1780392166195;
        Tue, 02 Jun 2026 02:22:46 -0700 (PDT)
Message-ID: <4a7b6f30-de8e-4baa-b2b9-e15c8da16b82@suse.com>
Date: Tue, 2 Jun 2026 11:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: disable debug info for analysis jobs
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <4f3a0cf9-63cf-405a-a19c-c8fc0473b2ce@suse.com>
 <6ed5a037c10e2b896e1269c6856508f5@bugseng.com>
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
In-Reply-To: <6ed5a037c10e2b896e1269c6856508f5@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780392166-AAB68161-13634FD0/0/0
X-purgate-type: clean
X-purgate-size: 2176
X-Rspamd-Queue-Id: AB4C762B61F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:nicola.vetrini@bugseng.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,bugseng.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 20.05.2026 14:10, Nicola Vetrini wrote:
> On 2026-05-20 10:20, Jan Beulich wrote:
>> Its generating and linking takes time (and space), while at the same 
>> time
>> Eclair should be entirely independent of its presence.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Sadly the setting of EXTRA_XEN_CONFIG doesn't look to be cumulative
>> (across "extends:"), so the addition needs making to all four eclair-*
>> jobs.
>>
> 
> Maybe with anchors and variable expansion it could be made to work, 
> having a base template EXTRA_XEN_CONFIG and then adding variables as 
> needed, but let's not complicate this unless needed. Indeed ECLAIR is 
> not affected by stripping flags currently (though I don't exclude it may 
> in the future).
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Stefano: Any chance of an ack?

Oleksii: Any chance of a release ack?

Thanks, Jan

>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2539557855
>>
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -47,6 +47,7 @@ eclair-x86_64-allcode:
>>      RULESET: "monitored"
>>      EXTRA_XEN_CONFIG: |
>>        CONFIG_ARGO=y
>> +      CONFIG_DEBUG_INFO=n
>>        CONFIG_DEBUG_LOCK_PROFILE=y
>>        CONFIG_DEBUG_TRACE=y
>>        CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
>> @@ -105,6 +106,7 @@ eclair-x86_64-amd:
>>        CONFIG_INTEL_IOMMU=n
>>        CONFIG_EXPERT=y
>>        CONFIG_DEBUG=y
>> +      CONFIG_DEBUG_INFO=n
>>        CONFIG_GDBSX=n
>>        CONFIG_FRAME_POINTER=n
>>        CONFIG_SELF_TESTS=n
>> @@ -129,6 +131,7 @@ eclair-ARM64-allcode:
>>        CONFIG_ARM64_SVE=y
>>        CONFIG_ARM_SMMU_V3=y
>>        CONFIG_BOOT_TIME_CPUPOOLS=y
>> +      CONFIG_DEBUG_INFO=n
>>        CONFIG_DEBUG_LOCK_PROFILE=y
>>        CONFIG_DEBUG_TRACE=y
>>        CONFIG_DEVICE_TREE_DEBUG=y
>> @@ -206,6 +209,7 @@ eclair-ARM64-amd:
>>        CONFIG_ARM_SMMU_V3=y
>>        CONFIG_EXPERT=y
>>        CONFIG_DEBUG=y
>> +      CONFIG_DEBUG_INFO=n
>>        CONFIG_FRAME_POINTER=n
>>        CONFIG_SELF_TESTS=n
>>        CONFIG_DEBUG_LOCKS=n
> 


