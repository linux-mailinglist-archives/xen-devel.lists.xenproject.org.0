Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKJGN0zi4GlhnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:21:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25C40EB2D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283467.1565689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMeW-0003GO-Ls; Thu, 16 Apr 2026 13:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283467.1565689; Thu, 16 Apr 2026 13:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMeW-0003EA-Ix; Thu, 16 Apr 2026 13:21:04 +0000
Received: by outflank-mailman (input) for mailman id 1283467;
 Thu, 16 Apr 2026 13:21:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDMeV-0003E4-GV
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:21:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMeU-00DMYA-TC
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:21:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0e237-5cb7-0a2a0a5109dd-0a2a450b88c6-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:21:02 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0e23e-212f-0a2a450b0019-d155dd2dc05b-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:21:02 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43d7badbd7dso2246106f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 06:21:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5fe1sm13738643f8f.22.2026.04.16.06.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 06:21:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1776345662; x=1776950462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=38I4je6p1nKTDmZWOKPmUPcjOJSmN3fHIloZh5xQ0bM=;
        b=d1M/EzcHPlGMEXV8voe+nCoMNEzHk2aGm3uC9qBeoOChHQ3paq3ugSzoa/zGC0hmZg
         7TDWldBZ4y4U86HMW7ysa0CCmsqJDJMLGUM4HHKYi9KcsYkkgdCFZTEcOYkCwT2rlK+H
         NOUiShsCUmK42HA9iij0w+OT20CoFrcr8ltc23bPxiIdURTauIkKrmKpVIptelTAK+/s
         sLMqvUW8TEasjIa7U0RCPNE6eaK+MJ6fcPg7/CUdNx3pqjbVuP7jixfdqey0NOZiDdEp
         JhzZJqVQ8fViJt8wRUgaA3CgGYrpkdt4YuUDJqOPOtuFNgInI8ImjiRXFzlUvC6bIdbH
         s0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345662; x=1776950462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38I4je6p1nKTDmZWOKPmUPcjOJSmN3fHIloZh5xQ0bM=;
        b=jZzyHxKBPzda2qfPmYAEw/Tv+EGUhyZaRO3OgXs/++91ib+8E7v6J8+A6YJ2HWQTQU
         3SLafBdMjweM7Qz1OSAGtP7ZnuJLrhGviImTGm6mIaUb2L7ul1hFP42WRS/rojdrYEb+
         0Zp8PjADq87Bn7k8/hkxhXfNfpZfruSJl4YXAo5zV9lPSO1IvqmDbOIO9a98nFecrGBG
         4LO2fPRWM8jAITJTtq1inPWsDi29/yvZ7oEtUYf/Qtf5tn+SiQ9bdGv0TrDCCaL/L/em
         VWyTRqfj6T20LGXY+Om8kvpqHP/lq/8lBUuMpTN/P1OTj8eXnSjgrtgtjheEQVDHUBJi
         5qyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jHDXsYMs2bAoJ3xwYKxD4226OdjMACcC5Ji1HdxjROcQDW/+OcmrFmSRdD3YeoyYz6f2ChBNrzhg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVt8iX7YrFZcfwodLmtjablPI/S6114cIR86aYrBoyXBDiotmh
	KFL4/xzPfuhrh5mWUoF3fBHYBE83RPrUmNg15NK92OqMfphPvzDlStnmW9AGbv5jbQ==
X-Gm-Gg: AeBDievmNXbRUCFKR59hWurx5ItEgASkQCZ7nmNMrvu9L8WxFLoThB6/lMIZww/nbN8
	Ubs0xmIjQbdVXa3zsgUs4ofgnegHqu7VUdMJu/V8v3p7C5/qIG+UhyIhwX8p+Nx8lMVa6OdzN4e
	VkMoQn2RvsePzmPWM+pH/JOsWWfI1ys7Fw5yaTwdWCSSLLr4lK3v3g3+UxgxKdyFViZeFPIhvCr
	XGGpK7w/KsoRf5g7BxVbtchge+lRHWtxFUk9wPMaT+xQaYgu6J2rLukeuhw+XlWkr6gYy1/oRIW
	u0PSHyXW0TB7QvXqUMqxpEUBAkcyk++YGgWr3To8bonXbZ6H6Q7SKnLOcTEIUaPlri+eIl7k5+L
	alr1gldgZR1bss+I7stpXjrWy94EtExGhTwA4lml1xyTBaIlEHPmuT+zsiTEVHGAMN5byT2oS/K
	R6Pt05sCNYBzfUVkmrE3BWq1huW5kU6uYJCS2DUBb45tsb+M3OLWHnKq43KgD9SsLrkQZEuzoiq
	e6ogs6iIDXQrPeclqSzyUIFVg==
