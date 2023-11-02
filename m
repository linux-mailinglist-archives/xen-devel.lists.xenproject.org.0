Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E497DF4DA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 15:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626926.977658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyYcZ-0000RM-JH; Thu, 02 Nov 2023 14:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626926.977658; Thu, 02 Nov 2023 14:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyYcZ-0000Oh-Fy; Thu, 02 Nov 2023 14:24:31 +0000
Received: by outflank-mailman (input) for mailman id 626926;
 Thu, 02 Nov 2023 14:24:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyYcZ-0008SP-02
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 14:24:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88f82b95-798b-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 15:24:30 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Thu, 2 Nov
 2023 14:24:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 14:24:27 +0000
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
X-Inumbo-ID: 88f82b95-798b-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJe2EuyNLLJe27D/a3bYuUd5/PczQuvGO/BOsM+ZjjizF5567AP/U+p//WfBiyQEfIyfwAx+CJHsw9aLhfspLHtR7lYXufYm1iRsqn1XTmO9ZjtCSGMpyPp1+kEjaXnfu9iOoXcT8JzkNtnig0VxK+BIXM0EAJw2u4sllBJZwIPKqQjBco8H8GxZltTvyRvAM+yrplOjOdLXuOy3gViaIJf/cds0fzz6grnBPvwPJ83BN6D5rLz1DHCQ3jfhzgPHpbbuNnfRlcae3LMe+VikJt+LYkqoZByCm9idm0vqxzUV1LRhrTDC41pILd5GHrYMv93SKO7wKupRGRwaruCwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGpJJNfEkHTNmP/I2gqqtBdgV/3ysAmfN2nToV2GzM0=;
 b=mgI7ocBPpiRgYjs1acf3qQNlhsRRvP6D6fPv3TAF8caQFX0m5VbNgQYR+VkZH4zYcaZe/ODiYTHoL28950FmzX4Fe2pkVKJqQTc+edWoAGVKUAs9q0FsO9taQW0HEspnSYt6V7dXVCDC13e5OeySiaq3CP9h+lME89qOyF4rGblouTbyPdVRTP2CfviK2kQh5CBswW1lFUiEVjZ1i1U6PiQBetSJ4BYbknFrj6nMu5Akvp5aPDvYdlXJNukvpmem9zaOq9ULJn7bKtT2xYyWzxVWTTRjIRe6SOgachxB5aP9QJePOVHjNy61vLSBrOn8ctBdnCGrWXmev9rTS+Si4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGpJJNfEkHTNmP/I2gqqtBdgV/3ysAmfN2nToV2GzM0=;
 b=qNavjaw6tV7SZBvzcchA9/4ANZ2rCx44EZJNh8QO9rJLvq7EOZOPrXXzUPtl76Km2wBS/wQFOyU7wndxfKiWKeAQLXUAaz67WQ2aWe43PYLN0+OkbUgL0O34sxx1xkuBybbhZ8tkN4k26jzTv7dGxy3MJi9UeXxY5LX1X8LvdTvhCRhUxOOE4K754GmQArCd1A7Ecp12s+3D/gdesC09uGxxH0IbmhgNcQ9Z8+C3ahx01g3n9kzcOmk+plbLGQKrgG1OK26KCwUb15ysZOFlv3qGN8cvHc5q1wF4zSrFdA/eGD+KCpxhn2bELEW2uxC38GbQ29wq5CrJ4Sxo7SlqyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebffcb35-f2fb-6f4d-c304-7ed7b5ef0968@suse.com>
