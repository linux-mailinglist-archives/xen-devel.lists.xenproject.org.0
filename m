Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI68LU8i1mklBQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:39:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC13B9FB4
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 11:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275538.1561323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPMp-0007WZ-Qw; Wed, 08 Apr 2026 09:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275538.1561323; Wed, 08 Apr 2026 09:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAPMp-0007TY-Nq; Wed, 08 Apr 2026 09:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1275538;
 Wed, 08 Apr 2026 09:38:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAPMo-0007TS-OB
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 09:38:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAPMo-00ElvW-43
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:38:34 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d62218-e002-0a2a0a5209dd-0a2a4508dd3a-26
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:38:34 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d62219-fab6-0a2a45080019-d155802cd034-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 11:38:33 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4889e045bc6so41717875e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 02:38:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c530910csm16397895e9.2.2026.04.08.02.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 02:38:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775641113; x=1776245913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOlgplv192aU92ntRM7Klvodu9hR8WTYXz2a9pOiR2Q=;
        b=TVYpaEXbyAQChGEpVIF4Vmi0wtT3xE6z4RmQON8oR7sG857+qpTfuV1xLlgjyu0cFu
         Tbz6zZz7xzsYY0hLcFSYow6Gw48g17cLuROrJJFAxNTvds3IO8VfqASyYhqZJatwLpin
         dLLxi8t9vh/RUqegGgOgAzvBlBVHaUi8Nrtjgha5nr1AcwLmHOc7VgcbMAqpWO5hZmzT
         qq/PmYNCoCzc032ZsvyuGnEjThMlbM8iLRjCR2qClwuCH0XrvLp9bGbKkPlT5xfrxOkJ
         YsZcYfOhhn5ZaoMaogqUSeVgrtpTHXQeRECPZH4fbBz5JItcN0eWMDpKBiqXFInOdNL7
         Nlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641113; x=1776245913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOlgplv192aU92ntRM7Klvodu9hR8WTYXz2a9pOiR2Q=;
        b=oo+6I6HraJ2cnX4F1TyEPDMuqjOxBun42AmfQO96BTwlGOc0NxTW3PD3RQt1tKdk9J
         XdHr73AtVXTaLgTvkcan5DffnIdfvtE1YQ6C47BV7OBz19mXIOV0P36jjecRAR7OwAOT
         7VGsqcBLIgaseNedz/ryUthBWCbm31mVfLM6c8uPR9LAXf8q5yuHb9An41kixABraAWW
         onerPA5AVkXtE1OTGqcT2fezGihKS9N+hWpypaxdFsnfPm6ZC4Jy7HByRoieOSInYDO1
         MZk0MCtJl135cDRemUOt743mI0sbUlhhYrS6WBmN5EZ4qBMPR+eckNjIPy9hitfgFKZ9
         I5kg==
X-Forwarded-Encrypted: i=1; AJvYcCUkT4zjrZ9FhMebed/mqk5lTyXJcUb08IKWzRz89nwaDG0KZwt0OTwvUUO5GKBYaZ0FGY4UDQ6V4WI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQwkt22WkMtL0/1gcLD0a3lr2nKhGN61xI+TVcEksS+nn0qOIh
	GfP7tznAObQ6S0oAV4I3GCWPmKafQuV/mI0rI39hF+WTgh1+i0Xk5hTB
X-Gm-Gg: AeBDiesNGGw04INAtqTU3aVpYPLZaOYTB5JJi29CfPpR8XvqC/F/9YWNwaQph8kXA3c
	8x45ci1BnSUyn/m5Qy/AOThYCzHtyEB7CTuadRPLpimRUGxAbujGbyaHoVpLdqt4iEpIE3vnVBY
	lw7aGR397CcEpFdtV7Dvojz89t8mHcK3QWGRpefkraYNyzgSI+zPYRbqsZDc+yxQ4jBuyeTTXFo
	fk0ryt83wprj531N97pM+qn4HhVfvhpgrOGBZFUYFcM2J4bel7UNLLGglgOjGf+P39xG778X6AV
	kd9Bh7Rqngzw4YSopjfTX+FWH6Xi5+3xxlBXDxpuVP47gkZFHdGJ6Av1MkvLNNn9KkBpPD3iwXz
	ikepsJDSexRoze3FIKETQYB6q85j6bF6D6FXDtASlCNjHcNRo+eu7iXOyEav55DPSKFOurkO90P
	VsVvR4ieuyPWjDxwIs2les7ErShA/Cpa+1BiRkNYHW+uk5FXDLzpLgG1misoYw+aVHqqLieCFhC
	8s=
X-Received: by 2002:a05:600c:8716:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488c683bee3mr29747625e9.9.1775641113286;
        Wed, 08 Apr 2026 02:38:33 -0700 (PDT)
Message-ID: <349481ac-544c-4c95-b919-c1936491c61d@gmail.com>
Date: Wed, 8 Apr 2026 11:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/riscv: add csr_read_safe() helper
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <f870d5def964ee06471d6dde0f66d6585eb5ca36.1774863161.git.oleksii.kurochko@gmail.com>
 <f28b1c99-9d84-4338-9278-b85cf283e7ef@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f28b1c99-9d84-4338-9278-b85cf283e7ef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775641114-F6F4A497-B87DB1DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 1354
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: 27BC13B9FB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 8:30 AM, Jan Beulich wrote:
> On 31.03.2026 21:04, Oleksii Kurochko wrote:
>> @@ -78,6 +80,38 @@
>>                              : "memory" );                        \
>>   })
>>   
>> +static always_inline bool csr_read_safe(unsigned long csr,
>> +                                        unsigned long *val)
>> +{
>> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>> +    asm_inline goto (
>> +        "1: csrr %[val], %[csr]\n"
>> +        ASM_EXTABLE(1b, %l[fault])
>> +        : [val] "=&r" (*val)
> 
> Why the & when there's only a single insn?

Agree, the & isn't needed here.

> 
>> +        : [csr] "i" (csr)
>> +        :
>> +        : fault );
>> +
>> +    return true;
>> +
>> + fault:
>> +    return false;
>> +#else
>> +    bool allowed = false;
>> +
>> +    asm_inline volatile (
>> +        "1: csrr %[val], %[csr]\n"
>> +        "   li %[allowed], 1\n"
>> +        "2:\n"
>> +        ASM_EXTABLE(1b, 2b)
>> +        : [val] "=&r" (*val), [allowed] "+r" (allowed)
>> +        : [csr] "i" (csr)
>> +        : );
> 
> Why the excess colon?

Missed to proper cleanup. It could be also dropped.

> 
> With these adjusted (again happy to do so while committing, so long
> as you agree):

I would be happy with that.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

~ Oleksii

