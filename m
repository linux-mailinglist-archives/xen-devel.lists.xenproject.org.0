Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD342F859C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 20:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68587.122774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Uuq-0005B1-5J; Fri, 15 Jan 2021 19:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68587.122774; Fri, 15 Jan 2021 19:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Uuq-0005Ac-24; Fri, 15 Jan 2021 19:37:48 +0000
Received: by outflank-mailman (input) for mailman id 68587;
 Fri, 15 Jan 2021 19:37:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0Uun-0005AX-RF
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 19:37:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Uul-00030S-Cb; Fri, 15 Jan 2021 19:37:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0Uul-0008Ez-3L; Fri, 15 Jan 2021 19:37:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=RfQ8LtNjUEc2vcP8DVMYRLFhtjNTXFmxDaOMISsn1eU=; b=mq9FtJlABEBbHvdMmXSa16vIsi
	T1rEVhIo70T3WDb9y9j93P5ZQ7dQnJBw9aFTo9/o+zv5X660EH8O8pzcNd/E24D1aHcol5QyfWYeh
	mKtIHYNeaxYcDj6wsh+un/13UGsrxwUEC0qFeWr5qvoBeGvPdexGD5jgUqJqERnCIUXg=;
Subject: Re: [PATCH V4 13/24] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-14-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a31ac1ae-7933-c738-238e-8dcb7e5409a8@xen.org>
Date: Fri, 15 Jan 2021 19:37:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-14-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The cmpxchg() in ioreq_send_buffered() operates on memory shared
> with the emulator domain (and the target domain if the legacy
> interface is used).
> 
> In order to be on the safe side we need to switch
> to guest_cmpxchg64() to prevent a domain to DoS Xen on Arm.
> 
> As there is no plan to support the legacy interface on Arm,
> we will have a page to be mapped in a single domain at the time,
> so we can use s->emulator in guest_cmpxchg64() safely.

I think you want to explain why you are using the 64-bit version of helper.

> 
> Thankfully the only user of the legacy interface is x86 so far
> and there is not concern regarding the atomics operations.
> 
> Please note, that the legacy interface *must* not be used on Arm
> without revisiting the code.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>     - new patch
> 
> Changes V1 -> V2:
>     - move earlier to avoid breaking arm32 compilation
>     - add an explanation to commit description and hvm_allow_set_param()
>     - pass s->emulator
> 
> Changes V2 -> V3:
>     - update patch description
> 
> Changes V3 -> V4:
>     - add Stefano's A-b
>     - drop comment from arm/hvm.c
> ---
>   xen/common/ioreq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index d233a49..d5f4dd3 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -29,6 +29,7 @@
>   #include <xen/trace.h>
>   #include <xen/vpci.h>
>   
> +#include <asm/guest_atomics.h>
>   #include <asm/hvm/ioreq.h>
>   
>   #include <public/hvm/ioreq.h>
> @@ -1185,7 +1186,7 @@ static int ioreq_send_buffered(struct ioreq_server *s, ioreq_t *p)
>   
>           new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>           new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
> +        guest_cmpxchg64(s->emulator, &pg->ptrs.full, old.full, new.full);
>       }
>   
>       notify_via_xen_event_channel(d, s->bufioreq_evtchn);
> 

Cheers,

-- 
Julien Grall

