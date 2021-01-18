Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9F2FA829
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69945.125411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YpJ-0004W8-Is; Mon, 18 Jan 2021 18:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69945.125411; Mon, 18 Jan 2021 18:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YpJ-0004Vj-Fo; Mon, 18 Jan 2021 18:00:29 +0000
Received: by outflank-mailman (input) for mailman id 69945;
 Mon, 18 Jan 2021 18:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1YpI-0004Ve-0T
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:00:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf01bed0-b623-4292-a6f3-34573cadc765;
 Mon, 18 Jan 2021 18:00:27 +0000 (UTC)
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
X-Inumbo-ID: cf01bed0-b623-4292-a6f3-34573cadc765
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610992827;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2kG4wIYYW0Eh459rDZB88oRlp/31zdFWmDgqarkmNjI=;
  b=DwxMf9mIQZXBhhmk9Qg5czD+Gmwqz2g+dKn2jm2tGOCcaDoRq+xk/uBW
   qB50zp7lKcEylpC0cV+64OE0bopPuAetRs7NoDs2u+DmgAbrWrB1msUhl
   qRy1SmOPjnslGh9Xlqg7iyq4idJfSG50J+jjqBDITn1mfzu34kGzgvSVP
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2AYKlm/04T6Sj5vdcwVaAEedGEp3hoK+iV9rJzu8jylq7pFH2HqqwvD5fT9hmK0ReM2OWuWMap
 AWe0PxFvcx598lGpTN4G4gy2jd31ziolfuilcfd69l6x/IUbqsvGHHq5mrZwZsCtQRva77S2gM
 /5sxr1ntefUJJ9OdEZw6AOX6BTvHp709hYG1tVvrBgFsk3MVC4av9Ts2I21TBpjruepw5DIRt2
 HG0ImKukl4QI7lkin7LKUXZoe55U9g+0S68WvxRh7oqg0EioXA8aebMu7r4jFsaiShK/oqhnuE
 jH8=
X-SBRS: 5.2
X-MesageID: 36613177
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="36613177"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQuCdcG6b87hIXJI1HN4pqgdeIqF4UpOlLrhNGACzJLFW24Uh15POBrR0SjA1ycdbtI3xpJoFeJ5MYNmGQVbuxZ577hwltSVOK37ECQtT9A2Zp7Sr/ieZRTbmztVeHbaUItOdGoXd6FC1mbUmERoDInFJ0NZTwyCWQLK4Tdz/LsKE7J1VROfcb70ChJ9w4C/bG15NDMitr465QqT6I5F8DA9Ijjch0V+jCaDuTaAlhfKa2AGhTEI8/zlDwvQctu9s4Xv2fOqRZTsLY+JIUzaJpJJ/4UzwzT4tj73tavyC9WWW76wSwSmTqnhJ2URl9haTjTHyC8OHQ7qs2NFGdRTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+6gPxPqVgSJvVpPJ7cYeY5RSBFk4PSWp3HUQo6PSDA=;
 b=Op/Fzgf1K9gsfh9B2fqtd8ohVDoDkClxojIoRz5IOwW3+N2YmfyHL1+urnKtriiRhl2vhxGVebA0ixYz4vAit17m8766Ms4zFwMGHrpkudtrGrxAYpOfiWHrUH1FLah9JRhvG8GueMbXCLdClGTakDw1pTPwS9Bi5g2Cpl6Sixjr29WkUXcPmPoaPRZ8fargF/QAiiEVbscwBfjHCSA+kN0z/iqTDJj83zHHu9AioEFcTsfqbCCtJIzBSE1tu/AatLZxOR4+kyCXni1RBcnSAzD3VTGT4TLSN29zReAaqtuB/ovIr8zc+sLTXQmMbBbx3uMq2QdqvMnlAZorei/WYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+6gPxPqVgSJvVpPJ7cYeY5RSBFk4PSWp3HUQo6PSDA=;
 b=df4y8Bl5xZQuNBPPn6P4bvgO0rdQcR0QTjdPjpb+HcKnsg9/X3ctFhv/UOIUZs9FbjpLndyvxFvFlNvvJETYpAOuGRj5zMd6E0PaVg5QIx2+Aq324/T71OVwvFP7f2ktq75nFnDYGJCBizpK2aN6ZLco1xpXx4o89a6mNrjkHGo=
