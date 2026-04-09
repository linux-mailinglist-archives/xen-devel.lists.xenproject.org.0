Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pMDBJS0/12nLLwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 07:54:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E634B3C664A
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 07:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276675.1562013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAiLh-0000pp-Av; Thu, 09 Apr 2026 05:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276675.1562013; Thu, 09 Apr 2026 05:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAiLh-0000ng-89; Thu, 09 Apr 2026 05:54:41 +0000
Received: by outflank-mailman (input) for mailman id 1276675;
 Thu, 09 Apr 2026 05:54:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAiLf-0000nW-Av
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 05:54:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAiLd-007pjO-5J
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:54:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d73f0e-e002-0a2a0a5209dd-0a2a4504a2d4-36
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:54:38 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d73f1e-bb33-0a2a45040019-d155802cf1df-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 07:54:38 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso6830955e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 22:54:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2738sm65831071f8f.24.2026.04.08.22.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 22:54:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1775714078; x=1776318878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NZRM53ltf1rld9wCi7TJVNvZoblfyxUIddUYjGw828w=;
        b=NXYk+j9Fzx9YSWtulb07mUY4AE6CPy7qwfBOz0/jR8BI3gr8wbBBqEiHxAwn+JpKfZ
         obC/5jzNUQJtv8WGN5nu6fl/4qHHwUEARXIQZen2+5ICOaxqpB2Di2Pjcpfmj+SyLte0
         ReUO5OnzwQvJqwpJOsAgP2nNtbvZuF/gVl2TqSsfY/2h6DMYIjPcwNQ5ifPpn9ZivWBE
         4G+KRPUVVloN7uqKeEgOQ8R8M3yVi7oLOxGCQSXaTfJASc2VPhGj1bZo24MHxzPq3bZT
         Zb5dyZ5ALh+Qm9zJowGddAhCLZQGVZiQV09nAwMrgkcBmFJy+EKq9rrtmY535CskAD5o
         6FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775714078; x=1776318878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZRM53ltf1rld9wCi7TJVNvZoblfyxUIddUYjGw828w=;
        b=Nl+RE86RnvDaPPoaHBrD9KDZM/AtygoamK6Y7Mi8Xy6IcVDvbK9PnJek/WCcXCvNjq
         hAL5eK7+Z72NtUDpqijrM09BTiBx0WisfgQnDgOirvcUR8FOszJ2B2+msuf6s02gmSOz
         1K2VUEx/f3DiBFW/lvbs5bH4O1EApkjAg6ZoCyqsfiLozGvdjQWw01DzifVoEm3N7Nx5
         GHQHRafmyPo48ZIoPi2pzqlf3AkpTfuYjHPCFb9IXsN6Wi7EOFOPiKl/7HfdqTLOI6fF
         5R0tveH7lf0Jb+7ZFL9JH9Wt2ormLzHrFKlDJFLJzV7grhjzNv1TCFzyQ8zBNQmHFs/r
         MiHg==
X-Gm-Message-State: AOJu0YzHheiZS3acNPd5SeIxJ++v6jmcmodslCq4MazT6EZEfJzkWtD7
	dvtyT2unDRPVnXKmPUZ8x9X6SSwrLdSZjOHRzvvki6ARuMguabMnR/FxRBgYpe/KCQ==
X-Gm-Gg: AeBDiet55FXaZ1BDUZtrB4f0kCVofE53fKB8KdwwCy44SmP3tq6t3OaGIcfa/z7R0FW
	j0o0QOzIxxVfNqj4RFfpA2THEizMdE/9Q3aBue4FW5eNpH4wru6K4YKED7Wtddhm64NaVJxzfrJ
	XLuBeNF6QnkMRdbfbj+oObWcZPDLZ9KStVg6MpDxmviWyO+dOcMx/ptpuB3YQ0iMUq+9eaRMios
	GvAnxYfT6/dMgarVtw818+Szl288fmRmQWe8t3mLHFtEK81IcYujnuGqIn8yLdHNQr8WzPgG/rp
	Jv6t5KAjgMT0anHc6q72pq5/iC4BAe3jCatRL3UsjCIMbEXGc/B+7+5CMPp0CHUY0rO98FmsJj2
	8xCEyc5TokZ7WvGez7Or+b8cdfJIeEnju73dkJ11SCM/Ty85o7an5GrC2LK1wTotuP2oYYzE4Wb
	1GbcDANbqHHp3b3R76Otxru7QRsrrUZK07DW30Gex3AuxuCnRSmVYoJS+NigDucPtu3tbtZNbjV
	ajQJH3kkMfmNBz/GZEDanggSg==
X-Received: by 2002:a05:6000:611:b0:43c:f8a7:3b09 with SMTP id ffacd0b85a97d-43d292c7739mr36228384f8f.23.1775714077895;
        Wed, 08 Apr 2026 22:54:37 -0700 (PDT)
Message-ID: <518db5e7-bcf0-424d-afce-60c3077cd892@suse.com>
Date: Thu, 9 Apr 2026 07:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuidle: split the max_cstate variable
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <4b89f640-046a-49c1-95f1-947d98135e5b@suse.com>
 <adbEawEpv8KA5ofI@mail-itl>
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
In-Reply-To: <adbEawEpv8KA5ofI@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1775714078-B2F3E51B-D680C573/0/0
X-purgate-type: clean
X-purgate-size: 2138
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E634B3C664A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 23:11, Marek Marczykowski wrote:
> On Wed, Apr 08, 2026 at 01:34:43PM +0200, Jan Beulich wrote:
>> The admin can control the upper bound wanted not only via command line
>> option, but also via XEN_SYSCTL_pm_op_set_max_cstate. While decisions how
>> to set up the system are okay this way as long as we deem the command line
>> option a strict upper bound, what to do during S3 resume should not be
>> based on that potentially varying value. Decisions there need to use
>> solely the strict upper bound we may have enforced ourselves (or which was
>> forced onto us via command line option).
>>
>> Rather than altering pit_broadcast_is_available(), drop the function
>> altogether. It's pretty odd for acpi/cpu_idle.c to call into time.c, just
>> for that to call into acpi/cpu_idle.c again.
>>
>> Fixes: 8d24303023ec ("x86: don't write_tsc() non-zero values on CPUs updating only the lower 32 bits")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> What should be observable effect, in absence of max_cstate option and
> "xenpm set-max-cstate" calls?

None. Only if you lower max C-state before S3 to then raise it again
afterwards.

> The "slow after S3" issue still happens. I
> tested this on top of the two other patches:
> - [PATCH] x86/HPET: channel handling in hpet_broadcast_resume()
> - [PATCH] x86/cpu-policy: set up host policy earlier

Right, nothing else was expected. I Cc-ed you because the issue is S3-related
(and you are who primarily uses that) and because I noticed the issue here
while trying to figure out your actual problems.

>> ---
>> cpuidle_disable_deep_cstate(), when called from handle_rtc_once(), is
>> still somewhat of a problem: Boot time and resume time runs of
>> _disable_pit_irq() may still behave differently because of that.
> 
> In the above test, both on boot and resume I got:
> (XEN) [    9.916522] _disable_pit_irq:2649: using_pit: 0, cpu_has_apic: 1
> (XEN) [    9.921198] _disable_pit_irq:2659: cpuidle_usable_deep_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 1

I don't expect handle_rtc_once() was involved, though?

Jan