X-Received: by 2002:a5d:5d83:0:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-43d64254fb0mr35706576f8f.4.1776345662152;
        Thu, 16 Apr 2026 06:21:02 -0700 (PDT)
Message-ID: <2d8e0307-6885-4be7-b95c-23d5d2ba7b2c@suse.com>
Date: Thu, 16 Apr 2026 15:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/time: use native TSC scaling factors when TSC is
 not scaled
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260414103327.7420-1-roger.pau@citrix.com>
 <20260414103327.7420-2-roger.pau@citrix.com>
 <f424bf3a-0113-4c66-b165-8dae82817f24@suse.com>
 <aeDgg2gB09-G2FQD@macbook.local>
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
In-Reply-To: <aeDgg2gB09-G2FQD@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776345662-7DB68F3B-71A57B2E/0/0
X-purgate-type: clean
X-purgate-size: 2679
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4E25C40EB2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 15:13, Roger Pau Monné wrote:
> On Thu, Apr 16, 2026 at 01:28:11PM +0200, Jan Beulich wrote:
>> On 14.04.2026 12:33, Roger Pau Monne wrote:
>>> When running HVM guest in native TSC mode avoid using the recalculated vTSC
>>> scaling factors based on the cpu_khz value.  Using the kHz based frequency
>>> leads to the TSC scaling values possibly not being the same as the ones
>>> used by the per CPU cpu_time->tsc_scale field, which introduces skew
>>> between the guest and Xen's calculations of the system time.
>>>
>>> On a 2gHz system, where the frequency is possibly detected as 1999999999Hz
>>> (note this is a worse-case scenario), the cpu_khz variable will be set to
>>> 1999999kHz, and hence 999Hz cycles will be not accounted for per second.
>>> Over a second (the time synchronization period), this leads to a skew of:
>>>
>>> cycles * 1 / (Hz freq) = 999 / 1999999999 = 499,5ns
>>>
>>> So far this has gone unnoticed because the time synchronization rendezvous
>>> forces the update of the tsc_timestamp and system_time fields in the vCPU
>>> time info area, and hence the skew only accumulates up to the rendezvous
>>> period.  Attempting to remove the rendezvous causes the skew to grow
>>> unbounded.
>>>
>>> Fix by using the native TSC scaling values (as used by Xen) when the guest
>>> TSC is not scaled.
>>>
>>> Fixes: eab8a90be723 ("x86/time: scale host TSC in pvclock properly")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> I'm worried about the usage of cpu_khz beyond simple printing it for
>>> informational purposes.  Overall I think it would be safer to store the
>>> frequency in Hz, as to avoid losing the least significant digits.
>>>
>>> In any case, that's a different change.
>>
>> I'm not quite sure - improving accuracy is of course a good thing, but will
>> we ever be able to do any such calculations error free, when already the
>> detected frequency isn't exactly precise?
> 
> I think getting them fully accurate is not strictly required.  The
> specific issue here was that the guest was supposedly running with the
> native TSC frequency, but the vCPU time info scaling factors where
> (slightly) different from the ones using natively by Xen, hence resulting in a
> time skew.
> 
> When the guest runs with a different TSC frequency Xen already
> accounts for it properly, and hence there's no skew.

As "properly" isn't "accurate", I expect there'll still be some skew.

> However, as noted in the next patch, I don't really see the benefit of
> storing the frequency in kHz instead of using plain Hz.

That would reduce the error, yes.

Jan

