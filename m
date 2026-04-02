Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC8vNqwnzmnIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:24:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32561385F86
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 10:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271264.1559483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DLF-0004VE-W8; Thu, 02 Apr 2026 08:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271264.1559483; Thu, 02 Apr 2026 08:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DLF-0004Sb-Sb; Thu, 02 Apr 2026 08:23:53 +0000
Received: by outflank-mailman (input) for mailman id 1271264;
 Thu, 02 Apr 2026 08:23:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8DLE-0004SV-HG
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DLD-0047lU-Tx
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:23:51 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce2791-e002-0a2a0a5209dd-0a2a4503c624-30
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:23:51 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce2797-02b3-0a2a45030019-d1558031d522-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 10:23:51 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488879b2e6aso4728715e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 01:23:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c77df84sm99511845e9.4.2026.04.02.01.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 01:23:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1775118231; x=1775723031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5wp1BnHQ6M7OkIshoJy1+C2KV5ll9nd5dev44fAEeXc=;
        b=Inn+Dq07OQQAKHCulXzi2F8ZomiTtCRE3xwm/h0Kfft/SdpnQlhEOk4xMby+oGlttY
         8xWtT80F2DwlNX5dJfbyNVTDWZeqNCko3E3wT5kgzRczYm5YcEkoM4v6cKkhXiWTq1qc
         PnRnH2lJ0PulQYOE7nnxn/bWHZpYByrfvA3NRrZVsDYOdqwXqvtV4O2y2AeEe8SiAYsM
         /8uafsYe/CKS313od/FEROxP7IxJfog5sinBXOkpLCsDhbciWg8a46MyN7WUe7vye1LM
         p3+sNee8XhUT9XRJwDzPjip3JAYkic4SWCmCqxgmD7IrH/m2FE2TgaItIRz0aR3EubP+
         BYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775118231; x=1775723031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wp1BnHQ6M7OkIshoJy1+C2KV5ll9nd5dev44fAEeXc=;
        b=Ps1ELJVjkOIl2nuBdmMMK9tLSXs16rEjIzhWrzJjf1g7Kkblz0/RbzTnXg7+JHY9R0
         1q5PzDs3/QbcbtBIUGclIsVmGa7dXP43MsSHJr05Pe3QICi50R2S4h/7fu8G0Eduu+ZF
         ETvnLiHKHOIK6MVnNB62S98YPiuo96zyqtlk41QGW3w0XRTOHrV9yidq+3JjMQ+zzmc7
         vebfaiuq+eqCxsi17cM/PNnPer8YcUBIAKnioUiGCczwRxvu9FUOKuL3QjbIJpv8Ocho
         407DJBNRypGAMAeVIuHvUwulxP8Gvf1ng0SLI90XhSha4Kiv1bJc4B3EvNWbyYMQmg2z
         9gpg==
X-Gm-Message-State: AOJu0YwhK8lyRNwzXoffu4fjgrTNsYVaAogD+RTfO4h0d9rKqLlkwoKh
	m83yw5fxg82Bdlq0Yvo4RovT0UiZgubtU9WXlNMpmWAIYc0JpLlnr2aQ5guN/vt6WjhlkGz1Ses
	fdtT6Cg==
X-Gm-Gg: ATEYQzxf5nQDn52hijKFlZuj+eIdG5nBoGMOqjybbt39tIRXYfas0MTk15ZBSNo5eHH
	SdHySP2pN745RYrC00U5PPX4QuitZIXMbNykrM+/MaofIP6Yc2NPQHdcYlBLYxpQl5Gxi8RZ4g6
	dkbFdvlTGQ8MZYMd2g7IPEOmqVk/jhRGzOWCrZsRwMt4F2bdkbyT/IaVtZUo3j6SztZao9z/OkN
	2uXUi2MDI/qqRJqqVR0EnHtaOuOKmhlGR26969TQPMS1BbDNKu6pG3GEIrFzJ21cC7DO4cTWVHa
	7Fzb8H6ICY4e+ZsSUoQjoecoVKLFrGQASK8Xm4Rg1Q0/txn8ch6YUE2WltE5PnvU00DEhnltvdN
	9Bu5SyRHetmWOxjnfR2PbeEexzVfyVrFp0GO1lkCAECMuJrFlffkvMhZcA0/Pfk36zIXxUREgTj
	cWZvRpZRRhELkiZonX2Wdm1fUkastQIWQlu4q+pLXp0mKGm3Mh+O9Nq7ZaFpmJiuSIWIDC+4pTn
	GHFji6oRuIJt/w=
