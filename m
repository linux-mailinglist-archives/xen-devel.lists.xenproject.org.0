Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEWMClO1iWlLBAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:22:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D389410E1AA
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225154.1531632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOP1-0001pX-QZ; Mon, 09 Feb 2026 10:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225154.1531632; Mon, 09 Feb 2026 10:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOP1-0001md-Mx; Mon, 09 Feb 2026 10:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1225154;
 Mon, 09 Feb 2026 10:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpOOz-0001mV-Jo
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:21:57 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2924fdc7-05a1-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:21:56 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso26130455e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 02:21:56 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832041f1a3sm111178465e9.7.2026.02.09.02.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 02:21:55 -0800 (PST)
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
X-Inumbo-ID: 2924fdc7-05a1-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770632516; x=1771237316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s+X4NaFjYOwIFCTiACW2xzPhIQxgMm0W4k8O5HtiGy4=;
        b=IEqHupu8vAgQpkwLe3/3ZAGSH0lrys8jhFHyiL+8qVZ1VRBUpeEytwJF1Kq8p3cuIt
         YWT5ra0wZyjchnnTHeUYyg/EBlvbXNjixRADHPmfUAVu7xrIuga9lh/5fKaOPY32wZsY
         CmPFCsZc4NZ+HkbaFVdHAyKRnBDJbdsMnpmoRe3t/ol69hb1shPXUwj4fPV419Bo/6Sl
         KKYoTMT6dNy4vcDdIZYDssimut5gx5/TZInYpV4EkmW3FRgf1jN72KS7AsnwkDctm0xx
         AAgYq1z7DKqFV2ZMXrs9A66alNoKNoFmkcIdiX6ZTn2br4ye/Rn23TLtQ6s7jNBAOBB7
         jUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770632516; x=1771237316;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+X4NaFjYOwIFCTiACW2xzPhIQxgMm0W4k8O5HtiGy4=;
        b=JKovAkKGafWPO9jLgmZnVHJp/RISddcm+hnys+SKOCpGNw1MAaAfrI+jJbmNCbYj6P
         eS6V3/9SEECK03iCzJ/k59TfJSwh0UxXSG7wD0a4E4za4l0W3U0afq0RiQgCItSKiysR
         oETT6gLumqef11+6rZ8MQNw4nppXQhGtz3YEh59YurUxKos2r1jKK8K/vi3yeijzJ0Ul
         vMaOG9N0QthRT6n0pez6cFdfiLXKYjjvSAdBqwMVUqlj8pjDTGv+/LzaQCn5vsjlGGo9
         htKY9PDlTk2rpzUaV/9x66VzkMu7rDpf4A8+UGP9yknl0sxz3wsaGV8MIsKeGY1BdDQz
         G9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6ucxpbsxKVeHF1eJJB9+NRnJIzt7wDl/Cp3WRDc4RWqMNNEjRelc+kOqkgsse+wS2xuaVsdqIzRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqDZVkA25DxD7gUqh6tTwiCxYKTWva7mX06Xs0YKlIsdA6LcUy
	4jBO1mI/b4nuTYH8LMSkvPxDhwoIqw/tVFoxu1PvWJo5picZJ3FlTjrg
X-Gm-Gg: AZuq6aKjmJFslPmfaP9WmJpMQEbSVM+Sqi+0dSCl4vtm92eLH2HASROAASx3mp1ytCX
	hUM6kMwBWr51LFcrWiYSBxx39xMB2IYP78D0hNKi/amRAkmbiUDinzR+crj3qNtn6J2XF4OzrPd
	zfEW6GnbaE4YSk6WNzN5/5ECEVoimbbR1+VSSq2NTaOAYRTaguQt4ovxPwJEOFGdna32DulCl/h
	URtQAPfdWuky1N2OQ3BlAOeCUoOSpgMoPPrI1BTcylR1jFVqV9bBaT5/iHCY1GjWN0jtHvNV8GM
	OHZppPKaVKtGDpV1PWmPR6ryq2rRAhjQsT+nORW2PRy9SpMl5zjqdBNmk5vwgQ2btaorxqPk1OP
	s0Z7YcWSHm9i6DQ1HbkjkQd6hHYPNd/pZpuV2iDtIVt1p0OZHRtiQu1zYPzIfM+5qVyGN0/FY6y
	G8TgbzkdcUYNTWNAh7QMsTy+23SWbw3PzUAQW4VY4v7OgsRQxtIqZqnRvVuATFK2E=
X-Received: by 2002:a05:600c:468b:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48320229cf1mr167334165e9.36.1770632515438;
        Mon, 09 Feb 2026 02:21:55 -0800 (PST)
Message-ID: <0574673e-0ca8-4a65-bb5e-89d475676631@gmail.com>
Date: Mon, 9 Feb 2026 11:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add support for local guest TLB flush
 using HFENCE.VVMA
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <89f50ab2c1a1c79abea4db3a53393f974bb9a473.1770036584.git.oleksii.kurochko@gmail.com>
 <309e4e0d-c2a3-4f56-ab6f-f648da313bb6@suse.com>
 <060f4338-d6ac-41a1-8036-ab506cd54bf4@gmail.com>
Content-Language: en-US
In-Reply-To: <060f4338-d6ac-41a1-8036-ab506cd54bf4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D389410E1AA
X-Rspamd-Action: no action


On 2/5/26 9:56 AM, Oleksii Kurochko wrote:
>
> On 2/4/26 12:09 PM, Jan Beulich wrote:
>> On 02.02.2026 13:57, Oleksii Kurochko wrote:
>>> @@ -14,6 +15,12 @@ static inline void local_hfence_gvma_all(void)
>>>       asm volatile ( "hfence.gvma zero, zero" ::: "memory" );
>>>   }
>>>   +/* Flush VS-stage TLB for current hart. */
>>> +static inline void flush_tlb_guest_local(void)
>>> +{
>>> +    HFENCE_VVMA(0, 0);
>> For this use, ...
>>
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/insn-defs.h
>>> @@ -0,0 +1,10 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef ASM_RISCV_INSN_DEFS_H
>>> +#define ASM_RISCV_INSN_DEFS_H
>>> +
>>> +#define HFENCE_VVMA(vaddr, asid) \
>>> +    asm volatile ("hfence.vvma %0, %1" \
>>> +                  :: "r"(vaddr), "r"(asid) : "memory")
>> ... don't you want to use "rJ" as the constraints here?
>
> Even without "rJ" it is using x0 when argument 0 is passed. Just to be 
> on a
> safe side I don't mind to add "J".

When "J" is used compiler is trying to use integer 0 (what I misread when read
about J) but hfence.vvma expects two registers (zero register in this case), so
"J" can't be really used here.

~ Oleksii


