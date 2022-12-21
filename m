Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC41653198
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467864.726915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z33-0002cU-6o; Wed, 21 Dec 2022 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467864.726915; Wed, 21 Dec 2022 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z33-0002Zz-3K; Wed, 21 Dec 2022 13:22:17 +0000
Received: by outflank-mailman (input) for mailman id 467864;
 Wed, 21 Dec 2022 13:22:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z31-0002Zd-My
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:22:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aa558fb-8132-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 14:22:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:22:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:22:10 +0000
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
X-Inumbo-ID: 7aa558fb-8132-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT+nib/N3CgKCwgPbCmdKrLYQtgyHwJPfdzm8BUQBkNs35P8JUnYm9hYSks6QC4O/Fy9o5HWoe+6Au35JXby1PxiMTO1l+xgFbOGHPn/e9qrQvOwiE9KdEO74MqEUhueh/XbpHlZIo/zEghLN/ayZx4hP/9QpmFZWJyCJpmGBqHo9RrBA1HPgUMxCvXdiT+xNdVNEN6h6GHkzUbd3ta+7MIS4c2Ic4OJjt6i0M9tM1V/V+gNp1X6DlGj6kaVamWVUJpAUu5Np4KSbV2teHm6HK0Kxym8KlR3MNN1QELff7rZLrhq5rFNNcFcmiBBqcqppqvwztzf+4XynADYC1L4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqBcRue5iaUDnpA9g8fp0dqrfjACNo9E5cosNHW1QGM=;
 b=JEgzJdnjn2pYMgZDjmJdAFZ3ahCy28IFFAJ9fJEKnC770dv28jnOlLdqKmfAV5JfLe+nPHpkcm1l/C8ZonrgLZT1kfHJ/dTU2QWL0B9QZgRQcBhvTRocsA+YoqMO/XCZI1fDbFiMBIRcxp9OPZngKTHbureecO2bc3eWbsi5PuYuGP27H4i8fqzJuy51n7CrpTY1102g+FyJZkREKux84o2UKKAwPn8wqpfQRnIw/cednYKkN2e4hjbXIfOpRxv/McGCE02+mq7avmfPpVEvuWrx+Ic/B8KFv776SzVJpkV5t8Lcic4PpQ1A7a2V26Mjr7S5BhbHIB44PEzWQiMAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqBcRue5iaUDnpA9g8fp0dqrfjACNo9E5cosNHW1QGM=;
 b=JaBg3+u24Zu4a4wqaVPOrCS/Cldx2L67rM3wRIbwzc27RD1eBJptwa7Y8CL4IFIwemf4mK1mEx1BuDaQgiuRxwMPnJOBHmIDyQFM7G6sW/j5xGdjCJ5SmxoBwvAql1UbPGIob3WyZHaCEfOYWq49I5msUZt8sGwLSciVIWFLnNjDfNv9G+RaNP/VNw5iFXPljaeW7a07w5CWg6fjTUxKmq8Sbgjuo1ZRJl7u3bxHbeiG0nB4CHfSV7760UOwVdtE6ci78F2PR9cYnAIQhAQ0V54VOl9cfOE/iSwK3NqN8pZxIIq04Shc2jw9SzSyhryyQ7otcmWM8YgdBWkxfs16ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Date: Wed, 21 Dec 2022 14:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/8] x86/mm: address aspects noticed during XSA-410 work
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 1061166d-331d-4fe0-4005-08dae3565d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xr7XZ/hj7V+bztnx9EiCL5vZdZSXg9xGYhKDkzLs3EoXQwsgIYLTlI1yGJrnx/zEVP3gq4VLMSRwPrfuTU3wjKcBtRRokSdtip6VH0zTb3K5rE37eSRj9JVfp2LTaizYPcncIjihMYyBNWaNulzbdNmKK9eJvcUsmaYu2sVMcJucYd1AOiKOmO0DWNAskM0s5PvfVGirb+8NkpvxtBD4+c0SNpoMdLv4L32Wi+2TvfMWFBicjZhRVDmiM1KxuoIfiNTOZidE8NEcgdQRl6b1ENQfPwsrLuZZg2Mp42lVeIt3TDZFtcq/QU8WeGy38FpP/M2pCAE7P0nGC+e4VGJqZW/ptU7OEQ79qi0S3un1O1ZMN2nY3Io3PRoyHFm5PpYzaY3Tvl9aHI75j6GGQGC35NAXawb2KmIssz5fGlEsAaLi8qHFKwBVetZRmwzxQEQfBa8huqZXoMwaAse9Ef4ty6hVDRyUSWorJewtYVrr1zrsF0MKDJbpJpFQfc4AOW35CKQ7YwJEVC7NSA6Xm/UscyZJ9acfp4JzUW+jhLZtg9jRMbFVFh+4+hrkA6AhbOiPX1YzMOVOdBEJO5OjoRyGr3c51H1CT/ln5vAL6DfHr/kyf9G++oOvDTVEGcXsPl+vdBpYjiQ4VjfV5q5W87DJvp0Nmt0/2trnlloXVtYOj1rPxUH5CQiRq11FFvxkFmyG4SpHq1qj6ru7pWL2hdqy+VG+qqcKBGjS9yDVUego7hU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199015)(186003)(38100700002)(8936002)(36756003)(83380400001)(6486002)(6506007)(2906002)(15650500001)(41300700001)(54906003)(478600001)(4744005)(6512007)(26005)(6916009)(66476007)(4326008)(5660300002)(86362001)(31686004)(8676002)(31696002)(66946007)(2616005)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkVLTmlXK01tSytIOWlLdEd3ZWovUW5oVnY5Tkt6U05Zd2xCUHczYUxJV1Qw?=
 =?utf-8?B?YStQcTdYRDV3RjA0M1kwZzRiRTkvT1g1blYxYS96WE9wc0t5L2kxbXJMeE1k?=
 =?utf-8?B?RXJWaXZ4cmN2WGZXSXNmZUsycXVIOFdXRHY4RFdUYkhNU0pCN0dRamcxaERL?=
 =?utf-8?B?bDNwcVZJUWlJVzY5KytUMlE2eVFza3QrT2dYYzhWWTVKMWl0eElaN2pLYnMv?=
 =?utf-8?B?U24xSVJlc21jazFxMkNlMWNwRE5HZUhNanA3TGViWXRxRmFmamFiZWxxcCt1?=
 =?utf-8?B?eDlGb0JmMlE2cXhPay9vN3VwMHVzRzQrbm1vZDYweTFxRDlxNC9XeWw2TTlx?=
 =?utf-8?B?WDZmY0xTNXVNTGlRM2grd1d5Q2Z0QktRMk5IWlQ4L3dwNkQ1M3NLQlpFZWRQ?=
 =?utf-8?B?cnVwZXpNNEgwVDVKQUhqbWhYblhydDh2ZnVRb2w4ZmVnbW4xTkgvdVVzNDZs?=
 =?utf-8?B?WXpERXhJakEyOHFsVzRRWmpTUFI1NnVnR21Ta1Y3OHdwNW91dVlhSUY1R2Fx?=
 =?utf-8?B?V0Vzb3JWQmNoNGpxL1BpZGxxUmkyTmEycll0bEIyRGxWYjZBTDNlT0p5Y3NI?=
 =?utf-8?B?UXM1UEJBYXp3Zm4rZlJYeTZoMlFvZWlvOWRXTkg0cXZhS3ZMaTNSeWVqVzEv?=
 =?utf-8?B?VFRZdXlQZjZHck1POFloQjJRbm41dFRhRXR3ZCsvNSs4SzZXVU0wQW5FUzZ6?=
 =?utf-8?B?cGdSMUZGWFgrSHlJMktnZzlPR2pSSWYwYUdySzZVYzBKWVE5b040WEJaQkY3?=
 =?utf-8?B?emdZb1lmNXFOM0hqbkphY2JKWHd5cXkzV2dRSkhKLzVkQjRYanlySnNUdVdN?=
 =?utf-8?B?K1dDRER6L1dpaXBhOThveWhMUmFOUGp2SFpiMTYvZk1BWXVXVVVzOEFUcFhv?=
 =?utf-8?B?QzQxQ0I2L0FReEFzUXU4ZGZRTFYveGhFNE10VmxITDZlMzNEejF1M09CMzNN?=
 =?utf-8?B?RmNNM1lnTDhnZUorMkswQUwzZFZRVWZ1a1ZBZXF0VzNKczkzaXNPUWVsdzBR?=
 =?utf-8?B?NnBpSndHOC9BOVBUZHJ1MHJyNStJVHQvOUpqaGs1WllDanlraG5jb29PcFNO?=
 =?utf-8?B?V3psbzJ3aEtmWEQ5ZWdkdU9zMXdFUHdMRDNnZk1RbjMxdGg5N25FY2NNZzVM?=
 =?utf-8?B?cUUrSWRUNUI0LzJBZXdNV3gxdWx0a3ZKME8yK3BpMXpuV0k3M2MzckN6WjZI?=
 =?utf-8?B?K2tiN0NPbjV0NWoydUZjcjhITk1YTG0yaUlSL3pXOVFhblFFT1VlM0Y5cElx?=
 =?utf-8?B?MUtVVWRnN0VFRk44MmE4bnF4MjZiQU5jMDUyUXF3cFJnMTBRY3JxWFpLblZq?=
 =?utf-8?B?cS9ncXpId25hM2VFYmtHVXZNOTl3QjMwYzNnQTZtMHdJak5oNklLdVp1Z1g4?=
 =?utf-8?B?Q0d6R0YwL1lYVjZEa0lQdTEwMWtuZHY1Q2d3MEI2TGhja2hvdFc4TmJPTjhm?=
 =?utf-8?B?M0FoMU9vMldPMXZ2Q0IreStYUi9QNXFoUTliZmlENnoyb0MydStZT1UvakNX?=
 =?utf-8?B?a256SkRGRFpvZjIxMjRYL0xYNnNpOEJFQisrWWFpWHFJM0RwNkVnWTgra2w1?=
 =?utf-8?B?ZnNiY0JnU2NkbXFnZ1hNOStqUUJMOWh4cWx5aFhNTGl2TU8wT1NXajlLVFlV?=
 =?utf-8?B?dkJRbXJ5a001c0xYTFNBcFdsbS9Bb1FLU1ZkQmJPOWNTK0RWL0N5cit0VHNB?=
 =?utf-8?B?SUg4TTNIUDlzT3BqeW1vNDVtWitTcXVhQjEyRmluY1A1NHBuMmQ4RmpGT0t5?=
 =?utf-8?B?cTZNR1lzRDRyUzFuUmwzNzdrS3FkYTl4elJ1N1lnTW1rS3JPdGgxVUE2eXVs?=
 =?utf-8?B?cVVHdHhxUi9Od1FvYWNIdE0vUWZ0VmNreVZtTWMybS9wVHAvWnB0ZGUrcFhn?=
 =?utf-8?B?QWE2V3YyS09nTjhBUHByQTlOVFQzY0EzVmMwWjFyeEVtVE96a0JZcE1UU3Vk?=
 =?utf-8?B?MU1ua0N3YWlSelg3US8zeVV6aXQvR2ZLVlN0a1lFZzdkdGxtS3pZVnBxQ2NU?=
 =?utf-8?B?Ym9sV3V3RmY0WUNib09EK3NjaTMwTFRaVTZwRzhlU1BiTm54SkZmbVI5bXlw?=
 =?utf-8?B?Y2J6cGY1ajQyUWtxcitCaDJKSkNsL1hWQ1RzTGZQb2FOSVNKOVpkUEtlbDE1?=
 =?utf-8?Q?ZzT5yOwlbNeLNZjdvHMin4sRt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1061166d-331d-4fe0-4005-08dae3565d88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:22:10.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9cTo/FhrFf/ODthfXrpxU3Lb+mR2MaJe+nKOrlggbw/GCQxSVgmdpvVrE10np4zH5FxZcgFH0+g3+P7OcQAGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

Various tidying changes accumulated during that effort. They're all
functionally independent afaict, but there may be contextual
interactions between some of them.

1: paging: fold HAP and shadow memory alloc related fields
2: paging: fold most HAP and shadow final teardown
3: paging: move update_paging_modes() hook
4: paging: move and conditionalize flush_tlb() hook
5: PV: drop dead paging_update_paging_modes() call during Dom0 construction
6: shadow: adjust and move sh_type_to_size[]
7: shadow: don't open-code copy_domain_page()
8: shadow: drop zero initialization from shadow_domain_init()

Jan

