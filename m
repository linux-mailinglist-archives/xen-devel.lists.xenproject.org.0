Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C067CAD0B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617737.960658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPGM-0005rf-IS; Mon, 16 Oct 2023 15:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617737.960658; Mon, 16 Oct 2023 15:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPGM-0005oQ-Dz; Mon, 16 Oct 2023 15:12:10 +0000
Received: by outflank-mailman (input) for mailman id 617737;
 Mon, 16 Oct 2023 15:12:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPGL-0005lJ-Ld
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:12:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ff64621-6c36-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:12:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:12:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:12:07 +0000
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
X-Inumbo-ID: 5ff64621-6c36-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk35EEE4eXvLCKeTAEFzSaskLS2eL6RrR092ZkIa/vmnvizwyP4GOHGAYrAte6REkLeCyLN4xyXSONinVmYdHicA9X4B/Ezob5qV4zhYQ5ImL9KaF0hyCPz8lI5V8t5VHVeMgDvFr74g+FWKFArqw2jXoBWfjO8plQwT4Q0UoDSymdVX1TiMPsMZNKeIovTHijXUA1bLn7us5AijDTVf2uGRI4fptygQLHxOGbVNod5mx9+7UR3a5vmvzBEYjK2A0p3g4dQ/+CVHDaoYKdQXlb9njc+a7omcLkTMrApu46Yi2p8oGVLlrIo3p6lYnA5m3blvPQjeeOsgfFxmkErfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4CYrwUqHItjqdVuOYOUh+zmSXTVB/cJE+yZeZE48/A=;
 b=P0QbcSnWUdZVbbQHZj7NZmc/yj5CAxqUbFnivg/Jp5uH85K6j2DXMdzEp4Yz5RxtRZmHpwquCGw3EsbVkyQprg75sBQojCC9IxggwyA+gfdnjbu5ccO7Mg4soXZiexyuFJKoOFsj3qlHUaRnN70bEQ6WQzTkGO25lg36ZqDWuRQogQAc6oQuK6mb9WJtp3zPqZsSBJcqEhodRv17EdxG8R7UKuBlTZRWVic+KZgSn7rNgJhCSDSY1WMfouIm1pw6WRs77MFd5ZtxcAofHcg9wmKNZsIdl4krDYXNTGSOh/YAnwJ+P/cJR7f06XXx5COpc5Hk1JfiC9pZGhqpyNcWoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4CYrwUqHItjqdVuOYOUh+zmSXTVB/cJE+yZeZE48/A=;
 b=ZdYutT3e7ir1yzr63MBV31GbFB6d44W8yq6ZkJjQw1UV9235MEHWzmh8b7tqq4RWX1jfmQ/G0NrO5eBGUVibbF4J8iqy+hqt9DetksFwyKFNJQuk5y40GBQygbhI67cAFbRGRHL9OQlQGEAa88HZBMSwBWRWD0eVRDGSX9NMb5LDYficYLDHy+y+toW3PZRUxIfr6LM+9CYfxOpdTYG7rN197KNXV3x2nrdFT7msIzNsYOlAw0O8OZ5ttpplweo1vFvpkuevy7NVryq0g6vG0yHUgmQicqq8K/aFbhI4VISx1RmAl67Zc/4c2oSQgvLLNZI336vX9urqoUsRY+cbgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ee1b2df-25eb-fc57-3d44-7de0e9cef478@suse.com>
