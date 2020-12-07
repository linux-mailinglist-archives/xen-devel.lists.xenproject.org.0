Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404572D0FAB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:47:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46361.82282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEz7-00016r-TS; Mon, 07 Dec 2020 11:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46361.82282; Mon, 07 Dec 2020 11:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmEz7-00016S-QD; Mon, 07 Dec 2020 11:47:17 +0000
Received: by outflank-mailman (input) for mailman id 46361;
 Mon, 07 Dec 2020 11:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmEz5-00016N-Qg
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:47:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab0c550b-b7da-4a25-a2ce-254e9dea003e;
 Mon, 07 Dec 2020 11:47:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DEEBAC9A;
 Mon,  7 Dec 2020 11:47:14 +0000 (UTC)
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
X-Inumbo-ID: ab0c550b-b7da-4a25-a2ce-254e9dea003e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607341634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kg3gDdT3ADiFHvwSa2dcT46uq2ybzUoNndm7KF8yLig=;
	b=Ew6afyminPVSFaXdqYWqFVp29Mp0GC36fx3IVefCbxJ7xzf9EcF/im5UeTwNK5Ui9qifHR
	Fmw6lQ0pZTDlwRYoar/vKaVG+8WLGqpbl05cwy9RVuAM3DoYRA4bSTumCgluEjyZlrWSYf
	4gwNijtNR8WWtIaPMxop9dJx/jDTAbc=
Subject: Re: [PATCH V3 05/23] xen/ioreq: Make x86's
 hvm_ioreq_needs_completion() common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-6-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <033af196-1338-54a6-1ec3-416df27337fa@suse.com>
Date: Mon, 7 Dec 2020 12:47:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1606732298-22107-6-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -21,6 +21,13 @@
>  
>  #include <xen/sched.h>
>  
> +static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
> +{
> +    return ioreq->state == STATE_IOREQ_READY &&
> +           !ioreq->data_is_ptr &&
> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != IOREQ_WRITE);
> +}
> +
>  #define HANDLE_BUFIOREQ(s) \
>      ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)

Personally I would have suggested to keep the #define first, but
I see you've already got Paul's R-b. Applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

