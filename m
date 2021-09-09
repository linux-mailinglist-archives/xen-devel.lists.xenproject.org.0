Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F5E4048BE
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182982.330877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHje-0003lm-OA; Thu, 09 Sep 2021 10:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182982.330877; Thu, 09 Sep 2021 10:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOHje-0003jn-Kw; Thu, 09 Sep 2021 10:56:50 +0000
Received: by outflank-mailman (input) for mailman id 182982;
 Thu, 09 Sep 2021 10:56:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sph1=N7=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1mOHjd-0003jh-5q
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:56:49 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a0fec65c-115c-11ec-b1ac-12813bfff9fa;
 Thu, 09 Sep 2021 10:56:47 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-4Wz7aK0gNlazTywP9efKtw-1; Thu, 09 Sep 2021 06:56:46 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 688E01093943;
 Thu,  9 Sep 2021 10:55:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A963A6A255;
 Thu,  9 Sep 2021 10:55:11 +0000 (UTC)
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
X-Inumbo-ID: a0fec65c-115c-11ec-b1ac-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631185007;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8VaXxkl6U6Rqdk0TTHun1PGjCpzFTVuNs2kej6qU7w=;
	b=aK9qH6QqgEz9bldU+5IIaOXsDYbKAUaNDm51mVLuX8BzvC1/6N7Kb8yDuLRRg22cuaElTm
	1innCy44sHLRJcuHGHv79g7z+vh9/Pt5xkUSDLT0pi4DwRnpbMO/rtGjwAT7VcJSXv31jh
	55xsYByu6FoI3a2IJulqY4f9IQUieAM=
X-MC-Unique: 4Wz7aK0gNlazTywP9efKtw-1
Date: Thu, 9 Sep 2021 11:55:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH 03/10] block: Use qemu_security_policy_taint() API
Message-ID: <YTnoDYpDaj055PnS@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-4-philmd@redhat.com>
 <YTnkhxWbm3NvGo/T@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTnkhxWbm3NvGo/T@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 09, 2021 at 11:40:07AM +0100, Daniel P. Berrangé wrote:
> On Thu, Sep 09, 2021 at 01:20:17AM +0200, Philippe Mathieu-Daudé wrote:
> > Add the BlockDriver::bdrv_taints_security_policy() handler.
> > Drivers implementing it might taint the global QEMU security
> > policy.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  include/block/block_int.h | 6 +++++-
> >  block.c                   | 6 ++++++
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/block/block_int.h b/include/block/block_int.h
> > index f1a54db0f8c..0ec0a5c06e9 100644
> > --- a/include/block/block_int.h
> > +++ b/include/block/block_int.h
> > @@ -169,7 +169,11 @@ struct BlockDriver {
> >      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flags,
> >                            Error **errp);
> >      void (*bdrv_close)(BlockDriverState *bs);
> > -
> > +    /*
> > +     * Return %true if the driver is withing QEMU security policy boundary,
> > +     * %false otherwise. See: https://www.qemu.org/contribute/security-process/
> > +     */
> > +    bool (*bdrv_taints_security_policy)(BlockDriverState *bs);

Also as with previous comments, I think we should not refer
to tainting or the security policy here, but instead simply
document whether we consider the bdrv to be secure or not.

Tainting is merely one action that is taken in accordance with
the security policy, as a result of the information presented.

> >      int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
> >                                         Error **errp);
> > diff --git a/block.c b/block.c
> > index b2b66263f9a..696ba486001 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -49,6 +49,7 @@
> >  #include "qemu/timer.h"
> >  #include "qemu/cutils.h"
> >  #include "qemu/id.h"
> > +#include "qemu-common.h"
> >  #include "block/coroutines.h"
> >  
> >  #ifdef CONFIG_BSD
> > @@ -1587,6 +1588,11 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
> >          }
> >      }
> >  
> > +    if (drv->bdrv_taints_security_policy) {
> > +        qemu_security_policy_taint(drv->bdrv_taints_security_policy(bs),
> > +                                   "Block protocol '%s'", drv->format_name);
> > +    }
> > +
> >      return 0;
> >  open_failed:
> >      bs->drv = NULL;
> 
> Again we need a way to report this via QAPI, but we don't have a natural
> place is hang this off for introspection before starting a guest.
> 
> The best we can do is report the information after a block backend has
> been instantiated. eg  Modify "BlockInfo" struct to gain
> 
>    '*secure': 'bool'
> 
> Note I made this an optional field, since unless we mark every single
> block driver impl straight away, we'll need to cope with the absence
> of information.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


