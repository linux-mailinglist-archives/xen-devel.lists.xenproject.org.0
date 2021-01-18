Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E392FA7DE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69932.125376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yf1-0002XY-48; Mon, 18 Jan 2021 17:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69932.125376; Mon, 18 Jan 2021 17:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yf1-0002X9-0r; Mon, 18 Jan 2021 17:49:51 +0000
Received: by outflank-mailman (input) for mailman id 69932;
 Mon, 18 Jan 2021 17:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Yez-0002Wn-Gk
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:49:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7030f1d8-0333-4547-a92f-43a5ae4fcb6e;
 Mon, 18 Jan 2021 17:49:47 +0000 (UTC)
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
X-Inumbo-ID: 7030f1d8-0333-4547-a92f-43a5ae4fcb6e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610992187;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+g/8BEv3Y3AZekPlwOHavFLBONLykLJV0IPBXQDhuQo=;
  b=Bzs6tasv74ZYNyq7kz7J1IF+VpE9Zjw2XkCwPw6n3Nd1w4Ck9aCdW9hd
   UP15VAyeU8CfVqw1AuWXs6XY8UkhEgz7qMkdcDclXwRO6HiCcdfBAGILy
   iBU198pxQm0McWVP4YLzDdFSK+8wnnQzsB8iKedSqNWURPMMBXbwksLoD
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fYH3XnKAxf7I34VkQUc+jrwRwYB5xVTC6OL8szi/WVQLiT7B8yw5tGeppv7qHrQ0dCT9cA2zvo
 sTdhPqTjKKuFgj+7gTfNjIDZZW4ILwr64Aar77A9jy7AH3dD61O99PeIW6NYo/7oSw6DcHnujr
 RQbLN3u4WU3ylmLZMOYo71urfGgHxfdsd1T+LFQ4RhRoCznV/Aea4G5+zFNNhuN5jM7riMi+z1
 ASvkBRGaaJ4VdqZ4HvNtcPHnWrR9y+mIo+7/FW706G0+B/shEMHB5ZYBY4z7XOJKbfc69Q5Nct
 AqM=
X-SBRS: 5.2
X-MesageID: 35534403
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35534403"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfnwZVQKM1u+c+36AyIbESvokmKdrIox6kVs4QOoh/nDSM56pgNE9QntitZV9bWWYuK3lhJXtg/VoZfKi2jIj/ozQP5OHo7maxiD9bv/kJqKbAuWhapnybrwotBWUgMOwH5FwFmIrpG0K+/vL7225jvMByAgxMHeGJTAt5bEec67XUhdNS75b9MBMGLV5xR6YsE4wmBf+hWeklJu4JYsiESLcPD+Mx900QgCwgTHlP3MPw8lo6E+LsC68ItOL5moFl4kdbFxG4Rxh7kKDjJnJGgNIpcNyJB3OihJrv7vr1oLjdqdy9EgbgfS2O3e+M5QSODAoirAx2nLQtqPjTFz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+uw2ye2wHtQ9Ao+TvMtvxFLUeNqt1Q38LP+p02/5ME=;
 b=E7hmN3kJToHp3YW5BX+YRKm9oG/kVY8eJ/kKTweXOodlBwpTgHfN7NW+Q8CH+NKIWpuMEjbwFGIEg0UDv4OIuwbL4DcoQiLE3goDcApB1HvrHzyEq258S3OB1hjxVd36C2fOZ0qNB+U2Cqebf1PsBd0EyYKR5wOoAJpQJXCoQXdkYLGlzdgUMJdnu3pdiVjTjA7JpGYkpj/SLZXeloCHzSnEUnwUgl5uVWPkw9kFdSu4OcZQBGJk+vw3mwSEJcpYwXV38HFQb594So9td5QBDkLOhDCeylEpVaI86rs+Ho+LG39iL9ekkTF+wdpndkiNrAIp6MiOdhnathRkiXZDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+uw2ye2wHtQ9Ao+TvMtvxFLUeNqt1Q38LP+p02/5ME=;
 b=qvaV/ktvpe4xOGc1VMNLr7KYe6LG9EnsVAdgZZCM3kLZt+vmE89oYkaQ9OkNPQczFLMFZvyrdZPKqV4+5835CfF7lY3KrGyBTa9m3N/ahC9diqh5NZiG8nZz3tMju0UhHQs3O6UziZnzgRXFnB891ZLgGbOdXHSAO9qYk8bm/VE=