Date: Mon, 18 Jan 2021 19:00:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/call: fix build on NetBSD
Message-ID: <20210118180016.325pkeybul5dwcpo@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-9-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-9-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d3f3e96-4afb-4be2-fddd-08d8bbdaec59
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:
X-Microsoft-Antispam-PRVS: <DM6PR03MB51791E9D139508FAF8A9DBA18FA40@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Zl+2oT0d1gPz2sPTNIIeXtwm8GJYRBK6lEtDO13vSGulY/ICGzFdANvvc77DPepW3tYu0SQZ3R3ejI7rcljeM9rEZEsnF/5qxIceTnLccwsyh7WiUgvoK72qDEdVyXmVU7jbJgIKatEROayT+QiE418Y8dBMYx1HTM+pJxASLrds6I4kWJG+zqan+/E760+ma9kwSIMQUY9AzUJksmseB/JDJb+KKdoYHj+QqFfzI55Qll44rIoYOWC9ousKTnPfyWUPPf2VgMu69j8YBpIyMdFPG20IExTnBQmDlQOJy6Yixsawzik6DYKao0Epmnp2FxMIOdAuDvww44/TncTdVmzZc/6QqmQmBul0JcF5dzCxUuGYglAz/unaUnRTNrmPsoditLnHGfmydmZKfz49A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(6496006)(478600001)(316002)(54906003)(6916009)(6666004)(186003)(5660300002)(26005)(66556008)(1076003)(66476007)(66946007)(33716001)(956004)(16526019)(8676002)(86362001)(8936002)(6486002)(9686003)(85182001)(4326008)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWlTakJsMFNWU0Zmcm9MV1lVeTE0Yk5RaTVCcWZmcE4xc2krWDhVYjI2eW5h?=
 =?utf-8?B?Q3RXN1ZmQXM0QW1yWVV2ZVlnWDZMTW45MmJVZVZNNHAvaEdOWmc4UHlhSHJT?=
 =?utf-8?B?OXdZdjFIeXBYVlJPaEtZN2JhYjJlbTdBZzAyaXBTMmJCbElad3pIcmxMMUpR?=
 =?utf-8?B?Q3RFOU1qNHlxNkV6dXRSUkRHWkRUWFZuNXJTdnRNd0JyYk96WEVKTXYyWTNO?=
 =?utf-8?B?YU9iMzkrSzlhaVBoS1VPdHprYnZkckdhWC9UanRINkY4c0NDQWZLZHkzYVpZ?=
 =?utf-8?B?ZGVYNUtYd1lCYWRGb3k5aXNpbjRQVDFRVEVPSlJUd2Yxeld2ajRCM09GUXlG?=
 =?utf-8?B?OGpyR1l5clYzN1lQd1RHOHROQlArTnQxRTEzWnRoZHZtMCtVaGU4SjhXdGk1?=
 =?utf-8?B?Nml5OEtZL2gwSEdoR1FCRzhjQmJCYnpublRHeUdnTkdPaURvQVMwbjgxa3VV?=
 =?utf-8?B?WS9VNVFjL3c4SytKRWw1NkxXTDFiRnFmdnRlUkVIMEo5WWlkWC9qODFrbHd0?=
 =?utf-8?B?bGdCOGppRjdOUjFnRnRXeVR0RmpUWkdwekw3L0N0djJjQVNXbUpUUDNQL3dK?=
 =?utf-8?B?M3NKRVpPMzJxNkVnQWI1WGxTRmdaRGNjZzBYVmQ0MmEyWnovV2pIZFBsdEd4?=
 =?utf-8?B?Q2NYNDd6L0Mxb1ZtRXBFZUROeUVId1R6YUZHY3NSY3BGOWs4dlJPY3ZKREFz?=
 =?utf-8?B?Yml3WklEaXNZa0VPY0Y2cWpxUFprcFMwcVZkeFdoemkxWEhjZnVIbHZnbVJ0?=
 =?utf-8?B?eWlzazlpRk9DY2RoSEs0VnVmYkozc294YlZPdkhVWDI1QmhwbVRpYTFrWEs0?=
 =?utf-8?B?Qkg0OHkxbEdENXAzbEtaRHJqREtYNmI1SlYyVndSdnZNYW5ZUThYUXV2ZTZE?=
 =?utf-8?B?SWJhb0Z6TWlvUjZZMThhSFlqMU90WHB0ZktmVTU2czZ3K2Z0TFFtbEt3Sytx?=
 =?utf-8?B?eUdOSnVydThKS25KTGRwVDRGd1piNjhNUXBISFFXSVB6VTNrM2pzL2NzZDM3?=
 =?utf-8?B?d3JUck5ySnZhUFg5N3hSc1ZPaHo1R2Rzc2Q1ajV2b3o4dnlkYlgzN2NkWFlv?=
 =?utf-8?B?UEJ3NERyL3h6aXNYelJLSVlPS3pKcmd4TnZxQVNVL1h1WEdaRUVWTURta0tU?=
 =?utf-8?B?U2xzdXpLVDNDaHhpSlh6d0EyMWh5VzdpT3dFOFF1TzVNOUUycktMM2RyaGNs?=
 =?utf-8?B?Rmd1bGI2NE5HS25lTlN6bGZPeUt1QzBJZU5qMnJpNk9OVmZCM005d2Z3OHRs?=
 =?utf-8?B?ODRpT0ZJeU5FeFM1TnNDY0NRQTRKVzRRalNQOEFYOEwxSW9BMzY2KzVvWTkw?=
 =?utf-8?Q?wiWeWrdMcYHWO7Hvu3mDppJfYcKc+uJuXQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3f3e96-4afb-4be2-fddd-08d8bbdaec59
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:00:21.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJ2LtyQVSkF8uXZx/7SvCLK2IPzeqDvJfmz2EubkMDpbMw+bcA91TX5YoFB7VQMA+AKForYQ38H/2pJP3PC0mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:29PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Define PAGE_* if not already defined
> Catch up with osdep interface change.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below, please keep the tag when resending with the
fixed comment.

