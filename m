Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDCiKWF7EGpjYAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:50:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198735B7277
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 17:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317055.1586341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQS96-0003NN-BA; Fri, 22 May 2026 15:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317055.1586341; Fri, 22 May 2026 15:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQS96-0003LS-8M; Fri, 22 May 2026 15:50:44 +0000
Received: by outflank-mailman (input) for mailman id 1317055;
 Fri, 22 May 2026 15:50:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQS94-0003LM-MX
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:50:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQS93-00FfXi-S7
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 17:50:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a107b3e-2eae-0a2a0a5409dd-0a2a450aeb58-26
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:50:41 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a107b51-56b3-0a2a450a0019-d1558032c53c-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 17:50:41 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so3690765e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 08:50:41 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490469f61b0sm13486875e9.5.2026.05.22.08.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 08:50:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779465041; x=1780069841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sX2K4KCddfv1i4sz/GYUKTCGVOTl3GP+PCJyiNQVoig=;
        b=pwU9tJv+Z8W1Jb5XHOIyFv1CIEOT/Ip5ZmWOLtwF2B5UrSvjHNNtLsC0E70Jz1bJjQ
         8rR/qXG00weZzIBSep1WtdCJwrkvrQ3iwRle8efSyqPitnAy3iZkfovDUY8pz3FIzQs4
         vPU6o6rDjwlivoNThsHxqLTiuZb9/SBvUGO4V4D8kUhERhNANsx+Iz1PptLeADDVsdqC
         GGrmAD1lMFger40H5wEDPIqrvFfUKaNy5Iy4Y4fbESElpvtDBv9eNa35jUJJDa17R7J6
         HrjGbCSIPqSEwFVnO9wE5sEi7Y46Rnk51glwGBajmdmyF2PiX378AeSEAnnqnu7iDphm
         lP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779465041; x=1780069841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sX2K4KCddfv1i4sz/GYUKTCGVOTl3GP+PCJyiNQVoig=;
        b=V1ZRcsLYMsWA5bg7guqHu7GwL+QBZRX22qgkAKcrXqwOqBSAykpwPdcyAy+ocb+FQn
         8mvZOXU94+MUW7FPUwiriN1Hs/t5ivS+YGdYnxszZxQp/X/U4Mn7ftzLE3qTHNxgyViE
         ng6sXuSVjRIffT+OJziKu6d2ax1Albln3ANA/uWy6jbQ0/Aau/C48pUdRG0FWLGkt+eo
         dFTQmzp0tNTsZCDOtpgh78mzPTXAcT2luvY8G9Xs9es8vYkXa6FljiUp9usS4eNg6S8r
         PPIW/0fb5q1tOVKQvdKDN1WHr+GgrBIe39S6oV97so1R4lATX1wHypnNUmTao9Fs2BnW
         Xo8A==
X-Forwarded-Encrypted: i=1; AFNElJ9/0SuaeCr8SyLrsW5U81li0zJlVGFvF/N6y0MgeejW5ifpPMOfSze758A55zDx5BF5ZXCiIFk1pOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK0SatJcwtnHodoqYdjx/RXVC+bGYLqkO1r7Mkl8VHgRaV4JQu
	lb4Wgv3Q3SVl8e2Qtp71rL9GBciCw/e0PJ72dcNilR6QusMad6HcW1ec
X-Gm-Gg: Acq92OHqYcQA0+AnpDrro47wVQdxWkXavWicWaf4n/r8WoevpGf47sdXKhLLy3TisRq
	vOP5L8DXYIsogM0KQVXsgi8Xt2CC6ycO2r68c99xYxJAiSqAA/+9HTlY1BK/PyK4jEuIIsyvKW2
	TBkSL9A7HTU1W64H5BNsw9X8sBy8CgBcowPl7NkxE2+4ZpJtCrotM1TB1Hk1coAXPFuK2X8A8Fb
	Xc3axQCDRKnn+Q4RKJWn1hH7v0lYTl4SxrrKT+yD/fV0bj4yeMy8T4XMKXE0+yR8DofRCWjDWqA
	2ckC0ozDcteLK5QNHWEWuPUNtM+/t/UvGKDQ9LoJd1XjpUhTV+jMfFTQT6+SZL3kKFBGReoJrBZ
	F3jMiDdkhXPgNWkr0N2yoHrSh08FgWnoOMgb0qH+OX4BBK9tZvjlDzZaP9DQjKFZFxKhcESapLD
	HFB0N121a/kdb552FFQNmwJspmogHukCgu4nMYoepmTl5Oify+KAtoTvcIB0m7c18LhP3ux1HDC
	gM=