X-Received: by 2002:a05:600c:34d5:b0:487:20ee:bef6 with SMTP id 5b1f17b1804b1-48883566134mr133390725e9.11.1775118230951;
        Thu, 02 Apr 2026 01:23:50 -0700 (PDT)
Message-ID: <5310a923-ab2c-478f-9854-7542a7940778@suse.com>
Date: Thu, 2 Apr 2026 10:23:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com> <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com> <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com> <acZ8ez4dmQay1JSw@mail-itl>
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
In-Reply-To: <acZ8ez4dmQay1JSw@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1775118231-C9F3DC9A-1E7986AF/0/0
X-purgate-type: clean
X-purgate-size: 10544
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 32561385F86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 13:47, Marek Marczykowski-Górecki wrote:
> Some further observation, this time regarding timers:
> 
> Just before S3:
> 
>     (XEN) [  150.264757] Dumping timer queues:
>     (XEN) [  150.265181] CPU00:
>     (XEN) [  150.265497]   ex=         736us timer=ffff82d040643540 cb=drivers/char/xhci-dbc.c#dbc_uart_poll(ffff82d0404e5e78)
>     (XEN) [  150.266590]   ex=      460377us timer=ffff82d04065d2c0 cb=arch/x86/time.c#time_calibration(0000000000000000)
>     (XEN) [  150.267636]   ex=     1377460us timer=ffff82d04065d220 cb=arch/x86/time.c#plt_overflow(0000000000000000)
>     (XEN) [  150.268651]   ex=    13525100us timer=ffff82d040644c20 cb=arch/x86/cpu/mcheck/intel-nonfatal.c#mce_work_fn(0000000000000000)
>     (XEN) [  150.269820] CPU02:
>     (XEN) [  150.270126]   ex=      616653us timer=ffff830461931070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461931000)
>     (XEN) [  150.271276] CPU04:
>     (XEN) [  150.271577]   ex=      630577us timer=ffff830461935070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461935000)
>     (XEN) [  150.272734]   ex=      634586us timer=ffff830461921070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461921000)
>     (XEN) [  150.273884] CPU06:
>     (XEN) [  150.274184]   ex=       44474us timer=ffff830461905070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461905000)
>     (XEN) [  150.275334] CPU08:
>     (XEN) [  150.275633]   ex=       11465us timer=ffff83046190d070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff83046190d000)
>     (XEN) [  150.276783] CPU09:
>     (XEN) [  150.277083]   ex=       12465us timer=ffff830461909070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461909000)
>     (XEN) [  150.278236] CPU10:
>     (XEN) [  150.278536]   ex=       14464us timer=ffff830461901070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461901000)
>     (XEN) [  150.279686] CPU11:
>     (XEN) [  150.279986]   ex=       15464us timer=ffff830461911070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461911000)
>     (XEN) [  150.281139] CPU12:
>     (XEN) [  150.281438]   ex=       17463us timer=ffff830461919070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461919000)
>     (XEN) [  150.282592] CPU13:
>     (XEN) [  150.282890]   ex=      347090us timer=ffff830461941070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461941000)
>     (XEN) [  150.284040] CPU14:
>     (XEN) [  150.284341]   ex=       20462us timer=ffff83046191d070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff83046191d000)
>     (XEN) [  150.285496] CPU15:
>     (XEN) [  150.285806]   ex=         470us timer=ffff83046192d070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff83046192d000)
>     (XEN) [  150.286972]   ex=       15316us timer=ffff8304619cdaa0 cb=drivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer(ffff8304619cdae0)
>     (XEN) [  150.288156]   ex=        6230us timer=ffff8304619e8ed0 cb=common/sched/core.c#s_timer_fn(0000000000000000)
>     (XEN) [  150.289192] CPU16:
>     (XEN) [  150.289492]   ex=      633594us timer=ffff830461929070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461929000)
>     (XEN) [  150.290642] CPU18:
>     (XEN) [  150.290942]   ex=      614601us timer=ffff830461939070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461939000)
>     (XEN) [  150.292094] CPU20:
>     (XEN) [  150.292394]   ex=       27459us timer=ffff830461915070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461915000)
>     (XEN) [  150.293553]   ex=       55316us timer=ffff830461979aa0 cb=drivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer(ffff830461979ae0)
>     (XEN) [  150.294744]   ex=       35413us timer=ffff83046198fdc0 cb=common/sched/core.c#s_timer_fn(0000000000000000)
>     (XEN) [  150.295776] CPU21:
>     (XEN) [  150.296076]   ex=      617580us timer=ffff830461925070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461925000)
> 
> Just after S3:
> 
>     (XEN) [  164.462198] Dumping timer queues:
>     (XEN) [  164.462630] CPU00:
>     (XEN) [  164.462949]   ex=         768us timer=ffff82d040643540 cb=drivers/char/xhci-dbc.c#dbc_uart_poll(ffff82d0404e5e78)
>     (XEN) [  164.464064]   ex=     1286532us timer=ffff82d04065d220 cb=arch/x86/time.c#plt_overflow(0000000000000000)
>     (XEN) [  164.465099]   ex=      395997us timer=ffff830461921070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461921000)
>     (XEN) [  164.466262]   ex=    15327843us timer=ffff82d040644c20 cb=arch/x86/cpu/mcheck/intel-nonfatal.c#mce_work_fn(0000000000000000)
>     (XEN) [  164.467461] CPU02:
>     (XEN) [  164.467773]   ex=       37756us timer=ffff830461931070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461931000)
>     (XEN) [  164.468953] CPU04:
>     (XEN) [  164.469267]   ex=      940042us timer=ffff830461935070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461935000)
>     (XEN) [  164.470444] CPU06:
>     (XEN) [  164.470759]   ex=      485896us timer=ffff830461905070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461905000)
>     (XEN) [  164.471937] CPU08:
>     (XEN) [  164.472251]   ex=      459720us timer=ffff83046190d070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff83046190d000)
>     (XEN) [  164.473430] CPU09:
>     (XEN) [  164.473745]   ex=     1563081us timer=ffff830461909070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461909000)
>     (XEN) [  164.474922] CPU10:
>     (XEN) [  164.475237]   ex=      948204us timer=ffff830461901070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461901000)
>     (XEN) [  164.476417] CPU11:
>     (XEN) [  164.476732]   ex=      948071us timer=ffff830461911070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461911000)
>     (XEN) [  164.477912] CPU12:
>     (XEN) [  164.478219]   ex=      892163us timer=ffff830461919070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461919000)
>     (XEN) [  164.479398] CPU13:
>     (XEN) [  164.479713]   ex=      308429us timer=ffff830461941070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461941000)
>     (XEN) [  164.480893] CPU14:
>     (XEN) [  164.481208]   ex=      954493us timer=ffff83046191d070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff83046191d000)
>     (XEN) [  164.482386] CPU15:
>     (XEN) [  164.482700]   ex=     1487692us timer=ffff83046192d070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff83046192d000)
>     (XEN) [  164.483881] CPU16:
>     (XEN) [  164.484195]   ex=       22890us timer=ffff830461929070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461929000)
>     (XEN) [  164.485373] CPU18:
>     (XEN) [  164.485688]   ex=       85902us timer=ffff830461939070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461939000)
>     (XEN) [  164.486864] CPU20:
>     (XEN) [  164.487171]   ex=         895us timer=ffff830461915070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461915000)
>     (XEN) [  164.488358]   ex=       17895us timer=ffff830461979aa0 cb=drivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer(ffff830461979ae0)
>     (XEN) [  164.489569]   ex=        2914us timer=ffff83046198fdc0 cb=common/sched/core.c#s_timer_fn(0000000000000000)
>     (XEN) [  164.490633] CPU21:
>     (XEN) [  164.490947]   ex=      461154us timer=ffff830461925070 cb=common/sched/core.c#vcpu_singleshot_timer_fn(ffff830461925000)
> 
> In the latter case, I see only one cb=common/sched/core.c#s_timer_fn
> (two of them before). And also only one
> cb=drivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer.

