Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0vYKFjYIRmpOIAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:41:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2916F3DD2
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 08:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=f5AIIkRG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1351263.1608488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfB7J-0003kS-0J; Thu, 02 Jul 2026 06:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351263.1608488; Thu, 02 Jul 2026 06:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfB7I-0003hm-T6; Thu, 02 Jul 2026 06:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1351263;
 Thu, 02 Jul 2026 06:41:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfB7G-0003hf-VJ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 06:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfB7G-00Caq7-CD
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:41:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a46081c-5cb7-0a2a0a5109dd-0a2a4507d4b6-18
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:41:38 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a460822-9c8e-0a2a45070019-d155dd32c5de-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 08:41:38 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47640541585so864014f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:41:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm5948452f8f.1.2026.07.01.23.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 23:41:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1782974498; x=1783579298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C7gG1XXRUXGBnFboK8BGuq44cQ+yqBfPnKNNfXgaklg=;
        b=f5AIIkRG3AtRF/zcMBxzvxVxbC8PY2UjGJooqsup58Q0ifvGO/TJNYwmM37yyfj+pY
         iHB7GosAac2RR7Dq7+KsQbzb2UypVe/5F70F5v13Nt4HMMh2nLoXuJ3/YQvnMD4B54QB
         Wy4cHhTEk8PpkzZtHijJBllinb8G47LDG19c68AW67k+siaD7xylzXsVSRqUYBzqXYga
         GWOCgu+vyme/Q4WmGmDoc7QtsjlacnJHejaZ+h+vK/DWyGur4ZJuUCUKCb2Jl3kweOrC
         Mz7q/yA+mIQNNLO5EETnA/Xd1Ivl+N6kSKP620s/Q8bUhhXsSj5Y7IYywOeUTFTPOVKk
         v7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782974498; x=1783579298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7gG1XXRUXGBnFboK8BGuq44cQ+yqBfPnKNNfXgaklg=;
        b=HsJ8qOjki8CXXWGkbFTCELU70qnbFZnqZ3jA3w02hUSrBLhsGEkkdZwLFgovXN7z9/
         gXC5Uut0Jx+lOIiYJWvjeYQyoN8j8jndqz6iwR04czRhpAOaWAbJAe9WltfQekV3cBBZ
         TBW4BDhKi/tZGeGcxIELX2J8rESqP5eb5egHrnuqr3UODION18EX7+li7Bez08NdAa3T
         AIKufo+b08lcpR5uIAis7yjLiDtnfhVI7sp0jGSR7n3n0CAefLJym0G/5YARHtcprbtQ
         AA+8SO0oonza+vHIYxlHob4hOBJOnan4vog9VgCkSWv818mfZJ8qsYcnlFg0n6UWcKG4
         TtIA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb02OwYG8QmRAwJuD758bud76CH9RQEYov5ikxqeFrM9ufq/EIF14IBAyBSWOpO3puvXvAXFVdyJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI+sP2onGaGxL6nnfYBdvBaP1Ig2mxrMuCql+Uy5ebaMx517gt
	o5nD7HBUH9RXbx8AxgUDk9gxzuf/wZx5kWNdgmp7nN8lDrPCsYPbLHb+wGSYCmEBlQ==
X-Gm-Gg: AfdE7cmOM0+yumhPljFaCeiJz151rJmMBbNuMYD2fHeXf8+3ZHa+XDZZ2Uskr296i24
	mS5OS8FkJYoJ161/+nZjtoYvagvGt6Vvc4/wX7ybZi2/L5xSrgYuIehmWHCf6Id7v3lLZbXsT7n
	XD+h/jyuufzfaAmmnExnwh7EJPRoN7+fxA6VhkVPMQSw4TrfwI5RFY0ZcF8W+i3/nz0AwG9x83F
	cQYW6r8ymsKuCoDQOdYpmUjkuko2W7ulxvT+j1JIn7dyRPZ52wppgl9cWrGJBJvbojeQgZG4dh6
	jpq6bgwUA2m2EdOf/CTbgDm6dCgMC275Rw3yZ0JSV577GR2oENrp3oy4OWwTQ1VzbFFxy6CQj8l
	0a+vmTh3LsaI/zNfoQ0lx/tEVddLZjIvnHRmWXyhhWHec+X2lz4c02zMKcRG9WRWFfQwfEKReVd
	2nqbTRXeONLxCNoWdqtGikClKB6tS/LO/UjNmLTqGx/AVDc0wmMROfqmWURiWJyWQV1yp9oUQ2G
	4fc
