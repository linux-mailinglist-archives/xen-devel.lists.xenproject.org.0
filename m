Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F7663D73
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 11:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474592.735845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFBQ8-0006qU-0f; Tue, 10 Jan 2023 09:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474592.735845; Tue, 10 Jan 2023 09:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFBQ7-0006ng-Tg; Tue, 10 Jan 2023 09:59:51 +0000
Received: by outflank-mailman (input) for mailman id 474592;
 Tue, 10 Jan 2023 09:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFBQ6-0006nY-Jq
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 09:59:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8430f5a3-90cd-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 10:59:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:59:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:59:45 +0000
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
X-Inumbo-ID: 8430f5a3-90cd-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxj/6fZwYIWRMudwi7gdaPMN2iZyfxm/Rq3QNmNZqcQ3sa+MN/PwQkHd/oOyJhyxPQTwkOJTdSbjPKF16Prr5CKRmEUML9dXEvc4PcFaIlSGsP0O2J9Ge/kO8RoFDi8hE3htlmMetgJjwfVIc4j5BcM2SIVlW3ajKlBJUFZu6W/JW+of12tMwoIacQhc9xENqjgCb5eomG8eKdDdA55rl/ZcpopVLiBFQbRxarlv0gqzAsw8hOHx6P+4n+PJ6jENeD9IUVPb+1YIB65pzMMkzrdilJwBljLOwTBZkYhNoDmaNcMMAmqXAO1WSFnhjhRYPPmCvZzOAQ3OBgp1uopYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJgTaLj0E3C8Gvf+1diGzcKyvH9w8oRVYT/kyGbpfTc=;
 b=S8UED2Ap7qGpA8x9aL7yQvdPARETgEYEBGXsQ5OOKDdp9GcwMcHyJ85VtQZjcqumDjAnJ1Mi57C9Z1a8NakOYjMBn01VPWZ5zsaOJGLR1POXgwdUj6fjVlgMz9OEIHzWUE/gJWzbCLsHDQNjVopnkblunHie5vBMVmFg1ElSKHXipokfnytccdUEbajqEM0KTcqDhPRqqpHYt6Lwm0t/pWJUxak3DFcKfF3CPoNnCqPO5OStyaPvHapmlEctoWfQQqFfKBii429vaEcsaskx1IW+hEtYC/JU3BasLCvv4kd627zmZgwriv52ju9FQUvwemZ9LhebyfBGNkOKo5k1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJgTaLj0E3C8Gvf+1diGzcKyvH9w8oRVYT/kyGbpfTc=;
 b=uPpslDZ+4ipztEd4Rdt59p02JiVjUfXN34EiYL0cG/mHy8esQsSG/tnTivos11oshGuPaeWZ2FCwvTXrQ5BanudgzyxYqAsmSryHGQSd3mh4mlO3fZS5utPpxtL0xfhKAnh3xa4OzuYi1Mq6xd0HfVXo/PdQpMseqP+hqvgNv49dV3+ZxFmYjLZq6wlGkeXieDLiT/r26zq51ePFWxIt7ZKyIVRTAYO5nrGnP4o7kUhtWxBoU0vR94erOKTEiNnc4T5GSxNGPp7H95zmHlZxiky7VHqk53iG1MuSNkwPV1v6fsk3Hv2IwG3Gs+CSIXIti+ujYacSdmS9vtUfvaPMuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c664437-7184-d4be-63e2-335942bb6a46@suse.com>
