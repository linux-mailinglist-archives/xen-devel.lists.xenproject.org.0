Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA39330740A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 11:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76881.138923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54rF-0005cI-Ba; Thu, 28 Jan 2021 10:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76881.138923; Thu, 28 Jan 2021 10:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l54rF-0005bt-7t; Thu, 28 Jan 2021 10:49:01 +0000
Received: by outflank-mailman (input) for mailman id 76881;
 Thu, 28 Jan 2021 10:49:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l54rE-0005bo-Me
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 10:49:00 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aecf81e-1231-4e38-88db-c5459ee24c1c;
 Thu, 28 Jan 2021 10:48:59 +0000 (UTC)
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
X-Inumbo-ID: 7aecf81e-1231-4e38-88db-c5459ee24c1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611830939;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x0XjCWq6GLx4oKfbD7EDlSvCfGmrBZJYnkW10NDFoYQ=;
  b=bW4Cm4PTZ8aViVX1fqxP9neaBbtoZOqg3Hu90YwvINcCyKDqfsGuv0mQ
   tIq/S4Jri6MhvX4zhSDaIaYLmA0ZLGEAw3PDEUo3SArS4iAXfVNie6PKm
   jPPVlLJaMvKz35Z353BLQrS+jxZpaNcTjWpOzeixKg02edVCk5GF7+1dA
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tyRAsOLf2U6Yrgb853i05N6E1wgBoFN2gqSi6KU1pHa4LIc63dHUA6sJpAuxu2WjGrXV7/Ev8n
 HSDnMYrbihrnUjnsnvkiCyG1fSu1+Ko+TqXDT6JJ4fyKrL19+phKTh3swebHJMT+lmLgB1hHCc
 8DC6XLffm4AcKVlBTUyAhyQWb7tk9yPgj36CGwGHlWF5+fjWiKBKa++7QdPOL/WnZ5Vg9CWkJY
 xgeqRN6t8xn7f6zqE//QfV6sL32VXQi352Uqb2R4HHmt6oWcwGkH0xYXJ/9V/z6ZPvyqPJo0re
 /u4=
X-SBRS: 5.2
X-MesageID: 36089649
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36089649"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxL4cGHd9OI3U4jrWMLdRwuRI6KCqWWXShD5QcMpul3P/H3FP6m154gIfz1G7PFZIFo4DE6psBacb0yfM4/akl2Ees4bMnBtGxnuYfTrAazZmruy6XB+JcymA43mmO7Tf6UgAyosKA90N5R/xm+ibxYkzuWmscSrHvI1C0KiWXsh1oswaUby6gKW0s8ejZU6ClsFYj98QQQLXok4vjWXDJtSBrhwxKfCba2tzwu9zEyQQ23V47d7972w9Sza5kdFOblO3y5+vqx1LjVnXCar/cBxveAxG3VurK//ion+HizUSoNNihi1R9VLNsy81Ea5Oh5ZZzL4rC1HeoCt2SUyyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6/XcprKi1hHmRtqAbFapT2Fs5x3WXGI3YVfJr0Z08w=;
 b=UFAtuYeHsVhmpeajIH51v3hDweb/n28VhJXzRyYZbCPrxESIbW1AbQW5LtvJJ3nMSBtw25b3x8RHAVBdHZwP0DmNlwBBykJ6EdtXLkBklxSqMueJXM5pfmthjVwgmpee/6xZ1cqNJgd81KmmGoINp09VqNj3YuMTROyxNMIfJB1zsfxAvuJtC5ALZ3YPlRurBkhN39LiGwrUtPm1RETzScANBLuLA0b7Zw5EQoMgEvo+Jkwy1Q+W1tHdaqT16XX4PwFQShqa1RWLhQ1BTuuDERBD2/LXvlhxYwxYR9XFT+D1Qzw7+v2cZI2/Fq2l/Cr5ESwJ2s58sy+0McjHS6DOjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6/XcprKi1hHmRtqAbFapT2Fs5x3WXGI3YVfJr0Z08w=;
 b=FUmRWF+aXVENNwZIsHmQoz99T5jBqqZwqi+tnToaAk9vtpLaV3Co9i0cQVtpgu4cE8QXZyHLtUszGhx8l7Q/BAhyeTEnH9qvi9Gk19moXUL82m9lFkbtGj6hFaCQF1t44AUtYZG0DbSX1iWt3NJSLWiyKHydzRx9Xz+mAUU6e9o=
