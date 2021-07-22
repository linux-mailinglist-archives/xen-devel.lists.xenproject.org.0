Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2F3D2547
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 16:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159771.293806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6ZRI-0003By-9h; Thu, 22 Jul 2021 14:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159771.293806; Thu, 22 Jul 2021 14:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6ZRI-00039V-6p; Thu, 22 Jul 2021 14:12:40 +0000
Received: by outflank-mailman (input) for mailman id 159771;
 Thu, 22 Jul 2021 14:12:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bcJ=MO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m6ZRG-00039P-9X
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 14:12:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 854f3583-b2ef-4923-a9de-b0f28f81a661;
 Thu, 22 Jul 2021 14:12:36 +0000 (UTC)
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
X-Inumbo-ID: 854f3583-b2ef-4923-a9de-b0f28f81a661
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626963156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8i7/RhkbG8i8iGp6/KXzouNQ7fz0VX8u4ti+O4wZlS4=;
  b=THRKi+5vh0YPAZO0uqKFZUdGYLcLmQGdqHdfjmC4cR6bvHxhE3q1r4Ee
   aElzz4qNxoyeNXxzZzCYACrYJnu6cJ+nHIti7wcrulRJlo2E0BvHAbVcP
   4dD4ml5hk7eckG8LaV9SZgyDtC+8omwkVGyM9SSy/oZ+wfWIlbeZm0Sd/
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qHqLuLlUgp0+8rWtYRb4/O0NLQm2IPo3X3SUfZZywG69bIXv8WdNxCyEk6tgIB/9pHIaAGDwLW
 BjL0W8/QVRWq3CpS8VJDOs3K+pGFwe7um29+eatlsO+awU2AMxZgco8vnjGEqUyKrsA29Hb+41
 YNe68X8paXCR3K/iiGHvmGCtBzY2iSXM91c/lAO8vbg1cy4qbiJPZ7micr2U/YuOc7D9snlMy1
 d0KiFnSYrldzzB37pi7BUNPE8fJNpcTevGxQ5QB+g9bvtKTkwXcE3rVmE+ZlGSyUjJjLUqy//0
 pygq9I83akLGFBZ2tdw00U+A
X-SBRS: 5.1
X-MesageID: 48909183
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:at/y260s0v0WudClQp2tKwqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.84,261,1620705600"; 
   d="scan'208";a="48909183"
Date: Thu, 22 Jul 2021 15:12:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vl: Parse legacy default_machine_opts
Message-ID: <YPl80YnsDpLI8gtN@perard>
References: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
 <20210713021552.19110-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210713021552.19110-1-jandryuk@gmail.com>

On Mon, Jul 12, 2021 at 10:15:52PM -0400, Jason Andryuk wrote:
> qemu can't start a xen vm after commit d8fb7d0969d5
> "vl: switch -M parsing to keyval" with:
> 
> $ ./qemu-system-i386 -M xenfv
> Unexpected error in object_property_find_err() at ../qom/object.c:1298:
> qemu-system-i386: Property 'xenfv-3.1-machine.accel' not found
> Aborted (core dumped)
> 
> The default_machine_opts handling doesn't process the legacy machine
> options like "accel".  Call qemu_apply_legacy_machine_options to provide
> the legacy handling.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

I can't find a different way to set a default "accelerator" to a
machine, so this patch seems necessary.

Thanks,

> ---
>  softmmu/vl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4df1496101..f4d8630fc6 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2126,6 +2126,7 @@ static void qemu_create_machine(QDict *qdict)
>          QDict *default_opts =
>              keyval_parse(machine_class->default_machine_opts, NULL, NULL,
>                           &error_abort);
> +        qemu_apply_legacy_machine_options(default_opts);
>          object_set_properties_from_keyval(OBJECT(current_machine), default_opts,
>                                            false, &error_abort);
>          qobject_unref(default_opts);

-- 
Anthony PERARD

