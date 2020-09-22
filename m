Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DB5273C0B
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:32:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKcme-00089l-2a; Tue, 22 Sep 2020 07:32:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKcmd-00089g-3e
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:32:15 +0000
X-Inumbo-ID: 56f7ec8a-0a10-4c5e-9ab5-d9292269d526
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56f7ec8a-0a10-4c5e-9ab5-d9292269d526;
 Tue, 22 Sep 2020 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600759931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=imblkrn9ceDLM/emiZtlefFra0U8yImhIQZNSNE+Xbs=;
 b=RP3Q3D74BDle8Fy/CtMX1H5SGyvEf1v2PrnvdQmXdD2b4cZ49UoqNIKP
 +fuOpmFL4Euwz87STVC6nxjtcWdi3RqUHr3xFFUDK4qAIUPeWUSS9UlLB
 0DnCUEG7uiEeK2AObo8ML+CuJpu0O7pWqnTQ03l+dPWQe2R/Sc7fFT/25 w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pN38FHBviY2A2B5jjvRXaMfl4t3R5hwYAYISS+7aBNZxvxjJUKclvXnCiss46rNidW/rkcA1W1
 a3xRTTF8/B5YKfC42ryKQrWH5V9IWyZP2ZGc6JFgHQdMir8tMOZUWfkcBXN1oi7Whoq+6yp0Ru
 eE8HH6DJ5ajGNeX4wo8cPJ+bgLvbT85NXNTPvq9RsJot7hqGBPTvBCW2Sjv2RhsM6uYl1ELlYR
 hbujwj3cq0kDHCBTMJNlmAwucLHQQCWAiwM0SInhQPQawg0A4KwCBsNu7hlgdeqywp2Q0DUWFV
 xF4=
X-SBRS: 2.7
X-MesageID: 27333621
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,289,1596513600"; d="scan'208";a="27333621"
Date: Tue, 22 Sep 2020 09:32:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: SeongJae Park <sjpark@amazon.com>
CC: <konrad.wilk@oracle.com>, SeongJae Park <sjpark@amazon.de>,
 <axboe@kernel.dk>, <aliguori@amazon.com>, <amit@kernel.org>,
 <mheyne@amazon.de>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Message-ID: <20200922073202.GH19254@Air-de-Roger>
References: <20200922070125.27251-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200922070125.27251-1-sjpark@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> Persistent grants feature provides high scalability.  On some small
> systems, however, it could incur data copy overhead[1] and thus it is
> required to be disabled.  But, there is no option to disable it.  For
> the reason, this commit adds a module parameter for disabling of the
> feature.

Have you considered adding a similar option for blkfront?

> 
> [1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability
> 
> Signed-off-by: Anthony Liguori <aliguori@amazon.com>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> ---
>  .../ABI/testing/sysfs-driver-xen-blkback        |  8 ++++++++
>  drivers/block/xen-blkback/xenbus.c              | 17 ++++++++++++++---
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> index ecb7942ff146..0c42285c75ee 100644
> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> @@ -35,3 +35,11 @@ Description:
>                  controls the duration in milliseconds that blkback will not
>                  cache any page not backed by a grant mapping.
>                  The default is 10ms.
> +
> +What:           /sys/module/xen_blkback/parameters/feature_persistent
> +Date:           September 2020
> +KernelVersion:  5.10
> +Contact:        SeongJae Park <sjpark@amazon.de>
> +Description:
> +                Whether to enable the persistent grants feature or not.
> +                The default is 1 (enable).

I would add that this option only takes effect on newly created
backends, existing backends when the option is set will continue to
use persistent grants.

For already running backends you could drain the buffer of persistent
grants and flip the option, but that's more complex and not required.

> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index b9aa5d1ac10b..9c03d70469f4 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
>  
>  /* ** Connection ** */
>  
> +/* Enable the persistent grants feature. */
> +static unsigned int feature_persistent = 1;
> +module_param_named(feature_persistent, feature_persistent, int, 0644);
> +MODULE_PARM_DESC(feature_persistent,
> +		"Enables the persistent grants feature");
> +
>  /*
>   * Write the physical details regarding the block device to the store, and
>   * switch to Connected state.
> @@ -906,7 +912,8 @@ static void connect(struct backend_info *be)
>  
>  	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
>  
> -	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
> +	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
> +			feature_persistent ? 1 : 0);

You can avoid writing the feature altogether if it's not enabled,
there's no need to set feature-persistent = 0.

Thanks, Roger.

