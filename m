Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C92F79356D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 08:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596245.930057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdmBJ-0007PJ-37; Wed, 06 Sep 2023 06:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596245.930057; Wed, 06 Sep 2023 06:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdmBI-0007MV-WA; Wed, 06 Sep 2023 06:38:29 +0000
Received: by outflank-mailman (input) for mailman id 596245;
 Wed, 06 Sep 2023 06:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SxG1=EW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdmBH-0007MP-Cw
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 06:38:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbb32dcd-4c7f-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 08:38:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 06:37:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 06:37:57 +0000
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
X-Inumbo-ID: fbb32dcd-4c7f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1CacfBx0rm/PsOSapGz7b/f2np0jV8yQUojq3eqjHxcKb9ztIAnEdQ3Y97CLnmpo7eAmxnlxg6gdBNDSGKxo7hPN146J2ijHWgdF5rWK87f5MNvdw3ta94MD2wsuKZr26f6B0Vay77MXZi8za9Fsyn4vKiZ6x4JDaEB0n1sUUe5sGiHQAP4EyLqy08fYM9P9Bjp99LIfD+96Roqe5SkAQ3S3aaqlDS+ChkpSe5B+0EN3aX4RTKrXY3qEnM/zJVntOruGtBj3zxu0Qzem1egRh4l7eACQ2nXdtx3IC6iUI2XQX7xo3Lh9Mj3Pj4Pr4YGlo2G3nvjgk+QhWdcwdADxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIhasFUZms2bFJw4LIJ8tQhTJ7afVzol7nBkEOLIXuI=;
 b=WZqw3bGVQ7gfiBahBiO9OnwV/fCE8WnS2tZu/FZ2mThFm2506wcV4BF/XVQriIJTTa2j010Idympc5VXQRNtdd+OmDx06zxiI1wUE4ir81PzixaFP07155gBFhWVaLNshioLsmXL0v/tk4dcjb1C+XII81+b8jC9XbRWvvqhlMYybIemgxAQYE6vXq8v3a4ynvwMFE2H816X4QTbxg1iNLhhm/DVqXdcE/TQGISctFqwnvkbUh1DfrmUbO+2CtCr7CPvFQVpA07GpmqpXw9E5rQAVSoN7uiuGG+Gd4V7eue0FlgZS+zdPmoLUi8YWSzg0ZOtii0T97wKc+ajWhzDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIhasFUZms2bFJw4LIJ8tQhTJ7afVzol7nBkEOLIXuI=;
 b=z1mhOwegEFeAZG2GPZ0HKbqohhbQkYxg67cECpYytEGxGcbr1bXUeJC4A0Pup0RL5P7NsPgrPPdHNOn1nyEJ8CEstrxGS+HWu02khrghB46QUCJNzgUJ1fNTFgzg/VTEgriJpHl3eII8lSlU7smfFifdCj13YwXIBcfp7asOWKpeWmD6fZX3EvRUdUiikD/GRkF1IegYzXoW88hF3CRtyMw5dXkUs+XyEqgGAHN5Q6HqebeIhyiwBiwU6xFJldsZ1utF6rgGRK5LMTxIRHGxCQZcJwnfKODKiGOBs7ES8qbUiSn9nTIhW21qLuDRqA/WweDGDcEXyJaDgbPWNShx5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <343c335c-2fe8-db79-1023-b6631304c670@suse.com>
