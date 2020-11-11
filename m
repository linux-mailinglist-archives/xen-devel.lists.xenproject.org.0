Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C598F2AF0A7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 13:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24705.52073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcpIA-0004pz-3m; Wed, 11 Nov 2020 12:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24705.52073; Wed, 11 Nov 2020 12:32:02 +0000
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
	id 1kcpIA-0004pa-0Q; Wed, 11 Nov 2020 12:32:02 +0000
Received: by outflank-mailman (input) for mailman id 24705;
 Wed, 11 Nov 2020 12:32:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kcpI9-0004pV-36
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:32:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62660d43-5c8a-417c-9e3a-7d820735da1f;
 Wed, 11 Nov 2020 12:32:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nKbA=ER=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kcpI9-0004pV-36
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 12:32:01 +0000
X-Inumbo-ID: 62660d43-5c8a-417c-9e3a-7d820735da1f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 62660d43-5c8a-417c-9e3a-7d820735da1f;
	Wed, 11 Nov 2020 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605097919;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ya5B27h6RQZoTfphR52MIu7TwVXHQLFStcdcBHExyXg=;
  b=QSJo05GK/ZKFlv9QD7cdyhrvEyqkFIJ0Z/UYTMyxjYaaoZ13GXHnAdEC
   fllrq7hn1jBKOMXzCF5ONKAZ7ys/A6fPsSqgg8fG4wV3u4uu3oE7Ibpz5
   pGvCrw++8XMlpFBGsuvwkg2SV7QRvg7lWXYUzUpbvl4Qvh03LpBpWggfY
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rDylXtWvm8lU2NfmA01NuS0AWhKrgxt/oyU1iodSuT0ZLAME3b3zXvCEkBxJZYPmsxqDf7o9TS
 mHnUaZlmuVvuYiSfHiYvz6f/7eCKdI916HfxHGndD9H1As+1HGOvYecAQtgZ0WKrGveKfvqm7W
 famIo/Hjhv+ka0gmdwr/0anRaSmOWTnQLDIqPD4PMzIeg6PNPy81b3BiFtvlMg8bo8zX7mYwqh
 c3CKXjVhQ8gVjOOcrCtvWRWnwTi8+raQgkGRZcadcnkXbdZe9Dmjib9TTiCmFn21AxbG9f/5FZ
 gvc=
X-SBRS: None
X-MesageID: 31177693
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,469,1596513600"; 
   d="scan'208";a="31177693"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBOFs+GzVKGxWfgbMgoKvb5cu7YP7CQjxTLA/Ac5lSv8KXuafzODJcDDFGLacBPrAslJGzekQq04CELy5OlO0yrXAogrzSAeZDVgA+NlFn0bPch+nm0Mm8Uezf9UHv9lyI6nI8xFiV83TdCZ0ytURDZ2aM0bBgzMJadBjPKWgnHJ/bh5+LevomUhPUSK6y46U3oW5g6ljbFgSNdiwygYEhGAVfT1u+1j2XFgKX7Q0V63qZu0DmZ28SA2rz5iRA/w5EBnrngFwlpqVX//3yQDGW6ZrxV6EHnzxzq0cxTstj2cKl93vGOuy9af4JdpBUBZ+GJBHOn+AQ2fC4xdd44q2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMSgqEL7BYtggw2p1pxICEx1c2/JyeBlvGnY2tMPgu8=;
 b=jKKLO5sz4x50jstD09X+u04iyeAiFw/VmrZhThkA+S5qXgNygqnNWHOswhgnJk2mdOaEqdJZR65m/P9HORS6HbamTJTnMbqwzNaGEUCvso/An7yGCPjjB+T39MWIquhxjHbkizTQ77hJKk6+qD2f3+uGVmiBl29ei22GtcWiTuCqvkeIjPlbAn6KJrrMzXwDsKzqsdlJ6Do5+OGnFLS3DH6Mjugi7pPzjFPNAhaGEcN0tub+UFTdZ4vS5cjb4uWUZ/VFeAS2Ea3u+8B2gu8TRQJa1e/n6uTAjVG5Zjkv6z6p1GX52ykwnNza+z+3FfM8/2r9ESzFl6zRrk2YeMlw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMSgqEL7BYtggw2p1pxICEx1c2/JyeBlvGnY2tMPgu8=;
 b=o+JmtyE9MgOOcUuvpR4F19C1DceD/L63cHj1w7ko47ebOgfPbsfmOim9dsNerUmPk88wEI88CTzqqxAVICAqrx1AkAXLisJzlVPz4mFbKPpCxtZuntprXk7KfJvk5JB0x43WdMKp5IRqdH/rPB+joP3lOgmFVsMhn3i+2BWMoo0=
Date: Wed, 11 Nov 2020 13:31:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [SUSPECTED SPAM][PATCH 01/10] pci/pvh: Allow PCI toolstack code
 run with PVH domains on ARM