Date: Mon, 16 Oct 2023 17:12:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
 <3D657AA0-676B-4681-B980-26BCCC98B092@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3D657AA0-676B-4681-B980-26BCCC98B092@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8ffca5-7acd-489f-1101-08dbce5a4353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SkNeOrGVcaTpgOX4ZGOesqU0plSmGheFdyUr3U06eq71V/8rNoVbXsOulYytINveyLROyQdjkZDaslawzjg9U2U6xPCYnGJ3il8vn/kebRWAaiwnmmiaDaLhEK1rMy6K87Ix8FrU3OkSvxbZp/qLrebaRWDPIQhAA+++BXzmUPt1f75/DBdrJ+Y1xSGojuCD2yethzWYh6cpV453rnDPYm9OISIBC+HWITN8GylrWDCA6M+BMQjzn+eDnOq0ws2boJig9OCXKsm7vosJendDmLFJcG9jyaIreqFkNsgzJiNCAOto9cP5WzvRmfSelgrQPNdp3UlYJCWzrKtGYWOpy36c0Z6svI/biNQEow5fRYOlUhFTDZljzSEB9U2YD0D6vmtZauUJJS+ZyGVr//d/CNh9xr8UEXhfgZutqPDtEGLGdpaiTQy+WQW1rYRrn3RaJyNs4ksQLDmy4CQG8BEUDuhRco2YstkP9gHENAYD1l+Xj8tl1kn+XrQ/0XaLoJJFDqNqSjjpVtxQPwTn+uj5RD7fIqC9pwJcbZN2TBoouxSGLoNOVf3XlumrcNGAbPX7I+RPNc0Po2ANxI+3JtsAqtqxfYKV5Qa3ttal3nskicR7VfBX4Hag6/yk3rSt8DViMpAPij5mPfAP1ZUKtmAWTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(4744005)(41300700001)(6486002)(86362001)(478600001)(31696002)(66476007)(66556008)(36756003)(54906003)(53546011)(66946007)(6916009)(6512007)(6506007)(316002)(8936002)(8676002)(26005)(2616005)(83380400001)(31686004)(4326008)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzY5MEdqb2FGZ2ludGw3YWx5NTB3VXdzNlVreVJZQWVEN0xYNW9wYnA1NXMv?=
 =?utf-8?B?V0NTUFdNMUdDSUV4RlZKU1hpRVhsdHRiQUlON3ZoY0ZvSDhwbG1CMlZzWnNk?=
 =?utf-8?B?cFhoaUhFemxSQ01rVjUxZlFoM21rMHA5N1pmTnVQU21hMEtGdG5lZkoyZzBy?=
 =?utf-8?B?L1JmUG9JRndyUGdpU1NUMG9pY0Izc0pFQkI1dEVidlVxbWxHSGpkTFdYNDln?=
 =?utf-8?B?Y0VraVN4Z1lkUjMxazQ2VEkzOW1SYXRpNEZtaTZSZG91bmlCVEo1QWY0VkIw?=
 =?utf-8?B?U09lNjM2MnRKaHBiZU1yUHo4QVBNalFzNUZJVUsyNTJkT0gzeTVPSDhQdU5J?=
 =?utf-8?B?N2RHbGlKRThTaTNDemdVQTFOY1hleFBrcVlwQ3VsLzFvQ1dvVnBHSCtxSlAx?=
 =?utf-8?B?aEEzRFo4Y2lKUWV4d0hZN3FIa0hhaFV0MXRYenU1SkdOQmpydjRoS2pxYmlw?=
 =?utf-8?B?V0x1NmFSRURMTnYyT2pWbktNWEczLzJZRkVtamQvM01YTzczejNqcXhHeVZt?=
 =?utf-8?B?Qi9LeVA1TXo2RnUvdXA1RS9FVTN6bXl6UElPWkpxWCtqZUVza2crdGhmdUFM?=
 =?utf-8?B?NWtHcjNlVnFDNU8xdmtscHR1OTJOLzRiMG55aEdLMitiYjlTalg0L3ZMMnRG?=
 =?utf-8?B?cGZnYVNqZkNBQlBRZnkvb2E0UUFQM1dxWnF6N05PaDFZdWtRSm94U1JpMFNW?=
 =?utf-8?B?YVJmaDZUSHJrUEViQlJzUmk2RDludDFXV2J6dDFhVXhmS3FrVUxUSWRLWjFO?=
 =?utf-8?B?MVJVRWtNcWJ6MGM2NmlOeWxPWldUQmVzczAwaCtycnJPRFhlSHp4ZTFaaUFX?=
 =?utf-8?B?cUdTOXpqLzNKdG85UllFazJlV2pCMU40SldabVdrRjBrbklmOHN6bndzd1Vw?=
 =?utf-8?B?V05YV0hpdUFlLzF0ZXZTWUZ5K0F2a1dNckh2a2xBU1FYYTJpZytMbE1RR3Vs?=
 =?utf-8?B?MWFrSVFKVDFRNmVPN0MzWG9NaU4zbS8yUUF0ckdrdFF2Mk42Slhod3BrS2Nw?=
 =?utf-8?B?WEkyVW8zTjloWmNhVzhHdFdHdjIvOENRRFVDWFFsdG5KUzNReVZBZ0tyZFls?=
 =?utf-8?B?bU82REtkdEJNZUR3L29Td0hIOXhaSU5VSjVxaThvVS85UjljdFJwZFFWaWlM?=
 =?utf-8?B?UVNPcVovS2pucXdFUUtKM2w5bG85eGM3Q3o2Uk9LWTBVS2c3eXJCUUhjV1pp?=
 =?utf-8?B?Uk1GRWpxODJqLytZTHFlcDRSY3pqb0VjRStvU0JjZis5aG9yRWszdVJwSkpX?=
 =?utf-8?B?aW5mMVpSL2E1eXcvK1dSdGxLcWtoZU9sZVViZzJOQ1hncEt1VE4wTzllV01P?=
 =?utf-8?B?ZElYNTJUZTdWeDA4ejZJeVZSaGlQcllLdFpNT0lYNnVMamtHR0FUVVhiY3FK?=
 =?utf-8?B?S2Rhd3RVMEJwd0lBQUpvakxYYTJ4VWxMNU5pVHJDT05teUhpY2xFRjljS09O?=
 =?utf-8?B?TEhSeHZwdG5FUC9pV3pqM3FWQjVmVmhFNTRrOWZjcXJXNmZzcldvOHRrK2pT?=
 =?utf-8?B?MzNhS3h2NUEycGsvZjU1K3VJWFptZENWYU1ZN29OTE4xY05YSVdpSnQwNXFT?=
 =?utf-8?B?Y3F5NWE2dlF2YTEwcm1wM0h2VldvR2JuNjVIbFlKMldnQUozZ3FKNWk3bS82?=
 =?utf-8?B?eUkwN0JIK3FKay9OaGFHZjR2ckZJc0d3WGh5U0lxYXRodC9yZ2RxRnN4Y2Ns?=
 =?utf-8?B?TjlUdHNNbStnVUZ6RE9OcmVjY010Y2d5bzN6ajVzeDRxL2lEUVluYTU5ZHAr?=
 =?utf-8?B?K05NUFpBcGFYUU1iRVRoTHZOeFM3VS93eUxXd2dOTG5pMlJGL2dOaTdENnNR?=
 =?utf-8?B?QlJ1WE8wYUtzQkh0TGcvdHJuakRUdFpNZ3haQy9rbUpuUzQwUUJIbGJFcmpn?=
 =?utf-8?B?N2huTXUwODl6QTNNSHdlSFhaeWNXTlBYazE0MFhNN1ZGc1VUYXAvdzAyaEVn?=
 =?utf-8?B?b1RRQlBzWDU3VTY5N3R3b3NhM3ZmWEt2aWhuR1RYS3hsYlBqNUJrc1JYaFhC?=
 =?utf-8?B?T1Z2V2x4TXdYUXdZdXhRL29iYS93bDQ1YTgzeWVsVTduK00yNzhOcDRFeEYy?=
 =?utf-8?B?SmZ2K0pFbkxNbHRSK3N5dytTalBDVFg3UTVSWDQyNUI1RHR4UWoxcExHT2ZF?=
 =?utf-8?Q?YbC0RSs7b8BhJuQR3KzioXEON?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8ffca5-7acd-489f-1101-08dbce5a4353
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:12:07.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsTyQd4EuVk4Nda9j3Ea4TiT4Xao+n/m2DfRC58ZNmWScBfTlza2FUTjccToR1+flvGZbWUfzsUlUe9XYQ7Vtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

On 03.10.2023 02:19, Henry Wang wrote:
>> On Oct 3, 2023, at 06:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Mon, 2 Oct 2023, Federico Serafini wrote:
>>> Make function declaration and definition consistent.
>>> No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

We're past RC3, so I'd like to confirm whether this still holds.

Jan

