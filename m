Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pbQ/Mr71O2pBgggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 17:20:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082076BF949
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 17:20:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=YB4c3sIJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345100.1604089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPOg-0003Ro-6p; Wed, 24 Jun 2026 15:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345100.1604089; Wed, 24 Jun 2026 15:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcPOg-0003P1-4A; Wed, 24 Jun 2026 15:20:14 +0000
Received: by outflank-mailman (input) for mailman id 1345100;
 Wed, 24 Jun 2026 15:20:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcPOd-0003Ov-Uj
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:20:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcPOd-00ET4Q-BK
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 17:20:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bf5a8-5cb7-0a2a0a5109dd-0a2a4502af6c-20
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:20:11 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bf5aa-5a27-0a2a45020019-d1558034bdf1-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 17:20:10 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4923fb1f095so12088235e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 08:20:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923ff821aasm488240045e9.12.2026.06.24.08.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:20:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1782314410; x=1782919210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3E0bWZf78+XCIWPS0DpQNxADrbvyMFS9z2IwyiJbnzQ=;
        b=YB4c3sIJ9OUVeBaEImerpWQbc68qNHxD/63SPzLsye76WBAnmmrfOdYXdzQuduqRS7
         K9eAO7U02r6tYo/hdDmFQOqZQgfIqX67s/NQqEyecjwyHk5BnQHdecMRHJKrQX8KAcRH
         tEacu31apa+KLeE5wTG+FOxStLI865DxSRYhtlr26VSCCjGSUPdeEXvxOhp/LcU4KiY/
         fTq+JxdqxY0oazZ67nzP95NBhJWBb3Monfd9P0J34lIJ3dSn+3w4Qfv2oLL9/EjmqMX4
         2UM0cjd4B6AvOwNBiELcNpdWdiRLYbAlfM+Yk7L/9S83ZcLoSOlDfXOQ/MgT2MMnYz69
         CAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782314410; x=1782919210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E0bWZf78+XCIWPS0DpQNxADrbvyMFS9z2IwyiJbnzQ=;
        b=aDtSPUv8ynoM7xyWiHYJ3KFIKgjVRqXrjcSIZpqucRWIEs5ywjNW9AdX8v2poNjNPm
         /mDYjusteNfA/syehdE5faacM5mhRd5EvEotWYVlF7w2vjxjRz/stcr30vqYl35N8UgZ
         OjyvqXsuPDPGIRWF9xmJqzvwieCqeWv2VEVS3N5ntPsoYifgzmivyhZoe4TPY1ukTexy
         AezVCtpqhbM/Crrt5c1DveAhAzqCWJLh50txUVtewi8CrxIix4zhMqoVZeSYf7vYEwFf
         FnOrpxv04hn+InawAaupDk0COCtopVjDqY7JblR/SCSd0zLPRl++U4b6eY4Ki8lmh3Z4
         1GSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2gh+thAlf+3rtbueHl3+Eu7Re3dzTRCBswombqVsCunN3y4fem5D9ToJ7ydnQuLJlFMs7pgz8xLM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKaPbLloLFK8KLc/LuPKLa4dl0pzFPiMO+U9ZC1Lagmx6gbM9N
	+9IJA3R3s9zpOfHG7JYtFIwd/bRva2f2WFEHJzI8iD45sAM1hBWUtOzQouihe1aZkg==
X-Gm-Gg: AfdE7cnMZ5mtDyvDZcTPXYLHUEpc+JVfX/J77S38o+FZMNeJe2vx0rpvR3k2oOqLDR+
	Y65ZAImSwsH1COLDga9SU/yUslBXpO1WqYItSH8N3o+9qCOX1WDhvYL3HXl6yXzLHniJCko1Qlu
	pf1VTDZszSkRvMfOJb1bAMWCHAStwYHGIbrs+HJntYOdKHZunInzr2LPtJeZMH8II/LiCfU1sEW
	nXA2blAsYCL8woromL6DeOklG/JpRkyjxrwa2S6v0pCiNohTFtSuS0Uc4fSdep6bOQouccOGEV9
	B0zNbJi6nkc92N5z+vAcJIIDGwv8PAKhEx7/74rGqC7Blrxxmdjq4S7gAS3zcXb7CE8UBLJVY++
	UqoQmhnX1A8F84nKqpAedAeDJqAz5GJeae3xUPLywNwV/j9Gukqs5iMTIDkyce3hg1a0Mum+qoa
	org+7UC3+8jmt/988PODCI8OvbWo8FhKP4R6zLRwgea9UNETulKdRQCDM7vdGu7359qjWfJilO6
	8AL
X-Received: by 2002:a05:600d:8446:10b0:492:4363:e7d6 with SMTP id 5b1f17b1804b1-4925b38cee2mr97900755e9.37.1782314410424;
        Wed, 24 Jun 2026 08:20:10 -0700 (PDT)
Message-ID: <a1f13515-df6b-49cf-bb61-29ae927a7496@suse.com>
Date: Wed, 24 Jun 2026 17:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
 <a7ce9d22-7ab9-4638-8ffd-2ffb9bc55df9@suse.com>
 <df2bdff9-6efc-41e0-91c2-f44a44d28871@citrix.com>
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
In-Reply-To: <df2bdff9-6efc-41e0-91c2-f44a44d28871@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1782314411-55CED7C5-56CB44AA/0/0
X-purgate-type: clean
X-purgate-size: 1302
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 082076BF949

On 24.06.2026 17:09, Andrew Cooper wrote:
> On 24/06/2026 3:47 pm, Jan Beulich wrote:
>> On 24.06.2026 16:23, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/x86_64/entry-fred.S
>>> +++ b/xen/arch/x86/x86_64/entry-fred.S
>>> @@ -20,6 +20,12 @@ FUNC(entry_FRED_R3, 4096)
>>>          GET_STACK_END(14)
>>>          movq    STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
>>>  
>>> +        /* NMIs need special handling on return to guest. */
>>> +        movzbl  UREGS_ss + 6(%rsp), %eax
>>> +        and     $0xf, %eax
>>> +        cmp     $X86_ET_NMI, %al
>>> +        je      nmi_exit_to_guest
>>> +
>>>          jmp     test_all_events
>> Actually, how about shrinking this to just
>>
>>         test    %al, %al
>>         jnz     nmi_exit_to_guest
>>
>> by having entry_from_pv() return a boolean?
> 
> I considered that, and dismissed it.
> 
> It involve changing large chunks of traps.c (simply to compile) and puts
> far more than 4 instructions of logic onto the common path.

Does it? Code size overall may grow, but since every return there is that
of a constant (false in all but one case), every individual path would go
down from 4 insns (with a memory access, admittedly a cache-hot one) to
just 3 (the two here and the MOV or XOR on the return paths).

Jan

