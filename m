Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KEiIkMqzWn7aQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:22:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44837C14B
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270402.1559077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wSe-0000fl-V9; Wed, 01 Apr 2026 14:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270402.1559077; Wed, 01 Apr 2026 14:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wSe-0000dI-SX; Wed, 01 Apr 2026 14:22:24 +0000
Received: by outflank-mailman (input) for mailman id 1270402;
 Wed, 01 Apr 2026 14:22:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7wSc-0000dC-Tb
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:22:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wSc-005mml-97
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:22:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2a13-bab6-0a2a0a5309dd-0a2a450c8e80-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:22:22 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd2a1d-f40c-0a2a450c0019-d155802fdc73-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:22:22 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so55071385e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:22:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887a630901sm70110215e9.0.2026.04.01.07.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:22:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1775053341; x=1775658141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGKM4c+KwZfU+nhjGTLnKpBO8o7GVudcQfFbHy16yfs=;
        b=HLYPufP2jqf8QPxGI/5ejXZ1dDHVYH/UzAV4jX9tEmpaTp7duWAascUaTCH25n4YUt
         9DFWv3ucpm/DGWLDcpFL3bmaRasz6NH8uZub9MKnrIWOc6Yz4h1LL2Dj8sCgEMhaUrYO
         cHOLNwa9no3jiBb7b56kKEV0Jf8cteYV/tAriRExgq1nFVEMRpSJ8JzXxaRNG+GV8lg4
         4lkzIeev0sgbMTzhXW/i9HXAfm4uPDJkD5WXXEnvoGSZT67/bxal+VbGsZAxY7H+EnpI
         LPCinJv+T8U7CRCAS4Pw3SVj8u8NSVZjWEjWTxvdqumZIfn6AyPJMd8mOKQ7uyeEYmzR
         TBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053341; x=1775658141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGKM4c+KwZfU+nhjGTLnKpBO8o7GVudcQfFbHy16yfs=;
        b=TNvgWiidjovwXo1N8ub8wB3+gncGv66qSOIiCN1K/kCld+AB9+99WZ8kgJy33Lqhoj
         zVTP6IpaCPdc0b48bGNP8b1FfrmlO8LAxWgGIdMvT5B0TH5d29Uvh15p6cz0m8TgRuBP
         niMfxJrT06WRH9TPk3t4XJnKO/CM54TAB0Ph8k0FV4tvuLt/lSDptoh6kMaQ91M4VFOe
         hGxRwAdvKBdP3vUPJ1U8EkNP864Xt3vr7cYmTaX4TbKl6E/naodVXB90rDYDh6vUGV+2
         1PFBj5SpVWMFLAquOmBUqz3TcaBxfRwyb14LQsfV0pkNCyXa7ENf9j2UoHybcCtagDQH
         gC+g==
X-Forwarded-Encrypted: i=1; AJvYcCVWwBjzrhUh7MTZPPpTUebQ2dcisFeoswNL40hrRoW9LqTO7txzaWmslUW1yJjep+nsNWJoAo3JNWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpGopdVMEuV+KG2pmOEhPFk+5V62Hv/UJdq955mPl1F1zxgdFz
	jTvOz1APzXehgOkvQyhrUJSp0iE9rNgc4kNd+JI+x43lbITlkZKBRT2UsbIRXO+Wmw==
X-Gm-Gg: ATEYQzy1NcC7A3tXMgxwUCRhBJ4Q8RA+uVJrk42pG4G4366mzLVuX7ZMVJOgSmpTsBL
	+nPmj7Hy7JW5jQaAuIRYn4L6mYXECpYAEg82wuiFdwK0v2U6ILdWTqzGLFLQRWAz8NPRTITJmv1
	NqaPGZjvEj+OLGiXh27Qdy8w1UqXKfBZrCF+uH5L0e+O4sHBTi/we5Q3iAYKaX0T5GkXWwJ9pfF
	pktkKaTSWr8JevbatN/qmRyyHw74y/B0J0tNAb5BCMlVdKzEVW3kMY5Wj7dB1nW44+jqD7YvLmt
	6kELIBiF4XK69XxssJaHsevUxTERFoCKhsxk5FDH3q3II+2c0H/BfRRtbZ3KMMNYwkBjVU18Ii0
	t9wyNcWKs4xJbHaIxTjR/yb1WhWx/uiz0PTkc9DVcuYuu7HgYqnVVrEExy/Vu76/1tTZoVdFgKy
	+lzCkEG7MjYls/wcoBH9I+F8VvLlKr2086jPtEk9nc7878j4+at4MJ2xDKW+vTb4V8e42+1yR8A
	pNbrV5VPTlFj0A=
