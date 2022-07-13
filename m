Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F4572EF1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 09:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366238.596938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBWeU-0002cg-Io; Wed, 13 Jul 2022 07:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366238.596938; Wed, 13 Jul 2022 07:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBWeU-0002a4-G5; Wed, 13 Jul 2022 07:19:18 +0000
Received: by outflank-mailman (input) for mailman id 366238;
 Wed, 13 Jul 2022 07:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN81=XS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBWeT-0002Zy-Al
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 07:19:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2057.outbound.protection.outlook.com [40.107.104.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a177a60-027c-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 09:19:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4971.eurprd04.prod.outlook.com (2603:10a6:10:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 07:19:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 07:19:09 +0000
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
X-Inumbo-ID: 1a177a60-027c-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjegvlmbAsDH2bfr3BCESIHijq4/rysR9DCXaEbQkQAq4UDqd7c+Y9Q82BthVr2pq95yQHo/wPw+M1DxQuYoq3sAp271CnShUuib9MwXAM5/9MoX3VBbCwI8hMmIMc8e76ddzBR8AurkOTl7QY0Ulqb7VGM4QVbha2xoULWMt6PQX2SlHbzcJrlegrN1R9F60Z3dGz9Bg71pY9DbXRe+KXQbi+MypMVPLvR/17pDRzCp5r4ukNqGJ+gH1n2ukmPVmIOtvgAPcegx5WUA19i+Nbd0YeVSco9aQDgZIaGkLZki9JHqQlyT6MhfnxSj484w/vTYY45zga3YiwVAcvMCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCQpVhSxAHuSJZxodfCHMWro24FuwsjYLLiWvuR8O4Q=;
 b=fsGbc2Kix1G1edlHXQPOvBoCXTjCqk7bjyEZ5NPL3UBsPBBGsuIw8K85s9oOf9V0x+clnf/sptZIIAhpuSAOHqI6IQoXIcryujE3TERyeaVbef0lwS/GYkMvhqaIZ6DKL9mTCpv/x8hvnxLbeZusxyF2T9Pi5haABjxZzPuw/aTNdNhvJB4hIDJ4krPesybysagihXa0ytZ1JGCIzC326nNp2R3VwR9kYORxe5Qmh1GnQW6rdFL3cj7k9C3CbvAneLDEfeyOEu2J/7VNWajvzCO6Qk9tTYrkwl7H2JDaY6uCyq9uEjmMrivKOgZT92OC4lsEBmdKrOxyyxUo5KJOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCQpVhSxAHuSJZxodfCHMWro24FuwsjYLLiWvuR8O4Q=;
 b=Pyz1d8SIkR6nT+uRbpughiurDK3lEr9uXaQOIl6uChnlbLyQdy6xiZUFhNsIr9fpwxtlA7oRW9ThiZ/s6SlbhvudSsyqawtzdWBSwq48HcATKVfiXAJYIUUPgx5IX/kJLDyPLmxRY25m2TBWJGk2Dcokty86x7GXHJeLC2RrO6TcnOtvqibjQ+12vqJBkCWY1a9GpM0FYsO1bOrP8D0xAKy8sVVBirUsebpFNMIkAXUQ3an9vuA3ZWDTMbUwDtcypSqcmp0sG2vk5Y2he69eUVp1Y/W+88jbSKMEmipl2yYcbKYTm085P1KtptqSAAWDEu+LBNut3bvbbqrdvVRjKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db81dd29-f34b-8a96-831c-ecb2c5d3770f@suse.com>
Date: Wed, 13 Jul 2022 09:19:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/9] xue: reset XHCI ports when initializing dbc
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <4874087c2304034e0d917d649f7cb9d46c149ed6.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4874087c2304034e0d917d649f7cb9d46c149ed6.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19c2a3f6-6f88-4a46-8dad-08da649ffa9c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4971:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MAooVI8V6FGu+y4X6iKsZdQsGoaMhv/wh1iHu3JJdpWFvvInYlFFPImh9+S2Wdmrs5xEjy6GEFRg8KXFJNzLSu9qVukDIya0xvzNg7i50YxmVLe+peXHeI2BhI3bkvxbUXWtKMsRipL8o33z/4PsqKH1WLnYKjo/lWYCSrh+8XtrgoDw0ExS6kEY8Yn2lnVTps7fVujwuRVmkj58bddiE6ieatoJFws0lU5j9M85EEFeujPdjTBzmv+sriBthsB1qahhgNCnXPPtxSAj9fW9u0qneAA4R7K0sXfj0H9nHqI4umagulSOMr5d15KctprFyngbj3BAMw8SlvABoYKCf7MqX4adeKvn2EBTcuqDBQ0PR6Z7wgbp2thiwKO5e5bcyYXDFRa9JL5no6CFTc5whwmwAhFch2vMBUvHLZPz6St9RC9XrdFRgRcT4jdmr7G0+kCR9pqo5SbvCWB0Ix1lvJmU1uwG20m3FEGprixfZkz14PD0SvcMoPW2ylJUliQDa83XOnYLjgRWDxPsocfSfUlJJShWoqP3ioiXo5fC2HWIfdLnImfJSEQNfdJkmu2EA7pPRVVpfS/xOI5CNiNxW6lWp7mZaU6WYV5o8khXBMd98eMdDNkB8En7dHcwWGh4Fniq99WzwFCctZpnOlmnFsOfj0JSyz/CjuHJ/oOUzaUSHKs6K4IYCff/9SVPhQfGmBgG1k/F1m/9TXzU8dYDeiJsogDlucPY8jpK1teBkDnot46gYFZL+GRFMJtYHqRMBwXHhE1Ky0bM6+VVGcUxRE0TAg2S9OrMTCSKFRgkOTdQhTxm1eAU9dQV+PR/0epkJf4KDoR4WfRQWZdWJCiB9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(366004)(346002)(136003)(396003)(6512007)(8936002)(26005)(5660300002)(6486002)(38100700002)(478600001)(6506007)(31696002)(86362001)(2616005)(2906002)(41300700001)(4744005)(186003)(53546011)(36756003)(31686004)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC8veWNoUDBTY241UzBaVTVCOTlRQzJvaEJUbTRHRll3QmRvUmFNWHlnVWVG?=
 =?utf-8?B?VzhETDBSRFR5L1NkL3N3dEhNOXRmSEcyNGIxMmsxVDBKekdxTk5JYUJERHR0?=
 =?utf-8?B?TWhxbEtNclRLRE5JWmhiZzVPcGdvbDJ0UTlmQ1pkakhFbUJNcnhZYjhNTi8r?=
 =?utf-8?B?UDFiMUJxRDhDa3NrZGZjMkVPeS9wSmtja3R0Y0VQblovQnJMZkZKcSt0cHkw?=
 =?utf-8?B?eDRiNThhSWR5SVNzdWg5OGpHeVlRdkNBd3R1a3Rndml0ZWVsQTZFWGdSSUR5?=
 =?utf-8?B?Z2pOeWNDT1JIZmRLVDJ4S3duSWpxNFEwbTY4WHJDdlBaTWpsZ2o2Z1BZWGFB?=
 =?utf-8?B?THJ2clNtYXVCbHcxQnU0b2ludkpHQTM1ckRBZXpTMGI3bFJMYVVDamEwQlJM?=
 =?utf-8?B?TmFzTkNISy9DR3FHbFBXcVoxbWpvekZ6SGg2WmZsWWFNaWE0QndJN0JHUGVM?=
 =?utf-8?B?ZFBjZzVEVW1hYjB4c00zYXdhQVh2bnJ6allmUysyQ2V5WGg2d3VsT0xVTXdk?=
 =?utf-8?B?ZFRjb3NDajg1MnNuQUp4RE9LMHVwak1pbVhOakdEYnFMMUdZTnpEVXl2Y28y?=
 =?utf-8?B?SGRZT2l2Wkx0LzhvZmZTYTZHejJaTGZ1U0REckJUbHRCcEhHNldsMmFlS0hJ?=
 =?utf-8?B?K1Q5cVVCaG5EenlkTHpjM3VOY1lRdmtDSWFGTTNKM3pHakh1ZFRDNHRMRkVa?=
 =?utf-8?B?bjJURnVhTjZpNUxOR3Ava3pWTmhYTFoyTXhiRWN5UlJ5S3ZicDdzL0JFNGtq?=
 =?utf-8?B?eVlLSGRsSEpqVGV1L2Y3YjlrTUhVdVhENjNGZXU1TnZuN0ZVVk5VRGNVYmlL?=
 =?utf-8?B?OWlsMUNIbjc0QXcvbEFXbXVzRVBmUXRuem9zL1ZRajMrWTZrSUsvVTIwR3Jl?=
 =?utf-8?B?ZCtjeXN1blFGNGt6UnNiZU8xelBNR21MbjdWcWFUTGIyZXphZFl2Zlp6WGlV?=
 =?utf-8?B?Y0REc3RRd3FHZHErclB0d3laK0F4RHQ1ZkdKWGRCbk9XVUF0R1VIYmNhQ0F2?=
 =?utf-8?B?RDJJZkpDZXozVm9Xc1VTd3lVK3A2a09yNlNpWmYyeWtVdTdzMGgxam1PQTdx?=
 =?utf-8?B?d0ZUY2lqZXp0WGoyK3ZWT2V6TEVNaEEyVXBjdG9Nc2FDOE5CeitFdzZ0d2VQ?=
 =?utf-8?B?OG1vMkgrTFAramlvL2VCcEZiZ2tVQ3ZlSytybXhlR1FiNExDaUozUVFQaVdP?=
 =?utf-8?B?N3hRblJ4VFdtTlBXQ2lFU3E1ak5NRWRQdER6TlZNUUhWRVc3OE1GYW5YR1hU?=
 =?utf-8?B?cDdKZ0htWXZCNU5mWkkvWHJjVjh5OFJGLzlwemRoTTNwKzJtUUpXN1p3bnl2?=
 =?utf-8?B?TmVMQ3JxRTFDV2J3VFdnVWlVanBCUW1KSVAwZ3FuVlkxZ1dsN01wWTAvUlNZ?=
 =?utf-8?B?c0h1RmtxTkd5VUlOQ25Md3Y1WmZMSVZtRFdyc004MGpOa3krODF1ajVYY0U0?=
 =?utf-8?B?SGpVZzRUNmNHVEY3akpReXh2bXZ1RWxHWE5JYlNxM0ZmY3JHUDVxOWE2U1ds?=
 =?utf-8?B?MHJnQVRZQ0VNTUFaOHVWSk1vN0Z2ODZXVjRUbFMxcFhJb3AveXhrZUd5cHlG?=
 =?utf-8?B?Z085VFVnSlRzMU10L3RLYXRWY3FwdGtNSlhGclc4L1J4OGEvL2djalBISk9O?=
 =?utf-8?B?ZzhmdFFqVXRVekg3Yng5TnBxeDQ1OGdhNmJGUEtGbklnMEpKaG9pRlVuZEZt?=
 =?utf-8?B?Z21qRHZ2a2FBeWZqVGhTYkNxNXBrR2tQeUNPRmNERlVIWWVLT0VkOCt2L3BN?=
 =?utf-8?B?TytURmZRcmptQmg2SGpXekUveUxQQWdIOUZZbElLdlZkVnBDdnc5TDJwVEYr?=
 =?utf-8?B?eE1NN1k1VjRBU1NDKzJxMktYdEhUelliVVE0ZTlqQ2tTZnBNLy9FemR0SmJ4?=
 =?utf-8?B?QjVhdFkxN25sWDZZL3QyVllycVkxM01PREhJSlZ2NXAydVlQZGdwRTNEbUw2?=
 =?utf-8?B?bVVzcENiQVlzV3ZRK0RxM08zUit4QWpITmVhSkI2Z1lNbTNZdmRRM1JiZ3RD?=
 =?utf-8?B?ZlAwTUNoWmh1K0l3M0V0VE5WTVpmdWxrbmxZaEwvZnN1NVJWSlJDc0pNRGhi?=
 =?utf-8?B?dTRSWlJRVG9OMFhiY2FlV2NkTmlTdjlUV3k0bmFjbitpUUJ1cmVMZzc5cWVj?=
 =?utf-8?Q?4Anm4tKeGXwjgNt9VJVFBUtVi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c2a3f6-6f88-4a46-8dad-08da649ffa9c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 07:19:09.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stPjgIvx47MauXpKoKOJ5pfe5gd9tyHBOUn+3i3QLo5DYXpxVEfKVSL0hxLOOg6mno9DNF2YbtlOmVM/SO3eTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4971

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> Reset ports, to force host system to re-enumerate devices. Otheriwse it
> will require the cable to be re-plugged, or will wait in the
> "configuring" state indefinitely.
> 
> Trick and code copied from Linux:
> drivers/usb/early/xhci-dbc.c:xdbc_start()->xdbc_reset_debug_port()
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Of course it would be nice to get an actual R-b from someone knowledgable
(likely going to apply to subsequent patches as well).

Jan

