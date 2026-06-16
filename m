Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nFYkD9tmMWohigUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:08:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99586690C6E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:08:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=U04BT1oj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339374.1600566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVOT-00050L-KP; Tue, 16 Jun 2026 15:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339374.1600566; Tue, 16 Jun 2026 15:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVOT-0004yP-HA; Tue, 16 Jun 2026 15:08:01 +0000
Received: by outflank-mailman (input) for mailman id 1339374;
 Tue, 16 Jun 2026 15:08:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZVOS-0004yJ-3j
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:08:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVOR-00HKZa-GA
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:07:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3166be-5cb7-0a2a0a5109dd-0a2a4509ee0e-30
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:07:59 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3166cf-2497-0a2a45090019-d155dd36e5a8-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:07:59 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-46066e640easo2832700f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:07:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cf5d9sm39798195f8f.32.2026.06.16.08.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:07:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1781622479; x=1782227279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8iHe7ibaVd8vMoLPw4kpEFYXzcMxq2Ru3jHjzbDBnVE=;
        b=U04BT1ojY+gk6vkuMcSCwHZVyZ1IwTXrWdZe7VklHttkYPu/tVX/lE5pwAC46PgTlA
         CCZ7olOXjpfsyoOB5/ZqE1aYdhj3E4m1HGPc3hmFXS4RZzb5MKkoJMZpnVXIlstudxEd
         vp7gHtiy6rvj2VKin6Ro5zT4lcEGL3LOAcQ6DXY3B5/Qi3x58+q+OUDJlTrBvwMFkZFj
         xUJ33SAFAFY+tOLteIANZmP8syWRsZTQoINWlY0S0t2qSELQ/ZtvEJj5lTUyqc3+7aXi
         dai27HhszPFVGNq0UjQhOYjadcw1Txr6b45DX7hIHJPM9PyhzFcKu/CB4vAl/BCpAWhp
         2oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781622479; x=1782227279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iHe7ibaVd8vMoLPw4kpEFYXzcMxq2Ru3jHjzbDBnVE=;
        b=HLtD6BF8pMY2pSKO2+QSY8DInBkLcexr1O9XtOkea14N+EbEpYRo1ZgVxM6Tv2D8QA
         FLOdtb4D+sekZKjXbbDtguH6fy2EK7ljmoRxE7Af2CIbtNxQ7Bzm+BwUkpVgE9yPqQD5
         vbPI/Xdwbz/tCEgZm/ZxBdxZQhR3Szgp3UDtcFB3A26UxHJ2mHJltL+sQRrqpuYfuGlU
         CoHDO4NdVrQgE1QTDGD5GrQWwBS7clfTbY+Rk1YrrGmin1VwuE+Qlnh6Zye4iYsWVBmh
         M02BTkjBbZQHF68QUfe3xsqsB+3GUIX9oHHUytClAQDa22AqVMZcROAcT2g+LbwJMEvg
         eHRw==
X-Forwarded-Encrypted: i=1; AFNElJ8YMGGDphGWxspYNJt3v3+cac0AQTuSxgy7GyYNFxct1q1iFikqQjuyNfS6p/9MBs5AmRUHvUUTg0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2tw3kd3A3F4AeECC+ZbtIay46a5mgsHRcX2lHMYGsIP2kFZvR
	3ZMEVx3j1IAM2wRNflvwsfDLqZbkwkswtT3mmNnvasq+l592uU5Y2ybewqlYBVHAXw==
X-Gm-Gg: Acq92OEpRaRRwuO4g6U3etLwbuZqvgNrM+B6GKPXZ9CiM2qLp3N0OQ/YupkBujv8bHH
	Xc/bVX26WV4NBa7GjjDI2vedEDH17PdSt0IG611gaxeulleh+jKMt8c61M4xRSDW+220lsnt7tX
	WT3zbAPdTqcpEAQygrUh8XIkhE3FD5UuLkPWg1fBS8MNQlJd69jmTIRvuF+djJ9viXmkAkxWJWz
	2tc8j6H22WlVfS1DKo1w0NkSF7Rao06CEkpjq76WpHWeqCOvNukaqmPoLADXknEP1tBxgX40yDV
	VEsza5G6oVzA2icrZgOCt6LKpD4TkBOhZwVP1Az1XN09oFDvX0EL289mn8W2vvcsIZyH9zxtoTs
	tDRFY+FMbKzrytMS6us25vEWwTSi8jaDRCIeG4gDLlmy02FwIph3oRPICU1WkMx/EVNXMONjt5D
	MQlSTzU85f8rTVnotwfSNA6xN8t7yrgkzrlvsvqt2OA6muCqlug7iR1KJLJjNSrQMQy/JechhSf
	7FMuyvkk+sAetg=
X-Received: by 2002:a05:6000:178a:b0:460:194d:8df2 with SMTP id ffacd0b85a97d-4619f37e80emr6935383f8f.3.1781622478623;
        Tue, 16 Jun 2026 08:07:58 -0700 (PDT)
Message-ID: <01c6466c-ed4e-48a5-aae1-c8df878ed087@suse.com>
Date: Tue, 16 Jun 2026 17:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-2-frediano.ziglio@citrix.com>
 <3506eb69-f057-4c0b-8321-03cfcc6dda2a@suse.com>
 <CAHt6W4et8om1AO+v_VVpikhd0Nsuc_V_OFSm0r1rgzFJ_2wH6w@mail.gmail.com>
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
In-Reply-To: <CAHt6W4et8om1AO+v_VVpikhd0Nsuc_V_OFSm0r1rgzFJ_2wH6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781622479-37979A53-31787C0B/0/0
X-purgate-type: clean
X-purgate-size: 1684
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99586690C6E

On 16.06.2026 16:38, Frediano Ziglio wrote:
> On Tue, 16 Jun 2026 at 13:27, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.06.2026 12:13, Frediano Ziglio wrote:
>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>
>>> Required by UEFI CA memory mitigation.
>>>
>>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>>> in the pagetables.
>>>
>>> NX_COMPAT is a requirement from shim-review,
>>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>>
>>> Sections with different permissions must be in separate pages.
>>> In the case of debug sections they are contiguous and have the same
>>> permissions so it's not an issue if they are not aligned to the page.
>>
>> What if .debug_* starts in the middle of a page? Aren't you further
>> relying on .debug_* to be r/o (i.e. neither X nor W)? (Right now
>> .reloc is what comes immediately ahead of .debug_*, and that's r/o
>> as well, so not an issue in practice for now. Yet as indicated, the
>> description here wants to be usable as a reference when this later
>> needs extending / revisiting.)
> 
> Can you suggest a better wording?

After "have the same permissions" insert ", including the immediately
preceding .reloc section,"?

> Practically I think before the .debug section you could have the
> .reloc or the SBAT, either are permission-compatible.

Right, just that this doesn't go without saying.

> If in the future we break it for some reason we'll fix it again.

Yet better would be if we didn't break it.

Jan

