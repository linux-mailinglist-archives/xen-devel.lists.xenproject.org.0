Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6303977B347
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 10:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583458.913679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSb3-0000ru-Hv; Mon, 14 Aug 2023 08:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583458.913679; Mon, 14 Aug 2023 08:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSb3-0000pa-FB; Mon, 14 Aug 2023 08:06:41 +0000
Received: by outflank-mailman (input) for mailman id 583458;
 Mon, 14 Aug 2023 08:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVSb2-0000pU-KK
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 08:06:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef4b15f-3a79-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 10:06:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9000.eurprd04.prod.outlook.com (2603:10a6:10:2e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:06:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 08:06:36 +0000
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
X-Inumbo-ID: 7ef4b15f-3a79-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieicUKKZZ13GM5lT+fvHdr+5kh5GAiKgEx64Xue3xcwcoSXqTRp9skTq/xLjznqGJbUs0qyYRpZdq9XTbADYfxDA+PJZLBGvEasv+i/iFzJkqcrbJsGp/LessmvmHiILlMJ17YQC5Od49Fa9HE1NZ0LmekXgdggVJvlNCPGk/SJgQmsxEICzESDjxKHF9ceWlhnq3z+0qDcNYz3ctUT2rMXEV3G+dxKE1Oy2Ty6G1G99EUmbaojwgkkWj+iEUReEOBmjSfhI/7+22FtVRi9ERCK+oEuht74mcIl7Ibnc3L7hdBQV6eGmDOnA42VioU7FyG0kg8uqFTKcrcRrSlNB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCwvwuT3wlrhxit9Xdr3KOG65LXlXF1FX8oqnTj4SCo=;
 b=n+UhEmGlf7Ya6xB/ZfTj+09krnEKD5nTFUtNAeYeJZRVWHe3XiBk+KpduflIYSHqvL5dC4whbthlNW0nmQ7p9TlNd02i+mKWC83nowYh7Bc5X+TlNWQ4hmnLgFAYcheModZidOo/KITbYyZnDW0I0CbZmpyia0xUk+qHLIJpF8MClQBTacbk4aeuoJGG7IX0XDNHnm5jTaSVzE3X8d+qVpc24em+7habm3qCK/T25MB9qZ3XrTHIUzvcLbK8JaUcF9BoOB0o8uw3WlmqD+EtoJdc/32HwCy/Uq6raHfQ9G5db5AJf16YlzMfE0cJd5Ydy8FKDkZ9yGWUNTaIY+461Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCwvwuT3wlrhxit9Xdr3KOG65LXlXF1FX8oqnTj4SCo=;
 b=lJ6gxx8qTKtYQJOLVLS0ggqpyf8qHvrI+/Kswzk1WQIvTCyGvDAmULGhdGUtKBrDqxFimmN22Wsc5oTHhyEPn6d9ig7B9IriLsGHbKMpCYid5j1CoPp0oge3BiCN9A7Zen9U1tdFzJ6+gW/FkRYuVxbRcwhvwLCz7KRCxDwt3Khb4fq2O1On15E2bOsSTxsGD6x/J0OMDSO5NKqemvmFAo/6Y36rD+VsNuYpdnQxNay2nqv6Stz8dv6oYIjzq4lLgAGpz6PrmkSXOEg+RUqHVZhG9xImnSE6oWzRWxpggqOHX87s2b/8szQmJhSihWtfOXHDJ+N386lR/me+k44sUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd02352e-ac98-0c70-e9c4-7fb5dac01211@suse.com>
Date: Mon, 14 Aug 2023 10:06:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v8 0/6] RISCV basic exception handling implementation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: bdde7fb1-b998-4d2c-71e7-08db9c9d61c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dB7B4nRnsBHyk8CwC1IdLUN7GdpvuoGJyJsogv7yvSefLmyUUvvWs356vgEd9b3W/A3hJe4RBwWZVvrvJvg4zLsBW6JFkAuBRpgkQA07xxInqY8UZPuERXsgQ+1yCAto0ttDtlnMq3L+IHAPQa+ClL3XMAQKfoWikFADKHzlRs9/bjOFsYnktLr/tDoasOvh0Tn4bNRy20lne97tdByFclB7hZ+yNwrX11xk3BXzJMVkiOeC0ddW2wGAQlbYssvgErKL6BRATMMxfYgcgJpPMfmFiCKhx5rIpqHZIKw333dRItfcdA2amp0K1bbHT/TJiEmQW1C3xw+Ipg2/NqrrWsBpTukXjLS/MWn9gLKoGZ2ffq4Ea7VX4KK7+P9lPCIBhj2YcNNOFf+mNB0X5QmkLHuzbVaHVg9Od73G5INneWjRbinRCENXn424PGBaXCn8XhLLflbxXNZqXiiFOePZ+xtcueGdvD8lIICY2aBJy3VpXbkj1MqgV67/8PCxgmuVyNr6keDrxuRR7d+P2KkhCprMaUMWgcpDWLwL9uQmobp1g87OZqEU25QqYJQ5umXxA/r/h6RYs5yopTxzudcKCkKn/g4hxtZo8h7AtI7zPGKdxyJeeOcIgkJ3yEo3lXzYXIb/XFPfBh5hqGgM4HfltA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(39850400004)(136003)(186006)(1800799006)(451199021)(478600001)(8676002)(8936002)(4326008)(316002)(66556008)(6916009)(41300700001)(66946007)(66476007)(54906003)(38100700002)(53546011)(6486002)(6506007)(26005)(2616005)(6512007)(86362001)(31696002)(2906002)(5660300002)(558084003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFRDS2s1ZnF0N09Ed0JiVTNLSTJHdk5DY0hsVUdZUEtpNjB1QVhoNGg5Ukxi?=
 =?utf-8?B?alcrcmhSM2FDZ1dlKzJnUHRhT1M4UnNxRC82U1A5cCtNbFEvSU8wNE52NjlS?=
 =?utf-8?B?RVNwajc1YWd6bGo0TDF6clhWazgvejE0SlgycnVjKzJoNEtQeUdLdk9PSURM?=
 =?utf-8?B?L3RFRC8zY3JHYkVZU0tCeHp3ZStuNkZpRFNPazg3d05zdGpQbWl2NThibUN3?=
 =?utf-8?B?ZEpCOTQ2N3FXakMwZEpxdm1EUjZBWENDZVM3WkkzYTVqM05LNVlUc3ZOS3RV?=
 =?utf-8?B?QTBqcEV5V3hXZEVGY3hIRkZzRHdDUmVWbGQ2UytoQVdnK0dDamRadEJVWWhO?=
 =?utf-8?B?TG9tQW9vT3B0UHMrMC9mbHM0TmJHa3FMTkY5aVNybkZwKzBUWnV4S3R4dmJG?=
 =?utf-8?B?RHZoc1JEeStkOHRHcll3TFlpV0xuWC9VdkFLbkhBbXJCL2FpdjdiZlZIQlRr?=
 =?utf-8?B?WDJ3bEhWd25KbXFvRzBrUkh3SUhENzQ0TjJIQ3VDbGlVczRKWXFNcFhQYXVv?=
 =?utf-8?B?OGdsQzNWUVA1dkxZVWl1STNEUVpoKy85WW8vR25Qa2lNbFhnU1RWejNPa1dD?=
 =?utf-8?B?V3FCQ1hkeHFzYmc2dTZ4NVlIbTRLR2lOZlhMM0pKRVZETkZEWEo5Q0w5RUpT?=
 =?utf-8?B?U2hpRHlCRTFXdmlKeE5tZk1iSWFQazdkT3hDSVk3QnJDSzFsQnNjaGNmTnZn?=
 =?utf-8?B?NVRhTWZlUFF3TUI4VkZyS2hxM00zeHJHTUlmVGVrbEJScTRGcUxiUTlweDdW?=
 =?utf-8?B?SnFNeVhXSEJrWlI1TmV1cWVveGFpTGlCdmpQWVBYenNGTC9YU3I4S1dWaEhj?=
 =?utf-8?B?ZnJ1ZmRaUTQvSy9RYXRQcE9xUnhjRlY4OVh2MUtydGZBY2dlVGp2MkYzOFBX?=
 =?utf-8?B?VUtseWpYN3U1MkxrRTJqMDVVejUwamdnSFpmWXp0TnRUeVZUeGxhNTZmYzFU?=
 =?utf-8?B?US8xN2lzRVREbXBDbnV0RHU2S1ExNWx2ZVZRcU9UZWFlSHF4eitsTFh2WnNZ?=
 =?utf-8?B?MnNhUG9xTkt0TmdPcEhsZzEyekwrY29ycXZzcTZjcFFyWk9TTlBxSzZmQWdp?=
 =?utf-8?B?eGx3ZHk2WWQvc1grQ2I1Wk9HTEUrYVNpMm8yeFMreEtCZVYrU0FZYVVxMk1V?=
 =?utf-8?B?ZlhRd2hHa0RBdFVSRVBWRHNuTW1IOEVoSWVieGNzUjh3Syt1VW9pOE1DNkRV?=
 =?utf-8?B?S2I2eHJLV0RWbEExZjlvaUR4NUlNYTF4RFQ0YUw3b2FhMnZHMm5aOGpORTVC?=
 =?utf-8?B?ZzVKT0gyR3NBTHdiYVNObmJZOWk5OWxhVFUyNjdmYkdTK3YzWSttZFdnZTBK?=
 =?utf-8?B?c0c0MEpVTzIwVTd2eHhaQy9Dc0JsOE1LdWpHNWhhcXVJZ08vRE8vcHhHZ1Uv?=
 =?utf-8?B?bXhkQnNyQ3UyNUJOTGV6aXd0dDhxTFZncTBEYkp1Qy9kQndJUHdlOVRwZXYy?=
 =?utf-8?B?WnVvWFU4bXNrZWtxZWQ1NXJlaUh0bDByRXB0bVJselIvNnVCQVVzN1FMLzJE?=
 =?utf-8?B?bDVOdWV3QTRFUHdGN05UbTkyWnNUdjFWcHgyL3FPRU9NNjNlYmdDbGlzWHl4?=
 =?utf-8?B?bXY5eUo3QWpPZGR5NHVnVUhZR2NPVFhSVWRnT0ZDOVJxVDgrM3lDdDhmTlM2?=
 =?utf-8?B?WmRUKytSekY1VFNsN0U2V2pkejBROUNhWUY1bUhuRU9CZlk4SVU1cThvS2dQ?=
 =?utf-8?B?c2lnQ3doM1ZjWGxobnJQaCszZ1pnZ1lTVjc2YXE1QkN5MWJEbWNFWWRET3R2?=
 =?utf-8?B?S1pmL29VRmRPZit1UW1LaGE1eTQxTDUvd3JGOXhZVXZNZE11WWRqUzdnUWty?=
 =?utf-8?B?K2ZJOU54MzQ5Tkl0bThJY1lSajFhVlJtWTJYdytiOCtDeGxLL1k4Ry90ejNt?=
 =?utf-8?B?MVVaTDJsMEg2YStxKzdDU3hobURQaHBtOUx6T2xTRnJuN3hlMEpwdE5NM1pu?=
 =?utf-8?B?akh1aUFKWDdXRklzanpCZGhiSG9XY2xUU1diSVpWWURXS0dYOHRqK2hieXVQ?=
 =?utf-8?B?TXR6RmV5dGkvUzBKVGV6N1FKUG5IdkhKYXlCQ3k5Ykt4K1dEakhNZVo0cG1R?=
 =?utf-8?B?T0lzTFoyYTFwUTViZW9zbjk2TFNpTkpBZzJkenFTeWFQMW40MWF3MTQ5R0U0?=
 =?utf-8?Q?U17GFRbtYVzFxyjXzinZUAUno?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdde7fb1-b998-4d2c-71e7-08db9c9d61c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:06:36.8393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeB9E28nNVDOe5jq8V2bv3qbZ7b1VcjGcWEnLn5ipgrUJBaZrfGDjHytcWCssOTmvH/bz3VcN8IxGxvWyf0Lsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9000

On 11.08.2023 16:32, Oleksii Kurochko wrote:
> The patch series is based on:
>     xen/riscv: introduce identity mapping [1]
> which haven't been merged yet.

I've applied the series here up to patch 3, which looks to be the
independent part. Patch 4 "conflicts" with the missing bits.

Jan

