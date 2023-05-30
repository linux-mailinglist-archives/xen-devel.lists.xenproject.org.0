Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0CD715BAE
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541067.843403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wVZ-0002po-Lk; Tue, 30 May 2023 10:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541067.843403; Tue, 30 May 2023 10:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wVZ-0002mt-I2; Tue, 30 May 2023 10:23:17 +0000
Received: by outflank-mailman (input) for mailman id 541067;
 Tue, 30 May 2023 10:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3wVX-0002mS-T7
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:23:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc8c42e2-fed3-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 12:23:15 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9402.eurprd04.prod.outlook.com (2603:10a6:10:36a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 10:23:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 10:23:12 +0000
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
X-Inumbo-ID: fc8c42e2-fed3-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gS1C/lEgDFNcHFd7Vfi5yxn5XvihyXIJUk+yUDqxnCS2iBGn25LdVAoJZKn9HmdCWcFeuh9uIlSHnISuAUDMoXVrdaAnD9vPO+UMc1uVJRIh/6+gztGnKJXKrP10h65uB+PR4sarPquipcCXDDeYZjKeKbA3IG1fzePCk9cQ2nX8lQbfwDd/Sy3xMNtoeAK1UAENbOMP9Q+O4MpN4k3GR//AjGMysyJCuAq6qeEK4rqLmrvSl0mum+HZUEY4CjbNZPHhxxhI1bhmVFDmnNOlPL/WZYJzc0aYnGAO+Q90JsYn4FbJ0MQc54caDKEWBrVUXO6NrdcGk59h/2iLX/mrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vA+YNPVm2RUugOapgDwDHHEnURVq5x8/ZJkv83pTv4=;
 b=WWsNVqk8t+O5fKuB2hY72qNkupWa0aTlge8+khizkxgbHs4wwrWINCYpIePJoCad5Axretc8VhucwhiBHEqr7s0tlP1vR8xLzt6BA6pt1cAvSRKMrmSXuZyWDOOxT5aJwwJDayBEM6aWNwJyRxdc33dqWhSq9pAzX3vz9KLJndx37LT77LH34jaUA6y1DM0C72kg7bAI9C2iLX3YV2KEyXdqXC9JPPwpTrG8O0wqfco1i/Og5LEWbslTMFKBd+mOtOz7ZvxGFMoIuP+ZKynbx4fz5I9KnFAhSIbtw85oPig3mYyi8y0TWDcuNLezXoRX01DOoEksHpg+ywPnR9Pv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vA+YNPVm2RUugOapgDwDHHEnURVq5x8/ZJkv83pTv4=;
 b=DY3y1wPcNN6hwpr7TBAT39akzhjUS9guywjxp36E1beD8ig9VBo+3M2HnFBCgy4M/t8XxBxktleU7xn6LNH2XKlm/yxlBOh787rWi+FBZgVvoe3yrcdYwt2pp42nyn4s1LyICUSosR6IDSSYJFfOt5A4NlykmV4d9MkjQCnTKiqFjAjmcsdUjFLG3/5PkgCLo9vqy4YarQzk6CvSed/hKolAcLeUK/cz83K3fc3q46QW5zvqCliOTxTwOkFvIMYB0lqamrAlljVxeTU/xVxHyd1hP/wOfa+AMsKoi4OAoOjXowjwOF9nVyYjQLNxmdVR2sEuCR2A1Kpq5Ly3K1vNEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a3ecfc7-45e8-842a-3e1e-24c7f7d6af15@suse.com>
Date: Tue, 30 May 2023 12:23:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v9 0/5] enable MMU for RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1685027257.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: b31d4fe9-f1cd-4739-918c-08db60f7df2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3+pBYCjER6zHqYhqTJQdo4nUYWEM76828Lc99+559mYNb5o08OLtNmwBz8BE5lv/9rtnds5G+dAWsN2dngs1uFuZ/u+Pws8ieTKz5AJmFcIRauvWf9nUOMs5KqXgW45PolaX2z5RzyBk7uiGbU88AwR9oQEygnOGzCBBvQYmwr0cM1G5Tx5ono2Rigkd+Uo6tyvTe4qWuEneKzYD4OlpD3epkPbRsALeeGIIaFT0GUqSq6hprSR6P+veo7yepmmo8rz50rQAD8jA4NjdhZy91s+InGdzgoaXoyZKwbZe16/VFjYIOeRFQ1cA6DQ1UaEEbfQyp7hdgZMJZLP2qPZWHn9a2ESLLBnO2xLyEWq4aK+IamRF66dQsdsi8+6bdi4yV9o+9s1iBdmnnIbQw7orRXwBzEpMJR8e5X2Kyz2WSPHoec+Cn1cok1v53Z7LaBuduZueElYMKB7y4xdTsmh0f6zb2ti0wCfBA4rS2iwHVCwieQNcEz7un+/K2CSSGHXjH7myO/p/4HtrrcPPKTXlVXDqqfBR3OSoEj1vIFJQ5Qjyd1GYcK3XX8oc+IDJ5alGPmaVzu6FZWLI/4Q30kOWdHFysOsgCMoqWoQ93xARix9w5xFvat8M1fMGy8AMgnSbQL628Gt40mg7w1jhLz2/Cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(186003)(2616005)(38100700002)(41300700001)(31686004)(6506007)(6512007)(53546011)(26005)(6486002)(478600001)(54906003)(66476007)(66556008)(66946007)(4326008)(6916009)(316002)(5660300002)(8676002)(8936002)(2906002)(4744005)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09xOWsxZmNxdDd1VkRnM3V3Vy9wTG8veUt0ckE2eTIvU2xmZi9XMzBpSlZh?=
 =?utf-8?B?a0FsU2pmMHFGU3lVQVB5VWZadlN5b2pON0pjQW5IWHZRSTBJcFRTbWdvM0Yw?=
 =?utf-8?B?T0xwaDlSY0pwcjM3WUZkSFdlekMwd2RmNmsvTmpCdVplYlFXcms0Y2s3dWx2?=
 =?utf-8?B?WWs1NWFlSW9ZT0hVTTdzU0VWNnlQS1Rtbmtkd1NBa3ZIdmQ2d214a0tUYTVt?=
 =?utf-8?B?MzRoWEFodU1IL0VoQW15eWN1Y1o3bDFZMld5VkFnenhTLzhGTEJRUFdUazFP?=
 =?utf-8?B?am8rNDhrZEd3K2w3NEE2VGdYb0VhRTF2czh6WGZBcTk2RUFPVDJVRXVaeWdJ?=
 =?utf-8?B?L2xMZjNvTmhGQzVxclBtR003TzV0Q2RYMzlESVV1bXJxVm1jQmkwTGFyVE5i?=
 =?utf-8?B?bXhycjNvOHJrYTZiWTlOelJjZ0VyREVqQjNyS1J5U1E5czBRWGI5OVhpcmRp?=
 =?utf-8?B?TStCV0dVZmwwNjFKL0lWTHIrR3ZQcnA3UGZ6UkhSc1FhQUNJdU56ZXp1YXAr?=
 =?utf-8?B?ckx0akYya1JId0taWEN4UkljeVNZbTMwTDFFaGVISzJ3UGRCbExzWCtWNXZj?=
 =?utf-8?B?SFpQZzBoNVVxRkdHT25hN3o5dHFUYjduclNqaFJEWUlGalFEalJCWmlwWWlK?=
 =?utf-8?B?Vk5Pek1vaXVyNE00clFoQWhNYlVtd3J1Y00vTlNGbHNieDhwZUlTTTN6d3dG?=
 =?utf-8?B?a3VkOVErdFpnL2VybzBJay90YVZPTjEvZFdsdmZnVHZoRGh1eTFVa0VwZDIv?=
 =?utf-8?B?RkdOa3FFVy9jT2M0K0FCK2l4T2VKREtqTkgzTEVFdDFnYU5kMmtHdXRrdjlG?=
 =?utf-8?B?dG9CLzVFSHJZdGp5dFVhSzRLRy9NNzN6azdoVzhNZGJDQ1N3N1JZankyMHZJ?=
 =?utf-8?B?TlJHV3oxYzBHT2ZYRDFTL3ovMGx4ME5oMWNzNVRZR2xqN0UzUm1ORWFCQ2lK?=
 =?utf-8?B?SWhkQms5TEhWMkY2a2FOWTU3Q3YvQVdPZHB4TXdFbjl6L2ZodDhXRXZ1Mk9O?=
 =?utf-8?B?OTMwZmY4S1YwV1JtcTc4a2Fabk9mNHdMS1VRZm9PRWpZSEtBMFhBK1FRRm1r?=
 =?utf-8?B?OUsvVjVPUTlxc2RlUWU4MnMzdU1uZ0IyQlYwL1RlNTdWb0ozVTZnU0F4cXBD?=
 =?utf-8?B?Nm1iaXh6eEZUTnRDMnRUZDQ4YlpDcDVJSWpYVjZHaDg4U3RZbjZiVGhIV3pw?=
 =?utf-8?B?TUtoMENYR2dwbzZIeUlQRkpHN2plaVVvZGlTMDRMa0lFdjR1MW9JT2ZKWFNY?=
 =?utf-8?B?WnBXRENidmoyOW15RWM4UHpZVlA0aWpSNGRXLzcvREk1Rm56RSs3c0RVNGt5?=
 =?utf-8?B?T3c1WTBmeFBvR1lmQVZuQkI3R2dCUVN0eXdwVnVoSUViOGNsWjR3TkozK2tN?=
 =?utf-8?B?OXQ5dVNsbHBQalJVc3JXYmtEbUdLalk2NE9VM25WNnF3eFNZM2M0TFE1QWV2?=
 =?utf-8?B?amt1bjlieUVFekIwVjJOTHpFaStyWFV6cTZJK3BOSDA1eWZlYXhSQVErQnI4?=
 =?utf-8?B?VFVnQzdINWZadzhSN0w3M2h2R2w5RXZSVHlkZ3dESHZSVzkyM2NVMzIxY2l5?=
 =?utf-8?B?VlhSU2UzMTNyaUVDZUFCK3dDNE5sY2pLekhrUzMzakFUaldFbzk4S1BIRXNG?=
 =?utf-8?B?ZlkwZWNQZ2lQdEtEZXAxZVlUTmRoOUE2UWtYY3Erc1hlTlRaQko0YmEybGNa?=
 =?utf-8?B?aGx2ZUk0SG5NUm5TM2RFdU1uM2hzcGdvcURZc0F4KzhtS1RvcjBzUmFvU2Zy?=
 =?utf-8?B?R0tMV3E1eGdQRWYxM1B6QStaUDhWTExtRjZKOUhUa3ZXblJvOUVMV0EwZ1Zx?=
 =?utf-8?B?TkVIaVM4OE1ZR1Q5SEZPNXhkaDV6N2dUU0d4SVc0aGUwZHZ4dWNORDNsbGpj?=
 =?utf-8?B?eGltUVZiZFlrMGF5dUl2SG1ueFdLMWd6dG5KMEFhYkV5TVRKejBXdVRKdS9o?=
 =?utf-8?B?bEhKeWdVZTBmNGhHd2wwcmRicitmdWdmZFQxazhiSFV0ZkFJZ3RzdHoveUlE?=
 =?utf-8?B?cGUxdzFHenRoUDNtaHhscnBQY09MTnFNRnhvdVVOcnNkR1QzcWNieUJlWlcz?=
 =?utf-8?B?dzFVQkxrbk1ma1cxcmZNVW5PblljOCtJbTB6WmVPa0MrUGRTemZVTFgxTFhl?=
 =?utf-8?Q?/oeaUKEOMO5vhUFzB+JsvgNbl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31d4fe9-f1cd-4739-918c-08db60f7df2e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 10:23:12.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sak7m2uFf6cSkWhFePKbXQaLW1uS7owv2OaPZ8F/BI4PNKs641KjzxRGczdm4JuKUha46KLupGgx3h7pDBlDrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9402

On 25.05.2023 17:28, Oleksii Kurochko wrote:
> Oleksii Kurochko (5):
>   xen/riscv: add VM space layout
>   xen/riscv: introduce setup_initial_pages
>   xen/riscv: align __bss_start
>   xen/riscv: setup initial pagetables
>   xen/riscv: remove dummy_bss variable

While the series is now okay from my perspective, it'll need maintainer
acks. I thought I'd remind you of the respective process aspect: It is
on you to chase them.

Jan

