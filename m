Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA97CF3E6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619035.963541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPCA-0004FY-HQ; Thu, 19 Oct 2023 09:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619035.963541; Thu, 19 Oct 2023 09:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPCA-0004DU-EY; Thu, 19 Oct 2023 09:19:58 +0000
Received: by outflank-mailman (input) for mailman id 619035;
 Thu, 19 Oct 2023 09:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPC9-0004DK-IC
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:19:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9f67e0-6e60-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:19:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 09:19:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:19:53 +0000
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
X-Inumbo-ID: aa9f67e0-6e60-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R23xJlDkoGe2LHoFSb+xOtA5eAS0Old6HZU4WYsTtb0mXg6fPHsXvNsE5J0GrgRnUpT1d+O0D9av6ZajNuuKl1TIvId7FDDnoINJrq9WvDVI+BnQQovpUJGj5HHEYnhn/jULQRUBYadjLInKvNvDb/UTtegWi4jDuT6KWb7wVaTKJoAkxBGqrB9vgKZEPeWtltV86VfSW60MdMcHA6HwAAaRCBbhIr6xJSe0RWFy49InMtstEvCTJLZBKcuZ/J0q+r1sSwOR1MklPKOn2daHbxPf6iTmFL61ValNT8tvMSOscxHQJkjK4J+oKhBvYlW66KbmXfQBJ5uAU6vrW9Nvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7t2JAKBm9yJYuYo804pt8F1unb8nvaOsUiw4QXP+mo=;
 b=l8IqPnAHBoGyrPStWtjGOKJCFzAf7Jfbf47EhQDDufV06UB4x+Z8bgaPmkzRKzyh8RwFWys0MePQlVxvm8ouD7L8iZo7sLCpdnxVRM78spkFwIEYF5+5oSdhgBBhkI2IArP+a9m8VVkaPITuwyUvQW34Bliy1LwanVcfL3T5bt16ZGgh8gbfjiISbwgVQfbrJ670xu/sbRYX6ypRWdokXPs2KimCqpwrx8VEslalscvFfIPy/S7TQqNxDqvlNF1yTk63kulQGGmKsCI9sUm4OXhOlE6wkaWfpvo8+dS2rBlJNfogB1SIDxRcSx0e1nBitkO9n+x6DVFHfWN3QL0fEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7t2JAKBm9yJYuYo804pt8F1unb8nvaOsUiw4QXP+mo=;
 b=aTQ6AoVSy4+xQIJ3+ivsQ9NjpZEJfOAgXI+8X+vbN6h+yLpygZCweTrXVtXQ6OvutHYMWM+XGiJYKFP8w0IbY7cLlihPaG5dMZlUzlYRRQPFGaDlcQqrRdOYoYuV2OQ/dg/ASyAnZsR/VVuni2mydlo6sVBSXVMy/yU/kkcJAYmwI4LSIrDY+XfueIhIaFvBI8fNvdifUvVInkuo3X677FxoQFEweqP9nCe4voEP7aeysVaLs7O0iAT3hTD5ZIiR71Ae7Jg1J424QdD1374wdL6cnA8jgTuMYVkcNSinxRrJXN+Kh4hVtFztWLQIl5QHaCYrbnDtL0763/PsLG70Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e13d1ea-c242-46ac-c692-8f2237d2a23a@suse.com>
