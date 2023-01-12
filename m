Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F7667268
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476120.738124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwsz-0000xA-US; Thu, 12 Jan 2023 12:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476120.738124; Thu, 12 Jan 2023 12:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwsz-0000uK-RA; Thu, 12 Jan 2023 12:40:49 +0000
Received: by outflank-mailman (input) for mailman id 476120;
 Thu, 12 Jan 2023 12:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwsy-0000u9-Fj
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:40:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 556ab6f9-9276-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 13:40:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 12:40:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:40:45 +0000
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
X-Inumbo-ID: 556ab6f9-9276-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9vy4f6aVVyOv0raB1LK7GyUtZGZYVL8KuARyOmpMMZCiQ5ydEKE4an1zI+2ztS4N9RyFFaBhImORDP9+fHVamdVtOLYp/DH8opt7zLZYj+QzE1dO+fDBts6bja1zdV8X/+3QGgWVFiRQXxbwjxJA2sgQcgsHi5GktmXOqpIvYzEcrh0Y8Pjbw69/cM9uVZA8hBzwPW1X1GsCPO/sjCfrNageRuYEGOw+XWOMOKanP4V0TC1tOOvlHOR5o5xhF2MR5NaSI42y00ouxq4fYVu2t+ZJgbzhs4kkE+5/nEZMrxuMiKguhiLsB6qd0BZ81zSAYnV+TgPy+rG06abzQfX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWGd4cOKC7AWrDXtTKfwpBoWoOay9JCrx3MBYUZ5DJg=;
 b=UvaqhYY9oGmDiNKzq0qXCpD49EqRH3nnzZ7i54nm8gSZdloEO4/TLqoOIO9xUULYlCli7VFg4TYyg6P0N8OypIqxMYkHTQsjwWhl2wnVkQKoGf5K9wCFy3cFFd2DxJoNJnzniYLNod4Hm3rI7PlY8RppTIJMhsYwfPRLGMiNHdH73Jh0Ai3dCDRQ2SYgDaYrDYmij6YtPyCU+Dy2/gyT90cId1zorHUQ0li195YrCZqUicemGL6znMNyHQxv0NdIn/nn0sS7hSweBA/rhojdWrx2GfjO1Dt/JrNKwQ/gqzCv6NprxCBxwZwH6cjr9dXUGtUs/cMmk+L61gWi4x01uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWGd4cOKC7AWrDXtTKfwpBoWoOay9JCrx3MBYUZ5DJg=;
 b=KDaYXao1qlwsbNf4XG+XArbEaioH1t6cEGV3aEKjcix8YWN+hQndiEo0DIEudFiTFTK/WvWVTGqtpg2yHJnPH6XNApJ9K+/LOtmF7xnIfn2CqAB0qcKr70jRr+PsevItnitcrgYwlUpgpcXuxPxy27fzuhCOZPGIAylAfg+ilrLHgAzGibVwiOcO3R0D/t83GgoTkZ2IGQF3KLLNWvSj6dAKyHooIRpPrpeCgpN2qBpDAIv/2mp4pXMsdIJzoLxjQsT/xMP4lxFHRuW9u/8Vo1rlA56OAwmFm3yjeUnhV0QYExgWUQc1GIyeHzDmAcQyeYLUZgm+RrLNcqpXO3hnLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c68f96eb-641b-8317-eff3-272efc296d05@suse.com>
