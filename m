Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A931E918
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:49:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86580.162710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChne-0000pV-8B; Thu, 18 Feb 2021 11:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86580.162710; Thu, 18 Feb 2021 11:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChne-0000p4-4k; Thu, 18 Feb 2021 11:48:50 +0000
Received: by outflank-mailman (input) for mailman id 86580;
 Thu, 18 Feb 2021 11:48:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXm/=HU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lChnc-0000m1-I4
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:48:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5039829f-1079-44d6-9b90-2b9138f9cebd;
 Thu, 18 Feb 2021 11:48:45 +0000 (UTC)
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
X-Inumbo-ID: 5039829f-1079-44d6-9b90-2b9138f9cebd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613648925;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FXHFAYYGqfbINU5bAK19nnqPuljhQWtO3/JhdCU9WU4=;
  b=O1NfPotsqmNpY24038KXY1JBIkH6bJByDYjoPulAlRkZtFl9OGouQsKa
   NpMQb+WDcZ1ThEwNbvC8IwTH8iAQpuqIzX7hNEENmvusRz2+/jmx7SJsw
   D7gjS92GayCUprrFPD8UI/3w+NLSnJ1G8YIymRsW6HfQtjBcP3VnSiqT0
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R8d/KEYbsq9hLrw5VvgPGwPa5P0OoHRiJKQnf30sTjOpxijvRhqtaA1wXGsbjYmNJUiH0BifMo
 JA/vxD3cAGGjNMFVu3/26KCGkS9D7YFdUsgfNo0IX8TypYwjFcmqO9pC9vuQIZ+F7xSDfHqUQ9
 CzxgDuQ1WSt0msyo+KYnw9jifrGwrW1Ikzm1+rtsuEXbBaMHDgncdfhRpgXXdxu9W/TIepBOW9
 hJSj+mzytYTCKecGvi/g3nfIe2KL3qGL32ILw3gSQ5MYY8tGKlyK/Bbo8ExZItosmMCL6JyVgC
 jGA=
X-SBRS: 5.2
X-MesageID: 37872918
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,187,1610427600"; 
   d="scan'208";a="37872918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFJxjkdIeGmEkSbhFkxPpJ5KWsp/wxHI7OSd7sA8/cwqLDKcn72VsqzGAqIln0jc6hxUTUEI3ujGD5sagr5iKMtbid/YASItGzpk58/6cksN1Pl/+vWFNrSK88wuKIQT/9vZqUIyXhNo+x9a6odJeUOUAabggxFkUIGHwiMXqVR0fo5a1sAYrvibDZvJSGtrtw1WI37pg7oNADglYImIzbre2QJaK7jpZR/mRTgnuy3wwYR7b2UvfyDxRRoocnssLkgaZnSkx9iID9tGaKfvgcKELsByGxxSQKRxTqV4o8kzkHscXazN/twA0IXoc5PTbTQ/VzID3f8rQWASRfRwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELahRdeN5J9kMXWhPEXU97y4TG25/2rHS0WXuLbMYDk=;
 b=EMcJvgPw4Fm70zggwKL44EBhh2ssgMnDLwCZzyPT3xZVruCO7Ekw7+2YGvbyTxsNlx4y9gzG9MaarfzUcj4wyqROviAeQhSk2cfnOYU54lEIk7rdMjQaJmlzeq7LruVFmULbIPsXLHjdcbH1PrfKw3uogfa6kMvgg7VYyuQCpR6eb2p0oul/u1uax30LgssIycIHfLt/QfOTK7ycUyxszLpIcN4Q+v/F95/B1Jxm7ivBmJ9T/dZcuQ9jjCINxukyAIbzP2o4xT9g+DFGXbpndzeV2pYHLx9mPk4Dkx89zqAXYmX00EP62xXgIsAvNH6cC3AUdjdbli5VKcUuW4OxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELahRdeN5J9kMXWhPEXU97y4TG25/2rHS0WXuLbMYDk=;
 b=bM9iEkd9TXd4rRYk9rcG4P4owTg5b0ds8vxDDn0BJhFsKdnPQrKBcTI3XpFIZqxD4r53AbCdHJhDu2Ej+tIEPS/Lad0cAU33PM/STl/zb9YYAWiMIHpSOQUCnaO2aZr//YjXXXAqXJAFhNOM5cHhBX5WL5xzMxAgVvmVu/28UPU=
