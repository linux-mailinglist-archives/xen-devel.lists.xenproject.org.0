Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Av7PHcIVLGpmLAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:20:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA067A1E5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:20:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="B3r/2Ttf";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336747.1598542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2kU-0006Fu-74; Fri, 12 Jun 2026 14:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336747.1598542; Fri, 12 Jun 2026 14:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2kU-0006Dp-4I; Fri, 12 Jun 2026 14:20:42 +0000
Received: by outflank-mailman (input) for mailman id 1336747;
 Fri, 12 Jun 2026 14:20:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wY2kS-0006Dj-ES
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:20:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY2kR-005pju-R0
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:20:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2c15b6-e002-0a2a0a5209dd-0a2a4504b074-2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:20:39 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2c15b7-1dec-0a2a45040019-d155dd34b83e-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:20:39 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45efa80e0afso823578f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 07:20:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d4fsm6682631f8f.24.2026.06.12.07.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 07:20:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1781274039; x=1781878839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QijMtWb4A3hXsmKkBUTumR39yVrmvt/6rgIUzOpMyRk=;
        b=B3r/2TtfuK60Opc7tsrZmnl/dx7mxKR3S3kSAzxyhgOXuQUiPETgRELHKsoMik2LXA
         tUN1kmaM/wJBgEtm/irgXcvvWTZToRoeha9qsk7MwhizsmCM+xfnDZNVjbJAf1+h8xJF
         CHNLa/obwIwmcvHUc7mprmxTujgP4vWG1L00VKTmN9OUnlOvm6cMNBqRiDiA9d4jDdID
         mDX7VBDzubA4VqnL8NLz6Tjfwev/mwDsbQfw4AE9Av0QtXLM7h2aXRr/wS0I/0UjJIAr
         MxikSSAfN791EleG56HcrCj3fa5yrzrau0Z0PvazwS2Ba8cKHaG/8Aac0E9wpC54y4Zc
         orMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274039; x=1781878839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QijMtWb4A3hXsmKkBUTumR39yVrmvt/6rgIUzOpMyRk=;
        b=qkgJJyovtqYHkULMmP+j1HQZLOWLl52CHFxJEGyPkAKxqdOoGZzaQiAEJRfgh2BjB6
         D9iP5mnuGaxMNPEm2r5rrT0FD9QqPS2GPTflWwz6P5+XicweqN14B7E5H1d+KLl06g/x
         CRDxEEHDY10juDOZLPRkynCTvIB/u1CzRh8FUf5ZnIry5oH4RJcM5E7FIvS77LMS3TSz
         8DqZTmHYNcRmaq7oYQEbGJnQUvm+FEKp0EqX8MqLKCUJfPDzGorbWOQDmOoEAmRgLQ+v
         914g4MX4vWCn0YCsCXAD5yLdj/ZRrZ8jIF07Xsg7z64UuD7Qy3stl73XEpi/dUnVAkA1
         LQng==
X-Gm-Message-State: AOJu0YwE2Sa6LLz8fPKlWfdMNiHi5VR7u8gbmNcsckxnGGkXib02Dt4g
	ch+Dup2CWUqcMTNuG0Yktsr0DeBuzcXwa1kLpbZ9xGq3xhoIDUPvXzndVgV3UPRM4w==
X-Gm-Gg: Acq92OEvy4QwXwPmum85KUxgQcaStxZ1QlLho9o+LTBWZwb5lgoqurShn/8Qz5IEIZ8
	GBGrOmcA7dEmIgotLzjkKEBVRSyBr6CJRTHwHmvJVDAr/USZPv8FqBjMJtuYL7tyM5S5P72iVlz
	1T0ryQbKoM1srMLCAANu/CEty2HdinrMLVxpVghPHtbqY5hQObF3CZ3pp1mfEjgiATDLFd/HlEv
	PPDpHcPSfs/xptmKC457IDEUSY+X1F3MCA5SP0W2I0Kpi6EwnsUuGQrY0rCIdeT8PdIrXeWEWnC
	e8LlnBLWtZoDEihbr4+Wcg7angbUC7V0Xdx0haB2Cx/A+E0DPv2okSh9RUgR5SP6LC6/Ooi91Sk
	9gv8P74NEQMKxP36mw1hLod8/mEPchh7CpnJnlWqa42vek6GlR37e2QsfRGuF5RegmdHVQIy7VJ
	jruCP2BNBcMHE/D5WlaZKLAbR9Vis6PvVUlXZ/fGBwjl0BTxZX5D+BZgHPvRftPG4Nhu0imm/YQ
	9B0AhD0wDoHBQ4=
X-Received: by 2002:a05:6000:4213:b0:460:194d:8df0 with SMTP id ffacd0b85a97d-4606db96725mr4204246f8f.4.1781274038960;
        Fri, 12 Jun 2026 07:20:38 -0700 (PDT)
Message-ID: <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
Date: Fri, 12 Jun 2026 16:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall
 <ross.lagerwall@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl> <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
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
In-Reply-To: <0db98119-48f3-4edd-a422-8e50ee713b7c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781274039-4846A3FF-04C37A80/0/0
X-purgate-type: clean
X-purgate-size: 2068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2BA067A1E5

On 12.06.2026 16:18, Andrew Cooper wrote:
> On 12/06/2026 3:11 pm, Marek Marczykowski-Górecki wrote:
>> On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
>>> Hi,
>>>
>>> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
>>> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
>>> netbooted and EFI.
>>>
>>> Xen call trace:
>>>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>>>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>>>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>>>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>>>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>>>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
>>>
>>> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>
>>> A few more lines from Xen:
>>>     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00050663)
>>>     Bootloader: GRUB 2.06
>>>     [...]
>>>     Enabling APIC mode.  Using 2 I/O APICs
>>>     ENABLING IO-APIC IRQs
>>>      -> Using old ACK method
>>>      ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
>>>     TSC deadline timer enabled
>>>     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>
>>> Commit this Xen is built from: 50936ea05660.
>> Interesting, the efi_get_time() way is nowadays a fallback if cmos one
>> isn't advertised. Can you try adding `cmos-rtc-probe`?
>>
>> Anyway, surely it shouldn't crash... The commit you mentioned has "No
>> functional change intended", but well...
> 
> Well, no intended change.  It was a very big patch.
> 
> Nothing should ever be using efi_get_time().  It's unusable (i.e.
> crashing) on hundreds of millions of machines.
> 
> So, while we obviously do need to fix the assertion, this is "only"
> collateral damage from having fallen into the efi_get_time() path in the
> first place.  That wants investigating too.

Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set? On such
systems efi_get_time() would better work properly.

Jan

