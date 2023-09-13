Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4879E44B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 11:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601147.937067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMZN-0001W9-4w; Wed, 13 Sep 2023 09:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601147.937067; Wed, 13 Sep 2023 09:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMZN-0001Tl-27; Wed, 13 Sep 2023 09:54:01 +0000
Received: by outflank-mailman (input) for mailman id 601147;
 Wed, 13 Sep 2023 09:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgMZL-0001Tf-K6
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 09:53:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 754ac6b0-521b-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 11:53:58 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7954.eurprd04.prod.outlook.com (2603:10a6:20b:237::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 09:53:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 09:53:55 +0000
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
X-Inumbo-ID: 754ac6b0-521b-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gt2FGKUoI8LKUysHjlBs1gDUkxW4OAgqeoeoVGkCScA0rRkabdw8ZTc18KR8VGtLUZ3ImpF2gSs1GsXphqzOJbgFLTAaYLbzf3PI690PpXl64tJoemKE8YPHA1eZ7dyOFiwLSkMlb9SaZJ2hgmPAecWjA4uKdDbeuKmuVETtHB0roo8TQXsXJy2ieQrToCs8DqU/mBV/DO8HZKBeofKBH0UcZ11Ap8KWfBuCdOZjyOKmtF9YeKJ42gtGJsv9d8MBMn9RH5yCSan9hzFXx4/hR+C7Te89a+dxff95a0VnxbnNH+aKyeRgAmaW3s3t923R7TC07gmYfjLsRUaCztiSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrsb4kzwRVo3Pofm0OhR+ZGLA4UNrf6gXBrOLVhti4I=;
 b=NxwwJ3zkQwwpPdkobYaxkvkS71+Aov7LKLBScb7evW1fJZ5B/cTpJYZ7ViytlhTOw+MeFVqbnvcYBm+O151b+uUaPVqtKZ2PVmUrSTfmWb62+652Cziq8ger+WufZMlqZQrDiZSd+9aTLTWDNcbeMyyeOPKZ+2vCOxarTsrJntKZfMZFuC571MEVgXzE6REwR2NAbWH8fG63DhZ0zMdeb53/DtRwIxisyeIfT6GdVUbAaJ1ODdTe5uhKUlRIwFDMeMc/AaLt53jwgIpkssRoSterhLxMXi8kMYQuU+DT/mcHO+O5jiue5XLP9jVR9KJ1adzHDK0ldNL8Cg4nwC3dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrsb4kzwRVo3Pofm0OhR+ZGLA4UNrf6gXBrOLVhti4I=;
 b=KIXLME7bRXYQFNAPkrJ0QCw7r5YzNb2LLF/ylfnAGfhRwcqBLu9+gHnDALHTQDeAC6mDY+3RNJAonhrwrwqtTfMeRJ0nkRSk9v6LJvoKf5afyR3tdUkWKWlLC2PV9lsPeWppqS7eN2aWjoCrfTXChyME/CXM6kr0+d5xash2gtwvlp9F0Rsq7FBdstE9GDXa/L2gmOPwRNknxIOjlsJZ+IU9oY3Ytg+W9HhlhexZbj2Dqh9dvjKiNaM2Y3T43+fZPtjvi3XKciHuRzdXr85MvYHDu73YqY0eBlHV0B/gXSF7uA5Nh0LtjSWfj/L6kShEGJAlx3riuItGGGbHajFUaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0c26270-e424-8122-4ae5-e2c0e548db7d@suse.com>
Date: Wed, 13 Sep 2023 11:53:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v6 5/7] xen/x86: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1694532795.git.simone.ballarin@bugseng.com>
 <33185adc43014dff090ea6832a5a88e15caf5f38.1694532795.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <33185adc43014dff090ea6832a5a88e15caf5f38.1694532795.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 236df274-a6a8-4612-4385-08dbb43f5818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	evkLJRA0e1AaDwq+ba6K89YSSaXEpmM6Tyw/guYNSHoohiGiyoyn6UuQHmV8VoK7bLY1YffNVejqke8+mnvDsXEvOIr/cmrePrmRtdsk68DYBEKj/K1UBN6UWLKpmS+vXIdsPElu04HbxNjrQPIvx2LgXC9FSm7qcfR5F7Bk8NqLzrH4vSve88HN3weMnvNx+OAzlQ+EX049rXVNJ1E4nkP7k8eZnkmcqTzZjvdCQjHgWLMIFuwO1jUUn29CUnxWnUXPc9ZnbQdcJmIY+vdoz5qPr2td5AjLe7WJYlWXSMVTDpdBT3slS97VbPvnk03TurHJBdiA844+bmJvHi+FYQmu6YbI6tvrRLPGpBnjmWhz8a3N8stSaORDXkPVCtV1CJoFjb3m9o/gel4oSpuJjziiVhv5CB4CrlX7i3Iv4l9AdnpD4TdexiKDjIbxV+GUy4Y9H4LLQUHDf8FR1UWwQVejiMBnhWshOVwkh3xMU8PJfNOs+Wiuvi7rYZozuqydemwh7F1U13RmXJRLQksHObZVfKfgm9csfDtJ6iUWhAQRNqzz3CWHYRooMkobWGcOd/AksaZJnAh9YDMaP9lMqMjhE7xIT9jbVSnMwxq1C9MiDYD1u/7sSNtQBwLs2MjwjXpPfHTy+VypzhEYWZIqqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199024)(186009)(1800799009)(83380400001)(38100700002)(31686004)(54906003)(66946007)(66556008)(2616005)(41300700001)(6506007)(53546011)(6486002)(26005)(66476007)(4326008)(8936002)(8676002)(316002)(6916009)(5660300002)(478600001)(31696002)(86362001)(2906002)(4744005)(36756003)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUZSOFdNSUVqZEp6ektIR3VrWTIzb1hqNkJ4YWRLb0xxRnZVWEtsQndWY0hH?=
 =?utf-8?B?NUpCSjFoWVgwVVQza3dmUUNZbUIrL3JuRXVBTnMrcFBUYlJoMkZ5K2VORm04?=
 =?utf-8?B?UGJCa1gwZlFwejRIOTBtaW8rL3VzaGpiYzRmaWR5TWNoczZydGtpMENSOXpn?=
 =?utf-8?B?VFY2MWJ3RWlXbndSTGY1TVR3MjY0UXhLTjlGRlk4Rnd5OUhVRWk1YmRPejZ0?=
 =?utf-8?B?aEhEbElRYzhWWUQvdzg3RzA5K256NmtxRVhwenMwK3gzdVVDSWthWG1mTTZv?=
 =?utf-8?B?bGRHWExhVFhnaXVreTNBV0NheStUYUJhQXl1L2UvbWtsWUJPUDVlMklReEdN?=
 =?utf-8?B?N3o1TXlGelh1VlFwem8vaVZ6ZUs4Q1ozc0U4VlNobldtbkZ1ME9MYkhjWWMz?=
 =?utf-8?B?VjJaU3VyalJQbml4QXI0cWpVc3kvdm5YNHhuYzZqMTE3bU1Gd2I5M0svazJh?=
 =?utf-8?B?czNvNmZLT29XMFBLcEdwWWVOUXV5OFZ2di9QQ3V2MHM5ekhmdkZJRmhBV0t5?=
 =?utf-8?B?b1VTVlBMSThkTzRWUzlhcC9MeFI0RWRnSUV1RHFEakMxQ0xNTjdyZVR2V3Yr?=
 =?utf-8?B?ZW9oKytxRGNoL2ltbDdJTjJKdGRiMVF5cEpra042cnJqLyt6VCt4eVRGaFBp?=
 =?utf-8?B?dTV6YjgybEhEaTJjNjFXNnBPWGt5NWNxcTgxNWFvcEJ1TDY4aGtXMk5vZFlE?=
 =?utf-8?B?UDBBZndHYlkxTDJOVHErYkwyMmRXbE40b3VkenVmTTBSU1hUQitjVXdRSGFP?=
 =?utf-8?B?M21qcjYweTAxeHpsblZlT3NnREZHcnJSVmFLZzc5blNZb0xVQkcyTURqYk1N?=
 =?utf-8?B?K0dnYWk5Ni9jd0htOXptVUd3OHRKRXJyRzN2aFlqVjZvejFSNlZ5VlljcWpT?=
 =?utf-8?B?RW9WcGpCRG8wbnBKWnRZcXYwYS9tcEJiNlRIZVZhYmJQRENsOFRsaEJwMXFl?=
 =?utf-8?B?UkgyTUdtVkNvTkJhUHdEeDUyUlRYWmZzelh1L0RhTkRsc01sdDRUYmhMUWtG?=
 =?utf-8?B?M05walFQUkxxOHBZQU8vQXpmYVNVRWpqazRBVzRteWsrYU9HSVJGNEdia1dC?=
 =?utf-8?B?L051VjkzTll1THJUUU80M2ZPZVd5QU5iWmZSSSt5SnpIZjNFQlpUSTNqZ0FF?=
 =?utf-8?B?aURXdGprUXhnL25yQW94R202M3locUJyTlJITGdNcFJuZFRmRU54RXQwODBR?=
 =?utf-8?B?LzNkaVZvOFZRakNuUmVxMXBSR01Wc3RMdmhwUWs3UzVsckNUZUdzZFpzUVE5?=
 =?utf-8?B?VExqVmh5OHhZaUtZMHhRRzdsekNGWlNYU0lCN2pTQks5OUVPczFXNlRVTng0?=
 =?utf-8?B?YWswQ3pPODZDTlc0UEM3QXlvanRiOUVTTkZJckF0bStOZEJJc0kwNWJ6RXND?=
 =?utf-8?B?TzdEZkdYZ280NUxpQjBaRTU2enpkeDVLUUhkV2FWV1o2M1oybERtcXRlZzRK?=
 =?utf-8?B?MUZGY0FsTlJ0S1BqVzVnMnZGdm5QTS9xNWNsZHJmWlRWTS9SMFRQeEQxRUNa?=
 =?utf-8?B?WTcyYmY5NjBkd0hUTFRwcFZXTy92MkR0eDVZSjJrc3lCLzFvQzRLbUg3REx2?=
 =?utf-8?B?MkllNkE5a053L2NrWVI3VVJHemR5akt1WFllTFExWjJ6VHZnaFQ4TDlYb3M1?=
 =?utf-8?B?bEFPYzUrOE5telFpak5DWVRzYmxUZjRSaVArK1g3dnJaZFBOc01YRHRNWTUw?=
 =?utf-8?B?Wndwc0ZqaWdhUXl5eEpFZG4rYXBhcG9BUUF1M1ZoYXJpWWpFSmtGWnorcVVw?=
 =?utf-8?B?eGgxTmE4Q1d2NmdKSkdzbXJRYk95YnBabERuUHJsSnJxNU1vcmdQRHlYNU5w?=
 =?utf-8?B?a0FQRVR1OHh6NEtSR1FNZ2xOK29Oem1LOGpSZFNhV2pRYUFrZjdzYXMyK2Nr?=
 =?utf-8?B?dVNIeUJLY3Z0ekNVUjV4SGVIVU5YZVVaUlp3LzdRWnJ0SkJCWi9DZ2RyeHdC?=
 =?utf-8?B?eHkwQ2pJQUlZYVk0ZkNTYzdJYVVEUG9lLytWNUxYaU1OL0tFUzBpQzYxbjdS?=
 =?utf-8?B?QkthSDRoWURNdmprNEZkcU9jckc4L0hXSFI1dU5NcEdOQXRGWGVrNFh0dDJw?=
 =?utf-8?B?U0pBMEFhd2hFRk44ZUgvYVV2a09xMVRweVNDWW5obnNjb1E2cG8zOXdDM1Rx?=
 =?utf-8?Q?DWc2ooJJuf7mumJhS7KsurRj4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236df274-a6a8-4612-4385-08dbb43f5818
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 09:53:55.8152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f4RF6LVhlRWTyLtL2Ogs0h9WafBrb8ho/13CtxmS/Exz+sS5Vihaw+kDvDVkv8rf3lrtmoqB2jd/BU9jZcU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7954

On 12.09.2023 17:39, Simone Ballarin wrote:
> --- a/xen/arch/x86/percpu.c
> +++ b/xen/arch/x86/percpu.c
> @@ -12,7 +12,7 @@ unsigned long __per_cpu_offset[NR_CPUS];
>   * possible #PF at (NULL + a little) which has security implications in the
>   * context of PV guests.
>   */
> -#define INVALID_PERCPU_AREA (0x8000000000000000L - (long)__per_cpu_start)
> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (long)__per_cpu_start)

Looking at this change the n-th , I can't help considering the result
inconsistent. Imo either the cast also wants changing, or the constant
wants to become -0x8000000000000000L (in whichever way is appropriate
to express it without violating any of the sometimes picky Misra rules;
maybe ~0x7fffffffffffffffL would work).

Jan

