Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF067805FB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 08:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585794.916977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWtK2-00017Y-1l; Fri, 18 Aug 2023 06:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585794.916977; Fri, 18 Aug 2023 06:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWtK1-00015i-VA; Fri, 18 Aug 2023 06:51:01 +0000
Received: by outflank-mailman (input) for mailman id 585794;
 Fri, 18 Aug 2023 06:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWtK0-00015Y-7K
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 06:51:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96631315-3d93-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 08:50:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7176.eurprd04.prod.outlook.com (2603:10a6:20b:11c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 06:50:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 06:50:56 +0000
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
X-Inumbo-ID: 96631315-3d93-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXskbTA6PHB1Medm2MJz9RrlBX9K4QjOnyjgq0jotIlMNJJ1vb52Pk2wu3ul7sJ7IIR3xmD8mMe8Pt1nPgYSpGeR3vno+QzmVUUTzyn2tzFLQKxk+ZHgam5SKi27ER+mO4OHjyuK/UPSmUZ1H5QzT1iS8Lb0va+Ma0iwGcml16OccAwfPwru4HLQdtUfZXWqOwg7eIw1Lz6R2sn2dAgZepUcX6F61yTn/Nb1wqoB//qS7hFfBmqt6a0guuC7pi8Ju8wB9D79iP64C5JOvI5Hgi8w8Rz7ldub6k106Qd/Gma3G9LuY36e4SsXd5KrGHtE2MEjCNlio+SclV2NEqOfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7s1+R6tZTHRX/faqws1uxQoWFSUf5hbELCwTFGIBJo=;
 b=WC6D615cs9WDFz0yOyzv1CVwwMeXt7Bc8Zc35lVc84xZvM4iVcnh3EmB2cXTya9Asvf8uU53AzvUzC/3G8fsJELUQNzqT7z+/QgJnL8tIEqE6kheX2qInmrkTjrWgxu6CMLUt02bFR4JFgiB2tQxE7aij5NSf+FABq50/byuz4o61QEZeCwV2WpfKLU4BQxYdn5wU2ZcWmiYROqRR52KxNWhh3k2mVxDvQpHbsH9Y3zcAS/5vjo/hiDuPC4oZ7iHTiTiAufGge2URjjuMzQOw08wWaYlCuVwvSBGV317k05rinOZ4+Ax7lc1C9PHJCR1dQt5auERZkfOVxg45gcKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7s1+R6tZTHRX/faqws1uxQoWFSUf5hbELCwTFGIBJo=;
 b=vAT2jqlIqa9aW6x4m5NFEgGekRtOMd68jmsdiSsyZ8b+AFib8bBqavgzrOExL15pqoATdkMl1+I7u4duCdah9RPPO8CpFewpP5NI/CUrweO38d0R1BbPdNJBR+Hlt5zCmU7/bAOjokvqVJP9ikMwsKaChhcjDYgiqG13z7r72swggvrfE1kHsvz3H/qeUWGLRwkSus8guNPfyzZuK99fcYW/TK4Qay9b2oM5OKQ9Der9lXJy6Ws6KVN2rYUpG6sVtdLNMj0wB+jdksJrEyyDDhRhOHfbQ7SzpHq3jIZTqlxkUgX2YLus2HNaiL3MhzbnOKXA0/jgVutK+ll4q3vuwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <622e33b5-7fae-ba1e-0100-667cd9b50ceb@suse.com>
Date: Fri, 18 Aug 2023 08:50:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] rombios: Work around GCC issue 99578
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230817204506.34827-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230817204506.34827-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 8323adbb-e2d2-4e42-7892-08db9fb7793c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uKhLH9iTUPL0Jsezs6lWwEFIbCKgz6VR4yzOno5mv4PylH97GkeTeYwPZp8vvT3RSOBvqS0uSWE3sjqty5NeRqKSz68vCuzbLYMR3Kvv73IfXL8ONTWwmhDFpZlmoEQdcdGeUYfWXk4GvzHZC7/NMolBJCwLItn0AMV3KgTaAI6VyU+YDBjCJfHQIdZF7mXVm4wuyH0qeuoSYEvXKJTK5mry1vJMO092rJ/9LduYNkDPkXx6EZAxl5G8cttB675gVLOT+kjgxUEoUJ2MFLolU1ym5OaQUEFnYZmkvMKG+NwjK0V3HxhMI9XIvmwCpdXJ0X4to3igE706Xf39DkY6zjfV3hjWtkfMzyF1Pfw8pI23Eq7MfYoV3Pcvpj/WoitaWb8WmwL/r439wkucMby3LBo6YtR3+p/i8V/09cgGQrqAlG/f9/tNLTHHUs93MiiznupzrrzsyqwFmyj+At1ZfJ6cRXVks5EoV82Yl53a/3UVy377+ltlpAKLe/WIjI9HrbqipBniSym3eA/SYvcF18ncYMvWD2Xfxq+lGHCOBAJ2zaS+vefTKemBvGeKvJYSS5H2x5dBRTYZRzdOKql4XwHG3qQW0vGiKSpbdaLtD53wPa97URAmfO5uOaDypLS3A7/og9NeeUCJydC82ECJUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39850400004)(346002)(396003)(186009)(451199024)(1800799009)(31696002)(2906002)(4744005)(83380400001)(26005)(86362001)(478600001)(6506007)(6486002)(2616005)(6512007)(53546011)(36756003)(5660300002)(41300700001)(54906003)(66476007)(66946007)(66556008)(316002)(6916009)(31686004)(4326008)(8936002)(8676002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0g1VElQU0FwQnMxUHNvU3AxcWhSQk96QkkwSDhPRCs2TlUycy9QZXE0UDEr?=
 =?utf-8?B?Y0YwWHFFbmdEdk16QVYrc3haQ2FPbG9uQmNiaWNqYXFkUVp1ODBBOXVJcnJD?=
 =?utf-8?B?Tm5GcnlDT3dBSngxMWcwTDR4aXVGUUFCQXhNemtYY3RNUVNKeU5xblZzYndZ?=
 =?utf-8?B?TzRrUEYwMVc1Y01WS1JKeXpFOVdIb0tVNWpiT3g4aURLaXVwTWlaZWY4UHRG?=
 =?utf-8?B?N1NQUVEzSkVjUWtlTVVUWVVIaGxySmkwK1RnSktGUXhOdWNuZEh6NjdEL1ls?=
 =?utf-8?B?ZTZkMjFaak5JdlVvWXpjZ2pEVm02V3o4ZHQrUUdYUndsWXhaUjUybVdvWFlq?=
 =?utf-8?B?L1Z0dVpEd1NUcWxiVnRJRHdYS2phZEtUNUt1UE9QMit1UHl4YlZJM0RXYktk?=
 =?utf-8?B?ditkbHJXdGE0eG5QMERQMk9PeHJjdUlOcGhtZ3Z4MlBHNnJMeFdwYzBEYlpP?=
 =?utf-8?B?Y1NpMG5oN0wzYnN0dlJlWnMvdkpkNWZPeFhFSlZHN3lIQm9QYm5nODR5TkJ5?=
 =?utf-8?B?TElJQ1hFeTZYWDRUc213TXVHMENRaHppd3JqZmo5Z0IzZVRuanFYbUxqeEtF?=
 =?utf-8?B?Z2dqSjNoV2xFNkU3MzZaejVrUmVmQytpMlRJcmJ4L0swSHBDQjluUXFoQXFQ?=
 =?utf-8?B?VnF3QWJMeUJEUFc1WnhjaW1pc0pDbFRrMzFkS0llWXkxdFVLbkR4eWU1YkR1?=
 =?utf-8?B?OVE1anNPNDEyQ2lqLzZMa25semVOKzVrZTk2aEh5dzhQNmN2akk5UWVlUytj?=
 =?utf-8?B?SXQzUzN4VWF4eWRMU3NWcElTS0FRdG9NSDZYenZOOHFJbGZjeFJ1eDRTMy9l?=
 =?utf-8?B?eWpRclFSU21ZMUZlZXpIME5yb1ZvcThFdjVEd21BQkJpMUZOZ3F1VjhyeDNk?=
 =?utf-8?B?dDhzSHIwQ1lUaUpzTDBHYmEwZzRxNWdwVjRkV3d6Mmt1alJidUlLOTQzcDZz?=
 =?utf-8?B?b1ZqcklKazdWVFhoVFFKTFdPd1hUVVc5SUg4Z1lkV2lKNEc0eVFqVmpIaW9m?=
 =?utf-8?B?WGRaWllYWW9SVkx4YitvWlBnYXZUc2lpOWViN2RNZG9vVnVtYkI1c1pMR3E2?=
 =?utf-8?B?Q2hrSDRxanVyeUVvZVl2ZUZMd0JyaitmMlBQdzNOcWZWYkd0dGMwNUdCZVl6?=
 =?utf-8?B?aVRQWCs3NjdPUDdEUlZiN1RyelovMy9jSDJhUHQrN1Q5dTAvN2VxUVBJQkZR?=
 =?utf-8?B?S1dFamY5RUlHYmNDNHNqUjl1ZlhJNnc2NVVhcHhQODVpbVorQ3hnR0hwZFZt?=
 =?utf-8?B?OEdWUG4xWGNDOERhcjRFanJOSHJ1THhDTzg1YmV5YzF4YlRSOGsrOHJXc08r?=
 =?utf-8?B?NDVma3dkWWU4cGpJek4zVVpISUxIMWQ1N3BDZ1FYcWt0MmdtQ2w3YmRLN3I0?=
 =?utf-8?B?d2g5OG9OYUpFcjJBTWVjZy9BWStyMmErZFN0dzVrVndicEd4bGFxNUpqWHRC?=
 =?utf-8?B?Nm9TdDZwYmZyQS9POG5LMFZxcXNmS2JYd3NaTEZRbDMzWVNYZkxaVWJLMEF0?=
 =?utf-8?B?WnhSaUd6UmJLdlJJYUI2ZVpPUEpWUVMySTBtUklTZUg2WDVSdVF5TU5QZmNL?=
 =?utf-8?B?eGJLeE1FQlRJMmxwS1hFVjE4MHA1dTB3Wk1HbjQvSXNJVG8rZGVVWktiM3J5?=
 =?utf-8?B?ZnQrWE8zdXJ3WFpubUxuQjJxdlk1RGhVUFVVemd0eW1zUDdoSXdpVUFZZk10?=
 =?utf-8?B?UmIvVm5ZUHhwZVVTWTVqRXVPZWJzcmZFWUpyelZMOCtJZDlPaERYVlFtZita?=
 =?utf-8?B?aDAwU0VpUXd5cGkyblcydHhBUWEydk5KYWpvN1F5QmV0NzVhWHVPYmhCcFF4?=
 =?utf-8?B?NjZwY0s4ZGJOK0VueUtCM0hWY3dTTEVweldsblJUcFlTZDJzMXFPR1duWSsw?=
 =?utf-8?B?NktIWVFKTnZ1Vk9SbVBqalRvVUM3eWNrSDI1OUI0VkVhdnZ1UGVTZnByN05l?=
 =?utf-8?B?ZU5vWGNXdFpLekZvWjF0Wlp0bWwvamtWRWs0MVRLYXRSK2dhNWJicHl4dFNB?=
 =?utf-8?B?cGQ1MFRRY2Y2VTFRbTg3TC9tK04wV1RzQyt6cnpJb3ZpUE5udVo4cFFkRTJl?=
 =?utf-8?B?NFUzRVRNbnhQMXd4cEVjZlAySVljRldGdVkvNXhVdGNENHRaL1JuYlk5Z1kx?=
 =?utf-8?Q?+fktrvtvJ1C5YmIrhU4CpnLO5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8323adbb-e2d2-4e42-7892-08db9fb7793c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 06:50:56.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QChs2QFOJn6NFgZPmXx47L3cYnuXRkebhvSD4oy19ONHf/AiMvPLP3vLCUGM1mTTd+KjCSozPg8Q8MpuNFOBcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7176

On 17.08.2023 22:45, Andrew Cooper wrote:
> GCC 12 objects to pointers derived from a constant:
> 
>   util.c: In function 'find_rsdp':
>   util.c:429:16: error: array subscript 0 is outside array bounds of 'uint16_t[0]' {aka 'short unsigned int[]'} [-Werror=array-bounds]
>     429 |     ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
>   cc1: all warnings being treated as errors
> 

Yet supposedly the bug was fixed in 12.1 (and the fix also backported to
11.3). Did you spot anything in ADDR_FROM_SEG_OFF() and this particular
use of it that is different from the patterns mentioned in that bug?

> This is a GCC bug, but work around it rather than turning array-bounds
> checking off generally.

I certainly agree here. I guess it's not worth trying to restrict the
workaround for rombios (I will want to try doing so in the hypervisor).

Jan