X-Received: by 2002:a05:6000:18a4:b0:475:f0f0:9f05 with SMTP id ffacd0b85a97d-4775a2f5df1mr7083019f8f.60.1782974497717;
        Wed, 01 Jul 2026 23:41:37 -0700 (PDT)
Message-ID: <2e3d404f-8716-4d0f-b739-d1e842b5a07c@suse.com>
Date: Thu, 2 Jul 2026 08:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/25] xen/riscv: add initial dom0less infrastructure
 support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <a6950e8dc2706c351fe6b0622602d34ecef133b7.1782487661.git.oleksii.kurochko@gmail.com>
 <131fc20c-1353-49fc-8f77-1ca13628ff17@suse.com>
 <c7aff2d8-14a7-4921-93d4-67228d871074@gmail.com>
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
In-Reply-To: <c7aff2d8-14a7-4921-93d4-67228d871074@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782974498-7E53825E-D7ACE335/0/0
X-purgate-type: clean
X-purgate-size: 2412
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD2916F3DD2

On 01.07.2026 17:24, Oleksii Kurochko wrote:
> On 6/30/26 9:28 AM, Jan Beulich wrote:
>> On 26.06.2026 17:46, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/guest-layout.h
>>> +++ b/xen/arch/riscv/include/asm/guest-layout.h
>>> @@ -32,4 +32,16 @@
>>>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>>>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>>>   
>>> +/*
>>> + * The guest magic region holds Xen-reserved pages mapped into the guest's
>>> + * physical address space (shared info, grant table, etc.). The only real
>>> + * constraint is that the GUEST_MAGIC_SIZE-byte region must not overlap
>>> + * guest RAM (the GUEST_RAMx banks) or the emulated device regions defined
>>> + * above; the exact base is otherwise arbitrary. Here it is placed in the
>>> + * unused gap below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM
>>> + * bank would work equally well.
>>> + */
>>> +#define GUEST_MAGIC_BASE  _UL(0x79000000)
>>> +#define GUEST_MAGIC_SIZE  _UL(0x01000000)
>>
>> ... while 16Mb may seem a lot, it feels pretty little for 64-bit guests.
>> Even in just Sv39 mode they have ample VA space to map a bigger region.
>> (As iirc indicated before, a static upper bound looks questionable to me
>> anyway.)
> 
> I think the comment should be updated as for grants will be separate region.
> 
> For all others, it looks like 16MB is more then enough. For example, Arm 
> has only 4 used pages (CONSOLE=0, XENSTORE=1, MEMACCESS=2, VUART=3).

Then the question goes the other way around: Why 16Mb? Won't e.g. 2Mb
suffice?

> So will you be okay with reworking of the comment to:
> /*
>   * The guest magic region holds the Xen-reserved pages mapped into the
>   * guest's physical address space. The only real constraint on
>   * GUEST_MAGIC_BASE/SIZE is that the region must not overlap guest RAM
>   * (the GUEST_RAMx banks) or the emulated device regions defined above;
>   * the exact base is otherwise arbitrary. Here it is placed in the 
> unused gap
>   * below GUEST_RAM0_BASE (0x80000000), but a hole after a RAM bank 
> would work
>   * equally well.
>   */
> 
> And add to the commit message that:
> ```
> A separate region for grant tables will be introduced at the same time 
> as the introduction of the grant table for RISC-V.
> ```

That's quite a bit better, yes.

Jan

