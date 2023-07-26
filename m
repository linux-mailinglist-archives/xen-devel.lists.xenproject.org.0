Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D400763993
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570521.892351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfqh-0003LD-NN; Wed, 26 Jul 2023 14:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570521.892351; Wed, 26 Jul 2023 14:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfqh-0003IV-JX; Wed, 26 Jul 2023 14:50:47 +0000
Received: by outflank-mailman (input) for mailman id 570521;
 Wed, 26 Jul 2023 14:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOfqg-0003IP-4I
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:50:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb730afa-2bc3-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 16:50:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7392.eurprd04.prod.outlook.com (2603:10a6:800:1b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:50:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:50:40 +0000
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
X-Inumbo-ID: cb730afa-2bc3-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B04bfbLeqaYgrpUXXXu0/gPA4H4iE6PipoPEsjVZtipi2OQ21eC9qUcPWZgFkzNIEAZo/zMYbg+fOrNz+4AIanVA3x600GxNb68HvM31Gzy9BmvWJk+xsaU72WgmmP4mLuuURdGnUOGNh0kPzjHL71Dpukyj+VzxQY1kT96dUoyP+9gcWHKMRC4VKqaJQqJiVq15EJkNQiiKJmVDCRUxhx8oOJOL++fYNcsjbDOtA/hTXwF7XpjM5Rv+HYjMXOA2Gg1yOZ94YOVvcR9/Xxp886y61UeN1ICW71L5vSRLA3fThgUg9aIcBGrNf4Cuq0iqe6/y/eJtT/NdrM2p9mlw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/+7aOrL/bJ/KQd2wEwAofJ2XrcTnus/CzmcUnnAoSM=;
 b=FihqdE48+Wcej6OUWVNkxpDDjTse906BhG/YNMzQmbqHCPKG59eK8HkmxGgt+XD2EJioLkm676KOLYIvYR/ttCN/S58nfMR4a8LYMOkgsJo7oYEH+vK2SjzBthjwf6BF0Y8qGeKOUWkKwAjVKew6iGU4vnF8CUCKDuMI6joJdhCvvEFvz5SilTX6gViJwPAYQQKu4XdhOW4QfJe7BKGRuR/zWSPSauYw0Us8onCGxRCx/CfeRPDwkOIOqgsr7jfQ9g1CcjFn/PpC3/CJzLn/Cx279G4bSgqjewZ8oSwY79EdZjUM2JpM1KuBT29wJ68XA00ngqx5A4EvrMM0b4zMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/+7aOrL/bJ/KQd2wEwAofJ2XrcTnus/CzmcUnnAoSM=;
 b=i87Q8N6kWUZBp1n2RIGCBRyAuxmTY0V3Oib0fVPku8cT3ndsg635B4wx18ee9qIcDBtPENOdloGEafj3G9K6AO3ON7WeVi/9xZAZJzrqAuOzepFZJ5OYJEYQV6sQrzVA7jVzjPjtYx2mLaT3N8HhoDh7v5QTWNAzIFzSlRJlxzS4Qj3rgLPJChVFxKQz9y6QlWK6vq1ukAuURy3aPkyKnG0E8w+o3bFVkHto1glwjd384XYo2c3QDwVoJ25BHIaD/xyWRjBzu0N3FFz/9MuS6OuYQZDMVKxihEpsXWWPJ/Uz+aviglx5lobko2CWO/m5b/u6nC1ZVMslKG54l6BrAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <969aacb8-a608-be01-f0f5-34fb1cc61d62@suse.com>
Date: Wed, 26 Jul 2023 16:50:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 xen-devel@lists.xenproject.org
References: <20230726141459.985463-1-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230726141459.985463-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 508d7ac6-798c-4459-105f-08db8de7ae59
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7OorgryX5rsb2vCBQhvgJj0z+0lpgJob16lxsaG75ahVcVX7Jt+OgV5dGgEr60XPkFKSeQE9xejD4Y/jjpKlHkE4/keI7kGNJOPMtPgD68W/KL8AihjNmLIFkmxHW2cOo41HIjg7Zpw5IwKNkoMniIABSees45uVNYtmlBtSZSscG8NI/Ze91DqISZgsZ4Myy3iQJWnwLkP68VrC2pCoJlvMgQYdQHO9efxeRWIIdusjC2ZyRD+8PSlFTNkI5Nth32/pQ3g1ab8HbhJ+rZQ6m3Nj7DvZ98WghcrOHEtFuzJi9+L4ocCo3t4exGc/S1lrLVsNPxFqff3p8Ojpb77jCqsq9wVm8wGS7QQeaHnKBd3FJmyFptWZHjFX99LCUw6llvbVK1l43LDd5Tyu1raG6GRMWMDjc/+P7T9R6uPEuMqD4q+rec2bUJZfdi5MAugFRjMf2yCOfZUq8r+g2bB6XT/ieaVtdfKFDPpEIv6dcslD7UYSAj/VTQmBSl0ihagfhNe0OlAFgr2kX4iJbIsOcTE/MW2PhHfhllZK0tNCU8MuLwJL89NNYio/Lnze9t0p1RY4VfCLErOXvOjjiM5jzW5OugSn/9oFYpSr0giORiYECq17vkeu8wBPmY+DWYlRZl9kxcXROmj148Sk/lbJfd7U2zE6RkC+S/Uj5nr2BocfzGmXRDPd+W5Srlp6JzDS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(478600001)(2616005)(6512007)(6506007)(26005)(186003)(53546011)(31686004)(6486002)(54906003)(4326008)(66946007)(6916009)(66556008)(66476007)(38100700002)(5660300002)(8676002)(8936002)(2906002)(41300700001)(316002)(86362001)(31696002)(36756003)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHBjTkFTNWlGdksrdkMzV0c4empGL1AyL1d6WHhpTjM4WWxGK3NvbVR3LzRl?=
 =?utf-8?B?SnFiU0FTdVNSOU5wRWlrNXZRR2luaTNacG9GYUJZMjQwSDlZZWtJK1lRYnk3?=
 =?utf-8?B?NHBiVTdrZFFxRUxHdzdpYitvK3ZXTlFsM2c2MVBFSS9Qb1pJeEdUaHB0Z2Z1?=
 =?utf-8?B?QW9tUHB0cFRtS2wwOHNBOUFhN0xvWnVWTmh2akkwSUp1WFFhb25YS2c1Z3Rk?=
 =?utf-8?B?SXlRcjgwa0RndnQzUS9pdHBxZ0JHdytvejVia0pRaitaRm1ocTc5K3c5Nm5U?=
 =?utf-8?B?V3hUcm9IUXRnTzFkT000NnpQRUtJUUxMMko5YjBkVUwzZTdndHFoeWx5SXdt?=
 =?utf-8?B?bUhpTVVrQndPT1ZKQW03OGN3bnVvRit0MmxDRUtuWk5ieEhzMnNEb1RGV2Rr?=
 =?utf-8?B?TWl0ZC9iSTNnQ3dpS1JRRzhGRUQ2N1dNTDJaUU1TTWJZY1NSczZFaWtBODlQ?=
 =?utf-8?B?NkcwR3BiRlp2czNwK3VaMGxVdmdISTUvTm9IdnFlZkpZNjdUWUVBVFdMaVEz?=
 =?utf-8?B?V3QzZ0YvLzM3NnczS0k0bXlyeEpHdzRmZXdrZTQ1cUhLK0FPcGp0c2hZYkVp?=
 =?utf-8?B?a0N5NVpCWDhNQXY0RVRlN1NuTXl3UEFsMTRCTEgzQXlBZkxDL0ltTlN0bFV4?=
 =?utf-8?B?YkJnRERmQ0JPVzV4Y1ZTdS9rT1dXYmQ2N2crNHhoUXRXSTNFaXFHd0J5UjVs?=
 =?utf-8?B?MENJWmNrZ1YvRVhGRENMMklMTlB5VUorTHAzeDRwUlFuNUY1OG03M0JEMS83?=
 =?utf-8?B?dG9LQ0NiaGFyMXRaMEh4YjRlMzA0ODRRZGthb29MY0t3VDYzOTFoZ3E3ZjNF?=
 =?utf-8?B?VEpTcFUwSkx5QkJFSy9qRmVkL1JnYnRMaGRZNTB3TnYwcjRuMUplamNpeldX?=
 =?utf-8?B?TmxmY3FHTWpBdFJDdlVrMktMbEU5Y3pMa0crRFAyZG96c2Jwci9NdDBBYS9F?=
 =?utf-8?B?WnYzR2d5Q0dOTlFkS3VTZ3VON3p6S0xEbldhcnNZVTBycnFydnBiTnVSQUFj?=
 =?utf-8?B?OUo1b2xvbGU4VE1TUjRBYmZWa01NRGpoczV0cnc0WFZ6WXFJZXBnSXQzaUhq?=
 =?utf-8?B?R01kWmEzTENPTm10U3JYSUprd29oWWVqYkhmMEFlSldLQ2hsRTdJdFJvSWdn?=
 =?utf-8?B?eHJLZ1FjczhnVGNsWnRUdVhEdi9LWElXNUJaWjBCbS9tZktLWjIvSjNqZGRz?=
 =?utf-8?B?VUFYTG1yUkthSU93ZzZRdkJlUlVZbGtwWHYzQnZWL2Q0V05lRWVjNmVacHNP?=
 =?utf-8?B?a0o0UElyRVJuUjQyeU8xT2JabnBObEhQTVZKV1hoNUU5R0d5YkVKZ2htTk9C?=
 =?utf-8?B?bjNvbHJEa3VqUHZ1MXd5dnZXOHhCNy9CUVp5RXRLNENnVTRsS1pPZWZBbkNG?=
 =?utf-8?B?VWhWU3lVQUNwdDNnRllMY3pyem9zdG8rRWI0d0YwZVJFeGFsOGtDTTFqNFhG?=
 =?utf-8?B?ZHpzOGIrSjlPd0dPWFZrUTE1UCtmUVpucGlCRFBUZGkwSXl6MTZCemZlUVNk?=
 =?utf-8?B?ckpuRGkyTGdBVnRTNkEzZ052V2QxdEg0dlpQL1NPRTNQa1hUdmVKSnhMdW1K?=
 =?utf-8?B?emovWEI4endKblZYM0hSb3QvakhZNjdFUXZHdTdaeTFwMXRrRHI1L1BtaThj?=
 =?utf-8?B?djNuY2htL2wzOW9SbVlHdGdWZzRuMFRIUlBsRzRDUTUwd1RobVM1WTZud2J0?=
 =?utf-8?B?MmJYYWorbHAwQzVmc0RLaStHdzFxdlAwK21qZXlLaHEzUFZaOFQ1NTJyS0E4?=
 =?utf-8?B?Q2twTTBIT2xZMU1SbFRoNlZ0NE5zcTVONjllUTZyOWdrUUVVekZQUzJraGhk?=
 =?utf-8?B?MkNKL0Q3YXlDSTl0UmJqcCtOK1MyWVFoOENoQjRnUHRtd3l4cDR5R2NBb0dG?=
 =?utf-8?B?Sk1iRFMvRHgrbERDMGxVY01NaTFtb2FYQnVqQWs1L2l5UTB4dTVlWWpDWlBK?=
 =?utf-8?B?dG5uclhWQnU5aEhndTY1ZURRR3JOQ3lOUnRHOWpiSENJeHVPR0NoVkpacDk5?=
 =?utf-8?B?OWtZNVRpbWErYllCZHdJVHE5azFCV2V2Y29GMmhkZTRySVlPQndvOXZRR3Q4?=
 =?utf-8?B?UTgva2ZNQ3RwbUxUSG9peXdzY0tqN2JZaWtuYUtkRGZrbktZamRPMEFFa3li?=
 =?utf-8?Q?z055bKb8TJ4plN4E2ekUODLdx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508d7ac6-798c-4459-105f-08db8de7ae59
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:50:40.6262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hive8/+MXT/ooaGywPdnvLUiT5xpsO1o8Uuc6QHttqiyNdQuXz4iYSJr5AiSyRp89XIL9PFn70P7bV6tyIgFEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7392

On 26.07.2023 16:14, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Without it being present it won't be possible to use some
> libxl__device_type's callbacks for virtio devices as the common code
> can only invoke these callbacks (by dereferencing a pointer) for valid
> libxl__device_type's elements when iterating over device_type_tbl[].
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/libs/light/libxl_create.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 393c535579..c91059d713 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -1887,6 +1887,7 @@ const libxl__device_type *device_type_tbl[] = {
>      &libxl__dtdev_devtype,
>      &libxl__vdispl_devtype,
>      &libxl__vsnd_devtype,
> +    &libxl__virtio_devtype,
>      NULL
>  };

From description and nature of the change this looks like a Fixes:
tag would be warranted.

Jan

