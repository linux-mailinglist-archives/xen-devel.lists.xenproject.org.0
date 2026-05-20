Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFwOFtViDWquwgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 09:29:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CBC588F5B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 09:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313621.1583748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbLm-00036d-1q; Wed, 20 May 2026 07:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313621.1583748; Wed, 20 May 2026 07:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPbLl-00034z-TI; Wed, 20 May 2026 07:28:17 +0000
Received: by outflank-mailman (input) for mailman id 1313621;
 Wed, 20 May 2026 07:28:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPbLk-00034t-4u
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 07:28:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPbLj-004c4Z-HF
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 09:28:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0d628a-bab6-0a2a0a5309dd-0a2a4501a232-30
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 09:28:15 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0d628f-c1f2-0a2a45010019-d155dd2fc170-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 09:28:15 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so2439129f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 00:28:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19a0csm49169685f8f.20.2026.05.20.00.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 00:28:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779262095; x=1779866895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=06X7VCmR5DVVJrrHcUBqQOGLtGl3uUt17K//J3YuTPc=;
        b=ncCCa9O5tLsEM9C0EPQpBJG4GlwiOKa6iUnoovpk+ZPgUhrbND2/UjJwWDygvYZCQj
         oDai5H8N8xDf0Seb0KnlGljxFZENjAbksrB32neQQvdf4+KqcnhlRqJGlfOrZ6/V1UlW
         AthFV0FrjDLyrEf/Tpu+tVFmt0XcteBXEF/Coey7zl1+BD/9A05nWiQhL8ScIID+m39l
         0vK5PE0SuZlj+o8CQImJ8jUrbwu14IzrWdiep+nktpyMB56TQMD19IF2l7xXmJ8AKYME
         9EMDgsrFpig/bgQ0ADgdJW83EK3NXGmwWVTOUDev2FRV/bb+0Q3GubN75YtguZuqd+z3
         4Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262095; x=1779866895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06X7VCmR5DVVJrrHcUBqQOGLtGl3uUt17K//J3YuTPc=;
        b=NYykLB2dhMbVtHR1YsrSSNHNw90E2fNWDBWEvW3Q71igWogz2bvXmxEYxzr1PZeAsL
         PgzYpQ5JPJUcKyKYXetT3+VHZ8gDBcV/VlOFrnC8J6O6n0Bkvo4KVbfzygM4ivgIdfT4
         UctKOi/mKRjnDjeIK5g7zcvwZrqwU/Glqfb5CkknkhHJyh0kERs6KKSpo58kDyV4Drv6
         rI3bkROOM8deAwx4+nUwrG/TytK1MxiFxifMF9V3oN8d3EYBfrXOkXkiokCCQle4VlfL
         Xdh8XGCRa1GbTvugiR2r1ZEooSOtZjdRCHMQPV5Kf7aI0/J3X5evWBF7AnrqWDZ6wqUZ
         9HUg==
X-Forwarded-Encrypted: i=1; AFNElJ/zAqf8bzsgCyo2aRzqzwRi1yQ+M1mHFR+DR0O6Cu5Oa4RzHkU845pSkuP8NZKDjcKXNkso8x3/rYk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyA6/Z0RKcsAZDxFhgVWL9IxtR86ViP5H+2hfye9XX7wYcCoFnr
	IBm/UHA37vlOUVYbF7C5GOBNnVklSAHjoZAOhwqxvH2PatRmqG4N+msZ