Date: Thu, 2 Nov 2023 15:24:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2] x86/iommu_init: address a violation of MISRA
 C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ba5d1368fce181a6a3a6abc150651e1e5323e489.1698238686.git.federico.serafini@bugseng.com>
 <e21cb579-842c-a3c3-db82-067dc023ef06@suse.com>
 <8dea91cd-54a6-4846-b845-f3ed334fd470@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8dea91cd-54a6-4846-b845-f3ed334fd470@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 7825ee99-4a7a-4f5d-c540-08dbdbaf6b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWHS032fccKN/1noZ333UUFFmlItgJUcnmNA64EEqahkBkluNcTZHhG8Qt1vSWbpFRBs//2ga5eORHPYuSedex4gJZdXmbPWSi4d3nfOsk6mdmq7DRQRBzeGuwLqGwcTyg2nQVXVsPL1F3pug9oXZt7E5ZFFe3auXmO2awsZIJy0wqvpX0umJ8NHuA+rkhPc4CBofjNSV7QviqdO7dcShAgDad9pqPY7tq5V6eEq9+MeBL9YSVfbzaGMqlzVmQurw9GzY566nR5tzRIDB52xcOk8fGOqIOKpAvKUum5VNyKqjWNM8NmgesS7nnGpNp2Z3hRYKhljzctR3s/AmTEsNhMlMbENRMO6gSRhsWI9vfKs7gh0M6rhl5qFAW1UuJkes9f5S70ht/ZJfNct+pQDrkeX6TUUzMXUAtBlq9cyOrPlxH3UOAQBFINdsgS0jWWmVE9j33xWyqRx9Az28SRNqV96TVGwyfpcNE0Gr9HDMSAEn8BP36UuQJ9edIvBb+URMvvzC2f0Tud3VYcnUdVimXY1mtk4IvW/lTJOIpqjOb//OLJ6+zWhUUV06vWL1Zus7kS7yp7FHSaOhmdU3ApSHZPlenNoYjU6redfzhPdxJR7LIq4Rk+LlpB7cUxPunP2gwhsmbFMkvu6jNhB5FA3SQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(31686004)(26005)(6512007)(38100700002)(2616005)(31696002)(86362001)(36756003)(8676002)(478600001)(6506007)(66476007)(53546011)(316002)(4326008)(66946007)(6486002)(6916009)(41300700001)(5660300002)(66556008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2U4NTAyMUl2QkxSdVNEOTNqcW1hcjVGRDFrcjJIM0ViSTdqdTFRU0s2VVhC?=
 =?utf-8?B?UDFoa21pdFV0bHJrSVM5dDNoano1dmQvN1lwL0xpaUtUczk0eVFyWGEwZDd2?=
 =?utf-8?B?djFVL1ZyOG1PWUlJeTFJdnBoUThydU1jWmo3TVd3Z3Q1bmdMMVZoWmhyUVZ2?=
 =?utf-8?B?ZmwzdVB2TDErS1BndHV3ZFJlRktDb3FnM1BYdkNsbkw1bm5WT2RxNTdhTEF3?=
 =?utf-8?B?MmQzRFVtQXdiNWxnRTZSZnhqTElqOHA2OG9mTVR2OU9PRThQYUJIK2lQQmNE?=
 =?utf-8?B?MVIyd05XTEFQWGVNd285N0xnckFtaXREVy92ZUc4VmJrNWFBMXJra2Rlalpp?=
 =?utf-8?B?WXlmNGFkeE5KZG5JcFpIbzJGVVZmMGZsaGlFa3J6eEtreWF2NWF0UVVHaDJQ?=
 =?utf-8?B?YUhlOUhkd0VjTkdYZFF2RElLd211LzRZV3FPcCsxMUw0am5NT1ZQR3ZUbDdJ?=
 =?utf-8?B?eDhJazIyM2lsaTc3Ymt4NlAwNndSMFVBSUptZmdaMnA4dWc2NXFpZTZZc0Mw?=
 =?utf-8?B?eitPdS93cnAwbVQ5N0ZtaXlaa3YzcHcrMWtqZTkyb29mT0prTzYxdkkxKzhn?=
 =?utf-8?B?MnREZG5tbFZwanRaOXM0anhDMFd1WVpHY2JaREVyUFNCWlBHWGxHSjRoUGtG?=
 =?utf-8?B?am93QUl2OURkMllyMTdYOExNZzRsb3VNRFhCaUdkZjNQVDV1VmthMnEyTGFI?=
 =?utf-8?B?bVNmR0Foekp4cmpWdUxYVXR4dndqbHNnWTViUmdpNmY1dUI1WUJCbU5WOUNS?=
 =?utf-8?B?amF6RHFVUHoyS09kaU5aOU5GNU16WE5EeGxockY1VlViRWFIeHBDaTllcCtW?=
 =?utf-8?B?eHFFMHg1Vm12S3ZoZjVMakw4RjRWWWVHSTFDNS9zNzg1cXduZXorQ1J1WVBu?=
 =?utf-8?B?NGJiV1pJUEM4RElOaDRCY2srTk1GV2JlTDJlNHY0cGVEaDZVVWtJdlh0bWIv?=
 =?utf-8?B?K0pGdHh4RHcvWXN6cWJOVnhtVFVUU2xYanl1VnJWZzVLSkZOWmhXNGdpVTBP?=
 =?utf-8?B?ZzZKTlBJTGVwbjFCN0p2WkhiN0NlUVA2ZnZUY1ZVSy9qOXJ6UjNreC9zWXNJ?=
 =?utf-8?B?eXpnY0hWQmg1K2VFWWJMT2hzYzRCVDBvTVo3RFNyWnpjUW9tbmd2RVk3cmVO?=
 =?utf-8?B?MmpoY1pBeElFVUVtM0pSSFFIRTY1eXhXL3UyeFNZMDBpNmJzRGp1WjdCSXJH?=
 =?utf-8?B?NWlKLzZRcUhKNS90ZkhYUVRRT3FyZU00djNHd0FDZVp0UlhMbENVMldCZ0FH?=
 =?utf-8?B?Rm9lTWF4dlJlU2h2ZDNqVUx0WVVVQjFqN01NdDFac29xYTk5L2I4dXhFaXpG?=
 =?utf-8?B?MUpLNkszdi9uRDFpaFI3ck1wak50TklWMy9sSHNwYk4wNEFGamdWVFRVWloy?=
 =?utf-8?B?ZTZZclNib2kvQ1dORGRFaERMNjdhM0daYVBPTzJrRWlTTlhQckg3NmRWRjRN?=
 =?utf-8?B?bE1KSWJlNy9ZR3F3L3A0ZVdSajlyUGpneGZkbU42RXhyS2xydW5TWi8xVTJw?=
 =?utf-8?B?T2lHYndlWHVwMTl6YXpldXczeElCS3BtaDFkVk1DTnpXKzZYMjJqUjZEclR3?=
 =?utf-8?B?ZVhBUkd0L3l1dDlhRFRSaGx0eHV1VFVSbXhVc1UxMGI0T0YxcW1zTVdGcU5i?=
 =?utf-8?B?eWdEQjYxZDljSGlJUU44UWVrZ0I3VUtQNEpyc0IwQWNnN3M1OFVkR3ltSXN6?=
 =?utf-8?B?azVFVHhLMklwRW5OV2FmV0tpcnVMR3NXNkh4NDVhSGNrelovUjl1cEVmQkpj?=
 =?utf-8?B?ZGNWb2hTTWZ0Yk1pS1NpQmNXbFVEVGpRNWFvRGM2c2ZiR0xmWFo3TGNrc09X?=
 =?utf-8?B?NkJET0M0d09JM1J4TlRQMThyRVZrWWF0LzlXMmF6bzRzeWtBNGlNUFlBbHF3?=
 =?utf-8?B?TUR2TXJtSmJscU5NdU5sZzlzOXZ2bUZDSmdYY1FCTytlRzg4NE03YnY1ak5p?=
 =?utf-8?B?OTNPaGZuQ0c2cGNoMUJlcEFIQWdpbXo1QjhqVFF6ZnJDSEZUZWhNVW9kWHcx?=
 =?utf-8?B?VUNQQmo0Rkt0UE5QRUJKcVFTN20wellaSjVIVkpwZ05sVUptUm1FdVB1YUxH?=
 =?utf-8?B?ZkdlSHNkcEFISnJrN1VJV01QUXhhZG9OLzN4aEJORGRTd01sRFIzWmdjb1ZZ?=
 =?utf-8?Q?rlN4/dDoq/dJ1Mdx7fH3U32Xn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7825ee99-4a7a-4f5d-c540-08dbdbaf6b6d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 14:24:27.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2nYb/SseZaED6EiK4Wp7GhYeJQ/YL84yUMbEYSN3lPAzUoemTSZS5gorG4Mr1JHmByaNWc2jqxeieu2XGgfRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

On 02.11.2023 11:17, Federico Serafini wrote:
> On 30/10/23 16:01, Jan Beulich wrote:
>> On 25.10.2023 15:01, Federico Serafini wrote:
>>> Make function definition and declaration consistent and emphasize that
>>> the formal parameter is deliberately not used.
>>
>> Coming back to my earlier objection: Did you consider alternatives? Best
>> would of course be to get rid of the forward declaration. That seems
>> possible, albeit not quite as straightforward as it ended up being in
>> other cases. Second best would be to rename the parameter in the forward
>> declaration. Question of course in how far "emphasize that the formal
>> parameter is deliberately not used" is important here. (If it was, I
>> wonder why VT-d's do_iommu_page_fault() is left alone.)
> 
> I can propose a new version of the patch with the second option.
> If one day you will decide to accept also Rule 2.7 ("A function
> should not contain unused parameters"), then a deviation based on
> the parameter name "unused" would be viable.
> 
> If, however, there is interest in applying the first option,
> I think the best thing is for you to take care of it.

Done.

Jan


