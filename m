Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02252E70AF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 13:47:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59896.105013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuEOk-0002In-AF; Tue, 29 Dec 2020 12:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59896.105013; Tue, 29 Dec 2020 12:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuEOk-0002IO-6y; Tue, 29 Dec 2020 12:46:46 +0000
Received: by outflank-mailman (input) for mailman id 59896;
 Tue, 29 Dec 2020 12:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuEOh-0002IJ-MR
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 12:46:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19c30821-e404-4b18-a7f6-f065cd23babf;
 Tue, 29 Dec 2020 12:46:41 +0000 (UTC)
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
X-Inumbo-ID: 19c30821-e404-4b18-a7f6-f065cd23babf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609246001;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pIFfLWQD1Lk55/mT5rZuatiaDexhSJyHLZDDYYgr1fE=;
  b=TxEBBbAhAx+0Hqk7w/kq/rlRqn8Emn0JpSG5rQzzEb4K39kH2VCIewS8
   MwcTSdtwSr7ipVG2aQCzX+epSSR1G9K0CUcyd2J9fdKWUEcvNR5dFcTtb
   R4qdgqabpS9MQw36iLp6T4KhFZUfDIhiwt69/WPwUcGCyb7RBEgsnwccp
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uGgsMVvGsCrQyFLjaqZuyk3Pyo2uk34lYXvSx2J4rCYhLCPR97mRwqrpAK3630GXgu8VDwDWb4
 6OfdRTVq8WXX2PHLKh0H2bsdESbJ4DvIooWN8PzxNN3cr8Y3sNIHwN5zpDoGwNiP8psRFWRHec
 i7bJSxy9xOehHSZxIn59h2/CPj0A//ZxFftBYwuJyPRx76NHKqUAO3n+YcTDqcZ1BEZ4BWv4sN
 Wl31vHiFMfqdo3/xIIXrdoHi7cZM94vH5vzewZPygUmgRoOUDYbImjWnFmXmyH3gHdUEHSadU+
 DaU=
X-SBRS: 5.2
X-MesageID: 34449888
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34449888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZQ3W3zV515lzKB4JHSkj5soZfe7vt8HQzS332UQ8DwJbKWmbPjZ0Sk2njOxmS5ZzK4u3AnkSnzEUfb5JS7rWTZmwwtqgHRAIbYtTcQpa8DsgGrEcAudCvnPB0GeOkcvfosO2qbRipcc+yTKTmhVDG0dKlcBgwam+5MPQHe2lDGuUDL4uo1aSgBnwXBcfrHdMpzkR7iNR754HdIeAZtFNDAl5SNRbK4g+KfKIKGDcU5ApTX90GgwxcA7RI0187C6kmMW6HetwLXknXLpcKjR/4f2W1vb2+EtAg+J7xHiLaBI1vjPSS8ilevuPJ+oO/HYHyAdigtbXPvc6yT7+s0yfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akeRgcXbGm8I3lkU1y8VMRBOJ4z1Qhp0jxOwdOprAs0=;
 b=lkC7B0z+lYLlEo1LGFshS7xWncTytVJffKVvLWqWMYN3WSSBtFBKYuscDpBdxQFOquwKK4UXoLova1SsEBq/0Dy6+ifZfgWfnrVNTSkmErpKcU2QJs5891/VLUjOAxSVwaS8HxGqtIZyFqJiNr9rFHvVve5cGE46sk0jXO1NqcvhaMr+vmw+TJs+AfDJtzySqhMFMutua/uNM4ol8AoQv9zqSfo4FmzTDE6yDudnGnjSsjb0xYlbyHVjgjoC4UDq//9cteebD5v0jnmvqQqer0aeMbGKrC2qugcTIkSQGl0bI+j/if6Dwnw2AgtnvhMwcTNwSNH2esWDsL/4Nq/Suw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akeRgcXbGm8I3lkU1y8VMRBOJ4z1Qhp0jxOwdOprAs0=;
 b=pW2DuOlFxZrrFb8O08oApbOVIqvChAcY13iSSy89Khmi5jZbP57+Hvr7Ov3AWkMQSqaQyXKvdRB10NNNuumg++Cn1FEbFGmWiPBuD6CsYpvW26ni+zF3iEk0Fq75s2XwbgkCLhZfjNaUW4pexVrZGRojj4iZU68HZwQmg9J4wKA=
