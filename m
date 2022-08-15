Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743D592F41
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387439.623665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZfx-0007ks-2H; Mon, 15 Aug 2022 12:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387439.623665; Mon, 15 Aug 2022 12:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZfw-0007j3-V8; Mon, 15 Aug 2022 12:58:36 +0000
Received: by outflank-mailman (input) for mailman id 387439;
 Mon, 15 Aug 2022 12:58:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNZfw-0007iw-AW
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:58:36 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8dd172c-1c99-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 14:58:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4148.eurprd04.prod.outlook.com (2603:10a6:208:5f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 12:58:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 12:58:32 +0000
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
X-Inumbo-ID: f8dd172c-1c99-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjXs6+H19rxyGafd4grHG4aMnEXq0IBICN+a0MXlqThBePPUFW6B+bswFQJ9hpa41VCNuHbBTjf6vA6EIeotQNThSW3/+hpVcZl1gfM1fC9GLTXCtiDQn5GlNpMaINi/ynEiKAcZOLqEKXr5+cKvHSLhEkOMDf/IxTMATfU9HDsUiVmdjepf2g5khWF2tMq/dZXEssxk3WnGuGXoUix2T89NByZUtifc7w+TNR3HnmicmHXErW6nV5k1RmnZPN5X9pRSWBIMVsogSZuTGwRq5F8yBfB4WEyPXhJGMmMiXBnbgJXjmoEO7hzOehy+NymmsYLRxNzQJjjDtiJv84wPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mB8d9Pp9S8PVTNL3C/vBJjYZXHU6qfqdKwNKoJJCFm0=;
 b=d2+hZOwgioiR1eE/dqC8HX6HfoQl8jmGfGnreNAUwbf182dJTVAf1e1v8VEPvMPPhKCGyH7RTXfZ4/FwyEnsxrWKHWlhVxFXkdmuGJGryUiJVeLCtCATpMNybY9WGTfs/M/gfK/4S7yV5NHIaLK/u0oaQLS7Kbz+4lc/VoxwOMbIBVRrVOlojuDtN686p8bWH3HRnwIrnwYqCH58GNRjJgwb7ZPEmwR2I1Eij42bjgtJoXwTx0hWH46uMIrxefXsbbgCYfmWh00vOjBhfKaOFOa4uKVWWbibKImJ3i9pfU6odhJazG670vlRVH80T2ZeNLLwpNDpSZgoxcu1/mhWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mB8d9Pp9S8PVTNL3C/vBJjYZXHU6qfqdKwNKoJJCFm0=;
 b=HKE08rP09laQb1UddLpSZV/duC3bzfNNTXXqptn14K9fcJb//CXbZh6Senr2j7yZ8MsBiYcMyt2/vUiqdTV9vulPahsjYh8dvo8YD1k0/OfWIGiwsrxN/mSXaz3tRPr0bEnoXKl0hLodaIvWy6ibYOGN+Zo/OZYnLEL/ke0MXMKDAuwSbA7TXF5KH8R0vx9O//EyaNABlWJxypTEldo7NJOklwdxc70s/oJq8AoG5Dns3XXW8mkV2/VH+WnRCPw8tSye2S3P2dBKMkdEA+oOLPdCIYQhgYhz+CtfLDFPlSxLBrd2Rh4mHQvDiBYIbAvCPAaMqwixa9m5vwkBsWb4nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04e863fd-edff-ddc5-6e7e-4d192a7bd7dd@suse.com>
Date: Mon, 15 Aug 2022 14:58:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 01/11] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
 <19c0f6f6b735fbea747f9744fe1f998242fe6d9e.1660354597.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19c0f6f6b735fbea747f9744fe1f998242fe6d9e.1660354597.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0076.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3817b54b-a7df-4596-10ff-08da7ebddbc1
