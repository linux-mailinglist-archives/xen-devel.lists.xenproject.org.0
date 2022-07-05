Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29B5670DA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 16:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361357.590834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jRS-0007HS-SS; Tue, 05 Jul 2022 14:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361357.590834; Tue, 05 Jul 2022 14:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8jRS-0007E3-Pj; Tue, 05 Jul 2022 14:22:18 +0000
Received: by outflank-mailman (input) for mailman id 361357;
 Tue, 05 Jul 2022 14:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8jRR-0007Dx-JC
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 14:22:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60047.outbound.protection.outlook.com [40.107.6.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda3df0b-fc6d-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 16:22:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3363.eurprd04.prod.outlook.com (2603:10a6:208:1a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 14:22:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:22:12 +0000
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
X-Inumbo-ID: dda3df0b-fc6d-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/ImTp7D3Q+ADopOx0pUDj9r7mEJ4CTX1Akuun7sRWKIP+sDe9G3sfffxw5SJCQxWRXYflTvpDl17Gv7BKK9zSpgDzzJ2j4yBXmLxaRQqTTMUU9xO2lzV+sLK4CKuK/ermNtDbZKYZ+4PFpSYOBpHSN4hzAPp0VjG2Gtjk1q7Vmq3BSPvpIMvrGi63kqJ4GSFbNYGIuW/AyMTitKLbSDhbg/OgrJoYowVFT2JprOhzVJGdyYqsiBhE6sX/HFYYC9Pkyd27z9zqSepg6FKminHrtjSdeDLqrurrw67nzcEz5dCYOA+ldLGS4Wq1++lSFHVwf7jj0vVHzWuGN9h+BeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDdtPKbPrMYdL9fmjw8kpdIPCiiqjZbIe+Ynkepvz7U=;
 b=dBKCKpaMpyeefwDBSNbSdzzy3k12la0i3g2KFlWvpwSw7h0oierNIw7bvryEOTovryyVoiLwHSNTDvU/0w0QNPIwa/ovhcMD2fH4K5/JnyeZoizdn3kHVfy3iH0uX3uyJ0AWjjOMVknwxZj2P/dbk0t2Nv1Hztc/r4/VLjHLVKms8J1gWJ6tgxObtE0gJjDkT7HBhq4h0XhrLqwdySHyHrwU9/FrQpL+kLBd2unhf0W2GVa7ELvf9Y7C6wZbgHgdnqR/msarTlqcNc+XuSNde7x/ovmZIDwz1U4qvoUDNEslBCfcwtkXC9/D+N/jw1ZDFb8hhkwlofDGGQhmXagoOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDdtPKbPrMYdL9fmjw8kpdIPCiiqjZbIe+Ynkepvz7U=;
 b=WL1FiKb2LPYfsRDasmlTI6s+/pYWa5ABmAhNxikab2ed/1wlV+Ae+sPQT6jK70VR98hqWnsKTvH3uQdB18wU8L5i19pxUi6dORfymyTFj/OiDixUCpXdPIQ0L1UTgSvG2Oiga3E4I1ByFekgHCGUaSzBm6UCKYtHwUt+sxpMq9bMknBYOHXSLlDsVCxmKV5Hw0ND0PCkjl7eAMzv07NOjg9kjE1dwT2CMvZYcOgYtLHm5vK6UI8+uWLOfwsH3B8Byrxls99Dwx+ePsqQsoL4QNZwv+xbvUAlC7/m13rYphncYgUtjMT1urEtv8VqkYwCe6hoh0vBkkD6oSBCLJScrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22d3b019-7c34-5d92-ba1f-2afc88c0bd57@suse.com>
Date: Tue, 5 Jul 2022 16:22:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/6] x86/irq: do not set nr_irqs based on nr_irqs_gsi
 in APIC mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220630085439.83193-1-roger.pau@citrix.com>
 <20220630085439.83193-7-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220630085439.83193-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cca1b381-d3ec-4191-7b10-08da5e91c0d3
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3363:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vhP4CJHxkZdezh7OkuFphakggAV7zbIHJvOYSXYR1kRcVwGYKVJqQXy6X8/Q/tUU8wSCb9UyVWfsMeTYQ/IUu5nzGGWGUyA0ynqy2PO2JIIjplD2IwGg6z2t1SGz+OSkuM3TwDOybtCQKBqMHBGpeNUGRQWizHT4KamNAe2wtGaqyVr92StRWHrhvH6S4QkJxHLCfDqg9yO0msEhXf5+SXQVBOHwChQmyIM6MxnsaulwAAsI19Hity6Hhq4k20AEcGhnI+sr5CfccGngNxNMaUMQIPxGduUvxeGpLC4MsdUg1AVLi3B9a5zPRjOl/q4r44tslzHvwbLuB/UqgyTh/wAbY2fLpGnxtsSQtSn5dTvGXPz6OS9u/86DHy4eHQuEGMRT7FLiZBK8oI0suSCekyHVBVqUIKm+/fOOe2XF5XhLUQPjM7uDU1lCboxr0/5n6dQjNptdonFJJGIWQ7FVOmSiyjhJYVOXrcXD92eK/gmqCSGn3mphv3TewF9Fh0mAFupec9lCzH/p0v+2tnhUsCNsvlDRo2jUm0IUPsVjOM0LhI2+eSTS3abaPhQ6g/LNBkWH3zBBXt1X7Hk7UIVbfSBWUTSeIDoLmnOf768XIX6zWmHAgvncZHtRn3dZ+qM5yAQ4IsUul2DTb0ecToNVu4QtSwJD+9xlPVXTIx582m4qDP5EZxj4cEOHXw1em6xfp44VAGdYYUvStI1omXnVQ/kG48OgRpyQwrCI3q6ypkdvdHR53NLQ+c4f/pui9xTpKbOisZAmzJfZDzW6owt1514PsdZn0usy0dH0ArQ5aSwAlZlkxz99S4rpzDybxLLSIhli7gKy/TTmkUV2QqOCr56RQ1tA2idBOUeBezdM2oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(8936002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(86362001)(41300700001)(31696002)(6916009)(316002)(4744005)(186003)(26005)(36756003)(6512007)(2616005)(6506007)(6486002)(2906002)(53546011)(38100700002)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZqQ1I5clBMSjh6eklZZlZOaGZYTUp4ZnJwdytiUlQ2QW8xb2RVMkk3TkZQ?=
 =?utf-8?B?YTkzV2dQbjZJRGRBTWNtS2RtajV5Y3JMNzRaeUliK3kzQmwrY2FJNWk5bytN?=
 =?utf-8?B?cmtBTGJFMXBialQvYWVwZlplWXlTYUdISUpDbzM2OUpFY0hzYUF0dVZHMW1a?=
 =?utf-8?B?d2VwWUp3Nlo3Q3J2QjluZVd5TEhPYkRlRS9yU0NVUzJPdTNhRWI3b05acndw?=
 =?utf-8?B?V0NkY01YZ3J6M0Z4UzN5MFNUd2NvenZJcmFSdVFQQjVsZWpWN1hraHpjU05j?=
 =?utf-8?B?Nml3OU9QL1JmQVVNNGp2K2Z3OW1vSDVpbjZ2SG1TNHBRVGttcHlYNVg0Rm5v?=
 =?utf-8?B?amJ4alMyYWMvV1g0V0FVUzh4aktkR2x2STdpQTY4THBzcmc0MjBLVnlmUUpL?=
 =?utf-8?B?WkE0ajFjUWNiOG9BUWVrNDZ0TWhqN0c0ZUdPSlU0bjlmN091K3IvTytaZE1U?=
 =?utf-8?B?OWRKa2Ixa1g2RWEraFdKekFkVXc5SG8xR3hsZjQyM2dMSm9MQmZXY3lScTVk?=
 =?utf-8?B?UFR4NU9EWnpiTU9vRk52M3d4YXNWSml3T2tVV0sxSlh4MWhsMkxvTFZhVDho?=
 =?utf-8?B?dCtSeDhUQUtRUWUvdGU4UVgxYTg1ZE42Rmxuazl3VVVVK3NXWFpzRmNGeFha?=
 =?utf-8?B?NFV6a0hNZldIVXROMlpDd0lKZVJFYWJ0bnduMU1nYnZvOUR4RVN4VVhCREkr?=
 =?utf-8?B?emlWV3J0OCt1dFM5RFNLc0hzL2ZIeDU0WUJKVTA4a2tlZ3ZGTDBVQXZsRGlU?=
 =?utf-8?B?SjBZeGpidmVVVCtiZVQwK0Y3TE05Mit3VjVreVRtZjRNTWRsa2RldklUVHY4?=
 =?utf-8?B?c3pDdFMvcXhMelVaOW1xblloRlpnUDN5NEJuQi94eThXVDZxWTZmaEc2VGh2?=
 =?utf-8?B?NGRJWFhxNFQ3REIrUTZsUG9INzNSNVYvN0hSWllPU1JsbVhGM25oYWk1R3dE?=
 =?utf-8?B?WjV2d0c1MXRZWHFaWmJKckxNbG93V0N4UFRWbWM4MHkyZ2N3NUNRU1Vob3ZU?=
 =?utf-8?B?WDU3OG9BRWhyV1FGM0ZZeTIyQjQ2S0lHT0UyemVjMlRmVjJLcCtGOFVIMkFy?=
 =?utf-8?B?MzQ2ZUMza1BDbUhOVENnOU83Wm9hQ2x5QjcyaERUYjR6ZE9ZcE9VdVYrY0Jv?=
 =?utf-8?B?QTlnNzhDa2ZYK1FrTThqMmNRSVBFMitrbHZ1WkZTMGZ6YjQ0YzFxekljMWJh?=
 =?utf-8?B?ZUFpN0tBNngvUmZOMWo0eC9nNjIxMWRZTThsZ0hyTm5iL0hrc1JyTkw3ZGtE?=
 =?utf-8?B?TEV2VVluTmd3TDNIWDZFc3QwVzRaL1p5Y0krd1RwbkU2S1BBZnJTeTRHc005?=
 =?utf-8?B?YzRFT3g5bEx4ZXVIaDIzaXdobWZOVWxBNDdLWngxNjhlVzY2OVhKeENxR0tT?=
 =?utf-8?B?SzVLbG9sMnl1YWErL2tEV0xVMmNtUzR3MDRrZFVGM2cwcjhxVnlOTUFnYWNY?=
 =?utf-8?B?VmNraDYzS1NYWkJuN24wRmo4RlNoU3VxcDFySUhnR2tQVUx0dXY0b2wyUDZC?=
 =?utf-8?B?RStRVWtLQ2dMR25uamNYM2E3UnFyQjBPUHpYOXRZT0JINTdtaHh1cTE3M3Fu?=
 =?utf-8?B?SWg2aFV0dHhldEszcWlJSDBUaEhmZHZNZXFNalNVcC9mUTBmMDNuSFJUWHlT?=
 =?utf-8?B?VklVZndsQnZCS3Qyd1BzMlFSdmRNL29QZnlJa0NkZ3BCZEJFZ21pc0c1NXM0?=
 =?utf-8?B?V0RCNTdqcFpkWUI5U05kMFdYcG9jVVdQdXNjb1N4TjloclpiemZPaVNPUTNl?=
 =?utf-8?B?Vksvb2MwdFZVdEZ0cVVTZHhzSlprTDVFNUZ4dzlMVHNkalR2dHV4SmtOTkp5?=
 =?utf-8?B?bHg2WFd0SHZmNFRFZGFuTEpLemYrdFoyRzluaFFCUW1MeHUrQlJTajIrdVFS?=
 =?utf-8?B?UTJnUlRGN1VOM2xyR3ZTaEFQRS9qRWFBc0FOS0x5VS9DcFBzRjRRNU1BL2xl?=
 =?utf-8?B?V1E4dXIyTzY1OGhRVHBYN1FFWFVjQ2doSWZoV1JIS0JSZ3l4d295MTZnVER0?=
 =?utf-8?B?RzRCZTh0V2xrTUZ6Ujl1U1N6UGN1ZDVjTDlsWEJmTll4aGljZVJjdlEvdXcw?=
 =?utf-8?B?alF0REFQN01VMEpDZXpWOFdIcGJNUncxeW9YTjQ4RXAzZVlCbFNiMmtvUUx1?=
 =?utf-8?Q?myadJ0E8eM6Mhp+ZUthi9SXN/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca1b381-d3ec-4191-7b10-08da5e91c0d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 14:22:12.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +i1FtfX0imNpO8NacRgMkzClwR46r9fyeOA2223TABY0veiBjQ/kcL2/jy8iEvJLsA7HJ8lzjbBhmIxJm47/kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3363

On 30.06.2022 10:54, Roger Pau Monne wrote:
> When using an APIC do not set nr_irqs based on a factor of nr_irqs_gsi
> (currently x8), and instead do so exclusively based on the amount of
> available vectors on the system.
> 
> There's no point in setting nr_irqs to a value higher than the
> available set of vectors, as vector allocation will fail anyway.

Only if in the earlier calculation you include hotplug CPUs.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -426,8 +426,7 @@ int __init init_irq_data(void)
>              (x2apic_enabled && !x2apic_phys) ? x2apic_max_cluster_id + 1
>                                               : num_present_cpus();
>  
> -        nr_irqs = cpu_has_apic ? max(vec_spaces * NR_DYNAMIC_VECTORS,
> -                                     8 * nr_irqs_gsi)
> +        nr_irqs = cpu_has_apic ? vec_spaces * NR_DYNAMIC_VECTORS
>                                 : nr_irqs_gsi;

I wonder how useful it is to retain the !cpu_has_apic case here. I
don't have much hope for Xen to work properly if APIC use was
suppressed, and I'm unaware of x86-64 CPUs without APIC.

Jan

