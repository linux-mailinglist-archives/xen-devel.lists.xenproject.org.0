Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE154C19D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 08:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349698.575843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1MFI-00045h-UN; Wed, 15 Jun 2022 06:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349698.575843; Wed, 15 Jun 2022 06:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1MFI-00043D-RR; Wed, 15 Jun 2022 06:11:16 +0000
Received: by outflank-mailman (input) for mailman id 349698;
 Wed, 15 Jun 2022 06:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1MFH-000437-AQ
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 06:11:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5a66c55-ec71-11ec-9917-058037db3bb5;
 Wed, 15 Jun 2022 08:11:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8395.eurprd04.prod.outlook.com (2603:10a6:10:247::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 06:11:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 06:11:11 +0000
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
X-Inumbo-ID: f5a66c55-ec71-11ec-9917-058037db3bb5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUw83df3KQc7UNRR87SHdSNEy8X6YC7Mr3q3jilvsqwlZ4lT+W6X5QoCM98ks11/zY4o2rr8yJKln76+mdTjQlaSwtsQhM5+clcVFuXOtdn6dfZJK7D3EA+FeqQ/EtTjRoVEdOoFZ/23aN7WfLCWg5Q9U1K4/TLKbXke5gq9F2lvGNv28ZmIcN0ROgPJWQyiUfL0SG2K1ffxSo91cXULajyJI5WnXLjQykG2gMI8We+rApPboxmMK1PIvjRbsxt01hCvrvOsLrT7tWfqbM+XhWUsSXZDyCCKfhQd5emJYB9c58qp/B+ik/RLWjCuWeGRQnOoM5OFfFDjxzlIcamVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbKF67I1vWo4HsrzBiw+pIQPkAMMnJYbfh2+y90TsLY=;
 b=KuH5VIQIZkzmbb2RymnTLE6yZf5UWOIJcPG0hiVWr3tzumham53UlJs8c8stTjgPbikodga1xF5E64P0FVMVgqh9Zff/BlTwlvE1EkBIfDnge9BGtuVW4wFs/Q9Y4Ts8z6UyLWE8pCxCCYEHnUyxFb3F7WU/ehEf9a2yBdCaK1k4HGmpPz5qyg8r/wgEoiE35+ECRWpH9zQkWrjpZg5yzUUQf1C4xHQOSPXbTNPHJ/4A6ff11VixsqE11Kjv2KER5C4Z7pvmOQcQ2oqqhDkKVeqY7gRl0YoVvtm15Nt2q2m3Ws15tClJgYQsu7BIuTRNP2HA2QxFWtJBS9Ztor6XQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbKF67I1vWo4HsrzBiw+pIQPkAMMnJYbfh2+y90TsLY=;
 b=Pz1rqQAcRshCTLoJB7K1Z/sTaVttEYsg0fufkdWX4eWKQmfkppA0GXAM7A1cI5Q5wWCM3vi2zJDv391bc+3hrgM4bAZHXdkbFUvEQ8rpg/9/Fak46ny4cOxu4f99kPhKidxRyBrG51aUIRN8hNnAXG8mqr1Jahewu3NZx4/4t2YDPEJY233w65a9c23Ol1hRO1w3JGHr2fCDBJvubRKqL+Q/qTv2oFgLlFr49xhmel9ZveIdomtATQSHsmdBTcpXEMd1a6gQxSczriml+CiOT6ao3qO3y7+xK3xbO3jNVbCOA7ZxJeK869OFjhYg6Fjxz4IUw6lSlEfFDFpjxM0Cpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c76c81a-d781-8ffb-f68a-ece5487ad01f@suse.com>
Date: Wed, 15 Jun 2022 08:11:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH v2 3/4] build: set PERL
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220614162248.40278-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0237.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d800c1aa-fd69-4364-3082-08da4e95d898
X-MS-TrafficTypeDiagnostic: DB9PR04MB8395:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB83958B4151C793307FF28E2BB3AD9@DB9PR04MB8395.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGz9CMJvFqzgAZsvWCUKy/8rf/jXszr/riZ1kcpsH1c72PSvJMZKAMkjAsm7AXJD07e1ls4eNtw4JvQiRM0BYJ4YPgvdHrrqCVFXBbNeY20BdXndwlIiSbO4k2oo/raV4LwIwt3md8Lv/YRfoS6HDmXEjwmM5vsFY6II2CcgTtnf4cHS6bumjUbXHXCUfBxhHU95D77Jr3dIpHjQy/koTYRw5HCKnszoiEjStOq8s30qlEU2Y23/EOBcPOyEUAkHjP5XeGs0YgjEplvmn0cafy8vYt1QMNjNdV6439WbC/zUinqr5L1ZzAJFd7Vzztll5yvSHzGpDAZCjnWct6nsN6wtQH2KCNGcnIsREh4HyRnYxxHm3jM/0jp8GJuhpVgdW0ez0N597EyWkLnJo4f0JFsqdktskMpFdFTG6nBlNLfcoNfTZN+9P53iOKq/u5ZgELXl+XRTn+ZPSy0zsF7kgPxedF+ha2cU1idjea/UNwnMKjHreiQHUQqv7ukxKz73oYh7iQToWz9zD7Jj1BvQ3UeBEF/RYtBKJUGl3F8CwVpIMorEHwAelLrygJBQ0XpVxORLevtccOlTTL96H7uwDwcYH5iOTnZpPQ2R9AoK5nwWaMZ1zGCsWBAAG2cO7P7EBVs0sHp/+VXx5MnDLzA5DnjbeFruEQbXKDl4jGtChNw2lR76Slti5zoNLvAQD890FdH3TjSNpmhzBaXiMLcyeKpxiWLHZGqPUv13LqPqM6DUlxN6EBZFOTek/wBlf2kc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6512007)(2906002)(66476007)(66556008)(86362001)(8676002)(31696002)(6506007)(31686004)(54906003)(6916009)(38100700002)(4326008)(66946007)(26005)(53546011)(5660300002)(8936002)(186003)(316002)(6486002)(508600001)(36756003)(4744005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjI0aFZNMkkwbFZqVW8rbmNPdS8zNURvd3NsSWRERnFvVVlaYXNSTW4rcHJT?=
 =?utf-8?B?SGd4dDJhNHRxak94Si9rdnkvakRnT3Jtc0RkUjU4dE96ZVNmVFBCN0tpbkYr?=
 =?utf-8?B?Rmt5bEQyZGFIaGh0T0QySk94dWQ2U1hoRmt0NndicGdsZ04vazlXcjRGQUZr?=
 =?utf-8?B?QlF4cGRlNDZSaTR3dDRBUDI0cStaWEtBek9pOTQyZVdKU2U5STAyN2NaR25H?=
 =?utf-8?B?emlZL2NGK1MweStqeWRJMm9icTNBT3V0N1Y3c2tmMTlBRE9OcUcwcUFWa3Jv?=
 =?utf-8?B?enlrMENnTE9ZU2Z3TVViV0xEd1hRK1BQRjJaODkrLzczVUV1YlU5KzRHc3BZ?=
 =?utf-8?B?SGgrbmNzUmxDQ2c1dkovakdGdUMxU2QvRGFRaEY2aUNpYXQ1RElUYkFCVlF3?=
 =?utf-8?B?NnVGcDBXRWFSckY0MlB2S284c1U5NlpTclVQQjU4YWZHVkRtbGg1cWVCRkt2?=
 =?utf-8?B?ZlJ1MDNnRXBMdHdvOTBKeHNmdk1abnptUWFJeEFKUUJ1UnAzNTdsOGVVQjdv?=
 =?utf-8?B?NS9LL0RxbzlvaWJoYVVETlFLUGloL2NtdUxIMHBVT21hQUNMczJuNElWcHpX?=
 =?utf-8?B?Q0FJVkVnelNCcUFsN3FoL0hyM2xNemF5QmZ0T2VSYXBUcWIzYUpkTHR6VGhs?=
 =?utf-8?B?TXU0UDF1cS9xcWpTdENFU3BkWDBqRm5nMDJGcWl1SDNDSkV2STk4ZTUwb2Rr?=
 =?utf-8?B?QXFOYUFjcUZLaWkvOGdaOElGTkMrWWxjS3BFVS9sR3o5VGtlSkF3ck1UZnRI?=
 =?utf-8?B?NnN2NlRNVGl5djVETW54L1hiWTgwaW9KU28xK0NwakFTWjR0VW03bGMxSkF4?=
 =?utf-8?B?TFhEeklrRkhGSnRYSnZxanRWU1lkSEd3Wmh6Qm16MmF0V3dZSWtZaDJ5WDRO?=
 =?utf-8?B?OG1meTcrV1dWaFdnTmRDNVZlK1Y3VGZnb01yb2IrYmRkMHlZMDNJQkVzdnYy?=
 =?utf-8?B?MFdzNXRUUGhUM0QwYXFvVmE4MXdlT3Ixbnd6dzg4QjhzbXl6MGNBZzBxOVBo?=
 =?utf-8?B?MW9GK3U2U1pyMTBmSS9oQUFabjVZbnhrL0g3SkUrbHZ0YllLckVaSy9CZFhZ?=
 =?utf-8?B?VVc2WGp5aWsrQWNTVlQ3alorVzZtL05Vd0JsVkk2VnNwckFvdzVwckE1QnZI?=
 =?utf-8?B?MzR6WVNUNVkzdy8xODNQUlpRTlh1TDVtT3hZWTByYjNzNXJ6ZVNiQTBmMDdx?=
 =?utf-8?B?Q2d3bmh5bGh4VjNIbTdwM084a0J5L3psZnUwRWM0bUV6NVhqU1JyOFZnTXZx?=
 =?utf-8?B?ekxveTdpUnRJeWZwQXd3SHVIeWoxRyt4SUd1WmlWS3p5S3gvMjVyWjAwMkJV?=
 =?utf-8?B?WHJHaDlPS1VFeC8wdmNYS3kzUmpPRE1sMWQrVGpvbDh6RU1LY3NNd1BGRUpX?=
 =?utf-8?B?amhFZVFadHR3R0orZUNYRkVpRnJ0RXo2UmdtVXZqMndsN1d3L1pCTDNwK1VY?=
 =?utf-8?B?dmF1VXUxMEFtWGJGTFg5eGRwWkdLNUZUOUprc0RrbzNoaW5FNzcvdWdNWDFF?=
 =?utf-8?B?T1Q5cmRQalBGS0hPaXphN0pRSUVsb0NDYkFHcEowYUU0SURRVHNxVlZyNk5y?=
 =?utf-8?B?OUk1aXgxOGRYU3YxUDdBYXpPNGtEN0x0WGpXZ1NKaHdZR1ovL1krR1V5blJH?=
 =?utf-8?B?VnZ2ZHpGRUY2WmlHM0VicjhFL2xTQTZhUXdrTFNLQ1Z4Mk5NTVFabWljOG9Q?=
 =?utf-8?B?SjVLWGRtQ1JuSWpCQjdqY2d1T2FzNk52ZUlPaTBtTFkwenRjRTA3K1NLUkUy?=
 =?utf-8?B?bmg1R1dYQ2hEY1Y1V01iYzc3dTMzVHZId092T3haeU5jdm1lYnNJUGhGdXl5?=
 =?utf-8?B?UTROZGl5MVhybjF4LzUyM0c4WE9zYXpxaHZkdEN2cWgyZVNsaXNVb0F3NURT?=
 =?utf-8?B?ZXBNZDZldlBDRElYeXg4VmI1dVJONlRzYUo1b3lRaWdxa05WZ00rZGFOVU55?=
 =?utf-8?B?RXUzTEJTYVc5YSsxU3pHRTdhanM4dkhwK2JzMWI4VVBhckZwNzduSm9MWldt?=
 =?utf-8?B?dnpabzZXajBOY25jd1dJbHBpdEdTQURDZ1FEdE40cThEUU4yQjdYZmc5U3BX?=
 =?utf-8?B?N1F3NzJEcDl0cHcwSWRIUGpIUjRFd3prK0RrMXB3TmVITm1QUkhTeHlsNVR1?=
 =?utf-8?B?YUtqUGhCTUJFNzZtUisyYy82SElGem1LRG1XUG9YR3hXVnluUHkyMno4Y0lx?=
 =?utf-8?B?MXV5SFRLNm00RzhwRnVRb2E2Ujhqd0E2ME5rdDBqTWVsL0pBOGUrdDg3ZEd3?=
 =?utf-8?B?VDFubkpRejhOUDBJeDJmbkdLUWErM2NCWVorQ0prMzI3M1pHVVVycXlrd1VS?=
 =?utf-8?B?dVZtdXhKNEdML3I3WkNlUDk1cGNvK1hmU203SGx6YmpwVGh3YkpWdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d800c1aa-fd69-4364-3082-08da4e95d898
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 06:11:11.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45UPtQrUP8mAut81zWsSIDhB8cR4uQ+yVFOWkLvmu/z9l5e/zip3FaPxoCa7AxnsR4wW6kyncctGBSqZdpQdKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8395

On 14.06.2022 18:22, Anthony PERARD wrote:
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -22,6 +22,7 @@ PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null)
>  export PYTHON		?= $(PYTHON_INTERPRETER)
>  
>  export CHECKPOLICY	?= checkpolicy
> +export PERL		?= perl
>  
>  $(if $(filter __%, $(MAKECMDGOALS)), \
>      $(error targets prefixed with '__' are only for internal use))

Considering my patch yesterday that moved the exporting of CC etc, I
wonder if - at the very least for consistency - this and the neighbouring
pre-existing exports shouldn't all be moved below the inclusion of
./Config.mk as well. After all ./config might override any of those.
(Yes, the ones here don't prevent such overriding, but only as long as
there aren't any further make quirks.)

Since this may want doing in a separate patch, this one is
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

