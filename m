Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPA8BpIX+2l3WgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:27:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B44D94EF
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301529.1575808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZT6-0003As-Ex; Wed, 06 May 2026 10:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301529.1575808; Wed, 06 May 2026 10:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZT6-00037u-CE; Wed, 06 May 2026 10:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1301529;
 Wed, 06 May 2026 10:27:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKZT4-00037o-Lc
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:27:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZT4-009F7U-2J
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:27:02 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb176b-bab6-0a2a0a5309dd-0a2a4508bede-26
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:27:02 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb1775-63b5-0a2a45080019-d155d031e973-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:27:02 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-67c2b4809baso6915932a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 03:27:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67cd91a486csm1100430a12.17.2026.05.06.03.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 03:27:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778063221; x=1778668021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TejeyEvoHzwzx+okNPaXwBSv/w92h4T3OyRNx3bKUY=;
        b=i3rnyWQ0hSIEc4EzgCiDROZBTxsv2evdDFBagABFofPEnjgT16f2GJKO8UggEpc9lL
         6GtDk32LtIrfi72wWHaRzDAcqPVKfJ0pNzI+TM1PBRviUwEkgvjAvHJxuyi4GYlu+KKZ
         /d0vL3DJuc6sQgPBi03KoZCzAnocZfhnkigbaxAf5M+qBlrBJaxwz8FcaocNFoAGVH93
         CWleKdG+PfUyxU28NBy0utae9CbczVs5S69ZwpRIsKDTvn8bjp1RMfVG52n8we9uqOTR
         8ahaLOLvFXvTHvyD/f5MU3uN3al5xBj+yZY0ShQmRihtrfJ3FcW80HN13Pq0/HWeqLJ1
         G2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063221; x=1778668021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TejeyEvoHzwzx+okNPaXwBSv/w92h4T3OyRNx3bKUY=;
        b=qYpEhU3HJk2KUhHjaUSR1nHq0GIWJ1zrIQaBYyjUjbvbh43rzS4xJ7BSzjMVrDViRe
         GGWwmDuA2p3trhFb6beuj2NG2DChtt4Q9JTu2Z8GoxoiEU4IsKBSz6JbX7Q2XeYhk/Pi
         2ICvGLzFOP6/Nm30Vi4eklFUTOxS5GYXgAYNCuMQxK45mPQPqE0TUMnPgQgzk0jQ7J1/
         W7waPoCO2Sffr+WjEvBPQ0w4Kw9DZQ3x90VFMLH7zxbyfjRI/PPNSkg+e042Xd9q8XVi
         LH5v7d3H4D175WjoZglqhfjeGo7b7E4Zg6k6kfyT6Hy4k2y21GFLueNk2x5C8toTq42H
         Mn3g==
X-Gm-Message-State: AOJu0YxhD0xaqw9lmLX6wAd7wQ9yTmEFlqNmClDOPxXgeAiVJfeDrxC5
	mirn/SrhTijc6bZY50eBw2X1CJqwu2SjcZjX7UEdFGpMNa9sPZYUAKG1
X-Gm-Gg: AeBDiet4OH3hV5PZQ25VghyXdPie4jp5xt7e6YMmZWMDtAUsmw8IhudjSqvi8HHnWkc
	iGWkHiNadZxcIzdbArZYeh8BY5TJB2EHyhyt9eXYHmu5X7cEPcSuP5YvgJ5r1byMdalaZjJruWC
	KfOg5L5wMmT+8ydxl0zPjs+Vfqih1c8mP4LOB71oQtNcb39fN3voCb50LQWkH/TQdFwuWEGy26c
	EN5en5bzXk2PtSigOwOeVqqWK1huled36hgCUD7NfLoUHdk/SI+AFZRKPDf+JSV3UeWu92K75fG
	jSNEhXXb8Ro//ioiLXbfBN3Dgw7aCVTE8bJVhKkFvsleBb57O1Vn0FM+Hxvw3GYMdONZJBMPMqu
	BmCYRPCLM/n15jLoO9AhbEZ480FeP6UpMNSxVLCtHz2hYUE5UDlhRU9zru1SbuSR64fqmUQhRLG
	hanFIwkOm3SWNuVRtXhWjGDTGJPupNN/asId1sY2boKEhLtOBtIZm+57v28Ea34Xx2bvIwwL9h6
	Ufh63wj+xJNWA==
X-Received: by 2002:a05:6402:4558:b0:67c:9609:eb79 with SMTP id 4fb4d7f45d1cf-67d642c252amr886108a12.17.1778063221329;
        Wed, 06 May 2026 03:27:01 -0700 (PDT)
Message-ID: <cce39cb1-ab2f-46cb-96ba-8c43a0524b03@gmail.com>
Date: Wed, 6 May 2026 12:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
 <D2F797B5-CB47-4883-BC0D-1F60056688CC@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <D2F797B5-CB47-4883-BC0D-1F60056688CC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1778063222-BF171DB1-E829D69D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1302
X-Rspamd-Queue-Id: 726B44D94EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello Luca,

On 4/29/26 5:10 PM, Luca Fancellu wrote:
>> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
>> index c51520ebadf9..6949203dacdc 100644
>> --- a/xen/common/device-tree/domain-build.c
>> +++ b/xen/common/device-tree/domain-build.c
>> @@ -1,6 +1,7 @@
>> /* SPDX-License-Identifier: GPL-2.0-only */
>>
>> #include <xen/bootinfo.h>
>> +#include <xen/domain-layout.h>
>> #include <xen/fdt-domain-build.h>
>> #include <xen/init.h>
>> #include <xen/lib.h>
>> diff --git a/xen/include/xen/domain-layout.h b/xen/include/xen/domain-layout.h
>> new file mode 100644
>> index 000000000000..0532a27b44ce
>> --- /dev/null
>> +++ b/xen/include/xen/domain-layout.h
> 
> New files should have SPDX tag

I will add:
   /* SPDX-License-Identifier: GPL-2.0-only */

> 
>> @@ -0,0 +1,27 @@
>> +#ifndef __XEN_DOMAIN_LAYOUT_H__
>> +#define __XEN_DOMAIN_LAYOUT_H__
> 
> I think this include guard doesn’t satisfy the coding style:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=CODING_STYLE;h=aae5a47ac20345978b3c465b9d85f1d5f6774731;hb=refs/heads/staging#l167

Will rename to XEN_DOMAIN_LAYOUT_H.

> 
> Apart from this, the rest looks ok to me, after fixing the above I will leave my R-by

Thanks for review.

~ Oleksii