> ---
>  tools/libs/call/netbsd.c  | 19 +++++++++++--------
>  tools/libs/call/private.h |  6 ++++--
>  2 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/libs/call/netbsd.c b/tools/libs/call/netbsd.c
> index a5502da377..4dcc2919ba 100644
> --- a/tools/libs/call/netbsd.c
> +++ b/tools/libs/call/netbsd.c
> @@ -19,12 +19,15 @@
>   * Split from xc_netbsd.c
>   */
>  
> -#include "xc_private.h"
>  
>  #include <unistd.h>
>  #include <fcntl.h>
>  #include <malloc.h>
> +#include <errno.h>
>  #include <sys/mman.h>
> +#include <sys/ioctl.h>
> +
> +#include "private.h"
>  
>  int osdep_xencall_open(xencall_handle *xcall)
>  {
> @@ -69,12 +72,13 @@ int osdep_xencall_close(xencall_handle *xcall)
>      return close(fd);
>  }
>  
> -void *osdep_alloc_hypercall_buffer(xencall_handle *xcall, size_t npages)
> +void *osdep_alloc_pages(xencall_handle *xcall, size_t npages)
>  {
> -    size_t size = npages * XC_PAGE_SIZE;
> +    size_t size = npages * PAGE_SIZE;
>      void *p;
> +    int ret;
>  
> -    ret = posix_memalign(&p, XC_PAGE_SIZE, size);
> +    ret = posix_memalign(&p, PAGE_SIZE, size);
>      if ( ret != 0 || !p )
>          return NULL;
>  
> @@ -86,14 +90,13 @@ void *osdep_alloc_hypercall_buffer(xencall_handle *xcall, size_t npages)
>      return p;
>  }
>  
> -void osdep_free_hypercall_buffer(xencall_handle *xcall, void *ptr,
> -                                 size_t npages)
> +void osdep_free_pages(xencall_handle *xcall, void *ptr, size_t npages)
>  {
> -    (void) munlock(ptr, npages * XC_PAGE_SIZE);
> +    munlock(ptr, npages * PAGE_SIZE);
>      free(ptr);
>  }
>  
> -int do_xen_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
> +int osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
>  {
>      int fd = xcall->fd;
>      int error = ioctl(fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
> diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
> index 57e49356a1..2ca84d723b 100644
> --- a/tools/libs/call/private.h
> +++ b/tools/libs/call/private.h
> @@ -13,11 +13,13 @@
>  #include <xen/sys/privcmd.h>
>  #endif
>  
> -#ifndef PAGE_SHIFT /* Mini-os, Yukk */
> +#ifndef PAGE_SHIFT

I would keep the comment somewhere that Mini-os already have all those
defined, and hence we can just straight define them.

Thanks, Roger.

