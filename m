Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNT4H0mODGpCjAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:22:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F1582357
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 18:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313222.1583444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNCa-0001sv-G9; Tue, 19 May 2026 16:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313222.1583444; Tue, 19 May 2026 16:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPNCa-0001qg-D8; Tue, 19 May 2026 16:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1313222;
 Tue, 19 May 2026 16:21:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPNCY-0001qa-Nq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 16:21:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPNCY-001B6l-0G
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 18:21:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c8e1d-5cb7-0a2a0a5109dd-0a2a4509835e-0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:21:49 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c8e1d-2497-0a2a45090019-d155802be071-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 18:21:49 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so56658615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:21:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1a22csm45832373f8f.19.2026.05.19.09.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 09:21:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779207709; x=1779812509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/p90yQsX5BfUhGHtHAPV9H8vmOsxZLJqAoid+MyKp3s=;
        b=pilOBfhvgPxyjAIcwE1jIGo/zj7oa//s29eVFr4JREeixPvxWpqTUeLQqfKm4WGjf8
         SQxQVrkxSQBYTiLwdQqQEOj25DzLCfKXc4jB5tciGn5mMHniSKoqdPXc1qsZ46P5VX0v
         dsa/kXg47HwONx0JLnKtB3g9CJdVcPrQf4nv7Zn9Qspu7QwO3Ztl3xFVH+AgJ5pIsrYp
         nuTIbxKpy3PPwg1nr/mdSwHQaFrnwm8FAS7rZl1pnJzyXTVUF/+Gnu+f/knd2o8sUege
         v894VFZeZQ8CG1HhARUtWbXK/C3iWw+GSkq9jbNCPCUSHczY/Xfj6dWreuhVNkXYMAS+
         djbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207709; x=1779812509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p90yQsX5BfUhGHtHAPV9H8vmOsxZLJqAoid+MyKp3s=;
        b=r3fRyqhiSw0k34Xaqz7Yuk4fdORVbysp/le6GP7WxWoMMJx7w62Y8QwwsJuvZ36Bi5
         P4VajenEs4t8h0O6DeN70SIMsLiTc0HCESA7a0cLoE+e+mSorz6hcTKMnGBwOigj06yR
         rB5nn/91Pp7rudupsSw/0i9lQN1UojEEPVsNWKcWt4NpVPgmlQnpc0z8hqQ8WK4+siXp
         coTBSH/vV5PRdg9R/gZr+2fh4EGft3S1+UnCjsoG2G+D5zfx5B9FBRyqcOOv4M2l//0w
         I9dbU4fpM9qEMUllDSZf19gvgkj4m2r53OxCYsga/JsP1eCbr0Xt5DZ/wVu0fWzAMNsE
         fD2A==
X-Forwarded-Encrypted: i=1; AFNElJ8zu/Kpowz45cDetR8J1CHtFF1U8ETdtn7Q7D0fzQjz4Yaeaop9POeDWjeq8DCPQ7srkgaCzReDcYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpD+ekYi1zFjUC29aXQ9fHOUErXdiosBqHXua1CpRxpvjLxuZ5
	JYhAbuVNXZlxd7AYMA6sVUfxbBcbO+8N3rsVuVy4pUWBQJ/IWYL+xJh2
X-Gm-Gg: Acq92OFQp+aP67dRHKuBJogVXnDTIM6+OND/2h/uMFTqCuuW9urBG16C5WtJqHfQ0Ps
	23bKR07/yxCck6emW174uLSiFmEGRqFfkXWixg1owgJHHH4B78oy+mBt9cC9wi7Pqjzh/itXe4e
	xE+KxjI8DdABnHpx/FHRWEaj3CFmTXZsfi7a/63Vgarzygai2/4FEMjytbzbnT6HFwitu+n+pAI
	YWdMTMNUea6hJDBSe2d9dCHDMlhRoFLBNVpocqtOhqa4vsTjIM1aJVvUfwnnbJjxa74ZU4J4v1E
	68P22O2Q9jvs7/AlSdoVk9HtRLAo9l1Y9mo7sacBu3uUJ7u82Af4eT0tyyIYCPK92tSlNSnw1EZ
	X8PQbtH5HNqdxekRG8o/2yqGBumJBaa85Te82mSB07y1y20KC7gmqxVG+P/XD1udo0RwJCwJBed
	JTptprlJ6886yMux0trXLH3wjaNicKvdPGypkqQAUynMeiLA6KQuVJnRdyNyOGnxFcNnIzEyptt
	otCTrF4/PbFRg==
X-Received: by 2002:a05:600c:8184:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48fe60ee4admr310926765e9.14.1779207709325;
        Tue, 19 May 2026 09:21:49 -0700 (PDT)
Message-ID: <a89475bf-b1e3-4ee4-af13-f86f1602581e@gmail.com>
Date: Tue, 19 May 2026 18:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] xen/riscv: introduce guest riscv,isa string
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <b2d4f3f7f049837a25bc00bfb1d3da8b984a8b5a.1778250616.git.oleksii.kurochko@gmail.com>
 <364abd6e-4fff-437a-90c8-bb4489f0c51d@suse.com>
 <f032149e-aa99-4976-8012-39bd01d4a653@gmail.com>
 <23e8de1e-b792-4863-bd99-f529642fb963@suse.com>
 <fbd8b102-d495-4678-8226-a199554e266d@gmail.com>
 <3d9e2a3a-6839-4909-b60f-28b4c1a02cdd@suse.com>
 <fa617f4f-7057-4b59-8f28-5a014b0c423a@gmail.com>
 <3b5f681c-bda4-4c46-a96d-cd3da1658e28@suse.com>
 <8472866e-49e6-45e8-8d86-3b6b09d2c177@gmail.com>
 <f499de94-e75c-487e-bd1a-0bd3b4eda39f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f499de94-e75c-487e-bd1a-0bd3b4eda39f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1779207709-41D6FA53-BECDA9F7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1331
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E88F1582357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 5:56 PM, Jan Beulich wrote:
> On 19.05.2026 17:17, Oleksii Kurochko wrote:
>> On 5/19/26 4:53 PM, Jan Beulich wrote:
>>> On 19.05.2026 16:49, Oleksii Kurochko wrote:
>>>> int init_guest_isa(struct domain *d)
>>>> {
>>>>        int len;
>>>>
>>>>        bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>>>>                      RISCV_ISA_EXT_MAX);
>>>>
>>>>        len = build_guest_isa_str(NULL, 0, d->arch.isa);
>>>>        if ( len < 0 )
>>>>            return len;
>>>>
>>>>        d->arch.isa_str = xmalloc_array(char, len + 1);
>>>>        if ( !d->arch.isa_str )
>>>>            return -ENOMEM;
>>>>
>>>>        build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa);
>>>
>>> At least ASSERT() the success of this?
>>
>> I will add:
>>
>> ASSERT(build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) == len);
> 
> Ehem. Please check how ASSERT() works (and the difference to BUG_ON()).
> 

Condition itself looks correct for ASSERT(). If build_guest_isa_str() 
returns value equal to len then assert_failed() shouldn't be called.

Maybe do you mean that it will never fire in release build then yes it 
should be changed to BUG_ON() and the condition should be inverted:
  BUG_ON(build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) != len);

~ Oleksii

