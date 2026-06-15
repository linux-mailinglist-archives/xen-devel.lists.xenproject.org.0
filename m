Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eecLCiqkL2qPDwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 09:05:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F168406B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 09:05:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Jw8NuB8v;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338017.1599046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1NJ-0003ze-JW; Mon, 15 Jun 2026 07:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338017.1599046; Mon, 15 Jun 2026 07:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1NJ-0003x8-Gr; Mon, 15 Jun 2026 07:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1338017;
 Mon, 15 Jun 2026 07:04:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ1NI-0003wj-7E
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 07:04:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ1NG-005Gwj-7V
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:04:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fa403-2eae-0a2a0a5409dd-0a2a4502e52a-48
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:04:45 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fa40d-af86-0a2a45020019-d155dd33a81a-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:04:45 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so2396433f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 00:04:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e592csm34243255f8f.36.2026.06.15.00.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 00:04:44 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781507085; x=1782111885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DbnndbiCRX9eeK8YSQU/U76IoMhVgTCsFwQQkP8O+aM=;
        b=Jw8NuB8vd8F7xeVXMM46Z0NpHOmyrr0hzLD7rNUxwnd2POle/4JYkLjlGCw+ls8epr
         Hs2S+G2BB4jnEntzb9VQG/01D7ywcsN9vY/7uzI8NXf9UCTHegNd72b77a7tofVobUZf
         Ehp93qh45x+bnTrdXEomKVr785Yv5RJ5xM3cjLXEuCpZqo6anom1MxSQAlAW0fEecDhL
         gVMrjfKBMiNnD/qY2Bk7ZG6R8wBD89H4OuFAfVt8VxOtc59Aejwalb+A8XNRE6KE6NNp
         UdoxS9Y8P2zDyIMhsbNzdRpvojof0CCgSw2EJK/dTpL8SIjq4lxb5Zp/+fa68KWWB5kT
         LcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507085; x=1782111885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbnndbiCRX9eeK8YSQU/U76IoMhVgTCsFwQQkP8O+aM=;
        b=ITqIEylJYTP837Ymi8+1MmO9Up0ScalqozpkrQI0N/8UAnmN/pfHInPmJP7hMUp2JP
         yOCAqybOLaGPtPWbCoqCqWRC4UbxtauM2qaUUwOWYAnOPGiJsyTLcd2Di/Bgl9MNrCME
         gzczOYmNBKGJDOQJBhJW8Ul4ANrD6NLBacXbic8DyIS0o6zrD0zqHq0KXNNNhkaeOp6+
         bMRJb8FdGVbvuZgkPYPAk3iXLOFD78HJOtjM6cCcxCaSECmrGotooiz0SX0Yz9Sex7Ml
         cknmzeY58lyZAzQSUznO6i/7wTvn7+LWYcqvBtHHKPwAG1oWemYMgCMIm7i+JcUwHQvp
         UPnA==
X-Forwarded-Encrypted: i=1; AFNElJ/ObYQOkUNzn5HhVrGp4xzAc0O1gcL5GF1tqgHvMO8GsSokJw0rie6AfoFyQ8WFxRHfIdx0VZi8xxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4FW2nPZ4aZBWVwL0WY0ZD9dJtuNj8525CVQBR4VAQDPF0MhdL
	zMA2TMmBbWVoykmU58L327peVMq5QDf5rdJ1C8CbsdtSSpsFF86YW7tGBqJ5hClLRg==
