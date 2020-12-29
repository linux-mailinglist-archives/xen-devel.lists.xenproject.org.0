Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE5B2E7024
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 12:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59853.104955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDVp-0004w2-Ou; Tue, 29 Dec 2020 11:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59853.104955; Tue, 29 Dec 2020 11:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuDVp-0004to-Lf; Tue, 29 Dec 2020 11:50:01 +0000
Received: by outflank-mailman (input) for mailman id 59853;
 Tue, 29 Dec 2020 11:49:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuDVn-0004tZ-Rs
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 11:49:59 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 059e13af-ac05-40aa-89ec-e6652bc9280e;
 Tue, 29 Dec 2020 11:49:58 +0000 (UTC)
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
X-Inumbo-ID: 059e13af-ac05-40aa-89ec-e6652bc9280e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609242598;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xudkZ242BlNMwHow26v3H+HO9JNjHcCvzsX08PG9X2A=;
  b=Ts2f5cmj0yX8BmrffPgVvgj3Awy6rYwF2i48urcSLu/ipj7/28fgJwaW
   NkBaCiYJbyIqS0bpwG4TpWbsl3X3xr0URSrfqHq8FwAii0IP+aKSuqC88
   UjC/WeyXdfLO/Ffsa22Ks/yhCBcvePDN1GF7W3dAQb5M70vJStcLfdPAR
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cmBGtkSMbYjqxWc061Aam89ByexO76D+mHWT5P3fiGwNU99N2W4rto4E3Gw4CK32Z2PSI8uo+l
 vZPJ/sRIWAkTKkGzrR6fq9lWYwmdxWUeaA4feQquHM3ANeBjyDEm7Mtr/eO9qQLfEHoL7+yJtf
 jPcI1WD8GdpmKnrA91h2kx2IdmPJjW45S6gk6RG0rGAjcSlq33tjK/sOql7wB3X+Ces5IHZhip
 TtwKN+7TjvF+q0FOxeAAB7Qkvzb9Y2gAyaBdnOY9DL1SoNwfUkcWLHcj3FX6NivauQhMXG205S
 VtM=
X-SBRS: 5.2
X-MesageID: 34447266
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,457,1599537600"; 
   d="scan'208";a="34447266"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZlZpmRsOz5kAenm8c/dSWC9QHScEqweH6bwlBYkcsdz4uU0+u+2ZRpzled+eNDtZxkTOfHC3E/d274vOTBGGPunwSWhKGl1ebZ6pf1xDCk3i48m/QEfEVRE6zhuZ506xeJXcZmkkv/tWzqCaLoDieYnHKHadHIfHC/O8PgjMd8XLkJ+d2mBkPZjtj1DYLsIEV/cjQfVTLWIUTWD1dFowiqDxSOX2P2vmGwYeqWwlZ4fJxBepfq1P3nPmLcwlUuwu7RsmnPFTyxsDCduoQFMBd2rxMInaDf9j9i2aJreEXOnKSLjh48vWUhsAp9z/4OWlhZZUoe+3S+jD/es7S3Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYbrHp9iKJiWxaQHqD53D1XUQOZyrtsxasMWiJ7vbE0=;
 b=VBBx71DORQpugel38fbDayr4a0mlZX1p84oK41G9ub2ad5NqKGct8N5c91gZdB+EvP1lvhQM+NaTNMcJWruDN0MSD+ewfiBSwKHdyxa7OjNMTXayK1gfTpoXSPzR3Db9TgyO3LUn6Tn/XrFqv2A+TXHxmkWodtCE4PSeK/49k/v5ewlKdbLYnb0gzjncTVyStnhL08kUBxuXwSWEs1aRYbqYoFtV8ZEFlr/o+MOAarXTtbSoJoVJvLMXc1sKnjp2XLPjmEZ0LTPsDWY/rq+ZxS+ykM+oZYH9D7UxmZt38l0Osm7txIHuKYymfsoSCJOq3oHXpyJReQjmM/ECBJxLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYbrHp9iKJiWxaQHqD53D1XUQOZyrtsxasMWiJ7vbE0=;
 b=DSnFPip3usn6YHc2U8Bo2XCoJDOwsiR63XKXuDXEFTWsgHWzvaOlVcgFon+N3N4wTae/ORMg0F8bAxaYJWQuNg2gRgzHwtR/tUWRUqy+agu0S00kDeQxqBG9bEY6t1quwTtdwUVTteFMcp/wfaBetgwkmB6gfBXOuvcqGT8R2jU=
