Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B672B047A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25743.53712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdBCT-0005E8-Hl; Thu, 12 Nov 2020 11:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25743.53712; Thu, 12 Nov 2020 11:55:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdBCT-0005Dj-EK; Thu, 12 Nov 2020 11:55:37 +0000
Received: by outflank-mailman (input) for mailman id 25743;
 Thu, 12 Nov 2020 11:55:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdBCR-0005De-My
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:55:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3a41be7-38b3-45f1-85c1-6dce4b1ca034;
 Thu, 12 Nov 2020 11:55:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2CCCAEAA;
 Thu, 12 Nov 2020 11:55:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdBCR-0005De-My
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:55:35 +0000
X-Inumbo-ID: b3a41be7-38b3-45f1-85c1-6dce4b1ca034
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b3a41be7-38b3-45f1-85c1-6dce4b1ca034;
	Thu, 12 Nov 2020 11:55:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605182133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdla3Ap0GWpOtbianQP0foKR4T1rYZELNePwWVVMuUE=;
	b=LUhTA6s76UzYJmayPPjgRmRP512fvJcISkJUB9/Sb0uYxbZix/rDZT1VPGAgz9SgcX7WxZ
	NgHP4yo9aADw0rsd2WmaAa9xmxsoVw7TzC1Iy6YqWQ+hWpRH2pxVYdFuT+LAPaSqZoUwZp
	c9HT0nwhCMsMHjMuscSWWiDnyYp2g7c=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E2CCCAEAA;
	Thu, 12 Nov 2020 11:55:32 +0000 (UTC)
Subject: Re: [PATCH V2 20/23] xen/ioreq: Make x86's send_invalidate_req()
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-21-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86ac139b-4dfd-fc45-ea77-3bd51acaea15@suse.com>
Date: Thu, 12 Nov 2020 12:55:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-21-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> --- a/xen/include/asm-x86/hvm/io.h
> +++ b/xen/include/asm-x86/hvm/io.h
> @@ -97,7 +97,6 @@ bool relocate_portio_handler(
>      unsigned int size);
>  
>  void send_timeoffset_req(unsigned long timeoff);
> -void send_invalidate_req(void);
>  bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
>                                    struct npfec);
>  bool handle_pio(uint16_t port, unsigned int size, int dir);
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index 0679fef..aad682f 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -126,6 +126,7 @@ struct ioreq_server *select_ioreq_server(struct domain *d,
>  int send_ioreq(struct ioreq_server *s, ioreq_t *proto_p,
>                 bool buffered);
>  unsigned int broadcast_ioreq(ioreq_t *p, bool buffered);
> +void send_invalidate_ioreq(void);

Again while renaming this function anyway could we see about giving
it a suitable and consistent name? Maybe
ioreq_request_mapcache_invalidate() or (to avoid the double "request")
ioreq_signal_mapcache_invalidate()? Maybe even ioreq_server_...().

Jan

