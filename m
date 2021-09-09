Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BF4048A2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182968.330856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHTi-00015x-1y; Thu, 09 Sep 2021 10:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182968.330856; Thu, 09 Sep 2021 10:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHTh-00013D-UP; Thu, 09 Sep 2021 10:40:21 +0000
Received: by outflank-mailman (input) for mailman id 182968;
 Thu, 09 Sep 2021 10:40:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sph1=N7=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1mOHTg-000135-13
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:40:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 528a7fe3-115a-11ec-b1ac-12813bfff9fa;
 Thu, 09 Sep 2021 10:40:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-P32uXViMPg6xrcmBrVASwA-1; Thu, 09 Sep 2021 06:40:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F11D802929;
 Thu,  9 Sep 2021 10:40:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C0DC61156;
 Thu,  9 Sep 2021 10:40:09 +0000 (UTC)
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
X-Inumbo-ID: 528a7fe3-115a-11ec-b1ac-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631184018;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oL33Aa6CtkK/7ZX9sUngGFwqhn1cvVQ/PE0/Nntta0Q=;
	b=CBBpD3RPJbz64EG4V2nqxguOM82RQYoUfSpmWVhJHkt7Ix7tFzcsd8zj9KUyEp2Lreuun5
	iERGQunj15NpwKQsUsoH6oL4YbFhccp/wK9zp7y1+QAZCa3PVbVcZnmp8FUZG7LzqEo1nC
	2A6AbWLly2/W9JPwAA0JF7IExBWCjpE=
X-MC-Unique: P32uXViMPg6xrcmBrVASwA-1
Date: Thu, 9 Sep 2021 11:40:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
Message-ID: <YTnkhxWbm3NvGo/T@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-4-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 01:20:17AM +0200, Philippe Mathieu-Daudé wrote:
> Add the BlockDriver::bdrv_taints_security_policy() handler.
> Drivers implementing it might taint the global QEMU security
> policy.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/block_int.h | 6 +++++-
>  block.c                   | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index f1a54db0f8c..0ec0a5c06e9 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -169,7 +169,11 @@ struct BlockDriver {
>      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp);
>      void (*bdrv_close)(BlockDriverState *bs);
> -
> +    /*
> +     * Return %true if the driver is withing QEMU security policy boundary,
> +     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);
>  
>      int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
>                                         Error **errp);
> diff --git a/block.c b/block.c
> index b2b66263f9a..696ba486001 100644
> --- a/block.c
> +++ b/block.c
> @@ -49,6 +49,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/cutils.h"
>  #include "qemu/id.h"
> +#include "qemu-common.h"
>  #include "block/coroutines.h"
>  
>  #ifdef CONFIG_BSD
> @@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
>          }
>      }
>  
> +    if (drv->bdrv_taints_security_policy) {
> +        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
> +                                   "Block protocol '%s'", drv->format_name);
> +    }
> +
>      return 0;
>  open_failed:
>      bs->drv = NULL;

Again we need a way to report this via QAPI, but we don't have a natural
place is hang this off for introspection before starting a guest.

The best we can do is report the information after a block backend has
been instantiated. eg  Modify "BlockInfo" struct to gain

   '*secure': 'bool'

Note I made this an optional field, since unless we mark every single
block driver impl straight away, we'll need to cope with the absence
of information.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