Date: Tue, 29 Dec 2020 13:46:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 11/24] Implement foreignmemory on NetBSD
Message-ID: <20201229124630.5ld2dt5o6awa53db@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-12-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-12-bouyer@netbsd.org>
X-ClientProxiedBy: MR2P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77494516-3c2d-4500-e6b3-08d8abf7c7b4
X-MS-TrafficTypeDiagnostic: DM6PR03MB3673:
X-Microsoft-Antispam-PRVS: <DM6PR03MB36733E69AF842276B0B3952E8FD80@DM6PR03MB3673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lX/qvqfosne3fQr894qrtryUtJzx6n4M2lRvMmX43Q1uUr3sTlbvF2ejMMcUztQCP5rBa1VWQ1bPcPTt4G2F0tiP/3S5nWIMqeSnas44e3S/2KZqy16B9BzEILqaNX1Yrmku5A3EU6wyntnWqS5J0dK8z7+zB3cTkpVUNETBepjDvdGujsxrCsUFO3d6ESuLHYJW4P7oRQB5/06klWBtcN1AZWAVfZshxZTZkk+sIMabo4TvSxrF/bT3cRv9I4VR8fzs7PJ7J/22qysbjQ/faEHcPOa0MO5m2ReyFakc2A37Py+yftJ8hFdDzQnwralCaOdHVAVTN+8F6a6kYAa2B44CNYXNqBZ1V5A9BcThJKwe+w8aMIUi/kyxqGg9bblaCZo0+oh59cwc28md4ujQQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(366004)(376002)(396003)(39860400002)(5660300002)(8936002)(85182001)(6916009)(9686003)(1076003)(16526019)(66476007)(6496006)(316002)(86362001)(956004)(66556008)(83380400001)(6486002)(2906002)(26005)(186003)(66946007)(478600001)(8676002)(4326008)(33716001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2lGa3RqWmlvay9JWGpMVjFxL09WaVZmRVl1V1hZbHlnSldvbnB1TTRxdTRH?=
 =?utf-8?B?ZlFsNjI2Z0k1SENFeGFWb3ZVTXBhVzRiRlVwQmVhWjl2THpHK01JZlBHZVY0?=
 =?utf-8?B?UXByek9iOVd4VVVYNWFxQ3VWNHZETWdPMlpFQytYb2hmdTNPRm9FeDU3ai8w?=
 =?utf-8?B?NFJYK21ZemlJUjcwQnJQdzNiTG52YU8zT2MwN3JNWDkyMnVTbEltUjFISHNy?=
 =?utf-8?B?eUZHMjNMdkhvLzFpcW1wL1R1YXVFdjNzL0Z3eDNOaHNOcGxqUW03bG5XYmZj?=
 =?utf-8?B?dUJTOHBYZmZtdVlSZmhZN1E2UjhoUGtMYWVpeUg4Ym1SdGV2cFJ2VmFxK0tz?=
 =?utf-8?B?NTZ3anRzRHg3U0dzcFBxeGdEeXhDamxCNVpzTzh3aUVldFVkdW5BTy9FS0tz?=
 =?utf-8?B?M3BFKzBWR01kRmxpVTZFNjBBZUtDaXljS3R1V05mNmJNUXh0YU12b0h5RUYz?=
 =?utf-8?B?NDJmcVpmL1lPOFBUZnlJOTRUTW5ibllzSXl4RkZlUmIvMFI0ekJPaE9hSXFt?=
 =?utf-8?B?aDVYVVpiNm5RbVFKREpTRWovbXBCdHEzNHlibnhLYXU2dCtqNzNUT1Irc0Z1?=
 =?utf-8?B?bmxoSmg4a1NqR2o2Tk5hNlN4RXdzU2w5MlRkNFdxMS9pUXZFWWZGZlY2QThl?=
 =?utf-8?B?TkE3ZC9XMmZBZjIvZ1lTMzZGT0Juck5Bem9vbzYrbnl4RTdaVXM5SDFuYkFT?=
 =?utf-8?B?ZjFzM0NBWHdRU09JcFBFb3hiRlBDOUFuOFVDQjJCbDMxak1ySUZua3pQSDRY?=
 =?utf-8?B?VVRIODFRRlZ3ZlI0dlNpSkZiT2RuSXhhMTk1Y3UyMnRRRW1xS0ppaXVYaUs0?=
 =?utf-8?B?RndzckhhYUNFOVc4ZFUxRUx0QnJocUYzdzNFUkpMbC83OEZzNzZ2RFpacmQv?=
 =?utf-8?B?ZGg2c1BGYUJPVysrYmRRbHUzUk9yTWpPcUVLdHhxS0FpQ3NsSm5DV1BJUWdv?=
 =?utf-8?B?elRscE9aWUordzBtUnVka3BGWndmNSsxK000bWVpUUtZZ0JQWFc0RHpqNkxD?=
 =?utf-8?B?L0pJdlNjK0dNRkVrNDNaL2lOMW5hZGdZUy9seWFPaWdPc21YN1ErdXlCd3lq?=
 =?utf-8?B?U3hiV1pYclhIV2d3TXFWTTNpb2tGUS9jSjROL3I4YXcxUDBPOExSSjJqaFFj?=
 =?utf-8?B?bmVRZjdBbFVvRzMwOXRrU1NGd25vWHBIL2NUa003RWlSd2JXaHROWEh0ZTNm?=
 =?utf-8?B?NXprSUJ3SU9scU5mbzNxL2RzbUNTcHJVYWVmaFllV0JWTnQ4dXpCZENuUFJn?=
 =?utf-8?B?STZIUThtUmVvb3o5N3luNSswMU9KT00vWTNDNzAvamFHR21vdGNMRW1JeXc1?=
 =?utf-8?Q?66hMLh+LPDH1NzzjIRJ6S/sN4fF3KegmBz?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 12:46:36.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 77494516-3c2d-4500-e6b3-08d8abf7c7b4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic6Pbqjqk7enyfRQs/ADF7uoSXCIpVNIbN1mVpqxxk8/lIi/UdIn12lo1zdtTkC6+xzIsnkNh+G641MhaY4mQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3673
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:10PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/foreignmemory/Makefile  |  2 +-
>  tools/libs/foreignmemory/netbsd.c  | 76 ++++++++++++++++++++++++++----
>  tools/libs/foreignmemory/private.h | 10 +++-
>  3 files changed, 75 insertions(+), 13 deletions(-)
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
> index 54a418ebd6..6d740ec2a3 100644
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
> +				 int prot, int flags, size_t num,
> +				 const xen_pfn_t arr[/*num*/], int err[/*num*/])
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
> @@ -97,7 +102,58 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
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
> +    return 0;

