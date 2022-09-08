Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FF5B16CF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402823.644709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCo1-00046K-GI; Thu, 08 Sep 2022 08:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402823.644709; Thu, 08 Sep 2022 08:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWCo1-00043E-Cd; Thu, 08 Sep 2022 08:22:37 +0000
Received: by outflank-mailman (input) for mailman id 402823;
 Thu, 08 Sep 2022 08:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWCo0-000438-7s
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 08:22:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646fefdf-2f4f-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 10:22:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Thu, 8 Sep
 2022 08:22:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 08:22:32 +0000
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
X-Inumbo-ID: 646fefdf-2f4f-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoMVlMx2VsAlGRlxMThUroN+gjeK1wjSWv0v39I4JzzrGXqUu5bG4ChZ3gdARBpPGN09uGIPiqbc0JOCLmQI0O2R/C2fdH77xDAofpTAT+E5LOHwDJOX5ca/WBYn9KPvTJtECWPbjS0o/D9M3FhG6gSIfm07TFPMn4zrvTmRfrbhKBs9WRx9P6exX3zR0Xjbys9hctQmG7Sitq3+XMCXZrNuOzixe9qRhiALiZWPrZCI/BDqtSl6NAP9KTlyIGDhtp6OweWQNqq/FbUbMsWWo4Fm5XJeBihLbmf1WolxQ9V/Uh3w/iuaCH15Sk8MuC7nPxSrD3T/GNOkwGj8YLIpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzFCySBau2bZmE8334JJ6H6sO2BpIfwAdZZj1ByL3VM=;
 b=lVHxqqYwrj6la17S9gd2ccgHfBrTen05r0dq+7boGfWwBvR3sT0rTKcOD08dk+v3q2P/AZd3lL3jSv5R4OL261IgAx6itnr9idb2dcdVrTh9hr8Jrl3n9DyBAaVXzSyVSvaFgWswaLh6xAxYwCLWOpQfy1OuUp3fbxb7GGY9LnAbX/Wic38xoWrhOkdeJcyfugRhQ0Vs/RwXVLV94ivsiDm04J5BKXeeLIwDr519hQW8L4MxPda76mwvXx52xfsC4C8qEiuC0OCpw4OJR3YgFhZc6EBMYAQWKd/WTCzcja3yqqpr3Gi4uQGs1yD7FtOSdYzJDJ7zpNMZHsSjvE4Ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzFCySBau2bZmE8334JJ6H6sO2BpIfwAdZZj1ByL3VM=;
 b=4EfoLVLBpuEh508hxIETGhVRe932ihmpGPqiZwQExM0HnsHRByHwNiXFtuF54A8TujRimjb5kSeUExxqOxCdgFwH3tSxmBPFwxVAcR42j41rgnCsg6hOw1r+w7B6O9nE5/T8l51I03V34kiCEQzS0DtVf8ZYHTrgA+zBOELJlLgcDAHFqfUsTt2G+h22StZKQwO99TeUeMtbcNcZOI/TgqAssPMyLhjaVxbOiVhWo0RMTq3IQhQhXDz3/NGEYZznr8MKqF9sPJhU42dFlH0KYKzuIgZyI3uqOFbAZu05DTLRdMYHAL9Jzd4fzChUpmdJy74BLVYANUQ4Dcc2uP7wXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6bba8b70-c4a8-92e9-58f2-1a8c3288ae85@suse.com>
