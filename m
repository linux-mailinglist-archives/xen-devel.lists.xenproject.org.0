Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HSoDh0q+2lAXAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:46:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49B4D9D82
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301624.1575871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKahB-0000eZ-6w; Wed, 06 May 2026 11:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301624.1575871; Wed, 06 May 2026 11:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKahB-0000cP-45; Wed, 06 May 2026 11:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1301624;
 Wed, 06 May 2026 11:45:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKah9-0000cJ-Dl
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:45:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKah8-009T0M-Qg
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:45:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb29df-5cb7-0a2a0a5109dd-0a2a4501907c-16
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:45:38 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb29e2-c1f2-0a2a45010019-d155dd29dc85-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:45:38 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44a044cb827so4565696f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 04:45:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052a488d8sm11855575f8f.12.2026.05.06.04.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 04:45:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1778067938; x=1778672738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lBOczczSt4cGBDNrSGBWI4v9ra6Oj+PoBVjiR/CxTr4=;
        b=hC6Cx0L8TuXhESalTx8/KVqt8CkSLYiawxU1l2kIFoicgEawRmdDMFmYk6PTbao5Hb
         X0lx/3t8ypYTE4p/Bqpo1R2yv3gWcu9if7o9mmmEbb7hX1q0CMD+mmolEYw7pEHO/0qu
         k2N4Wm8frzB84g3OtgfUXA1uX+zrNlHQaTCqJEkte7C3XaquCumDf3NMrgTw3+CYRJnO
         PNXT9W94a2g3UMv9bMdf3tYsqaxxpWKOWXr/DfF/TJ+tO7+XLCETSkcprjiILLMigN3w
         eCb/RNPioJy28uVAcPVychGPGHaqSqfQX5TWJmrwCx3/cBc+YEolkXR+H21IzBHmWTRX
         d5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067938; x=1778672738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBOczczSt4cGBDNrSGBWI4v9ra6Oj+PoBVjiR/CxTr4=;
        b=pvgIemCO1PGPeSCLVFS0ZXzZGAekXkfCYr1vB5YSk53uTo3pE6QIbpgi3dC+N3IgIb
         FRDqeH/fGH9D/l+lwEPzKIbdZScneRly97PBoXD6DNt+qaaXQnMz3eHg2MO8tolEp291
         Bu3rL4xXGK4W7chKhyW84RYwTI9fcvAzkamc1Jvc27l6yOWkTIXrdC6qFNMIvO24n4I9
         6KVoYfqn5SdhQ/Iue526LVORBMIK4tJdaRMXWxK7HzIhu1zDnoOsGbSou/mh8sKAppFM
         +hXIdyvH6ogP3uv1DRkT8KaRyKht9Gt+xhKGMBWAwKqaAnBJ7ks2RGEGzgYQan84Gn6T
         Zr3w==
X-Gm-Message-State: AOJu0YxJYAMVeXAWkOKyVvvmh+asZlyJCogxPJTUYVz/l8AzjbV/BERZ
	EM+wLNRDcOjOFJUZlujmKibMb5kStMmoTPkXjl9qXmL2L2oCiogHQ8nxviSYYtZ5Gg==
X-Gm-Gg: AeBDiesL25bOcqwv3/ITUG8788062EwTow3NObtb6doOXB0OEVLT1u5WoegSayeq7SG
	ehRfCgvXCvnoGxczAtNclj92c4F6eeVOAYeUDQO+UP5ICRngD/9TH5qkAWJeQt4XjHITz+zGZpf
	Anfd55j9g8hRD0pzQa+EP/eMTKiipkxlW2/FKODnB3sTzwd2fL9hsC/F+7lxFoNLmo3hBpEaP0y
	9PJXKFu0Py1S8zVMkRyQgLuLwjCl2NxSMzcOfttXP4te5ydea1OUkXqH3SqV6ApYVFvHK+rRDcE
	KqvTNXtKM4jJEPnHkzIFwx7Q/xaIY7xuxxgWSTdMlQ+GbTc3UybzvBafy5jh3k+v+zv/9ijLsdL
	kvZ7xdsDRRR2ws/DBvaXNHZVNRoBtbFz/hVd4ciCyP2UDWkBIBWCbHuLVBLiCPbBxCtPOo+q9uT
	bcKuhPF2mVphnNKwXhP3Zpz3ZueD9MhexGnWRwrV9OkMR/Ct/OxHXuq9lM7vqOd3nFh0VmNFoqe
	mqM0usAm1agKsmNsZT+GHq3xQ==
X-Received: by 2002:a05:6000:2383:b0:43d:7dcf:ae26 with SMTP id ffacd0b85a97d-4515d4d107bmr5515973f8f.34.1778067938089;
        Wed, 06 May 2026 04:45:38 -0700 (PDT)
Message-ID: <8bd8e079-f3af-404e-adc5-1542422f39b5@suse.com>
Date: Wed, 6 May 2026 13:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/time: make do_settime() uses more accurate
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <99a4a514-3ed5-43f7-823c-54771f3bd03d@suse.com>
 <afsi29_wLi_P7G4t@macbook.local>
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
In-Reply-To: <afsi29_wLi_P7G4t@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778067938-AE143FF4-30D2E27C/0/0
X-purgate-type: clean
X-purgate-size: 2456
X-Rspamd-Queue-Id: 9E49B4D9D82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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

On 06.05.2026 13:15, Roger Pau Monné wrote:
> On Wed, May 06, 2026 at 11:35:45AM +0200, Jan Beulich wrote:
>> As a comment next to one of the invocations states, get_wallclock_time()
>> can take over a second. The order of evaluation of function arguments is
>> in principle unspecified; in practice at least gcc looks to be evaluating
>> them from last to first. Hence with NOW() invoked first, the respective
>> value passed to do_settime() can be off by over a second (which is in
>> contrast to __get_cmos_time() attempting to get the time exactly after an
>> update, i.e. [pretty] precisely at a seconds boundary).
>>
>> This also addresses a Misra C:2012 rule 13.2 ("The value of an expression
>> and its persistent side-effects shall be the same under all permitted
>> evaluation orders") violation each.
>>
>> Fixes: f64134cdb81c ("x86: Fix time_resume() to notify all domains of wallclock change")
>> Fixes: 0bfcf984b727 ("x86: Reintroduce clocksource=tsc")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course the time it takes to do all the CMOS reads (or whichever else
>> wallclock time source is in use) also results in an inaccuracy. For
>> __get_cmos_time() this might be solvable by having it latch NOW() before
>> doing the 6 reads, but in particular for efi_get_time() there's hardly
>> anything we can do.
>>
>> As to Misra rule 13.2: tagging.ecl lists the rule as clean. I also can't
>> find any deviation for the two instances fixed here. What am I missing?
>>
>> For __get_cmos_time(), tangentially: Wouldn't we better use the
>> century byte if available? As it stands, things will break in 2070. Which
>> is a long way out, yes, but still. (Of course this would mean a 7th slow
>> I/O port write/read pair.)
> 
> Seems fine to me.

I'll make a patch, provided I can figure out under what conditions the byte
is present / valid (hopefully that won't involve ACPI AML).

> One further note: in __get_cmos_time() I think we want to read
> backwards, so start with century then year and so on, so the last read
> is seconds, as to avoid extra skew.

I don't think this matters. It would be awkward if those reads took over a
second. Plus if it did, the UIP flag would transiently be set, in which
case doing the reads wouldn't be valid in the first place. Arguably this
can in principle happen if a SMI hits in the middle, and its handling
takes excessively long.

Jan