X-Received: by 2002:a05:600c:8b62:b0:487:338:b4df with SMTP id 5b1f17b1804b1-488835903abmr64709315e9.15.1775053341482;
        Wed, 01 Apr 2026 07:22:21 -0700 (PDT)
Message-ID: <ffd3a7cd-8c47-4a9b-864a-26a053b5b7d2@suse.com>
Date: Wed, 1 Apr 2026 16:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
 <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
 <dfd2a666-f3a5-4d88-b034-438f8fbb85ba@suse.com>
 <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
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
In-Reply-To: <2bae9e12-8f71-4ff0-b077-bfb4215e5e14@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1775053342-83D43A3D-04901D80/0/0
X-purgate-type: clean
X-purgate-size: 3244
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF44837C14B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 15:57, Oleksii Kurochko wrote:
> On 4/1/26 8:17 AM, Jan Beulich wrote:
>> On 31.03.2026 18:14, Oleksii Kurochko wrote:
>>> On 3/30/26 5:51 PM, Jan Beulich wrote:
>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>> The dom0less solution uses defined RAM banks as compile-time constants,
>>>>> so introduce macros to describe guest RAM banks.
>>>>>
>>>>> The reason for 2 banks is that there is typically always a use case for
>>>>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>>>>> there are other things under 4 GB it can conflict with (interrupt
>>>>> controller, PCI BARs, etc.).
>>>> Fixed layouts like the one you suggest come with (potentially severe)
>>>> downsides. For example, what if more than 2Gb of MMIO space are needed
>>>> for non-64-bit BARs?
>>> It looks where usually RAM on RISC-V boards start, so I expect that 2gb
>>> before RAM start is enough for MMIO space.
>> Likely in the common case. Board designers aren't constrained by this,
>> though (aiui). Whereas you set in stone a single, fixed layout.
>>
>> Arm maintainers - since a similar fixed layout is used there iirc,
>> could you chime in here, please?
>>
>>> Answering your question it will be an issue or it will also use some
>>> space before banks, no?
>> I fear I don't understand what you're trying to tell me.
> 
> I meant that there is also some space between banks and pretty big which 
> could be used for MMIO which could be used for non-64-bit BARs.

I don't follow: Bank 0 extends to 4G. There's no space above it, below
bank 1, which could be use for non-64-bit BARs.

>>> Further, assuming that the space 4G...8G is what
>>>> you expect 64-bit BARs to be put into, what if there's a device with a
>>>> 4G BAR? It'll eat up that entire space, requiring everything else to
>>>> fit in the 2G you reserve below 4G.
>>> I assume that such big devices could use high memory without any issue.
>> Well, I could go (almost) arbitrarily low with individual BAR size,
>> merely increasing the number of BARs accordingly. Assuming 2G BARs are
>> 64-bit capable is likely fine. Maybe the same is true for 1G and 512M
>> ones as well. Yet a some size the assumption will break.
>>
>> IMO RAM layout wants establishing dynamically based on the MMIO needs
>> of a guest.
> 
> I have this in my TODO.
> 
> But with the current implementation of dom0less it requires to have RAM 
> banks defined in compile time.

Oh well.

> Can we process with the current suggested way with the following update 
> of dom0less code to work with dynamically allocated RAM layout?

If you want me to ack such, the limitations will need clearly calling out
as such (and why it needs doing like this). Further the public interface
wants leaving as tidy as possible, as removing stuff from there is
usually not a straightforward thing to do. Ideally, no part of this would
be encoded into the public headers, if at all possible.

You also may recall that I have reservations towards this work targeting
dom0less alone. Yet that's likely okay(ish) as long as this is the mutual
understanding of interested parties (and again clearly expressed in
relevant places).

Jan

