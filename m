Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED98077F0DF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585164.916192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWX4t-0001JL-Or; Thu, 17 Aug 2023 07:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585164.916192; Thu, 17 Aug 2023 07:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWX4t-0001GY-Lb; Thu, 17 Aug 2023 07:05:55 +0000
Received: by outflank-mailman (input) for mailman id 585164;
 Thu, 17 Aug 2023 07:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWX4s-0001GS-BI
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:05:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81174374-3ccc-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 09:05:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7998.eurprd04.prod.outlook.com (2603:10a6:102:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 07:05:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 07:05:46 +0000
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
X-Inumbo-ID: 81174374-3ccc-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUCXKIvjpYHWUXKmYJkaNSS0KbgeCAifWYXXTmYvEjxBMokSwl7/4EaG2SAvFlvdsG9b2NIuV959m2aEDxc0yKFNv0af7bFMTasPu6GKNyWRC6qNlKU7RxXdl2hX6jTcLBMfWcr9Xe8KDF+6vnGwE4NRbjWAtAU0JNKkY9Yw8kLxraVdYQqDpVrRQr69iFObLCOoIszq0EgZs+8zz5BM52xGhhEzm+uVqlfFWYGBHyXEhGe7PtiC2gB1MxlAIRKj+EwoP/msMq9dOUvt7IPADcZj4AuCS26Hn6nNrSfWs05badINP2zSuQhaMxSrdpLuISy3l+tGyqCaE1ZTT9A/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WfiQYImFNfSKDrs+lhuOJEys1uZeZoq6HHzhik/G+4=;
 b=BtEy4R3k4zRUhU7RpMZHUOUmJA5dV1KIFy/dXRE1WVePU8Cxl7tzg6nCsv795yvSBjZhVVPyfqke/Apec5lVnNRHeCdnuCqzBTllb+5icQ2OdaJnGUbjZIDUCnkKRDSHFT7om4uKwOs65iwgI9l5xSMO3mHy4FNtDUpOqUOWI1QU5ADgY7Kz8el96EWZgaqQTwMnC5gaB+3Nz//GD/U+PVEEQtCEsryDm8tpAad9gosDpJ58o2JSHMd9Hs4szo8pQhiHib/WoE1Aygv1LUemjvtIBfy06SGlf+RsjdtHnpilvVy8sKS1Nuz5StNiC48tyP6LRlt80ZbC/Witi7l8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WfiQYImFNfSKDrs+lhuOJEys1uZeZoq6HHzhik/G+4=;
 b=k2S4YYJwWP4TJP2xCpfYk4eXryp+3/pgKLqnm+7DDkyUbo4D5xTBYvkAILOm6tV7ZJ2bA8vpKEOuov5EXcpZkyam3RvBasnfb4idrLCDne+Vsm+x0EV8RIMdu2Px3yq+/nLdYtA7AEoECzbadW99hJXUlyp5MXIBdUb1TTY/2LfkKxXIWRReIIyo2vekjQlN+CiFKw1TfW3PaqAbTms0IZeqBGAk4XKHXSsGR3PYRO7qW1ctYi5Ndwf8sxdFs/Tm+NSy4c8HSw5YBKEn8EyE+T+w1o1x2iQMPn+YVhPGl8gSrrgdaMAe+GWxC+wm67H6fyCLNxYkAmBOD23plJH0dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4905ac18-85ba-40c1-4542-7355cecafdf4@suse.com>
Date: Thu, 17 Aug 2023 09:05:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v8 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-10-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230817003947.3849-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6557d95e-31df-4914-cdee-08db9ef0610f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qjqmfc7aomsD57c7vrt1wwxK/CemCus8BT0tmWJeu7aJ++nxF/LkQtWMlcIcSkHy8KZxKOzQ+zASO9lEZKu3ysQQsQiRidTo3TP6cJjC8WAhxCg5w07QELnCwpy8j011wJX8K9ULbvovK7RTQPSSq3UQG+6mBhRtAG8A92oKDBUmfNoczXVybD4gxWhfnyMbakpWXS9RWdNTW2sS4j1rQo5t0CESaTE2ZX05oufGmQsv842MfXSH7l2xrp1eWtHjFYon85Yc0rnuAQDTkdymKAFIGnI5nl81BTz9JnOya6x9o6bctBE/VKcsDbSnGIZ2gomQqwB1WOe3z0L9fOpDermrH1+5wWB2NKMbry8+k3s4Gr37jnqc3L24d+sIwiwSbAE9Zr/qQob3wEtgkrPZd+fLUaY94h74xNz1/YNuBBe9+zlC5fP5JQVptHEAHBUF5ppL5721xznFulM1Dy/futLwz+iWVoPXMjeBvuCzAkkF78HixgXpUD8ecaTem3IvKagfE/1t0zyIKNlkr2RRau8zPXQzNUqNKlhPyCxDoUcd2ADDb54vKOlSffTJwqo5hUpK3vi/BZX1rCyDLrNkCzNwa0JiDSeI4YU0eMhcYrDYmqFKNiygprF23gfHVl2Kx6IAwWmnWha1qSLa7l7fAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(1800799009)(451199024)(186009)(6512007)(53546011)(6506007)(6486002)(83380400001)(26005)(86362001)(38100700002)(36756003)(31696002)(2616005)(316002)(6916009)(2906002)(41300700001)(478600001)(66556008)(66946007)(54906003)(66476007)(5660300002)(8936002)(8676002)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0VJSFVBVWVRa09KSkRlQm1PRURRTm1EcTZJSVFhamFrRHlHMVNNN2o2Sk02?=
 =?utf-8?B?K2ZqMm5qZWI3K2I0bW9nN3NTemI1dC8wbVlwM05KendPdi8zSmNTL2E5SmtG?=
 =?utf-8?B?ZHJoM2lEMTM5VkE3SW05dzk4WkY4SERwN0dEQlNsZUwvWDNxRk0xc3dtTE1a?=
 =?utf-8?B?N2NYZXREWlBMS0swRjJEelllSlZud01zcTVqNlZFYWt0WXZvN2JmZEY1MWVa?=
 =?utf-8?B?c3Z6TDhYY0FhUTBSWVhGckk1Qm9LeGpYUDNkZXlIRXJwQVBUeGRaaHJsY0lV?=
 =?utf-8?B?RWE3ZC9kMEc2dFhQdFhVWHVYZzFRbkI4QXZwK3VzUjBXWjRObGFPNGNRMjFu?=
 =?utf-8?B?aVBtOXl1dXoyODh0dFQ5U2pUMTN5d3BMVUNvNVp6d0xXeldDd1h4N0lyZmlH?=
 =?utf-8?B?by9JcWhDSEpqUnNlTUpYWHh5V0FZUkFNNW92aGJLV2FaTnRoQUF0czk0Uzlk?=
 =?utf-8?B?YVM3ZnNtTFdhWm0zZXVaVGYzd1BkaXhrRWhrd0ZZM3lLZ3dHeWJJME1mczZR?=
 =?utf-8?B?cTRlaGVYTENTdmxZSWlHelBMeVYyRjRuUTYrMXFSNkFyem5TZnFxdlpvRm50?=
 =?utf-8?B?clFndW1kUTFvRG5PVHlnNm9tazhLaE1tM0ZMeGVXQkVUWTVEQWMxMmtKOXQ5?=
 =?utf-8?B?cUE3Qk5raGtDd0FENnpIeGJGSyt6MFd6SHFQY29Jbk5BMmp0bThBUlRLY3NP?=
 =?utf-8?B?eUliUlk2dkJEOEVXcjIwdUVLL1dJQi9RQmVUUW1qTENXREVBTUlsWCtncmxR?=
 =?utf-8?B?UFJpb1VPVFdMQkJjZ05iTHY1K3lXbDFmdmdJbzJFOFArK0xwdDF4MGpZaUhH?=
 =?utf-8?B?YzBsQjczN01Yakc3KzgvRjFTNUE1V1RBSWN5YVN0L1hZMUUyN0NxUldydm1L?=
 =?utf-8?B?MG1vOGNJTWNXVGZTYkJPTFp0WkpQeElmd1BwWUpwcy9oYUE0K2NJQzZZSk9K?=
 =?utf-8?B?bzRUOFpCZ2RFMngxblhnd1pLZHczVTZVazJCb3NlL1NXVTlKdDhwNG5COU1X?=
 =?utf-8?B?RFd2VDN2N0NaZjZzZlhkR1JLT1k3Rld5S2JxRnMvNWVvR2pUK1NTWUZYejNT?=
 =?utf-8?B?Y2E2OW1RaHdXYnZvY1B2M3NtVFVuaXZid2pVNHArV2ZFSVovTy85R1NjcFF3?=
 =?utf-8?B?ZmNmSXArb2tLZGovWXdvSnFKSTR4UEJCR1M5THNYZ3FYVUdqSnVrOEtGaWJ2?=
 =?utf-8?B?eXNYYm5zbzZ1bXU4bUh1MG5DaWhkQmVNcUdOWFpIZVVHSzE2cFA5SUlHamQ5?=
 =?utf-8?B?Nkt3NVVMWG10eTA5V21JNVZ3Q2ZMbk1JclR2a2xPN1hjUDRLenU1b29Idm9o?=
 =?utf-8?B?Nmd1ZmdYK2VneGtJLzdKdFRWSzRlMGZHeGZybTBMc00rY1FIcXVKWDd5YTVj?=
 =?utf-8?B?VkM5Tm0wclZBalBxYjhMTWpSeGxQVk9RT21EZWprbXVrQnRmZHd5UEpVR0ph?=
 =?utf-8?B?Q2s2Wm5hWFVrWkkzUkwxWXh4bWgwN3RDVWsxc0dtY09Db1NiMWFsakNTeVVj?=
 =?utf-8?B?R0RNYmlzR1VBblFrdHpLWDNlSnhESDdVME52RFNOYTIrVi95ZDJiRG1GWW11?=
 =?utf-8?B?MFhZWno3WTVmUmhlSUFBVXdIdGxwYTBPeDJOMjZMbEpxVk9mbkpEL0hCeGF3?=
 =?utf-8?B?dVdRWHkvUHRJL2ZlSm5ac3k5dGVZdFRTNWRjNi92N05kVWR0ZHJWSWNwRVJI?=
 =?utf-8?B?ZldlRTZiUnVaMkh0U1VDNGdJZmdMbmJsL3JXNENVR1d5RkorSWFvUm94Q0M1?=
 =?utf-8?B?LzRXNUZ2OTBHNzN4QWtLazZ5bWRGekpieWpGWFhoWmZOVFFuK2R2bG1GbkVR?=
 =?utf-8?B?KytCUXMyOXlYbDM0MklGV2h6WFNPQ3d4dTBuY1Y2QnhENDQzWGVtTmdyYkNS?=
 =?utf-8?B?SzB4N2h4Y3R6QkhCL3AvOFBDNFliZ2Fud0djOVp3bUtGWmVMbUpjUHd4Z1oz?=
 =?utf-8?B?Nmkrd3d3MWdTTEVBN28yZWxoYkN1UitxMmkvV3h3Z2lQZ2w0MHE0NW9Cb0la?=
 =?utf-8?B?SDk2Y003VXVCMmlEUmRyS1VVVkN0cER2K2ZCVlIvdGhjMlpDczJjRGdJcU9o?=
 =?utf-8?B?TlUvNk8wOVpjTVpzQTZJQ2VjOWRnQ1RWWFRMZ3RjVWMzSXRidUo3RFdDcWlK?=
 =?utf-8?Q?qFPHweAEDjwN88XkkHrmJkiWN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6557d95e-31df-4914-cdee-08db9ef0610f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:05:46.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx84a0wcipAi6KxgLhLZfvxq545iz/qzisY4x4OeMWvIYgsf5R4cPbrwnF0g04cFszGo3y0mY0HGsQVrVZxvBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7998

On 17.08.2023 02:39, Vikram Garhwal wrote:
> --- /dev/null
> +++ b/xen/include/xen/iommu-private.h

I don't think private headers should live in include/xen/. Judging from only
the patches I was Cc-ed on, ...

> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/iommu-private.h
> + */
> +#ifndef __XEN_IOMMU_PRIVATE_H__
> +#define __XEN_IOMMU_PRIVATE_H__
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>
> +
> +/*
> + * Checks if dt_device_node is assigned to a domain or not. This function
> + * expects to be called with dtdevs_lock acquired by caller.
> + */
> +bool_t iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev);
> +#endif

... I don't even see the need for the declaration, as the function is used
only from the file also defining it. But of course if there is a use
elsewhere (in Arm-only code, as is suggested by the description here), then
the header (under a suitable name) wants to live under drivers/passthrough/
(and of course be included only from anywhere in that sub-tree).

Jan

