Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBtdJr9f12noNAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:13:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE863C7961
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276811.1562122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkWD-00017f-TJ; Thu, 09 Apr 2026 08:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276811.1562122; Thu, 09 Apr 2026 08:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkWD-00015B-Ph; Thu, 09 Apr 2026 08:13:41 +0000
Received: by outflank-mailman (input) for mailman id 1276811;
 Thu, 09 Apr 2026 08:13:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAkWC-00014z-F9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:13:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkWB-007qqT-Qn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:13:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d75fa5-e002-0a2a0a5209dd-0a2a450ab8c8-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:13:39 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d75fb3-ee98-0a2a450a0019-d1558035cd80-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:13:39 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso5919695e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:13:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cf8612cfsm36737435e9.0.2026.04.09.01.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 01:13:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1775722419; x=1776327219; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1zMaVsJ4Hj1ZbtlXWmCHXeHvDSKfKckbsVZ1TE2y4TY=;
        b=fCJec9o0bT35mQaKNwF3hcQ+SU+zF0txbWOo9IiujJfvj72LvxTC9R5ZfpR9GV7Afb
         GkibDjG5uis0K6vdEkQinChfjwefHzNsbuwfYDqJaa3gFlaKyyqE6wF+oDOZXlCOP0LN
         m4z5BNSkPfNJkopyhc1wk0o8yxKfB25jUM66aS6/2+mFekX/sCCdpl7QbCYRukml5JwA
         bAzA7gnd8q2/aMHv7JOTvM3f4VFTJBDCEuVF2Y6B6b7eiBUEhSrITb8VEJIedtbbKYEp
         tx7gGmm/oSYX1q5P14N7qJ0izGRnztWdjZqrI3ZS9SCqQaPngBV4ZyrB3rwF8VIUjEGV
         4fHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722419; x=1776327219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zMaVsJ4Hj1ZbtlXWmCHXeHvDSKfKckbsVZ1TE2y4TY=;
        b=R/GvDwkFdEiezi6NWBoZHi9uDrg/gVgzQ4YNo06/ajRXAAQm3xs74FVsRkOiJwuFuO
         zzlXmdl/MfQ/jM3SOtu9TnQ/pA/22IE0ZabfrY0PpQrJf/eSqoEcZXSfDCIMwPYhJQJU
         rE5a9eqZyma91sFbbcpI3xEe/G4g5UaxWgxTYit5PtbdCrUwHzhrsFqujfN6YmYfleaC
         k2yA3q9IaU5r+ML4JxuTaUjqUxHcieY2Ox5Y0uOm5OL/Mt+A3GfvLv6KD/0cN5T/SHv0
         +l8Z/Yj8dILdmIdZvV1acDTYT79xXYX0yjZql1G2O536VEUWwlcr5MdH1GoxmrwDOJAX
         szTw==
X-Forwarded-Encrypted: i=1; AJvYcCXxPAojhwRC+wNpE7jFLOFmdSHOfZHQ8AHRI81/LYwE4n+Q2KyOtO6jjoPbBiKevap7zRb0nbJF298=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ6czQzA6UntZyvxxx2Ly4lK74wa7weFRllAdJcp8ecuezzb0W
	asAGli7sa5Z9y6d+9UOYpYQx/oNioJqks7Zze9L7edR4rtronzsImjBjy4XUxcQv/g==
