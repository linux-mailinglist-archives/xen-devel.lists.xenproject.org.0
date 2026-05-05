Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH1GEDLL+WmFEAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:49:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F984CBCF4
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:49:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300552.1575083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKDKx-0006oX-62; Tue, 05 May 2026 10:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300552.1575083; Tue, 05 May 2026 10:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKDKx-0006lj-3P; Tue, 05 May 2026 10:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1300552;
 Tue, 05 May 2026 10:49:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKDKv-0006ld-JX
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:49:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKDKu-00DbwM-VS
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:49:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9cb23-5cb7-0a2a0a5109dd-0a2a450ad7fc-8
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:49:08 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9cb24-56b3-0a2a450a0019-d155802cb89c-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:49:08 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so57496285e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 03:49:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d149de41asm24880285e9.2.2026.05.05.03.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:49:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1777978148; x=1778582948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KzjOlkiNB7SnTWeAjHaOHXklT9eln8RhKriTJ6bsVqo=;
        b=dizDiL7unM39oBak7g+sjUcQvu9T349hS3QAtfo8YUXak7NFMepNERxVEGPJnNxUiF
         ax/wZSyX7YTbDBjBhBca3ede7nVJ5SRZpO+/WyDzVY8zCeDwRK1NGW++nBSFMr0C9fFV
         B9WGp5iaKpTcRmaDTaWvHU29k1QYuAm3x8DVm0cYgKqbKhF2TAiy7PZviac4ONEmR5vI
         qk5FDMMuYVITC1osxeZf3wDMu821DUnkL945bA1dzFFaetdW9pb3+1ZUskSaoO1gm+yL
         RFUjJ5EuZZpWz7ahTXVcWKnD2p38pfDVaWr4BOw9yrWHcZGCKWbubYXcbf9X1V5a+xLi
         ioWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978148; x=1778582948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzjOlkiNB7SnTWeAjHaOHXklT9eln8RhKriTJ6bsVqo=;
        b=sfjrZ0x3Ex/lDtavH8j7zzXdRUKQNT8FDIFNFbp9uiN0WpJmtXjtYIb5MjgesreJo+
         290l3sr/CznGtLR7Ek9ydpv7y5wI5OUbFxI55JBnBnaMa4z121PTG9/ak/S8MYT4LwHg
         2EWl/J68gPr++3W4iig7CE49i89pUseqvxsWv1yRWxIpM1A+8oK2+Yfjm2Kld0B31ZQo
         z8tZ8lXhWhZjRFdpXiVmgFTORtygEx6xztatShn1a/qXGeXGDeG66mRqbTdaGvEtoQRo
         MemPxlpC+6Cg6oOKQgR33jpknxIucHjrzHZFb9u75pMZ0bPetn+YWZKKAGYLXB2f87vP
         VnQA==
X-Gm-Message-State: AOJu0YzFR3/u4ScJZKNUy/60KmD8wRgfMKDJzi/41P/6zWabmOjPSCxV
	WTFu+Vr/7uLx7rNUlWMylh3IKqx2m8g8aaRa1b7lCuDBYkAYpyT/9ToGtUIqjNc0gA==
X-Gm-Gg: AeBDiesUSPAptBCx8aqZnmyzgw3zJ9fdDCcCf6xXWug0UPdBGAx1vtSfSc+9Usf2vgM
	lA4VXxZy5naLhQ4Nmkz+dUnKm5SeLx9eQIJw7nkbwFuWeaZ9OPuivFMKcKMJZnlWdWRmdUUZtYD
	3nxCsJW6RCX0lvRqdp6RalCVQR7auV/3jnJF4c2MwPxKJlskTTu8qrOxyT/juo2eq3iKT2vQwzX
	Y4Wx3hqcqhiaZQyyfH6U/7bknAK4snOGuPwZ2kvIltW4PqRiUBUNz7DK42vZcru+usDH8ILpE9x
	6Ky+k82Bh3/5SEqFXCgJeOBZfeTHxteRy/tew+fHczxVh8j/4HKtkpcIkwVLiEhJv10FOlpzELn
	dyEY7cAGK+o8B6YYUZiZhgH2FrFmmAIZzgCjLAnTwRGylaiJanb0S3GYIh+6b35j2d55WGy/QQ1
	jX+PWoVIc0cYFkQ2fyZSq1/bN1OSihjzBOm4lzgimrR8Bs/t9gwosYHT7+70dk9bor6iRLXFFYc
	0RC/iScBrvm2CDmTIJIk07Zvg==
X-Received: by 2002:a05:600c:a411:b0:48a:7b55:12a6 with SMTP id 5b1f17b1804b1-48a980fc3e7mr162675315e9.0.1777978148121;
        Tue, 05 May 2026 03:49:08 -0700 (PDT)
