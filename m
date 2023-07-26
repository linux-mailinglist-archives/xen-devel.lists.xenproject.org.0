Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B1762B6D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570058.891332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOY1j-0004vo-5B; Wed, 26 Jul 2023 06:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570058.891332; Wed, 26 Jul 2023 06:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOY1j-0004u8-2H; Wed, 26 Jul 2023 06:29:39 +0000
Received: by outflank-mailman (input) for mailman id 570058;
 Wed, 26 Jul 2023 06:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOY1h-0004ty-Lt
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:29:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c96ee804-2b7d-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 08:29:34 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9689.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 06:29:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 06:29:04 +0000
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
X-Inumbo-ID: c96ee804-2b7d-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZpj9yaOvkwlKRpDrWaleCsCWiPuF+A2EephhUZTj9zy0br3/fUuPZcDTamc0mm0Gz2FpG0pPp6BzSmEP4yBRq7uerBVkTn4L3H0mQLFHb03K+JRPnBfKaKbnbp4TXAZ4dKxqeenL3JyGlMi73mz1ZGTVgy7d3KeevXxZslXDJQkMYQgLtdLVffiDq83j2A1CM0dlmCqaNkkoy9mOhT9ynMZ4YPQ+KJCKq6R0SNS9939LZ6VQ3Tlzw5ScVNtO9n8QR5Mr8DeO84Y+V2j3ysukMQ4mSbotdmKOVbDpRe9bwseO4Q8uhAT9NbLjqfIhdQmhrAcWrOrcuK+JIi7+bDpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iFl+lqTtvkDipS8RQHWuLeyJZ15ebJ2Niudrj8cq4k=;
 b=NEiSSjuKn/VZ8/gWmt9Mmf+dwTSfd9ansp7KLg/lwkLG3Sd2eopGn878bBryIPFsJpJzXdhP4UTSZPk2bsIXd849ByaxpQ8B0XH7j96HZ71whb7UtMK3m5kDOrj4BjekYHb/kA1uz7LoFIAKnbFPwnSJvEBygUiXKtlQZjmwT7AeoD/zES+yqy/0iR9m8WkSZ8Ea0YG5+9GYt9CDqP4IenLBb+vopxm8jVf1g2TBPTkjB2MIzHX9+TgUYXMrgxiGDXrDgg4AYbHxfBGE3M7hzEONCYRK8uOWoj+RwBynNIAe3WoM6YZZAvxnvrqawFszRBsZjGMjOga4eMNWUkjmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iFl+lqTtvkDipS8RQHWuLeyJZ15ebJ2Niudrj8cq4k=;
 b=BRYqfA9HuR1pLg4liqf/hntTnFNhQVs2cLQtTZ59g0nIBcbQ4gSSYeZdMTB0vDkAMGrxAeuqu1diHfdelBImgsvTKkmqalwUwiMZc4upRJvv+IIPDXerTgJhRy/We9QiIJGZSWHvLYGWnd2YgEtqWfIQO7VNq+hlHE0W+4JIKoPfTyq+QmXJW/TMIa4UVkZ8e+1eO40wqoFQsAwfElJ0jnNrr+VbalgutYBsp/lMHthGahzKvoXKyR+xg9qGF3KWJ5DVl/0YRq/fuW/15gk3ld8gUnxadrkZ4Hcd27AodI0Nqd9FXAC+PMU1gU/79XzebUKBD7vqHiGgjC2ZdvaqjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d35833cd-acf7-f326-3f17-ad87d63ff3e6@suse.com>
Date: Wed, 26 Jul 2023 08:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <0cd9d94b-0a8d-a3e1-d683-04fac1572750@xen.org>
 <8cdf9179-7b3f-5a52-ff02-8ededbe03e0c@suse.com>
 <4a6bd691-95e1-ad15-1054-b43460c85b32@xen.org>
 <ceb81450-90ff-ffbe-431c-37bc60c7946a@suse.com>
