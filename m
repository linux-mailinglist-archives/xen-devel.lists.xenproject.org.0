Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78219275F68
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 20:05:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL98p-0002VI-Ct; Wed, 23 Sep 2020 18:05:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL98n-0002VB-T8
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 18:05:17 +0000
X-Inumbo-ID: d69029dc-9407-4695-837c-99fabeab09b3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d69029dc-9407-4695-837c-99fabeab09b3;
 Wed, 23 Sep 2020 18:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=jo8TcmPucA7SO5R/8hGsHAmj389AlW1dSCsZ1n6xY2M=; b=lZy91GGLSI/R511WToDPm8rEgY
 SBZupnxduA6uiTX5I+skb1QhzNAXM9O2qlJmKkz15peSRAQs5DXZYavUwokcyjPvK831y1cMdkwwI
 XmNfMQ6UaOK/r/LoMo+2I5B6/zfugGwmqwga6iGx0OqTT2UOCq/XHx7VWNkdnCIPhrDY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL98k-0000iu-Sd; Wed, 23 Sep 2020 18:05:14 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL98k-0006wU-M2; Wed, 23 Sep 2020 18:05:14 +0000
Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <172e2adb-ec37-c9cc-865c-bd92c4340dcf@xen.org>
Date: Wed, 23 Sep 2020 19:05:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Oleksandr,

On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The cmpxchg() in hvm_send_buffered_ioreq() operates on memory shared
> with the emulator. In order to be on the safe side we need to switch
> to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
> 
> CC: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


For bisection purpose, we need this series to at least build at every 
patch. It is fine if the IOREQ feature doesn't work.

So this patch wants to be earlier in the series to avoid breaking arm32 
compilation.

> 
> ---
> Please note, this patch depends on the following patch on a review:
> https://patchwork.kernel.org/patch/11715559/
> 
> Changes RFC -> V1:
>     - new patch
> ---
> ---
>   xen/common/ioreq.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index e24a481..645d8a1 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -30,6 +30,8 @@
>   #include <xen/trace.h>
>   #include <xen/vpci.h>
>   
> +#include <asm/guest_atomics.h>
> +
>   #include <public/hvm/dm_op.h>
>   #include <public/hvm/ioreq.h>
>   #include <public/hvm/params.h>
> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
>   
>           new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>           new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
>       }
>   
>       notify_via_xen_event_channel(d, s->bufioreq_evtchn);
> 

-- 
Julien Grall

