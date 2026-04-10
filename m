Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIpTGCr82GmRkggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 15:33:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8033D825C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 15:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279096.1563693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBByn-0006YD-9w; Fri, 10 Apr 2026 13:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279096.1563693; Fri, 10 Apr 2026 13:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBByn-0006WT-6o; Fri, 10 Apr 2026 13:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1279096;
 Fri, 10 Apr 2026 13:32:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBByl-0006WN-Bt
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 13:32:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBByk-004pFT-Ni
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:32:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8fc03-2eae-0a2a0a5409dd-0a2a4509cf40-22
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 15:32:58 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d8fc0a-bf79-0a2a45090019-d155d033dcaa-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 15:32:58 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-66e6d9610d8so2998754a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 06:32:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6dfd77dfsm80073166b.18.2026.04.10.06.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 06:32:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775827978; x=1776432778; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7Mo/qiJkuCPRIdUKAt0JadSLtwPoyQnWxa+tu7K+Ao=;
        b=LGtqblzPD5bqBV+1kfSZHHrX2gjiX2kR7xvUoXyZRvDcB9bxe5wvIYha0BylJ5N2jh
         /qfz87Lzb+0vulg22xSvndNze0ipMrcOWSclwTlyRJXQmIl3aXaZDXl0Gcfz1BicRtLm
         wHIVpjfjPTQG8nXwGQbMvhnXshRr76Kg4Rl3t5Fx4Iei5ijfeOEOffJlN62hKszhlQzy
         qzNpcSSUpr/CEFViAm1tkze9QAF+yKKk6m4Xy2ILHCVT/1ldMX0QCDcVq7o7Qo7YU7Z6
         BwE5Az7ODovWXBVLFZ8CiteTwGJtHGO34yp/kVFf47Ay7WBsO2x9X49rHpBO9f9I/GZd
         KRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775827978; x=1776432778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7Mo/qiJkuCPRIdUKAt0JadSLtwPoyQnWxa+tu7K+Ao=;
        b=ZDHyYKI8zdVfxJ9WqzgS89efierdK4fzyCCZefhd/QzlFD6BoggGE+31AVxdsn6WY4
         BmAJwF/IkC4DWr2Qj3YY+YiQoC+3w9VeQ7aMomaxHrahCAbVLFwDgD4qcD9DveKtZ+Hk
         oJwFEGx5Q1xzPR+7m4aIZENxog773jgTN5Jxfi+lEcbM5QEHfFBHZYR/4w6BfnQbGGUb
         YKY2JShp5Qrk+DVK1e0T8UT/ytpFjhQfWTe0DXy/XdSf+ovvigw9PYmZbIzEoj1q4SoU
         9Dh4/2w2g9yG6gymGzvmbhcJYoAHhqdzrFXDY8jQrL5VxK+3VaBIZK9zyJ4vdgIRa0h/
         S2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVooGCy87bIA+pNQM4M0y3MN4ix0xvzjDp4McXMdQiZvH0t+sUdj2m5snmyS71qQPZbrrYxJBjpQfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjytgDZN+SkFt4Op35/emZkYGYBby34//EtPiDqRGcGJ1ZVDGj
	y2OoKfcE2PGRqdbKTkP384l1HuazmL09mQQqEm7CkKl85oUQ4q0die9u
X-Gm-Gg: AeBDietOkkM3hd05b7+x59Fr/EWyvLnOiwm9rWwwkNdCYBbpt9+DVis/6558wAeuXWU
	R7TLNk5wyqmmwT24AQLgXsW5RkkejhokEtKHBPZx72mzTj0edwpPax7jnIxNttuJybfWDy4I0M6
	sEucRqTtgO+0+vJ/6jGHK3Xloqa4QdQCFhWghG9acuGcNSaAVZoHPixNV+nJ0zPEyunEqbuXrnN
	AfTJdb7qgeTeZ5SAstaUf42juE8bciPu7mf8VUWu7U70xWZyV0Wo89CEwGyBtfvGLUAT8yE/47i
	BbrY+apicujwqxOjzsh7WQ6irktJlfWJhPpVmzDlSnQRYsSBYv/uWhlIJqjccr/8aVt5ifxT+9v
	9h6ssiRFFwU2SLBxxE3nKco/8nq/OMKZTmNHgw5MO90YgfFutEHbEJ7nhA7EMgKB2y3gRG8czBI
	vdFyPjMwiYIeithULpJs6xmQWrft4ulCdsNfsWXlv+8w9+rR5aoJA10SLqI6TK+RCFBxvdsYo+o
	kY=
X-Received: by 2002:a17:907:3c85:b0:b9c:fe2c:3a57 with SMTP id a640c23a62f3a-b9d7249608amr196486866b.20.1775827977660;
        Fri, 10 Apr 2026 06:32:57 -0700 (PDT)
Message-ID: <7b9a365c-db8f-4716-8c11-f4b844633538@gmail.com>
Date: Fri, 10 Apr 2026 15:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/27] xen/riscv: implement make_arch_nodes()
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <9c97b4bc6fb8a5e556c38cfe7e34de0eb3cbbbb0.1773157782.git.oleksii.kurochko@gmail.com>
 <08732737-e02b-4be8-a49f-fdebc38924a5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <08732737-e02b-4be8-a49f-fdebc38924a5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775827978-5D3F4152-CD30AC31/10/73395122804
X-purgate-type: spam
X-purgate-size: 1344
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
X-Rspamd-Queue-Id: 7D8033D825C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 4:29 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> No RISC-V-specific nodes need to be created at the moment,
>> so make_arch_nodes() is implemented to simply return 0.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Same question as on the previous patch, albeit to a lesser degree: An
> arch hook may plausibly exist (and be called) uniformly, even if on
> some arch-es it doesn't do anything.

I'm using it to provide a node for emulated UART, something like Arm 
does for VPL011 by calling of make_vpl011_uart_node().

> 
>> ---
>>   xen/arch/riscv/Makefile         |  1 +
>>   xen/arch/riscv/dom0less-build.c | 11 +++++++++++
>>   2 files changed, 12 insertions(+)
>>   create mode 100644 xen/arch/riscv/dom0less-build.c
> 
> Further, on what basis is this function put in this new file, when the
> earlier ones live in domain-build.c?

Because it is called only for dom0less path, but previous one called 
from both dom0 and dom0less path.

> 
>> --- a/xen/arch/riscv/Makefile
>> +++ b/xen/arch/riscv/Makefile
>> @@ -1,5 +1,6 @@
>>   obj-y += aplic.o
>>   obj-y += cpufeature.o
>> +obj-y += dom0less-build.o
> 
> obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o>
> just like Arm has it?

It makes sense.

Thanks.

~ Oleksii


