Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCfOEPytpWmpDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:34:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A571C1DBEE3
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244351.1543793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5He-0003es-PY; Mon, 02 Mar 2026 15:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244351.1543793; Mon, 02 Mar 2026 15:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5He-0003cg-Ks; Mon, 02 Mar 2026 15:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1244351;
 Mon, 02 Mar 2026 15:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx5Hd-0003au-2r
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:34:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a3549d-164d-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:34:08 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so27780255e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 07:34:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb29715sm306502245e9.0.2026.03.02.07.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 07:34:06 -0800 (PST)
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
X-Inumbo-ID: 40a3549d-164d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772465647; x=1773070447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7kKsKmbJttVyNPHZQ95jKceOmtc2K70BiJyvN/p2Qls=;
        b=anEZcGAGNSq9/KkjiQhj8RVRMj45QJT3jxpg5u32e5xXnJuMRbeGijxf6ZE6h7aSx4
         qvAXqGISK47Yw119ZN4J95BixX9lthPRiqC0gVRAgr1nSFiI1C/ayeiGh5B5E6q22xvj
         WQGJMsovZMncq03guvJtPLbwK2S021tclulXGbAVDgSJgupbnm1zpWIzKIyDzw6nOM1a
         gEjLY8XOlvyCyzg3UpY31h+pz6ooAAkw6y4GvTa3GYn8elEzlEsm1U1m7YZTOTepHkk1
         W9Kbo4vW7ITlfgy6a6ylbBFrVe+S+SlvtBlpALz4rHjMjGDTFqTgnPcK3lClA5FHUiCW
         B8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465647; x=1773070447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kKsKmbJttVyNPHZQ95jKceOmtc2K70BiJyvN/p2Qls=;
        b=WEgJtQBR3aQ3+C9uXn2zr9S39RWCCODnB+85pFFbA7y+o8bW0x/qH0EnADpVwvYM69
         348FMYJOAK0oNesNs7oskWZ+GnkZ9o63FX+y80ehnTe0D/RxuafGLq03W7waqDEHwGQ/
         +lt1RVB2Phaa7jMDebVM6dTkfXOmP0P9LWZbBPJRwDO6QoZdW4yM57WQ6srTo2tZFP5p
         9Hnjm8Gppbx2GDnLIvMgG+zXJl36tZhDlfRxzGN3933I5xzIddXU83+aITUWCq5H9IQg
         t/Uk+BfhMb0xHCPG3BZ17CagDJ1LroOFngNbJpG//PzjublRkx7ZwCAZa8OuOJ5Fqcyb
         YuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjWLC8+zgxkovejNfTt+1bocgy7AaljeTkKC5/j75a4GfNsPEIvTGHmTXDo0uTPhZzD+HhSgrmv+8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBXxhI4hvP8YET3o/SaSgEbD+mtZbogbAW6DTZjcfRBDI3i7qE
	zyJH0wsQcRzf9S3dskc1yf50D1IKlgKsmefxcGqFz/e99bWDBHoL6omARiKhY6L0BA==
X-Gm-Gg: ATEYQzwfLHfLlUxo3xBVOxy9juDGVGDoL6rIJR1Bexa4arK01p5hUBViIyzERbo+8+R
	t5z1o98Oyh+JlFkpVaiNYQ0T+Nit2dL4B1SU8YujTqMfvQG66Ig2Ad//x84rrJ1JvKsADANJJgs
	8SCKti5rjQHrLAvLiEYJTVaREJl1gRFz+WW5xZBmyHxxs4Mztmy1LyUg1pMd2/7sJCNyirYZy28
	8CV8DZORjxO52RVLxTkBxNd1sHikymRnc0bqglFHmpHumvKzyIwYcR645QZ0R5m4o8G0OtISwCo
	/bfndPWxpS6S6nVdBLV+Z29gCII5LzbLeYaICPP48jdPJPcgy0oLO4BNCN24eJqOGLCXB8dPbuo
	FHa0oypygPIvR5FdMclgFKHzZ/7NFBl/WR04/UOOm7xlp5bbrHc2dx7JvY8ZIXXUawGCxkUgGec
	WCumIMoWS+ulKAMhcQk4BloROJIeg3D/XwfMsVGNQQwGjxMKYSeJc5lWXc1xVNk2FpWqUYSauMp
	vg2z3Bwk6uSEzvKDQYN0EUBPw==
X-Received: by 2002:a05:600c:5289:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-483c9bbbf1amr228767935e9.19.1772465647418;
        Mon, 02 Mar 2026 07:34:07 -0800 (PST)
Message-ID: <a99ff4bf-1519-4b93-a11e-dd8c2b5c44d6@suse.com>
Date: Mon, 2 Mar 2026 16:34:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] x86/boot: Document the ordering dependency of
 _svm_cpu_up()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-5-andrew.cooper3@citrix.com>
 <c0455659-b160-4e34-adda-cbaafb942f51@citrix.com>
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
In-Reply-To: <c0455659-b160-4e34-adda-cbaafb942f51@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A571C1DBEE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 02.03.2026 16:20, Andrew Cooper wrote:
> On 27/02/2026 11:16 pm, Andrew Cooper wrote:
>> Lets just say this took an unreasoanble amount of time and effort to track
>> down, when trying to move traps_init() earlier during boot.
>>
>> When the SYSCALL linkage MSRs are not configured ahead of _svm_cpu_up() on the
>> BSP, the first context switch into PV uses svm_load_segs() and clobbers the
>> later-set-up linkage with the 0's cached here, causing hypercalls issues by
>> the PV guest to enter at 0 in supervisor mode on the user stack.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> v4:
>>  * New
>>
>> It occurs to me that it's not actually 0's we cache here.  It's whatever
>> context was left from prior to Xen.  We still don't reliably clean unused
>> MSRs.

Actually, with this, ...

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -35,6 +35,7 @@
>>  #include <asm/p2m.h>
>>  #include <asm/paging.h>
>>  #include <asm/processor.h>
>> +#include <asm/traps.h>
>>  #include <asm/vm_event.h>
>>  #include <asm/x86_emulate.h>
>>  
>> @@ -1581,6 +1582,21 @@ static int _svm_cpu_up(bool bsp)
>>      /* Initialize OSVW bits to be used by guests */
>>      svm_host_osvw_init();
>>  
>> +    /*
>> +     * VMSAVE writes out the current full FS, GS, LDTR and TR segments, and
>> +     * the GS_SHADOW, SYSENTER and SYSCALL linkage MSRs.
>> +     *
>> +     * The segment data gets modified by the svm_load_segs() optimisation for
>> +     * PV context switches, but all values get reloaded at that point, as well
>> +     * as during context switch from SVM.
>> +     *
>> +     * If PV guests are available (and FRED is not in use), it is critical
>> +     * that the SYSCALL linkage MSRs been configured at this juncture.
>> +     */
>> +    ASSERT(opt_fred >= 0); /* Confirm that FRED-ness has been resolved */
>> +    if ( IS_ENABLED(CONFIG_PV) && !opt_fred )
>> +        ASSERT(rdmsr(MSR_LSTAR));
> 
> It has occurred to me that this is subtly wrong.  While FRED doesn't use
> LSTAR/SFMASK, it does reuse STAR.
> 
> So this needs to be:
> 
>     if ( IS_ENABLED(CONFIG_PV) )
>         ASSERT(rdmsr(MSR_STAR));
> 
> with the include dropped, as the final sentence adjusted to say "even
> with FRED".

... if we inherit a non-zero value, is the assertion of much use this way?

Jan