Date: Tue, 29 Dec 2020 12:49:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/24] Make libs/call build on NetBSD
Message-ID: <20201229114950.6b3zrtrmqhaqxft7@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-9-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-9-bouyer@netbsd.org>
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11b36d17-9c04-4244-20f5-08d8abefdbfd
X-MS-TrafficTypeDiagnostic: SN6PR03MB4590:
X-Microsoft-Antispam-PRVS: <SN6PR03MB4590F873194D1F228F4801458FD80@SN6PR03MB4590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVT/PMoqwFiydX3PTBks+cE/FVJgZ2V7q+3f85ZhWi9jKBzF3Mvkl6EVjDW8670TyMXuU2xi1odZk2kOh/FbDCUf57dKhaGGwkVVtnD3D3PmGsgWJAlxc7yuJbr4XSLVU92ZXctfXbM5rkwsNbquWJ/ZjN/UvcEBNLckIi2BpfN5zEI5DxrqDoxBOZJSN9She2y48rR+YNCHOOH9LbX3mZkbaP9mhD842jZGYcEMDvTZRywmg8oWI4bqt7n7srZ9T1boM1EqJpDMXC/XjnX+MWGugKfLOKnjWt9Ov4WQ+533nlSPzopUG1KAvTjc6xYqrQzWBXHzXyauGGe+jZAVbIiSRmzJ9UcrOlwrCopeWLFGgxL9Yc3kaDrGCOzNbQQtijcteprgxkBUG2dGSJ1lBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(316002)(83380400001)(8676002)(86362001)(2906002)(186003)(66556008)(1076003)(6496006)(9686003)(4326008)(5660300002)(16526019)(6666004)(66946007)(33716001)(66476007)(6916009)(26005)(478600001)(956004)(85182001)(8936002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVN4R0M0Q0VuOHgrcW9FVkNOdFo4MC9pZnJXTTlZMkQrYzhwYTdER3NtK2FL?=
 =?utf-8?B?ZGllYm96aFM5NVVPOEUzL3UwaTdKbVdyUDZJNUlVVktUN0RqbHhGU2JTalRI?=
 =?utf-8?B?Y09KOGdJZVJPUFhSQzJmYm01TjNPSzRaZFNrenVZMmQ1TlRMdHdYaDFwYVZk?=
 =?utf-8?B?OHJ1aU9wMVB3b2MwTVBEdDhyTmJENkpIZlVnL1RteFo4NllBc3gwbnlaY3g0?=
 =?utf-8?B?LzJZd3FBK0ZOOTJkbXRnK3lxV2JZbmNMZ3VJbStGRVl1MHlhSTRpNnpaK0l5?=
 =?utf-8?B?aHpuZlNTQUpMVERmdDlQZGlXYVJIb2FPcWFWRStKNktBWUlHY2VIcUxqSm1M?=
 =?utf-8?B?a2hZZ29ib0NJYU4wRk43Zy9Ta2lCQVNBdDJqMFIxMlpPaUk5TjAzQmUxT0Qw?=
 =?utf-8?B?SGF5ZHFISkxUZXhScFZ3TkRxUk83czlmN3BNVFdBZ3EwMEd5dnh1RTErVzQr?=
 =?utf-8?B?SXg5Nm8vR0pZeks4bUdpZXB2R05URVFSWGJoZ2N5QlFuVkZ4WHN4bDExR3E0?=
 =?utf-8?B?UkkyUXF3Wkdqa3FOU1hSU2xrenJkZEVuQWFEL0N1UTJnenI0UFZMZWluMVNo?=
 =?utf-8?B?ZWpBZllUdmV0amtna1U5MXNvWlRpWm9QTjkzRkNzVW9ZUjFnby8xY1d0TWNC?=
 =?utf-8?B?KzEyd0srVWJUOCswMmNUMWkvOWFDZThLQmg3amZzRzNkYVpydTNZT1I3Zi92?=
 =?utf-8?B?RW9jZnlsanB5bnU4QlFXZEYrK2NzYVpQQWhmZENNQXFVRlZNTS9lMHJ2cGZy?=
 =?utf-8?B?TmpPTElHMnlZL3NTelJGbGZXd2JxVCtFUmV1Tnk5YzlGRG9YOVVlK09vdXRP?=
 =?utf-8?B?TGFZdzRzYUQrTTVleitMdDhDYW4rSDdnUjB1ZU5XZ09JN2p6eHl1elplZ2Zz?=
 =?utf-8?B?N25DUy9GRUVOZW1iRDRBTE5JV01yL1pEL2tvbEY3UG12eWVWMzVGL0MwRXBR?=
 =?utf-8?B?MHc4QWRJWG5keDZpNm1ycm9JNjVvUHdPb2JDYkQ5WGJ2Rlg4akkwSWdLbElE?=
 =?utf-8?B?Q2VDZWdMak8wVjNSeEs4eUc4dlVCL054a09kamF0NjVXNEhHRjlTL0duVVd0?=
 =?utf-8?B?YTNaaGxMeUVLc0NSSlZIY2s2aFRMK0tPUWlZQVhTdnpCTDZsMlVva2FOT0Fz?=
 =?utf-8?B?WWUvTFhHbnRoZUVmU2dDM3N1WjhPUGh6ZDhsd1lVQ09SOGUwTGpJbXFvV0tr?=
 =?utf-8?B?andDQjBqSzRjRndXazZXbkozVTBwQkM0czRnK3d3V2RCZnBoOWpOeDlRY2dT?=
 =?utf-8?B?TGQ4UThxWUF3NDdPZ3U1TXVRRmZCNVVEQ1p1d2hubHVDcHlUMHQ2ZnV4d2cv?=
 =?utf-8?Q?A+VN+oyDMMzfLnsURVJkRzRl+c2nSRdljW?=
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:49:54.8839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b36d17-9c04-4244-20f5-08d8abefdbfd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFkTjOO92Egab88Xq0uR96b2bdJ8ivDDxKUgIoBZlXIAg3J90EYccB1WWS1FomN2RrpvpT9AYfkQ0aNUZvLXpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4590
X-OriginatorOrg: citrix.com

LGTM.

On Mon, Dec 14, 2020 at 05:36:07PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/call/netbsd.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/libs/call/netbsd.c b/tools/libs/call/netbsd.c
> index a5502da377..1a771e9928 100644
> --- a/tools/libs/call/netbsd.c
> +++ b/tools/libs/call/netbsd.c
> @@ -19,12 +19,14 @@
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
> +#include "private.h"

Please leave a newline before including private.h.

>  
>  int osdep_xencall_open(xencall_handle *xcall)
>  {
> @@ -69,12 +71,13 @@ int osdep_xencall_close(xencall_handle *xcall)
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
> @@ -86,14 +89,13 @@ void *osdep_alloc_hypercall_buffer(xencall_handle *xcall, size_t npages)
>      return p;
>  }
>  
> -void osdep_free_hypercall_buffer(xencall_handle *xcall, void *ptr,
> -                                 size_t npages)
> +void osdep_free_pages(xencall_handle *xcall, void *ptr, size_t npages)
>  {
> -    (void) munlock(ptr, npages * XC_PAGE_SIZE);
> +    (void) munlock(ptr, npages * PAGE_SIZE);

I think you can drop the (void) cast here.

Thanks, Roger.

