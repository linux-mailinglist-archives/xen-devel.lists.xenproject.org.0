Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CBB7839DA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588126.919591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKmQ-0001Tu-Gq; Tue, 22 Aug 2023 06:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588126.919591; Tue, 22 Aug 2023 06:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKmQ-0001Qu-Cf; Tue, 22 Aug 2023 06:22:18 +0000
Received: by outflank-mailman (input) for mailman id 588126;
 Tue, 22 Aug 2023 06:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYKmO-0001Qo-ME
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:22:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bcc64e1-40b4-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 08:22:14 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:22:12 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:22:11 +0000
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
X-Inumbo-ID: 3bcc64e1-40b4-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO78a/oZTNoP5DDanwypa3XlL17dEFukHdbieZ00oaeX/3gTSr13mXcM13JQPc/B87nF63rlpbVjZUKFptEoh5lE0YARiRyVNP15EcX58G+M9mTsFMFiSAnOrfuyh/k8gMMluq5b1FjOYLqsRhsP9hxJd+i8UQpXrkmvzmSnphkDIqsecWE0fEGXUvgZKJL1b9Z7WcBjsV2X26X2JY3eGkqjdP/rslHuONUHOz49u5O1F/tShKBoJ6EleZwl5kMl9nJ9shc4d0NhZkdYNivGKZao4hAk1Jn6KnL5/rvzYYPfEIy8F6DIQEAPCmsbf4hqsTDMArC6g7cgQqydY1tFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e30PmsaaCMK2uylKSzktY/m/GLlWqH4G7kOZAR3C3tM=;
 b=XYuvrP6fWS4m97VtklaN9vi55Z4E+rV/1auoa5cR909ck6pF1niOF+OLt/7LM+v2Mi6hcOJS07+f2jc6V00GiGFHU01vxnIiW6evzzInHTBER0aDrAKF4ec70pDM9fj0Agp8LYv/1srOYJYyusNyXBfV/yULXdp4SlsD5zcZltvs5BtZ4upbJaNF1OuH5zw8Hk9clVOsWIArvrwBcbRmLHm9xrqnR1tPtLK8neMRgwkPh5mRey8jAfgu/jLnQOV6o5kD+YWg9XW0ANXJV9GoOJ1TFI6FP68AvrD8mps9ZpjO9Bwq/Z0P0BEdFVMjS76TusI+4m6afVdKSmGFQArRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e30PmsaaCMK2uylKSzktY/m/GLlWqH4G7kOZAR3C3tM=;
 b=l68jrMx+6CfYyyvc3rCVuM3HdHDSFSRPqHSBnAe7UbSUc68Gvg1WAm4BGu5xk6sCS9eAkMS0lkwf4Vot/4tW0k9DMGAstG7GXWegN+YX8PYZI9qsYEfZkvI7lMi1MwIzliljpeSugVRZ1TaOGedJbBd5g4QYBqOle8oTUAD5obWC0ge+VUUqVp5b8lVBS+8JSkSK87avVnIqZ9zLRqFJKVJnQmqtXrJHIeQccV5K2x+J2LfGxw+WznH5crQGRbjvmEb6ljDPomMqVdXfJdnBaJkwv0zxUsvVq02IEsKwBvEuhXL0sKklKgY2RkRkN04C6IGcsaNA5rwwe3tdca1aJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b7ad6a92-3c59-a33b-903a-fd0af2fb88af@suse.com>