Date: Thu, 19 Oct 2023 11:19:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 06/29] xen/asm-generic: introduce stub header
 grant_table.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <f3efdfc93780b62be93fecec68860e12026fe66c.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f3efdfc93780b62be93fecec68860e12026fe66c.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: df91f639-8985-472b-2d0e-08dbd0848d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycp7RhjhurywhKqNBXdsyfYc87q00AlXHZn4+wDxf2UvX5LBzG12EwskSucbSfAqv6UCi4EG+G50lxwA6+/8I+0lKoTmaxYFQgT4uY1iCULpy0Kqj7Spf2IVY9wY/+boTGALOQsyC7etfme2TtbtEGOxxa+NHUFXjFikFUG7qfB8J0p750n/VGLGauAE4fOOp1J0zMz5GQeR0EP15I96Pypd0o/d6qmlNyAVPpByX7mz/MWJjiuemEKrW2iqIU3SWbSkTDYg8DPmeiTfshLkMo6kW2yVOQGC3biufGEd32b5JUzRWP3yhnTz3o8+5XuvRPaOu1VZRv6OvBmlA4vJ0VTXprzrcWgdQPe4vXikm7AWj/ml6UWbyy0mfZXgzdXCK98hWQXXD8E+hJ/UIGC4dqiVqIvo6S70ivek6n7NodXibZZCFb5Taq9KoGyQWc7UDcuo4cIsWXDIAm0CEYHYa8rHDOvCETAZewupL4yVt4tQpdQrRMTi6gG3Ki6n3MLXgoYlbbjx89224admO2jfl8yjvys2PjU98XRJGjJYDQM8GNRAoa5LFp31mb39m9DTUYKciN13kWQZtKN7zGETrLPscnxO8IIKIMgXmwok0wDBtag5mR9UpYLzqhkwdLhdadh7P9MH7+kFzUPP6Rt1YFyNO25Iidjext0XDMQ9U1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31696002)(86362001)(36756003)(41300700001)(66556008)(66476007)(54906003)(66946007)(6916009)(6486002)(38100700002)(31686004)(316002)(6512007)(5660300002)(53546011)(26005)(2616005)(4744005)(478600001)(8936002)(8676002)(6506007)(2906002)(4326008)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWc3eGxBblpiekk3V2kvOTN6UDJEQXgrZVkxR0RadEV1Z0FUQ1p1QStFamgz?=
 =?utf-8?B?TlJkUEZKU1UvTjdzNDlaTXJsRlVoTExFbHN2alp5WDJSRHJmdFcrK2hRd0pr?=
 =?utf-8?B?aHRhL3QrcmVaV2s1bXlRa2NhS0l3SWRlT09BRVJjT2pWeUhWeXR3VXFmZzhQ?=
 =?utf-8?B?VFNkODZKRi9VVGwzWER6TU83ZnhmYnEzdSs5YXN1STFBeG5PR3RhVmFLdnRK?=
 =?utf-8?B?SEovUVZvdHl1aXRXTXkrZng1OTdCQjJ6WDNBVUtnekFvNm1sVGQxaW5Fb01i?=
 =?utf-8?B?ejIvbEZpSkdXTi9WOVZvWG9KbTNRU1N0R09ERk95ZWw4YklzcnFncmR6ZnZv?=
 =?utf-8?B?dVZhQ2FqblFzSm01M00yWlNwaUF3eUxNOFBpc0pzcFVnNWpDdkFycVNmU2ZZ?=
 =?utf-8?B?QUszcTFWT054Q2l4cEVqdkorUWdoaVdLN25FT0JQdjFqQXUwdjV3SXNXSTB3?=
 =?utf-8?B?MmVBdzdJZUZRcENsdFpHQU56UjhUWEFpQjFYalUvejVJV2c5allDQUVJMEMx?=
 =?utf-8?B?ZUFMeWJhbUwvYWpCangySklZMGtyYTJURXBlbmVLNU9KRi9abWtxTW1kYlhW?=
 =?utf-8?B?b3YyVFdteHRSdVRQS2VBTEorUTJiSzlHTWVOcmhWK1N4YlA4UnNkVGs2aFRh?=
 =?utf-8?B?Z1F5dFk4TEVkQXBrdVIxUGUyTzFqVENwUUpnZ3dOZjFlWlovVHYxd0ZPUEw5?=
 =?utf-8?B?SXJDZjUxVy8wM0hoVnRCTXdZWUlZbXpEQlJ5bDNSK2I0akk4K1NOWFhEeERC?=
 =?utf-8?B?anRvT2crWXZwNzl6ZFh3RDR6Ykd5SG94YXlYVERSQnBiUjlRdER3U2tFY3Ew?=
 =?utf-8?B?aTlQdCtkNnNHNncwQjQ1dVZOZHZBNTlrclJPWUN4bzArc3V3RmpDR2JBSEhI?=
 =?utf-8?B?cXo0RHRoQURmbEtsQVBJRkhGS3R6ZU41Y3BrczNXL0l3cUF2SUxuZldhQ3gz?=
 =?utf-8?B?SkhabTkvNHVNRmhNRGFlcEZqMXU2RHplc0xFSmtPUnBZZmlyd0UwTzFwVzlZ?=
 =?utf-8?B?c2NqM3dqenhJRzJDbkt0ZlU0VS9KcWJ5SkhqR1dPREcxVkdGQXN0K0lLakkv?=
 =?utf-8?B?U0VpQjhnVVlIMlRXNFpkOStmWThiTVpGc3dnQVVMdVFRWG1xSHZoWWxYUkNv?=
 =?utf-8?B?TGwzN0txNjdlV2xwYmF6N09PWE1NVGtJVnhiQkJVSk9rY3RDYjA2UFhzTkFK?=
 =?utf-8?B?SVQwVGUvaTRaUUJySmkyaG9ZbERjdEpiRFVxUWo5ZkRtbGl0cXFTWGVkd1BU?=
 =?utf-8?B?TitYQjJESXpvOFpKa0pqRFdEUmJXeVlrdWRPR3I3QzBneGdSMjU1QU1jUEtM?=
 =?utf-8?B?YlVMYUVXL1NNbUtNVnhqNVMrd2piK0tlNElsTlJiY1R1V29DZmprd3M5SjNs?=
 =?utf-8?B?eVJTUkpVN0NNb0ViY1Z5aVE4RmF6aEthbE55cDl5N1NmTnNzUW8vaGRPZTFq?=
 =?utf-8?B?Q2JiY3lLbkRNL3lTS1huaTNQb2NjYkNpYUJoOU1mYWpSVEM4MHFKc3Nlek00?=
 =?utf-8?B?UHpJK0N5Y2R4VTV3QVV1ZnpQcUhzdnZRSzI0Y2JUWFYxWWxhOUw1TDVxeENX?=
 =?utf-8?B?QVNSbDZOSmFHKzFDdU9yQlFsY0xVWHlvOHhFQ3pGK0xrKzd2aGFmQ1M3Y25p?=
 =?utf-8?B?SHhDZG9tVU5jNXZjSnBoMyswWjVuZitZQk5Zc2JFZitTY2t1UCthSmFKSTEr?=
 =?utf-8?B?VERFUHhXaXBRdG9aMGoxdnNMQ3lNdGN5dXlNcjBzUFZIZC9uUjlCTDFIL0J5?=
 =?utf-8?B?VHAreTBlZkR5ODI3a1RKMWx0WTY4VkNXdHFoYXpJc2pseXpOV1k2RXpWNW4z?=
 =?utf-8?B?TERmbldJSnA2N2dkVjNSRE1HZ0dzM3NuUWFCSVNzanVxVG9TdkRuVGZTbVUx?=
 =?utf-8?B?N0QydHVwZFFpaVBuWk9udERIbVpzQnRXUWNoRXA0ZDFoMFU0bjQxUGV4MFlk?=
 =?utf-8?B?TVJXdFN1TllROUtyZmFva0REcFpMdUNhRnp0bHVPY2pQMnk3SHJzYjkvNUxP?=
 =?utf-8?B?a0llMHVacWd1N09zYitHbGU4TXNLNTh5TEVIVGVMczhkRlZiNHhwUnR1ZFVS?=
 =?utf-8?B?Ri9tdno0NEw5SmRIMVZKK3Q2UmRtSStXems4RXhSL1RyQ0QzN3dZQ3g1SzJE?=
 =?utf-8?Q?17rapJ5t2c0yiPvBiGNgNMj3a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df91f639-8985-472b-2d0e-08dbd0848d9b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:19:53.4980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFvVGv3KX1zrBEGAZ29a7RH/RsX5m/nESqAdvTcAUUlaL2YDV8oAhmoYKAaFHNPDHHlXAyQVl0RUi2U/cD+ynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/grant_table.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_GRANTTABLE_H__
> +#define __ASM_GENERIC_GRANTTABLE_H__
> +
> +#endif /* __ASM_GENERIC_GRANTTABLE_H__ */

This isn't going to work with CONFIG_GRANT_TABLE=y, is it?

Jan