X-Gm-Gg: AeBDievFqW5uaTXLCsbN/HzOsXRHreksPbiUDPgUyE7q0C17eH7dGd+VqCr3tPABdah
	Wgdi0vgWQXJ9dWLr89LR1I8iuqN4KnG/NNjfkTJHkCnkax4dIsQ08y2JH5dWrh1Fz24+Kkv4hFt
	qwLaB0bpawd9PMWd16QhGfkweXTcYotlREy3IA/j3dqPyqiIWv0k1BASIXnNp2ORktyeW0PqGie
	uMqDfWgA8/b//lczQ9ipFnCYi5ZB8eFkFpvyhuyHVtKJwK6A2DCHIW52/7Bwj+w9w7DXQYHivP0
	zzMS32ofN5W+wBWAxFFfSr+czRqgvXLdWYbB0NuOVKumn0/Wjdt84oW28i3JZRIeowtzvYXYiaA
	DU9XhPifD4DsEYY6ikO6mCDdDCriMYgY+I8bK/5AfXzaux73H6wuJKl9Jp1pGjMJuAOypp37lYX
	a/K2CnaaJVQjlqZSzK14JunFPLQOE2Ij4B+B0FqdRKyDE9tEzZx5bBx7j5E5tsDJcXfvDW2r2eW
	Jux3QfAbYD7K78=
X-Received: by 2002:a05:600c:c0dc:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488cce7760dmr27209015e9.0.1775722418725;
        Thu, 09 Apr 2026 01:13:38 -0700 (PDT)
Message-ID: <868b63e6-c551-49b6-b177-cfadb29a69b1@suse.com>
Date: Thu, 9 Apr 2026 10:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86: record SSP at non-guest entry points
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
 <de873764-c803-4f56-b88a-936cb948c382@suse.com>
 <f08e0fbf-3570-4760-9977-4e99e651a3a4@citrix.com>
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
In-Reply-To: <f08e0fbf-3570-4760-9977-4e99e651a3a4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1775722419-BF9440B1-192369C3/0/0
X-purgate-type: clean
X-purgate-size: 2564
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 0EE863C7961
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 18:58, Andrew Cooper wrote:
> On 08/04/2026 1:22 pm, Jan Beulich wrote:
>> We will want to use that value for call trace generation, and likely
>> also to eliminate the somewhat fragile shadow stack searching done in
>> fixup_exception_return(). For those purposes, guest-only entry points do
>> not need to record that value.
>>
>> To keep the saving code simple, record our own SSP that corresponds to
>> an exception frame, pointing to the top of the shadow stack counterpart
>> of what the CPU has saved on the regular stack. Consuming code can then
>> work its way from there.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> For PUSH_AND_CLEAR_GPRS and POP_GPRS, putting the new field right next to
>> the error code isn't entirely nice; putting it ahead of %r15 would entail
>> other changes, though. An option may be to not make SSP handling part of
>> the macros in the first place. Thoughts?
> 
> I have a firm dislike for SAVE/RESTORE_ALL, both for their substantial
> complexity/inefficiency, and mixing of unrelated tasks.
> 
> I have several series trying to purge them.  I suppose I really ought to
> try and finish this off properly.
> 
> While classing SSP as a "register" is probably fine, the ssp= parameter
> (and particular it's asymmetric nature) is on the wrong side of the
> "complex" argument IMO.
> 
>> For POP_GPRS, does it really matter that it doesn't alter EFLAGS? 
> 
> Yes.  The SYSCALL fix for one (reviewed, but waiting on final testing
> before I commit).
> 
> Then the VT-x code when swapped to use POP_GPRS.
> 
> 
> To take a step back, you say that putting it ahead of %r15 would entail
> other changes.  What changes?

SAVE_ALL's initial ADD, RESTORE_ALL's final SUB, and then the hunt for
anything which may simply assume UREGS_r15 to be 0. If UREGS_r<xyz> were
ordered by register number, I would have considered putting it where
%rsp nominally would go, but without that putting it somewhere in the
middle feels rather arbitrary.

> The resulting asm would be far cleaner.

I agree.

>  It would be an rdssp;push on
> one side, and a pop into any register on the other side.  Furthermore,
> given that the ssp= doesn't exclude storing it for some user frames,
> just store it for all.  It's one push/pop into a hot cacheline, and
> makes a substantial reduction in complexity.

I'm having significant reservations against that. I use the 0 put there
in subsequent patches, to identify absence of that data being available.

Jan