Message-ID: <0267eb6f-1161-45b7-8905-d7aecb78e74c@suse.com>
Date: Tue, 5 May 2026 12:49:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/pdx: account for frametable_base_pdx in
 generic pdx_to_page/page_to_pdx
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260430125103.401811-1-michal.orzel@amd.com>
 <20260430125103.401811-2-michal.orzel@amd.com>
 <afi7HUFoDYabM9VV@macbook.local>
 <65ecf1c0-0844-4ba9-a250-a94aeaf4d251@amd.com>
 <afmYf-ldUxWQXRDL@macbook.local>
 <309b2ff6-c200-47d0-be3f-ec289df641c6@amd.com>
 <0a3583df-2682-426e-a704-aa8711caec0d@suse.com>
 <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
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
In-Reply-To: <a90db340-e569-4f77-b5df-dd1a1504f8cf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777978148-4616A8B7-D89741BE/0/0
X-purgate-type: clean
X-purgate-size: 3492
X-Rspamd-Queue-Id: A3F984CBCF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:tpearson@raptorengineering.com,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 12:46, Orzel, Michal wrote:
> On 05-May-26 12:40, Jan Beulich wrote:
>> On 05.05.2026 09:35, Orzel, Michal wrote:
>>> On 05-May-26 09:13, Roger Pau Monné wrote:
>>>> On Tue, May 05, 2026 at 08:48:15AM +0200, Orzel, Michal wrote:
>>>>> On 04-May-26 17:28, Roger Pau Monné wrote:
>>>>>> On Thu, Apr 30, 2026 at 02:51:02PM +0200, Michal Orzel wrote:
>>>>>>> The generic pdx_to_page() and page_to_pdx() macros in xen/pdx.h assume
>>>>>>> the frame table starts at PDX 0, which is only true on x86. ARM
>>>>>>> uses a non-zero frametable_base_pdx to offset into the frame table (PPC also
>>>>>>> defines it).
>>>>>>>
>>>>>>> Fix the generic macros to subtract/add frametable_base_pdx, defaulting
>>>>>>> to 0 when the arch does not define it. This makes the generic macros
>>>>>>> correct for all architectures, even though they are only used on x86
>>>>>>> today.
>>>>>>
>>>>>> Hm, I assume this offset was added because the original mask PDX
>>>>>> compression won't (usually) compress the gap between 0 and the start
>>>>>> of RAM.  However the newish offset PDX compression should be able to
>>>>>> compress from 0 to start of RAM, and hence you don't need to apply
>>>>>> an extra PDX offset there?
>>>>>>
>>>>>> If that's indeed the case it might be better to integrate
>>>>>> frametable_base_pdx into the mask compression algorithm itself, so
>>>>>> that on some arches it's a mask plus a decrease.
>>>>> The offset is needed regardless of whether compression is used. With
>>>>> CONFIG_PDX_NONE (no compression, PDX == MFN), if RAM starts at e.g.
>>>>> 0x80000000, the first valid PDX is 0x80000.
>>>>
>>>> OK, so you are doing some (kind of) address space compression (removing
>>>> the leading empty range to the first RAM region) even when PDX is
>>>> disabled.
>>>>
>>>>> Without frametable_base_pdx
>>>>> the frame table would have to be indexed from 0, wasting
>>>>> 0x80000 * sizeof(page_info) of memory just to cover the hole before RAM.
>>>>
>>>> But you don't really "waste" memory, just address space?  Oh, maybe
>>>> not on ARM as it doesn't use pdx_group_valid?  And so you
>>>> unconditionally populate the frametable from PDX 0 to max PDX.
>>> With pdx_group_valid (which this series adds) we wouldn't waste
>>> physical memory for the leading gap. But we'd still waste virtual address
>>> space and the FRAMETABLE_NR check (max_pdx > FRAMETABLE_NR) becomes tighter
>>> because the full range from PDX 0 must fit. For example with RAM starting at 5TB
>>> the virtual offset before the first usable entry would be ~70GB — more than the
>>> entire 32GB FRAMETABLE_SIZE on ARM64.
>>
>> Yet still - this is exactly one of the situations offset compression means
>> to cover. I'm entirely with Roger as to it being undesirable to build a
>> special case variant of "offset compression" into "no compression".
> In this case, if you don't want to generalize the macros, how should we proceed
> on Arm if we still need the offset to cover the PDX_NONE variant that we also
> use? In v1 I just created a local override but Julien wanted to generalize the
> macros instead. The discussion about switching the default on Arm from mask to
> offset that is not even selectable on Arm needs to wait for the new release cycle.

I'm not convinced of that. If you need offset by default, why not enable it by
default (right now, and potentially even as a backport if there's any bug that
is being fixed)?

Jan

