Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73F765467
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571101.894134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Xa-0005R2-W6; Thu, 27 Jul 2023 12:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571101.894134; Thu, 27 Jul 2023 12:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP0Xa-0005Og-Sn; Thu, 27 Jul 2023 12:56:26 +0000
Received: by outflank-mailman (input) for mailman id 571101;
 Thu, 27 Jul 2023 12:56:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP0XY-0005OY-S6
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:56:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf22a49-2c7c-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 14:56:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8635.eurprd04.prod.outlook.com (2603:10a6:20b:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 27 Jul
 2023 12:56:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:56:20 +0000
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
X-Inumbo-ID: fcf22a49-2c7c-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgEt9xEKaAo6eCf8PWEnAFRtzgfo/c9K8pl1dSvj4fVVTZzblgWHrEX/aNARZurZ1ZOrejq/aZpEXk2P97Ywd2QLyqTX6n+Tk2ngybQo6poQ2HQwH9zkKFJGDZNqAm46sAoMueGrerHBN9vDh2SG26D6QOrLUkPfdTtGSnj+KTrrqQo0ALateLavrPWtWvFg7KzNqfJ3DKS7ihZqc423U6yehND9s/M6Cevs0/bnELz6mLOU6p//lvUndllQ/wk3TtQ/SQiDCTprQMdfAmuHVt33yO/vxdqXqOq/zx46QyHQMazWxB3s7OPp8dMf2fWgFIjkOfjo7519/PxVa3BnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqTuOxqdRYjcFhoJ8Ynhuoq/e9E9lNi+vjuzPxL93Os=;
 b=Hw6c0KmtDgmuNixl5Rq6HXXhE6AhZHExAdONH84Nz5Xn5Qkbja3E9frsqxeS7V2BF3pC18g7fG7ecy259m+aq3tZtwzqBFdYZEWz+Z5cU3qz/XqB22eRs3MwmZLASAy45ltaZ4NRNhdaV/9gMUEUz5spmf3z/BY+D5ynsmsq1daDV0dfpbuFKj4pWBnDvuQyRRGBeTneWwF/sczBbvg2GhmEYEhxtvE8hqWhZZaC2ZOPZm3oRh0/UurUaIwmFnHTQg357pBFY7FQrvwnW0EiElY05PCrAiz/OiQO/LiGI4p1GIX+XISRMpd5TVhYZqNGeHW5YWDpk2GNiKW9yZ6wmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqTuOxqdRYjcFhoJ8Ynhuoq/e9E9lNi+vjuzPxL93Os=;
 b=G4kttvHc83KycHlDRscZCp3FqbFhPCxwTGev0mmbz7f4EqGpisB27PPZdg2PNwL3QWEGp+x4RdjJPhLM03qHJ33wq8HN5atJ2zrDwKHA5EzTMMohISx251TIYtlvYd+FwaCq+hh22NgSSWQXK6Ot3eEgTIM6P4cNuhZkwXYhZFfz5eAz52MP2NchKrQfoLC+cDIdC+STKfYQe89ZaRY7Y8ipucUGm2qCr2FSCvQh86YvBq3m+2avQ3P08apPg6njdhupkhPXeC3Z7dBmppfaA3Cnkc/cWAmcYlOZupVlQN2/2mBN2+vasQosx9KSMpr7zko//QEI06lPw0n7KB3XUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bef5cab4-023d-468e-bac0-2c71528dca81@suse.com>
Date: Thu, 27 Jul 2023 14:56:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local> <87y1j2b296.fsf@epam.com>
 <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZMJmJTkSFLKZXkKB@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8635:EE_
X-MS-Office365-Filtering-Correlation-Id: 134d3c55-15e9-43a2-d858-08db8ea0dfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9J8cO7D/GhUQjIceX5EJDkVCoTvxz+ZWiy7G7EUphjQ7newW9h1PpZI6Zs7Q2Rlkkz47zKAF4Pf999lvkLpvW0cDIZnMwfosgRhnwM0RMqGycoodeQqofA2csdYfKwO6D8knXH/WMmKDwW2BxvrZ4jKHIWXBTgw39f8S8qNWYUrFBY9L7eVVuVUoqTNthw/zXOEDnxY1uBSafCN2YnL9BvBBzP8Ow3yqs0zWe8JSXXjmrP/8mNEZE5h2Gt+C7CCStwb1qWEDJlKv3GkOpBTlhzUoiefMl6XFhVZGcY1co6mncwGgT25+idH12/EFE0/h6DZHeSRJKVM3dabsFhX8Dxj7VniAyvtEt89Wd/nP1WE5tAPUrfJXNbwO8B0zZMpvQUishD7ecNKXa8yF0eI192z8ADQ9sTVgfoSkLxxoOdZf619fuX0zB3anq7vYEDrM93VCdt+6eIZTtxKleKTqEo1gdwXMXZAGmMRbiLMjA1RUnupRhWQv+ZRy4BSh4yZa+Kk/xtkKifJj3D57Aviq96RXnhFh0Dz7Z4ljs2haJdYRfH2GJ/QhF+YPTqf6bLbJl21IWWbohKxHCbA1LD+fG3tX/15BZhENX13SahaTgsXYZsk4wAbHQRwdYOPdn/hE/DVNaMBh3Ewkcee0jp1pdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(5660300002)(8676002)(31686004)(41300700001)(8936002)(316002)(2906002)(54906003)(478600001)(186003)(6486002)(6506007)(6512007)(26005)(53546011)(66946007)(2616005)(6916009)(66476007)(66556008)(4326008)(38100700002)(83380400001)(36756003)(558084003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlQzd1g2SkV6Y3JLSGxUWWswRm4yT0hhaTRhUnBuMnZLNENkQlFpaW5wMGxU?=
 =?utf-8?B?ckp0aFhQc2JYZHlGY21jaGVlalFBd0g4aUtIMis3R3hYSlRabExLZnJnT2Jk?=
 =?utf-8?B?akI3WGk1RFovS01vcGZFQXJFcTgvSFNNWHRzMTBUTFpDVER5bXo0MEVYeUt5?=
 =?utf-8?B?UERoeFhHSGNGMWFWMGx0OUNRMWVwQWJjK2VrMkx6cmc2WXNUQWg1WjFGLzRk?=
 =?utf-8?B?SGdHUWl1UXNqaFFsR1EwVjdFdTBaZWdvL1hGOG1KYjVsZkhOQ3NPWDJqanht?=
 =?utf-8?B?WjlkRVF1TUY5UFFsYWJubmpQTzBSa2dZcXNBZ0lzdW5vS1JqL0RTUC81ZGUv?=
 =?utf-8?B?M1hUSmpWdjFtU3NtbkxDQzVHNTBiVDVZaEt1M2VQWXR3VGg5Nk9yRzRHQlBy?=
 =?utf-8?B?a3FpNDJDTTF1bjNDdkZQTmZEWlVBWmtLb3VCV1ZoNTd0Y2htL1VlT3pqcmRQ?=
 =?utf-8?B?QlA3SmRvYmpMNU11TlV0aEJYaTMrOHhDbkc5TW5Lbm40SXExTk8xZnFrSGZD?=
 =?utf-8?B?a0JkZk53QWRDU1lUZEdYdkpKWFExZUpiQjUwL3pDcGFoWUUxRzZseXpybjlP?=
 =?utf-8?B?SXZlbzRHWWJFdHVtQUxCYTE1MkxIVVBKWCtRMmdKYUpYa3NkelZ6cGVOWkNU?=
 =?utf-8?B?R1dHd1hoSzg2SmUvVGZwbmppY0FmM0dvN3FVWGF3MGFBSks4cVJvWUJnVEhQ?=
 =?utf-8?B?TTViYktVRmJrL1ZpOHZ3YkVaOG5Da2t5TW1JZmh2bTlPVEcvZUpjTFlqakhX?=
 =?utf-8?B?VlArM1pnanYxQUd0NHJZSjMwWjdaMUhMNTFZbzZoTXV2aVhLS0h0RTI5VTFX?=
 =?utf-8?B?cVU2Vi8zVHR1TUwxcHJodUdzSjYxZmppOGZmQnVJdFlnK1p0eDhaVU4zU1R3?=
 =?utf-8?B?SktoNGJscUxVamxUTEE0aDdOM3RabjZ4NmU4NlZjZ1ozVXliYW1RcWx4TWRS?=
 =?utf-8?B?UTdoc0pNWkd1RG5pUVNIZEpxemo0bisxbld1Mk03aDBGS2lKdHdwZjUyaDhV?=
 =?utf-8?B?bmlFMmM5S0tjVitUaTlHalVmL0dsTk0xVXVFNWR1ZjFTOVovVktrYTluSzYz?=
 =?utf-8?B?dTgvSmRTTnd0R3c2ME15Q2ZqYkc3Y3JLc3FUTVVBNXpPVTY5cHR6ekVDQXdW?=
 =?utf-8?B?OXV1ZnJuOWdUQmcvMTdtbkMxMExjTXhXTHpwQXRmT3NwNUVaTzJCN0FSQlVj?=
 =?utf-8?B?RFlEWm52VEgvQlhZclpaQlZkdW9NNE1EZzNIRkI0OHhoRkp4Z0ZZMmNtS1pD?=
 =?utf-8?B?ZG9ZemprSGZKOWJRVjhzdzdzWlYrWm9SRU02bXk1WFFXZkhiM1l1Y2E0dGkx?=
 =?utf-8?B?Q2xxS1FDbFlkWU0zVnQyaUh4R3FlMUQza3JlV2k4Q2k1VGhldDBxMXkvMlBD?=
 =?utf-8?B?dmtUbjFqS3JFY3ZBWFR3Q0RwbTJ5MGVtVXFEUmFHUFROQjNJSlRiaUZQZzlD?=
 =?utf-8?B?Q1A4SFV4L09UdUg3UjZ0ZGZTcW5ZM2c4UWRHc05DdTBsU3FzenEzSVl1T1lL?=
 =?utf-8?B?bmJJeFBxdFd4UFlydFhkVFQyZ00ycC9sbnBibDdKYTVwVFMwaS94UzJ4RzdD?=
 =?utf-8?B?U3k4T2RZOFVXdFgwNUExZ3pMM1Jvamh4VEFGbGladGhUa1BoZFVnaFY2Ymt3?=
 =?utf-8?B?aUk2MFpGTEZtNE01VWFRcDhvakZOYWFJQitYNk5ubDBKMkdlNUdMbDc3Y1ds?=
 =?utf-8?B?cFRJdXN3NWJoQ2NVbFZqQSt6cHBXdUpnMDFnZzBhMktHU3h0ZE0xNW03eExD?=
 =?utf-8?B?Rzc5TTd3M1ZHYXVzMGpiVjBRNmNiSmNrSUlUaWFONlN5a204L0s4eWx0MGdh?=
 =?utf-8?B?RTlHRVpSZVBUMlpJdlhuZ0t1YjdBVDVmcC9FbkY0WktqakJMQ3F5OUZGOGZC?=
 =?utf-8?B?ZjM5VGVhM1o0ZWR5a2JDbUdkRVcwUkZDdDVXS0ZYRFRpMm0xUnVjQzdRM3ox?=
 =?utf-8?B?bm5GV01IVzF2R3RscmxuckFLZm5zdUdrajhuR0NJSVBVYXlBU1kxUzN6Tzhz?=
 =?utf-8?B?bXlrTjdrcUVmU2NGSkdScGdIeTdlRm1NZUZpdXBCWEEzaUpQZFZDUEovY1Vy?=
 =?utf-8?B?U0poTm9qQkRRRFJKZGkrMEV0ZlVIbDkzeHdTcGxLNUM2MFBydEU2cExNWkZW?=
 =?utf-8?Q?WU4Aox05p9W44BedhvsF/4Cwk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134d3c55-15e9-43a2-d858-08db8ea0dfeb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:56:20.7375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5RHrk+euxkUpyGXERGOKhwtWWw2MLuz+IsOMdmb12Y2YA9FYvxAWbSdTAXjekrA2s8gh4tM9geUCygRa8AlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8635

On 27.07.2023 14:42, Roger Pau Monné wrote:
> There are also existing callers of iommu_update_ire_from_msi() that
> call the functions without the pcidevs locked.  See
> hpet_msi_set_affinity() for example.

Ftaod first and foremost because there's no pdev in that case.

Jan