Date: Mon, 18 Jan 2021 18:49:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/foreignmemory: Implement on NetBSD
Message-ID: <20210118174930.mch5q4eq3fqkvisy@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-11-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112181242.1570-11-bouyer@antioche.eu.org>
X-ClientProxiedBy: PR3P193CA0041.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a9c730e-f43a-4978-4e8f-08d8bbd96aba
X-MS-TrafficTypeDiagnostic: DS7PR03MB5591:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5591E76D6AC73A9D679924848FA40@DS7PR03MB5591.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ClIsGObPAweYkT7JcdCClsfTkuEIsWrdCLc1A1Om+pE7fuGje7/QYDtIarQ+wSNLZVb/Ap36DmnwVurtCucosIzKS3Uqsv8THTHTZADWm5ZPzXjqBx09emdZfXyF4ZiDolwLKj3wXLWZX46u45atSRzu58U5rGnzxbzIrUzQTlNWKT9zSld2iCUxiAZu3ffFhvkAlz4SS7cVCjAdLDKi+Q30DYj/YFGdNPYVJDELUbu6M6trv3vRn1XVsK7ZAaqmVlGThf2ybLFItVwtNOHVMfbY34kgvyN+SsL6k669hVWkY8TAF0ZhHsAeoQ9oRQH9292s2Q2AEjQFfu5akq8IGIIU/ZOBHz0VGFT9vRhdo9SuWYjEXOBDWBUYEbc8QnszNFA2+fsY7kocPr4NDhmBHyf30h/VPy2C/ZF8dICR3eX3FFNT7DxrtbJNmYVGvIkIsOBrDVgkQRsFUZCB1MlbWOP52E+xS+fLo4YzVMiePWnUqKSpR7PogY8boW35BKkuqPS96T2mtrWEjDUcl3jcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(6486002)(8936002)(6916009)(83380400001)(316002)(66476007)(66556008)(1076003)(33716001)(186003)(478600001)(4326008)(66946007)(5660300002)(86362001)(9686003)(6496006)(85182001)(966005)(2906002)(956004)(54906003)(16526019)(8676002)(26005)(6666004)(10090945008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WE0weFdnQzlWUko3VEFtMTVHT0RWV1JTYUkwN3VrREhFT3dpRU5zTXpqOHl1?=
 =?utf-8?B?WEN0TjFwemFtaTZreVJJSCtDcmJjblNDYVdkYVBveVBvZHVFTHVWWnZ4TTBK?=
 =?utf-8?B?WnJEdGJlV2tXbld0WkFKTm9rWGhFY0xVNHVqYjU1SVdVZktzaDBzNGFmYnJS?=
 =?utf-8?B?azlCWE1ZR1JBcWkyY2piakY5a1FSTy8vU001cDJ3ZGRJS1Y0aXJ2WDFlejlL?=
 =?utf-8?B?Y3ZQb3BYZUFGd0UyZmJXVEYxcE5sQ21xQi9hank5ZWcyYW1jeGRscmhkMitN?=
 =?utf-8?B?bTFqR1BKSjl3aXc1TmpTVDVTLzFDR2pzcTBkSllndFUzYkNBR28rdmRmMlRU?=
 =?utf-8?B?cSs3bWU1cmFaM2UvNStVWFUyWlpkTVdrbitsemhVeUsvZ1dTQ3JZU05KM2Ru?=
 =?utf-8?B?Q1I4S0R2UHNjVUZhZDZlVjJWK1Q3bFN1bUR5Z0FUeUpEZW1TWGU2aWZ6d3dP?=
 =?utf-8?B?UTFpSExZWkJFS0VSTlRwdEVFczREYndVQU5LaWw5V0NCMTVHZEc0c21BeWdF?=
 =?utf-8?B?MDgrTjlIdXdWVnJjZjJrNzRqMWN2NW1naHJnMzJURE9MMnRsYnE2bkxXRnF4?=
 =?utf-8?B?ekJCbHJ5RjRvWE5qaVpRaThIMmtkZklTRld5NWJERHQ1bUQ3R0NrUXY3UFhl?=
 =?utf-8?B?TXlmSXJlbWVMMVFUSi9uVVhuSTlsRE9KL09KRVp0RGhzTWVabEdQM2lubnM4?=
 =?utf-8?B?RXRZMjNzOUF0d05IMFdscjBmWC83VFhnR1pKZ0RKVlkvcFhmdmkwOS9xZG9k?=
 =?utf-8?B?a0pmazZXNlZCZHpVdXJpUXdEbTNLaXVmVmRCazNMb0cxVS9iYkx0VnRsQ05p?=
 =?utf-8?B?L1V0N25MZTY2ZU43aG5pdHJLSG9saWNrb1RQenNZZEtnVkR1Mmw2dGdYN0Rn?=
 =?utf-8?B?ZFNpK2tRK3JaVUczMmMzWHZWZUZaZDB4YXQxUDV0V0xpc1p4TW1RTjJMZys4?=
 =?utf-8?B?L2o3UVZKRno0T2UrWFVBMXg5eUlTSXJQQ2lNTjlFTmdkNWVKTHhsbG96SVFj?=
 =?utf-8?B?aW5vcElxT0RPa2tXTWg5TWJaYTFIdFRDWDhaQTJyUTAwU1NBYllsRmdKbmNw?=
 =?utf-8?B?Ly8zM1pnVml2aTk3OWY4Qm10dDZiNVFveDNrS2ZzZGpWSWhSYlpUaUprd0JK?=
 =?utf-8?B?Wkh2SzdYOHRyV3REQWYwVC9XRkNteW1mQW56aG4xcUpHWXRrMWhJbVFWQzI0?=
 =?utf-8?B?aFBtUTNReDd4bnRuaS82YVRQVHhmSndzTVBYN2QxWUxlQ2xQamtiQjRQeXVt?=
 =?utf-8?B?bUhmWGZTSmNYamYrRkNFbUl2RU1nMTZvNWx2TjlqUnBaVHBORVNJZ2dnUmgz?=
 =?utf-8?Q?CO/XGAmjr4JGvdp6WSR5EwUtvdBR7wuq9C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9c730e-f43a-4978-4e8f-08d8bbd96aba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:49:34.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hdmkmc4TutHPkOv+YUNgZSi/9c0l9fnWuhyzySVFpy3y9yHvlicogjVGfcFe6K0UjPWCOFrFH7ZarFa4E+KEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5591
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:31PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Implement foreignmemory interface on NetBSD. The compat interface is now used
> only on __sun__
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> ---
>  tools/libs/foreignmemory/Makefile  |  2 +-
>  tools/libs/foreignmemory/netbsd.c  | 75 ++++++++++++++++++++++++++----
>  tools/libs/foreignmemory/private.h |  6 +--
>  3 files changed, 69 insertions(+), 14 deletions(-)
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
> index 54a418ebd6..c2a691daed 100644
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

Hard tabs in the last two lines added above.

> +
>  {
>      int fd = fmem->fd;
> -    privcmd_mmapbatch_t ioctlx;
> -    addr = mmap(addr, num*XC_PAGE_SIZE, prot, flags | MAP_ANON | MAP_SHARED, -1, 0);
> +    privcmd_mmapbatch_v2_t ioctlx;

Nit: since you are already modifying this leaving an empty line here
would help readability IMO.

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
> @@ -97,7 +102,57 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
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
> +        int saved_errno;
> +
> +        if ( errno != EOPNOTSUPP )

Seems like NetBSD will return EINVAL for unknown privcmd ioctls?

http://bxr.su/NetBSD/sys/arch/xen/xen/privcmd.c#802

This would make differentiating between a real error or a missing
ioctl impossible AFAICT, so I think you can remove the check for
EOPNOTSUPP?

> +            PERROR("ioctl failed");
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
> index b522a2b86b..f7569d4f6b 100644
> --- a/tools/libs/foreignmemory/private.h
> +++ b/tools/libs/foreignmemory/private.h
> @@ -42,9 +42,9 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
>  int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
>                                   void *addr, size_t num);
>  
> -#if defined(__NetBSD__) || defined(__sun__)
> +#if defined(__sun__)
>  /* Strictly compat for those two only only */
> -void *compat_mapforeign_batch(xenforeignmem_handle *fmem, uint32_t dom,
> +void *osdep_map_foreign_batch(xenforeignmemory_handle *fmem, uint32_t dom,
>                                void *addr, int prot, int flags,
>                                xen_pfn_t *arr, int num);
>  #endif
> @@ -60,7 +60,7 @@ struct xenforeignmemory_resource_handle {
>      int flags;
>  };
>  
> -#ifndef __linux__
> +#if  !defined(__linux__) && !defined(__NetBSD__)

Since I got the FreeBSD support committed, you would have to rebase
the series and this should then become:

#ifdef __sun__

I think. The rest of the patch LGTM.

Thanks, Roger.

