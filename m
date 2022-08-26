Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E95A2966
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393922.633135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRaIo-0006Nn-Bg; Fri, 26 Aug 2022 14:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393922.633135; Fri, 26 Aug 2022 14:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRaIo-0006LY-8v; Fri, 26 Aug 2022 14:27:18 +0000
Received: by outflank-mailman (input) for mailman id 393922;
 Fri, 26 Aug 2022 14:27:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wu6=Y6=amazon.de=prvs=230e9f9c6=mheyne@srs-se1.protection.inumbo.net>)
 id 1oRaIm-0006LS-Hj
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 14:27:17 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ddbf04a-254b-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 16:27:15 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-b09ea7fa.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 14:27:00 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-b09ea7fa.us-west-2.amazon.com (Postfix) with
 ESMTPS id A73F044E7B; Fri, 26 Aug 2022 14:26:59 +0000 (UTC)
Received: from EX19D048UWA004.ant.amazon.com (10.13.139.40) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Fri, 26 Aug 2022 14:26:59 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D048UWA004.ant.amazon.com (10.13.139.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Fri, 26 Aug 2022 14:26:58 +0000
Received: from dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (10.15.57.183)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1497.38 via Frontend Transport; Fri, 26 Aug 2022 14:26:58 +0000
Received: by dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id 4069E26EF; Fri, 26 Aug 2022 14:26:58 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2ddbf04a-254b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1661524035; x=1693060035;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=3KHfG9pE5vUtzEuAuE175SucQTfUj+3os4tgSI5rGug=;
  b=BRujo0VQI/jE021v/Pr+D8b+4umEbqrJymmEKBT5I+QeBZKawQPKG46g
   fNF/Ga7YIcFCRT2sV7x4XRdSoiquhGdkSgW3i5PJBn9hMKeDkGwYpWts3
   Iw1X8lIYOY4udkNRmzaxvyBqpc8YKwZNeGBIUHUC3mdX7sA2Y9nFjGscg
   w=;
X-IronPort-AV: E=Sophos;i="5.93,265,1654560000"; 
   d="scan'208";a="237815397"
Subject: Re: [PATCH 2/2] xen-blkfront: Advertise feature-persistent as user requested
Date: Fri, 26 Aug 2022 14:26:58 +0000
From: Maximilian Heyne <mheyne@amazon.de>
To: SeongJae Park <sj@kernel.org>
CC: <jgross@suse.com>, <roger.pau@citrix.com>,
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>,
	<axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Message-ID: <20220826142658.GA77627@dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com>
References: <20220825161511.94922-1-sj@kernel.org>
 <20220825161511.94922-3-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <20220825161511.94922-3-sj@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2022 at 04:15:11PM +0000, SeongJae Park wrote:
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you can confirm the sender and know t=
he content is safe.
> =

> =

> =

> Commit e94c6101e151 ("xen-blkback: Apply 'feature_persistent' parameter
> when connect") made blkback to advertise its support of the persistent
> grants feature only if the user sets the 'feature_persistent' parameter
> of the driver and the frontend advertised its support of the feature.
> However, following commit 402c43ea6b34 ("xen-blkfront: Apply
> 'feature_persistent' parameter when connect") made the blkfront to work
> in the same way.  That is, blkfront also advertises its support of the
> persistent grants feature only if the user sets the 'feature_persistent'
> parameter of the driver and the backend advertised its support of the
> feature.
> =

> Hence blkback and blkfront will never advertise their support of the
> feature but wait until the other advertises the support, even though
> users set the 'feature_persistent' parameters of the drivers.  As a
> result, the persistent grants feature is disabled always regardless of
> the 'feature_persistent' values[1].
> =

> The problem comes from the misuse of the semantic of the advertisement
> of the feature.  The advertisement of the feature should means only
> availability of the feature not the decision for using the feature.
> However, current behavior is working in the wrong way.
> =

> This commit fixes the issue by making the blkfront advertises its
> support of the feature as user requested via 'feature_persistent'
> parameter regardless of the otherend's support of the feature.
> =

> [1] https://lore.kernel.org/xen-devel/bd818aba-4857-bc07-dc8a-e9b2f8c5f7c=
d@suse.com/
> =

> Fixes: 402c43ea6b34 ("xen-blkfront: Apply 'feature_persistent' parameter =
when connect")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Reported-by: Marek Marczykowski-G=F3recki <marmarek@invisiblethingslab.co=
m>
> Suggested-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  drivers/block/xen-blkfront.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 8e56e69fb4c4..dfae08115450 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -213,6 +213,9 @@ struct blkfront_info
>         unsigned int feature_fua:1;
>         unsigned int feature_discard:1;
>         unsigned int feature_secdiscard:1;
> +       /* Connect-time cached feature_persistent parameter */
> +       unsigned int feature_persistent_parm:1;
> +       /* Persistent grants feature negotiation result */
>         unsigned int feature_persistent:1;
>         unsigned int bounce:1;
>         unsigned int discard_granularity;
> @@ -1848,7 +1851,7 @@ static int talk_to_blkback(struct xenbus_device *de=
v,
>                 goto abort_transaction;
>         }
>         err =3D xenbus_printf(xbt, dev->nodename, "feature-persistent", "=
%u",
> -                       info->feature_persistent);
> +                       info->feature_persistent_parm);
>         if (err)
>                 dev_warn(&dev->dev,
>                          "writing persistent grants feature to xenbus");
> @@ -2281,7 +2284,8 @@ static void blkfront_gather_backend_features(struct=
 blkfront_info *info)
>         if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard"=
, 0))
>                 blkfront_setup_discard(info);
> =

> -       if (feature_persistent)
> +       info->feature_persistent_parm =3D feature_persistent;

I think setting this here is too late because "feature-persistent" was alre=
ady
written to xenstore via talk_to_blkback but with default 0. So during the
connect blkback will not see that the guest supports the feature and falls =
back
to no persistent grants.

Tested only this patch with some hacky dom0 kernel that doesn't have the pa=
tch
from your series yet. Will do more testing next week.

> +       if (info->feature_persistent_parm)
>                 info->feature_persistent =3D
>                         !!xenbus_read_unsigned(info->xbdev->otherend,
>                                                "feature-persistent", 0);
> --
> 2.25.1
> =




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