Date: Wed, 6 Sep 2023 08:37:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN][PATCH v12 16/20] xen/arm: Implement device tree node
 removal functionalities
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: julien@xen.org, michal.orzel@amd.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
 <20230906011631.30310-17-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230906011631.30310-17-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: cdec78a5-f781-4460-252b-08dbaea3ce95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GmP/izdX3bXJNqNJlg7L3hg7Wr3OPhm3z9W0iG/9/PcQ6oLKy7h055Zw5Z/zqyDQCxdhiPvjAwDh86zwe5qPoKKGbjBCpgE12fTmGbhcdgfdHA0986qwBTtu/E7sKLODdmsRCuSpmz0bgBN3UpLf6SO+RXq4qulbVmmysgvDTr4UDgJelGwzNMYQFjWUhpOYAzDxpkIr2M74FVIORQuNqbdvnWFNcMDbIiZElzgZ2jpCbiFYZQq5XpQhr0l87BMM1c2XLY/F5GqFawBbeo+NRv77uzbwZmXnF2rPxvdyh5wl8M1Fmkb+n+0mW0Fj1h6kINYTZ+Mxufxuva+KJzgS0eOSUdJ3roaDkBrG0xQ23t6z9mGlXZ3E8R4Gl0tD3pQn+aHuvUsD4OUqXTImeHJB9OZpUbNlEIcralUXwLe/2Big6UrU0a/3NXE78FKjKo+IZlR9U7y6vA/y8OcX1yFdZMvwrpogJPv8jo4kYm08URai3GEk7oBr5569wcz2ilyY+7KliCXSj0dXtntPpI61YvHBQ25lJLdPJDqXxiI6+xMeJwI1OLcrYJQLMcRRbRz0YiJgUpJCF+D1f1MHo//ZBH9/XdPv/CTL2x3vkcYupaajtx9q1dUMa1eULMMl3/SF5aAndEA4FZgaDUY7TFI7dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(31686004)(53546011)(6666004)(6486002)(6506007)(36756003)(38100700002)(31696002)(86362001)(2616005)(478600001)(2906002)(26005)(6512007)(83380400001)(41300700001)(8936002)(8676002)(5660300002)(4326008)(7416002)(316002)(6916009)(66476007)(66946007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHV1Wlo5QmIvZEtaZ1BZRW5NQm9pYm5YT1JDTktQajhhQnBPdlpXR3FwTWdU?=
 =?utf-8?B?TTR0alQ3dXdiMzc2U291N0xsUzRhQklrVXFYL2kvZmFwVXRSeTlRRUVDV085?=
 =?utf-8?B?cjVicFNtV2tBLzNXSjNaWVNpSk1oeEJZRklNaUlmelZqK1JaQWt0NUZCbXcv?=
 =?utf-8?B?MXloSjBwWi9XaWtMbXdXcUYxdnpvdURYcVB0QmtOWEZZb25BYTFyOEx4UGRJ?=
 =?utf-8?B?aEtOanZySUJpQnhGNHZ0MGM3ZG5vSWhOTkp3Qit2T0FseXcyTFB2NlBMU2ty?=
 =?utf-8?B?NHN1RmIyQXhiWTIzL1hielhPcG1YWXlQelJ2alJ6a2wwWUlkaG4wQTY0SVVQ?=
 =?utf-8?B?MFRHOW9xYlVzVnJuU21yZ3lpYk0vSmRxQnkxdk9SVHNuUW53clF5dTFOUUhn?=
 =?utf-8?B?NHR6QVB4VGNFTWM1V3hiTENReHplc2E5SnB0R3ZGRTBGWkYvc1dCQ0NYM1RN?=
 =?utf-8?B?eW1PUEdmaW5oTFZFOURXNWZRdk53VWhoN2lCVUdTRWdPeUZ6UUlLMThEOXNH?=
 =?utf-8?B?d3lqd1dMWWRmejUzZHZ5VGZuSVFJcFpPcGxucTJkNXRCdDdPVDV4WXkvMEFt?=
 =?utf-8?B?Y2RGNCtsWUVKNUx3WGhvcFlxZ1hnVElINS9lVkh4MWZrdzk2UkNLU3BWdkJB?=
 =?utf-8?B?TGFoN1JEemh5SFpraEdsZi9hbVJPbmVBNWlWNWYwaEpQSUtYQVZmTXZBd2hv?=
 =?utf-8?B?NEtZalE4bk5xa3QxajBhU1NJWTEzUzVncWtCNUw3NnhKejYyQnkwS2tFZHpE?=
 =?utf-8?B?TThsdUZDUlQ2TS80SzlNc0ZNbGNIK2JOVXAxTXFKejNYbzRtcHpIRUh3aXEy?=
 =?utf-8?B?S3B3RHFRSzR3UXVyRzhyUGs0MTlvcTdVellUQWZkNnV4QTV0dEtJbm9rQ0k0?=
 =?utf-8?B?Mi96RkN6dVpPMEgvb1ZiTks0WWNXckEwcTdtbjNJZUo4bHVPSjlYM09HNnk4?=
 =?utf-8?B?UDFzb0ZCUWp0OG5vQjRDR2VNQXZGZ0QyOUwwK2EzN1VhbDllRHV1Q0luRTJ5?=
 =?utf-8?B?aGtJVFJ2czZ4eHN5RVVnWmpMMHE4WmQ3K2tQbldxTkhQQjRkVndjZThxNllw?=
 =?utf-8?B?WEtiM0FZTVUyaGZxeWJ5Ym1yVk5pRXpSa3FXSlUyUVNSU1pzbGdmbXZoRzFS?=
 =?utf-8?B?NXJ3L01aMk81dEVxUlRsZktRVGNmZjd4NnRDVm1YU3Npc2lUdmRudEF5bGly?=
 =?utf-8?B?UVRCYUlrME13dVRyY0ZyR2NMV2F6bW0xeUJWdGhxTXBFYVRGMTRJSHkxdy9F?=
 =?utf-8?B?RHpXemw3dDVlZHJxUjVodUc1VXZHeGxnMWYvcStmTytIU0FrY1IyYXk2QUY1?=
 =?utf-8?B?NHN5RUxkRW1KTVdqaG0xQ3d4akZUYjlTTUtlQUFmSG9pSU1DUnpqRFNhTk1I?=
 =?utf-8?B?dFdlZTVuYXpHOUFWc2VTOGRQWnJQa3pvU3UrN3NpZWxoa3F0RU0vRjliQXVq?=
 =?utf-8?B?YmpaYTJNNHM0dys0OFdubDE2VXNyQkh5RStYYWNwTHJ2L1NzL0RPT0h3eVF5?=
 =?utf-8?B?MEJXVFBlcUxjUlpldU0vTDRDYkxuQ2Q2aWJreDUwY3lhTDJpYldXSHBtKzN2?=
 =?utf-8?B?VTF1WDM3RXUzOVNqeTFXSm1ZWFFkcklwZ1NkTlZQamtoRytoWHdBblJSWjUz?=
 =?utf-8?B?SFE0cFZXYzZkeEZMdlM0VXI5OUd4Z3Y1V3RqdU9JbUFOSEI3Rm1KOGZMNS9o?=
 =?utf-8?B?M3loZ2ZLOUdmc2Q1SXVBQk1yZHU1YUEyYnlENzQ3MXJ5ckZaMXVSUDlIZjZM?=
 =?utf-8?B?KzIzTVNvR3B1RFcwaWNZRm9MSng3cjBQS2NCUWYyWlRIRi9QNUx2VStWMUM3?=
 =?utf-8?B?SFh6enhTL0ZyUFlTOUxuR1BkcmlUR3hjR3poeVhHWXFmMzUwRjVOa3ZOM0wy?=
 =?utf-8?B?RjNvTzA1WU5zcmpUSExiY21jNG1FMzUvc3loMHRtb3JIdVZ2OTFHQzM1Wm84?=
 =?utf-8?B?T0d5VC9MUVc0OFVtRDVIZG9HbGQwNDI2dHFpMUtqNW9DeWVNR3JHQ2tyMHFr?=
 =?utf-8?B?cHN6dWRFN3o1VHR6VndhUGJjNDllT3BoL2w3cWJBSlFLWEdYelJVTEZveXhr?=
 =?utf-8?B?NEkrbUV4WE80dEtiRnNVejhzcHczWlVCZWVRWDg4NVIrT2Nja2hUUlhHYzhw?=
 =?utf-8?Q?jbhZgTmuDIzoW0/TTyDozU+6I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdec78a5-f781-4460-252b-08dbaea3ce95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 06:37:57.2882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEPUZBNwe8nOhZTnU8M1KVxeTIcJNNmlSt6aOovmyQ0u8tSw+xFkcYvTryIjqUqrwMOslSEoX8Ebmjl8Fz63ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

On 06.09.2023 03:16, Vikram Garhwal wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1185,6 +1185,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#if defined(__arm__) || defined (__aarch64__)

Nit (style): Please be consistent with defined().

> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +    uint8_t overlay_op;                     /* IN: Add or remove. */
> +    uint8_t pad[3];                         /* IN: Must be zero. */
> +};
> +#endif
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1215,6 +1234,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1245,6 +1265,10 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +
> +#if defined(__arm__) || defined (__aarch64__)

Same here then.

While not to be done right here, ultimately I expect we want to
have some other way of specifying whether an arch wants DT-
specific sub-ops (here or elsewhere). As per the hyperlaunch
plans aiui even x86 may gain such support ...

Jan

> +        struct xen_sysctl_dt_overlay        dt_overlay;
> +#endif
>          uint8_t                             pad[128];
>      } u;
>  };