Let's start with this one. It's active when the ondemand governor is in use,
and when a CPU isn't (in the process of being put into) a C-state. There
being only two instances means the system was reasonably idle at the time you
dumped the timer queues ahead of entering S3, and just slightly more idle
after getting back out of S3. I've just checked my Skylake: Without it ever
having gone through an S3 cycle, there's only one instance there when the
system is running nothing but an "xl dmesg".

If you place enough load on the system to keep all CPUs busy, more instances
of the timer should appear. How many of them it'll be does, however, also
depend on the scope of the policy (supplied by firmware). The topology ...

> Is the s_timer_fn related to runqueues? I have two of them:
> 
>     (XEN) [   11.751480] Adding cpu 0 to runqueue 0
>     (XEN) [   11.753580]  First cpu on runqueue, activating
>     (XEN) [   11.755731] Adding cpu 2 to runqueue 0
>     (XEN) [   11.757818] Adding cpu 4 to runqueue 0
>     (XEN) [   11.759891] Adding cpu 6 to runqueue 0
>     (XEN) [   11.761955] Adding cpu 8 to runqueue 0
>     (XEN) [   11.764001] Adding cpu 9 to runqueue 0
>     (XEN) [   11.766029] Adding cpu 10 to runqueue 0
>     (XEN) [   11.768045] Adding cpu 11 to runqueue 0
>     (XEN) [   11.770050] Adding cpu 12 to runqueue 1
>     (XEN) [   11.772033]  First cpu on runqueue, activating
>     (XEN) [   11.774051] Adding cpu 13 to runqueue 1
>     (XEN) [   11.776047] Adding cpu 14 to runqueue 1
>     (XEN) [   11.777993] Adding cpu 15 to runqueue 1
>     (XEN) [   11.779913] Adding cpu 16 to runqueue 1
>     (XEN) [   11.781872] Adding cpu 18 to runqueue 1
>     (XEN) [   11.783912] Adding cpu 20 to runqueue 1
>     (XEN) [   11.785855] Adding cpu 21 to runqueue 1

... of this system looks somewhat "interesting", judging from these CPU
numbers.

Assuming the system was (supposedly) equally idle before and after S3,
the absence of the 2nd timer(s?) may indicate that some (background?)
load that was there before S3 didn't re-appear afterwards. Such
background load could be something which monitors and tunes the system.
(Yet as indicated, I'm looking at the CPUfreq part only right now. I'm
kind of hoping that a scheduler maintainer may look at the other aspect.)

> Could the issue be related to those timer differences?

Possibly. For the CPUfreq aspect you could simply turn that off to see if
it makes a difference. Or you could switch to a governor different from
the ondemand one.

With the ondemand governor, does the pattern (will require multiple runs)
change across S3 that "xenpm get-cpufreq-states" produces? For example,
does load move towards CPU0? (Thinking of it, did you check whether
interrupt affinities change across S3? More going to CPU0 could also be
part of the problem, for example.)

Jan

