Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HNCCVFB/GlMNgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:37:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8655D4E428C
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302196.1576171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtIc-0001IX-Et; Thu, 07 May 2026 07:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302196.1576171; Thu, 07 May 2026 07:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKtIc-0001Gq-Bi; Thu, 07 May 2026 07:37:34 +0000
Received: by outflank-mailman (input) for mailman id 1302196;
 Thu, 07 May 2026 07:37:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKtIa-0001GU-M5
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 07:37:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKtIY-009y4d-HD
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:37:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc413b-e002-0a2a0a5209dd-0a2a4505cf8a-10
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:37:31 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fc413b-aaa8-0a2a45050019-d155da29f1a2-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:37:31 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bc47a96d3bbso70571266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 00:37:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67cd91a4647sm1766253a12.19.2026.05.07.00.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 00:37:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778139451; x=1778744251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnkab6DoanSZ0nYUPaKEmyxqnzmD3bUBit+dMs8gOFI=;
        b=XpPMrzz3MJKQhc/8z/JL/pMOPPa2r1FsiPxKfrRDsW/zdlvfG7Ol3y2lQn6SJ12lj8
         ufRJDj+DDUM8QZvG2ln9GAA8uKWCs3TA/ldt5W/a9E0Y5CD6Bqa06LJV55kEmbdb+B0t
         pNLf3QGQwgQ5VHZ/xP+tUQzsAnbW+CgMoJZcBR6asjbm7fLjy8UYRNbvFBWhtQQMMqaz
         3aCdDV82Rako8RGusE1/F8jMiPE8dB8UUp+qE7ajCtiPQUzRFBeKeUEcC9syBrepAeX6
         LEqXFRa+ZcOtbRdWp7q0DJOmtXfEesehRXajRk8HQk7QDBKZrMgIsZOgwdtGPFZzM7cb
         5XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778139451; x=1778744251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnkab6DoanSZ0nYUPaKEmyxqnzmD3bUBit+dMs8gOFI=;
        b=RltnJMU9EcZK7xV8ebKDH42o6duxWdX2IvLFAzBdzmHKTVlh7jy6buN/Kgjskd7Txp
         BkmXFWefp9U1XEzvmqK4kmPFODmhFvTZv5Jk1TmcSdIM8pyDCg3ngmnNaY1wdOcg4/jl
         zeGcwNX4icy7zJIPbkc6pjynuTH0E8KKF9rLg1r6T3tTNimqvKj8PyLDmPbefkbZMVWK
         J2Ctp5D3E7NgPTbuI+FgpmYnXEH+l6exmfdCmDYUSkIG7omhS5neODKO0ypvRaz5q4VR
         +AeKfGZpEhEOz5Kjp/2l9cUUgpegID4mfrUrUmbMDVsdE7WqTQs9Kc4zUj0+V4qnJgpO
         6Z2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/df49SpLo5pP6g5TtLDBr3hU5kL3CYvvEHVdq1WIG6EGqV7D7Bn/+dskHRi5r9RDaEcIT04aD2a5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxo3vmW6DMvlXLuLKcXhpaLO78tdKrWLXOpA0BfrY7ZEhnasHHi
	emkTbO/UyTY4FoH7ujsMiaskdheIFalCVYkrfxhE584/Y9GINStfpkHg
X-Gm-Gg: AeBDiev9x0508UvGI7LCF97LUXr28JeOOWjXBxxqlUNu+xwuyTD/oDqzkh7ePGcrQme
	HnAYyR3fkIk5wvej3oy7r65EVr42DxKPsWHD5SQ5Zd3pdcpInOnu3X3n/V/fOUzfaP90F4Vwsdy
	y94nCcckTZ6p5ZXuIRj8o/wi8afkLNuU3vogmYOdrN6mBxVZbRN3NamHCiwb2yqBaHtq+QWhXzZ
	SJoIDkQOKbqPbGy66W8i3VNftwjdPD63cxDrpqa3ed6HHUoSrTt6iZHNBbNQiAjligGpeS6Ocis
	PsvKe8jI2ZdHG66foKTnPv+ORY//z6H8TN6Zoqs11hiWNSyAUEzTizbHYIf6ZJ/HxVYZ6AHRAF1
	XaALoeDhX2nk+99Vn7XxUbcnEh68ljkYqFCnQMxcPJJlhTVeh+iyVGRuLXcpuBIzDdQpmftDXSg
	m5NNFf3urqu/RkhRLao5hVwbTWxEvisvtCAu3vv238CoaCq/2jexIYUvDBVXQO3my6uokaBiGAx
	pMk8d589mvF8veK+yYEMnS7
