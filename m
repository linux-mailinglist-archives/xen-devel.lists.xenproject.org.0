Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4085B582372
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 11:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375998.608551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdcf-000335-Ic; Wed, 27 Jul 2022 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375998.608551; Wed, 27 Jul 2022 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGdcf-0002zp-FS; Wed, 27 Jul 2022 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 375998;
 Wed, 27 Jul 2022 09:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGdce-0002zj-CF
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 09:46:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe03e741-0d90-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 11:46:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2761.eurprd04.prod.outlook.com (2603:10a6:3:e2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 09:46:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Wed, 27 Jul 2022
 09:46:27 +0000
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
X-Inumbo-ID: fe03e741-0d90-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy43txEGITCCYPiwniR6t1Ln2fQ+LKC2dQa38N7ClvL1KQCW1tc5XW3jZFCInv5pnMjaVebuXO0aU3Its9LJUyxf3cCXGxHWdGKbDqY2hGswJCj41E/1ud01VccbbB754ECg3TDGKXwxhHxS+OgU1yY2np7WHmzKREq/5txMBuyDqwVWFMvxp0Ioe0BTRdTUpl1kJCiL8odiJwWC3wGuh0WpzsBNRRz5FdyWgzCQP1LY643Y6v54amyT6EMtfHWghgbItGy3jXtYWvM3kIpLmr5QzcrjbS3gp4jvibIU8T3vlkFhoF1a1CBAWcn3Ij47Dt/J3TXhcHNzdMgAD5isAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Xt5HD5Ukv10fyymRJ5SNLoHRutJlWLCUTfphG9cX24=;
 b=hBm5gFDkeqGhBmffuQ3/dFGfXMYNUtZX5G5AEHdIV/LzxE/5QsYZyBvBXe/vnuCh5/k/EycUk2EKMpC61OqsHmZJcOeJ+Fi7RDFmQoZwZyvxqL0R+2nHyM/kh7Kie6MjWFrejhdv21gsuw+fj1+USC8VxEcrfqPKzUG9zwjtSJj/Y085ty30WOXEad09nZ1JDgdVLXSwfRdNlKTzjCxPMXcr3b/HaAJVtX2xIdSh1lagSKcqYrscwh9oMPqETG2A7alKe0pGk1b2eSAQcJWU3s6+2cCGLrO4P1sfhOHV7xaxYD9ClROl2wd3GziLjbVN5JW3VGkFlWOK4CznN9Ip2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Xt5HD5Ukv10fyymRJ5SNLoHRutJlWLCUTfphG9cX24=;
 b=Cwgd4+f0PrBEZU6egsMuK4NQBaigXmdOQ3Ng/Yfsymz3dFqx0V/G5svsaJur3gYbr9AbC+BTzSBvNz/hcUJTdTPHfwx9C65gyNux78Ay/ykagekNOZknygwFzki2yeh3sEYvr2MSZg46K8kD1lSnjrC+Nq+8Ja64JqPf63YGSkBLb4716oP73v65n4Iy44G57wgwY1CVvIRUxBj++xQmZIxf/rhYw5qxPYTMdH68mWGzczYRJlGyAWxyDuxFlFNeoB0BNTGlhyEYyggkbAvdCYG4pa9ZIeYAZzSYlmiKIMCPSexd9h1MjHVGdjmzGBtRzrA8s2nCdR3+DkyIW0DWBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b6a2742e-07cf-fa71-b37b-ae7a3b3f9846@suse.com>
Date: Wed, 27 Jul 2022 11:46:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 08/11] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-9-olekstysh@gmail.com>
 <d31174b6-5477-d3b4-e557-a8010e86f914@suse.com>
 <450660e2-69cb-ea3c-2d91-4e671eb5d552@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <450660e2-69cb-ea3c-2d91-4e671eb5d552@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0054.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4f3e2d6-36a9-41e9-0f8f-08da6fb4e049
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2761:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MF9c7+84ArIFMPCzi/vwumLMuCuCEKOKJkDTq7Tfu59Zho6qspC63JX0Ec7tEq5qUjHdSDKVh4nZ4HhnjENAumVrThKqV/u9LW/hzxgaB206b+uiUuwCKEQCvIbhsyX2LcHqGJkp+KNkvHpYvDvSjot+MJ+DWaJzQXIh2fB9+1QV+vVrkmwz9k0Q9z5Omzs/M+f9Foi5e/K1Ve6U+2kRqIPWgAKOztyEN25xpDjSw1YM4Kgg0gtkmsxSJlxJxsSOrNLVJRgMMN3ciJHwt7FnxnvhyZ5VGitELsHMVp6dXqOtCgBPa3bTrhBaTsHQVTxolMpVAhu/DDTzT0j+anp+hiI+yTwM9bs4PXYI5lPOypR070z1f2qX71KYLISXJv3ErkIFFYSwrmYnhSWEzmavG2Rl8s2xo/aDBXJqJc/l5BVhvsNIxiQ0uvrsiBz+4HHBeHt6qLSCMNAjEbZ70hfrp+qT7Pk/wipQKBtiT8r6Wonyf+pZue1/eOvmWY8vjGEZzPirclyc4gFIikOedrxT3EfqAsD3HD6CBs9alXGndA/QShSjAWkF0QZxcbC/Sr3/05AvumWaO8CwZzmCY8cfG1BhDyW6wo6q5Lj2/f3GbW063WwJw5fEMFj82P1KBZs/KZHkYQcoYIBXdwymqUik9+vBv8xVp0lw7GXnFfptfPVAwjdmKP1g91F6r0GHYxE4rjhaQKKJSqzIY1gsR9wOkIo4aRm4ZHwMDlnVpMTeHD8fii92RZ7y+Vt2bKyGdtzvNYPA8mDcjYHuwZiubEBHplBgBq1Dq3kaHyOZEg+H4ZJQu+bleHGrlLgstk050RUyRjvfi8vyBDq+/eZY4rhKBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(366004)(136003)(346002)(4326008)(8676002)(41300700001)(66476007)(66946007)(66556008)(8936002)(478600001)(186003)(5660300002)(86362001)(6486002)(31696002)(6512007)(6916009)(2616005)(6506007)(54906003)(53546011)(26005)(2906002)(83380400001)(316002)(38100700002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0xrRmtCSjdvQllmcnRKbXc0Zktwc3dRTis2bTQ5T3RMMkt3cGI0VE9HNUww?=
 =?utf-8?B?R1JxN2paOU44K21RMzNsb2QzL0xnSlBtMkRTOUlxNG5qQ2YraTROUnJjT1Vs?=
 =?utf-8?B?NlVnVUgrQnBPeWgzNi9ueHB4NlJTaWRKOStXNStnazBzaGZhS1p1UFQ2OXVG?=
 =?utf-8?B?R1FDVGo3TVZYSS9iTC9qWEROeDdKQmFiMi9hWTZ6TFRtSEZ2Ky8yeHV6NHNu?=
 =?utf-8?B?R0tTTWFzMlZERlVaTEpyN1BBYkpGbkJQOGh0UVZSc1Zsb052dm52eWFSa2Rt?=
 =?utf-8?B?Uk1NSGpBWGFaOCtmM0FvMERVUXVNT0M3cnRqWGFTSUlsakVuTUljaC81dm50?=
 =?utf-8?B?dnRxTUpIcXphdGN0Q3JHbFZROWhrWThEU1BCSHdINTZqT0E1NnRKS1IwaVhP?=
 =?utf-8?B?cTZ0T0lLRGZxV0FyUlYxaG85aWtwR2ZtdjFDRjVtaTZLczlRWFFwMzZITVNh?=
 =?utf-8?B?dkJadC8wVWNYcTNieC94OWhROGJ2OFhWVzA4KzZpclNnY08rMFc3dXRQelQ1?=
 =?utf-8?B?clpRa2VHUFJoMUFNMklvQnVRNnIrVGZXU3VkNUpqU3RtVHJ5bkE1MVZacThi?=
 =?utf-8?B?VFhVV3JoWW9lemlXWlhmY0R0WnVmTXlEUkNsb3FHY3JxOTd4RCsxR2luWGhP?=
 =?utf-8?B?dGVpMzR5bWxGUE5IQjFhQXY5S1VLT2NZZmZocUVaVUNKZU9RemVGbDJrUndx?=
 =?utf-8?B?T0U5aXJWelRNMzRjTVhlOE03SDN2bUZieXZzOEtuTWwzQjlyU1JBQm9naEd0?=
 =?utf-8?B?VUlrbFMwZFBYbGUrQlNzSXVDWnlvL2RVSmI5Q2pwdDBlMEZSK2ZMV2xSck9v?=
 =?utf-8?B?OEsrRVI3cFlBTU1SNEtzYk1zc3ZyOXNQK201dllrNDFFRGpIN0h3NnJPREYr?=
 =?utf-8?B?eTZZdC9yNnBlM0xGNGQ1MlVsbjZYY3F1azVjbXZQMzkwbEgzYlZyNmxUM2pF?=
 =?utf-8?B?QTkxT2FrcHo3cldRSUc5YlByMkU2TVU5ZmROdWtITlE3aWQzOFF4UFM2b0xG?=
 =?utf-8?B?MkpoOGRnR3JVRUpoeS9WODJJNEw3OVJxbXJ4TXpCTXF4UWNBN3VRR2c5L2VU?=
 =?utf-8?B?WHlsLzZoQnlOZjFoeTY3c1cwaGM0MTdibFVJZ0VQVFMxQ1NXbkdSbEhRend4?=
 =?utf-8?B?bVRJTVVpRDlycjFlR0FXZzFIcVhBQUdhSnJ5T29xdVZBT08wZThMSzFEV2NS?=
 =?utf-8?B?VDF2T3FaQytaQjNhdG5CK1g2L3BTYURydVFSbHdMaDRLc1NURHVjOU1qZTc4?=
 =?utf-8?B?Si9zYnJGc3d4SmZqMW1OUlQ5QjhiZ3c2UUQrMnFSTG5RUXk2RVY0MGZ6NGl4?=
 =?utf-8?B?a3NXc1Y2Rlk2TkJYdWRWMGhmd0RpaGZEWGUxTHdaQVhSV056bUhjUGFaN2sy?=
 =?utf-8?B?MDA3T1p1RFlnQ0xVcFk3NE55Yi81dkNTZE5FeGpZd0J4dnMxckNZRlpEcnhV?=
 =?utf-8?B?MnBwS01oeWkvVkxhK2d2MVA0a21DbTl1dE4ybGpJWFlrSEtSVEJ5VzV0ZXR3?=
 =?utf-8?B?bi81Yk1WeDBnMlJSUWRKZ0hDQnpwUmVtRHFQbHp4bXIxRHBHUHY2MTZpUTRQ?=
 =?utf-8?B?RG1YRml2V3Y3V2VUMXJPT1NRUGpxVmgzeklMM3luMGYzSWpqWlhQNTE5RG02?=
 =?utf-8?B?RXludEVVNTFyVGJPV1FHZjFwQjJ4M3hNc1VCS0FadEt4WmxReDVHSTlRNDVC?=
 =?utf-8?B?NjNWQVNUbHJhTU9MQWpkOXJsbi9DTHdTRTlhejFwNnI2S0J4TnZ3K3lWL3lr?=
 =?utf-8?B?eW1MUVg1dlU3bU5iNkRxTHZpdUtNcEpBbEF4UTAwc2NhUEZ0cXRQVFFaOEdq?=
 =?utf-8?B?aSt4ZnFvNFRZMWxUaHY5TjlEN2kzUS9Gcm1VWDJlaFN6U24rL1FJVG5zWjhL?=
 =?utf-8?B?K3lkVlBVd2QwdGVwa0RVcXVhZnZiKy9YUDduNzJKU0pnS0FBa1JDYXNERkFS?=
 =?utf-8?B?TDRMaW9jTHVzUnE4aUorQzRud3Y5cXhzd1MvWHZQamsySWZrZkd0WE9Vdzhm?=
 =?utf-8?B?TDFyLzgwb1ZiZlNqWkpVUG1GVFBGajhBdXFOblJNUUJNTFBkcS9RODZ4RDFE?=
 =?utf-8?B?NW44REw5S0E2TU1HaEtVMTA4K3ZmQXVnd2ZoelBlQXZDSEhBWk9jVjRpdEpT?=
 =?utf-8?Q?i7Mlwd20QhN32dSVeBnOsucTm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f3e2d6-36a9-41e9-0f8f-08da6fb4e049
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 09:46:27.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: be+QYab2PRwBwHMO71vFFAWBqWdpsibYIk0Qge1fkw1/B8U4F91AN45II6yyyk1LYB3CwmjrigGBArrV0SQUDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2761

On 27.07.2022 10:58, Oleksandr wrote:
> On 26.07.22 18:23, Jan Beulich wrote:
>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Reset the command register when assigning a PCI device to a guest:
>>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>>> after reset, but this might not be true for the guest as it needs
>>> to respect host's settings.
>>> For that reason, do not write 0 to the PCI_COMMAND register directly,
>>> but go through the corresponding emulation layer (cmd_write), which
>>> will take care about the actual bits written.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>> ---
>>> Since v6:
>>> - use cmd_write directly without introducing emulate_cmd_reg
>>> - update commit message with more description on all 0's in PCI_COMMAND
>> I agree with the change,
> 
> thanks, may I please ask can this be converted to some tag?

I could offer a R-b, but you've got one from Rahul already, so mine
won't buy you anything further. What you will need is a maintainer
ack, which imo isn't a priority since this is only patch 8 in a
series which itself depends on a further series likely continuing
to be controversial (didn't get there yet).

Jan

