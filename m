Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED712AEACB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24323.51491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcl7Q-0000Gq-U8; Wed, 11 Nov 2020 08:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24323.51491; Wed, 11 Nov 2020 08:04:40 +0000
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
	id 1kcl7Q-0000GR-R3; Wed, 11 Nov 2020 08:04:40 +0000
Received: by outflank-mailman (input) for mailman id 24323;
 Wed, 11 Nov 2020 08:04:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcl7P-0000GM-GJ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:04:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 895e710c-8494-4249-83f1-c5a5ebf9f53e;
 Wed, 11 Nov 2020 08:04:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DC17AC75;
 Wed, 11 Nov 2020 08:04:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cwX6=ER=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcl7P-0000GM-GJ
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:04:39 +0000
X-Inumbo-ID: 895e710c-8494-4249-83f1-c5a5ebf9f53e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 895e710c-8494-4249-83f1-c5a5ebf9f53e;
	Wed, 11 Nov 2020 08:04:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605081872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RKlZesGlo/Jod+lByjm7c3cskP1uxr5yBJcFPgvX8L0=;
	b=IrZl5j10II7JvVlgqMEEsr9j/nxZPlsYpP10mdPvevcD3pR5vNXV8GygOxdZ4jj4C3ZpVh
	BX3EH7pqFCuhfxlkFLoEjMctlpLdP2xy9MTiFyfqlUbSw8ARBgaQe1wdTApoJzlhNvJLWK
	cY5tpFOlTTQ67y9xooRQborAgURzvc8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8DC17AC75;
	Wed, 11 Nov 2020 08:04:32 +0000 (UTC)
Subject: Re: [PATCH V2 11/23] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0582af84-6c2c-9f3d-e056-2f828dd8666a@suse.com>
Date: Wed, 11 Nov 2020 09:04:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-12-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -143,6 +143,19 @@ void evtchn_destroy_final(struct domain *d); /* from complete_domain_destroy */
>  
>  struct waitqueue_vcpu;
>  
> +enum io_completion {
> +    IO_no_completion,
> +    IO_mmio_completion,
> +    IO_pio_completion,
> +    IO_realmode_completion
> +};

May I suggest wrapping at least the last one in #ifdef CONFIG_X86?

Also please add a trailing comma.

Jan

