Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CFC6D76B5
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518309.804700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyMw-0003Tu-0x; Wed, 05 Apr 2023 08:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518309.804700; Wed, 05 Apr 2023 08:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyMv-0003RR-UK; Wed, 05 Apr 2023 08:19:49 +0000
Received: by outflank-mailman (input) for mailman id 518309;
 Wed, 05 Apr 2023 08:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjyMu-0003RF-AF
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 08:19:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fe97a41-d38a-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:19:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7034.eurprd04.prod.outlook.com (2603:10a6:10:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 08:19:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 08:19:43 +0000
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
X-Inumbo-ID: 9fe97a41-d38a-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJIIw9REseH4fauPitjsdNPAjQyVKU8SiTyUGnIXdsFKVMGxsT2Zn+kzY+qR2NaYdBoMfV0W7NuoA0WGtDo6ipN/+eJlF5SrroHmk0sLHikPIjRBdwFnNFwd9fYufaSk2uqr4455R/v+AkjxX4wqDR2WXEJ0spyNgPCay9jeG7Gklqd6UAkrFrUAcZi71y/dyRNYTD3jdr5RtWSzZ6PNoqWdAVrdnnoUitEZ2Q4qYIKtl01689tRGbYL8hSiDcZ0g8AT8oA1eojMcwnA5iUTEaZnrSsRtbJpahiZQVR87v3pzaUg9qFH/Pg+61sGuc6EviojFZnhvQDuhtpotZXOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvZ9P6Oc5QfRT6Z13Iipi/AKyrzjUUpibjnnKvc4YWY=;
 b=al34kqBMu4YlavyoKPMQSrm6yUkiv4GyhiWhe+D9VRmXHasiO17/USrJPoKsAX9yECrZEKRUYLERf0TpnfwXsw1e3XZD7i9kGvjgADQag/9z2WSbVT9yM4sfP+N/75VscTYhMqoZQnLDyTXbY5tpg0Y5595lmbkjOBOXG1+kbGXttnhoFyorQrkERLVT00KnGPse+A2lazHx+alU6+w6Omryh5erHJH4L5V4NfWOTASF6JmDJ85ThR3o6rucwHP8LCRFJ3W6O8vYVPQWUrUTF27xMxXF+oB8E9v8MkPX6FS9vB6mt1XJbGzbHQuLoegE4XqQftaAIM81jnsAeUhu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvZ9P6Oc5QfRT6Z13Iipi/AKyrzjUUpibjnnKvc4YWY=;
 b=R8cekt3y2+riXqT9vV6/gNV5YGGimhmLaK5sQ1RpRyq4nMqpqGcU7XpgcVP4Iv1FZLNa4CQoOeV5XAHUscDoHb2TskY4J4SgChMm9Tlx7pONBCd9Dl2+e5qpidQKtl4kE4zaXSk4kZk/FHqn2m0C8vJRnGohl+uiu8ozrI3s32A549S77LwLr3WW/zAGAnVRbs1vratXsADCRkTlbWZyvx1WOlDuiKsEFu+KInyXjB9U85giMEKuBxYiv6aN4owAt9bObd2fjk9znDsqXvdlUaTOVbmje7tL+9AIhE92BForPb2oQEHE8tTa1aU2I8vQW8KQP94p7aWLxR7WhwRb2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2cc24b27-d2d2-4f15-acfc-acfd802f04a1@suse.com>
Date: Wed, 5 Apr 2023 10:19:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3] libx86: Update library API for cpu_policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-15-andrew.cooper3@citrix.com>
 <20230404210600.1404532-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404210600.1404532-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c538e9-cb39-440f-43f0-08db35ae82ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qe+8HgCJYGrx+Vw8t2FhRJqNaoT/N2nahDreqbEKA/aOOLtb5i1flnZO+zSeugY8OiGHAZRSh3o0yM6FCIF4gGGgm5MqglOmFUVyTqa13mI5YM0Jj+MwmrYjI2Pf4+mHlzNdJAoJUB8UIKi+spSNBp7bIxNZSyAUxAzWfZWyw51gp6J+xD+p2oYLcZsmF9jTCzduMvKzrhDyMmx3/GrZnFlN6ONzvyyz56ZFJEN3FrbJ38eeh6Q1OCZECms8epxk0dmBCJ5dK65VANMSQ71gXUSZ6oHag4SyAULXO15HKeXuXIL4XxJzfJtYQNc3mkoPoklJYZ2L97MZHKBSshg1byQ/DHqhYL9neRx7g+W1TUCI1Ul0+XDTKkSkV/vvlRRWteYzqqxQu/PbHX1lEcj9ztM9rZ5bwSRIl+rA/0A87Dy4MCHRA/8yGJUbFLWCg5TaEULsw4Lrv2pG1+sTLGqF9dZRgXLOrkDbyz7ceY9ly0+Tp5PtKjtSgHmfK63OCa8+kweuAblO5xygrAs79senXo6gQ7yIPNdlv8SWSBxs1KdGknzd3uyviWF+Mn0v+gbaYDlIrMAx24qTmdUBCU9qkzTAlcufbWfFSpcqGPw3CqTynDQgdM1EIRcFiEp7VOmANHiIt7jIwjJ2P1/Ln/UH8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199021)(31686004)(36756003)(38100700002)(5660300002)(4744005)(2906002)(8936002)(8676002)(66556008)(66476007)(41300700001)(86362001)(31696002)(66946007)(4326008)(6916009)(2616005)(26005)(54906003)(53546011)(6512007)(6506007)(316002)(6486002)(478600001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pmWHByU0kxNiswQ1pTd1RXdFlYM0F6NHl0VGZlRnowY0pVUXkrelFwSzlP?=
 =?utf-8?B?WlZoeE5QSkwyU0FGMGlUV2ZxR0Nhc2JQUjd0cnJaaFdURGVtM3pQZnhPTjBE?=
 =?utf-8?B?SS9KaStxMlZDcVFPNFo3NnhVS2NtVGoyOEpOcVV0RHFlUGc1ZWRIWGtiODFQ?=
 =?utf-8?B?YzZ1Tmw5WEtFWVVzaWJSb0lMVWVLVXBIRnkrcFlUMkpkaFJ2NnlveUExRThh?=
 =?utf-8?B?SCs3TVdGNUFSK3RySjhQREt2QVZ3dXlOd0dORTVXeEltM29xYTVLZTJSWHNv?=
 =?utf-8?B?c2xyT2dDMm1yTm11ZzlCVkhaZnZ2TkVjQXozVFZML2d0cHF5VTRRZWxBRzhZ?=
 =?utf-8?B?bGZLREhIYTVtQ1MzNFg0YUwxUHFjM1Y5aXZtbjhuRStDdUp6SEhsVlN5WG43?=
 =?utf-8?B?Rk1UeWoyZkd6ZFR4anZwZEhKOUw4ZVZFR1RBbk1lQUhGRlNLZytkRkZRbWVu?=
 =?utf-8?B?STNLNTBnakNHM0VsM05FS3BtYWVCZ3VCOEpYcmx2REhMS2VsYmo4dkluVG95?=
 =?utf-8?B?OHJ3WEpxUnNvK21NMTRMVkpXbHkwQ1k4M3JNUmR5eEJYOWxDUUFaK0pBT3Zy?=
 =?utf-8?B?eGlXOGNJQzRib3k2blpZZjJsdW0yTHZvTGhvSjVKNXBFNnZNaGFKU0lHM2RQ?=
 =?utf-8?B?Nmp4eklaRDVwMHVRbkZXRXprVUczYkgvV3FBY3NONmE2T2xvY2ZRdW1HVDE2?=
 =?utf-8?B?aGRlR1pjcHhsalpMTDNkNjRVY0tzeVo3UjhxNDlyYkZFMDNSTlFVUWcyU2kw?=
 =?utf-8?B?OVZXRHdLdVpJbXFhZnErOFE5TW5qWnRhUlVLeXhhdG5GZnd4M0RFZG1KNHJ3?=
 =?utf-8?B?ODlMZm9McnFpRi9RSW90d3NrUk9tSjgxWmRpd0VxTGJhS2xqYlE3Q3RTaXVl?=
 =?utf-8?B?bHd1UWw5K2RIeGVYcUN0cnNSQ1FVRXZtNmN6ZklXYmtPenB0NG1INXpTamZF?=
 =?utf-8?B?dWlaS2oxYndHMms2TE92Umo5bXE5QVdjeDRBTnEzcENuVUJxcVdPaGFqc3ha?=
 =?utf-8?B?cVFBT3EyQjlPdlQ1QS85bXJKWUNTZEFUbTRYRElndktZNzJoNkZpRXIyRnNI?=
 =?utf-8?B?cjdldjVKaHlCZmthMTBKcStoak82aGwxQUJGR0Z0YitHYm1yaWZSOUkvTE5s?=
 =?utf-8?B?c0hrT0xUcWFWR0t6MzJvM1phNUhucTdWTVlUOEdON21IQVdnL0FGTnpzWGk0?=
 =?utf-8?B?S1Z3MEdkVmEybnBlaEJjRWtUTnFmVHhqbVpYYUpVUll5UFJSUUg3UkNSdm91?=
 =?utf-8?B?UHlTcXh4SSt4aUtwTkFPZlJRSkF5czdMSUJKR3RqV3pmYVo5WEU0TEUxdGw0?=
 =?utf-8?B?QnQwQU9xK2FneE9SbCsraGNZbVUySkNrZHpFeC9OQ2x4L1hXekFBWEhlcFNh?=
 =?utf-8?B?VlZjbmQ3Tm5EakpIOVdOcFcyb0dZZDRNd3E1VEhwc0xjZWp1clE2R1VWTDla?=
 =?utf-8?B?YjlVZEVuV2pvTlBEMFdjdlZpbzVGd0E2dUoxejB1S2xBTnFiUFRxeEozQXhZ?=
 =?utf-8?B?ZjVERXpFY28wU2lIS2IwTmV0emhRUGlZUW9WNDlHY3l6TndpYS8xUzgwbW9j?=
 =?utf-8?B?RHNrOGcrRm9KYmxmdGpBWVNHZGEvaERrcXJidk1xYThYbEEyZ2t5WWlsZ1Zp?=
 =?utf-8?B?U3o5NDVjWEpEWHRqNWxEcU5Dd3RBdk5KVi9FSTRnZWNSSTUyNFY1amF6ZmVa?=
 =?utf-8?B?dVJUU0EzNlBWWDVtT2d5aCtMeG9zT2h4dzYraitrMFZKOFNNUEl0Y1h4Qm1W?=
 =?utf-8?B?dDNFK1RlN0ZJR1BRMTg2ei9WOGtkdmJKK0M5L3FPTzNjaWdETVFVTlY0aS9z?=
 =?utf-8?B?Z3VQMm92N0pOekJZK3dJQjhZQmhwbndvV21uR2FsRGNhb1owZC9LZm1TSGo0?=
 =?utf-8?B?YjF3SWFLbGFPYlpIcENyNkF4TEF1dkhiZUdTYkc0NXhFUkJZbU1rMHNIeDZP?=
 =?utf-8?B?RXlKbFdZanhLY29BRzZic3h2aEIzVStxb2VCd2N4MFFtWkFEaEJUMU9NYzZT?=
 =?utf-8?B?UXJpRm9ReVZHUTZzakcvNFZSVUduSzBSekJicnVpQzhmMkNqUHJiZUVteFRw?=
 =?utf-8?B?RVJmcHZYcjdGYnFkSnRwTU8vaDVVeWF0T2tGRDhZZ0ZwK05tUVJma25ZYUFF?=
 =?utf-8?Q?zOUB7xSA8+xGgda74F7X46e67?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c538e9-cb39-440f-43f0-08db35ae82ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:19:43.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VgEpno+jo7JJVlWQf6WJvItBSVk/RcBNNWqxD8i8MwggAUOzfqXKnYVuvyGR9aqE+feK2PiR+sh0GmmHHY6U6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7034

On 04.04.2023 23:06, Andrew Cooper wrote:
> Adjust the API and comments appropriately.
> 
> x86_cpu_policy_fill_native() will eventually contain MSR reads, but leave a
> TODO in the short term.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



