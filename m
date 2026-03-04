Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHAAOfVYqGlQtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88707203C2F
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245724.1545090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxold-0006jB-1M; Wed, 04 Mar 2026 16:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245724.1545090; Wed, 04 Mar 2026 16:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxolc-0006gG-TV; Wed, 04 Mar 2026 16:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1245724;
 Wed, 04 Mar 2026 16:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDHP=BE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vxola-0006LR-Rl
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 16:08:06 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 544d2007-17e4-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 17:08:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso3992643f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 08:08:06 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48518839ae7sm52908465e9.1.2026.03.04.08.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:08:04 -0800 (PST)
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
X-Inumbo-ID: 544d2007-17e4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772640485; x=1773245285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vqxBnM8tsYWxs4qD5MGZGFVyVPe8myeroZllsVPZb60=;
        b=cDu45fXFLSj4kw1Yk1WwEvpRpstRVcY+L5VJGyWS59R1mxgRvDZ38IzyVAxiiNHlzg
         KLHlXIjieplQUQmgGtRr/ePxNa/v8HU9yAOdW/XmrLqzp+NpgQO5iQ4feC3S/KrGFLj5
         ofbh6K4W5eAbjhURlYIxz76Edo4xSu+armymDs5qRQj2y/tg3KQY731bv2QV4tFQSp7O
         LPf3Tsx3d8LTtbQGilbypCRe+inef8pH1OT/VimmycQhpdoHh1YQCKnSS2R91xrl2IPA
         +UJ8pjFm2ceGR+VOgcOa07bFRNeZUXcasXO8kbzR86sa5XHsyDw9w6Q8E96zmdgb3Jux
         DrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640485; x=1773245285;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqxBnM8tsYWxs4qD5MGZGFVyVPe8myeroZllsVPZb60=;
        b=Aq6zvoA1Bg3Zc4GPgkcKFTHYfIeabU6goQzGfIFzRw/gfvNVJ21wM0oavOdLTlB63y
         WkWPtqmPnPwSukD7Cu/5wcyf+CMfEf/qA4ciDGhNvVe33LXc34hjPzdKLlle81ycHHWJ
         lrSDDIAhAwyKuyntrcMi/hNvZxAsuBKmSRWGkvl1+AnpCXx4qfZqE6NLgZfcUmqKnygh
         S/dF7SIaeCCRltsXM7WxWal0FTLPn76UL58TmgOX3R8dKBpGJzSVVFLIfGGE3TTTyS1r
         gBjv/H1FjGdpvlhga/x9paU204So37B30dNIGrOk0bxsZ+ee5q6AIWknH1Vqjh3/heFs
         cfOg==
X-Forwarded-Encrypted: i=1; AJvYcCWPuAeZkCTTARU78peTxh86A+a495RB1lHemGTPdLbrY83wE8mUbznY8rn5YrM+Uk8Wge3hYU+hJVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxozTb7SiwRyr2zcimKfaXE4K3PqrdJnYfaNM2130HwSQ4kcrqo
	3p4k+L0ZqzYSgFCnCjkUAf/VWaQ5j6cd3fxqM/AY8Sh2mciLvxgxGKnq
X-Gm-Gg: ATEYQzw64VOzZ5nT2jLRWjfM1EmBkFUyznrpU3a94kQf2Y5JIMwIghZ2sreGHPWdbL8
	A7GU9hSM8h+bRM0oroMF60znIYrLMZI0jNHvYCKB0BL1LV6Cma1vLskbRgf4q/00EIwJLOVYg6Z
	2pEYehv3qyqFIYJHhFyTP/B0LA9oodYcGM6YFyzmNysUI4nzZYscALe/VQKg6aVTLbsh5gugG+R
	+aH9lxboQjRKgySn5ulGhQePv+jAkrTfGtdpTCJcZYNjPp04Z2elYQp7Bi3D4ZGAKA4sFkjPAL/
	RyScjrMQiVKoARg+IqRVGEHs77ufueo85UyPu8680XqyIJ/hgpOHhH4BRhY8aEDMRTdulK5aeSH
	MfCRinAnRA93emBSt1NaactWINpuzTtoKUXaguHwet3CqvK1CKBnjpuqF4qsie1hobxC2r5KOqc
	Ylm2iabGzPAnkPqxjtiR7YdRg4uPjE8oJ7BDY7lq1+KqLO6Bbru+urITiv8SilpMIlrDZnxCR77
	go=
X-Received: by 2002:a05:600c:4e8a:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-4851989fb4cmr37601565e9.30.1772640485310;
        Wed, 04 Mar 2026 08:08:05 -0800 (PST)
Message-ID: <b022ab3f-4496-41c2-b24d-2718eae27448@gmail.com>
Date: Wed, 4 Mar 2026 17:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
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
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a17b6a117726904a9384dc7d9cc140672d3b0453.1772016457.git.oleksii.kurochko@gmail.com>
 <4b67f8cb-43d4-4f18-b2b6-156e21330887@suse.com>
 <7e1f3962-2dd0-4843-8976-40452437a52a@gmail.com>
Content-Language: en-US
In-Reply-To: <7e1f3962-2dd0-4843-8976-40452437a52a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 88707203C2F
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action


On 3/4/26 3:54 PM, Oleksii Kurochko wrote:
>>
>>> +    if ( riscv_isa_extension_available(NULL, 
>>> RISCV_ISA_EXT_smstateen) )
>>> +    {
>>> +        INIT_CSR_MASK(HSTATEEN0, hstateen0, _UL(0xDE00000000000007));
>>> +        csr_masks.ro_one.hstateen0 = old;
>> What guarantees that only r/o-one bits are set in the incoming 
>> hstateen0? I
>> can't help thinking that to determine those bits you want to use
>> csr_read_clear() (or csr_clear()).
>
> Good point, then after INIT_CSR_MASK() it will be needed to do:
>   csr_masks.ro_one.hstateen0 = csr_read_clear(CSR_HSTATEEN0, 
> _UL(0xDE00000000000007));
>   csr_swap(CSR_HSTATEEN0, old);
>
> Probably, csr_swap() isn't needed as it would be good to have all 
> writable bits by
> default 0. Of course, except r/o-one bits.

I came up with the macros declared inside init_csr_masks():

#define INIT_RO_ONE_MASK(csr, field, mask) do { \
         old = csr_read_clear(CSR_HSTATEEN0, mask); \
         csr_masks.ro_one.field = csr_swap(CSR_##csr, old) & mask; \
     } while (0)

~ Oleksii