Date: Thu, 8 Sep 2022 10:22:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 1/6] xen/x86: Provide helpers for common code to access
 acpi_numa
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220902033121.540328-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: de0d97a3-40e9-422c-7028-08da91734662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kq5Btx84FefCyN07JRUrCkN6PuVH9TKxRqGDIBCVbXM6Rh4RNq7pBuZMub6I1Mb5CC7qE2uQLDuqRud4CD84HyYsH15GSwta9UiAuZMd0jKc/Cn6Tl41wLEm+KiWZ95NRKr9TldtrdM67Af8PP2TXpSref7oTjI4aKSgBmzdmsmpEWBYPOPSRDSTuhCZpyOcMD7+oM2nmS5hjNentgdpmzeiSm0q5HEGud50riFppJ0xMAsuR/JxDCC8NbzVeMOPK5cTY2ukS0Fu3ebilcdcTmkb/gfzrAxamhgzwv1WgUE4tetQbRf60MRR6fDnmYJghL3nCtdhABt/2kA5O//CPuj00uTfvortDxGC3q2QSeQB4/P85yfcaKwXL/ex20ga9er7feisE+AyAXvFT/1iGrJmrrda/U5UaeJ3xEoMkBNXuON2x6TRMrGw8PwnvJCvIlbtqk6ouQ4ebZe+kmd29gqYtQTEkAsuyJcIKPy64XCr8z5xcQ4vBma2TQRqnxbcNX3g/mDqQuUy5yew2Lplydx0ergI6lbJyWC31IOsU0PxuIEACMNVBD+GXF5YrnirP1aQ9lPCfWybg+yZaprmigCMDmqvphJb3YAYTrD8KizQGxcUTaTucliWAtkOFtk8kZXrsYSUUjwI1ahKW2zYHUn5D6+kzF1qHS3L5AbhIdi/xQ0OKT7QGMfanMBQs9r+mvyKlrgvpNGa5Hag89OmLsIItM7HWkyaSUjA63IDL1H6K7oe9eMbcx8LpJWSaC7oL6KDNgOWxmASEq6rzTEZtk3n94h/wXXGknDQGJQpmFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(136003)(396003)(346002)(83380400001)(186003)(2616005)(41300700001)(6486002)(478600001)(86362001)(6666004)(6512007)(31696002)(26005)(53546011)(38100700002)(6506007)(316002)(54906003)(6916009)(8936002)(2906002)(31686004)(4326008)(8676002)(66556008)(66476007)(36756003)(66946007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHN2cHFlSTRxMW53Mzd4V2d6SnRhQ2VxNXFYc21nWHVhTmNMdzNnUzBpTzl4?=
 =?utf-8?B?V1ZZbFMwOWRWNlRhckhlbE5pYk5zdC9xSG4yN1pRcnJJSTFpQndjdDhiR0Jt?=
 =?utf-8?B?SGN0VndINUQ2UjRsa2V6MU4zK3JzUXhvUjdmcUR0QmhEbmZXZDVWV0QzcHlJ?=
 =?utf-8?B?bGgrYnBiOE5oVFMxQnNCNFNEUzZUUFpwRW1yZEMwZHpoRUxWenh1Zm1yZGQv?=
 =?utf-8?B?bUNEbDVoaWQ2akZmeGR0UVB1L2VyYi9HRVhZbVdyTEJRT0JpdnFUZHFsN2xZ?=
 =?utf-8?B?MVRDd1NtbkU4ZzdCYW9uQ0k2M2NsNGxVdDBiL2FUUTFzdkpQUkY5djkzMkxE?=
 =?utf-8?B?NVdUZG5OYlQyTFpJbGFITEkxQkZqWHE3a3k2N09aQkEyNzNydXRnOStHWlkz?=
 =?utf-8?B?VC9TTGZyNVNDejd6SjAyOWRmOGVPNldkUXVkVTFqcS9TbzdxanhnMjdudmta?=
 =?utf-8?B?TGMwNzk2Tm4wQmJ2cEYwZzlmTW5kTHRiNXVtdHNkMzkrWlVHa3JHTjhWTFpT?=
 =?utf-8?B?bWNBY0JHM00rZjJBQ1NzbDNSYjhWS1pSczQ2WVhKODBaWTdUUklaLzlSSEh1?=
 =?utf-8?B?QnRENXVWV3FTWVI2K1Y1WEZEajJqRWtnNFcvUkszTUdMNnJpVkZEK1poeXRE?=
 =?utf-8?B?M2pjd2daSkV5L3oyV1BzMnVtc21MWGtRandabU0xWlRhK2d3Rzk5bTJsTDM4?=
 =?utf-8?B?dU5PRWFIb3VZZEJKN3R3MjlHZUdxRVA2OWl5TWl5NkdqK1IrRWpWMDRwaU1i?=
 =?utf-8?B?QmJoYWxWU2R1V0p0UGF1dTFsTmhWOHBTRWl2OVhEU3ZPUG1TUkdZZ3RVZ2RS?=
 =?utf-8?B?K2JmSURzOVpmWXJFUFI1ZjJDOFRHeWdTeVZKQk9zWFhzNW5POVNQRi9GeTBD?=
 =?utf-8?B?MWYxOFhGd2pzYmlrOXhMc29SaUJpT0w0TXYrQlJwRVFtM2hRNUVTenY2UlBj?=
 =?utf-8?B?Z3VQVDd1bEc0UXErcmFXSEFnZHA1Q3ZBOThDakpIY0NCMC9xR1gzek9DdVdU?=
 =?utf-8?B?NkExUVlFYU1uWUZ5dWI2ZFREU1NNamx5ZEtlTVFRM3dCL2RvbUhBTzFQL1E2?=
 =?utf-8?B?NEhFSUNvV3QrRW54cVhrQzhmVjV6aVpGVmtKR0FTazZ2Q3J2NGNNdnJCUnZV?=
 =?utf-8?B?YkdXT2hLSnhVa2ZBYjhWZ3V5OG1jWHZQSjBsRExSUFl1Wjk4UUNJVWhEaXEy?=
 =?utf-8?B?VEg3VE9DcGxienpUWksrYnI3SGdTcFdYdzRUZWNhS3NuQXFUWHNtWG9nYlJT?=
 =?utf-8?B?czRFME5OVldWT0NremNWZXZZamVacEttanRrTlBoQ3F0VjdsVEFSckVmTVNI?=
 =?utf-8?B?VVM2bXYvOU5nVktZMXFSWmEzNmxFdy9VbGtJUGRucXVkMFczejZOWlhabkdl?=
 =?utf-8?B?U3VHRllISVRuZkZaY1R4clBMRm9EeFhnL2h5UlM4MWdVWHVkM1d1eSs3b25h?=
 =?utf-8?B?clduS2c0aGxKakJ4a1N3SzRySmxmaE12OStyVGlVZ3NORWt2NWFGYXlxeWVw?=
 =?utf-8?B?Unp2UG9sZC8vK2RYVHJxdjZRMk54dk94aWtWUDRFNG9lc2YrTldFK1BPeGk0?=
 =?utf-8?B?ZnBOL3A1c3VoOUM5aVFZNHJwaFhWZ0dBS0Fub0hRTTRTVjljNThDc3hIVW1V?=
 =?utf-8?B?VFNGemIzeTFoR0lhSDZlYjdUUTAxOWVJbGtSaUhCTDhhbkVXSUJLK2lzSzlK?=
 =?utf-8?B?TFVLMXgweGROdFNadW4xZ1hFc1AwU0N0RFlhZXJVZXFINjdwOFV0cWlxc2Z1?=
 =?utf-8?B?YUlpdDdmSlkxWExVR2txbkFnd0xNa2laeEw4VVZyakh4T3hwcytiU3A1a0JF?=
 =?utf-8?B?UEQ4WjMxQXIxQmRGaHV5NE9MY0xTVGszRkg4Z3oyWFhwc1VQeXRYcEc1MU1v?=
 =?utf-8?B?dnNEQlpKNFJTbkJ2dG1KeDdSK1BjOGVDaFpJeTJJM0J6Y3FNMDBjalVKNWhJ?=
 =?utf-8?B?UFN3ZVJCVnNOZGVCUzdWclBZTFNzQURmV2tuVWUrWlJzL21PanRmditYd1I2?=
 =?utf-8?B?M1JDUXZQTkkrdS9HL0dIS09DcWJyMGxkcnV0ZklvTGVoc0VNelN1UnZkNERu?=
 =?utf-8?B?RkJlR0xzL0ZVOTc0Z2ZLNmhFU3FDeFRYdnN4djI0aU5MV2pQVXJPUlpJazdU?=
 =?utf-8?Q?bmMs5gFvDzAaNb/SH2oKDmcBr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0d97a3-40e9-422c-7028-08da91734662
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 08:22:32.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hx2y5kGjHgqAe4Q9Pw2vdN8XLk6+y3ECJwEQxIccZgnbdRXnmhUEMCmVc82XvU1BoxCvzzBVBUp0FGneoYoASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794

On 02.09.2022 05:31, Wei Chen wrote:
> acpi_numa is a specific NUMA switch for ACPI NUMA implementation.
> Other NUMA implementation may not need this switch. But this switch is
> not only used by ACPI code, it is also used directly in some general
> NUMA logic code. So far this hasn't caused any problem because Xen only
> has x86 implementing ACPI NUMA, but now Arm is implementing device tree
> based NUMA. Accesssing acpi_numa directly in some functions will be a
> block of reusing NUMA common code. It is also difficult for us to replace
> it with a new generic switch, because it is hard to prove that the new
> switch states can guarantee the original code will work correctly.
> 
> So in this patch, we provide two helpers for common code to update and
> get states of acpi_numa. And other new NUMA implementations just need
> to provide the same helpers for common code. In this case, the generic
> NUMA logic code can be reused by all NUMA implementations.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



