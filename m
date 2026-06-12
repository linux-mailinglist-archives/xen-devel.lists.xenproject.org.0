Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dy1nO7MbLGpGLgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:46:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7467A4F8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 16:46:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XnWBFYDr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336779.1598561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY38k-0001ga-DJ; Fri, 12 Jun 2026 14:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336779.1598561; Fri, 12 Jun 2026 14:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY38k-0001do-Aa; Fri, 12 Jun 2026 14:45:46 +0000
Received: by outflank-mailman (input) for mailman id 1336779;
 Fri, 12 Jun 2026 14:45:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wY38i-0001dg-Hd
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 14:45:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY38h-008lGB-E7
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 16:45:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2c1b90-2eae-0a2a0a5409dd-0a2a4503add0-12
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:45:43 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2c1b96-672d-0a2a45030019-d155802ec572-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:45:43 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso9159535e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 07:45:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c4240sm6436005f8f.27.2026.06.12.07.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 07:45:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1781275542; x=1781880342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zK5NJJqNnG/b5LKnqIdoMb2RS+rQPoKjLpENVsPY9ic=;
        b=XnWBFYDr8JN0K6LhjysUce1ef4uzIOj5YwFnhO3JO5fm0FtbX70Cobo9xVoQ4yHeUn
         9qkB/XScBtbpiPf91FaMVW5FM0nD+jD/K0lCBpZhY3W5dlokNkZ0lg0Tgb0Z8cYoaa9c
         bno3UDu3cH2VsuV4y54d4IzFeu3fU5jJX9PjyAEp4VyVn2Tn70ovEE0teOSRewrjeOGP
         EyAKDLi/GjBIo2oNXg/gcpu2YhNX45I7HMKX9OPHDqOS28/sKUKPvWTIU2Rd97mrAZsg
         mv8c3mbZ1btU914pbY16GYDUKwIOYLVqnWCvjahzcOY2c+2uHHKpXSIG3RizIa0nlv6v
         wlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275542; x=1781880342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK5NJJqNnG/b5LKnqIdoMb2RS+rQPoKjLpENVsPY9ic=;
        b=k1ly5ZfGRcNuc80T1RC4dTmk2wgol3nRDQUAQJGbvsERZZ4ZaB4EDL9FYswE5oKJPA
         1lX0ZRr/uPwwmWrkYWs08KkNBuOna+LLxONCZ+Cclb3741xQ12aES8d3sKi3XnNYOmpn
         Pm9ruCZGsojJOt90qnAomqdEHnRqm+//rxrKZVnfXMNOXdqrboZ2lLWNZkny/GVPX+ql
         +WHl4OhtD77bXEjjPE1rMnnYa5uz6tlz7xqMCW6rk2NU5+lH2kP94uhXK4bg5WZvQ68S
         Zk88aM8PmfrA637t1TxH1Fuco6xicgYoTzraWc7jsq3Kv6+6r/lATyLzKxfA1IULK9Ru
         PReA==
X-Gm-Message-State: AOJu0YwamjFBwgS41U9+uw5KGleehFVL9sSD0pRu8dOh05hg9zivkIe8
	PUPmMDzmFXuLU7lVK+gR/3X6RMRhajiSbzDlvueqgLuH97Pv1pP6i9sa8K7R+WZNJg==
X-Gm-Gg: Acq92OG5Kdb0MwOnP/ys6oPZzrd6ieXUG9sMfxWdetSB7mGIFcBryt9Di9HjXV8ZgA8
	RhC04yu8k+l9Hz2+NnxE5N1jcjJvrFdDVpG2wzPWSUj3P3kpYVlnOaHC59PoL8cfIlBlDOYGs2t
	o7Ui6IuD++hg8EjLNwokr0Hvca12SZD7fZC+VxAUlu9/zq4UkUHhPHeAN9z5nFYyVo05oaFsUxg
	flWl2RPiCdEvn95ANuxongHcou/T+/t22aIUiiBbuXh6X9WdzB/flJ/OACDbDiOeWi4dNX/5+9U
	20oewlZQyRlz0EPrtHFna9TARWqNlxaqqh+IWZUEo7McO6yaKpF3xbULTxT4zxZ/8elSYvyLcH3
	+Ml9boHt/Nazgqv5YBXF1CuGd398zFrV/TpIrak2c+KPv6AbJWk49qUMY7UqAvKRsqi+dopl6hS
	M2g+sO33VgSd/QeXVLtwnwEWfedMQpRjdFta5FT99DP2zfAmwPDQNDSIvoM2yaGutacYumAayT2
	tUduUnjo7AQF6w=
