Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99869308747
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77816.141201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ps7-0004u0-Cq; Fri, 29 Jan 2021 09:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77816.141201; Fri, 29 Jan 2021 09:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ps7-0004tb-9M; Fri, 29 Jan 2021 09:15:19 +0000
Received: by outflank-mailman (input) for mailman id 77816;
 Fri, 29 Jan 2021 09:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5Ps6-0004tW-1N
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:15:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c29e24f6-723d-4631-9f4e-99eb20f62719;
 Fri, 29 Jan 2021 09:15:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FD72AE61;
 Fri, 29 Jan 2021 09:15:15 +0000 (UTC)
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
X-Inumbo-ID: c29e24f6-723d-4631-9f4e-99eb20f62719
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611911715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NMR6DUZt2xp3MSjuHQgPkm+jAiTZY7v+u1ee1mgD0gI=;
	b=CrmRN6N4oY9W7okNkPb/QhmDUiKkGaS1AYA/ZarHLClrRTw1KR+QcI6MqJxepqvF55VvG7
	pNR4puhnZmuhfWMTBYZD8uCqy/fO1o23FdnC9iR69o8BvldV+8KQS67P0AWFy5do24KoOR
	KenORI6OfqGcimSLuoQLLy50DgiALf0=
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
Date: Fri, 29 Jan 2021 10:15:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128160616.17608-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 17:06, Andrew Cooper wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1054,7 +1054,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>  }
>  
>  static int acquire_grant_table(struct domain *d, unsigned int id,
> -                               unsigned long frame,
> +                               unsigned int frame,
>                                 unsigned int nr_frames,
>                                 xen_pfn_t mfn_list[])
>  {

Doesn't this want carrying forward into
gnttab_get_{shared,status}_frame() as well? Of course further
cleanup here can also be done at a later point, but it leaves
things in a somewhat inconsistent state. I'd like to leave it
up to you to commit with Paul's R-b as is, or extend the
adjustments and then also add mine.

> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -641,7 +641,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>  }
>  
>  int arch_acquire_resource(struct domain *d, unsigned int type,
> -                          unsigned int id, unsigned long frame,
> +                          unsigned int id, unsigned int frame,
>                            unsigned int nr_frames, xen_pfn_t mfn_list[]);

Same here wrt hvm_get_ioreq_server_frame().

Jan