X-Received: by 2002:a17:907:9806:b0:ba7:5c47:7b1c with SMTP id a640c23a62f3a-bc56ae29972mr321655866b.8.1778139451191;
        Thu, 07 May 2026 00:37:31 -0700 (PDT)
Message-ID: <e2d0911a-579f-496d-9a10-7c53d4962517@gmail.com>
Date: Thu, 7 May 2026 09:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
 <80f67b9a-2b42-409f-90d8-587a07d57d26@suse.com>
 <764aac8e-b200-410e-99a2-cab65a274ef4@gmail.com>
 <b0b02d0c-ff4c-45e8-9928-d0a52e081b3b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b0b02d0c-ff4c-45e8-9928-d0a52e081b3b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1778139451-DBB60443-A5710BA6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2607
X-Rspamd-Queue-Id: 8655D4E428C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/7/26 9:25 AM, Jan Beulich wrote:
> On 06.05.2026 17:47, Oleksii Kurochko wrote:
>> On 5/4/26 2:59 PM, Jan Beulich wrote:
>>> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/domain-layout.h
>>>> @@ -0,0 +1,27 @@
>>>> +#ifndef __XEN_DOMAIN_LAYOUT_H__
>>>> +#define __XEN_DOMAIN_LAYOUT_H__
>>>> +
>>>> +#include <xen/domain.h>
>>>
>>> This isn't really needed. It is ...
>>>
>>>> +#include <xen/paging.h>
>>>> +#include <xen/sched.h>
>>>
>>> ... included by this one anyway (pretty much unavoidably right now, I
>>> guess).
>>
>> Then it will be needed to re-order them.
>>
>> Do you want to put the comment above xen/sched.h:
>>
>> /*
>>    * Ensure xen/sched.h is included before xen/paging.h, since paging.h
>> depends
>>    * on xen/domain.h, which is pulled in via sched.h.
>>    */
>> #include <xen/sched.h>
>> #include <xen/paging.h>
>>
>> or just add this to commit message instead?
> 
> No. xen/paging.h only includes two asm/*.h, so doesn't itself require anything.
> If there's anything missing for that header to be included first, I would assume
> it's then RISC-V's asm/paging.h or asm/p2m.h which lack a necessary #include?
> Yet without you indicating what exactly the missing piece is, this is somewhat
> guesswork on my part.

The first time I read compiler error inattentively.

The following compilation error occurs after xen/domain.h is dropped 
from xen/domain-layout.h:

In file included from ./include/xen/paging.h:4,
                  from ./include/xen/domain-layout.h:6,
                  from common/device-tree/domain-build.c:4:
./arch/riscv/include/asm/paging.h:17:48: error: 'struct page_info' 
declared inside parameter list will not be visible outside of this 
definition or declaration [-Werror]
    17 | void paging_free_page(struct domain *d, struct page_info *pg);

So the correct fix is to add forward declaration of struct page_info to 
RISC-V's asm/paging.h.

I will add the following to commit message:
"
To avoid the following compilation issue:

In file included from ./include/xen/paging.h:4,
                  from ./include/xen/domain-layout.h:6,
                  from common/device-tree/domain-build.c:4:
./arch/riscv/include/asm/paging.h:17:48: error: 'struct page_info' 
declared inside parameter list will not be visible outside of this 
definition or declaration [-Werror]
    17 | void paging_free_page(struct domain *d, struct page_info *pg);

add the forward declaration of struct page_info to RISC-V's asm/paging.h.
"

~ Oleksii