Date: Tue, 10 Jan 2023 10:59:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/17] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110084930.1095203-2-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5441a8fc-d943-4dde-c07e-08daf2f166ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SXEPyk+mO0fh5mGjXjS8qFeXyGX+DHLbGwh6+2/wzCSDGtCmncq+UWtjYKRriwzEX3W7rtkMa5uocqnpjMs4g9LqT9SqFjGjT44YlbndfQ9ctpXya9XBFAGxElR8AcUaEswEpVjQzq+TAgeXiRXNcy9QUCn0wk8DHH2iroXQy8GA0phcx8HGDAGcFepA+kGQRoXv0dUR0mAEkB/NgzeK3OxHX2pQV6FwWYEfTTxP1t4+TO2mBa95rqp18jdhOxLFqfSuDWsRpIw/BvOofyOHyohgX32EyWL/UU4/UJcW+DUDDZ5cROGWE/wuHw+FfXSY2fy2q2HgjH4UJzoOfhideYumGMlGa2gzl3Qc2dpe/BMS6yZ47MQYLibgXPCa1M18YY7EMOgNabaREykNJEAAiMoU7u9akrUUvigTW9Bp3McnN/gf7l8FEGmF5EihE+l7Cvk5SbwRPEv23czIbFVFm3lqMsuBZzod7NeamwoEa6nSUp0s2KaVvDO3mdM73CyKZStJ8fmBlgHkPSlNrvZsdc63Po3G00iABfUSt8mFp+26i9uqZmu0K+GqrFsBWBECdAo6rGQ6J8TJqsrfUe9taskGmQrzICig1BBkBgEZ7KTdCBGWWL9zkcd0Eh8L4goZ2YZU6vC5s5fbNzzsqyGYr6vTgpEKfEHTN2GX4uPcotnwcoY04SAEi//dQ0YRxYg5lMq9TC3v/v0RvSeZnQK/cev4JBK6b394GV+wRyiZjqRyGHdmspHbCTWygWvEVpHBMqKfDq3Ezaq8r7B3bhiE4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199015)(66556008)(66899015)(31686004)(7416002)(2906002)(8936002)(5660300002)(36756003)(41300700001)(66946007)(8676002)(66476007)(316002)(4326008)(54906003)(6486002)(53546011)(6506007)(478600001)(26005)(186003)(6916009)(6512007)(2616005)(966005)(31696002)(86362001)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmFXVDdsV2tTaEU5SHA5S1R1T2E1bWJMVm5aU25ibDJaaERXdUNybzc4OW9v?=
 =?utf-8?B?SVJoLytCVVA5eXZNOTdGWlM0enRGME5hMUJRWnBhNjROY3pRNVJxMGZJQ3pz?=
 =?utf-8?B?emZuRWhxVFdSaTNScGJ2Z3FzbmptU242Q2x5WFRaSWpDc25wYTIvUGtBaHNU?=
 =?utf-8?B?eDJBN2dqWk5PRUVUOUIwQ0ZHU3R0Z29vN29uUXdPQ0JNRk9JY3ROd3NwN2xt?=
 =?utf-8?B?RjFCSUZFY3FlRGJYdHpsb2k1TkdpQ054QmNkVHZEN2NnNzJXRkZkeU5ibk9l?=
 =?utf-8?B?U0pNeUlvaW1lZEMxVE5kT2lxYmNDTm1PVW1maE8za1BEM1VNa25ZYVpCR2Y3?=
 =?utf-8?B?bGtYeU5kNjhHNFRrWVpKRkxWQnlvYnJSeHd1UUswYytqNjFjbWRibXQ4aUtX?=
 =?utf-8?B?ZHRWd2NYUWVWaFo0SmU0dGFlRGVXVFVSaHVqWmozMXQ4RkdMcGFZblhDemt3?=
 =?utf-8?B?alZWVVI2Sit3aGxKZExOT0R5K3VFSnB6YW9tdDY5MHp5K0hYQVl3c2lGTGkv?=
 =?utf-8?B?TlhxMlZtMDJFUlFlWmUvUlczQm0rNzlHRG9FRWZQSjhqSTZpemxvaGRKM3ox?=
 =?utf-8?B?a1Nmeld6OFlwYWZDdGFxNVA1cEJXOUtYSFlPbFZOdkY0bVNpMmdJdlk4VTFs?=
 =?utf-8?B?V2tzU1RtaHZaRmhWTWZ2RUMyZjd6NGM5SjNNa095dllQNW51elhrTG5BYlBa?=
 =?utf-8?B?SXpzbXVsa293YjcvTzBYUjZMQWUxVHFIRC9iM0tIRGpjS0FzOTRIUTE3Slh6?=
 =?utf-8?B?cFpXQVAvVmpHcFQ3Q004dE9icmkyQzIxSDR1czdpbjRWQ1BSamVySm9oZ1VJ?=
 =?utf-8?B?RGVFVjVWRDlXWWFZZTg0dldLWTE4U2s0Y0xrQXlsUDU4ZDlYd2loLzg3SzZU?=
 =?utf-8?B?eGdYUjFtNWFLV0lIdHV0WWtsZGRxUUZ2WFo0bmRiVGpteUpaZW8xcTI1NGZP?=
 =?utf-8?B?SkMzN2tMWk10TUFPU3dPSzYzeDRQSmphNUdUYWk3VVhJazI5RHF1M2pCdWE3?=
 =?utf-8?B?a084Wmh4eGsxVWJ0c0NLbUc4eGpSVVQvU0ZvWUZlbEE3SEFWakZIcXJCREVj?=
 =?utf-8?B?bEZWWWo1SjVITW1IczhJcElITU9EYisyUjVpbG9oR3pPSnZlNDNJak5xMXp6?=
 =?utf-8?B?VUhrclBsUUpSRk9EcjYyNEQvOWVTamRDU0tKUUdpL0xITWJkUVE5WHFZN3JO?=
 =?utf-8?B?QjdFb0NZbVROMFJFa2dyU3hHaEtOUExGN0ViUFdReVJZZUJYNEdpOVg0ZUha?=
 =?utf-8?B?NzBXUXBnam0yK0p4UDdYUHlkSE1aNjRKY3BpSVUrOVhZSlFiN0ZtR0ZoQlFi?=
 =?utf-8?B?YmRYNTdwc0NtRFVqR2hRM1dFdGNoRXFiMHlSZHpjbFBPR3ZJbnVHVlJnQUZk?=
 =?utf-8?B?NEpEYjBzcHh0bFZXTXRXK3NqMFBHUklRU2taUlZCektkMFhMUXNoOHAvNTQ1?=
 =?utf-8?B?WDdVdTNwTDI1dVZMS29vVDNNalRMaUtDNVBDOHI2d0UreTNmUUxKUVFXMWFp?=
 =?utf-8?B?OWlXNGNNTDZZeEVjOHk4RnNjeG5HT1hJYWtDN2JDYXVTU3ZaVUE0eU5kM3Yr?=
 =?utf-8?B?WEIvSUZ6TVBYMGhvWS8wMEdRcTFybnZtMWZRdGRWTlZpM2FYQys0OFBTaDAw?=
 =?utf-8?B?emROUjJyRW9YckZmOVJuSmV0TDZRd1JJZ0dPSWxMOC9OcFg2cExQeWdCQVFp?=
 =?utf-8?B?Sm1rVkh1eDJJSEpYT0ZITWtLb0o5c2VnTGZIcU5FbS9jRGF4ZFBPcWpQaTZR?=
 =?utf-8?B?bWc2RElNMDFaaFc3cysyRTQ3anRkZTV3UVJXU0R6VSsxa0NMQkkwbFdaOXND?=
 =?utf-8?B?enp1SVpVN2svdmxYaEZFZzRtV09UZUFNVHR3WC9LTTY5TER5TXlVRUU3bmJj?=
 =?utf-8?B?Q1FZSEpsQmF4aWN2YUV3STIzNktzN3NSZEhzRWgyckxTaWQ4S0NoLzh4MU1w?=
 =?utf-8?B?SXRhV0d0ZTBSaWhNZ255aWFNamkvQWZrY0s0aWtPWlo5QlhFaWlWc1VUZFRu?=
 =?utf-8?B?STk3ZFF6Y1A5bEpoSkYyNEd2U0pGdFJKN2dnU2lTRmNYQzZoV3pyNytNY1B5?=
 =?utf-8?B?YzY4UXpEdmN1cDR6dndPNmE5ME1PeGFEcWNHdVlaRFY5b1NLcEEwTFA4NHAv?=
 =?utf-8?Q?TAGb2KGgLh6eJ9JWs9AHloJ7Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5441a8fc-d943-4dde-c07e-08daf2f166ed
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 09:59:45.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnAqYjHZ+v0NpntBDFARzaegHXnSgNdYOWLrbv+BqR4nVQWs8SKKdbHPelrhCeDctE61zidTYExZwU40hunjuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955

On 10.01.2023 09:49, Wei Chen wrote:
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -3,9 +3,26 @@
>  
>  #include <xen/mm.h>
>  
> +#include <asm/setup.h>
> +
>  typedef u8 nodeid_t;
>  
> -#ifndef CONFIG_NUMA
> +#ifdef CONFIG_NUMA
> +
> +/*
> + * It is very likely that if you have more than 64 nodes, you may
> + * need a lot more than 2 regions per node. So, for Arm, we would
> + * just define NR_NODE_MEMBLKS as an alias to NR_MEM_BANKS.
> + * And in the future NR_MEM_BANKS will be bumped for new platforms,
> + * but for now leave NR_MEM_BANKS as it is on Arm. This avoid to
> + * have different way to define the value based NUMA vs non-NUMA.
> + *
> + * Further discussions can be found here:
> + * https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg02322.html
> + */
> +#define NR_NODE_MEMBLKS NR_MEM_BANKS

But isn't NR_MEM_BANKS a system-wide setting, which doesn't really
make sense to use as a per-node one? IOW aren't you now allowing
NR_MEM_BANKS regions on each node, which taken together will be
much more than NR_MEM_BANKS that you can deal with on the whole
system?

Jan

