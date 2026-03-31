Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHgyIjrzy2lwMwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 18:15:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F156036C740
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 18:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269183.1558296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bk5-0005k7-5z; Tue, 31 Mar 2026 16:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269183.1558296; Tue, 31 Mar 2026 16:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7bk5-0005hv-3H; Tue, 31 Mar 2026 16:15:01 +0000
Received: by outflank-mailman (input) for mailman id 1269183;
 Tue, 31 Mar 2026 16:14:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7bk3-0005hn-Fi
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:14:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7bk2-00CknA-HV
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 18:14:58 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cbf2eb-e002-0a2a0a5209dd-0a2a4501ba4c-42
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 18:14:58 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cbf302-6fc9-0a2a45010019-d1558031d8e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 18:14:58 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so4404095e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:14:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887ad9bac6sm31672755e9.4.2026.03.31.09.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 09:14:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774973698; x=1775578498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=My6NLtfma1tj6rNZdEmIYD5zPrvABhTYSb91XX6+nNA=;
        b=R5QEunFtD3jf5QV+iGRqJmjt0DJQ9pV8W3MnR9RmOXZZcoVfBNEoLeTq4ICcvKiuh1
         TVxzpLtIdj1C6+55SvctapP5WFN3kK7fox89J/ZVF1M4p3gHpbPuXPGNmfxUF4M0AhGc
         3LqKSixhMbI5kyYZfLPQIhU2WKS03OU1v9RFOve3PDUWRQKPcy81QOdGKFU1XWhTEcXJ
         8tszUcUlVeTlWxR2Npt2OV+XhF+2T2/h0mkZAjAfMgRxM2crpWIXPewpDg6rOpH7LTQQ
         Br26KJIh7xhxtNsXKBEU13rsSUO6id61CDM9j8Y4bn0L8We1ciuWA4fwBt/kBlhNIsfH
         by5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774973698; x=1775578498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My6NLtfma1tj6rNZdEmIYD5zPrvABhTYSb91XX6+nNA=;
        b=Vuviph79Jqk3sdueZH0FA1Y9v/zs6aqW88g5WUXAd/65T/k8ZQWP5+6HJExAev+CLV
         uhEUj/I7NIVmrPVKY1nKqLSd9clobaOq6o6aQ7MYM92gR0ZGcKhBGU0c63njYk5gHld5
         u6t1yqXHeGiP409WKeypJEQWj7T6nMHQGn9Z60S1dqjgVjTh8s2pMNSsTfN7OQVzjiEw
         h3S1X6t1ESyvhxCB8u5LcEDQzU7AJpMo6UsqJvdyBRbhTksMGRU0eWJUjCp2imTixQb2
         8l7cks7EvPGgd8DJDtejrJhvrQ2be+z56kwALEZcvU5HYUXvQpkzij49x60DztexfOs+
         bb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW988CVEo8s7AajYtvqBIcKriqzQbVVsJ8f9IEfTyIQs/XP7fm6r/4dJnAttdlUPAuk8HAyyNxlwjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKuAZ7qXUNjXP0R4EHL80aHw9bmamd+aSnRXK5tHsv67ZZTDgs
	Cr7WUzFOO0T9EINdAyv8DTj2MVHfwUQYHoNwj1Wib9NXQ8+51e/k4EqV
X-Gm-Gg: ATEYQzwhXt+Wknn54DqOBh0BaAlmBWC3xBRvkQP5VQLMOB5EM4KQgpzBQNUUBIS+29G
	4ytvHVbtoRjkiswJWc0rhMSbfd2rkP5KMh5Y25GEQPOhPaF/w0+tDl/CIuE+5IRApbSlzUPfczb
	KV1NdVk38VkCQcqd5yLGaty9JkapDodXyKZCx2HCO0OBAGNo2Bbqae/hjW0nNCZ39UP7g5RDUuv
	hZ5q5XYrII+ZIHTOwqIM5acYmTs5CkAV9Yh5hr3Pg4E/30XDI6h7eEfP5hQ8YcooA4CIiNqaeGF
	VmxYLjYZ0Dn5b0Htv3dUbsOsW1Yqqs9wF5uiqnLu6hCHtr8xZbqhDglv6Ar8StxFqeLRJjyGarI
	quRPtpI6ASHZboU+w9yNWMMuJ9sMO9wmW25pA31lG0FDmIqJ69iuJDD9PNXSD619I8tIU6EJRIr
	aLTwFWulD3gg9NdRqkdnhiNHTfWRfu6oKUQufOJ4SwwRVhyN3fIdzlyYE4XWWB3+s9jWdhNhz/B
	HM=
