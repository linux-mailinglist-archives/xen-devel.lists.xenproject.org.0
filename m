Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MAKbC83FO2rxcggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:55:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C36BDDEE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 13:55:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="tB7LgN/M";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1344851.1603877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMCY-0008GL-OM; Wed, 24 Jun 2026 11:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344851.1603877; Wed, 24 Jun 2026 11:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcMCY-0008Dv-LE; Wed, 24 Jun 2026 11:55:30 +0000
Received: by outflank-mailman (input) for mailman id 1344851;
 Wed, 24 Jun 2026 11:55:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcMCX-0008Do-3R
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 11:55:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcMCW-004q6n-Cq
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:55:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc5a4-bab6-0a2a0a5309dd-0a2a450a9480-38
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:55:28 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3bc5b0-e40e-0a2a450a0019-d155a72ed108-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 13:55:28 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5ad578c49afso964102e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 04:55:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cb1156asm740337e87.54.2026.06.24.04.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:55:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782302128; x=1782906928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGUV+KJQDcFdzLF1RpbSQSFUKNcHIpQJeuzPrwoMITQ=;
        b=tB7LgN/M8N39dPUNqsX9A+msxZIO46yTTJqe5SckgS7mBrzNM6DKRC+jn4Ruh/OCLQ
         QXbfi3agyHeQJdzhV7tDWeUNZqlAchFkXWPg2GFA3pHs4KmfyCP7KzgVLUQhq1WgSykB
         S8Rp+kn79LEGsuNub2VHEr2Tqs2J0v8HqS2F6KzkLwXEL+OkUHI4dCVF/8dsvvUFFCBj
         +VTScB019UTm6iWH74GUgaM4SUW2bE3wwx73vS5eJnqTww02E15TPKablx24UZd8VEkX
         nD2sikTDdGl2W+t4f9Issm6Yc/Dh1x8FAW8Ai3hp0HHmnDrAklnVpsnnUEcDapZ7SnHI
         MvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302128; x=1782906928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGUV+KJQDcFdzLF1RpbSQSFUKNcHIpQJeuzPrwoMITQ=;
        b=m2b7nLh9G+609xb9PYbPBxqx2dLe/DVPLZ6kiIltKxEBdVBoTv04lxVvdjDYIyk+le
         VK6tHaIxIl4kxuFbHiNaRfrKxU03lbulOevtvYq8vbMh/9lv72oRoRRptO8k4wYm3nXm
         WlIZlHgWYZsfwtGbq8gu5VpQWiw/nkE22JxyAvHsM2MhmieWPJG0rZ/LvH+yuhCyxIMt
         UzMbTT/FtPI5QgTwN4Mb1A8b/foag5kZoBAMu/ps6RrJIgPmh8hoOBLqkPe6vW2gnCbk
         0bk5OHmwCFLnMCkBcdye4SAEhszD9njeklaUMUWM6be4QAezfEnGymEH7E9OLz1qZ6OD
         gqYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtghCHSCLmnpfSnGQj5cDQ04jcAsQhEmxAZlru9kXvqWqLzMPuk6raAyZfStviiuCa+0h2M+80AoI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtc0Y8U/Y6mnvgzPbRQDupUhu8Sxs9bi+upi0cxSRS4gfB9sqt
	eX2KJPag49UJJ+XDiemVp9aIrdKSE/hb8Hvha7sAEwNzcchkxJ6fK2BD
X-Gm-Gg: AfdE7cnU0qD+etakN8evurYq5WQFY/EwdY4ajEFU/AezEI/3k2xK52lW2B9IlLUPDdv
	2u1r447j235YMOHUJs37rbuumThd+AJarKGB+Q8j/TiNg+hmJV8zH+kCK/Szd0h77D/G3ZmuDUY
	Deg7QtI59OzacF0EAWROfE69ZrCAitey8th/Mul/GWgIo6IUd0JjGieCN7qRbbyAMoTaK9BZyBn
	MCh7TMRBu0Y+4MMEnw6zTqXIFGXmlMzqh3w2n5En7S/9lJXTWkGEZ8E38gPCG0BsYp3EJiYNJJK
	enUcfCFc/L0QNKsKdqmpdTBh3HjacNKW3HoyE1hvkUHZFt7deDmKpzii38k9//22lHEs2epKrjJ
	gfMtfUCeDcpIuvG6GWvY9NR8gA5WL6ki44kndZ9BdLZ6IpOcbSaj6HQYbLzjWef03RxNF9656VH
	SIgBOAznD9Iu0qM6oVQ8AUMMf1CmnO67ul5fHnVQCB2Ww73gdMOVfvxtQqvZJwJ2AKzbs=
X-Received: by 2002:ac2:4f0f:0:b0:5aa:8824:156b with SMTP id 2adb3069b0e04-5ae9d58a746mr838951e87.47.1782302127404;
        Wed, 24 Jun 2026 04:55:27 -0700 (PDT)
Message-ID: <e158a473-8e3b-4306-9098-dd3eaed993da@gmail.com>
Date: Wed, 24 Jun 2026 13:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] xen/riscv: introduce per-vCPU IMSIC state
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <69b84024f185db01d62d6c9ece1b5cee0e20a25b.1781693963.git.oleksii.kurochko@gmail.com>
 <ca8ed8b5-04d7-4561-9e2e-58923c6a0f3d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ca8ed8b5-04d7-4561-9e2e-58923c6a0f3d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782302128-3D80EDDE-A7D74525/10/73395122804
X-purgate-type: spam
X-purgate-size: 1693
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B4C36BDDEE



On 6/22/26 4:46 PM, Jan Beulich wrote:
> On 17.06.2026 13:17, Oleksii Kurochko wrote:
>> @@ -61,7 +62,24 @@ struct imsic_config {
>>       spinlock_t lock;
>>   };
>>   
>> +struct vimsic_state {
>> +    /* IMSIC VS-file */
>> +    rwlock_t vsfile_lock;
>> +    /*
>> +     * (guest_file_id == 0) -> s/w IMSIC VS-file
>> +     * (guest_file_id > 0) -> h/w IMSIC VS-file
>> +     */
>> +    unsigned int guest_file_id;
>> +    /*
>> +     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
> 
> DYM "< NR_CPUS"? Else the above conflicts with ...

Agree, it should be '< NR_CPUS'.

> 
>> +     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC VS-file
> 
> ... this.
> 
> As to the h/w vs s/w options: I take it that e.g. guest_file_id > 0 and
> vsfile_pcpu == NR_CPUS is an impossible combination?

Yes, if we have assigned h/w guest interrupt file it should be connected 
to pCPU.

  In which case
> re-arranging commentary may want considering:
> 
>      /*
>       * s/w IMSIC VS-file -> guest_file_id == 0
>       * h/w IMSIC VS-file -> guest_file_id > 0
>       */
>      unsigned int guest_file_id;
>      /*
>       * s/w IMSIC VS-file -> vsfile_pcpu == NR_CPUS
>       * h/w IMSIC VS-file -> vsfile_pcpu < NR_CPUS
>       */
>      unsigned int vsfile_pcpu;

Good point. I will apply this.

> 
> As to guest_file_id: In vcpu_imsic_init() you store IMPOSSIBLE_GUEST_FILE_ID,
> yet that value isn't mentioned here at all.

Good point too. Actually I think that this definition isn't really 
needed as software IMSIC interrupt file could be counted as always 
available and so IMPOSSIBLE_GUEST_FILE_ID could be just dropped.

Thanks.

~ Oleksii

