Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65DE309048
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 23:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78541.142890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5cc1-0000m1-CY; Fri, 29 Jan 2021 22:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78541.142890; Fri, 29 Jan 2021 22:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5cc1-0000lc-9F; Fri, 29 Jan 2021 22:51:33 +0000
Received: by outflank-mailman (input) for mailman id 78541;
 Fri, 29 Jan 2021 22:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5cc0-0000lW-5X
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 22:51:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 966fd018-7433-4f80-8623-8f02587983eb;
 Fri, 29 Jan 2021 22:51:29 +0000 (UTC)
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
X-Inumbo-ID: 966fd018-7433-4f80-8623-8f02587983eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611960688;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7EcwBj2VpoGlx3+wQCkLLWjx2rP7Wz7Vh075HDNz0F8=;
  b=gXocixzMzwRXV3+ageLqel6JJ+wqGUTc7qniZwHF0nju0zeKRXrR7yD7
   mQdveZmURctMEziPRfpaG2iP3xzDrj0Hi0DmgayCwW1DPpaGC8N/zmGdv
   A80qlRMxXhM8/ukQpv3ruZvIjf0MegktMDMrzI7hfwgrRjh8oPXduOAau
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vWacEq2tfcCd9CxNfTMfURnDuJCjvvktWOYss5SepHnf6s/KeLESrf5+lOxgSP5JPvYT3wtXcO
 adR9hOmxeLMc27PAIZGMhPMPvZ36Sc68L4BPqS6eN3OzgHFDs9q3hil/p+I/2L21bJrH2zbdk6
 YSELUDh/NXa3bCn4/IkWvYeWczQ2E/1kf7sIC18GHd8gkurCAVYn+tjmJ+MqU1rFHvw9wcGiYn
 /4XvafqcroigZndxqM3vR+j0kkfMfxeJp9qvquAK3MSMW5mKp5Zdo2aSf1LmsrnUxX3QBJ4j2Z
 Ryg=
X-SBRS: 5.2
X-MesageID: 36230418
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,386,1602561600"; 
   d="scan'208";a="36230418"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzHeCSVK/7f2ZxOBjQcEBBT/0Enz385OPFRgXrRIhFY8gTfdYnZI0ni28B9RCp12360e7j98HezHWBX9uBJuHz6I9CByU+Ew4x4FgyHBAgKjtcrh7aOqjLXF/wTm80PCpgoTGTkJln1D0rCdpAbnE1GHLCvpAj6FS6yazmWhXC+ARmWZGCw5ONA4AHG/NMVFz3q4VRHCp2j4WSppjEyLd4EkQbXDk8Hd9rbYLD/VGFyO8+jXHNyiKas4T2XSGoXEXET24NwY36rDPX7fj6J2DtxzW/ndjkTFFdjKCem/gHUTyVgwHhDhNL5NIb9DQUzY37ixwMW5vOmZpCW0rlVqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXJmn53IVoFVFKKvay8IFSw/isERsH1yW8ETsr5xRog=;
 b=koLNnAvBYsFezz2xxGSRFP0e3c9j31UQsfTDDGzmWEzFqk1pjs/0UHLqIrBOxyVkuYNH1GORSaAiVa7eN9HqWRiYffW3tD5QDwDw70IT47SnIe2TFLsHPQ9r0cvr2ZM9oGTxjJJlmzuFL4Yc7BtWxLbGSOLHJQRXhOQ4M76wsbFIfs9RH678a5PrB4JQ0gytf9pjptu9c40QlU+2BlSPvSwEAeP2u/cIAG4rQ/zXfw+z0GwdDqPSzIIASzxBT+SUa00wkXiOuRc4/jha1khYi7QFN+tUsVylj3P6MKE/r+DtMHLnknk6uUO3F/aMVzrgcny3DOaXpb5NcYgRkcOxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXJmn53IVoFVFKKvay8IFSw/isERsH1yW8ETsr5xRog=;
 b=Kh1Mk+cLxbvqChpkxbe9sAP+0QSVsJCf/QkthJ+SDhUU0lMizJX33NaORk7p7CpaBBYzU8tvie60y1LA8M2MVF/xgi2DPD7l+9RTyg5NCsAXCA3xEOIvFWZOwc2laoj/aYncG+HDYdgbwN6Xz1Jh6v4tnCdu9Weo84ZYUF65umY=
