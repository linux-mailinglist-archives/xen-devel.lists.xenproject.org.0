Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /LkkEGehL2rlDgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 08:53:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457B683F42
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 08:53:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OgX0+EL2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338003.1599029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1Bq-0001mf-D3; Mon, 15 Jun 2026 06:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338003.1599029; Mon, 15 Jun 2026 06:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1Bq-0001js-AW; Mon, 15 Jun 2026 06:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1338003;
 Mon, 15 Jun 2026 06:52:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ1Bn-0001jm-WD
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 06:52:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ1Bm-000hSy-Ro
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 08:52:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fa13e-e002-0a2a0a5209dd-0a2a4504c9e8-28
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:52:54 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fa146-1dec-0a2a45040019-d155dd2ae5c9-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:52:54 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-46066e640easo1637654f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 23:52:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f3basm30135610f8f.12.2026.06.14.23.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 23:52:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1781506374; x=1782111174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dHKaKK1rdCsuUH3+UGUbf6B2KguzwIr0I1My5ay+Xho=;
        b=OgX0+EL2vCxRucCfv4fIJ3+G8yZdr5aABz3SBmbu2ZZdJOuWuhSjbluqhISW3RRqv2
         GeEnTrDZDhsD55AodVS9eQaRo4xl2Fn66Yv5tiLdw/0Odm/Qi/lwWXfINcakvHVkY8fU
         UWyU7OJlm4BtKTz9ofPkrkAJZbvOqzRn5ymDdM64mQKN4xkNLLcdmgsLuaPZ8UZf91fB
         wkC6n38KWY8Mow4ZYYnA3fTudgIuwbOKLBpjJMeY7kUWlj2L5bX2vrvA9ZSVG2u5andq
         BcNKHJ3J75bm7tZXo/diTdMRONvZsy9A2UrEMPzCzGMvidEBtcuIu4U52GttYF+DMsez
         McDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506374; x=1782111174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHKaKK1rdCsuUH3+UGUbf6B2KguzwIr0I1My5ay+Xho=;
        b=sTzEVw+OEaRaMKrvGmRPL8MEy40GLUXa4Sw+C7UYoac3rrRSywLbaB3YrWVnOgWyop
         9ljF7/GsjfDbqf4FcmT3Qpdk4FlwCl6XOc3g8ptd+4PyItZXtT6HFylliHwLic7NSirR
         BR4CfN+srq0iJjZwVAx7ogawamusBI23+NDkua4oaV8bXIci8yWCrsKJ+btlWrz55EIA
         q9LnSAIyO3/ytyEasq7VxgUvrfVFoMEJ4sl2o4K7KIxSEaEiVgfrQhIndz6FYLTK8lDD
         AxrNvMfsawprxwtjvWJ/CKAyK22XyIC5e+vbhQu4KmoiuJCTK6ldImGK2iSf9CZOhwcw
         FsBA==
X-Gm-Message-State: AOJu0YzZZFwza1rkdjPC+dsG3y3ImbXDtrgKpK3UU8zAQ7jEIJ9Bcqfd
	q4zV+sJmVEGh+4VWSLYkuQbM1MeIYxj/y533HJpeHzbmrxHR+/7WStCE5zGG4hcWXA==
X-Gm-Gg: Acq92OE8qqFt8eBh1BgupZpsTqUWw+Lo/7YdhddfV47ERL3jPg0wBBGANIp2d6y7Tf7
	WPmoSmKRyN8vWkADBW32fkKE/d7VPnb9G1SBLC5Cl+1P9rJQerJdHw1isxV1958ofB8e0xmtFK2
	fD9JsqW0Rw9MNlGFVSpbWshl0CEfmQQneP+VmM9NixvQ5+WNPWViIn7Ru7jLaGRyMM6e8iZ9bxt
	/aFiLZNyaMSCAha6KPfsGkfVwYanno3tko5bZms2Pszu1vnizB+DlP3BIrL7U7MyO/2Q29gcs8a
	RVTZ2YqP3IGNqRMaz2jV8DYB5hf2fkz/FgJJ/gXWCJr+hBiDbNKdV8BbZWdxqCsOh8CZjEPW9GD
	pqW31y05w/WzMmLVRzwwT0ygND0lbuk7F38UmOU1N0meBwhOvol/yddo5uxzzJeZrXk0tXfSc/z
	2eOIxJGBM7F12OLN8fmhtNMJZdSkAMXidh6jbI1xvk7Kxpp/LBvk70mHkqfPc9wOhoZLi2N1KpB
	epoEu1Ou3XWRus=
X-Received: by 2002:a05:6000:400c:b0:45e:b99d:dad with SMTP id ffacd0b85a97d-4606dbe5a84mr16714569f8f.38.1781506374032;
        Sun, 14 Jun 2026 23:52:54 -0700 (PDT)
Message-ID: <6b4894bf-61b8-404e-bd00-7e971a7009b4@suse.com>
Date: Mon, 15 Jun 2026 08:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI,
 runtime path
To: Bernhard Kaindl <bernhardkaindl7@gmail.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com>
 <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
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
In-Reply-To: <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781506374-29B7B3FF-DB796F78/0/0
X-purgate-type: clean
X-purgate-size: 3669
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:bernhardkaindl7@gmail.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 9457B683F42

On 12.06.2026 17:41, Bernhard Kaindl wrote:
> Hi Anthony, could you test this patch which exactly applies the changes 
> Jan suggested? Summary:

So I'm a little irritated by this: The subject suggests this is a proper
patch submission, yet about everything else here suggests it is not. For
the eventual real patch, may I minimally suggest ...

> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs.
> As these simple guards should preferably go into Xen 4.22: Please test 
> if there are any further regressions with the 'cmos-rtc-probe' 
> workaround you just added removed to check if guarding the assertions as 
> Jan suggested is enough to fix the issues triggered on your machine. 
> Thanks, Bernhard The patch to test follows: [PATCH] x86/efi: Skip FPU 
> save/restore for idle vCPU in EFI, runtime path
> Anthony reported a boot-time crash in init_xen_time() via efi_get_time()
> on a Broadwell-D system:
>    Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195

... to resolve this line number to a function name, to provide sufficient
context.

> The failing path is an EFI runtime call reached early during boot,
> where current may still be the idle vCPU.
> This became fragile after the lazy-FPU removal cleanup series.
> In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),
> efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),
> which unconditionally asserts !is_idle_vcpu(v)
> so an EFI runtime call in idle context now asserts.
> Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
> efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
> which has the same assertion and can fail for the same reason.
> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs.

I further would help if it was explicitly stated that no other uses of
the two functions are affected (provided the necessary auditing was done,
but ftoad I did go through that already on Friday and didn't find other
problematic call sites).

Jan

> Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")
> Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>   xen/common/efi/runtime.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> index a23fa75e37..596f2710fb 100644
> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -98,7 +98,8 @@ struct efi_rs_state efi_rs_enter(void)
>        */
>       sync_local_execstate();
>       state.cr3 = read_cr3();
> -    vcpu_save_fpu(current);
> +    if ( !is_idle_vcpu(current) )
> +        vcpu_save_fpu(current);
>       asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
>       asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
> @@ -159,7 +160,8 @@ void efi_rs_leave(struct efi_rs_state *state)
>       }
>       irq_exit();
>       spin_unlock(&efi_rs_lock);
> -    vcpu_restore_fpu(curr);
> +    if ( !is_idle_vcpu(curr) )
> +        vcpu_restore_fpu(curr);
>   }
>   unsigned long efi_get_time(void)


