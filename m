Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C185B63BD3F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 10:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449324.705986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxDP-0007l0-Na; Tue, 29 Nov 2022 09:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449324.705986; Tue, 29 Nov 2022 09:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozxDP-0007iJ-KW; Tue, 29 Nov 2022 09:47:47 +0000
Received: by outflank-mailman (input) for mailman id 449324;
 Tue, 29 Nov 2022 09:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozxDN-0007Tu-Hn
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 09:47:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df7a8942-6fca-11ed-8fd2-01056ac49cbb;
 Tue, 29 Nov 2022 10:47:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Tue, 29 Nov
 2022 09:47:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 09:47:42 +0000
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
X-Inumbo-ID: df7a8942-6fca-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsq4Er78F93GLKHJWAkAHJROiJEOZhBSwas97unAkwuhvzJ4FjExfoKEPNwA505YII+CQA8GnA9n5+VL7Jt7RY9ccn1cXo27Ly7MZ2GL93IjYTTDPcCPjuGGDpfuXfNObUiGgRJ/1wgRSd039HzUt9il5Ias1+trLXrP1nyHWkSZ7VygQDGFdhFE97lpS0/FecyYG8dC8gtgQJnWx3rNMEUejou5uNx2QcLLWjhpRabWleuWVDKypfzoyA5I5VXqBmFGQXWJs4FWP1teQVhUWV/MJuXjalQ0G51Y5sv5nZquipdUJx2qJBBGmyNIpq/QChm6R0woL3EJZFMB5o20mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I02jI9rAj25nDe+zA7+o1uQNgJwgyXJpUo2Un710x+c=;
 b=kTkEs9+38De8eILTU+QIqSGnVPkBVkG/1nfzepbEz7k5tdIB1JI0qlJIbJ6C2o6gz7Zy4DUaZ1lKWvaedepmHfYKaBf85fe8rjmLyMruHy3nAL3YJO1SvY/iI6GPt39NqLr9bOhzY+NmO+ljt+BXzN9kVcg/faQv23cqROZSf+Vcl2NBVxwjhJYjHcph18kMRC/HfQlVuZS+vXgP+7FXrwXHeEMEz8cVDHOwg2wmOgr3WoBH6RBsrWUsigJrsY16Mg4s7x9LZpleujxJ/T4OyphQoziAhl+2X/qGat9a9W+xxgZdg3axw2aBwwq7XWXdsSmhDWHxWjoBUl3iEI0Siw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I02jI9rAj25nDe+zA7+o1uQNgJwgyXJpUo2Un710x+c=;
 b=3KWxuHk3DLqXiTx5uF4EVAl72zfiE1ZYkz5hK9GW/Mlx5G+zJYNf7sVPabj2KqizjvAIddV5dmbpeXTxsSu/hLkpGY2MUQAwcmrysNUuqm4lE5KEp/6UIGKyTyr/tLiqXDXo5keydkf/GL+BbpfY3h9r+PUWZT9p5VinvXLnLGMslY0i7W819mGmH6gdZBet07+bxeQ4RpzL4y19gNId/Z1X/EiO5fmeX5nFWni5/jiKV2JCodeoO4/DMXsa28MX+ZATrYQodch9qhLUKiAF40+QLtVNvrGgNiokxKEbDARHKZRmREmugMqEAnhwtXmTQz9xHAEVJCgfw6JJ66AoGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7217fe4-e407-9b73-8d70-790f7a9f2d6f@suse.com>
Date: Tue, 29 Nov 2022 10:47:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] Introduce more MISRA C rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Bertrand.Marquis@arm.com,
 julien@xen.org, Stefano Stabellini <stefano.stabellini@amd.com>
