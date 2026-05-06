Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMLcNCga+2mtWgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:38:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711F4D9621
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:38:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301563.1575834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZdv-0006Kl-Tp; Wed, 06 May 2026 10:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301563.1575834; Wed, 06 May 2026 10:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZdv-0006IT-Qt; Wed, 06 May 2026 10:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1301563;
 Wed, 06 May 2026 10:38:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKZdu-0006IN-OW
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:38:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZdu-002G3m-5A
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:38:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb1a05-bab6-0a2a0a5309dd-0a2a450289ac-28
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:38:14 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb1a15-af86-0a2a45020019-d1558029c9b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:38:14 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so39686545e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 03:38:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538a50d0sm64266255e9.5.2026.05.06.03.38.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 03:38:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1778063893; x=1778668693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ryXyXOnJEZv93Aj9BVYtKLhbvUOjKMBMV1mlZvCt21Q=;
        b=bmewdSSt9etB0c+BHTGUnMW01fLNJesth8ayOuEFQ1FPaBF7Ds/Rpa6502bOn0Na6q
         9LxH1O3FeQsd8oewM+LiGOFKUmMMvbeHo3hgk0Nq4Y4tOUujUCuFeCIRnhKtwAdSlmsz
         WNNqOKadeBCA9VsO65etjvYXg/audTMzC0Z4nNXCMZIOAMnhOlPRbgWiUv9vX8qEnKWX
         n2E2nn6GlcbawVS7PBeflxBPURFWGgT49ZiXJ51HcBLQ/0BOg1dggkQufppJW1a8bL4F
         z6FFElAWLgO5Csnmuycle3bbr0cxMDZXBQX7tPeXyQi5gw7pWF50n0wux23B6aTpiht1
         6RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063893; x=1778668693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryXyXOnJEZv93Aj9BVYtKLhbvUOjKMBMV1mlZvCt21Q=;
        b=qCZ4R8EgNg+n2TXnojIcTsozL7TYmgHAh52pW5vg6UyoHGwxaeVNCVjatOHhmhlaLC
         HrSL3GguvqGMuTZAOYUeo4reQFk7PfDFS3wvMkCFS+e2mwHyvcc8Yr8HMHuIonL6d85H
         3jXnq9XvXAzLXlMasqRTrNifuSggWLBM580erpzsKL5Z9NqAjhgZUkKI/XC3E676Nn8l
         3b3L/jbjCN6G9jqu9xpcbbuDSZHrf31anm3f5Uvpujk6xAxnoAgVVMKr8K5bMlcpdFBI
         Mr8RDd4sEc0Ssmvpw9iTunwA4qpXiATEzktWz+rF3llyyh8jFlxyq28yPoDzI5DKWwMe
         uEYw==
X-Gm-Message-State: AOJu0Yz3Q9jB+fjPElBeOe7r2NtOO7TBORvaFu56GpLG6IyEGVmLTEEn
	j6DodsQDLi7uPhFjPEvezBN39t8Ioq8hDsiDk42FGqhiuu622usHsSi0Tx7Pbenv/A==
X-Gm-Gg: AeBDiesLscQPAWw8NyEd4gNlcuB5PqZoLE04C+p966qRA0UHVXVnawS9+RPOUcbGS8u
	ZNhXLM+82xzz3Ha+HOzQSEqufMz1K+Hs2i7TTld8oRgQfy0J9cmGs/ElqKw18u+5j+++9hQlvhC
	rzKt11QFm/EYzW+ojoCAFV5XKjDCM4VYNUVleQMQDPkgMdGR+w77NfpGyjYWm0ITQJ30mSC9cP/
	fvL+27pKvTIUhG0QgwdRmcOB3c8Y874+DAvJEahIMaK07VcW5gJ7FPTp+qOSBd0Dy2Mx4Kw6sjz
	8AkXucfBwRP3aP9XP9mKu+YK7MiMoCnOtwN3CQnrG02BprtkRVauT7qYOVh00isWOPq904DvWOn
	97Awi1VDzH2PPfprwFaE3xvo05S6DftHkyBdVWPORURNsYdPXsxDxEiOrEyEgMmmvo26/p7fVat
	+Y3ZnyHaWFIvhBDJgESLM+j5C/UjJxnAUQDn2Ysu/gD66qc7rNYwJabA4FS85LLimt5FNHh78ZO
	szBSOh2cJxaNxtljkIkytnRzA==
