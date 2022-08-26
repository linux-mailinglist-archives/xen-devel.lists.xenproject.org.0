Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219635A29FD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393947.633166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRad0-00011N-DU; Fri, 26 Aug 2022 14:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393947.633166; Fri, 26 Aug 2022 14:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRad0-0000yB-9I; Fri, 26 Aug 2022 14:48:10 +0000
Received: by outflank-mailman (input) for mailman id 393947;
 Fri, 26 Aug 2022 14:48:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRacz-0000y5-B6
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 14:48:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19391b8c-254e-11ed-9250-1f966e50362f;
 Fri, 26 Aug 2022 16:48:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2248.eurprd04.prod.outlook.com (2603:10a6:4:48::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Fri, 26 Aug
 2022 14:48:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:48:04 +0000
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
X-Inumbo-ID: 19391b8c-254e-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb3wH+Fr+/vqaRxE/WuuSTY/IPdtzarpCPpNMna2oDCbjD7JIhooc62Jqu1Fu6uhuIjyzhVaZiJytVQEhxQyhdmU600mQG7dFPQ1apPKzL2u31vxC0udFfQpAMYDW765pAGiOzDFT7NVrZ1Uw04SFy8sh/Q2CDhNPPP7z7HdNWMPCujEMU/izFyGtXXQXz05wOMKKXlBqeDB1Qz3ufpYXnV+ubR2BRoMmpjd2dY3g22HzTseNdVbcMLKBM9aItwQ5Nu4Ib9m6dsMC2dRBMHzJ4HSdOxe26q+p7Wv8ypKdIibZmGT3qOOSSY+EmI3a/5wIPC8ARpPQcwIYFF59amgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO9FGP/EYRfnfrVNrdFmXZmjyntIVXSBFVzAaIOAvaU=;
 b=SmtRQ05sFjnvPNw8knudp8AuyxNUy+q9qcn+mJ6FHlkR1gs6pCBYk/EkmDvpy19QXrT1afbGNF4o7DUdp6dtiHszTdiZFn0u/wbfDJMR2Ke9PxahFPII+C+yN7hE180BaGsVut82Ynj+7MSIrzTJi7ibR/5ImhVVnjSJjiiTMnxAHtSnDrLCCio6ZYLo9/tBZm/FVZMrhJdi2wSRPMvCHPlerODmVl34rey9jLwzx4suyUSq7o4i0M/3e2xINhXyMB/kRiUO+jULe+jJqupVC8Vz/oUs8FLoIQZcjttCmYXp+C/sMy0g80s0x2pnCQ/mdghfWDnY/y32moybUQlJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO9FGP/EYRfnfrVNrdFmXZmjyntIVXSBFVzAaIOAvaU=;
 b=ev/jJr0tg3CVkzvKDs/3DT3s520J9n7/pcKnalv282b7xJQawPG52TIUDyS6IP/8cfdN+IV09TNa+K7FLe+122LpIFsKAb1EEyu35xDGJd5wOVvlQKiwzK9cDVdB+sIUUxYVAggjJlgOvDbWo6xCUme7wW0vDUdoWvENmYfr1A1a87ed0wDj2DbKUw1CB5eky25Pkw0APSc8LpzCgMFXTY+/pMANEdB8BLVYBUNyhbGiKappnJ940/vFRDs1eEAIxmMeK4v30/LASftP5fpmi7DPMBQphcO1UvYyUXWEKcmT0oJ6pG+1hh9HpdJnHUfvXYhN0Z/hnE3kZxQZavUX1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <edbab1af-427b-b20f-2fb8-b1e196330089@suse.com>
Date: Fri, 26 Aug 2022 16:48:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 8/9] drivers/char: allow driving the rest of XHCI by a
 domain while Xen uses DbC
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
 <1e2e4177eecc1da762d519926fa206971a9997a0.1661181584.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1e2e4177eecc1da762d519926fa206971a9997a0.1661181584.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30450025-4d9a-46c6-e3da-08da8771fb7e
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2248:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lJciB3j/gN0QxNnRC0U7o2rVMMhzoFo73Y5wdzQMS1+0kk2+oeERaEedfhISqiem8/NpS+XkJpXn75cxKKfScnlzuY9KpVnyVskvaBIRCIkf6pRGHcJ0yfzucG4uy00G9Ow567045V2TOC/VKAYZEmtzMxfXDxtZthxWG7Q7mrBlkH4sFIgQubuEX+kyrzMohWWQrhkkQ3G87/y0Wm2qMd8G5RJy8d7vHqRkjrNdtOnFSpSIMlRnOrNrV14bFCLHJO22UkY1cKJTpAh7NeNAKBcCTLOhoeeOz20LpPnP+dqF48Xz+EEfHde99sMGVSB6DSXcTUZcasyf08AhsfZizVDzgEdJ5IO+tqGB6ZTSVcVVZeR2pxLbAcplzRnIe/pc9Qn4Qk0VwWUeAQmw/Fq57zN7XvWwPX00eV4InIveLT+edpMosqcdbZoUZFg5oykPnaAfNQQLzPYujjuTZ79vFqEpRv7dpyHyINbQ7ikQY6h0/wjFmietDPoS3/lYzUVUMFNDHaMcrXFxoZQQ8BSkRNgGx3vhSQZ954j+DrKn847CfYvl8tXMPVsU6whUd/OtdiVE9d+YbtPA8XlqKVmgPhdNiWYl7VwWe3psKVGB891CNySuS05NQh6ao265aD60NlMJSxaFhMZ6UUXYu31MOGf9d3Zy0uBBNgDjMH+DXuxSyVSGQvucIYYeTQcycTISoK05IB1WK+mFhVRb1A/c5DGo8O1PlQc80AveW3SOvG0j9zy1CNPWMzJibI5KquuyuS/9/nXOGD3crPfOgFxYWlyMjd6ELaWcrhZ2/k/mO5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(136003)(346002)(376002)(41300700001)(8936002)(66946007)(66556008)(66476007)(36756003)(6486002)(8676002)(31686004)(4326008)(478600001)(5660300002)(6916009)(54906003)(316002)(2906002)(31696002)(86362001)(2616005)(186003)(6512007)(26005)(6506007)(53546011)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejJURFRNWnVYY2xaclBZa2NZQ2xRUnoycGE4UzVSSWF1Y2ZRTnViQ0hmbnUv?=
 =?utf-8?B?Tm5BZFlYK3dnTklEcysrODBHTXRxSU5EbFhFVmczNmZDN2Jpa1RKRndpK0Iw?=
 =?utf-8?B?Y1NFdnBNVHdIQXhwRjZXMmV2UVdSaXZPZUxzcGJGdlNxclJZZEFDdU1kMXBN?=
 =?utf-8?B?RTBGekFSM3pMbTRvMm5oMDJIbUNLZEsxdFdYREcvc3N1UUR3WktoQ0ZPS2Qx?=
 =?utf-8?B?dGgxVTNpQ2pscE9CS2RrVGZ1VlllMW9nVkcxODBRakpqL3NlL01MVUkrNlBk?=
 =?utf-8?B?Ymtsb1loQ3BjcWwwazV6R0htVUNNNXJiaWh1NE5Ya1gvQ0NBTnFRSXg1VDJH?=
 =?utf-8?B?YWpGT1dNYzI1TkxEa3pPa3ZsNjRDOG1PeEFoQXNLRXpKekExVzdRejgzdDM1?=
 =?utf-8?B?aGZMS1lwc2NPUmVqc3o0RTh1ZDZwN29NZndRZks4bDBpUmVSNGFSV1VwamJK?=
 =?utf-8?B?cFFkUS96Qm9pWjRVR3gxWlNvVlBKbGJwS3ZXa0RCWVdncCtka1ljWkZZR2tx?=
 =?utf-8?B?NERBK2JIOUdyQ0ZzZEtpVjkzSkJ1SENtWGhKeXpMYmw4SmN4c0pFWDY2UmFq?=
 =?utf-8?B?bFAvZVlqZ0tmSmZqa0E5RngyS2lTNDByR3dLUjRhNmpaUG55Ti9Fb3FVTEtB?=
 =?utf-8?B?VXAzVnV3bCt2c1cvME9oLzNObUZzK2JVT0Rlam9ubFluQ3JNRDhSdzV0aFdE?=
 =?utf-8?B?OEZNY1dlbU4yQWtoSnJ6WGNjNDRaeDJlWUZGYXN3NU4zcmttU244NkdwcnVL?=
 =?utf-8?B?T0NUcWpCNjBPa1RzRFpaUFJ0M1VZOXJjQ3ZRWnZTZGxGbkw2cGxRK3JoWXpI?=
 =?utf-8?B?aXhsa1NGdHBxWGdmaTY0YVZZYlZOSXlLdkhEc05Gb21lK3JHUm04eHJTc3dN?=
 =?utf-8?B?WnlDMHdPOTE5ems2ajJjN1MzRk1zRGdHYUlhSnNRc3pGRnpwUnV6UEZNZlZ6?=
 =?utf-8?B?TUk2WUtTOVZHZVFCeFIwYmVMTGxjaUdnNXJGVlR3ajNSYVhTaFhxRDNYK2N3?=
 =?utf-8?B?RFRPUHpCdExhTk8xWnNpQUdQcEJJa2FNeXE5NDREdzIvSTRHdThlL1B4SUxD?=
 =?utf-8?B?UUpjbGZadTdZcCtZV3B6ZlkyVjA4UllzNDd6WGFwUjB3UUtmeHpsRWFVVnpY?=
 =?utf-8?B?WWg2UnBnSUtGQzIvQU5oNlpJemlCZlI5aDVZM3NzRHVZNUphRlU0cHJxWVhK?=
 =?utf-8?B?Ym0zSHdvUWJoVDB5djFxYVY5ZXVzUzhlZm1LbDFDL2ZDQk13WGlTNmdjT0hz?=
 =?utf-8?B?QUhkTDQ0MjAwV1pFU2lGY0pCaG0zR3dBU3lnR2ZTM0FpeDltak5FWEYwYk10?=
 =?utf-8?B?T2FieWg3eW0xcWVIdXFkV0hDc0VXN2xjWGtLc20zVU83QnFWWFNaaEhIVFYr?=
 =?utf-8?B?MThySVcxN3NPbTl6V0cvdWpzMnhUSitFQlVvNnQxOG04eXNuTlBqZXQ2d0Za?=
 =?utf-8?B?UVRoc0tURVZkMkwzM29XTGdCQmJYU0xGZ1dtbS80eXk3amFOK2w2eHZDTU5j?=
 =?utf-8?B?a0NndkRSTVNaaHZQU0NwTkZtTDBLM2hQNmt6QWdjQit3cnZhQmdyQU9ZVUxO?=
 =?utf-8?B?UHpQdnArbGJmdk1GMk1IemwzMFFMNzhoU3JoY04veU5SQnBabkpZd3lWNldo?=
 =?utf-8?B?OXh3VG1kK21oc3piYTBGeW52SG85M0NjbFh5ZEJreDhEU3VYaDZPaCtMdUNG?=
 =?utf-8?B?NEZVZ25yT05YUmVMWndWdEdLOTBuUzRvTXh3LzBva2xJZ3hPcCtncHN5OW5i?=
 =?utf-8?B?TlNuUkxMSUdDdVVtVURwdFFPYW9Ia3MzSDNjWHhHVjNMc1VVMkFFQ2NkNTFi?=
 =?utf-8?B?TlRmV1hjZ282NmNQeHJiRDVOREZyVXZGQ1lUYnIweldzS0M2QjJSRGkxL2Ir?=
 =?utf-8?B?UTB3SWliZEhpMGhTaUxFTm9wQVJkSzljK1IvdVNVbG95enBreXRDNlVBNWl4?=
 =?utf-8?B?TDRZVndvbG5pYzVrbEordThndVFTNnJFSURrcVdYWnNSc3B2WWlrU1VRZWNU?=
 =?utf-8?B?SXFUNkNxcHVsZmlsakJYL3JZTGxCYlJMZjgrL3NyRDl6T0hjVmZqTzNuTXR2?=
 =?utf-8?B?S25oZ1VtMEYzYTA3RzJvNWNvNTc2ckVEcDg5RTQvaDlXY0FoKzBQZDZIbUZk?=
 =?utf-8?Q?X85QgjfnYZRhJI21gU3eJEBQw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30450025-4d9a-46c6-e3da-08da8771fb7e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 14:48:04.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOkH3SPDjEKv0W/9f7g8um4Opsh92DqnRhjA8MGjCnTBoVVa4F2jaZQJrWyeY29pI/JXkL/qcfizuxcQ0VpihQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2248

On 22.08.2022 17:27, Marek Marczykowski-Górecki wrote:
> That's possible, because the capability was designed specifically to
> allow separate driver handle it, in parallel to unmodified xhci driver
> (separate set of registers, pretending the port is "disconnected" for
> the main xhci driver etc). It works with Linux dom0, although requires
> an awful hack - re-enabling bus mastering behind dom0's backs.
> Linux driver does similar thing - see
> drivers/usb/early/xhci-dbc.c:xdbc_handle_events().
> 
> When controller sharing is enabled in kconfig (option marked as
> experimental), dom0 is allowed to use the controller even if Xen uses it
> for debug console. Additionally, option `dbgp=xhci,share=` is available
> to either prevent even dom0 from using it (`no` value), or allow any
> domain using it (`any` value).
> 
> In any case, to avoid Linux messing with the DbC, mark this MMIO area as
> read-only. This might cause issues for Linux's driver (if it tries to
> write something on the same page - like anoter xcap), but makes Xen's
> use safe. In practice, as of Linux 5.18, it seems to work without
> issues.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