In-Reply-To: <ceb81450-90ff-ffbe-431c-37bc60c7946a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 160c31af-8c93-4d22-f151-08db8da19bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SfkmNu20RWHWV1WtjURw3Zjq8/toJkDEq7OAjzmxbS9raoSFgUX8M5HNrYFI2uSf0VkPOP+PRWtmy8Idj8U1vzsa++UwmpcwpzQvOQZwhp7am0+ouoUAoJjTsnDRGbwwEIbiSPdHi6FqLUnAsPgw+B+W28qqsQGUvABASd+nmBv4TYuZbxEieif3nwezOIfDkx8qbkoDCoBWbp2uK1nCSeZlqR85hNTWWyBUy9SEjGa2RZZZfk60wW+Bkp9Pfrmp3cq1vxCiXHInqGb9M26oyAEd7CURTW9uISgh4e5vnAtpKoqP9/s+S9I9zG7sNlL9JUcL/CVQ4zWEN6FmkXIOXuNOSKVJ808n7kJkEch9fhowr/O0+DoQLAjSx/sqYLlgZ9UcMP1+64S3hcw62RYQEGZS/HGiVubJgGGTJVpvwGX93ZjPxSBYDewmkNTrnF8JnwyGVZTqn05Ps1GhyzJFrie2/60eVTlNozm222HNyubls4Xe02GqUjCspF0PmmTPbsokf5i6U1Zg2g8oO1aH9ylTaaeyO6AFoTwzKjewlUvouL+o0V3sRTYFdbw7ulcNor2bCOTf3o0PAVwsTQqoq28sqsMHlxLnERMDMO3YhefSEUHkUznDhRXX8g+NbTc5ZZ6U0p/MwoA+3fasTtnfYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(316002)(83380400001)(66946007)(66476007)(2616005)(4326008)(6916009)(186003)(66556008)(6486002)(54906003)(478600001)(6512007)(2906002)(53546011)(26005)(6506007)(86362001)(31696002)(38100700002)(36756003)(41300700001)(8676002)(8936002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0RYWmxYN0RCVS9QUHBsMEJra3BvRkorZUZXWXVhQmQzbGhCQ0F1NkdWWVhN?=
 =?utf-8?B?aVNISFBYZ2RrWjJDcEVpZUZSQjl6TUlxcWFKOXdhODI3UmRCbUFRclVYTW9O?=
 =?utf-8?B?dmpZdHBGVG4xUVlXT0ZHVFJNa2V3Z3ByMUNhd2pzUzNacTVJeUNDQTAvYnZv?=
 =?utf-8?B?VXdYdWFsVVJlc2tpVFBDK01URXhVOGF2b2VMbTNOR1NZbkoxSlBKUGZ3WkNQ?=
 =?utf-8?B?bWpOZ2c5NVMrNi9LSWwyNjhOSEdvT2lWYjFJaGRlZHBtcnQ1WUo3d05ITC8v?=
 =?utf-8?B?SE03aVdqQWduMUVUQWQzVkJPQVVqV1R5N0hIcUVEdTdPWGo3UTlNVkdZZlRl?=
 =?utf-8?B?TXFndXIvZVpweU5UZnpBd20zcUVvZWVBR244WEtRaWZQdHRuWmNWaDV0Y1lF?=
 =?utf-8?B?dXR0MFFpZzkrdjNRWm9kSHlXZTlxSTllb28zVUQxemFiVkdwMldQSXZETUQ4?=
 =?utf-8?B?bkFlNzhqUVFBN0NxUVBuNUpqZTlHdGpvK3hGbmJTZlFOUkRDOHdwWUE3dUJU?=
 =?utf-8?B?eTJZZklqTHdZY3hUYnFsanl3M0xjdExTc3psZ0N4S3F1V3JuK2Z1WmkwODdn?=
 =?utf-8?B?T0U5T3VKYlNQYlN2Y2pFK1BVeFZ1SnE0aWhabGJ3bzBwL215aUM5Sm5LVjJG?=
 =?utf-8?B?Z2hsNGRsZUhsM09jVVVsdHQ1VDRTakJaUGNjZ29lSmdTb2FHREFqd1F5eFVT?=
 =?utf-8?B?NmhaVXdRTjNnRys1dEZyaG1MZWE3K3YweGJXYi9RQ05taGtpK1NYT2s0NW9q?=
 =?utf-8?B?Rjl5YlRCTFIybkxPVTJ6NDRJcHlMMC9FZ2Z3ZFhaMzdqdis0Y0lLaThMaW84?=
 =?utf-8?B?QlRQaTVpaFZsZG9sMEEvMDJ5Y1ZjWXpFa0dSZUVDSVhmRVZoYmp1aXFiSTIy?=
 =?utf-8?B?UmQxSmp0ZHNQZjFyR1dXVVVDYnBBRmNzNVdLcmlMajRMOXViVlpPakxaeWVp?=
 =?utf-8?B?ZGlQZytvQ2xSaGZrZW10TjA5U2ljdVUvWHZrZk5RUzNIUXAvUjY2TXRIWDZt?=
 =?utf-8?B?TEVaTDllSmJVSHFpZFExTW94dkJ0Y2dWcHh6WGU2VG82MjlZVGNlRmovK0JV?=
 =?utf-8?B?S2RxMEFFS2h1ODRjVVRTSjNaaFRvV1l6ZEFCcExxU0pSNmF3a3lHYjMzTlBv?=
 =?utf-8?B?eU4wSjJsZTI1c0JCeEh4dWd4Y3lTK2lNZkROd2haY1hha01IU1ZaZnoxcGQw?=
 =?utf-8?B?ZUplMU5uNHlENzJXU3hGanliR1Zsb3M1anhCN0d3emVsQkpYK09vNmN5NkRF?=
 =?utf-8?B?QkhaRGVCWlFjeUtNV08zWUlHYXBndDVjOVR1a29yenhQckZCNlc3dUFyOGU5?=
 =?utf-8?B?dXJPOVIrcGt2SVRhbkJlTURpYnh3WjNNcTh1WWw3UTFoQlpROW1JQkFIRWpS?=
 =?utf-8?B?WVhhQjFWTVJuMytsU2VMbGNENWRlZXVtcjQ3bTh6THpjZ2hPdkZXOXpDSXlq?=
 =?utf-8?B?SkdsZjk2amo5K1Vmc0xDQXBrbXZocVVienpjV2VQYlppdmJJK2dRU3BldmJM?=
 =?utf-8?B?WEVTcitVaEMwaXFZTlpMS2NKRmNiNG1saTVTRWh6a1NjL2tKekU0a3lUaVZs?=
 =?utf-8?B?Y3N0R1VZbnNma2o3dkw2Y002azNwUWhHTXUvVHY1QitIRngwMGx3QXdMajls?=
 =?utf-8?B?TnpFZkg5dk9nSjV3Vk9SSEZuS3ZZWHphNXVwTDZqdUlFb1E4YWxNSGc0bVVN?=
 =?utf-8?B?QWJMeDFzWlIwam91M1NTaFczS24wbnZhcm9YWU5Tb2E0bVBsS29lMW1mVWFV?=
 =?utf-8?B?S0U4ajIycXZSY0JFZ0dHSE5EOGVQUkErQUh5Y053Wmk3SHVnSnB0cW1MblZW?=
 =?utf-8?B?Q2lsVlNObnR5K2dYTmdRSlRnYVBiV2d2d1o4VVJ6dXJMMmxVblVjeVFLeXRL?=
 =?utf-8?B?Q3k3dEhqUmlkTHJYOVh3dGlCcE1Gb2JSLy9SRndGbjNMaHJoTXF3SkVTeTJt?=
 =?utf-8?B?MGZERjFpc3V2dnRsT290L2x3SGpuRTIvQzlVWXJGUk42VDF6MUtBQ1ViU3Nv?=
 =?utf-8?B?S2hoTlFyVjJhMlNxL3BGdnNSYnVtRUF2OGdIb05qaS9iaDFVYmZack9tTlRm?=
 =?utf-8?B?ZkVZTTgvaXJGdDBTL2VXYVd3aUpwcHgxenlKRzFvODFUVUxjVmdJR2NOUTFV?=
 =?utf-8?Q?aCRrcMLPxoB9kXVqab0QPgLH1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 160c31af-8c93-4d22-f151-08db8da19bc5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 06:29:04.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRBCh9J4/RUifj2UhCqFh1CWpDLDHaz/wAOxeKxxsRUDjFcXh8ea4iqTwiYxYgPHZczGymXTa32NIrdABhQWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9689

On 17.07.2023 17:24, Jan Beulich wrote:
> On 14.07.2023 11:28, Julien Grall wrote:
>> On 11/07/2023 13:29, Jan Beulich wrote:
>>> On 10.07.2023 22:59, Julien Grall wrote:
>>>>> ---
>>>>> I'm not really certain about XEN_DOMCTL_irq_permission: With pIRQ-s not
>>>>> used, the prior pIRQ -> IRQ translation cannot have succeeded on Arm, so
>>>>> quite possibly the entire domctl is unused there? Yet then how is access
>>>>> to particular device IRQs being granted/revoked?
>>>
>>> (Leaving this in context, as it'll be relevant for the last comment you
>>> gave.)
>>
>> Sorry I missed this comment.
>>
>>  > so quite possibly the entire domctl is unused there?
>>
>> You are right, the domctl permission is not used on Arm.
>>
>>  >  Yet then how is access to particular device IRQs being granted/revoked?
>>
>> At the moment, a device can only be attached at domain creation and 
>> detached when the domain is destroyed. Also, only the toolstack can map 
>> IRQs. So we don't need to worry for granting/revoking IRQs.
> 
> Thanks for clarifying.
> 
>>>>> --- a/xen/common/domctl.c
>>>>> +++ b/xen/common/domctl.c
>>>>> @@ -683,11 +683,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>>>>>            unsigned int pirq = op->u.irq_permission.pirq, irq;
>>>>>            int allow = op->u.irq_permission.allow_access;
>>>>>    
>>>>> +#ifdef CONFIG_HAS_PIRQ
>>>>>            if ( pirq >= current->domain->nr_pirqs )
>>>>>            {
>>>>>                ret = -EINVAL;
>>>>>                break;
>>>>>            }
>>>>> +#endif
>>>>
>>>> This #ifdef reads a little bit strange. If we can get away with the
>>>> check for Arm, then why can't when CONFIG_HAS_PIRQ=y? Overall, a comment
>>>> would be helpful.
>>>
>>> As per the post-commit-message remark first of all I need to understand
>>> why things were the way they were, and why (whether) that was correct
>>> (or at least entirely benign) for Arm in the first place. Only then I'll
>>> (hopefully) be in the position of putting a sensible comment here.
>>>
>>> One thing is clear, I suppose: Without the #ifdef the code wouldn't
>>> build. Yet imo if things all matched up, it should have been buildable
>>> either way already in the past. Hence the questions.
>>
>> Right, it would not build. But does this check really matter even in the 
>> case where CONFIG_HAS_PIRQ=y? Looking at the code, it sounds like more 
>> an optimization/a way to return a different error code if there value is 
>> too high. For the domctl, it doesn't seem to be worth it, the more if we 
>> need to add #ifdef.
> 
> I wouldn't call it an optimization. The check has always been there, with
> b72cea07db32 transforming it (largely) into what we have today. In fact
> in an initial attempt I had gone further and also #ifdef-ed out the
> pirq_access_permitted() (and iirc the pirq variable altogether), seeing
> that without HAS_PIRQ the incoming field can only sensibly hold an IRQ.
> But then I thought that this would be going too far, leading to me
> undoing part of the change.
> 
> If we dropped the check, we'd start relying on domain_pirq_to_irq()
> (invoked by pirq_access_permitted()) to always fail cleanly for an out-
> of-range input. While I think that holds, it would still feel a little
> like making the code (slightly) less robust. But yes, I think doing so
> would be an option. (Still I also think that returning EINVAL for
> obviously out-of-range values is somewhat better than EPERM.) Yet then
> ...
> 
>> With that, the rest of the domctl should mostly work for Arm.
> 
> ..., taking into account also your clarification at the top, I wonder
> whether we shouldn't #ifdef out the entire subop.

The more I think about it, the better this option looks to me. libxl
doesn't use the sub-op for Arm (from all I can tell), so the only
worrying in-tree parts are that the libxc functions is exposed both
via the Python and OCamL bindings (without there being an in-tree
consumer, again from all I can tell).

Since I'd like to get v3 out (first and foremost because meanwhile
I've also found bugs fixing of which preferably would take this
change as a prereq, or else the build would break on Arm afaict), I'd
appreciate feedback (of course also from anyone else on the Cc list).
I guess unless I hear otherwise, I'll make the change.

Jan

