Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8244870EEED
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 09:05:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538772.838989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1iYl-0001aT-5H; Wed, 24 May 2023 07:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538772.838989; Wed, 24 May 2023 07:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1iYl-0001Xp-28; Wed, 24 May 2023 07:05:23 +0000
Received: by outflank-mailman (input) for mailman id 538772;
 Wed, 24 May 2023 07:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1iYj-0001Xj-Vk
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 07:05:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57bd8342-fa01-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 09:05:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7750.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 07:04:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 07:04:51 +0000
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
X-Inumbo-ID: 57bd8342-fa01-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLLn+2EfbmKfw3MtY8mW54rhgAPqj2qdstxx8U0FVBM+gLVUXQJbIitPV4PuUnT+nLAylYgqsPgob6Zawq5kR9KsSmJBQaqj/0doP34VHWbLscvrBatloD1cYhYYUz5gjvwXl21KBG1WxqWA7OK4ydyfn4yGy+SLTh1h+Gbam9edTK83xr1NJQqo1paPWyPHhHOJ6EDGLkPfd7WH47eTl1er2ZauHSltPZaPuDmSN2GtVWW7hkNVDLXIgWYCqjkS22IAr1t/n3swt69m/iY0JpC4Cu3xUUaypIIqeE4bmNRCT34W9UOMrVFtDcOMUFwoPRnTkkJCPKCwEHgxb4/OvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byzwatVIY7htQyENJLt6VmmEaooMTR/zZB47gLDq2VA=;
 b=STav1CQ8oz1OltJYHNCzkY+FV/NYwsq1tIRsoUpoNXxSYIytHST1YucqWKtfGN4yEXs73mc9KxZUKW2hdxJyNDY4gNfP3NSadEepS/sIqGVzjuFYo4wtE7E8R0kP6RfVV7ntYLcMwdu1I4h9+9uBK6MW/BRavAXNtyBL0Z5H+jbb2ZELCpdrMAUt1a2wo2YCj6yK6b350CLAiZZlbBKVH62fjgGBK2pc756TEVuPAA9g+7A9+uzwaStAVJxj9iWHoV3gtqYoIt9iNA5nKpSQg7diGiPwM5G52GFKmLRc4Zg84eKc6xYdRAv3mMVgmAMkduL7FTn9Rvf98qq6UthSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byzwatVIY7htQyENJLt6VmmEaooMTR/zZB47gLDq2VA=;
 b=MkPn1SVMjwe1DPUcih+fImZCh7uuk1JBKC0LGXg4SNbsqDCWEmAp/+qi8NcLB6KiR8h3+kL2fsTnSaJGsJm4AYM+II/tRrQXHUaLOGYpgxKIgjjZYMFg6kI8AU9yRnrXtx0pIf+kekF81yrtmMbvgFEhUpjqZPxqA6xJwGH6MYA1QOxwMdsMAE+mKOFrb2i0vidBI3W/ev8xS48WyYMKQUlOXAzo7o8UC8La3ytB1JMLpFpnuacSl2lFN2baP9yVN8cKuDI3omlLH82a09f+bEztX+/mjtItnAq1PUuON4ASPFZE+E38TshvUFbhzAuzJ0yuuUP8HbBUmIhk8y0AZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <faf07a3a-df48-3bf7-4dc2-92fb734c4e2d@suse.com>
