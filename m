Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075D17920C7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595397.928950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQfV-000696-2T; Tue, 05 Sep 2023 07:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595397.928950; Tue, 05 Sep 2023 07:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQfU-00065w-Vq; Tue, 05 Sep 2023 07:40:12 +0000
Received: by outflank-mailman (input) for mailman id 595397;
 Tue, 05 Sep 2023 07:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdQfT-00065q-Jg
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:40:11 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe12::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e34792-4bbf-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 09:40:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9370.eurprd04.prod.outlook.com (2603:10a6:10:359::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 07:40:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 07:40:08 +0000
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
X-Inumbo-ID: 70e34792-4bbf-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQA7GhtpOcpjajrcN8tP4BsWS1xijlY9QTDOv6uoCMp2XP+uWqO3D0SczQX3IABWCWoLR0/CPjbH8NHR+p9nTqggDglAN7uzmAiLOpyv0Q1C4Lr3gvQq2LNWR44VwntptVhiloTO93BGmeLs0NR/TqGe1EWBRcKiuP8PMQZXyJ6pR4JgaA9NbjXojYNcsnzbpVa04HBm+Ba4Y0ExkOdG4AP7vvWUpKaiaQVUNpvf14gr0U5IHc7u/US9UfI1QzawhEiTDsbKa2z+mS/WtXca8QQbV94rW4Ay74y0jLp3D3ykzH8agD7EqLYd3XlTKGZe/TFjf2//2/tqOmCu9u0H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDGwdodHeI8Exek8Qg94JKUD6WpPOC1FCUmeGauuBDk=;
 b=AJ0hj6PYq0oNTMlb4pazdClMRdDE7IegAPqeWyZDYSQvFMQTpDzDrXlSpO1mK9B64FeQlzWYcbzYuDmgOZlKn+Io0g0cTGGiRx+4StGOdCCvrj3eFtKdiCRfErO6ZiQNR9fET6yRha9RiuGhy8iQ61QvrsLoa0c6HS61ZkykezQ6jF64afuzWz1Svtc9yPfKLAlp4T6lMl2R3/Vmku6kAAmsvyBzzVNS8rsx2t0VoZLGaAuJzwHINGpi+oBrWZoJcDvay9e/VYUaPTTbq0Ef4zg+mlwlP8DvOSAdlfj5Jf5XMWQq90+Tti9/kj9mKv0EWWumfs4vLdSoX2oeo+Pl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDGwdodHeI8Exek8Qg94JKUD6WpPOC1FCUmeGauuBDk=;
 b=i8F8n4ZurrSd0kWN2ivL6USgNeRmKatMKZVH1mUc2RYNITtcVWiLH23rwHyjBW6fPi73V7YYOg/p50xm+EX6FW1b2znJnBK+Qfx/3gbU33uzBPJdMH7UnpDqxhsG8d/QGXWRXT0BZBPnUsE4KSFMZ+7ynIgqfkZVWAga+6bu5c6lZVfg68AGMgnv4Ecyv7wvk5VqopUIKO+2NFow31jJOnsG+PNcsalDcWJpfdCqILHIeZUaZPfU7PE1pZhsGqoqTdJgS4XrTbG/OuYKs0pkyfdBSsAXP4wqQYUjtudvC3BxI1WKwDJN4E4H/ewB62pTLRS+/QE1IWxGoRfcc7UshQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcd13ea3-3da7-17ec-6ed8-a983454e372d@suse.com>
Date: Tue, 5 Sep 2023 09:40:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 2/2] xen: Change parameter of generic_{fls,ffs}() to
 unsigned int
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20230905073135.12360-1-michal.orzel@amd.com>
 <20230905073135.12360-3-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230905073135.12360-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: 74cc26ad-96ce-45c1-7bb8-08dbade35436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EITn/vH5xMCGaLbZC9C30UyP7lY0gniemfLbwLp/m63Zo8odnCtk+oBY22LJdDDlR7+yDsmSKJNb09IUdMlkMmToQH1HzR2+TqJBz2O3PrljhgLDGvCuEO0AveHOXtoqgh4QlKWhjMCgMmOoVvFZWqIvKU9ag+j+cnNVBdhzI7phZ80yCdanhaNERom/PDtFCdJ9HLEyX26nOvoF61nGYC0hPmoIVQS4qG6k7G5ymM+eCFsSZVfhsynlWucBiAOvCu+o1zeBcAJdmCKnHXswPnRI70E996ulhoVISbURkshtxJQvCty1OB2Op254MHRd2x6kXVskBBqj0Kd9h+8GJlR8HyAqoRNFICCoIdbF0WKtpBqpLyqwjpdl7SoS+ZAuOZFyVV61LfwZuzNtYdcCaZg09DzHJ1lvXiCVVfwukJLlBne75NOG0re3e8YE1w9YNFABgB34C9V/jWdkK/YG8GtxN3wywn7Z5Tr3A7l36/qwmGpCO9Pfn6hOeaeUAZwLzGjuB6mlzwGOXTqoOCu2z4OQUMkecEez+Pr4KLOFOyxTIyr+P0L3r/rfxqH1rnO/23774JJb2qkN60n6+PVUglOiKGEMe3Uqa8nPtYEVwM/kILeatFegDb76lPeibAwgYBC/lyndY05ypb8NUzBVNOWx6fz10oRM7V6v3CMZKvE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199024)(186009)(1800799009)(53546011)(26005)(5660300002)(2616005)(66556008)(66946007)(66476007)(6512007)(316002)(54906003)(6916009)(6506007)(41300700001)(4326008)(8676002)(8936002)(31686004)(478600001)(6486002)(83380400001)(2906002)(31696002)(86362001)(36756003)(38100700002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNrSFJCbWlzRGFJc2hRU3pRM2NTU0lxZDBtUlZBRjFwOFcxR0hhUW40SnMz?=
 =?utf-8?B?QkV1WGJLcVJoQjNzU1liL3l1aTFETmkrNWxqcVN1dXV6Q3pQV0FzbVFmTVRW?=
 =?utf-8?B?eDNLNU1SZkdDUWtnWkQ5UTVoM3hCZFcvZDkramhmWURvYnBiQnMrc1ZVTXhK?=
 =?utf-8?B?bTd1UFcxRGN2dXJlcmFkMmMxR3BEbDZNT2ZES3Rnbjh2U2VSYTJuV1ZoZWU0?=
 =?utf-8?B?SG8vUlJkdkcrL1NBS0dzekhMVlpxOXkyZEt4ajNwUGdJSFhrOCt0VzQ1RTl0?=
 =?utf-8?B?V0g5SGk0ZFBKOVA1T2ttd2hLNnozWG1Yb3ltbURkbzNMQ04rQ3ZSWWJaeHBo?=
 =?utf-8?B?UlRyUmNnR1RzVDNsak5YWnFyMjhNeXdhOVhyZjRiNlFBQU83Q1IwYy81UG5F?=
 =?utf-8?B?YXpuK2NaSk4vM2JmazA0T3I0bmh2eWl1dVI1K3ZET3RMMkRxT29DMU91eHdp?=
 =?utf-8?B?WStJTVNoTks5Q2pDY2IrcTJyb1dId3RQalVGT0ZHaVVGZktvZlB1MTBRMURR?=
 =?utf-8?B?eGdVNnp0NjFIeVNENm4vUHF6WWtyKzQ2ZGlyS2ZOU1l6OXpkc1lIUk04ZGo0?=
 =?utf-8?B?TVJZTTZ0Vkt1MGlDT3dYdkMzL29RRnVjbjM4M3NtY2R0Z1ozWDVFSSszNkJi?=
 =?utf-8?B?ajBQTU9hUElXTFNuMkFQMXlReS9VSkdOS3NCVUNxOHZlck0vaUpIendaQkpB?=
 =?utf-8?B?ak02S0tDM2JRSkpzR29uZEJlWFlJc0hNMVRPOHJLbFNCb0E0bnJ1WmpHUnd4?=
 =?utf-8?B?Q0VqbTJTNzJMbU9SMWNSYUt6RXFUZy9ITmpjNW82R2FUdkU4TmZiNW5WZ050?=
 =?utf-8?B?K0hWRTlvL0ZnL1hUMTJVeVM0OTIvZ09sYnc4TkR1ZHNaOVF3d2huVFlNSkJR?=
 =?utf-8?B?d21PSWNZTDZ2dVVRUG0rN2lmSVV2UlBhZ0crcWczSHU4UGUwWHhHeVdzeUcw?=
 =?utf-8?B?QVR3QTRBSUIrRmIzRGRjNVJ5Zm44OWlPazZ2eUFtMWwzcVo5UFg2UkczUlU3?=
 =?utf-8?B?eVBUUTE3SFErM0J1cTlpYXZ0MnpQQ2dhRmViaWR3d0JYVEhEdmdPR1RCS2Mv?=
 =?utf-8?B?R0JYQUhUL3VKeVRSUHNtZnFZLzRlZHlKZHZYN1V5b1JiWU1OTGpvd2FrWEU4?=
 =?utf-8?B?L2dmNzdNUWVmeEVJcjRpM1kzaHhBam1GSm9LdFZNSEtXNmtYTTNHRFlvaGV1?=
 =?utf-8?B?SjVXQzZIZFduSVJsVUY1Qms2bWlGQVJzalorY0Yzdk9lUGdValc4clhhWE9O?=
 =?utf-8?B?bHdLMm5Pc01NREdVTFI0bmV4ckFWYUliTzFlbk1RUjk4c2Z3SFIwQVArL2VF?=
 =?utf-8?B?WVMzZk8xRkVjUVR3SzBJMERuQlp3TExXNUJBOGVUUm5sMXdMNUczVmNyVk0x?=
 =?utf-8?B?TjA4NE9NVDRlK0hndS8xcGdRenQxWitlU01KNUxTSVo0blN1UmI0Y0dHaVNS?=
 =?utf-8?B?a0RKcU1wTnhXM1dWQ3ZtbWR5L2NGa1FNMThGb053ZEU2UHhLVFFTdjlkWTE0?=
 =?utf-8?B?V211R3A1T05Bb085V2ltd1R5Z1BBWW9acFFueTdnOEE5SCtGd0tEckJCczVq?=
 =?utf-8?B?Um5EMmcvRVpxTlJWYTBjTkx5clVVN1J6ekhycnJSdjJ6dmNHbFNmNEo5QWh2?=
 =?utf-8?B?dTNXVHlBbmdWSkIxWkhHdTNBU0c3bTRoR1gzeFI4eUYrNmhSYTFIK0dhVk8x?=
 =?utf-8?B?ZXllbnZZN0cxcFNRMmhaNFJiOW5YVUp3a25jTUJuejRBM2lKQWliRWxOOCtQ?=
 =?utf-8?B?NDlhUGhseVdyOTU3Vm52eWs1aHVrNFZlY1luZnVLOFRhV0pFSjd4NWtWVFRu?=
 =?utf-8?B?TVJleTNQY3B2MnVBam50M3NVbTVJWWlUYjd1U2FZc1dST01uNXltUWYrQ21y?=
 =?utf-8?B?aW41dlhLNHJINmQrUFgyaUhjTDJkL3VRNkFISjFXajZMV1YveHZVSHkya2lH?=
 =?utf-8?B?Z1BCT0lhOHNiZVVDNDJ2S3RuQmExWXhvSlZGbkNtTHZMd2p5VmNaQkdJUlJS?=
 =?utf-8?B?dnR5LzNjMkRyTkRoY2wwZGxwQk9ib3dkRTVFV3AweSszWVcvZkNSVVdiYnVQ?=
 =?utf-8?B?cXI3SUg1OFNoSUtqaVhVUTJIMmpLbWJxL3FpOE04NXh4SlJDNU9xblVJdHV2?=
 =?utf-8?Q?ldD+gLn/ucjBNKufrFfg1GTGq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74cc26ad-96ce-45c1-7bb8-08dbade35436
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:40:08.6762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQqp0uUpHoeVlG837rmWtgk3PoOUUyK2GxGDOcsCqOi6zUZZ3RcGw26GJNq1T97EORuFtmA3ZeZ8x5VCKVf0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9370

On 05.09.2023 09:31, Michal Orzel wrote:
> When running with SMMUv3 and UBSAN enabled on arm64, there are a lot of
> warnings printed related to shifting into sign bit in generic_fls()
> as it takes parameter of type int.
> 
> Example:
> (XEN) UBSAN: Undefined behaviour in ./include/xen/bitops.h:69:11
> (XEN) left shift of 134217728 by 4 places cannot be represented in type 'int'
> 
> It does not make a lot of sense to ask for the last set bit of a negative
> value. We don't have a direct user of this helper and all the wrappers
> pass value of type unsigned {int,long}.
> 
> Linux did the same as part of commit:
> 3fc2579e6f16 ("fls: change parameter to unsigned int")
> 
> To keep consistency between the helpers, take the opportunity to:
>  - replace __inline__ with inline,
>  - modify generic_ffs() to take parameter of type unsigned int as well
>    (currently no user and the only wrapper generic_ffsl() passes unsigned
>    long).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