X-Received: by 2002:a05:600c:8b2a:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48727f5fe97mr298044095e9.21.1774973697567;
        Tue, 31 Mar 2026 09:14:57 -0700 (PDT)
Message-ID: <691be850-9145-4bbf-a897-d10a0193b730@gmail.com>
Date: Tue, 31 Mar 2026 18:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] xen/riscv: add definition of guest RAM banks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <8278256f3d270b456d19cb9891b89b88a46548a5.1774281309.git.oleksii.kurochko@gmail.com>
 <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1a3a316e-f0ea-4514-95d6-9813d6d5ca76@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774973698-B64F6185-976CA64D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3758
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F156036C740
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/30/26 5:51 PM, Jan Beulich wrote:
> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>> The dom0less solution uses defined RAM banks as compile-time constants,
>> so introduce macros to describe guest RAM banks.
>>
>> The reason for 2 banks is that there is typically always a use case for
>> low memory under 4 GB, but the bank under 4 GB ends up being small because
>> there are other things under 4 GB it can conflict with (interrupt
>> controller, PCI BARs, etc.).
> 
> Fixed layouts like the one you suggest come with (potentially severe)
> downsides. For example, what if more than 2Gb of MMIO space are needed
> for non-64-bit BARs? 

It looks where usually RAM on RISC-V boards start, so I expect that 2gb 
before RAM start is enough for MMIO space.

Answering your question it will be an issue or it will also use some 
space before banks, no?

I don't know how to do that better now.

Further, assuming that the space 4G...8G is what
> you expect 64-bit BARs to be put into, what if there's a device with a
> 4G BAR? It'll eat up that entire space, requiring everything else to
> fit in the 2G you reserve below 4G.

I assume that such big devices could use high memory without any issue.

> 
>> So a second bank is added above that MMIO
>> region (starting at 8 GiB) to provide the remaining RAM; the gap between
>> the two banks also exercises code paths handling discontiguous memory.
>> For Sv32 guests (34-bit GPA, 16 GiB addressable), bank0 provides 2 GB
>> (2–4 GB) and the first 8 GB of bank1 (8–16 GB) is accessible.
>>
>> Extended regions are useful for RISC-V: they could be used to provide a
>> "space" for Linux to map grant mappings.
>>
>> Despite the fact that for every guest MMU mode the GPA could be up
>> to 56 bits wide (except Sv32 whose GPA is 34 bits), the combined size
>> of both banks is limited to 1018 GB as it is more than enough for most
>> use cases.
> 
> Okay, more memory can be made available by (later) adding an optional
> 3rd bank.
> 
>> --- a/xen/include/public/arch-riscv.h
>> +++ b/xen/include/public/arch-riscv.h
>> @@ -50,6 +50,22 @@ typedef uint64_t xen_ulong_t;
>>   
>>   #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>   
>> +#define GUEST_RAM_BANKS   2
>> +
>> +/*
>> + * The way to find the extended regions (to be exposed to the guest as unused
>> + * address space) relies on the fact that the regions reserved for the RAM
>> + * below are big enough to also accommodate such regions.
>> + */
>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
> 
> Connecting this with my comment on the earlier patch regarding kernel, initrd,
> and DTB fitting in bank 0: How's that going to work with a huge kernel and/or
> initrd (I expect DTBs can't grow very large)?

The short answer it won't, but does initrd usually so big?

DTB is limited to 2MB, IIRC. So it isn't expect to grow to much...

As I mentioned in the reply to earlier patch, I agree that we could 
leave bank0 for kernel and all other put to bank1.

Even more I can try to put kernel in ban1 as I don't see any place at 
the moment where it will be a problem for RISC-V Linux kernel to be in 
high memory.


> 
>> +#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016 GB of RAM @ 8GB */
>> +#define GUEST_RAM1_SIZE   xen_mk_ullong(0xFE00000000)
>> +
>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
> 
> Why's this needed in the public header?

xl toolstack could use them so I expected what toolstack will use to 
live in this header.

~ Oleksii