X-Gm-Gg: Acq92OGBbyXP3dACkIwEd8XQolJPq+OjoUylAmHfm2QTt+zUwGcjN763D61dXlFYdaO
	PECQkQ0ou5d+P42aLRuuZyJdB60ASQ9VqMUODWRyuMCMk/8KYbXUmo8SGzcdjrQUuz3yk/0cGcq
	0SAbaLL0hCL3sKm/Hl3D1PWrlffOL/hNv+OBC5tB/44fK3MK+SRafTLyvxW7/M4N6SZ45cNlIS1
	8wZuaeEfri6l+G2X9IqhiwHBpBXUfZ4PGCaeqmd/vYjj3dzoZ3mpaZ+YhMXBZcE0+k92vHuRyTO
	d8RagvOo1NxfvppenZeOEvOdZtDHRfBPDmXISQfu7ZpbZgNV8PHJ/05Cj69Wi7CcVd7Bk3RQ7Ld
	Yc0sAr7bCKZOK/KnawZtJlAdzcEC5jypPMqcQdnYPuIOO/KXF/LM9i2KDppgtrHdyjOxwPLTuxx
	1iW6H7ZSBgn7TnoHxYvgDFol2lEDS3C31cehTqYmHvbipdenAM5pj2eCG6wmz4a4vq088CVAsWQ
	/qwj22aQ/At+7Q=
X-Received: by 2002:a05:6000:2507:b0:460:d1e:a59a with SMTP id ffacd0b85a97d-4606f2211abmr16117463f8f.8.1781507085253;
        Mon, 15 Jun 2026 00:04:45 -0700 (PDT)
Message-ID: <b871a5c0-8499-47b6-8dff-ecbd21412051@suse.com>
Date: Mon, 15 Jun 2026 09:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI
 runtime path
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <8de2649558826621d49b404cae7a874f504e6b86.1781282640.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781507085-81D77161-7729EF5D/0/0
X-purgate-type: clean
X-purgate-size: 3337
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[apertussolutions.com,invisiblethingslab.com,lists.xenproject.org,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C6F168406B

On 12.06.2026 18:54, Bernhard Kaindl wrote:
> Anthony reported a boot-time assertion in init_xen_time() via efi_get_time()
> -> efi_rs_enter() in vcpu_save_fpu() on a Broadwell-D system:
> 
>   Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
> 
> This became fragile after the lazy-FPU removal cleanup series:
> 
> In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),
> efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),
> which unconditionally asserts !is_idle_vcpu(v)
> so an EFI runtime call in idle context now asserts.
> 
> Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
> efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
> which has the same assertion and can fail for the same reason.
> 
> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs.
> 
> Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")
> Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Also Cc Oleksii for an eventual release-ack.

Jan

> ---
>  xen/common/efi/runtime.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Jan Beulich's suggestion to guard the calls to vcpu_save_fpu() and
> vcpu_restore_fpu() in the EFI runtime path with is_idle_vcpu() checks
> seems to be the right approach to fix the assertion failure for idle vCPUs:
> 
>> The thinko looks to be in 4b9851c64522 ("x86: Remove fpu_initialised/fpu_dirty"):
>> While vcpu_restore_fpu() indeed unconditionally set the two boolean fields to
>> true at that point, idle vCPU-s may never make it through that function, and
>> hence ->fpu_dirtied would have remained false, triggering the (original) early
>> exit from _vcpu_save_fpu(). Perhaps all we can do now is guard the call to
>> vcpu_save_fpu() (and also the one to vcpu_restore_fpu() out of efi_rs_leave())
>> by explicit is_idle_vcpu() checks. Much like the calls are guarded in
>> __context_switch().
> 
> Anthony, could you test this with the 'cmos-rtc-probe' workaround you just
> added removed to check if guarding the assertions as Jan suggested is enough
> to fix the issues triggered on your machine?
> 
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index a23fa75e3740..596f2710fb21 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -98,7 +98,8 @@ struct efi_rs_state efi_rs_enter(void)
>       */
>      sync_local_execstate();
>      state.cr3 = read_cr3();
> -    vcpu_save_fpu(current);
> +    if ( !is_idle_vcpu(current) )
> +        vcpu_save_fpu(current);
>      asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
>      asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
>  
> @@ -159,7 +160,8 @@ void efi_rs_leave(struct efi_rs_state *state)
>      }
>      irq_exit();
>      spin_unlock(&efi_rs_lock);
> -    vcpu_restore_fpu(curr);
> +    if ( !is_idle_vcpu(curr) )
> +        vcpu_restore_fpu(curr);
>  }
>  
>  unsigned long efi_get_time(void)