Returning 0 here is wrong, since you are not implementing it. You
should return -1 and set errno to EOPNOTSUPP.

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
> +        int saved_errno;
> +
> +        if ( errno != fmem->unimpl_errno && errno != EOPNOTSUPP )

Maybe this is set in another patch, but I don't seem to spot where
fmem->unimpl_errno is set on NetBSD (seems to be set only for Linux
AFAICT).

> +            PERROR("ioctl failed");
> +        else
> +            errno = EOPNOTSUPP;
> +
> +        saved_errno = errno;
> +        (void)osdep_xenforeignmemory_unmap_resource(fmem, fres);
> +        errno = saved_errno;
> +
> +        return -1;
> +    }
> +
> +    return 0;
>  }
>  
>  /*
> diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
> index 8f1bf081ed..abeceb8720 100644
> --- a/tools/libs/foreignmemory/private.h
> +++ b/tools/libs/foreignmemory/private.h
> @@ -8,7 +8,13 @@
>  #include <xentoolcore_internal.h>
>  
>  #include <xen/xen.h>
> +
> +#ifdef __NetBSD__
> +#include <xen/xen.h>
> +#include <xen/xenio.h>
> +#else
>  #include <xen/sys/privcmd.h>
> +#endif
>  
>  #ifndef PAGE_SHIFT /* Mini-os, Yukk */
>  #define PAGE_SHIFT           12
> @@ -38,7 +44,7 @@ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
>  
>  #if defined(__NetBSD__) || defined(__sun__)
>  /* Strictly compat for those two only only */
> -void *compat_mapforeign_batch(xenforeignmem_handle *fmem, uint32_t dom,
> +void *osdep_map_foreign_batch(xenforeignmemory_handle *fmem, uint32_t dom,
>                                void *addr, int prot, int flags,
>                                xen_pfn_t *arr, int num);

You will have to split this into NetBSD and Solaris variants now if
this is really required, but AFAICT you replace
osdep_map_foreign_batch with osdep_xenforeignmemory_map, so this
prototype is stale?

Also a little bit below these prototypes are the dummy implementations
of osdep_xenforeignmemory_restrict,
osdep_xenforeignmemory_map_resource and
osdep_xenforeignmemory_unmap_resource. I think you at least need to
modify the condition below so that on NetBSD the dummy inlines are not
used?

Thanks, Roger.