X-MS-TrafficTypeDiagnostic: AM0PR04MB4148:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qc2bfVxmsgudbIXPbg1xL3RuvdWs/5RqxvMp3gQB3bJA8pfEUlj/1YJHaVZVEQ5HCHoMFeaV/ZD4zXh2Gz/dGFTEKV6c9xHQQ9LrRAd/NhY7ZFG+eS8P+LDeRAP5cOEkxNZhIwOouPaSyskxOdp0GCdTrqMeZExvrnq0zkpxyPWTR/AKrtueKbMuLZI4PqC6WPDYN3Vwlpi0MBXegojWyEbWghTIeHJebXVw9HTGvFBH+Hjd1orLpNc6NwiUPXH+xJcp6NzfcRQiUYF34/1+8MSFyfdZ4TbWDT/Vsl84fRqIOzlTjO8NWGZWeoZIkFCkm92RgPh8QfzDdk3IwT7kogkfHD5YR1SDkihlJjg8EawLnWwMaqJYxI9rkdngsIJiS6vWT6oieoMJESxr9sS7V0Ktag+CLm63th8bGKjH+YDwC69EgUwyjBRhs3AQ+czADNlQCJfWUoMqai9JGpvE6LQ/ti+7S25lfrtVNZb4e7FNXxjypKxCicK/ap09WIUSH/fisJ9fYCD9vyBTc5pgTKzLT4nC17aR3NIegrEvWrnDdHWmWAdixWnHa1riV0ZwbPa6k/KGqMjUQOcSNjUzKHjhYdv6p/PfKQq4xEGZ5xuQw5fVt9Bk2b58LGgbPnXTeWBfcPSYhvUC/w7Pb0HcLM1GRleTmUJIffK1uBFrJcPbGOQnLoIWIaGJZoFzGP4OvhPU1pkQo1MWujTTryL9Esa7I7qPINX706+Snm4wq7Ps9wjlXIK2eqxWuxR2VjB21uCl/QgIFmFhZLRPUKS6KoFOF8akIHJEc/zOIodd91p7+KmaMjvA06PSrb/3QFgRlFJ+NJY9wzZX4wfehCZEsAOEuyV3ymuLu+sMSOOcqcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(346002)(136003)(366004)(41300700001)(316002)(6916009)(966005)(6486002)(54906003)(478600001)(4326008)(2906002)(66946007)(66476007)(8676002)(66556008)(8936002)(5660300002)(31686004)(86362001)(31696002)(83380400001)(36756003)(6506007)(66574015)(186003)(2616005)(38100700002)(6512007)(53546011)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9pNmdLTUlyY0tYV0MyY1B1VVdzYzdVSndpVmhQejdNZk1jekt2V3d5R0Jx?=
 =?utf-8?B?SW1hR0VyakNFMFNkWHlnT3JaeTZKTnU5ekdxMytOa3hFKzhZS0wrT1d6blM1?=
 =?utf-8?B?RzVySWR4dXF4YzNvcDNFVithKzJTUTBnNGNIbjBvUFFLb3RabFVFMmVwd2Fh?=
 =?utf-8?B?dDJkZm1LQ3ZXRjVqazdSMy9oZUJKTURXZlNzczNGdEx1azNEK2FyVHZrdXRT?=
 =?utf-8?B?TThNaDJtSUd2dzBzOEhSaXg4M1k2emRQQVhhSzc5ZCtlUVFoWWpaY1RmNU9p?=
 =?utf-8?B?cU1LVFBwYjc3N0pxSTlWc01EMUI3MVd1VktkRGRjSjg4NXFTWFJYZlNtMzBr?=
 =?utf-8?B?RWxjak9iYkhmMHVTblRpUmEza2RqZnZreENmSXhXazliWnBQM0tCdVIyWVpF?=
 =?utf-8?B?WEwydlp5cXpDK3Z6Q2J0TWd0Y3BsUUQrM2Z1Q2lYc1lVWmp0dEhjUW5saEVT?=
 =?utf-8?B?Uk1wdVhyNW85UDVLRjgyb2FVaCsrSm9OM2pxR3A2ZFJJenREQmhyOHYwbnUw?=
 =?utf-8?B?bVhZNUNodDl6bU9jZjlDd3czUllaT0xoOUhKbzF0dE4wL2p0eXNVRlFRS2kr?=
 =?utf-8?B?Z3RzL2VaQzFMRnJJY3JlS09uWjMxWlZwVDR4Zm9BWHZad0QweGJMS1dXR29y?=
 =?utf-8?B?UlJaZXZXZXZjQWIzRXBVdWs1WWtsWDlwM0VsUW55VzNBNEQzcmRMS09oNXk2?=
 =?utf-8?B?aDN6NTZLN054SGFFK0Jkd0Y3WnNMbkUrb2l1QUd1dC9VOG1BTks5Q010UFho?=
 =?utf-8?B?T0JSLzJQMUEwN2h4QnFDOFNJV2I4OCt0Lyt3UFBZRjdGT2Rlem90ZVNmMGJw?=
 =?utf-8?B?VjE0T2NYUVE4NmZ2eSs1SWZqdHNlcVNKa0l4eEVVcTVMYVFBUmlFOHdLcWFV?=
 =?utf-8?B?eldzK1BqS0NBdTd2U04zbkVzQ0Z4Z2ZQUTJJWVlmSElpMEF2Tzk0eGRPYUU5?=
 =?utf-8?B?MlpqUjVVeDg0VDRVNm14VThrY0JRdVQ5bkZqb01ndDF1Y2I5Q0dtbVJHb0VL?=
 =?utf-8?B?TVQzL0Q3L001dHBqNlNTaUowYk4wRTRlYzM4MzdkaUcvaHViRDVZVGE5WXcx?=
 =?utf-8?B?WVFtcENyRkJkd2t4dXBVVGpaZXNZQ01yVjRxemRSRzZLNDhqcndNeDRNckNW?=
 =?utf-8?B?Z2ppSDFtNjYzQSt1YjEzMTUveEJaSzBlQjZ4RHphaFdEMVFUUklYeHBxREk5?=
 =?utf-8?B?VHVybWtWZHFSZHJwL2J2ck1YbHdadS9na21JUXo4cjJBYzYrZG9saEJIczU2?=
 =?utf-8?B?M1F6N21xdjF0M2tTUjlOVUxYVnRuVUZYM1N1SjJxMjZaVDJUZ0p2c1FGeCsy?=
 =?utf-8?B?NGkvdENPcnRDNXptQlV5cEtrckl3Tml2Y2RvZE9MMlBKb1VKM1BDaVFDSUNv?=
 =?utf-8?B?M3l6WHJWK2pzK1dnTXMrM2pCbUVBN3pEL0hUaHZEL1owd2dyKzhUZWNMR0xD?=
 =?utf-8?B?Q01adWtSMkxBOWhEbkgwdHVza2VSa2VHeXpPNGJBM2Y3cUdYV2dyNWhsTXpF?=
 =?utf-8?B?ZnU1NXVta0RMeDBmOHRnSW1mZ3VkZGFVcnhrVVExYm84UEVFbTFsbjBQZTB1?=
 =?utf-8?B?a0E4L3drMW01VkFDTTF5bm53dUxIVFowSnJCcXV4QTRSUTN0RG9tbExpWVZI?=
 =?utf-8?B?UHJZKzhwQVhGN1VyM1pHSTZqc0c4R05wcW5Mb1lVZ1ZpTXh4S1ZNY093S20r?=
 =?utf-8?B?bXNCVDFMazdyMmNIVG1mNGZCQUlJUGtsTlFSNHhzUSt2ZFpDRjUzc2Y3NlJ4?=
 =?utf-8?B?eEJ3ellGYmIrYzJvK0EvNlJ4blU4K0RKdUFydFZZaHMyTXB3dUl6d0s2bnJm?=
 =?utf-8?B?ejY2RTkwRytGcFpJVEtudUpJczZ6bm1NNGFBc2xEQlc1S1lOS1MyL1l6NURk?=
 =?utf-8?B?Q3VFMFlmbW9rUzRjMVI1Z3dnT0Fndjc4L05wUFJlNXFnMVlwb05UQWkzU0dD?=
 =?utf-8?B?WWk5Wll1MW80aFhOdGc1ZkFGelF3SGlRQnRETXJiREYwMEJOVkRHa085N3hE?=
 =?utf-8?B?RjhZVTNYYWNjQlc1dHpXc3cvMUpXZzlEd25kWkMrRzVZZys5N01zT3I5ZWl4?=
 =?utf-8?B?NGpoQUYxVHB4b2szVmMyOWxGdFpJTzlsVmZIT0d6QzJOM2RIUjgxM3hkYVBZ?=
 =?utf-8?Q?0vIgmPiszSrdtljcKVRlqLWeo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3817b54b-a7df-4596-10ff-08da7ebddbc1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 12:58:32.8378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tFMZ69sYyOAGEW7x682wakdH4ElOFyA5cnK56ix2Nlvi9+qi23l+izjEUSPo50Q4kg/K9dk439Bt1I+TYL4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4148

