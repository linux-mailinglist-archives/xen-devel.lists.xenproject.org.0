Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4A7CF3F9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619041.963551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPGN-00068K-1a; Thu, 19 Oct 2023 09:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619041.963551; Thu, 19 Oct 2023 09:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPGM-00065f-UJ; Thu, 19 Oct 2023 09:24:18 +0000
Received: by outflank-mailman (input) for mailman id 619041;
 Thu, 19 Oct 2023 09:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPGL-00063m-37
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:24:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4543ba6c-6e61-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:24:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8547.eurprd04.prod.outlook.com (2603:10a6:20b:422::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 09:24:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:24:13 +0000
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
X-Inumbo-ID: 4543ba6c-6e61-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ig8k42ZffjCqz1XcRFj5N5yCfok+v9F5Qf8DCEi8tKgjMuSs+QDK+xFPy0AKO/8pDjv6mDpZCt6dPdVz08UH4OKdrQOTbCc98c/OfOOgcS48T+T0zjrlV66b2H+4+VbiQzOE064aWMVLam3jrZepRXsd76YdVHha1NSpw0npFbHYJ3MZAZWXy8IR34AT6fIz0H3TTNTh1N04jPqvVFz0WKRI1KtCgAOir8+KqJIPed77aa2unQZmbdY97YdQNReegkxyDDDQaNrxzKKU86WfIRl8jqETK9Pstmdi5bfSOi8FbOI0M1QyP+DyG9AUJchmTbl88VToH/acGynELUwkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksjN5UzqeLpxmqsO7kTlYPHjsTqWmkDQgwFba+UfPhs=;
 b=ctTnEQNZs61hi06KDhCrtC7LvB9zx73Gma9xpP+jCFw1mVWyygAb35La4AxEFsIWD9NWv7LA/JJNeHtyswWNsOP4xwKBCgIWXXU2OKThahX/IJzhzIFK691OOnJPdDb+2ZvNxCsXLdbhlu+YNvKkZlbu/N0Qd/W9P57uIBZIC7i7Ev1IELUi/OLNa7qhGPoYIjVC541UlhyRE+9ozecnwoMKfdioTrbVt9jZV3d/D68vQeu/h8++0PbWavLee4JEb9rWSqmyPbsUwHo5/u8FEKO9zndx+d4ObpVhw4PW2SSHLI23SmDQCR2rWsQdYIbeiUo5Mws3ABi50ddbKTGHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksjN5UzqeLpxmqsO7kTlYPHjsTqWmkDQgwFba+UfPhs=;
 b=unpUEs/OuBxHuHFgsXcXoNpZVTHlwvtC0b+RT+pI0R1JmGXigHjOMPxbllaKfOUwyUKNrknbjQgg4cBFgngiaDh32fOw7x2eos4gsUepHcCQ++CYf0xtUX6sqU/ZqTV6lWPR8E5QieoTc/eXYPifWObvYuy9C+PvpON8G2XqRF4g4Q154JE+kn3K4/ERZP+Nh7gMU6BuFd919S8TzpvFFF1hAmrAPvFvgdhkNbdUWpXGOLou5r45Zfbn2wi/BKl5adLzL79hmVaZTVRQ3s/AaKRwrxRYXsct6BjJ839vsEL8/FAug1tzEwAilduVXHe+xlZ6FXDH0z5cQ+jzzz0VQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7293722-c708-947f-19ab-6c3b753f6dda@suse.com>
Date: Thu, 19 Oct 2023 11:24:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 08/29] xen/asm-generic: introduce stub hypercall.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <bd57ae1fd448b7d2f4188ff705bb5f537ac48521.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd57ae1fd448b7d2f4188ff705bb5f537ac48521.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: d541342b-444b-4f75-98c2-08dbd0852872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tz46be0w5X81S8FiqHeuEGEkhEXVx2vPqFZdqtYXg1GRNAYasFWRGrdoGb5Z3jHhbrN7PpAiaOPPj1SbkcR6Q8Nhi3ycu5NtCvEn/sWufB6bSNn4LjjjhmnsriIneXeBFYzSHn1BrNs6W4SzcIjjJsLkYwvZ1nsX8c0642ilBgJ1WljHegDCHFcNZ9Q1KrSb4hyriGwQaCOLwsViTWXhAzFY9+W9iBMLqxcGbetpu7aCPoK5xFVMrXAk5A0TaMz++IE3IFWdt4MYKlogkpvLYaXrbGUmNSdf697UbNRvDod2HM9FeIL9BkZfqFb5YiHlEnx4JIkWNRIiXdpOE33Cl1KwVc9NgqJo43snDtH1v1EjdujCOKg5eMHSMLamsfobmXVZdxjJKCVblhVs9ju3cwEnbthrfLv4J1fcGSE5ja1BfZjThgxQQmumE/rESGBJlvkQXlQRG9SSr3B+0mL5MAFhcU7+BHpS2DPlUM+lULLjnn7ZWNrwq0sNWOFEnqjQL3eAPsYy326UUg2hUcMfAi20692QgFjEuXFe4pK0bTSQ+69RRi0tq2FU3Ne2mTZKzR8cw9VxLbfM86GYlN1/VVs7p7PDbx1pqSgbavred0R4Wt1//5yF9KqV23UkD3lIwInpvIe4J+6shbqaZ6Vwk5oQ6Tt09BD3iUncj6gTzfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2616005)(26005)(31686004)(41300700001)(53546011)(6506007)(6512007)(38100700002)(478600001)(6486002)(316002)(6916009)(54906003)(66556008)(66946007)(66476007)(5660300002)(4744005)(86362001)(31696002)(36756003)(4326008)(8676002)(8936002)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm5RZllCK1ExRVcyeHI2a2N2V3A4REdGWldFdTB6YXBpbTRiNTZKc2NWaXJU?=
 =?utf-8?B?czdQODBVRzJvWlQxQ1lIOENxUkp1UGV2WEZiRFE3UXB4STBWUkd3KzFuMjNx?=
 =?utf-8?B?QmlZNEdUSElEQjZvNEdyV3NRanMyalhZeURWTmpkNW8rR0hZckw0V1RuS3FG?=
 =?utf-8?B?bHVoVU13WEJQQ3hpQ0QvZnpwWjZNc0ZsbmdwcFlwSmI0cURRWEVJaTF0QWkx?=
 =?utf-8?B?NG5IY2VzS1VkT3k0c1pqZVYzY0MyaHE1d1dwUk1zMzdCS0R3aDNvYUtRUXJx?=
 =?utf-8?B?Q3FxVE5yZTdYWHRrbDZMSjVFTTY3MHR3bVNQamxjM21xNVJyNk9lUUVmSkk5?=
 =?utf-8?B?Q3ZQb0Z1WmZDVm15UDh3ZjBJQVR4R1d6czFFVytWclVBeDJvOFdKc1JVdUtT?=
 =?utf-8?B?SjBrZndWRjRvQitDaW1GbUdlZnlWcllyR3FHWU50aTdqa1lmOFM1MElUSXRm?=
 =?utf-8?B?QW9TRFhHbFJ4M3dhZTJnUWNWazd4ekJOblUvcEFhZ3NtQmFpeGNiTEpGaVNL?=
 =?utf-8?B?MTVmU3RaZjhZd09OYnZLVGt6SXV4eHI0ZlJxOTFYRFV0bkc1S09jVExkc2FX?=
 =?utf-8?B?MTc4MlhGMVIxdlBJcDhkNGVKdDJENlNNRlZLRnNtUzh5TFJjMHJKSThHVngv?=
 =?utf-8?B?WWRGNEdVNHFxdVpVeDhkMUo1TnZwdmtGMWdkaElzVHZWRGlZbUNhYmJSMDd4?=
 =?utf-8?B?dDE4SkxTQmRiN3QzdzVVTlhVZm52Zlc0QnBqODhWQm9rYkxJQlVrVm5ENzNE?=
 =?utf-8?B?OEpKZDdqK0ZJZVhLbEFtQmdtS0pNNjQ5TldVOUJmNFFoa3J4UnFOb1QxTFdB?=
 =?utf-8?B?dEhhdVg0YkpmSWFlSTFEYjdXckFaZk9DcGNkNVROaVc0VGJtVmY0V3BRQ05F?=
 =?utf-8?B?YlJJait5WjUvdWVHZFpJa1I3ZjI3M0VGVDZOOTVGRWo3N1BUVUtyVFlWbTBv?=
 =?utf-8?B?UWtmQ01NaHN5ZkQxOEJGcXhFNHdFSnorSFhPdFNEQ2lmVkRUajNqNlc0NnVn?=
 =?utf-8?B?TGFsd2hGVWZ2ZFoxQTY4ODFJYm96T3pHRGtmMG5WUDJKR3JBMEtTSkUwYThh?=
 =?utf-8?B?YmpnbFIrMHlFNjBYcGJ6U0d6TytPaTkwVXlkbzBoYnh1OEY2MkhVMURqQnly?=
 =?utf-8?B?Z2tSWjFjZ2JBaWZTL1FxVDhVUE96QS9KWDYzb3pyMnl3V0hwRkN6RmlKbWVR?=
 =?utf-8?B?L256Sk0xRUxlNFpkUnN0VGZBYkpLUElrVjUwakFmVlNYN3FYUGFZcFVsK1hH?=
 =?utf-8?B?cnVZemV1ZlBUUkFjdDVpY2RKNXA5cFlSNC9CdFFnTy8yNmNQbmcyRjhCYk5N?=
 =?utf-8?B?WGpjazJsTHNpT0g1L0lMczE5TkJLZUZYUURURXgxR25rZHNMMzRzRlRrM0Fs?=
 =?utf-8?B?aDNJL3dOdTBpNnpycDZtTlMybXdMY0xqK25sVEtmQjZWclVxQmc5OUVRdnNB?=
 =?utf-8?B?ZWUyZ0EyTTRoUGhIWEcyVk1odnNqTDk5NTh6WWE1OE9xYTExdjJWVnE2RHla?=
 =?utf-8?B?WUVNcDVMemd5bUVPU2JPZ3c3SHp1UG01dE1uYnlVV1cvNnVNNW11MTVBN1g3?=
 =?utf-8?B?eHZNZlVTRERXLy9jQ2JPeEovd09yRUpZSDYzM1A2bHd5RXBZSGRoSXcxMjZ1?=
 =?utf-8?B?MVl4WFhPMXp5R3JRYWZQZHBXUGtlM2JBby9NcTRaRmNsbno1aVU1SFp0NTJH?=
 =?utf-8?B?VUl0UVZ6Q0IzSlM4ZEtTQ1c2ZGQrd0N4dExwV3N4NHFoZWZjVjNKUHpaRTla?=
 =?utf-8?B?NlVKNHZNRUF0RXo3cURydG9sVEY2R0Vaa0lxMm5XNXl5TVovVkhoeHdyVEEx?=
 =?utf-8?B?Mjl3b01CMkg4TEtmV1NvOFVldFlCRGhRU1FyelVycDhtYXBZTjAreWFockNh?=
 =?utf-8?B?RHlydDBHM1o1N3puOWZueSt6UCtaQXVUZ3Q2Skp2cWFIWWFWMmp2L2VEQkRa?=
 =?utf-8?B?SGo3b0RXMWlrTi9qVjNJRlppbVkxQkJNUlFXeVd2ejF0Qks5emNXOGtxekVx?=
 =?utf-8?B?UGU0M01pZkdHUDNXWXM5cHpFRmNjQkNac0RCcnhWVWllTTYwSU4vbEJkZDJ1?=
 =?utf-8?B?Zlh5WVQ3UVhtZlZQNXQ5UGRhQ1JVR1VEcVdHQnc2Zzd3TWxEa0FxcGtxNHhH?=
 =?utf-8?Q?t/e8KkNeO8aGuZg+Ssc231+8v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d541342b-444b-4f75-98c2-08dbd0852872
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:24:13.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNYq4gJ5AQlIpEggNp+goMv9YH9v+ZH1EF00mriKiiWBUVLJaBZwI8AUmD8LX1XHR+BfQmRdJPTjgO4chIQH6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8547

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/hypercall.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_HYPERCALL_H__
> +#define __ASM_GENERIC_HYPERCALL_H__
> +
> +#endif /* __ASM_GENERIC_HYPERCALL_H__ */

This lacks the "should not be included directly" guard that x86 and Arm
headers have.

Jan