X-Gm-Gg: Acq92OGJr4oqewlzP+CMoe/hqJJAJ8isywFemrhm/stb3SBNjEljeunRDFtOfnQFBRu
	h04Au+06pxAph8gVqcfgapXu5dBvvrGwBgtCuMyQK+tqxww24Mm25tjXQYEXu2UOFCQqscO+P3S
	+jLil17jcraQt4ADm30O6UmuyyOiY69FDz4wt2e+4XVNXNW7P3jeZ2Ci2Enq4HW+mKxbaVZSA3t
	U/3DkvAEPV2SUmf0T/onJi1lUAOMiFVmkuoCwU+o+FZcZPXFx0apZorThMSKwEGUk1tJg6rrujw
	oet7JZeJGbZqMropEMU/1G4mAKFT5wfQFH4pgS/P4WTpocJc1q3gyARPMx71NH0ZMmv5EpVgtVp
	1cICl/5cdbm5UFtv3fnaeIzphFzSGe3x2jIvQO4052AqhZy7r7VY+es+KjwJWtl3Th6g2I7XZsN
	Tti3Z7s58J2Z9PMCKMeyVhnsAsmd+5HNkPE6uNlyw95S35/Sl6GkeHf0TDUz87zTepwag/xViiT
	SU=
X-Received: by 2002:a05:6000:1aca:b0:43c:f247:4792 with SMTP id ffacd0b85a97d-45e5c5be70cmr35961504f8f.12.1779262094640;
        Wed, 20 May 2026 00:28:14 -0700 (PDT)
Message-ID: <749658a9-e32a-4681-ab30-2984e83b5396@gmail.com>
Date: Wed, 20 May 2026 09:28:13 +0200
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
 <a89475bf-b1e3-4ee4-af13-f86f1602581e@gmail.com>
 <a6e8a461-74f1-473e-92f6-ac2d32823d07@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a6e8a461-74f1-473e-92f6-ac2d32823d07@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1779262095-AFD51FF4-71A79FA9/10/73395122804
X-purgate-type: spam
X-purgate-size: 2244
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
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
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B3CBC588F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 8:13 AM, Jan Beulich wrote:
> On 19.05.2026 18:21, Oleksii Kurochko wrote:
>> On 5/19/26 5:56 PM, Jan Beulich wrote:
>>> On 19.05.2026 17:17, Oleksii Kurochko wrote:
>>>> On 5/19/26 4:53 PM, Jan Beulich wrote:
>>>>> On 19.05.2026 16:49, Oleksii Kurochko wrote:
>>>>>> int init_guest_isa(struct domain *d)
>>>>>> {
>>>>>>         int len;
>>>>>>
>>>>>>         bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
>>>>>>                       RISCV_ISA_EXT_MAX);
>>>>>>
>>>>>>         len = build_guest_isa_str(NULL, 0, d->arch.isa);
>>>>>>         if ( len < 0 )
>>>>>>             return len;
>>>>>>
>>>>>>         d->arch.isa_str = xmalloc_array(char, len + 1);
>>>>>>         if ( !d->arch.isa_str )
>>>>>>             return -ENOMEM;
>>>>>>
>>>>>>         build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa);
>>>>>
>>>>> At least ASSERT() the success of this?
>>>>
>>>> I will add:
>>>>
>>>> ASSERT(build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) == len);
>>>
>>> Ehem. Please check how ASSERT() works (and the difference to BUG_ON()).
>>
>> Condition itself looks correct for ASSERT(). If build_guest_isa_str()
>> returns value equal to len then assert_failed() shouldn't be called.
>>
>> Maybe do you mean that it will never fire in release build then yes it
>> should be changed to BUG_ON() and the condition should be inverted:
>>    BUG_ON(build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) != len);
> 
> No. Unlike in BUG_ON(), you can't use expressions with side effects (i.e.
> also function calls, unless they're const/pure) in ASSERT(). That's
> true for standard C's assert() as well, i.e. not Xen specific at all.
> (We do, however, diverge from assert() in another aspect.)

Got you.

Also it could be in release build that build_guest_isa_str() won't be 
called at all because of how ASSERT() is open-coded:  if ( 0 && (p) ...

Then probably it would be better to do in the following way:

if ( build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) != len )
{
     XVFREE(d->arch.isa_str);
     return -EINVAL;
}

return 0;

I am not sure that -EINVAL is the best one option but I don't see any 
better now.

~ Oleksii

