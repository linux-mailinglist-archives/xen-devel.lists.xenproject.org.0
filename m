Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACBA694664
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494443.764501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYKr-0001NQ-SN; Mon, 13 Feb 2023 12:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494443.764501; Mon, 13 Feb 2023 12:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYKr-0001L4-Pf; Mon, 13 Feb 2023 12:53:33 +0000
Received: by outflank-mailman (input) for mailman id 494443;
 Mon, 13 Feb 2023 12:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYKp-0001Kw-PF
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:53:31 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe12::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6948b137-ab9d-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 13:53:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9106.eurprd04.prod.outlook.com (2603:10a6:102:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Mon, 13 Feb
 2023 12:53:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 12:53:26 +0000
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
X-Inumbo-ID: 6948b137-ab9d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0QgDoc/w891Cq03qRPvBg2l/GSWrsSGUKXFcIsXP0lzPPOiGTHq0JOo0I7wYEBV7HPGXW90dEved3sI7+QUOadLJ7fyhNFQ+5xg4pL6FzmCeS7gu9YwSkUwMo0vACG/GuU7W2tphQxy5t49d+hKHsYGRU4CKg+GwyBtmTb1OojFXzy+tgIQgQeX82QJyBRvJUaikroYX0ouWIHDqJXJ+fMOPk6vxk+pTdZMwXOqaLjvrBfizJGRq6GTbUm8DbozeH6jIa5Moiuq4rI6qb8659WGaYCPc6JKfj55PKSMocPw3CacUuNoAojPxSUYLzgpkutQbA5u/GVo1Ty4FsVdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRQYmSh87Vw1h0q4Ice6jdtJ4Wzz8tkJkUXxp6vtqcQ=;
 b=h5ztjPg0+bYTj+pOToTA1wReaelII+dllmkCXbDe4Z3mMDAbU2Qjt9jlEpgxUU82UhoJyQOFFDRX3qHyGqgYHhnjyemKx8K97FxlVvFcWwsbTFiL7kg66/LsyLqPJFywJ5I7MWGRVjKcea76O3B296fJJN7BLvu822wEtd7MJ8jwW13i9uj20XbPo6tVQqwSaFHpPuzRgg7UhDvgGRNwUWSBUpsOPHSJmFPA3kvr5apMx26yPCJVDBFBngCkn4qwOXIFoQ6Fz7YiVdcEcXlAUQnIKxBzOOZ8MgDh4XoE39+8pkcIQ90CZARJ/PMzNpJ4z50rtD65Km7mFly8HnMbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRQYmSh87Vw1h0q4Ice6jdtJ4Wzz8tkJkUXxp6vtqcQ=;
 b=JeudmUTpgIl9wo4UNQhQIHOgcowW/Ll7IGeZhBcUh1msXS6JWtjxoQRliXkQ9xUUW61owzPfHj0HPt98uB/nzgXUk6P6v7M7ZJWGamqkqgqHQEaJfnrBLeePfGbiZO1TUg6WiHc80Tu087OOnnqrlGnrp5eZbOKnFXMLMkfApXtPD9UebX34Fp4ya0Z1AOGHastVPoIE01Xdu+7TYnzS364n6TlxwlggmdIfDfVkfRQFEwCmYPm0heS+forHpe+VZa4EkRjgb/bbsffyK/f/gkb1CoPZDsuUUIgnLWEUWQcxPshOipilEZHTZd+7u/RqG8Nxv5Vzosg0eDvVcuFQIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e4e8000-9e2d-6e43-df7d-9a34a75b7163@suse.com>
Date: Mon, 13 Feb 2023 13:53:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: xen (multiboot) binary gets corrupted ELF notes
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <Y+obpe5nnLybL/8y@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+obpe5nnLybL/8y@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cff414d-2412-48f2-5330-08db0dc14a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FHY2uW7xhoHjxflRAVWRfViXTfdZvQmm9WFAe3feIAbd0XCCRXxDelZJ0PJXieLt7/oLZlt1/iVQjg0bwlRh9vQ1HEngqMnT7BCPn6bBHUbNryy94rGR1rm3yyTJ7njG8ouOK0a1577LaECfPy+fc5fRRfeCKU/YVKkqDq2nmKj/h4TchO+9QoJCD4l+G1rip/n0KjRfVHtZqcnmB7VcsEMOp5FtS1h2MuFWSHVQwOoDn5IhiQnygTpLD1Z8NEquzC4XXg8/ZiTm9rxeEqss7x73q48p/6HAGz6Ytm5iY7aXmjESPqX/zul1uHjR4/y3JPzMU0Eb3MB3/Y4/f07LbPnt+Opk2KdW2NroZjiHpf/XELM0Or9udhR89dliJbbMIjw6JL7R1GRENqdUD5iUOHy8DwXVtXC0SyBsQmAuRntYU1MvVEUWxydr4nNIthx0knnnLcsm+WBz94ofBvHy+ZHao+Wta+legQZHFRr0GYOnxGF7dDzyDHfVx/x6k7cXp1OIbzywYsJIVm2XvK2QsfcID0cQgU6N8mcksyzOu55f7t8K0Nu+qy2GgUefKQ3KS7NYdvZ0AFHPjzj4VHXdgB1Hb/O5SLICTszolF361iiMoqeAFAKreCy93/vaa9EtDkro9JJmdiZje2zEfd1OJDrw0o1YMe9MPIZNMvEXKuOCJBR1STAqoBWLua0TJVn2fxdHfEvMkpkEK1GXYrQPgrVNW4gmFYn5xolRs7nb7EWJAN/6zubml3CuCsPouXakTmERb4awTV16vwgaxtmb/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(86362001)(31696002)(36756003)(6916009)(4326008)(8936002)(41300700001)(66556008)(66946007)(316002)(66476007)(54906003)(5660300002)(83380400001)(2906002)(38100700002)(53546011)(6506007)(186003)(966005)(6512007)(26005)(6666004)(6486002)(8676002)(66574015)(478600001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHhneS9INzVFdkN1Q095dmdBT0VKVTRwR3ZyaDdaY3JsUkphQmdaU1h3bXFE?=
 =?utf-8?B?eU80dWZYaUZCVlZ6R3ZFakdPcnpkelhwVjh3S3RIRkI0NlN0NE5Lc3dFUEVH?=
 =?utf-8?B?dDg5a0RNVUIxTXZpUjB2bG1kZm92TUZIQzJlNnF5ditvYXJzMlpIUHhGbWNZ?=
 =?utf-8?B?RnFQcHdCY3dTZEtHWEp5eFdNNndnS3V1Y2Z0L2xsUXU3em91NHdhaWpmbmtq?=
 =?utf-8?B?WUt1aG0yeTNoQXlTUWtnbmdUVkZ6em9EdHE5eTJEeW0zNDQ0SDdYYmg4RUNX?=
 =?utf-8?B?NHBpMTJTUEtoZnVySnZBZEJwS3lyQ3F6cEVsRWJyeEp4YlZ0V2w0dzUyUWhO?=
 =?utf-8?B?Q0piUm1LUlVyRmQ3Vkk4d0I3eHl2bnJPSDB2bFZPZUsxOXJKSGVHU0JjNHZG?=
 =?utf-8?B?eEdnTjV4U3ZhbHpMdDZON2tEY3pCU0dITkRuZit3SVovT3ozSGtDYTVqUmNh?=
 =?utf-8?B?NVV4SG1yLzJNYWlINlBKSStBRElwaFVvL0pEM2tseUxiN2pKdm44aGxOdTVr?=
 =?utf-8?B?VGZRYmhFcXpoa2JnS1J3ZXpYMjdBUUlOWE9TdGFkYjUyempySUthYUVibUlO?=
 =?utf-8?B?WWoyM2JMWVNoMWxrRW9VNUxTQmU0dWZ6VUpPN2Y2WDhZNjZabGtCRGhKVGZ2?=
 =?utf-8?B?VmdEVkt2emhlemJiRkZjcy8yS1RIK25aWjNSZ1pwZlJPd3BjVi9OdEdtS0F0?=
 =?utf-8?B?VU1Ed1BvdmFRVEZYUXQ4Y2R0L2ZsellyakYrWDRFallBNFlvRE1zOTJXTC9D?=
 =?utf-8?B?NVBzS0ZEM3h3VW1jM2JRT2ZvOStMYk1SR1d2MkNDV1hlWTFVamEwOHMrTDF5?=
 =?utf-8?B?OWJIM09tYU5PbHVaSzlCZU02U3FqK2g0YnhxenQvaFNQcjlLMEJOWGMrYnlS?=
 =?utf-8?B?TjFhVFU5WExZUGZiZVIwL1FoQmtwaStlSXJJMG8yZXhhekY4RDBOQ253UlRl?=
 =?utf-8?B?WWl0Wm1kWURKdURQZmZPSnJyVzZMUHpDR3kvZDFXZTZyK2Z6TUlpajRKNUs2?=
 =?utf-8?B?RmN6ZkNXNG1nbXZDUXd6ZUtxR2RxQXhhYm1GdGZlRFdUMHNZR2RUYXAxYTN1?=
 =?utf-8?B?QlAvSURaVFVBUVZQR3VrVk9HUTAvWnJGV3VFaHkyRUI0NVRLTWZZZEVxR3da?=
 =?utf-8?B?VzY3WktKM05JUGFHdzJXclVxcWV0RTVRcEZ5SERGYVp2TlVzUmdLMDlPTHd2?=
 =?utf-8?B?ZENEcEdXQUJXQU95R2ZJSlNZYVJmcnhwOTVadUFBUVJNaVVoQWlXVjlRLzI4?=
 =?utf-8?B?elIyNmMxZ2hHUXJvSnc1V3RNdlVRRmNnODlvMGdEcEZMbTQ5THNYSm12ODVH?=
 =?utf-8?B?ZDBMOUIxQTFyS3pnTVRwMHFjR2pWQWJIOTFXdGpIVEJLa1lpd0VtcjhzRzE2?=
 =?utf-8?B?ZkhETjRUWkd1alBLTHQwcjhXOGRkZjZ5aU1WWkhSakxUL2FZenhtMk9HcGhn?=
 =?utf-8?B?WE9qQXE4VERVUGc3MWZNQmh6SDlnOU5rcXFGSVplTVVKSlJLcS96cHRCWmhN?=
 =?utf-8?B?cDg3Wnc1MkxRd3RFSFAvWUQwU2RBemgrNkExWHVGZTRaTGQxV2dQT01WeStw?=
 =?utf-8?B?SFM1emlVdTRsb0trUXVMMTljc29mNkEyQXc1ZExONHZpRGRWYUJUZnBkYnJr?=
 =?utf-8?B?cCsxZkdFbHBGeW5yL1pic1pLWFZEd1VxM0p2anU0ei8xbDZzR2V4VmQybk8v?=
 =?utf-8?B?MU00Zzc1am9OeGtyQ0wwejJnVmlXTFJFUHlLa1ZxcGt1OUtvU1M4ZjlOaXJJ?=
 =?utf-8?B?ZElNaEI5c1VSOGphL2xVdEhLdEwyaTlqZWUwSi9TRW1SbDZWTFZXVS9KQVdh?=
 =?utf-8?B?WEQ2cWRwRVRHS3FaM3Z6NEx3Si9BNlNUcHJXSjJ5dDBETlo3SDQ3cFBHc2xH?=
 =?utf-8?B?Z213OVJ6Zlgydk0wN2JQK081RjhXUWtyekRvQ3F4eEl1Zi8zMnZBRHVMVzFo?=
 =?utf-8?B?blhoZ1VESXd3Mjg1dHVOY05BMW9ybHlpOXFEcXdiTnJLRTdDZW9hTHlYN21z?=
 =?utf-8?B?TWlpVmpxZlhNT2M0OHhnclkxWHAzWHpXRms5VGpzbytzNHdTNm5iRlIwclV0?=
 =?utf-8?B?czh4dU41L2tZdVloVUxEaXdpWVhJL2s4MzI0aXBUTk1pcUljWDA5LytPYW5R?=
 =?utf-8?Q?62RqwPyuJrvxpJckZyn9akO1R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cff414d-2412-48f2-5330-08db0dc14a5e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:53:26.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMo7KGFibAyo/UNK18EyKpK+KVwvVdnLOU6PLuNToa5oVz0SStF28MU7iE8i0Q/UpbMyBIhSSI4CJj+Rw/h30w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9106

On 13.02.2023 12:14, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I'm getting some ELF note issues on multiboot binary
> specifically:
> xen/xen: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statically linked, BuildID[sha1]=f7d2c37a4ad599b268f2f2d94bff3776d12649b3, bad note description size 0xc0010001, stripped
> 
> readelf additionally says:
> 
>     Displaying notes found in: .note
>       Owner                Data size 	Description
>       GNU                  0x00000014	NT_GNU_BUILD_ID (unique build ID bitstring)
>         Build ID: c5825a0d08edc4d11b1138fedca6b14ce8ba7302
>       (NONE)               0x00000004	Unknown note type: (0x00000020)
>        description data: 05 00 00 00 
>     readelf: xen/xen: Warning: note with invalid namesz and/or descsz found at offset 0x34
>     readelf: xen/xen: Warning:  type: 0x4, namesize: 0x00554e47, descsize: 0xc0010001, alignment: 4
> 
> Grub doesn't care, but launching such xen with kexec doesn't work.
> 
> Initially found when booting Xen via Heads: https://openqa.qubes-os.org/tests/60151#step/install_startup/11
> 
> Andy says:
>> yeah, I've seen the same on XTF
>> binutil's recent elf notes for CET compatibility use an unsigned long
>> so they're not compatible when we build as 64bit and then re-package as 32
>> I think we need to strip all elf notes in mkelf32

Instead of complicating mkelf32 (we want to retain at least the build-id
note, after all, and for PVH_GUEST builds also .note.Xen) why don't we
discard the unwanted/unneeded notes then from the linker script, just
like we already do for xen.efi?

Jan

