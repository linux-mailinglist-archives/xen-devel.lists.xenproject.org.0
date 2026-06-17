Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bFzIOZ+OMmpH2AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 14:10:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2B6998A5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 14:10:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=I75CGYCm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340389.1601439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZp5e-0004XT-9R; Wed, 17 Jun 2026 12:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340389.1601439; Wed, 17 Jun 2026 12:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZp5e-0004VD-6j; Wed, 17 Jun 2026 12:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1340389;
 Wed, 17 Jun 2026 12:09:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZp5c-0004V2-9H
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 12:09:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZp5a-009r7p-OL
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 14:09:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328e7f-bab6-0a2a0a5309dd-0a2a4509ec40-32
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 14:09:50 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a328e8e-2497-0a2a45090019-d155dd2eede7-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 14:09:50 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so4214401f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 05:09:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f20e77asm55683724f8f.0.2026.06.17.05.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 05:09:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1781698190; x=1782302990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QLsV/gnje56gEnDEpVoHSuX+oZ9QMn7aSoDLWGoU+5g=;
        b=I75CGYCm/PQQn7Xu056yUssK3xOWcdOBipuIjZcSb6EBhL1GCla1jgP9MGh81QmLtq
         /9M/O/e8Zt9htxGv6dNSocyvgYGA2FYiRIN+TT1SLVW6FFvvFlEHE1sN/R4ETwDMKj8p
         5InaSF17jTcwER3Bxz29IWY/MkRwrC77cISuMI1hkOqZjlobEOyqz2+7ehZz1AZvRa9g
         5j0tJunB2kK7f47DFrRzVxS16Xb6u+laHen7bT35VmN1W6ywVQ/hrq24xtksDot3sNu0
         SNCPNPpRTYu1BPZWP4ShBC8oK52Kg9uugS5aHG+wMtL09EMB6fONqHbpD6QspoblB9Vy
         8UKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698190; x=1782302990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLsV/gnje56gEnDEpVoHSuX+oZ9QMn7aSoDLWGoU+5g=;
        b=M11Lb7uF7PJHHMk7WZwMtMLT39L1ejuuKsvk5ENn4aOvhltfsXwnAV1p1r3rpjazIl
         gEP5lznVYkvsSOzgP+BfD9yf0wzR1atbkdUJ5iGqajNqNU+guQsuB5FGdAPAovJaAyWQ
         BnKWIbYYFu+L63KFIK0f1gzIryNS7ZSNBrBdPfM2MMS0NtxEvrw/Waz/PmH9s9bJvV7/
         crtxCKIL4dY9DTTBURrdLWZsglKHbJWWrvUl9Q1pucpkbwJaRe2MqjSE+R7LgoO0cEBo
         jMVfSMOj1t3qm7ArDUUUIlTFALJaNNK5ENntXqTIwwAJq+5Il/Yq3wqMxdsFewa6waMe
         qu3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KNiUPxFhUlRNaQhfgzUx+mEQOMytyu1Ac8JmKCTJK6GJspVPWcvvJNYZENMQHNO7k/xJoMaJFUlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzp86rHy+z2JMyxRABeRrLT7AyrEI2h1MtEdgTmaGxXFJyBTQzX
	8dirucBMlgzcFbVLGKzjMgzvzG69UqNatd/8tYi84rC+0nhTWBCZfhcskIHMK/RxzA==
X-Gm-Gg: AfdE7ckIoo+UkJDU10Rho4JejzxB5oxzqQGszdoYVDUxBHGPpypsYKNXE+VW6AvgfeC
	LouJgD6S+m5vgV3fYUTW4ZFc5DWL9p0p3BHRu/kqKJPgYUDw6naS/Pe6n7bFx0tcaMLoF/pU9/D
	Iyb8P+/MAZHF8za5fwIPQ6emsINhC0kj/Bufe1wvLJx5cULuY6NswHBtiOMST888nrIMsfx0ktF
	4U4X5/bprTOK+kPYt0LZYNBgnx+ZX74SZJhZRln5biWcnff8kFgFmP1NrVRwduJxnQ3vMkw9cUe
	5KcULzFTNPlYqhPP/atnyn11HWfzO3/cp/QOEDov2qiD1LHTurIscvNXI4XVPASPSUMBHkHquR0
	opSnohZSBcfvvWAGuV/oBqv+m64TctMO/UjSTZ1czodtv/1rHpU9CVoXjFnAsYlEG2rjPNxWC0T
	L5rWAo7JWt5o5jUmlcDWILTaKoW1VmyV28pXE6vLveFYtkZ/riAvJlV/K3VEN0T/05pUshQWif2
	M9q