Subject: Re: [PATCH v2] libs/light: make it build without setresuid()
To: Manuel Bouyer <bouyer@netbsd.org>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-11-bouyer@netbsd.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <69db20b1-b464-cc6d-3b26-711950cc81d7@citrix.com>
Date: Fri, 29 Jan 2021 22:51:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210126224800.1246-11-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f765eb3-513d-44bc-2759-08d8c4a865d0
X-MS-TrafficTypeDiagnostic: BYAPR03MB4726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB472610002A51544CD4F34CBDBAB99@BYAPR03MB4726.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8mxfXk12okjp3I+nWUn8XesIV/ySL6dx6xErn+Z4+P6q0f6GejVIzXIZN7cdgQWCT3H2DiMeKNbbQAh8kZyqsTitrxPXGymYxkSftgM2ypXn2bwrnanRekG5MvZgVFzKD5gyAwPvuIyz4r8FMqKrxk5vmLiPdRUxf5Cn9+0rkd/P39hfvwCaxI+duH3zLq3+ju4m5wTklDFWwLE8UjJX/rFw5YnEZTBeGJ6FI74cOVyrO+HU0UzzhpezHr7CVrG7XuHmqGf3lW9tYt+Thylh4U5AnsBfbJ4OorVUSfb3UhlgN0h9fYc/UR3vSxb0/iRQdW5SgguDPVsw1h026tjcdv3apO4Wo/htZQp/Ybyor5b3/9U5NYlVwvHnousunHd2G9cqyyv8Fb9tDHphikNm7u2jX5w4vgZ7bXz6AGOewSCAWpQG8bxomVZW+DOFOMcsSf0ipzxHu2I5H7X0UdNocYV+fOvedWWCOXno0UIcISv4cPbbOMDH4Sh+udUJByzextY7mF+Wsk0VcRsduhGAzbP3W5sxlOkfrHQ5EX6URbCEKi9BQaxNlfQHWqeZnpSyJw3akE1NkywJ4p8qy/hCIEE2IMNRhubmqV1t07VICmFTMFg4YX7nQrXxCFg9moq2GoCFvJ0StkGyAGtlNq9p9aPv5Oo7r4aaJAeuEFa5tLTCK6qZmzmqBFP+vsadAWfgC2B/gCdlq3VsnsX3iJEpDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(26005)(31686004)(31696002)(316002)(2616005)(478600001)(16526019)(36756003)(6666004)(8936002)(6486002)(2906002)(83380400001)(53546011)(86362001)(5660300002)(54906003)(66946007)(66556008)(966005)(66476007)(107886003)(16576012)(956004)(4326008)(8676002)(186003)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K3Y5aHp4ak5LN05NS1E4d2NSd3pQdHpMNnB4Tk9iZGV5M3BIa1BlbitYTFNH?=
 =?utf-8?B?MkJ6TkdONjNtK0RMVGdSTDViNFplN3lTTjJCbEcrZjNBaGV4RVBCZnpVWlFH?=
 =?utf-8?B?b3g5K1NvZEV2L3hRdFMxMmVSbDlyWE5CMWRBK29rK2V2c3R4WUNjUTEvQmdS?=
 =?utf-8?B?ZktqRW5YM3FCbFI0RGo2WWdIdTRQMWx1VUMrTHBTcGdMOWtEbktFYkNURHdC?=
 =?utf-8?B?SzlvLzY5UUtMTE1zb0xRVFdlQkdrRFFMcWtWczdBeSs5WVJZK0E3MjNSV2hs?=
 =?utf-8?B?VVpyNDNmNWpFalM5ejdiUlFzdTRhZTBaSXptQnpqYjA1OTBrc2lhYkd3cWpI?=
 =?utf-8?B?S2dYL0V0alBmNGJST0dQdU5xelhrRGNsdFVHdXhwSVRDVzh5SENzV3Fic3FZ?=
 =?utf-8?B?TndSMGx4aDBUWXhMSURhVjRHV1ErV0J0NDgzRERFeFJRVENlUFZFVHRRKzVD?=
 =?utf-8?B?SDBaN3QxbEUxdVBseVNnS21wckRsZ3hseDE4d1JBdUhZV3lJR3FPZGtSaUta?=
 =?utf-8?B?VUtUQm9JK0ZtUllRNVFzempWc1I5U1lkSHZYZDA5K2lPbXhhSGlEUnZlUFEw?=
 =?utf-8?B?NjBWbWlTVzZuRkF4KzU3bENMMzRPR1J6bDNodjZsS2ZMK3ZMK1diK2M4b242?=
 =?utf-8?B?bWRIdFh3NXJhY3FnSzZGbys2NStyWTlhK2gwNGlJaDVoeCtTcWZuTnNQdlFQ?=
 =?utf-8?B?d0ZVUStsVXNHUlFnQTd1T0VNaEZEVUROUzUwYWFQRWlKSHI1c1RqNGozem5v?=
 =?utf-8?B?eW1ORERSUDAycWpRV1dyOTZxc2p6VWt5dVNjeWlrVWg4TDJyeFlFS3p4WjJr?=
 =?utf-8?B?SFFTTHVEN1hvQlhva2F3dU8zVEdob1RjVnpjMWhJVUNEb0xCTUZnejRKZkpD?=
 =?utf-8?B?bDNZRE8yVXVMV3VoRnp3UVNaVXZYVXVvM3duNitFSmowckVPMlZ0eTVLLzFM?=
 =?utf-8?B?bzJ2MFJIOUF4QTA1ZnRtU3YvbmlGa1FKZXBQY1AvUSs1aGVjMmlGRjFSVVcw?=
 =?utf-8?B?RnptS0k1a2FmSzNLMjlaNm9rOGlMQ2JiYkRhKy9QY25pRWxwS042OFd6cFdF?=
 =?utf-8?B?OHN3N0VlU1V4V1lwRHdUNGs4cXh6bEMxR21DdGpwOUlnTFdIZTcvb243ZTA1?=
 =?utf-8?B?ZGRKZ1dkTk1tam54UllwekZZbFBGRzNmSFdEeDJtZEdnb1hiSE9lNlZkV29t?=
 =?utf-8?B?NWpFbFlHQmllV2owWnBDSzI2YndRdlkwV2pXQUFaWUgvaWVoTFdYanRxYkg1?=
 =?utf-8?B?a0tsSEZvcXdlNTdxakgyWkZ6OXdlaUtYQ0hzVlllVTFCK01sRGVONzkydlhX?=
 =?utf-8?B?dCs1TDRNOUNnS3F3T2x3WjY4bXRySVUrRjVxOHRlVi9wZWRSakI1My9nOXFr?=
 =?utf-8?B?eFFTM3NJWDdJSU5RYlZ2UnpxYzdRVW9BSGFlUjhCVVBhWUU5bmRhUUJrN0tm?=
 =?utf-8?B?QUdwRFpiaHA0dDJvWkpTZkJxMDA1Q2h2VlRTc2ZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f765eb3-513d-44bc-2759-08d8c4a865d0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 22:51:21.8253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AzMt0ufQ1Ko68MwDE0jfFPYKBzwEtrJCvHgPUm0/D9FTY5mi3Z76ABMvDoFMzrHPxfDdgVnY9SQ3B+qTAXV/Sl/ZICNUX+zetdP/LvxD8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4726
X-OriginatorOrg: citrix.com

On 26/01/2021 22:47, Manuel Bouyer wrote:
> diff --git a/tools/libs/light/libxl_setresuid.c b/tools/libs/light/libxl_setresuid.c
> new file mode 100644
> index 0000000000..ac5cb5db53
> --- /dev/null
> +++ b/tools/libs/light/libxl_setresuid.c
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2021
> + * Author Manuel Bouyer <bouyer@netbsd.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */
> + 
> +#include "libxl_osdeps.h" /* must come before any other headers */
> +
> +#include "libxl_internal.h"
> +
> +int libxl__setresuid(uid_t ruid, uid_t euid, uid_t suid)
> +{
> +    setresuid(ruid, euid, suid);
> +}

Given the freeze, and discussions on IRC, I have committed most of this
series.

This particular patch doesn't compile, but I fixed it up.

Still outstanding are "NetBSD: use system-provided headers", the
followon patches requested in "libs/light: pass some infos to qemu", and
"xenpmd.c: use dynamic allocation" which failed like this:

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/996140268

This latter one I didn't feel confident fixing in a way which didn't
break NetBSD, particularly at this point when I'm also racing to get
other content ready as well.

~Andrew

