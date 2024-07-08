Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E765292AB1B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 23:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755629.1164035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQvnV-0007tJ-DD; Mon, 08 Jul 2024 21:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755629.1164035; Mon, 08 Jul 2024 21:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQvnV-0007qg-Ae; Mon, 08 Jul 2024 21:21:21 +0000
Received: by outflank-mailman (input) for mailman id 755629;
 Mon, 08 Jul 2024 21:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uJ/s=OI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sQvnU-0007qa-0p
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 21:21:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 026fbee2-3d70-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 23:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 697A68287291;
 Mon,  8 Jul 2024 16:21:15 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Dg_taPyFb3Vm; Mon,  8 Jul 2024 16:21:09 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C95D0828714A;
 Mon,  8 Jul 2024 16:21:09 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r9A20hLIWohC; Mon,  8 Jul 2024 16:21:09 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 66FCB8286B32;
 Mon,  8 Jul 2024 16:21:09 -0500 (CDT)
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
X-Inumbo-ID: 026fbee2-3d70-11ef-bbfb-fd08da9f4363
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C95D0828714A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1720473669; bh=r7q49DSuNl/UAjFL3ztd3akz3yYTJXQ75erudh7cW3k=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=X9RkFbghc3w8udBalc+1IyzX1Hh5ViVXlTwJgVpLDb72gcME0djtkR0qeplZ/e9+W
	 CkAEWTi1ufzZqHbrzF0OtOtLkb98c5eVCaCDLhxAY6nJXhW17RPkpYZTOhxZnoxNnp
	 9pXkoCJD4Lcn6kcnOcHeBbO2gLTHn+iU37CrjTgE=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f3bad5a8-077e-40e7-abff-7a2cc0027d2b@raptorengineering.com>
Date: Mon, 8 Jul 2024 16:21:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ppc/shutdown: Implement machine_{halt,restart}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20240705182311.1968790-1-andrew.cooper3@citrix.com>
 <20240705182311.1968790-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240705182311.1968790-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

Overall this looks good, I just have one comment.

On 7/5/24 1:23 PM, Andrew Cooper wrote:
> diff --git a/xen/arch/ppc/shutdown.c b/xen/arch/ppc/shutdown.c
> new file mode 100644
> index 000000000000..c4b00e57b13a
> --- /dev/null
> +++ b/xen/arch/ppc/shutdown.c
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/shutdown.h>
> +
> +#include <asm/opal-api.h>
> +
> +int64_t opal_cec_power_down(uint64_t request);
> +int64_t opal_cec_reboot(void);
> +int64_t opal_poll_events(uint64_t *outstanding_event_mask);
> +
> +void machine_halt(void)
> +{
> +    int rc;
> +

Before the opal_cec_{power_down,reboot} calls are made, any interupts
reserved for OPAL to handle need to be masked off.

Since we don't have any set up at this point, I would just add a TODO
comment like:

/* TODO: mask any OPAL IRQs before shutting down */

> +    do {
> +        rc = opal_cec_power_down(0);
> +
> +        if ( rc == OPAL_BUSY_EVENT )
> +            opal_poll_events(NULL);
> +
> +    } while ( rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT );
> +
> +    for ( ;; )
> +        opal_poll_events(NULL);
> +}
> +
> +void machine_restart(unsigned int delay_millisecs)
> +{
> +    int rc;
> +
> +    /* TODO: mdelay(delay_millisecs); */
> +

Ditto.

> +    do {
> +        rc = opal_cec_reboot();
> +
> +        if ( rc == OPAL_BUSY_EVENT )
> +            opal_poll_events(NULL);
> +
> +    } while ( rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT );
> +
> +    for ( ;; )
> +        opal_poll_events(NULL);
> +}
> +

Other than that, looks great.

Reviewed-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