X-Received: by 2002:a05:6000:2c07:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-46236e000a8mr6531339f8f.15.1781698189974;
        Wed, 17 Jun 2026 05:09:49 -0700 (PDT)
Message-ID: <3e513c8c-da3f-4540-8894-3c278eb36d29@suse.com>
Date: Wed, 17 Jun 2026 14:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com>
 <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
 <CAHt6W4f5KzkRhbDnCMS82zpAJ04-UkBoOXowyG=A5CT3yNSv9A@mail.gmail.com>
 <547d8b85-3537-4bb0-bddb-2ca2f14eb355@suse.com>
 <CAHt6W4crK-Lgt6rTsERupEGhdXtjjKJvh3F=K_U-3vXDtcETBg@mail.gmail.com>
 <274b06b5-88b0-4a40-9af4-4ad80a99f3b5@suse.com> <ajKOChA5NFFnytEq@mail-itl>
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
In-Reply-To: <ajKOChA5NFFnytEq@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781698190-43B78A53-22DEF1E0/0/0
X-purgate-type: clean
X-purgate-size: 2707
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52A2B6998A5

On 17.06.2026 14:07, Marek Marczykowski-Górecki wrote:
> On Wed, Jun 17, 2026 at 01:55:59PM +0200, Jan Beulich wrote:
>> On 16.06.2026 16:28, Frediano Ziglio wrote:
>>> On Tue, 16 Jun 2026 at 15:15, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 16.06.2026 16:07, Frediano Ziglio wrote:
>>>>> On Thu, 11 Jun 2026 at 15:42, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>
>>>>>> On 11.06.2026 16:38, Jan Beulich wrote:
>>>>>>> On 08.06.2026 19:31, Andrew Cooper wrote:
>>>>>>>> Some old versions of binutils ld managed to produce efi files which the
>>>>>>>> matching version of strip couldn't process.  This includes Binutils 2.26
>>>>>>>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
>>>>>>>> less broken toolchain.
>>>>>>>
>>>>>>> And we're certain newer versions of strip don't do any harm to the binaries?
>>>>>>> Already towards Frediano's posting I said that having looked at how things
>>>>>>> work there, I'm far from certain.
>>>>>>
>>>>>> I should have added: An option may be to link twice: Once with debug info
>>>>>> included, and once with it stripped. Personally I trust the linker creating
>>>>>> the various headers, including the section ones, more than strip's (or
>>>>>> objcopy's). Yet then I can only repeat my observation that linking PE+ from
>>>>>> ELF inputs looks to be significantly slower than linking ELF -> ELF.
>>>>>
>>>>> That was also attempted. See previous versions. And no, it does not work.
>>>>
>>>> How exactly does it not work? When stripping debug info while linking (as
>>>> we now do for the first two passes), the resulting image should be both
>>>> small enough and correct. What am I missing? The only caveat I'm aware of
>>>> is the Eclair scan, where we should avoid doing any work for the
>>>> "auxiliary" linking step (the one not producing the binary that's actually
>>>> going to be used for running Xen).
>>>
>>> One thing I remember was the build-id was not the same and debugging
>>> tools could not work.
>>
>> Hmm, yes, that's a little ugly, but can likely be dealt with by using
>> --build-id=0x<hexdigits> to replicate the build-id that was generated for
>> the main binary.
> 
> IMO linking twice (with and without debug symbols) has a great risk
> potential of producing different layout of the binary. While arguably it
> would be a bug in the build scripts,

Indeed, as it would further undermine reproducible builds. That said, we
could certainly put some (a lot of?) sanity checking in place.

> it doesn't matter with strip
> approach (used by virtually every other project I've seen).

Yet I expect that's "strip" on ELF binaries, not PE ones?

Jan

