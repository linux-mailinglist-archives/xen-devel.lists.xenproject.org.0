Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7A5792F7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370331.602016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgOc-0005Px-Hb; Tue, 19 Jul 2022 06:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370331.602016; Tue, 19 Jul 2022 06:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgOc-0005NP-EL; Tue, 19 Jul 2022 06:07:50 +0000
Received: by outflank-mailman (input) for mailman id 370331;
 Tue, 19 Jul 2022 06:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgOa-0005NF-R9
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:07:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c7d9292-0729-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:07:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5315.eurprd04.prod.outlook.com (2603:10a6:208:c3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:07:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:07:46 +0000
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
X-Inumbo-ID: 1c7d9292-0729-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkV2uZaTgPKxF8AHDiZq8QsVvhAgErg8jXuCthJ3h3YMWKPqzgR3YgTuDic56kmfSL/SUlkxPdJLMgKCnfTDfDbMDrsxeTOMZgfd2qe4Md3CNET+YAsQ5f7QieTqD+rvHZYcnrlL2FOlgKsrL0gRBSGZX+5Dw31pg+wrXEg0bhzOEsShsCbY1an8iVyjk9U9i2appZ+1XTNvin5N1hT88QUyFWXlC6oGUtGpD2Lf3rDNIKExZardZNfaF14QzQT04l3UUxQniI9dxsVBbI1NM4C9l7pgS8nWAByYDgtYRis02vlE2mwKCidgMI5lWldJVtiNfTb0CMxZSgwHGZInEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQiFIUr281ETQgWNQUgPPgBy/1k1F/OjfygX0OKBCsE=;
 b=jqIcxH9HJm1dC6VzxQa/jgeqh5h6F4PUD0Ehsxzed7JDFPP7g3V43Nid/6gHOgO+iR4bLo6GMkcuX51EU0e4c1kxKfN4/AX8w4iL1JGacyoE9QtnMb8wha1jfNJ8uqjKx/PiulZ4mui2j5XnJ2uGR07cztiSR0WOfxVqtrYXMnT9vKQ+docHK59XtXAQCybvGsqgcweMhDKo/EPJ3JGhRtglmJEMi4jud6yghSDo0mW2Zj8fLM+VfiF5+8xtQzvu3AFAYs4eTzL4AMlVxFTMikCSo1JTdZ2WbAgkGyqggxIvsU88ZxxnwEv8oYt5hvGFGEd3dYgoI0jJDFbXwycK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQiFIUr281ETQgWNQUgPPgBy/1k1F/OjfygX0OKBCsE=;
 b=3GxSdJ+tO4FVD0RvUm1jWzfvsmv+bo2ttAMzl6X9UW/3vxO60WS0MuktOEIBMEgFELxHp+jiu4zZtwOdkxvY9o+Ob+58CK62eZt8zLo8YUzVTNhs/ZUFm2pJDNlWA4wQVHYJ7WJjj79YP34qRGKl1/qWtyZdtGTm/pAXH1ewmFzSVvmydnsLLxUOLbfXhJulRHQUt5G5nwrsmrgGVPPmEShyrNJo5RA38Z781YZIPqlWItmBRCKaFQlV4soe/vfjwSKuG+9+QODf8ZGRqTfzzigkn4ZwA6r+x6YzomOXaJ3zsXyupxpwjpfplAAI160pMde+jgpXrs1vyvPdF74A4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com>
Date: Tue, 19 Jul 2022 08:07:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718211521.664729-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:203:51::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43db62fa-1bac-4730-1109-08da694cffc7
X-MS-TrafficTypeDiagnostic: AM0PR04MB5315:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5M/cQYaqPs8qewFon2advmA02AiFNPpCL0y1ANFcHCBZULamDYVHOI3t/TbTKW3AHNrBr7gDfaO7KoRZ6zxt866XIf1vU9hr9IfsLpNXDs27tDTkNqtehkRhm+eTEu5JcarE/aUDUMPfCc0APJWzT3X6nRxw0ZlqYtNvC9OeIz2JuGVyor7B0T4GCiuUulm9tJNmExfAP5VtWTM6oZhvp9BrqkZa4m2yDL0l4NrWa3g96UuBCU68Mu1h1uLBby+dusv8P8u/+TzWARhrZmLxHlXNY6Zt4xXEGkkxkGDwrtJ/JS1i0PtXRLkMiHzlfMHs598x1aJcAm97NBPaIJ45OmKhd2LPLYVludaWB8m3YjDscDaHV18SoRCcWR6OnJzSjzpxUizwKj1No4vuB731KxWatdhmJn2vzohWjMZJSPI/yxWaxRw5SEwyM9KIYGDwJ0L2DpUaAiOPk3bJx6iraDCxr9lVVU6KfIYAtpAGVVjintcL15+1dLoDKRKcP6oZA5+vvrcROUdExn8nhG0E0MwxMcMGzRpZeJT/Jp/kqX/+bczKVmqBoTz8fHAAC5EYD/EbwukMbG08ciSnUY5VSGerIvqSZffQ2ZrdMxg6T62Qhw5Thsymhpe3uaLTwt9mZA2lPsC6xsA1Vd0IpcnPOVb07FR2PccijD4xTTRrlyh1rXR9AjtaoP6CZ09l2/Wf0BV02+pWWnGFSzTlxb3E92xaE9hNfNAkQrDFUgCqZUXtH4UL+1OxUHU5f4KqZwCgECPoFu7t+bYYzGXzuaSgRXvWIxEAErFe/QI0CO2YFrAbPcptvBMHu3KgZt/dD9UJpGB0kf0MUxxCtgIdLteRoQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(376002)(39860400002)(346002)(6916009)(38100700002)(316002)(66556008)(66946007)(36756003)(54906003)(4326008)(31686004)(66476007)(8676002)(4744005)(2906002)(41300700001)(26005)(6666004)(83380400001)(186003)(6512007)(478600001)(2616005)(5660300002)(6486002)(31696002)(8936002)(86362001)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU5mQ0ZnZktGdkZvN2xmSy9LM2NjK3VpQ0NxWUVVZVJLT0pzeTMrVVl6ZEl4?=
 =?utf-8?B?MkpaYjM3YVExVDRLd0ZqSWZUT0h6N1E2cU9HUjBzQWxVNnpSUGg2UWcyOSt4?=
 =?utf-8?B?akpJcWlJYW92dmxXc0w3ZVQzQ2E0VU56MUxMeXBiNTFVUVZ2REpqT3NvR2dh?=
 =?utf-8?B?dHBNWWttWnRBblpQQ2dtQ1hvbmFaei9Xd1dCbEZ2cUhQanhjU2VUWEdlT3RI?=
 =?utf-8?B?YkpaSUN6WEIzWlh0V1o1blVrMDFHUUY0L0I3UUxOaFhOY0RFeFQyeEVVdU95?=
 =?utf-8?B?dVdKd3JhNkdTSnlXYVVSWWF6ZHUvOGtLV3hIYXZ4ZzRQTUNEaXp6bk1KNERT?=
 =?utf-8?B?Z0ZndlJjdDd3ay9TMXlmalA0ekdCY3BuTTFObDRRNVJRS2RscWNKdVdhaC9X?=
 =?utf-8?B?dEV1NHBUUGdmVnN1dWtkOEZ6bmRveUYreE9CNTJVaGdzZUJiVUFKOTY4Y2tk?=
 =?utf-8?B?YUk4V250MXNRM0VNbnZhcDRFcmxvZGlsRFo4NnA0Ym1yWkZFV2x6b21nN3FB?=
 =?utf-8?B?MmNjY0VUMlNZbm14MnF6cEkyVGo1cVgvSE9nVnBnME9hNjNTWndUVlFXRjFY?=
 =?utf-8?B?NVgwR2w0QlE1QkszM2FkYi9GbW5KeE80THN2eSs3ZTFpNi9EUFR1WVY3NWVt?=
 =?utf-8?B?aVAzejBJMXJRTUlXcjd4Z0wrMDZRd3k1d2JrR0tIU2NLZEVlZ0p2QkZ4Rmpo?=
 =?utf-8?B?QmJTYmcxRHRLdjhwdE5HN3cyWkZ1a0NnaU9XVCtVU2J5QnVRUUFPZXJxR25q?=
 =?utf-8?B?aldBQ3A3aTM4S2xDNEh3bHJlWmxlR2szSnNpZlpDeTBVSEhlWUlUQUF5c1N6?=
 =?utf-8?B?eEplV1RxTm5BTVRkYU1CWGQxTjFwSmZQOGhTelNwYlFoT0paaVhndDdVblkz?=
 =?utf-8?B?bDhpU2gyTlMzc3RocEFvaW0zKzFJQ0FSTjN3OVB5SmV2UlVtZ0QyYkZDU1hE?=
 =?utf-8?B?TGVSNmMraFRPNTV4WTc0WkRSMm5ScjRDK0x4SnJ5U0d6TmhvRnpPV1dWWGFj?=
 =?utf-8?B?NVRxSmxRNDI0UFdIckdBNTZ6V3NYTFNOYzZhaUNCeEpCamJTeWw4Y2JGY21H?=
 =?utf-8?B?N0Q5VGNXTnBsUFdDYjhuNldwVnhFUEtMSDN0YlE3a004TGlVSWVmbzdEcEdz?=
 =?utf-8?B?U0src0w2QnVjVlZBMTRFNllpbVlWUm5rQ05udHkxN0kxMGVXbUtaQ3J0bktO?=
 =?utf-8?B?TmE4ZHhIODJYZFR1WFB2a04rdkZYSTZERmQ2KzlNRlpiZ3MxSlZRQllXMCtB?=
 =?utf-8?B?RXRXSmxnMHd6d3JkSloxN2NGbzYrOXRVTjhIQ09lMDBQMGNGSWZjQ1dGQ1p4?=
 =?utf-8?B?L001bHdSTW9aTWs0Wm8xWUFXRGl3OUJCelZIdGxsMy95UGdlTmZ0Qzk1ZG12?=
 =?utf-8?B?RnBGN0pTWHVqN2tzSlNrTWh4Q0hhUWhnTllHYkpna2RzV2dmS2JWZEtIWnF2?=
 =?utf-8?B?aDNjN0FkaVpmSHNiaEViR0JKZ1pkcE1HenVQVFhDUEU2cW91VlVyaGJkUkJW?=
 =?utf-8?B?SXErVVJzeHhUck1hRm80TzZsais3VXVIUVE3M0pNQ3RTenBCeU9kYkd4c2VW?=
 =?utf-8?B?dWhyMHZTMWpER05NQjFLUW41UGxMLzhlUGJ3UGhsdUt2RFdaMUhtZisyRnRs?=
 =?utf-8?B?OU1kZGlqK3p6T0pPeGJkMWtVb3M0aENLRmtBdEJ6NExoMXFtVklSYXZEUWI2?=
 =?utf-8?B?NkFKU1g5T1QzT0VVbVBDU2NLd1Riakwrc0FzNm1OL1Q5dEpmZjJTd1N2bkVX?=
 =?utf-8?B?Smp1TkFvdDRTd2VwVFoxZGhtMHh0YzkzWGhySFRkdDdCNC9xanZmR291UXF3?=
 =?utf-8?B?TGgxYW11MHRjdE9uWDlHMzZaYWtEYVdBazZzdWlITjU4ajZWK3pmUnlVTG5z?=
 =?utf-8?B?YlFYQm9VVksvOWQ3RmJWVVpFQUp2S0N5S2tSUjRUOTVJY21PUEMvcVF0WGJE?=
 =?utf-8?B?anpBMVpjNjhLcnFzNDh0V2F1OVB2ZkQ1RGE1blpETWFNU2ROcFl1dUxDY2RQ?=
 =?utf-8?B?cXBRQm5VZ0tiWEtMTURkZElrVlgxSU5xWnVDWTk5aWkvbHJOLzEyWWtzMTVt?=
 =?utf-8?B?cWtKdEJGeGdDWGQvOE5qRW9zbENyS1JCeUhrNHU0MnZhNmpaaWFRSFQvSjUz?=
 =?utf-8?Q?IOm6MOywLXxGmdUfOUOP27u8t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43db62fa-1bac-4730-1109-08da694cffc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:07:45.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+OzuZj6dB1XsF52wfgBo0Y727VlEamNSil9D+SscRkr6nQB88uSk+YAwTqP0mkjvcqwXLOaek/QqA64Ipw4RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5315

On 18.07.2022 23:15, Volodymyr Babchuk wrote:
> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
> iounmap(), but not added corresponding include.
> 
> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")

I don't think there's any active issue with the "missing" include:
That's only a problem once Arm has vPCI code enabled? In which
case I don't think a Fixes: tag is warranted.

> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

With Roger away and on the basis that I'm sure we won't mind the
change:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