X-Received: by 2002:a05:600c:3547:b0:48f:e230:8cab with SMTP id 5b1f17b1804b1-49042adfb3fmr60331845e9.31.1779465041236;
        Fri, 22 May 2026 08:50:41 -0700 (PDT)
Message-ID: <00f7f34e-c5be-421b-bdf4-dffa84908445@gmail.com>
Date: Fri, 22 May 2026 17:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/26] xen/riscv: introduce per-vCPU IMSIC state
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
 <2471b51e89aff30765433d88b1646c5b2c72b5c2.1778250616.git.oleksii.kurochko@gmail.com>
 <e5ce9b16-c692-48bd-9b3e-c4346fd8f797@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e5ce9b16-c692-48bd-9b3e-c4346fd8f797@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1779465041-7C47E8B7-709D9EFE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2886
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
X-Rspamd-Queue-Id: 198735B7277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 5:24 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -16,6 +16,7 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/macros.h>
>> +#include <xen/sched.h>
>>   #include <xen/smp.h>
>>   #include <xen/spinlock.h>
>>   #include <xen/xvmalloc.h>
>> @@ -56,6 +57,16 @@ do {                            \
>>       csr_clear(CSR_SIREG, v);    \
>>   } while (0)
>>   
>> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
>> +{
>> +    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>> +}
>> +
>> +void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id)
> 
> Some people will demand that "const" be omitted in cases like this one, as
> it only works ...
> 
>> +{
>> +    ACCESS_ONCE(v->arch.vimsic_state->guest_file_id) = guest_file_id;
> 
> ... as long as vimsic_state is a pointer (and not a sub-structure).

Agree, it works only because of a pointer is used. Lets ommit const then 
here.

> 
>> @@ -312,6 +323,30 @@ static int imsic_parse_node(const struct dt_device_node *node,
>>       return 0;
>>   }
>>   
>> +int vcpu_imsic_init(struct vcpu *v)
>> +{
>> +    struct vimsic_state *imsic_state;
>> +
>> +    /* Allocate IMSIC context */
>> +    imsic_state = xvzalloc(struct vimsic_state);
>> +    if ( !imsic_state )
>> +        return -ENOMEM;
>> +
>> +    v->arch.vimsic_state = imsic_state;
>> +
>> +    /* Setup IMSIC context  */
>> +    rwlock_init(&imsic_state->vsfile_lock);
>> +
>> +    imsic_state->vsfile_pcpu = NR_CPUS;
>> +
>> +    return 0;
>> +}
>> +
>> +void vcpu_imsic_deinit(const struct vcpu *v)
>> +{
>> +    xvfree(v->arch.vimsic_state);
> 
> Better XVFREE(), for the function to be idempotent.

Agree it would be better.

> 
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -11,6 +11,7 @@
>>   #ifndef ASM_RISCV_IMSIC_H
>>   #define ASM_RISCV_IMSIC_H
>>   
>> +#include <xen/rwlock.h>
>>   #include <xen/spinlock.h>
>>   #include <xen/stdbool.h>
>>   #include <xen/types.h>
>> @@ -61,7 +62,24 @@ struct imsic_config {
>>       spinlock_t lock;
>>   };
>>   
>> +struct vimsic_state {
>> +    /* IMSIC VS-file */
>> +    rwlock_t vsfile_lock;
>> +    /*
>> +     * (guest_file_id == 0) -> s/w IMSIC SW-file
>> +     * (guest_file_id > 0) -> h/w IMSIC VS-file
>> +     */
>> +    unsigned int guest_file_id;
>> +    /*
>> +     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
>> +     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC SW-file
>> +     */
>> +    unsigned int vsfile_pcpu;
>> +};
> 
> In the comments, what does SW stand for? Not "software" I assume, as
> that's already expressed by s/w.

It is a typo and it should be VS-file.

Thanks.

~ Oleksii