Date: Thu, 12 Jan 2023 13:40:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86/acpi: separate AMD-Vi and VT-d specific
 functions
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-5-burzalodowa@gmail.com>
 <b73afacf-a23a-7e51-9bd3-b90b3eb484bd@suse.com>
 <d55b5784-5ebd-d799-9a81-33e2901f4025@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d55b5784-5ebd-d799-9a81-33e2901f4025@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cc2a75-d9ea-406d-5b43-08daf49a396a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9+rhKCDEISSSMsh8JdkaGsIcmw/B7LnuXiP93Zy9GBfYtv9BiTYSmOVHWDkhixIAPCg/pLax4cPWUJxkXrt3Ipk8WJlRVbgDb1kRiNzMdqMg1adjJaZyRTtpZFgrPlXSRO/bC+jZxNiPBvw/ARn4TxQAa62IU7WheXDuFGG5WJC1dxUBZLXMRuglrW+MFj0jh0mLAZLLbRz2IQTX5WzphzhCu3/7zqyFqnazWZVR0kzNO6S040cDQI9LIBYOq92DAN6hxk19zyWmihi5pBFK4Qx7JfDfQg/tKBo2M/NbmI3jdCm+RTRKKwMxDPnOU0LYwIJV02kDJK/bTZWZf6q3es7jWfkrmnqsdyTT0Rc1CKvS+urPJSAC4+RDBcFxSVniEg5pDfBFWsnTrNc3J9kljrwXVpVyAmEkd6lGyHTDx9GuyT0Qp4ZBZ93p1d1M4eZQgraNlbsMEXf3enJmYTxx9mpTOF9/XHBcYDDlQO5Ezh2lg8uQkeysgdmCIoIcwKJAIMFkINPZAzyVJqlNWpX2ZI4SqS55vPBBKAJe2TmP3/D7HSQ2ZTFpNaYwcftLpTr6FrxRrysOLeoALKAgak2DEH/PF31De70vQkTmhvHAJKlmXS8Gt5I0SPxvPOhlb935TX9yDR4BhtknblqG+gUv76qfwzUqd3IfBYMHOw+XXC4u5uFUPpleaWsffaU66GYeULR5RueibvOT1uLhLwyylx7FmgwIFfudl5+BB0sc29I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(8676002)(66946007)(31686004)(41300700001)(2906002)(8936002)(36756003)(5660300002)(6916009)(66476007)(316002)(66556008)(6512007)(54906003)(478600001)(6666004)(6486002)(53546011)(6506007)(186003)(26005)(4326008)(2616005)(31696002)(83380400001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC8xTmMza21WM0t3bzh3eXdPWHRmS0tiZjVpOHFKM3J5RlpDTWUrVWRYeGFN?=
 =?utf-8?B?SzJhUi83cWZieWVyVGVJZkcxTlhnYTA4Q0Z1aUd6aVRZUUFNV21CQnhWTGpk?=
 =?utf-8?B?RHUvRTlaT2RVOGVjUkxJckN6QnlkZ2hvZ0pmbWJtUCtKeWNuREFqTm1xZ21J?=
 =?utf-8?B?T2cyN0h1N0lIeGQ3UDZGZU1ZS1UvNk0vTWc1K2cxN2ZubE5HczVneWpmSFJU?=
 =?utf-8?B?dFdFNU1nVGJENzBiNkxwZmFaQ3NWdkc5YW9Bak1GMU1UVXFvYW10NFcyNWhm?=
 =?utf-8?B?M0lVQ1hmd2VNQ2MxZXY0Z0d5OWowcHdyc1FzSVhHc1o2MmZLRFpncnFjVmdY?=
 =?utf-8?B?TGhMQXQrQXU4Nkd6Wnp5amN5eDcxQTA2NFlLMnRQSWJ2eFl1ZFFnWm1DQU4w?=
 =?utf-8?B?eTNxR0Z1R2d1T2RtemFPcmRZVUhZSVB4M0cvSDF5eFVoUjhVOHlteDVWWFFQ?=
 =?utf-8?B?UldJNVI2MGxybE5GUkpQQ0k3ZkpueGd3c0YrS2ZYSkpISDBwZXFvaThpVVdk?=
 =?utf-8?B?VjlZczA2NGh5L1BrdHlEWVh4TUQ0a1greW5URmdVNnBFdnp5eGIwTGVSZ21R?=
 =?utf-8?B?YWdQYnViLzRZRldvN1JaWVZ0RnlWOTRqRzFSL2pXWXNVbjF6ekV2a1AyRFdD?=
 =?utf-8?B?WjVXMG9QTWtBbkkzU21idE5FVE4yUjQ4aldlU0hOTnovaDBrR3NxUWJXR21r?=
 =?utf-8?B?Sm0ySlAzWFVjU2hYbmNaaDFqdW5EdjlWa3FlanNWditreEZuRUVwajBsdmpF?=
 =?utf-8?B?VWRuRXRMQ1UrR0dOSjY3dEh6dVNiRWhuQmVGdjVrc3dWY3FRbDRXZENSZE90?=
 =?utf-8?B?RlR6MUhFRmxEVGdnWDc2MW1Lb29VdFJKNkt2aDZneVQ3RC9LK0s2WHBsb09a?=
 =?utf-8?B?bDd4NWl4MWwvYVRtR2JiL0JPdXE1Q3VnMlhBb2ZpZUJTdkxkbmp0TURpc0lI?=
 =?utf-8?B?RGVRNk9GMDNocDJpQjlPWkgzeXhQbjVacUdpODloaWx1Ym1adzF4c0RXcjJP?=
 =?utf-8?B?WUF3QnFCVWxyRUdDdTRTY2FXMFVGWWlzY1hGMjFVWlBJTytIV25BZjJ3RW5U?=
 =?utf-8?B?S3Z1dU1hbVVwc0RkTWZnS0NRUkdCMjllOWdWOExaTTJjdXRpdHpXbFpEb0NU?=
 =?utf-8?B?UFVqNUNsVjc2bGRLeGZ0dVBaL2h2akVvUGV1eU0rS2I0RUVKZXdhUjZvOTdm?=
 =?utf-8?B?QU9LaXFYT0dIU05vaUVjejFqMk5MYnpvK3RpbHYybWo3dFZWVEZYRXFMelM0?=
 =?utf-8?B?NGZGKzNEN0pJNHlwQnREbU9xbEZSQWFxbHR3VWt4aHp1WmQvMnUvTVR4c0pk?=
 =?utf-8?B?WnBDVk0xSUN5R0c5cWw0ZjVFNmp4K0pnWlNZQzBTbmsvVGRscjBIdVpoTm5x?=
 =?utf-8?B?MG1ONDNzSDFKMTFNNU5JUVViK3l6dmUyVmN5RlpsMENPcUMyaGZvaDFrTHI4?=
 =?utf-8?B?Uk9PZmdFUm5uZGhQckhVNGRwaUg5ZG5BSmp4R3hsOFFPN1lMUWlCbmZvdjFR?=
 =?utf-8?B?UkxDRi9iT2YyM1JicWRnaFVOSkNlVER6R3JibjhNK0RkQzBYcTFDWThxZkRm?=
 =?utf-8?B?YU1VOGVlY2Q2cVYrVC9BM1ZUZGxoSUtOUEVQN3RCYnpZcEdBVklhMjB0VE5G?=
 =?utf-8?B?RkM3RnFFQlhBZXpiMy8yaTRGenJSM1RVdWtWVVlYcXFJMnZLNHorU3R6MmJl?=
 =?utf-8?B?RU9pdnRrdlBUWWNFR2JoeHdGU0QwTzJ1UTZFMnpEcTBVd3cvTC9iR3hTdy9T?=
 =?utf-8?B?a2UvR09PMXF2OWNpd2p2THNQRk9Xdm9FN3BrVndCSmwvRHV4dGJUK1YrQ09w?=
 =?utf-8?B?dDh1RUlldzFicE1SZ29HdWF5ZG5SQVl5SEJWWlo4UW5KZDlXVmhVbko2eEV3?=
 =?utf-8?B?VjdQN21UOThReUJQVWF3Q00ybEFQbU5lZzM0cm10U2ZxTGtYS3hFSzB1NUV0?=
 =?utf-8?B?dmlzWTQyamxIVHNFVkhuQmJVRjNlWG1HTlpyTVpxUkNlbWwvNzR4cmUyYkV6?=
 =?utf-8?B?alNnRFVPODVtaWhXNDRlZ3JKejY4WDVWUFNFajRkb281VWxMTEJ3MTBXSjVM?=
 =?utf-8?B?UFNBcDdKcUlyYzRSa09OQWhwNlVPeUtzNWxScU1YKzVsNmN1STJ3YW5ST1pO?=
 =?utf-8?Q?EZFqjlBK6vohECuTV59ijXqJI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cc2a75-d9ea-406d-5b43-08daf49a396a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:40:45.3008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6xdcugRQpeOeK9Nlt5mxMQNlJBjlx4srd2Oe2YV1TQoUwaOdHMS4tGIuRfZ0fqtAa2HBrmAdd0wbGp2xTGuPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686

On 12.01.2023 13:08, Xenia Ragiadakou wrote:
> On 1/12/23 13:37, Jan Beulich wrote:
>> On 04.01.2023 09:44, Xenia Ragiadakou wrote:
>>> --- a/xen/arch/x86/include/asm/acpi.h
>>> +++ b/xen/arch/x86/include/asm/acpi.h
>>> @@ -140,8 +140,22 @@ extern u32 pmtmr_ioport;
>>>   extern unsigned int pmtmr_width;
>>>   
>>>   void acpi_iommu_init(void);
>>> +
>>> +#ifdef CONFIG_INTEL_IOMMU
>>>   int acpi_dmar_init(void);
>>> +void acpi_dmar_zap(void);
>>> +void acpi_dmar_reinstate(void);
>>> +#else
>>> +static inline int acpi_dmar_init(void) { return -ENODEV; }
>>> +static inline void acpi_dmar_zap(void) {}
>>> +static inline void acpi_dmar_reinstate(void) {}
>>> +#endif
>>
>> Leaving aside my request to drop that part of patch 3, you've kept
>> declarations for VT-d in the common header there. Which I consider
>> correct, knowing that VT-d was also used on IA-64 at the time. As
>> a result I would suppose movement might better be done in the other
>> direction here.
> 
> I moved it to the x86-specific header because acpi_dmar_init() was 
> declared there.
> I can move all of them to the common header.

I would prefer you doing so, yes, of course unless others object.

Jan