Date: Thu, 28 Jan 2021 11:48:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] libs/foreignmemory: Implement on NetBSD
Message-ID: <YBKWkc8mzlaIktD7@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-6-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126224800.1246-6-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a327a31e-772e-4331-a91d-08d8c37a4e75
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR03MB25547724639B2F3C13A6DEFF8FBA9@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uPxf4jwYoBMkqOvem4ZnZ1TRz+R6x2/rIfGqYsBZoKaNtwUc8jdRqIXlRlFzKcnBFgktSWJ0E67mH2t+6svqoLbNasB2WofwutigcDsDX5GnJm76VZSbJvflVczySVmtc6EAZLMtkQVXdBNSVfmzlr87gOry2llsOkt74dgdk2b/35JRCJEgTaXXimdQ2i6iooBIW/2S5z6JlLnErLSBWIiW8okm3qtiwZnJcxAo3MPovhK4+X8WTeNbgNaPVGZhGsXzxOi6rFZU1O3qi5OAhfdqplvOi5eoIvrYKkm0mo2+E6NfDgu0wn394+uWzm+eLpn0SlmNV5SI64O6ZtLCQxleZt2MMRxi9jkbWbUBKxTqjY+O7HUPKsZ8K+thX76AaMXZ1ryKqrr5oDUxQ4cljnBrRHh/lHdTJXR42LctRGBQJ/5vJLHwAnjo+Ru6XM9qd24kI8WyYt/iG07gYxLDUj8vQSTYQwwxVE/vmE8+QurnoiU6kKxtT6sHy0lMJmk4ODN7jTdjO36+TzOD5OBPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(39860400002)(346002)(376002)(366004)(316002)(186003)(8676002)(956004)(4326008)(26005)(6496006)(16526019)(66476007)(9686003)(86362001)(478600001)(6486002)(66946007)(54906003)(2906002)(33716001)(83380400001)(8936002)(6916009)(66556008)(5660300002)(85182001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Yk1BeHVadWNCZGFmaHhFR1dwWWF1OEFJWGlVdU80cEw0OHAya3ovektqVG0y?=
 =?utf-8?B?THU1TkdwbWU0L1d2ZFZVYm9tMDh0bXN5czhxa3IrR2M5NzNZTjFIS05BL0Rn?=
 =?utf-8?B?YlYyQUJDdktNdWsvTDJXdjlTWHhnVFArSDJOL1g3cm16c1ZqcFg4cE8xbS9X?=
 =?utf-8?B?RUhGUTQ3T0F5MndydHZaYy8xVXNCd2dMY3dTY1M4REhiN2d6WEwzSndWMHRI?=
 =?utf-8?B?L0VTYXFPOTY0WmNiQ3NMclZrTTBjL1pFeWRVbmUrTDl1Q0FINVVTSFRoUDR4?=
 =?utf-8?B?TEphTE9mSElMQnI5KzZRZ29CRld0a0tqNmt2QlZZMjJuSGRiRkR2dWE2RWFu?=
 =?utf-8?B?Ynd0RU8zUngwdFRscnFvRmVXcUFxcDFGczRaS2FkT1A2Y2R5ZG9SOXM4Q1Rj?=
 =?utf-8?B?bWh2TlFMbVpaUm9yaXdyY1BSWHpqR1oyQWZLNml5Z3JaYmtxd0FVRTZSQXRU?=
 =?utf-8?B?TEVUYVVjV2l1OG9hR29VNThPeTYyZTFDcjVVK0E5VHo5VDhzYzlkRjZNQ2c3?=
 =?utf-8?B?Sm1tNVl5ZjBHa05IZmtqNGw2R3NWeFFZYkNjSGZCa1AzYjdhMmMyTFV2VXRE?=
 =?utf-8?B?Q1hjb0FhdlA2UE9LT1lPUGtyM3ZjR3J3a0dsdTR5RFI3SVhLQVd1akxWbEpq?=
 =?utf-8?B?T0YvQzM4QTVyWkQxbDZQRDk0eWNlWGJoWVp0RHU2OXNhOVArNWZVWXgrakJO?=
 =?utf-8?B?TEpPLzB6b3BYT0YraXpPeDdBQmMvdWtTa2VYNXNBVm01UXJQaVFFbjRRVHp5?=
 =?utf-8?B?VmR4NUU4ZGg4MW1wdCtSczk0ZHhjelM2Q3ljUWovbVRCbnROVGhrUkNxYkEx?=
 =?utf-8?B?bHFGNkVHVU1RS2h3MEJCNUFBcjl0N25wbTFtWks1SzdacEszODlyb3N2dTN6?=
 =?utf-8?B?aG0zKzZaZUxaZUNUS1RRR0lGSGlIQWtlTHM3VTVIVHVidDlqR2paZy8rV3Jr?=
 =?utf-8?B?SVdnUC9SU0pyWXNVczgzbUptR1RVTFJZeko0TE1LSDFkL0thR0liWDNIbEdm?=
 =?utf-8?B?N2d5Y281Q3RPbkYzRUZPd1ZtRDVPd200K1VzQjg2Z25ZaU9WRTVOaGNPditU?=
 =?utf-8?B?MlB0YTVTcXB2ejNxVlJSRDhteFBoSG1MVUJYd3RUVjlUYUtPdFVDYkI5emxR?=
 =?utf-8?B?VnJRaU5pdWcweTRBVUI3OHhMNUdLVWxheVhKeG5TZWJRdXZyZ0k4d3pyZnVF?=
 =?utf-8?B?SWtHVG94WWNjTWtOUTNyU0phYnppRXRTZGRUZTBHMFBEblRLNGhQQjUzMDRR?=
 =?utf-8?B?aVNSdmhsajRNbUhlakhVekF5MDlIMGt2YlNFWkRyRnFDM1ZKd2ZGVk1lalhu?=
 =?utf-8?B?UEZ3MkVWSkdpT0RSaWFJYjNUb0EyZFNLWEZvMHVkREV6d2YrUmlpR1hnejRC?=
 =?utf-8?B?cm8xWittVk56N3FrZmk5cENIZmJVM29yZit2OU1UZzVWd2tKcTVoazBUWWlz?=
 =?utf-8?B?MEY0cCtSSkRYU3g2SHN5c0R3Y2xNRlNJTERIWFpnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a327a31e-772e-4331-a91d-08d8c37a4e75
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:48:54.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgjMLGlo13xw1pjO/F7seUKwET4Rrd4mkuzgaNepmfQ/lUFOZD6q0ufiZnCbW8urXnGy9OywTyGUBDELQuc/hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:47:52PM +0100, Manuel Bouyer wrote:
> Implement foreignmemory interface on NetBSD. The compat interface is now used
> only on __sun__
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/libs/foreignmemory/Makefile  |  2 +-
>  tools/libs/foreignmemory/netbsd.c  | 66 +++++++++++++++++++++++++-----
>  tools/libs/foreignmemory/private.h |  6 +--
>  3 files changed, 60 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/libs/foreignmemory/Makefile b/tools/libs/foreignmemory/Makefile
> index 13850f7988..f191cdbed0 100644
> --- a/tools/libs/foreignmemory/Makefile
> +++ b/tools/libs/foreignmemory/Makefile
> @@ -8,7 +8,7 @@ SRCS-y                 += core.c
>  SRCS-$(CONFIG_Linux)   += linux.c
>  SRCS-$(CONFIG_FreeBSD) += freebsd.c
>  SRCS-$(CONFIG_SunOS)   += compat.c solaris.c
> -SRCS-$(CONFIG_NetBSD)  += compat.c netbsd.c
> +SRCS-$(CONFIG_NetBSD)  += netbsd.c
>  SRCS-$(CONFIG_MiniOS)  += minios.c
>  
>  include $(XEN_ROOT)/tools/libs/libs.mk
> diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
> index 54a418ebd6..a7e1d72ffc 100644
> --- a/tools/libs/foreignmemory/netbsd.c
> +++ b/tools/libs/foreignmemory/netbsd.c
> @@ -19,7 +19,9 @@
>  
>  #include <unistd.h>
>  #include <fcntl.h>
> +#include <errno.h>
>  #include <sys/mman.h>
> +#include <sys/ioctl.h>
>  
>  #include "private.h"
>  
> @@ -66,15 +68,17 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem)
>      return close(fd);
>  }
>  
> -void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
> -                              void *addr, int prot, int flags,
> -                              xen_pfn_t *arr, int num)
> +void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
> +                                 uint32_t dom, void *addr,
> +                                 int prot, int flags, size_t num,
> +                                 const xen_pfn_t arr[/*num*/], int err[/*num*/])
> +
>  {
>      int fd = fmem->fd;
> -    privcmd_mmapbatch_t ioctlx;
> -    addr = mmap(addr, num*XC_PAGE_SIZE, prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
> +    privcmd_mmapbatch_v2_t ioctlx;
> +    addr = mmap(addr, num*PAGE_SIZE, prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
>      if ( addr == MAP_FAILED ) {
> -        PERROR("osdep_map_foreign_batch: mmap failed");
> +        PERROR("osdep_xenforeignmemory_map: mmap failed");
>          return NULL;
>      }
>  
> @@ -82,11 +86,12 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
>      ioctlx.dom=dom;
>      ioctlx.addr=(unsigned long)addr;
>      ioctlx.arr=arr;
> -    if ( ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH, &ioctlx) < 0 )
> +    ioctlx.err=err;
> +    if ( ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH_V2, &ioctlx) < 0 )
>      {
>          int saved_errno = errno;
> -        PERROR("osdep_map_foreign_batch: ioctl failed");
> -        (void)munmap(addr, num*XC_PAGE_SIZE);
> +        PERROR("osdep_xenforeignmemory_map: ioctl failed");
> +        (void)munmap(addr, num*PAGE_SIZE);
>          errno = saved_errno;
>          return NULL;
>      }
> @@ -97,7 +102,48 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
>  int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
>                                   void *addr, size_t num)
>  {
> -    return munmap(addr, num*XC_PAGE_SIZE);
> +    return munmap(addr, num*PAGE_SIZE);
> +}
> +
> +int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
> +                                    domid_t domid)
> +{
> +    errno = EOPNOTSUPP;
> +    return -1;
> +}
> +
> +int osdep_xenforeignmemory_unmap_resource(
> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
> +{
> +    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
> +}
> +
> +int osdep_xenforeignmemory_map_resource(
> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
> +{
> +    privcmd_mmap_resource_t mr = {
> +        .dom = fres->domid,
> +        .type = fres->type,
> +        .id = fres->id,
> +        .idx = fres->frame,
> +        .num = fres->nr_frames,
> +    };
> +    int rc;
> +
> +    fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
> +                      fres->prot, fres->flags | MAP_ANON | MAP_SHARED, -1, 0);
> +    if ( fres->addr == MAP_FAILED )
> +        return -1;
> +
> +    mr.addr = (uintptr_t)fres->addr;
> +
> +    rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
> +    if ( rc )
> +    {
> +        PERROR("ioctl failed");
> +    }
> +
> +    return 0;

You need to return rc here, or else the failure won't be propagated to
the caller.

If you agree I don't think I have further comments:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