X-Received: by 2002:a05:600c:1552:b0:490:e170:b7ee with SMTP id 5b1f17b1804b1-490ec4fd378mr43572685e9.17.1781275542325;
        Fri, 12 Jun 2026 07:45:42 -0700 (PDT)
Message-ID: <fb1a10de-c958-4f96-8400-4c0faeba9279@suse.com>
Date: Fri, 12 Jun 2026 16:45:41 +0200
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
 <e84d6765-61fa-4203-a1ee-ac07f54a1026@suse.com>
 <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
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
In-Reply-To: <48878ff6-ad36-448f-aa9d-6b37e2e179b1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781275543-39D7B938-C5A8D046/0/0
X-purgate-type: clean
X-purgate-size: 2961
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AE7467A4F8

On 12.06.2026 16:32, Andrew Cooper wrote:
> On 12/06/2026 3:20 pm, Jan Beulich wrote:
>> On 12.06.2026 16:18, Andrew Cooper wrote:
>>> On 12/06/2026 3:11 pm, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
>>>>> Hi,
>>>>>
>>>>> Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
>>>>> a machine and get assertion '!is_idle_vcpu(v)' failed instead. It's
>>>>> netbooted and EFI.
>>>>>
>>>>> Xen call trace:
>>>>>    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
>>>>>    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
>>>>>    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
>>>>>    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
>>>>>    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
>>>>>    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
>>>>>
>>>>> Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>>>
>>>>> A few more lines from Xen:
>>>>>     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00050663)
>>>>>     Bootloader: GRUB 2.06
>>>>>     [...]
>>>>>     Enabling APIC mode.  Using 2 I/O APICs
>>>>>     ENABLING IO-APIC IRQs
>>>>>      -> Using old ACK method
>>>>>      ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
>>>>>     TSC deadline timer enabled
>>>>>     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
>>>>>
>>>>> Commit this Xen is built from: 50936ea05660.
>>>> Interesting, the efi_get_time() way is nowadays a fallback if cmos one
>>>> isn't advertised. Can you try adding `cmos-rtc-probe`?
>>>>
>>>> Anyway, surely it shouldn't crash... The commit you mentioned has "No
>>>> functional change intended", but well...
>>> Well, no intended change.  It was a very big patch.
>>>
>>> Nothing should ever be using efi_get_time().  It's unusable (i.e.
>>> crashing) on hundreds of millions of machines.
>>>
>>> So, while we obviously do need to fix the assertion, this is "only"
>>> collateral damage from having fallen into the efi_get_time() path in the
>>> first place.  That wants investigating too.
>> Perhaps a reduced-hardware system with ACPI_FADT_NO_CMOS_RTC set?
> 
> The identified system is a Broadwell-D.
> 
> Come to think of it, there were some systems of that era which (falsely)
> claimed to have no CMOS.  (An HP Haswell Blade comes to mind, but it
> will be a similar chipset.)
> 
>> On such systems efi_get_time() would better work properly.
> 
> Wouldn't that have been nice.  On the bug I looked at at the time, it
> was just as broken as prior systems.
> 
> It's a vicious positive feedback cycle.  Windows and Linux ignore
> efi_get_time() entirely because it's broken in a way you can't probe
> for, and as a result the codepath get 0 testing by OEMs/ISVs and nothing
> gets fixed.

Do Linux and Windows then ignore ACPI_FADT_NO_CMOS_RTC on such systems? Else
how would they establish wallclock time there?

Jan

