Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65AF7D3919
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621508.968049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvk9-0000XN-5Y; Mon, 23 Oct 2023 14:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621508.968049; Mon, 23 Oct 2023 14:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvk9-0000Tf-2x; Mon, 23 Oct 2023 14:17:21 +0000
Received: by outflank-mailman (input) for mailman id 621508;
 Mon, 23 Oct 2023 14:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvk7-0000Fl-8d
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:17:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df7e8015-71ae-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 16:17:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7049.eurprd04.prod.outlook.com (2603:10a6:10:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 14:17:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:17:17 +0000
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
X-Inumbo-ID: df7e8015-71ae-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTxmHWhLBj93Kczh5Ol9GKzYOYHPeFqdZx07qn3vgp2NfhRohAj0v1noZ9ozC0lHFyvs/AELGdtCOJJJ1HE+KfwvfcQ/xmz7B7r+wKeHxepHwYsr4DXyDqLXtp/CSMeVDmcTRPERpdXzb8mm5PnMPTFG5l2oXMht2ARIp+LK0nJODSZg+dKuAwiVVe1tXvJJ2ji7TYORPC0CWS9AMbiNAFUaNA64hatdBH/fZaf77J3oMf+eBEXzfo9nqjoc3QmYarMfTpU3rruVvz4C51cnSdGPNydZL9ycgF7KyerVIy26Mi6SS5RC3bSXUWzWSSUKC77ucbgeHK3rrbndyocpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGhLvk0DpygJ/lDfOboQZAttyRQS5ZEJF3+k/QjPUJQ=;
 b=A72QhIf26M7q5HBk9YroMs43fPttmqOmy0g+oZxZ4VQx8XQwCl4W3lu3PrTYgf0C92UH2qg4yxYFryg4QaGoBBObmbljf7eCAUpKH4F6MjBquR4XDaA6mKGYehPTdVz8JT2LaX/6gyaoSdtWRJNZIUdt93f4plQcavUPHpcG+awITMES0dAKKkDzWP7+TpuTC9+LTFio88PQjaiYXMjzdivweFJczRismVVEDTDVW3TwSE161EX32SqDuGYBieUaNfA3MOqdrhiq7lNLw5+GfPVA2xhYW5QDkZgpo6Hfs5CQWM9dq16f9SgD45MMfLxP8vVy7TMXZMUTlIXUjcPEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGhLvk0DpygJ/lDfOboQZAttyRQS5ZEJF3+k/QjPUJQ=;
 b=FdDzTMZeeoY5YzDkdyIylyg1Yq2ppXbrE5PGV/URe3QXRBZ1IoOcEKE8Nz2DwV8ALDnnXaVzQv3ZatTH/qm1VbbHT3UIe3RDNhpCiSw9JhOjGtN8PRbvUD/JMX70+w9OURHa5MWo0QhpHxLmirCVqqplTwtZD5LctvFCkfiLIFI8IqjgLJrZG7id675I+Tcun+xm0CTZv8QQ5mU3NViIqMz/7jWFhMzuyI6p9+p82Jsgkz4WimqmtaQw/ffbfPjf5BqEyD+0SkAXPXkYT1q3iEBZi91X7aVbruMZpbTdUgo0TjHA6Yk4CojV2cqcyhEm1gnirTSDUvC/j9fg0XN4Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d042f0ce-3b29-18b0-457d-764f23069bed@suse.com>
Date: Mon, 23 Oct 2023 16:17:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 6/7] x86/vmce: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <f6df2bcbbe4bc0050edc1d62837d5e9a6ff56064.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6df2bcbbe4bc0050edc1d62837d5e9a6ff56064.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: abcd9d46-37cd-48fb-3077-08dbd3d2c2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UifMEnvOJQj5uAcIFuGB7wXxud9bz5/xuWLET15GzOLyNGmEbbMDH9X5cmekb1D1YOrh1zJDRYB0l+pWY1j9iFWbRMI7q1o+iZpy+CsZwRJB/n53uV3S1oxiGpXP5mZ4G4doTTLqGIcAEgx/nEU8hOcot7DUxqPXuSNAmkMQGU8wvFyi+2qUlLJdbT7AXdSoP+ef25neuGVhkyoQISwbqnc2lGmOGNHPY14KKmSjEKEESd6kyMjUyvowAy+eOQd7hbU5Qssr+bUu38FpjaqIG21Lc1J6P5//DX0YN8OL0+BlMMH7qtogUTUinFenjbZXHqR4zk9LbLXh2YeY3WcGnJCWblkBlFTlSeX4Zu7teDr+sfcMOYlkXIfMT809PvISxVx0a9NVx/nGTmOrQM/pipKtoi6GYKKPG5od0dFWRks0uy8x6LNAR4w7mokNvWy/ULFxFqXOpObjxvj4L5Rmg3/gIssprRqcPQBD8Vui8G6JsmvIxvskeoeniehG720kzF0EjyKIIUZaBrKZ5ey71kAWkvWwvb8SYwJb31UGoZ0PfMpa6gNyJuo3EtZoBPMUVtUWFO6TwsVsezgo05MFRRoEcT/z4r3hhky90XnLxEG+oF54r2JZrKxwzcbFPAPQfozGslB+hkxk5H3WLAZfcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(31686004)(41300700001)(38100700002)(2906002)(86362001)(31696002)(5660300002)(36756003)(558084003)(8676002)(8936002)(4326008)(2616005)(6506007)(478600001)(54906003)(66476007)(66556008)(316002)(6916009)(66946007)(6486002)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFV6OHNxaEdPSEFHNjBEUVl4bEw4WHI3MTVFL0owaHVQQTdWZkt1SnBFQys4?=
 =?utf-8?B?RVY4aHNtdlVGOUpuUG9iK1RZcEpvZXRnWFMwL3pLTGR4N2RIaTFHdjc5c2Zp?=
 =?utf-8?B?aVJQck9leDRvS3g3NWNQbmNCTEdvQVBHU0tCQkREMTNkVlZsTHZLR2JzS2hq?=
 =?utf-8?B?amRqcGZadDZCVHhvR1M5Z2tZVWlvazQyNVk3NW5rOVcwenVOQkFPOU1MbzY2?=
 =?utf-8?B?aE1aM2hrVVBsdldweU1wcCtQenNuS0ZxTklNTFhXNlFGT0xTWmUyeFA1a1o5?=
 =?utf-8?B?YUNFOXRxVlRGR2Y4RUtETGd1eEVydk1hZGgvbzgrSFVZbFVLY1JMZEJEQS96?=
 =?utf-8?B?dklTRE9yY1JHQkdLcTJPY1VOYVpoUGUyVjRiZ0JMOXg2TkhSMVU3Q29VN25B?=
 =?utf-8?B?WDBDdXhlM0hOOXZxVWR0aHlmM0FLQmRnNHVvd0hvZ1pSb2d4QWFnb1I2YUxs?=
 =?utf-8?B?YzkvcGRxTm5wNitWTmRtQXlZRWMxV2JDWEt5NEo4WmZJODF4dVVFMkpkT0Zk?=
 =?utf-8?B?U3ZPdVpVWGVQUlR1NVl3bm1ZVXExTmlZRVpiL2FSSzg5K3ltcmRzVU02YitQ?=
 =?utf-8?B?dlNGSEdyVytldGF4czA5Z2QzWm1JZWVlOTNBeWRvTEVBT3dvcm55NlREWmlD?=
 =?utf-8?B?Y1lDaHZKYVlscTRxOUlETnMrKy9PdU5BVHQ2S1liWHV0K0duODB0dHBOWjJo?=
 =?utf-8?B?Y28reXBVczl6Y0o5bUVjSkQ3L1pvZzM4c3RoUkVWdmpuMlR2UkRZQXF0dkJB?=
 =?utf-8?B?OUJkYmJzdWFMTTR2dmRJc0JUTDJsTVhaNkgvV2dJTzV0TVkvUDBSbVJaeDRq?=
 =?utf-8?B?SkNZSzZkQW9ZWHpsb3o2RzV3VW5rWlVwYzlYakFUclJDb1RJc1VabzN4SkFm?=
 =?utf-8?B?SmhnNm01UllnaWUwWjAyQ054azFpYnl0VFV5U3pJOFQ5OXJlVVFiclVWY0JL?=
 =?utf-8?B?cmxIZi9EeFYrOVFjYng2TFJtWkxQdlE3NDlKd1RubkJnTnhyc3ZMUHhLcTg0?=
 =?utf-8?B?SkR6R21LbWd4UlRSaHZRVkk0dFJJY040Y283SzVUNFRvWURZZEVpOG03ZmNN?=
 =?utf-8?B?TVNVNWlOQUwzRS84Q2lHaXVjWi9CdkVYUkZ3MkU4aGNWcW9QZmlkcjVrbnZj?=
 =?utf-8?B?RzBGcGZVM0pEVjMyV0ErQVVwR3RGQ25GMlduMThFRXFkMEFBMXFHTFQxOWdL?=
 =?utf-8?B?aWM2aHpuTGQ0YmZwMUZLaXpIVXVBUHBFUjV3Tm5VTkl6YVhhbjU0S3ZFVWdT?=
 =?utf-8?B?cGRYSVlyemR2V3VvRy91cHNpVU5zVEluK1Q2Yzg1K0VMekg2N2ZXMG5HZnQz?=
 =?utf-8?B?N0c2Z0dLeWhnMEVvK1F6QTRrYXpuYTVuVFgwcU1FNVgrNE1KSVZKb2NBMVZU?=
 =?utf-8?B?MWZvL1lmbFV6V2J3RzQxdUd5OS9IMlUxMHZaUHBreElBL2x2c2pjVXJMbkFy?=
 =?utf-8?B?bVhCUGpTN3c3S0FNTG05bllkbGpHeWlka1FCdGdjYjdtQklZb29DNVpGdmV4?=
 =?utf-8?B?NXJkcWJMMG1RV01ONGlQNGlHVEdOdmlEQXNmQWpwaXdqTnkyZlFDYWpYSHVi?=
 =?utf-8?B?NDJJSWpzZ3k4UlhQQXJ4L1BGZXArQmR0SmY2VTluWmpKWVVCbVJiZCtXbnJU?=
 =?utf-8?B?TmtNRWxWbUpGYUhtSSt6STBCWUpENW85elpWaUVGQ2pnd0RBQXFCT0xzdFlV?=
 =?utf-8?B?MVU2ZDYrQjluMkpzMDZ6R3dmcEhpYndxRTB0bHhPQjNXSkZJMkxudlNyNUVp?=
 =?utf-8?B?bytrOFQ1Vy9PQWVhZ0FWbGQ5aEh4RlVNaC9rK2dPY1pZQTdQdjhKdEFnREov?=
 =?utf-8?B?dHc5MEM4TkVRR0U2SlF0SzF2ZUtHN2RPQkE0N0locDVOelhHYkpQUHNrZTZI?=
 =?utf-8?B?R2xMdllIOTUxYm9uWkYrdzFNdktVeSsrSWMvRmJkRUw3UmtUaVlBZ2kvemxQ?=
 =?utf-8?B?L21IRG96R1ZsRWNoS3BaU1haRGNpT091S0trQTRsd2g0UlRBbmE5eTNiUk9u?=
 =?utf-8?B?cjVEcm03by9kelIwUkx2UGx3RGVLaDFEZkJOVmZuUm5UUGU0V2RyNERwOWJB?=
 =?utf-8?B?N1UwWG1hbFI3M0JjZ2YzTXliK21iOFpRaHl0NUFkZWhWVk1JYWU0d2FRUnU5?=
 =?utf-8?Q?EdWA3DrNl3s/ilk4SM8XHSu2B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcd9d46-37cd-48fb-3077-08dbd3d2c2f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:17:17.1840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8kRP0l7t2sNH8CsWcAq5M7yfCID5NQBN5IScrIUaXCzUcrqWQYem+W4120uPBGC8OoDOab1TgHYUycmOADAPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7049

On 18.10.2023 16:25, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Same remark here wrt folding with patch 1.

Jan