On 13.08.2022 03:38, Marek Marczykowski-Górecki wrote:
> From: Connor Davis <davisc@ainfosec.com>
> 
> [Connor]
> Xue is a cross-platform USB 3 debugger that drives the Debug
> Capability (DbC) of xHCI-compliant host controllers. This patch
> implements the operations needed for xue to initialize the host
> controller's DbC and communicate with it. It also implements a struct
> uart_driver that uses xue as a backend. Note that only target -> host
> communication is supported for now. To use Xue as a console, add
> 'console=dbgp dbgp=xhci' to the command line.
> 
> [Marek]
> The Xue driver is taken from https://github.com/connojd/xue and heavily
> refactored to fit into Xen code base. Major changes include:
> - rename to xhci_dbc
> - drop support for non-Xen systems
> - drop xue_ops abstraction
> - use Xen's native helper functions for PCI access
> - move all the code to xue.c, drop "inline"
> - build for x86 only
> - annotate functions with cf_check
> - adjust for Xen's code style
> 
> At this stage, only the first xHCI is considered, and only output is
> supported. Later patches add support for choosing specific device, and
> input handling.
> The driver is initiallized before memory allocator works, so all the
> transfer buffers (about 230KiB of them) are allocated statically and will
> use memory even if XUE console is not selected. The driver can be
> disabled build time to reclaim this memory.
> Most of this memory is shared with the controller via DMA. Later patch
> will adjust structures placement to avoid anything else to be placed on
> those DMA-reachable pages. This also means str_buf cannot use static
> initializer, without reserving (at least) a whole page page in .data (or
> more, when combined with other structures).

While I still don't buy that the strings used here can't live next to
other string literals, ...

> Signed-off-by: Connor Davis <davisc@ainfosec.com>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

