Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869068C412
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 18:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490648.759443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4qJ-0003CC-V0; Mon, 06 Feb 2023 16:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490648.759443; Mon, 06 Feb 2023 16:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP4qJ-0003AE-RY; Mon, 06 Feb 2023 16:59:47 +0000
Received: by outflank-mailman (input) for mailman id 490648;
 Mon, 06 Feb 2023 16:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pP4qH-0003A8-SI
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:59:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c323ea-a63f-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 17:59:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7931.eurprd04.prod.outlook.com (2603:10a6:10:1eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 16:59:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 16:59:41 +0000
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
X-Inumbo-ID: a6c323ea-a63f-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhNBzs+DKNIxHmgvPwYrT4EbXLU9Agno1nMTqWzBB+HOEOUtPYXY5Mq14E4PPLKp3NKIpTsTLfCPq/4/0ynEct27dAMbEvkObwYAVGWbn/E0WF92G9T+km8TxyJOeAFG/CHQbAtEG3/h5IpNyxlsqIL7V7fhWK+HDXJX/6y2HcB3aM+ZzoOfus2ix1uiwGoQ6npIrObuH9tIg9fZPMdToM18dS7pdTQufS6YLYgmpzbUFkrJUy0iBicem7DM9gFHneaOvoXBbIf33NAvCmYXCRAHK3z3Mj3Hm6qDI+S8EtqsmiOQvl8ttQHs9fTUXBaWOcwd7cKn69rX79cMrKEPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDrFca8dvmtdJGbiU1pfFdCev8B0O2YOfnJyhi4Mq3s=;
 b=ern0zW2Epzpa2MjnJEKk7mTdOeJqFQ6e04mz6mxhH1wystwnzGNe2IEV14ahwSXw4LuqamSq0d8Q5UpeFJi9Quz78WANJIx4VPcJQwP7WEylReX8c0TLI+7qg8nHy4tgOfbvACrWnBHoJ/+2fZ2+gu7J6GPJehQU36ZI4WuohVXCPHQJtXS0nwGQUO7lErBcaQhWxGdhr4BCFnEXYY5XIzYeQqne7xyTgUcs9ZfZkn+zy+AthYH4IUl07QaGPTGrinThvq6DqiTSyg3GkCN7oFRP8UQcPv2tikKJhqEDz4B2esLMXSAogwkLRyh/6qKToXkhfQIdWdtZdqsOPrQj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDrFca8dvmtdJGbiU1pfFdCev8B0O2YOfnJyhi4Mq3s=;
 b=OoiEuSkjPrn5UflEqq8/OBxfNraDj2PewNGuB1J1AZq2HVSqL+qYEnv4jrAj40ChfE3qt2rMEdJUVZSHFTmUU7qviGgpOsRjOLuShwVLQtZZuMJOCvFuaC8m+don848iUZLug6NmwZPZAz1BRsVTmpsgCOHGuPhEywMF2Kch1OvevJVvvzK8Du00tp5rw5lVCSdVBv3ziAf20RVP/ObIi5We3V48uj9o5zE4POwAR8KByuMXsHN4CL72HL8D0aufQe8YIef322MVhnathpVwOd4Id9WixCz9KpLbSc0/Yevt3eQ6VtjeRSitdqkma/wTj7ZyKbGFFB4f08EraTSE8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <00c311d9-cdcd-45a4-7ae6-5a5fd5450ba2@suse.com>
Date: Mon, 6 Feb 2023 17:59:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] xen/arm64: Default ACPI support enabled
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <202302031801.313I1SdK033264@m5p.com>
 <df51bbdc-ab88-7254-799e-0e2828d3d1a9@suse.com>
 <15b88500-89b0-507a-601c-84a8102bb550@xen.org>
 <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y+EmIHDyvSCHjEo+@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f166506-ba23-4445-39d3-08db08638a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xCgfk8jegvFKM70/zRbH3INlHoKfvLJBgU/VGbGM8fv16djlpbsW2CMePFjlejrBLg2P6wjsFyZ4I4RsQmME9/ccq4OuLAxLWWHted5SypMyo5dIi5layZcpwe2T8ppHU2w/icx1itKO6e01dhpuVefc1TyIPF4mAvsAqeO5fQBJg94/7yj6EAdpyTH5HH3m5DY8vt8zRXvH/6/eZqva0h1pRXxPkLiGFrdGe6YR16gtvDXWFCt8jpZmjV5OAdg+sxMddtUvI2wUnG2mThd0xGb4xvE62kHaRJzyA61G3q1iAp2cesGumf6lSNpN23csXbUPofpY4ZTvtaPv0lAq9dtCUETdQsoCzI1hoqD1jXvqDrXv+TY/Caj/hxW26BNadNycCtn6dU84xNyOcq502zduHKda81lXqQw2XegfxVGuAnrktAd2TPK1N/pLcobkpr/ZvJI7OtJofHiaENESoDuQoeBDb/JX/lE3swddRUeIS5UwuR9sQmkZRm+roA8PtTJY/Fx5AthkVBb8iiWpzK5KN0J2Q2hDLkGsUo6VE0mYch6LKiHpt4OrmnM+GjI39sxVAal3ry/kqKarnUbrsXzx+GdJwmNilOy5opXSNHt+bMBDpfGK+MZGzAMV8aXthcjv1Aoba6ACtkvTdhtpgTnDvGFGjJN/yhSRewl0DZofJlUew+e8+vHKeF91i8Rtjvt5GAULzL+7Bu7d1vPTp5kzWZuPxmU0NOkMdZPss+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199018)(36756003)(316002)(54906003)(6512007)(31696002)(86362001)(26005)(31686004)(186003)(6506007)(2906002)(66476007)(4326008)(8936002)(8676002)(66556008)(5660300002)(41300700001)(2616005)(6486002)(53546011)(478600001)(66946007)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGpVVjI0eitZZGEzUFN5eU9CanFlMkJrYlhPNzFjaTNlTlBHa0IwdVdHR2Qv?=
 =?utf-8?B?clpSNmVCc1I3RlhRT1VsMmdxNnl5TmUxUTB0SUExS1lLdmlvQXc5Z21YQUtC?=
 =?utf-8?B?S1VuUkVNbmlwNFlnRWNBVk00UlZiaGRQem1qN05NazcrVTYrWTVOb1JIVEF5?=
 =?utf-8?B?VUpzWVFUdndmZzJkWitVYyttUmQ4NHdtdDZJb3pUdFZlL2VuT21mTTZLZkEv?=
 =?utf-8?B?bjZybGVyVk5wTDRRR1lQUCtlcUkxSWhQTFZXU2l2N0dpZVZaUUNkY1ljWU5l?=
 =?utf-8?B?T0ZseWtCU3E4WHB2bGFzaENVZGFjQjNnMjUwM0VMMzlGb21Ra3duS0lVNzRi?=
 =?utf-8?B?UFVyNEE4MUozUXp3V2hwNUlMTk04VWYwT0UwYzEzSHlKT1RSUkhQRmlzMVdi?=
 =?utf-8?B?bWJwMWhRYk9BMDZ1TG1mVFhQRmlqTXQyZUpaTjZwQzh0Wm0xTGhRNEEwOFRW?=
 =?utf-8?B?SENPRkd4MmQzb0h6VWoxVXV4b25IbGJXRG9jUzQyZStBU0hmVy9rTXU3ZUJ0?=
 =?utf-8?B?SnF2T2ZsVnljWHc1dlZ4YnRYd3lFMStuWk1pVTBPZG1sbFpid2lqd0Zndnp0?=
 =?utf-8?B?T01UTDRyeU84Um4wWWdzOWxRd1hXNFNhSWN1aDMzaTZIL0orYU56YzRjbHlM?=
 =?utf-8?B?VmtsdTJGYUlwQVJ6ejAzVmVSYm82UkM1QnE0bDJJdmRLVDgrY0FTVkEwWHpv?=
 =?utf-8?B?YUNxalpnOEwxbVBYekcyb2NjL3FwNFBOT3E3SUpSTUY2ZEN5emJHazRHVFhs?=
 =?utf-8?B?YkEySTI3bWdWbFZRNW82b04xMzFEakhrYk5Wa3Q0TnRCSW5FU0dLSE0rMmNQ?=
 =?utf-8?B?Mjl5UDM4a1N3WG1makVZNnJvWG5MaHl5T05IVXBDZXdLblBCU0RPdmpPUStC?=
 =?utf-8?B?dzBrQWlibzlpWlNwcjVOWVlUczFMa1NYWUhPcFdzSkRYSXplNnBwUVhRcDJL?=
 =?utf-8?B?eEM3RGV2ZmhvbWVTdmRwcWtaaUhKeGtXY3hsUEZVU21sMXU5WjJYa3dWV0tX?=
 =?utf-8?B?UVJJUnd5NW41WXEzd3R4ZjNkTVhVdFhRcXlDVG9VRGYxRWdyWTBvTFA4QjhO?=
 =?utf-8?B?NGFWQ2lzbStFSEw2aHZSaWI4Z1JNVURhbyttbkpZRGdCbFZLQUZMUlk4SWRz?=
 =?utf-8?B?amdWWm9rR0QyZVVDa3pvVmN1a01CN1FaWUZ5K240MjMvdnRkY3lCUkpYblps?=
 =?utf-8?B?YzAwZnVNK01VcWNwbnI0S0FpM3lOT0RTQXFKVlR2RlpXS2E2TXQ0R2Y3b3Yy?=
 =?utf-8?B?ZGlTZitpQ3BWVEwvVEh6dmN4NXRkVXlWTGxPcU8wWE1ycHQyRFZDMkxRUWp2?=
 =?utf-8?B?c0tOY1B4Ti9XdWptWXUwMUtmYXA1NmQyQlAxblhHc0tuUlJoTk9kRVJlZGtB?=
 =?utf-8?B?U3E3L0hscDhiUHBJYXNuTk5IeGN3M2Zscyt4Qy95TW13eTBickVJanhma1VT?=
 =?utf-8?B?U2NCak9vYlk4c1NnVEl5eXpWc2l0OVhHNUdDcHF3LzEyQ3I4ei81RDRzMVZP?=
 =?utf-8?B?UlBsK1psaEZ0aktuODh4MGpQeFhXZkhyVTRrbGF5UHcwR2FRV1pmOGlUeVlx?=
 =?utf-8?B?aURScW56SnJqcFgvUkZ5SmdKRWNJRDFBUDhrZjFHOXFSbHVEU1ZXaVNUTGtU?=
 =?utf-8?B?TXRySG9BRzd0TG02MVdYS2JjdWg0N2FubUJzQVhSN00wVGRjcjBPZDZ4czBP?=
 =?utf-8?B?YU42aFRnZzg2OVFZMVlNVVlFcVdTejJyandDUXFvVE8zMVFtQmcybmtZNS9t?=
 =?utf-8?B?S202ZVNJZ01vTzF1ZDFUM0Y4TWtzbVNaR2IreHNkcXNvaU8zVlNMQTVyYlhP?=
 =?utf-8?B?YUJkMnRPOVYxT1lsWE5rclIzeGpMWEEzMFpJZlIydzZCY0FXWVhQbHUyS1oz?=
 =?utf-8?B?VU9KTnpkM0JvVUZrd1RTcWdVcFpxU0FoQTlYSW03bk5LUFFYYjhodk1iMFZh?=
 =?utf-8?B?WlhWaUdBT20vT2pkK2N6aXhreGFpNHpyZWVJWjBwaXlsV1RlWG1SaGh6MzZ3?=
 =?utf-8?B?UG50RzNVVG4zTEhvUDBNNy9ZUmM2d21GdjZJbWMvZWluR3AzZVFRQWtRN0pu?=
 =?utf-8?B?WmtZODRsOHViY21EcmRza0Q3eVJ2UHJ2MWVXeFk1dTJQU3lVY2FxT2l2RCti?=
 =?utf-8?Q?XDaIHOUdHnPF+2wZpZY5ZeHsu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f166506-ba23-4445-39d3-08db08638a19
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 16:59:41.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6zc+eFbwGAfg8qmcAFibnhR1ZBKmju55uhpUP/2qZ6JftsM41e3BShSzGjd/VHk8EbjIVCexe2aEKzytg+fkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7931

On 06.02.2023 17:09, Elliott Mitchell wrote:
> On Mon, Feb 06, 2023 at 10:38:32AM +0000, Julien Grall wrote:
>>
>> On 06/02/2023 07:29, Jan Beulich wrote:
>>> On 22.07.2020 19:43, Elliott Mitchell wrote:
>>>> Unlike other unsupportted options, ACPI support is required to *boot*
>>>> for a number of platforms.  Users on these platforms are unable to use
>>>> distribution builds and must rebuild from source to use Xen.
>>>>
>>>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
>>>
>>> A general question first: How come this mail dates back to July 2020? I
>>> had almost missed it as "new".
>>
>> I can't even find the Elliott's email in my inbox so reply here. But 
>> this sounds like a rehash of [1].
> 
> The date on Git patches is meant as an indicator for author date.  Since
> this is a cherry-pick of a patch which was written >2 years ago
> `git format-patch` indicates when it was written.  This IS how these
> systems work.

Yet I don't think I've seen anyone else send such apparently out-of-date
patches. And I don't think they all go and massage the author date prior
to sending stuff out ...

Jan