Message-ID: <20201111123150.7lkabdo3wix7jkdk@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-2-andr2000@gmail.com>
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b42d3b0f-2530-40cc-ab96-08d8863dc672
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-Microsoft-Antispam-PRVS: <DM5PR03MB30681296A87B7E823A97DA5B8FE80@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VL6RDgx4SLqR9Mo9f5fXqD/k33wpsAxoZCt9kS1rGW3hlg4cYNZRpVJDkEdTSNLDEw0BIpYlk/nonRJ3GByqGgt/xYmxb2mxZknIw7U0LB7qAk2FyUVHnxYvSjVML1eYs77BE2niMLxykFQ2s15lh6E1ONEU34E/GKOKvT2T37CLcaBu+Rmb+NCyDFKV+9DZbCxWknXiIPEQ/wWk+28zZC+yyF6xbzsjvkoDV02ONZyq2zApN5m5uBCC820yi8dmfS8ziKdEso8NSX2TNRz6c8A3GRIfjOF347a9jw9vXVLIHJW3eDc4CWYEo7uOn4k5MMjMnEfbhDMpsJAgqGUYgyADM1Jlh2Ozp1o+9Y2wEo4RIzBcZ434rA15XnCjMam6hn8p5NC6pdLUfaXQbtzegg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(346002)(366004)(396003)(136003)(956004)(1076003)(4326008)(2906002)(33716001)(9686003)(6486002)(8936002)(86362001)(16526019)(66476007)(186003)(6496006)(66946007)(66556008)(26005)(5660300002)(316002)(6666004)(7416002)(83380400001)(966005)(6916009)(478600001)(85182001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8feHkHG2sNYzFeTgDXAQmfzRdLX4aYnzkz8sTJaf7rhcjvlRYYJ3EDtzZf1hk3eEuXSXsjQjbzJkqylACTChSMvLwd/ufLmDHCIpNgZFQbIgLIjCz7qpyBcCfbrOlXH61hRY/5RG36cWukGORzx2Isa3uZIP1Cdc3lXkyz/TL8orW73s5js/IacsqxjrYGb4XVplYiBEILiuIc/SGKBlP/bh3xJ+h1a1sAgeKwuITpU9HlyanaiuoKnvyU6hd0wg1iKmSC+y9k7Dt+jKbC/k5CQ4nB80xgJgkswyyfQUqN7qS/HZ2BniXP4xQTM88puqsE/F/7N/AFYs8/j47oHX+JRdY+N/Ocy4yoaYlUM3r8Yw7AOJbvZBSsnAcwoHO7EHPlkO+7+QGEjA38antXCOQRiJEUmyYU4cSYuqkSkp77UjHERc6eT/pOnWsaWO6kQzTA+LoC7027WKbrLaDp6QkQkN+FCSSj2m2ArYmCz6FKB3fU/kADm1kilm4f/3dXk2TU0gRU7iyuleKHgUpxrb/saNOJmF7cTKvXbpF89oeh1trOrUfHDlp2mCeb0gF/1EYCugWvXgQ3ud3NtgaORcFhfqgm3lMq7YW2jKxjOpoS6syN7aQsKJtHwNPB9cHa8/TaTq/OjFqtR1IbGwAU8RVTJFqafOwwlnn1qr339TslevIeh+fZ+Yug8upiHkzLUhNYvVPwTmpPt+o1lZIdSBPlc+P7yR9s/k2V6MevCFoViaNCUPQqEBPeTO8vjf9qdUsakFW7vs+E4tcj249x5xLQ6PhK4bvkL5GhSWgK2pkeeTlsjQm3P4RAT9d68G7pPNxtkST+oIWk1u/b/Ylr6yTC7lN0m2uNp8APuyeWgIiE30reRkkjHo3PYn5W5GPITHuqGDtQ49hLCzAB2ggPEa/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b42d3b0f-2530-40cc-ab96-08d8863dc672
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 12:31:55.5357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgs4OgcYxl8wtvOIx3Mn7erDcDjzTmY6G4MmjwkTdQg8o7/kVVyBDUfivaYiRdYMYjHiEVtgs1iKkWHECwFmlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:22PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> According to https://wiki.xenproject.org/wiki/Linux_PVH:
> 
> Items not supported by PVH
>  - PCI pass through (as of Xen 4.10)
> 
> Allow running PCI remove code on ARM and do not assert for PVH domains.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  tools/libxl/Makefile    | 4 ++++
>  tools/libxl/libxl_pci.c | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
> index 241da7fff6f4..f3806aafcb4e 100644
> --- a/tools/libxl/Makefile
> +++ b/tools/libxl/Makefile
> @@ -130,6 +130,10 @@ endif
>  
>  LIBXL_LIBS += -lyajl
>  
> +ifeq ($(CONFIG_ARM),y)
> +CFALGS += -DCONFIG_ARM
> +endif
> +
>  LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
>  			libxl_dom.o libxl_exec.o libxl_xshelp.o libxl_device.o \
>  			libxl_internal.o libxl_utils.o libxl_uuid.o \
> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> index bc5843b13701..b93cf976642b 100644
> --- a/tools/libxl/libxl_pci.c
> +++ b/tools/libxl/libxl_pci.c
> @@ -1915,8 +1915,10 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
>              goto out_fail;
>          }
>      } else {
> +        /* PCI passthrough can also run on ARM PVH */
> +#ifndef CONFIG_ARM
>          assert(type == LIBXL_DOMAIN_TYPE_PV);
> -
> +#endif

I would just remove the assert now if this is to be used by Arm and
you don't need to fork the file for Arm.

Roger.