X-Received: by 2002:a05:600c:4e0c:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48e51e16e58mr54432415e9.9.1778063893474;
        Wed, 06 May 2026 03:38:13 -0700 (PDT)
Message-ID: <b6171f2a-016d-4614-a912-0d41f6df7ea7@suse.com>
Date: Wed, 6 May 2026 12:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <746ce9af-156b-4c16-8cc0-6e8d929107a0@suse.com>
 <afsT4gICSQ_LuJ-R@macbook.local>
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
In-Reply-To: <afsT4gICSQ_LuJ-R@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778063894-A857B161-6FDD20FA/0/0
X-purgate-type: clean
X-purgate-size: 3601
X-Rspamd-Queue-Id: 4711F4D9621
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06.05.2026 12:11, Roger Pau Monné wrote:
> On Wed, May 06, 2026 at 11:37:41AM +0200, Jan Beulich wrote:
>> RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
>>      checks for NOW() returning 0 (falling back to TSM_RAW in this case).
>>      For now I have no idea how to avoid this, except that when CPUID leaf
>>      0x15 is available we could leverage that to put in place at least an
>>      approximate scale value. Doing so could, however, lead to a
>>      discontinuity (returned value moving backwards) once the final scale
>>      value was put in place. (Note, however, that such a discontinuity can
>>      also result from init_percpu_time() using the BSP's scale value as
>>      initial estimate for APs. Then again local_time_calibration() at
>>      least makes an attempt at avoiding such.)
> 
> For the purposes of printk_start_of_line() we could unconditionally
> use get_cycles() when system_state < SYS_STATE_smp_boot IMO.

Hmm, "raw" console timestamps are quite a bit uglier to deal with as a
human. Also, while init_xen_time() is pretty close to us setting
SYS_STATE_smp_boot, early_time_init() occurs earlier (and with
init_percpu_time() also called from there that's enough for "good"
timestamps).

>  Using
> the frequency value from CPUID seems like a good approach also on
> boxes that expose this information.

As per what you suggest below, we may then need to increase that value
by some margin, to have NOW() rather move a little to slow than too
fast. Plus of course it won't help for AMD at all.

> I wonder, we seem to unconditionally perform the TSC calibration
> against a known frequency time source, wouldn't it be more reliable to
> use the information from leaf 0x15 when available?

Andrew has been suggesting this, but I can only keep saying that what
CPUID reports are nominal values aiui, not actual ones. From what I
know, there's always some (small) variation as to the frequency of
actual crystals. And it's unclear whether our calibration is more
precise than what CPUID tells us. (If we knew at least average errors,
we could maybe calculate the value to use from both the calculated and
the nominal value.)

>> RFC: While generally the mentioned waiting loops will take longer to time
>>      out, on a very fast CPU tight loops may time out too early.
> 
> I was wondering about that, increasing just a nano-second for each
> call seems like it's going to make progress fairly slow?  Obviously
> depends on how tights the calls to NOW() are in the outside loop.
> 
> Maybe when lacking frequency information from CPUID we could assume
> something like 8GHz and scale the TSC based on that?  AFAICT it's
> advisable to use a frequency greater than any CPU, as then we don't
> risk NOW() running too fast.

Whatever value we pick, something faster may later appear. And too high
a value isn't good either.

>> RFC: In get_s_time_fixed(), should we perhaps assert that the scale was
>>      set?
> 
> Might be good, but I would like to see what explodes when doing
> that...

Of course that would need checking first. I've audited the callers, and
all looked safe to me. Will do for v2.

>> I don't think Fixes: tags should be put here. If we did, we'd have to
>> enumerate all introductions of early uses of NOW() (or get_s_time()), with
>> the exception of those dealing with getting back 0 (which I expect is only
>> printk_start_of_line()).
> 
> I'm fine with no fixes tag, but we need to remember to backport this
> one.

Definitely.

Jan