Date: Wed, 24 May 2023 09:04:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 01/15] build: hide that we are updating xen/lib/x86
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1b34be-41b1-4b05-7b90-08db5c252af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uHGd8XJKfeJ3XQ1HtPT2lVCKZ6tEtz/Tos8+jggjRXhlFpV4R9AGkBoQ0IOs2pjJ3LF+0TEqIxv67WbxiKh5MHi0oZR4e3T0X3QiV4P05l/YLPU8xgNDCV645XtMWLhjCKR7mhqBLc4SoCHNeNh5fCQB41Pn58K0DOOh9UbgLOB6yC6W+/yeZrQG/hZjK53bq3wtHGYvd2xY8CUpMLfMDb74/wydSSK6WlKLewJ6zr7kwQ31fZUvdgPLTrOzInbm9knNBZZmzl0sfB1gCcvBmuI9a0MHg2JtgzYWZyjbxeCbslkvbFEJe+ehyIhXveoVCKcX3Hn1sPlcC3t2NjKOZYJ5TNwfOpfM1vaMn4HmXIk5yEOYHWpu1NnnKEtclew+5F696fq1qmySX8gQ5EhvKbz+JWdckCBfb9bm5Rk7FoCb5+fQFxuht84VHqjg/5yxdixEI93K6RpzkraxVKNpdLJhM6i8nftBO4eSEW/H/sC6ONZVtVbXBHDWRyPnJMRpkoLQMqg/VBplR8rUbMSgw9LHyCCfKM9mJcOdvVGPqFMmZGo5DCHQxrCdrYfPSY0EJqtmLg7Z++qoQulbAY+yC1597jkBaD6AA3Scozg1Gjiqs3YBPySTR6e1FkxHrSjURr0CwXf1gi10dVGiBx5VXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(5660300002)(8676002)(8936002)(31696002)(86362001)(558084003)(26005)(53546011)(6512007)(6506007)(36756003)(83380400001)(2616005)(186003)(2906002)(478600001)(66476007)(54906003)(316002)(38100700002)(6916009)(4326008)(66946007)(66556008)(6486002)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkQ0RStlbVZod0xoVDBDQzRwb2ZzWmYzSUx3MzJnKytxbFl1TGpZTUFhbU1a?=
 =?utf-8?B?MG1ZUG5KNWdNaHpwVjNRczU1bjJ5YzZ5WThhMmpMRXhVNC9yMDY5alNkNW1l?=
 =?utf-8?B?UTF2S0RqYmhjOVV5c1NmVWZjeFNqZ1dQVS82b1h3TFlsSlBDbWVEVGMwU0JX?=
 =?utf-8?B?QUV2OVBaUnYvWGZNMTF2UVQyZ3NKSzlyeTVOZjR2NXYwMHRqVFNrbXFqUlZ1?=
 =?utf-8?B?c0w0bERuR25KZTJSL0RaVTJmRm1nT3hFNmNvdS9XSjRPQjhsMStJKzBqMlVY?=
 =?utf-8?B?UDRmbm9mMTU1YUVTbUNZUlZhYzZORldBSVdyMGZ1RDk5SmJuOFR4amY0TmpP?=
 =?utf-8?B?d0daTlQ3RnhQalZJT2EyQ3pPLzB2TFF0RU5RSDdVL1FhVTRCR05LLzNGbWtC?=
 =?utf-8?B?T3Q0TXQzYk9UeHAyWEw0MU9ndkh4SlhOSHNlUnBhblh3T0Z4ZlNKV3U2K0Vw?=
 =?utf-8?B?MUVpM21HaWhYSlNEWHhNV2FvWERUcllJV0J6NTZyeVpWRjY5c21WdDg2MXd3?=
 =?utf-8?B?VDhUdXhFaDBBVjVvYmFTclBucndKWjlTeFJHb3VTQXJubnhkTXJKL3Y3dkhr?=
 =?utf-8?B?dFNVY2NrZ28vS0JZc3dWaVBLenJzeTBTWjBicFh3elBxaGxQWUZNNnlXdWlD?=
 =?utf-8?B?Z3ljb1ZNeHdQUTZyMlM3cWl4T3k4QjNRU2VCck5rUTdTRXFmSVI4d2xMdlJB?=
 =?utf-8?B?L2orZ0dST1ZiU0JGVkJZTW9zTktpT2dzSS81NlEydkhtUU1Vc013WlJ0dUgv?=
 =?utf-8?B?cDV6NzJCVGNES3RyTEZxZStpTW41OFplMVc1VWE1TWQ0eU4vd251N1A5RFBu?=
 =?utf-8?B?aitMbFUxSWIvSUNpdHhWMGhnR3hKSlBWZFlKVDhTT1VGQktSVnNzRlMvMksr?=
 =?utf-8?B?UFkzSG1Za1ovN0hHSGlPdy93N1lVZ0hBRWNzZzRWSS81NFVLWlJ4YlcveFd5?=
 =?utf-8?B?aGJMUDhzdEw3aG5pSE5ianRqemd0dE1lNEVQSmhNZjE0OTV0Uy9MZjU5U3Bi?=
 =?utf-8?B?ZmwzbGpPUjlqNUdaY0ZLMFh5Z3JlYzM5eFNKeWVzYjQ3ZjIyaTY5TDZHV2xT?=
 =?utf-8?B?SzJLM2xGbnRrMlQ3VThwTkV5VGM5ZmxtZTUvWUdsZnFRK0RjQ1hWNzY5R1pG?=
 =?utf-8?B?WUJPaVlhZnRlYjJPaU9OQTB3V0dUN0czN2hOenZMdDBlVjQzOEZSRndYdkMv?=
 =?utf-8?B?NVhWb0VsQTA1SlhyRWpEcndjY25HeWR6MkRZeEplNGdNQStMenh2UnYrbmty?=
 =?utf-8?B?TXZCTjJacDBtVkVyNTl6MEZpandKN3NSd21XOGJ2YlhMQmdHR2hrZDNBRG5X?=
 =?utf-8?B?OVJMVFdIT21Hdlp5U1BWdGV6YXpBRUI0V1pydW9lUVVvbFdBcUQ1RkVBdGkw?=
 =?utf-8?B?K1FEazlEV2NGR3BvZXMveVBBYTJNb1dsalpKQTdlYmtFTEJyNStzbVl2SjZD?=
 =?utf-8?B?MUJjOFhsQklTKzRVU0llbWdrWm1CQjRvVFo0TjlhdGFJTDJieFEybHFPWkpl?=
 =?utf-8?B?VS9SVDlhbXZ3NVI4cnk4QjBIUVZuQWVWNjdZSG1CbmlxQW9OTUpHM0MyeW9p?=
 =?utf-8?B?QmpHdC85NWFndTlQSDVDTHpaMmpJYi80SGE1SkQ0L253Q2tSQ2U3bWZQdmdR?=
 =?utf-8?B?STFOM0g3KzI3bTlPTXFpNitXOGpBclgxVnptUWZ1eHZ0MmpiaHZZT2FSZWpi?=
 =?utf-8?B?bi9pczF0TFlGb3B1bEtKbE45TXRaOUFNZDJISEx3ZUs1MUkyYUJkSHFWZ3VV?=
 =?utf-8?B?ZGVocW9uRlNOMk1OV24vSVI2aTlTUGNjY1BHaTRyT1c0bFhFRm5RNDlLRllV?=
 =?utf-8?B?NjJadW4xVEw4dUdmWVlPMFZzTzlTMTdaTjhtSnczK2NzOW1DTEx4U0hic0VB?=
 =?utf-8?B?bEpnMnA1ZDREdExuYjI3Q0VhTTlkcENEcERmWUNyRHJGOXBQcVJHMUF0dHBx?=
 =?utf-8?B?QmhQYXRaVkxqb0ZFMWVYeFNJWmhTQ0dZOXZrc3VXZjlRMDFhYUZQWE1oZG9M?=
 =?utf-8?B?aHo5bC91ZzJBaG8rL09LdnN4bG1ZVU9WbXlUUnZrWW1oRk1LRDJ2V05XTjhk?=
 =?utf-8?B?VmhpN3gvamR2UW9HVHI4T1lHRG1nN2VXeGhFM0NuMm1GMXptWGxnV1lRbXpF?=
 =?utf-8?Q?wg5r4+Gsxp1tF9wHMUfbCJYKU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1b34be-41b1-4b05-7b90-08db5c252af6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 07:04:50.9593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oF90PPboiVBcBPMnOvzBSb7iqISCBK4Dypwp/9rGR8gqHB55EmEJN1njCULGdSVve9tsbmBqo0VlrAdeL8Gksg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7750

On 23.05.2023 18:37, Anthony PERARD wrote:
> Change of directory to xen/lib/x86 isn't needed to be shown. If
> something gets updated, make will print the command line.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



