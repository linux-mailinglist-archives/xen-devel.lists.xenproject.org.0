Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAE60CB51
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 13:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429803.681038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIW1-0004wC-94; Tue, 25 Oct 2022 11:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429803.681038; Tue, 25 Oct 2022 11:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onIW1-0004tN-5x; Tue, 25 Oct 2022 11:54:41 +0000
Received: by outflank-mailman (input) for mailman id 429803;
 Tue, 25 Oct 2022 11:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1onIW0-0004tH-9T
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 11:54:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd486e45-545b-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 13:54:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8874.eurprd04.prod.outlook.com (2603:10a6:20b:409::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 11:54:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Tue, 25 Oct 2022
 11:54:36 +0000
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
X-Inumbo-ID: cd486e45-545b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWlkCCLzZaTDWRhsBbr6p7L+2Ruq6Z3yvyxy87rekHBs8ZRzScDY2/Oa3c2E9QIXdrC7NHvqeQS3JoJUT4VJ8PHo4FtAB6SlBx9wZPAzOARZDtVIeLBPOHNHY1+fkjPaZLVOFt/OQ2gwJB1RuozV0SQKvPBHGa8zRZFtiwmnjCHKp5vy+zr9QgGeKAyotWLlJBfe1HWZmgipYJX9L025G2Gw4E4QtwmfMJkKtqkHcplAy/8gLGyrMzb5/OSnDMAM1yRFYVhfjfM2VEVuqpLUYM4Vv98zcfnhLKMbCkxZBq42LGIa6joRrwVAwdRxc1F6EHVcASA06f2q3+hTcp4Xog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1nSpRZyK/9ooLIPKJLAlAHQABdqLC8qj5XnYImKwiE=;
 b=WipaMNe9ByWsbPv9KtmJV6+0v/zjfJBiEwvp38/5NTrfz3cY9zMqqnQ/D+mVwZSeF5VZVhTRNXGnWHapkiEf3vKqE0DLZaKR75l39DvVDJOWVA1KXrGSfjueKXRdVtv3ScsB/DDyNVRbtcKJLyaZHDHv+/7jBXWAKe3RP06Z63Tu/3R1VYaUmGsQfS58hSRHhVHyvacG98nWEBjsD2k7hCd3DbQu7ZNOL6liRLKpcDDNX73TkBhtcC3qfwNnclo69yh0hbQTmbp2HyQfJMp7mmcmz5vH+yT2QYDwsQ0J4U/vZEQ8QEVL2Xe20y+f0nFmCYRifgsufmZV/ogEoDiTVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1nSpRZyK/9ooLIPKJLAlAHQABdqLC8qj5XnYImKwiE=;
 b=ht6jlHfJsDCHRScVwxBkx6T6ptHP7tXfK6840jUzzueOIB787FYxUg2H7y/X1k//tbCO3v4LUJ89xZs7WcuODfXrpO2AJ6KEC2WlAD6ZT7MYj/A4/a0gopfVJfHB6PUi3PlUJPpeYjS3Gt7HYM4P27tTQO+iP8iQiVysUG0M9YGujqDrOt/eBjObf0SKEIj0z0u/gl79KgTZmbKKxqRHSDpUEde8t7UwnBuOAp+k0qDejdCeFQa1ROPuopl+f4gUdQ4xcg+SfOh3EgBhOLs8zZktp1AhtuZ8J/8Z6pItshnxOljSCIYKj+82jltWIcfku9y9/nqT8jwFAK/24RCnZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e05a04a1-3031-97eb-683a-77630bf8e6ae@suse.com>
Date: Tue, 25 Oct 2022 13:54:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [XEN PATCH for-4.17] libs/light: Fix build, fix missing
 _libxl_types_json.h
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20221025111632.36286-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221025111632.36286-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 5816b51d-8d4d-4bce-029b-08dab67fb097
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3u30b5gHDSqpYt9Hnik2MiDrUHz7woMZXeBBtfgvKivXBPuORkAFuRSTW8/XfL/G454ps+YhNJ/CFc68574Hs/hRSecqHmuSMtHkslyqyUuw3jOqJkweMWSV05MkGV4wwEbqjBAQaGngEOzM/wU2Ss31CwKBeTopYlov+DIMdy9ta9sXdG3rNjBPUna5eVhEMt9gsHdyoCsrBdzIu/++HQjCzIFaBujTC7HCsZtYKUVFOHW0nCjN2SEzeFLxjMsTz4xMmIMG8gnp+wIwhN4Kb94hOi7wsC+QPI39VCsUN9kOB9/HRSiTQASBCl+3BEke4afDozbLSkp08M0HYjp/ZOvz/HLEwoft++jtDGwo/VykkUtZUGQz99IZGyUQs93K5nD8yBEmz1V0wTfp1cTy2EnaB8BN0JRYkql44rG8Th0yYhuKbzBXPiTEbkbSGFkQfG4fruxegiN1p3RiQpYJCmZt6eCjuv5oEdrZV+GnaIoJIZSblZPezbPZ/o9BYWAGoBxlzed85F9PeniIddxswD3Rl9zFsVlzGN960vvcKXhfqE8bGsyOuAL8PaHN9+//ahF7jHpZ1lXmOz2RHz1KZOI1BXSM55fECHDMgmE1AtXOModDeH2NonrNhjfsm4w+sbeIsY1OcrpLs8c2SFRh5abzSZqZa0MYM98AG4IfBzQsclPDY+GnkyLj4grop2tYalyGPuK3XNzDF1+wV3KFB1JtUXUEAt9veuC3/TpU2xWesjzVkxA5dHUREpkrUx2bOW3AblfoHa2WH4Fy1UMdsd9FyNRKfEf6WpW178PmPwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(2616005)(5660300002)(186003)(2906002)(4744005)(316002)(26005)(54906003)(6916009)(41300700001)(8936002)(53546011)(66946007)(66556008)(66476007)(6506007)(36756003)(8676002)(4326008)(38100700002)(31696002)(86362001)(31686004)(6486002)(478600001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmp0ZnJXcWNhVmlWWTV1b0xTSGMydjdrWXRkTjltNFl5TGh5QzZ4Q3JhYVY0?=
 =?utf-8?B?bHoxSXpJdE9uczF6TzN4Z0hJOFBjSFErUnVaM21jUk90eG1aSG1EVTlTTWFu?=
 =?utf-8?B?ZWdBSEY5L2lRQjN5bkZhL3BjSjdIS1V6bS9sRHBoU3NuU0VOU1VVaWxmdnNz?=
 =?utf-8?B?b0Z2NVFhRnpFWDRibGE3b2Rka2QzMmxLeUlvcnZncFNldU5iNGpsSjU4MEJW?=
 =?utf-8?B?UTV4c0VuK2VxWFRmNmhjelF0RXFhT0J0QUJFcE1JdUY5N0xaYlpqTktlREF4?=
 =?utf-8?B?bFFSMnE4UGg2R3gxanBNK3QrTkFGbW1QSElCSkUyRjljWm9DYk5YenNDeXJI?=
 =?utf-8?B?VTFNNlBUUXE3TkZXSllJaGI4WExFUm9nOWlYWTZRR0hhbzdmL3dYV3pWSVpj?=
 =?utf-8?B?bDB6enlkYVIyVW9aZEpQY0Vza01BQ1pnOGtKTS9ORVV6Zks3cXhDYTd0YVFN?=
 =?utf-8?B?MyttWTJJWjREYU0zZWxGcnJHanEydXdadzlDYyt3Q2cwNDdlMWJlTHVKbXBH?=
 =?utf-8?B?MkRrL1VPV2lRMHBCNXRHTlJlV0Nmby9ENjdPZlMrL3R0V1F3dFpRckZYRE92?=
 =?utf-8?B?VFBTUXJQVWJQQTVtQnA4WEl4b0dRS3BadjdtNkZwcTBSYllOZ3dhNWhGeUpm?=
 =?utf-8?B?UFBPSHZTcHpFUVdsaFZhZ1RxbjdvdW50ekI3L0Q2YTR6blN1dTBaaWIwYzJP?=
 =?utf-8?B?NmR5aWY0RUkwSGdFOS9XWWloNDNBeTc5MU1ONm15U3k2NzN2UU9uUkJPM2tY?=
 =?utf-8?B?amRJemZxbGdlckJXczlZc0NDNjR2UWxteGZDbGVkNWo5ZW0yYUlreXJYOUxw?=
 =?utf-8?B?Qzc4bkV6Ry9vK2Q4OTc4ZU44WFpwS3JhZkpBZ1B0VFlZL09HOWpvbDRuUTRK?=
 =?utf-8?B?emo0ZTkzdlVoSFRRUE9CVmd5aVlrRVRIUS9ac1oxekIrUHZtVUNYZWxxMlZi?=
 =?utf-8?B?SXBhaWx0Nk93NXlkaWt2WHQ2dVdRbVhIMUs5MEVxU0JaVGdOQWV0VTJ5bk1r?=
 =?utf-8?B?SHY3SHovT0hmTXJ2TzNVUXl5bXJ3c25TRE9FTUczQ0dKbmhpdkVKanVnOEM5?=
 =?utf-8?B?dkJ1L1l1Q0VwRjlqWnpBM2ZMRm9rcDhDU3RuNEhkUDdrOEV1dFVGWlR4UHVk?=
 =?utf-8?B?eGpDYndDYno4ODNibmkyYkZBRWNPclYyamh6bTJITFpheEVvMlBKNzB2NFNl?=
 =?utf-8?B?Ym5NZkxGd2pTMFFWSlpnT1NPUUlQMmhMVkFTL0dXREV2dGlPTjMvU1pieGpo?=
 =?utf-8?B?Vmk5ZXBEUWxmZG1lUmh2YmRMR1VJMGwvTm5HSDliMlBFa0xmQTNDakJjRVJl?=
 =?utf-8?B?QVdaZE9KNVR4K0diNTNCZEJKWWQ3RWVEaU1rTEpKd1hwUTlCLzZkRGc3SGJS?=
 =?utf-8?B?ZU1Gd0NYTDZPTXNid2FYQ3VpcmV1L1lzcG12VUJnTTlDQXU2MWQ4b1pGZU9W?=
 =?utf-8?B?RXBMbExaVjYvNTBzODA4ZlVHUVRlUnBuOXdTbjg1UjhEb1hDT1RIMEJ4ZDM0?=
 =?utf-8?B?QWNtZEl4THZQNFZLUGgrS3JDV2ZhZ0dKajAzL0xnRmNYZzRsdEZYTm1HekNC?=
 =?utf-8?B?K3BRcmZ5T3I5Yno2TENlK3UvN1hRN3pUT0RRdmhpOVh0N3FNaGc0cWFXNXpp?=
 =?utf-8?B?b1ZSYm1YSzdjU000QmlrWFFpTjNLeStHREwxcDBrdXJRUlh2cWZmS1NTbStO?=
 =?utf-8?B?VUp3eG4xK29nL1JXRENVRElxYkR0UkFlQk04QkNaSDVlUVZxcXNtdmJRN0VT?=
 =?utf-8?B?NGNuMDArQXczSHZxVFQzdWNlUzI0c2tPUjY1NnB4bXlveGJiOHdFTXdvSHFJ?=
 =?utf-8?B?emJYQm1tNTZNZTJibklxeHNjWFZBR0FkS2drQjY2ckhzOHVtOHBKNCszVnhZ?=
 =?utf-8?B?LzR0SVJmWjFwQWNPWFJrTnNDMlFERHZ3QzIxM3pJc2lXNzAzYitjQ25GN0tS?=
 =?utf-8?B?NDBMaGxSMHAvSlJXS20zK3YxSDZpRkFiSjlXcFRtdE1jOE9mNjdMQjlkOGYz?=
 =?utf-8?B?OTlMcXQwOW1WS3NZOWRtdGk4YnpUWFh2bGtnN0hKdDBUdzI1SkRHellSTEJo?=
 =?utf-8?B?b3RNUlU4K0g3ckdxN1hhTG42aFRvVVNhS3FmUXNkbE00N2xBQ0hHbFovWHhE?=
 =?utf-8?Q?rC6o0TPtT/2Nipl5WIOTR372g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5816b51d-8d4d-4bce-029b-08dab67fb097
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 11:54:36.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R0Sw5cIaHvROB5XyrsGaS8IrVA5K/0MTGWNCJQzSxnYuyM/d40GTv++WgiUS4Me42nkqMQkqFn07tMT87VsKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8874

On 25.10.2022 13:16, Anthony PERARD wrote:
> Make may not have copied "_libxl_types_json.h" into $(XEN_INCLUDE)
> before starting to build the different objects.
> 
> Make sure that the generated headers are copied into $(XEN_INCLUDE)
> before using them. This is achieved by telling make about which
> headers are needed to use "libxl_internal.h" which use "libxl_json.h"
> which uses "_libxl_types_json.h". "libxl_internal.h" also uses
> "libxl.h" so add it to the list.
> 
> This also prevent `gcc` from using a potentially installed headers
> from a previous version of Xen.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