Date: Tue, 22 Aug 2023 08:22:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 45/57] xen/riscv: add definition of __read_mostly
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
 <e11462a0dd6e71884aa114493d75674411e26701.1692181079.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e11462a0dd6e71884aa114493d75674411e26701.1692181079.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bdcdf5-eb69-4ba7-fe72-08dba2d81ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	knD6dcX0VazxBRfrrbH44Fz/XX6f7ZhajGDAlVx7izZjf89GpPQnVuDjkIt5mbdxkvx9leNnk5Tf/BNrglWyct5ybMZFwX8JAIQHKIBkPusPfh8yaCxyKjn7hZEoYLTnfb++R4/ceW82OqA82eYooU+UhLzqJ5io/jRZCPy6gh7C83sCOApqwoZERz19m+v/LzbbIqd7zModo2AZaGpH5qNqSEgqYCeGHMPMpzm01GpLvmXXq5teutLql5g/H5qdpSdHmqbkns/99pAiVV+dHt76bQO6BEfFgwUXyMN8TgpLYk0nIZlLgftPOScQgmoibJCO3F18rVEtuQGaxVCv4g1zbm4Mtbv70XaH34Hr4Pn9vf7NZuMCmzFAuwJxLWM7Eiii2ys4tSiXOs8YZ9RBwwAX/9bzCG6f7sUGd4MSJtRVlmcm4hUinzrBr4bzx73hg10dktAd4ESgPQmQ1D8pHFlUfUe8msQ+h4HL7YZKPMUHjV4KPwDHSg1llS3RdbKUlvgr5FQm9b0Odg7xQaW2TSIsMZe/xpiWguWQr+arTjg8GKu1GAcnoba1q4WEZKc0rSQTzEZCNCRNbnXXn4S6cnE/A70otadLwmxGTFV1nxAZnMuLX8DpX1UzmxEkINGRB84zhftgENXKF/AiKAEm5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(54906003)(66476007)(66556008)(316002)(6512007)(66946007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(53546011)(6506007)(6486002)(4744005)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZIYTFRb2FETmk3alVBQzVmQWVqSFZOVFNHSGd2N0tUcFYzaWc4VXQ5NkRL?=
 =?utf-8?B?Z0VVZTMyQzNJRmVIclpGMzFTUGhHZlpLUDRxNFgvTEFTczBlVGNuMlU1ZCtD?=
 =?utf-8?B?bDNjdUZ2QUw4QThlOG1ITDZtcXI4RkEzOFlJZTlhUmlMUTY4WXdaalpoOTcv?=
 =?utf-8?B?dnZtK0xZRmJacmhxNzJ5UG9FbFJSM3lvcWZqbTM4Mlp2TVY5MHhieHJwV2dF?=
 =?utf-8?B?SHJJdVRxNU16Y0Vxd3RBZlpUYUZtR3FBdUZWVGMxZlFtSkE0WWpnMlRYYlFz?=
 =?utf-8?B?R2ZpLzVXV2lka0QxM2FHRmQvSE5jUnJpZlorYmtEcEFVRXdESXhNaVpLNXVG?=
 =?utf-8?B?VllDMUZ4RVJBdXdsWFdLOHZOSkJqeDA1L2R5NFE2UmIvUlpzUGhtR1VTN1g0?=
 =?utf-8?B?Mk5hWUlUcnZrdll4aC93R3BmM08vWkMvYThDM3Njend3TXpaZ3lWemtSWFZ5?=
 =?utf-8?B?ZEgzMlZNbTUrVVdiRmhRZTZWNDlTclhxY01hMEI1NVFmSklxQnNNdEZ5TUNP?=
 =?utf-8?B?K1JJS0Y1OWVGOVZFRStJWkZobERUWXpUanQ5YzlPY1g5TnhZd25YSVJRc2hu?=
 =?utf-8?B?QVlWVENnWE5uODFkU2psRXVLOGY3bHJWMnZ3L0NudTN1TTIydUZrREFjcVRk?=
 =?utf-8?B?d1MyZmFoNmZuVmdsOUJEaEgwZS9rSjhub2NtQk1yUW1SYmMzNjB4bFpPaTlj?=
 =?utf-8?B?Y0xHaG15MlI0RFRneDd1d010RW9mMTUvd3hIcXVsNzE4OG4zcTk3WitMcHIv?=
 =?utf-8?B?MmNrMmZOOC80MS9YVFVlTmY4czdpd2xHZXo5b0d1QUVXcXo1UVZFQXRNeTA5?=
 =?utf-8?B?a3ZBRG9DS0FqcVVmUE11SzVXZFNjNWtJNkNRL2VMSGFhLzR6eDcvVTkreFNE?=
 =?utf-8?B?WG5DeU8xSG5JWVY5eUZiTnd2QnVDR2RhY0QzZDhkendwbXg5bDVnUklXM2ts?=
 =?utf-8?B?czhUaWxnRmNHY2luOWJTWTRsRVArTXhZT2lkZHYyTlRSRzlwWHZORlpUSHpY?=
 =?utf-8?B?dCtrbmk3L1pSbVVuNUVxTWlhYUpOM0x2MFdKU2hiY0RQT1lNbUhLMDZmUG1Q?=
 =?utf-8?B?MkNUOG4vUm95L1IvK1JVdk1uS0txOFFLYjR3dGR1a0ZpMlZKNXZaSyt2WlJq?=
 =?utf-8?B?NVlrYUpwZ0JPR3NlenE1b2xLWVBNTk92UEFyeXYxMUlBUFNkWDdsV1BYV3FQ?=
 =?utf-8?B?bFU0RGlaWGpPT25MdlBveUZzdC9KZmY4c1VmYldqSWNHU1ljTnNxemxKZ1I4?=
 =?utf-8?B?Qi9ucmhUcVV1ZlJTM3EydlJRV0k4RVV6aVhMSTZSbVdsM1RkVGNkTTJjajh3?=
 =?utf-8?B?NnlIVHY1R2tzOStNUHZtclRpS05RbFF3aHZEY0FqZlRtRUhRUEh4NnJ6U0RI?=
 =?utf-8?B?UkVqZVNjaTZSNEZjNFJWc2o4LzJzdy91Y1Z4dnFaMEJEMmNLU3FwZy9XVkdZ?=
 =?utf-8?B?cE40WmlnRjFUYy92RWdvQXlwVXlDdVBUNFJUTmJpaGYxa29Qb2RvMEpPRzg1?=
 =?utf-8?B?QnNnS1dsQi9DWisrUHB6d1A1TXFFV2ZkS2paVUE4V3hNMjEzYTJXTENRYnF5?=
 =?utf-8?B?cFJHN2Jqdk0zVWI0cCtoSGQxSUZWeVJPQ21YOHkwMC9kbXpsM0NIdHIzZnBo?=
 =?utf-8?B?VFF1THphV1NINDNHN2xKelg1UDJ3bGJLalJiMTBLR3lYb0p1aWNURlVHZm9z?=
 =?utf-8?B?TzJvaWc3NFdiNmlod21TYllhQXUyRkVDaDNCSVVLRmtZWE80UGpQalZnamU0?=
 =?utf-8?B?Z1owSWVhTTlPV2hQSXQ2YTVRQTVzbEc4WFVONGpVaG84ejh0aVVDaTdoSGRK?=
 =?utf-8?B?SC92RXlGVzdpSnJYQTNiQTk5MFRNZWlMMWV2MXV1T01CQWVmaFFCNHJUdkdT?=
 =?utf-8?B?emZwbGx4TDA2eW1ZU29aTTJhYlFFcW9KRHdQZ3VRWVl5Qy9nTzI5N2xIb0Mw?=
 =?utf-8?B?SUJXcVlnQU5QQzVab3lYeHk2QmFvSklyd3REQVZ4V3d1anhqMC9hbjMzWHNz?=
 =?utf-8?B?dzBpREYrdDc4L3BtSzk3UXF5Ykx3VnNFZXUzZHBMNmtEK20wSjZ6ZzhXa2hS?=
 =?utf-8?B?a0U0eVlQMEl4S1FTbnV4QVZXOVZXOERHYzlkMENlR2RVRXNBT2c1TkpoQ090?=
 =?utf-8?Q?fB1AzvbnxmHzZpKOVvk8jZJfp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bdcdf5-eb69-4ba7-fe72-08dba2d81ee7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:22:11.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TPq43jmZwmXk9nLISCjaWywjrpn6xunehUCnAfqzCP13tBaAuRa+JkykzF3mnyeBUy9JieVyfrBcdUplN2/tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

On 16.08.2023 12:19, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/cache.h
> +++ b/xen/arch/riscv/include/asm/cache.h
> @@ -3,4 +3,6 @@
>  #ifndef _ASM_RISCV_CACHE_H
>  #define _ASM_RISCV_CACHE_H
>  
> +#define __read_mostly __section(".data.read_mostly")

I did already post a patch eliminating the need for this. It's just that
Andrew doesn't like the new placement of the construct, yet neither
suggested a reasonable alternative nor showed willingness to accept the
change as an intermediate step.

Jan