Date: Thu, 18 Feb 2021 12:48:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<anthony.perard@citrix.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>
Subject: Re: [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
Message-ID: <YC5UEzGwoqmLvh0n@Air-de-Roger>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: PR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a38e1963-c3eb-4a3e-94fa-08d8d40322e1
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53236C41867BC625E3FC83878F859@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5vlmrz9C4nLozIFGJinmUzKe1fzoUU4exNGrgPr/bQ6BUrNxvKFRRrLJ1lQXXNdO7fgZEw98eE8Q32aCM0PHYM1AdpSuzRZIvoBpSbE/tFWrBC0GZ1EGMlmo0LlLCj62SjeKskEVvlKl/yZlTmDlLOwat//oXTRmX2xVoZjKacHxz6ncw1PU1xK/KltrwzJkox8Xl6lS/PoGrJzUS+vUOjNiIzhIIWgR5s4oOiD6QCaytPGQmHIM1wMQzVYeBP09rXFdAJhHwzoeQMQDRi66eLeHYxDJYJq3pPYGs8LcWIztzypO/W2yaXY4FFF2zMys1Zck81LcNjaYcU9meTDSKmJ/FoZVPCnjIoWHJ7+uf6KnT01JnTj4LQXGoav7fhrTnlb7grA4o5P7tcqk7YnoJKD2A1x16sBJfGUuTlQXNSZ9w8ed2uHkOdogpHcLiXZ3bMGFIkjvTDwd2amtcQdcYjbBZ82b5UhemEaZYPjn6XSR9kn3zZHOjosVxn0HyOrOtZzaiq5QbBHowyzXpJbFglOpH/wcCrGLBr28EM3+NpnbHvVn8PU1RildI7x+0KeoUdRM3x1nKaFgOyzRc+lkEjk6AR6CNyyKYB2ZLv9805iVRfW5DIEubjlG/ZJDlQjO25D0j/Uhl87OYdI3IEsDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(136003)(346002)(376002)(366004)(39860400002)(6666004)(26005)(16526019)(956004)(6486002)(316002)(6496006)(186003)(83380400001)(8676002)(4326008)(33716001)(86362001)(85182001)(9686003)(6916009)(478600001)(5660300002)(66476007)(2906002)(66556008)(8936002)(66946007)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFE1ZUxsUmtZRVQrbTVRcGtOSWdZOFkxQVM3V3ZrOWtGRlFVRlBOMHd5SHpo?=
 =?utf-8?B?dXRIYSswMGZBczBVUzZqUEQvV1NldlZTK0c5Q2NlS0FUdjB0T2t2TGc4cnBS?=
 =?utf-8?B?RzRJVytTNVRHVFU5dGxDcEtIWW9BaVJyR1d2aFNUbkkvd1B6aktiUTBDcUtF?=
 =?utf-8?B?YkxTTHNod21qR1I5SEJYK21mdGJ6dDFOTmZOcWJSaGlVR3JEUXloODVacjdH?=
 =?utf-8?B?c0ZZUnZXQTY1T3FLd2JBVkJ1enlaUmQ0VkQrZlJ6amJrcFh5UHpscFNZZTg1?=
 =?utf-8?B?UkNHR3ZLcGVob2hHMC9PdmdaeWdwOGxxN1NRbk1ZczF6SWlQTG1nSU1waHJY?=
 =?utf-8?B?bFhLd0V2NjBWSEhna0ZUWDlqQlp2S3BzR2Q2eTQrVHRFRWUwUS9vMXF1dnNl?=
 =?utf-8?B?MjZOSllOaWtvcUFqMEd3M1QzNFIyc003b2Q1TWpiR2p6VXk4bGdGZXR6ZUk5?=
 =?utf-8?B?bDZnUitGUEZSMmtwc1BiOWUwTXljK3RuMVlaanY0VmRuZWtJbWlpT1R5eHV2?=
 =?utf-8?B?b3prQUpIRm4wN1ROaEh6Ky94Z0FHcVRocG9sS2V6cVR1VkRyWlVPODgvWm5n?=
 =?utf-8?B?SVFzTHVQUmUvaXRMUGhWWlhUbUowQmpHRlNjRUtUVHpGVVp4TndvaU94Z0Jk?=
 =?utf-8?B?THZ0UnZ2UWxVc0tlZmJkdXNEV2xxT0FKSk85ZVlSRXpwVE5adUVqOXVXckRN?=
 =?utf-8?B?d3VKRXpGYS9TU2ZGdjBUZUJCaTlaMVFjY2crSk54aFlPQUlQS0JVYk9QM1h6?=
 =?utf-8?B?eVRHSG1DYU1xMmxXbmRVeGlLNk5nVFNIQllZa3dVNm9DL0pqKzY3UHZiWXFB?=
 =?utf-8?B?b01MTm9jR1BHZUlzeS9KQktmQTlhZFJ5NTkzaFlrUVVOTjFUQ3pNVERQUDFp?=
 =?utf-8?B?dDhrQjQ2c0FBdGwyK3dzTGc0YmxvVnNYeVl6bkwwQ1pTb2IvL3R6RmhNUTNU?=
 =?utf-8?B?US92VzZVdjVnblYrd0tUOXphTmtFSGM4ck0rbEZxemR2em1LUkVZOExrczUy?=
 =?utf-8?B?ZlVrc3ZsVll3dWFSTGFpcDBsamhlNFFHN0kvREVFZDJDaWdsRmJMZHluOXRp?=
 =?utf-8?B?WnJpSGlEYmFFRFFtdktvVmJZOVloZkdRMTIxU1hCOWMraWZrZVJnM2dqamp3?=
 =?utf-8?B?czVCZmlhTW5JWVM5ZTc4eitjSmhpNzRDMGZKTlJkSWZMdm5HNWZZZGtDc1B4?=
 =?utf-8?B?REJiR04wRlpUamh5dVE1S1VpMmZ2TFZmbS8yUlpQemp6YkZLbko1V3lrRzFt?=
 =?utf-8?B?L2FWc1YrVTN3bWpDazVqSFQzWGZGR1VYa1RUejErSTQrbWhPNmROSnF5cGVt?=
 =?utf-8?B?MVNZY1UrK3VGcmxvTlZOOGI1ak05ZW13WUFiallNNmtmcVNwK3RoTDlOdUNi?=
 =?utf-8?B?Z3hQQW4vTlJsQWs1MHljNXFxNnlUZnRxUFJwNTVlTUV2Y3BYSFNDK3djTnRU?=
 =?utf-8?B?MWRWcEhRN2p6VDBVNEdGWGNqYzkwQVR4d0RxblUwUG1hcnhGY2plTTcyNkQz?=
 =?utf-8?B?cnlpZUptdmpVZjFTVzhIdmtxRXBhUEVzWGdHSE1sa0tCTjNZQ0dicGtISGtW?=
 =?utf-8?B?a202NWovQXhYejkrbVIwQlZHMjYyRTdMaDI0SUlId0J2akpRWW1FanRoeGNL?=
 =?utf-8?B?Q1FKTDllUXp4RVZJWlVMNWUycGdJMjF3ZUpNYnJhYXI1eWJIVmcvNjQyRXQ3?=
 =?utf-8?B?eGZtQlFiNjJtLzdwVmxHVnlOb1BFdGl4eUlOZ2dQWXZ0SWxBaXJqV283YnJx?=
 =?utf-8?Q?SOp+zhjoPW/5eHPCoUXqXw/Em5Zsiy4WrZWmq23?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a38e1963-c3eb-4a3e-94fa-08d8d40322e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 11:48:40.9568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Had/HMqjVVEfdqNK37gCw/syx5C/JuomAFVb6jTo0FLxFVtOEGRG+ZY2+woanyr7WQMN8PEUY2gusLFZx0ntkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Wed, Jan 20, 2021 at 05:49:12PM -0500, Boris Ostrovsky wrote:
> When creating a guest, if ignore_msrs option has been specified,
> apply it to guest's MSR policy.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
>  tools/include/xenctrl.h           |   2 +
>  tools/libs/guest/Makefile         |   1 +
>  tools/libs/guest/xg_msrs_x86.c    | 110 ++++++++++++++++++++++++++++++++++++++
>  tools/libs/light/libxl_dom.c      |   5 +-
>  tools/libs/light/libxl_internal.h |   2 +
>  tools/libs/light/libxl_x86.c      |   7 +++
>  6 files changed, 125 insertions(+), 2 deletions(-)
>  create mode 100644 tools/libs/guest/xg_msrs_x86.c
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 3796425e1eca..1d6a38e73dcf 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1835,6 +1835,8 @@ int xc_cpuid_apply_policy(xc_interface *xch,
>                            const uint32_t *featureset,
>                            unsigned int nr_features, bool pae, bool itsc,
>                            bool nested_virt, const struct xc_xend_cpuid *xend);
> +int xc_msr_apply_policy(xc_interface *xch, uint32_t domid,
> +                        unsigned int ignore_msr);
>  int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
>  int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
>                          xc_cpumap_t cpumap, unsigned int nr_cpus);
> diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
> index 1c729040b337..452155ea0385 100644
> --- a/tools/libs/guest/Makefile
> +++ b/tools/libs/guest/Makefile
> @@ -56,6 +56,7 @@ SRCS-y                 += xg_dom_compat_linux.c
>  
>  SRCS-$(CONFIG_X86)     += xg_dom_x86.c
>  SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
> +SRCS-$(CONFIG_X86)     += xg_msrs_x86.c
>  SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
>  
>  ifeq ($(CONFIG_LIBXC_MINIOS),y)
> diff --git a/tools/libs/guest/xg_msrs_x86.c b/tools/libs/guest/xg_msrs_x86.c
> new file mode 100644
> index 000000000000..464ce9292ad8
> --- /dev/null
> +++ b/tools/libs/guest/xg_msrs_x86.c
> @@ -0,0 +1,110 @@
> +/******************************************************************************
> + * xc_msrs_x86.c
> + *
> + * Update MSR policy of a domain.
> + *
> + * Copyright (c) 2021, Oracle and/or its affiliates.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2.1 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "xc_private.h"
> +#include "xen/lib/x86/msr.h"
> +
> +
> +
> +int xc_msr_apply_policy(xc_interface *xch, uint32_t domid, unsigned int ignore_msr)
> +{
> +    int rc;
> +    unsigned int nr_leaves, nr_msrs;
> +    xen_msr_entry_t *msrs = NULL;
> +    struct msr_policy *p = NULL;
> +    xc_dominfo_t di;
> +    unsigned int err_leaf, err_subleaf, err_msr;
> +
> +    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
> +         di.domid != domid )
> +    {
> +        ERROR("Failed to obtain d%d info", domid);
> +        rc = -ESRCH;
> +        goto out;
> +    }
> +
> +    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain policy info size");
> +        rc = -errno;
> +        goto out;
> +    }
> +
> +    rc = -ENOMEM;
> +    if ( (msrs = calloc(nr_msrs, sizeof(*msrs))) == NULL ||
> +         (p = calloc(1, sizeof(*p))) == NULL )
> +        goto out;
> +
> +    /* Get the domain's default policy. */
> +    nr_leaves = 0;
> +    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> +                                              : XEN_SYSCTL_cpu_policy_pv_default,
> +                                  &nr_leaves, NULL, &nr_msrs, msrs);
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
> +        rc = -errno;
> +        goto out;
> +    }

Why not use xc_get_domain_cpu_policy instead so that you can avoid the
call to xc_domain_getinfo?

It would also seem safer, as you won't be discarding any adjustments
made to the default policy by the hypervisor for this specific domain.

Thanks, Roger.

