Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJZjHs5i+2kuaQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 17:48:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B544DD8F7
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 17:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301889.1576026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKeTh-00078r-69; Wed, 06 May 2026 15:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301889.1576026; Wed, 06 May 2026 15:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKeTh-00075t-3T; Wed, 06 May 2026 15:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1301889;
 Wed, 06 May 2026 15:48:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKeTg-00075n-6n
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 15:48:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKeTf-00GgA7-JA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 17:47:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb628a-5cb7-0a2a0a5109dd-0a2a450ba252-48
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 17:47:59 +0200
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb62af-212f-0a2a450b0019-d155da33b033-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 17:47:59 +0200
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso1189565266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 08:47:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55b17c3ffsm101415666b.5.2026.05.06.08.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 08:47:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778082479; x=1778687279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4T7fBhpUx2mX2L4yrPQgfNyWNZHFLrMB/cP4Co3eXXQ=;
        b=H2bX31lWugAV4hv03nDYV2XF0p+T3fzjTYbbIL3sdlHLP8XOdw+s5GxTa242VMZZxz
         Mp2sgSrv2acXHz90fVcm1mxScTVpzN2efSk/nTDIuNGrv8g1UmCAZpolCcfHBJ2DHTV4
         0ZIwQtSRnj7XYYSJe3+NTFkvgmBTm6gBBYZS8GvlLYWcmClDFS2oNK/vWyo7JIZMBUO3
         RGi8b9BGwsNVusCEsx17axpPGM3LtfxWLmt5gJcq/Bc7hmyR/a2idjxuFdqjrpoNhkMx
         2mx4HMuXAazHPMi77F2w4LhGhHyq/O8FSzOUH5CZzuoJ3fALIz//lA+T8sfXAElqfQ4f
         U/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082479; x=1778687279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4T7fBhpUx2mX2L4yrPQgfNyWNZHFLrMB/cP4Co3eXXQ=;
        b=Y2J6YrqO1Rnnx0H/xo5lHkZ9ivRHsS8Kmxx6IhngnTfoaH7X/cYJ2RGDrQ8CREmIPu
         Gm+ypAyL25Qxk3gCuTna7jB4hrkah3fHxMso1x/4uK3Cnxc9rWu27J0Q52xbajXckkC3
         O7jTUCaAzKHWdB3sMV+lfAWRVrvNvdL4Xa4M/++f4nfmkEozmwuEyC9f8vDmWcRzyOGU
         8wK/iMb/K3lXPsbChYFM0/B/bJgKQssFA9cOGWGsF43zT0oTwsNeBMpvCCKVvkyoWxXe
         5YAaLp5kfckktPc4SYQ86neJubMTpEp6y8n91Wp+NJiX8TbANaJRkHPKMdo9YCe9wFOq
         5Sdw==
X-Forwarded-Encrypted: i=1; AFNElJ/ziHj7MWrXw7nl5thqeR/39KgecVZdT+uSCSv6brCREGKjeyxUIhorJOM1+IMgDM0jBkDkZaPY4Zc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw2uW/bZOXYtt7DNGFnbuhei4MHcRO5ImsJeGwI0G7MeXetdoe
	UuH4tF+ORBnymv01qiFQYI9iqxijpmrRSFjylyznBKlbql2ObP/P/tCb
X-Gm-Gg: AeBDiet9N4DCZXmH9g168w2QTI23fcvzU0NuC1+7vN/lGc9tGOB496xg2QXPRex+kd6
	ji3D3blSI8iI46JlsI1s6jR1xPPKdqT0xKie2L1sT4UL6I27cjARQ+aeR1CQRckQ1Gr/EZcYbw1
	MsVusXwsWInQ0RKqLYtS0wulKkVYdlLwQdsENRwV3AQLLsULAXWMVEY8Hd/xkOhuF5VGab4MHLG
	f/xw0DSk82UbOkQuR+YOq7oVXGqQpmU23l3vsUBgXY9gAMuBhLwwMuh4IXW2T0/zXudKM8LiFyw
	sjy/GP0RnV6R1WHmdghiejfR7OFy5TSXSfAbuZ0gbUWb+/mGB9wzxj5+VdiazClKAhim9G/Tt56
	qbbUOlzS0BhbcEm04uGZSCxeS/bb1477PHCLdV+rs9ciM8+Ts9HhjQWBNlnt3eHcoKKedETFs+8
	hmME9vbv1lP40CGy8X2S3eGL5THQX8YRXn3RstJ8zY44Xq7osaU7YbPfzfX/XMXdYYqPX23Dtzc
	LQd6IRtov+w0XnSQ3ucH4MJ
X-Received: by 2002:a17:907:c11:b0:ba7:cc67:488b with SMTP id a640c23a62f3a-bc56be407f3mr232678966b.5.1778082478706;
        Wed, 06 May 2026 08:47:58 -0700 (PDT)
Message-ID: <764aac8e-b200-410e-99a2-cab65a274ef4@gmail.com>
Date: Wed, 6 May 2026 17:47:57 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <80f67b9a-2b42-409f-90d8-587a07d57d26@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1778082479-20678F3B-CA0D74CC/10/73395122804
X-purgate-type: spam
X-purgate-size: 2169
X-Rspamd-Queue-Id: C0B544DD8F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/4/26 2:59 PM, Jan Beulich wrote:
> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>> domain_use_host_layout() is not architecture-specific and may be needed
>> on x86 [1]. Replace the ARM-specific macro in asm/domain.h with a common
>> static inline in a new dedicated header, xen/domain-layout.h.
>>
>> xen/domain.h would be the natural home, but placing it there would
>> require including xen/paging.h (for paging_mode_translate()) and
>> xen/sched.h (for is_hardware_domain()), which would introduce circular
>> dependencies. A separate header that callers opt into avoids this.
>>
>> Adjust the implementation to take paging_mode_translate() into account
>> so it works correctly for all architectures, including x86. Some extra
>> details about implementation [2] and [3].
>>
>> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop/
>> [2] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271742400.3148344@ubuntu-linux-20-04-desktop/
>> [3] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2602271750190.3148344@ubuntu-linux-20-04-desktop/
>>
>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> With the SPDX tag added as indicated by Luca:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> 
> One further minor remark:
> 
>> --- /dev/null
>> +++ b/xen/include/xen/domain-layout.h
>> @@ -0,0 +1,27 @@
>> +#ifndef __XEN_DOMAIN_LAYOUT_H__
>> +#define __XEN_DOMAIN_LAYOUT_H__
>> +
>> +#include <xen/domain.h>
> 
> This isn't really needed. It is ...
> 
>> +#include <xen/paging.h>
>> +#include <xen/sched.h>
> 
> ... included by this one anyway (pretty much unavoidably right now, I
> guess).

Then it will be needed to re-order them.

Do you want to put the comment above xen/sched.h:

/*
  * Ensure xen/sched.h is included before xen/paging.h, since paging.h 
depends
  * on xen/domain.h, which is pulled in via sched.h.
  */
#include <xen/sched.h>
#include <xen/paging.h>

or just add this to commit message instead?

~ Oleksii

> 
> Jan