References: <20221129001824.2344912-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221129001824.2344912-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: cce8d379-6a42-42b8-cbed-08dad1eec273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UzKzNlfh7nGt84TOH0Gh8yrOK78ciD3OqR/CuxB1GQeOsI6f/q6GZAqnwUzsKiEgmfPXlL5PJoXiayjsJp24CwiODdxw/40BqUYxTRZSvXw6qOG5hiy/5fmeyiuLR9Vt8mDpu8fAff1MZvnp6kqSK42scrJfTtNrn8T2/wrTpRT0AdJcLUetYhEQS8lxeYjiARzM7f4noYc2pGKH1NSbApVu9qSqlt17Z+OPol03kW9K7vYg/K9dw6SxHOQ6r9YbfilmO6IiVHH9RGwSJUzV+JwOvJGtSxJlgl/b7Pi6omvavznapW6pKYy2pD8V3yeVwcvWojxJ3FIL+Sy/XumsUchet8qVP0dEhxPQOHWcri8Ej+V1CBV3ZBJn3FmBxgSK2feVb9dPe06T+lV5f77VdxYKtfQI1zBCsvyzdFoWQjgoixd5CWJqzkrTF2JEZbGR8xEEj0huzelQTrHRfdPhXz+paO81SbZzkdI8mX9A0C/fuDPRLoN5+9J7lFyp0lkDpej9bPDMZ2+/o93BajaKosJx9iJtd+NvmmD9veasZcUn0vVQqIwElPgWZCdwFFYndvMvvsVeBTAUYnxJaG1J2ekTyXJ0CjX5piV+4tT1wslfLnt2bCj4A4Mw/IsE/rCHqWmECkbv5C9CWFyRP5kx7PU8LYwXkhOz3OfuR3lw1FJVIaJMZRVW40ZKvk6kVdTx+NFQVMD+05bhMDwTXXvLFnhJ+Q0e04bSlg9ZHQV8LyQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199015)(6486002)(31696002)(478600001)(6506007)(31686004)(6512007)(4326008)(36756003)(8676002)(41300700001)(2616005)(186003)(5660300002)(8936002)(316002)(26005)(53546011)(6916009)(2906002)(86362001)(4744005)(66556008)(66946007)(66476007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVUvZE11ZVpHS1NzTitXME42ZHIvSVRJY0czdS81d0xJL2d1bFhyc3ZLRVFT?=
 =?utf-8?B?YWQ0K1NkRG9kTFBVSTBkWTNwR1Bhb29WVFV4Y242ZHlrRk1tVDF6ejh6RW5C?=
 =?utf-8?B?dHpiQ2o1RlFwa3VHSWhwbnNjdzEzS040Zkx6SmljTXJrZXJWaG43Z1dhRkUx?=
 =?utf-8?B?NlRIRmZjc2JQYVF6VWh4alRINnB4a1NUeFU1TXpqOGtnZGlBV20wTUtSdGp5?=
 =?utf-8?B?aThwMktXdUgxN3A3SG5YdUNzZzF0Vk5venU3RktyYnNaWVlyZTN5dmxBMFFT?=
 =?utf-8?B?b1hPLzdUeEJWaURxS2krWHhBbjM4cmlRWjFvd0FpYXovb0czbGVIc29TcnlY?=
 =?utf-8?B?eUNsallYYnJJNTAvSGFNMVYyT3NQZXY4M0pMRlIxL1hyRzZYTG5BT3crbjZ4?=
 =?utf-8?B?SnRkanRUQmJWVWZhM1lxdGgyVVVpYlVCKzFqUDkrckZ1Vm5RU1hNSGk1OG1r?=
 =?utf-8?B?eVZoSzN3WmNQUjhXZkpsN3liellDanZ4ekZiTDV6QnZaZEpGR1kvbkYyZHRw?=
 =?utf-8?B?M1BEdTVJVGYzcSsxU3RFMFBXcGYzUm1RR1VRY1R3Z2dRSHRXZHUxbTI0eFFk?=
 =?utf-8?B?THdzMjVIWFdobmJYNXRZbnFLSkpjOEJwVmpmYmR4NHVFMjhiMzZzd01EVlRK?=
 =?utf-8?B?NzJRM1BIc2VQR0E4UlQwd2JlbzhRVU1lWmJkT2tiNUF5aXhYb3M4UjN1K0NS?=
 =?utf-8?B?SmJsdGNnL2lQd2FUSVgrb3NLU1JiWkNxcExFempycnR6bGorVlhCbE1hdTUw?=
 =?utf-8?B?NFJDMnVxZmEvdU8xMUU4by80M1I4N25YazdUWEpha2RmelFmdGtUNiszSlRz?=
 =?utf-8?B?dXFUNjVvb2FTWmk0WjBJM2lIMnhDM29lb0k5ODM0MUJRZFl2U3RFcFpndDht?=
 =?utf-8?B?TXZVZ2lTWWc3TVg5amhsMnFIUFZRS1IyWEYxTnBTb1dZV00wdFVNSjNFblRH?=
 =?utf-8?B?cU8wTHZXWnhDY3Yxenh1VUlydFlRMnc5RStyb3Axc3d3RlFnblB1TXdLVWVj?=
 =?utf-8?B?dnV0TXRvV2VRdDBOcVVxUG9hN2VWQ1Bxa2U0THRVdGdqZ3k3VDcxZ285ZEJk?=
 =?utf-8?B?aGhGVGJuTHBZTVV3V3l3MmZzZDdmeVpSQU9aRVZkVEdzRTlORjBHUHN6RHdS?=
 =?utf-8?B?T2VHU0RSSkdGK2MxV0kyRDFGb2FVYTVpRmlBNkZpQnpBd2Z0M0J2V1p0Z3A2?=
 =?utf-8?B?MDEyOUMvTEpCT0UzNGxqRXRiUkV3TlJXY3JodHV1QU01d1J6c0p3U3BhWTBo?=
 =?utf-8?B?WHQvV0MzdkdPQm0vOE5mOHpvQlVWUUpvdDZyKzZEdUk1RzdZZC8wRHVTQzJP?=
 =?utf-8?B?Wk9vZGUyZ0dKeGpaek4xeW1PNElhaFJHTWZoYWtpaGdZVFRxUytWNm9xMG82?=
 =?utf-8?B?Sm5XOEt4VldPd0ZaeGxGWFpySENKaTZkcXVhK1IvcU1Yalo0ZDBTNkhHWUJ2?=
 =?utf-8?B?U1QrWCtPL3dhVFlWN3F0SW1USFUvcjAvTXZQQkVOMS90SzlhbjVlT0VkaHRH?=
 =?utf-8?B?d2RnMkZJNHdxV3Nzd213djl5YW9HbXJtdzRUNU4xU2oySDN0SkVnLy9rRUta?=
 =?utf-8?B?SjZYdTE2TmVHYmNJZExKbU5PK0tYNTJ0aUhrc2ZMdWtZT29MRTFEdmEyUDYw?=
 =?utf-8?B?WCtlcnYxNUcrWCtXUUJaQWxZVnkwQjJQWUNUcVB0R1ZKUExpbU8yTTYzZ08v?=
 =?utf-8?B?bnF5c1FsWHlBN01QcnZYT1MwcHdwaGk3WUVSTlFRaUFha0FZWFo2OFlSSE9q?=
 =?utf-8?B?dnVkZTAwUGhNS3hpbnhtUFBhekJOS3JHSStJeThMaFl5VUxaTDRwelNqUURn?=
 =?utf-8?B?MFIrR3hnZ1NSMnVDYXFPUERQZWFrRHg2bS83YTZZdHFteG11Wk5jTnNoU0RV?=
 =?utf-8?B?SlNyS3hKejZyc25tMXFqOEc4RS9XNGxHTnJUWUxDRUVhY1psS2NkWkJWQ3gy?=
 =?utf-8?B?aFZ3MWpCcDljME9tZzE4a3ErRDZYanRmZ1pxekJieWxVbzhmRWlwTS9Gb1ox?=
 =?utf-8?B?YzBXbVZiQXBQeVNKajBtOVNlckhNWFQ1bHBQRUE5WjMzaGpHektWajhPZXpv?=
 =?utf-8?B?bWxUMkxOUlBMN252cGVzNFB2SjNjdW9uMGtTTitTWVJsdTZQVWFLRHV1M0to?=
 =?utf-8?Q?MW9NbRfyGj4E7S8QmHsk4XxKW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce8d379-6a42-42b8-cbed-08dad1eec273
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 09:47:42.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAIF/REjO0pZ9F7vJwLcim2YvfGCT6fzuT8+aLWYG6iCMl0vziguyAjMg4dqWvTbeuySfJC1xbH8nZlHg6Pl2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9576

On 29.11.2022 01:18, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Add the new MISRA C rules agreed by the MISRA C working group to
> docs/misra/rules.rst.
> 
> Add a comment for Rule 19.1 to explain that Eclair's findings are
> "caution" reports, not violations.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



