Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PcaMQJVBGqMHAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 12:40:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5953171A
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 12:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307777.1579358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN70I-0000GU-UE; Wed, 13 May 2026 10:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307777.1579358; Wed, 13 May 2026 10:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN70I-0000F0-Rb; Wed, 13 May 2026 10:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1307777;
 Wed, 13 May 2026 10:39:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN70H-0000Es-8j
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:39:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN70G-009oFH-LL
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 12:39:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0454f3-bab6-0a2a0a5309dd-0a2a4507856c-6
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 12:39:48 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0454f4-229c-0a2a45070019-d155802fc560-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 12:39:48 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so37589815e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 03:39:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d74536sm67159735e9.15.2026.05.13.03.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 03:39:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1778668788; x=1779273588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbW5P/dH109E6LCimmcdaL3NKfgA1YIzofmBlk9ui8g=;
        b=GhpQKN5O35qHPhY2LjcRv5TuECoAGg9Yr/3Rt2eRSdCY8hatiL6jSyYMbPOWHGJZS5
         57Rla6aQKn/t9j188S/maRBaLGL4cofp1+CTRbhf0pu+bMqiKIVnJ43RONPvXj1RSNWu
         pr62bsXvFJvTWmwNVojcPbuXeK12X9syhgKdQCAr+vktjW5leP/DplEpcE6w4/mYFeVs
         6LgsGcM4vBdiAvLdjG02ZmC19yT36v3lhOeXCprzoqVtODddcQd2lxv8LXVFuORl5mJ+
         4bHG5pwiD4Ueu5NXY/Pr7Kww1bxO/8Fto0p9HCX+Q+MHShD1t1P3RhyS/uhqhpnN01rW
         B9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668788; x=1779273588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbW5P/dH109E6LCimmcdaL3NKfgA1YIzofmBlk9ui8g=;
        b=kNO/XUdvz1AwHQI9q/nl9tSrwYBXgLfu+SUWdKbj5+FHaEAJ4gN1yamx5gEw2JB3ft
         wKqqE6/MkezUsQvEvxn0zSVXaZlCnShDK3Pvmr98IBRh1MFAcEv+sDdi7Apol0puTKIX
         22JA8tX+sgTgs0FbZa/O7sZfm9zUlsz8wSeNNAZNVgJvVwHdpFoZ5K+PvYr5tm9lcPTy
         UnJtvur9TkN0Cf7xD3F37cPb1sEAXHzKM1GXKc+OKv3ktHASDDpv0w2/opfgiFuoFSAu
         lY14x3H4Fm4ucESvUFu8DtRmmNwHelS1iP56rqIGFySzteZagcCIQsTESTA6/QKgsUd0
         O9LA==
X-Gm-Message-State: AOJu0YyLRKvX3jtY6PR5xAdacq5gttvlkCBzUeWIjCYHrEuaUEDWwS3Z
	brV69GsEj3PyR+CwuirJYVXHeC+kQheS9K32zi2Gh4glyqF8kIkLXPCG6SXVRV7wRg==
X-Gm-Gg: Acq92OGTQmi8bIcPAIB2aGgUCxIvNa+qnzl/r2dkbhaL+e+B6sTjYPS732ipdbBJaMh
	ecSsfe6wa3oq+O01ChHwH2HQipkg7FzgnYbAit9CZLF0MzDOtn4Ff3cAnfVJwxpRvBwElbAaXuh
	/fA3q9yR+MGtAenftkjmTZ7pRlcplSwNXceOFgI1ebI3A0BJjd2p/IpY42jDt32Vwa6/0zM8r6a
	7q8iMIX2tdnQrRrZ3WLQj2iHVFkvyUR8baPKWZsReRWsE7Ui4OE2xr2BQWMaC2TTGHjWgHmpk9c
	JUrfq2UbfwfJBNdsjXoqIJuf1ms7/vGNLizTjD3e7z0hoI4HT66vqgy3ibru6Jz2NhBrhvxWCjU
	4IffTLlrWs5eUUZt1EXrAjYtD4ff49I0si4LERrzxzrh0OiOdzyhgb46hbmEoTOu9GCbDTmDkYC
	p8Oq0cp0dSoU6JFT9VMalxh96PB0i2voUA+L++3m/H3MxswjbyMOBSCcYse/oQbm35DSb8aMxX3
	XH8wsuDN7jgJ1w=
X-Received: by 2002:a05:600c:4fcb:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48fc9a0ebc2mr39063545e9.8.1778668787958;
        Wed, 13 May 2026 03:39:47 -0700 (PDT)
Message-ID: <d37322ac-fdf9-48bb-91e3-3e8d560fa758@suse.com>
Date: Wed, 13 May 2026 12:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/time: move BCD_TO_BIN() uses
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2c5af8f9-05f6-43c4-afb4-a50cbacd2d49@suse.com>
 <agQ8tRY3Kya6RasY@macbook.local>
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
In-Reply-To: <agQ8tRY3Kya6RasY@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778668788-20F66C48-CF883A97/0/0
X-purgate-type: clean
X-purgate-size: 1519
X-Rspamd-Queue-Id: 2DA5953171A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 10:56, Roger Pau Monné wrote:
> On Tue, May 12, 2026 at 04:59:03PM +0200, Jan Beulich wrote:
>> ... outside of __get_cmos_time()'s locked region. There's no need to hold
>> the lock for these computations.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I had the same thought about moving the conversion out of the locked
> region when reviewing the previous patch.
> 
> As noted in the previous patch, we should move the conversion of the
> century field with the rest?

As said there, no, I don't think so.

>> ---
>> How come RTC_ALWAYS_BCD is compile-time constant 1? And then even with an
>> inverted comment? Looks like we've inherited this from Linux, and even in
>> Linus'es current tree it's still this same way. Yet all half-way recent
>> chipsets I'm aware of properly implement the DM bit in reg B. Might this
>> be another 32-bit leftover?
> 
> *shrugs* I don't know.  Seems like Linux is still doing it, so it's
> likely safer for us to continue doing it also?  We had no reports of
> it being problematic, albeit one could argue it would be best to
> prevent such reports by doing the right thing.

That's my point. If we did this as specified, we'd unbreak systems with the
DM bit set correctly, but we'd break (hypothetical) systems with it bogusly
set. Like with a few other fixes, perhaps we should correct it, but provide
a command line option to restore old behavior?

Jan

