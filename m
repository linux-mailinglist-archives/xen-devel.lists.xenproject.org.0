Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC33BEA0D
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 16:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152344.281462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18r9-0000Rz-1t; Wed, 07 Jul 2021 14:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152344.281462; Wed, 07 Jul 2021 14:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m18r8-0000Py-Ui; Wed, 07 Jul 2021 14:48:54 +0000
Received: by outflank-mailman (input) for mailman id 152344;
 Wed, 07 Jul 2021 14:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m18r7-0000Pr-Ap
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 14:48:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 713c486a-df32-11eb-8507-12813bfff9fa;
 Wed, 07 Jul 2021 14:48:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-uYad9FLFNCSAPES7f6veyQ-1; Wed, 07 Jul 2021 16:48:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Wed, 7 Jul
 2021 14:48:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 14:48:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0179.eurprd02.prod.outlook.com (2603:10a6:20b:28e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Wed, 7 Jul 2021 14:48:47 +0000
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
X-Inumbo-ID: 713c486a-df32-11eb-8507-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625669330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=06Th48dZbeVUBJurg+bDQkzqgN7ZY/biMHtK3UQk77s=;
	b=SDZuvMHhwumBVpxIRSvvnu+ASLnUey/vfLSMrTajp/COin8iZX10il6yUWMp92mvtTkZCW
	szuyIjiG/r6+oQ++/Nwin0seashRlATnLsm6HIeoSzDREK7PuI/THjijOImGyQBxB43sks
	AQl2Czk30UTImW4C+Sq/EN6vJ7vFmEs=
X-MC-Unique: uYad9FLFNCSAPES7f6veyQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUr0jS02B1lcUZ+FJJC0MTjY2kAZPMsuGM2LRxjOvvsLNnsaCfFNlfVbMtT4C1JLpFMRAVgdrxMiQPNHsvPh5pvPvCVwoz76qMrAuy0owUWt1kwXSqmZU/R/WeIjV3M1qIHLxeeq8OA1GU7LvBCadvTpmKt42cIoPiu1aCu5SaW9UW9CkSDTAjRmDhQERwdMKCplVlY5hIdg+tjDLeCOI1IkcgXSuuTHKPClxz8691yHAwfSnjxnUaxB2pm5j0q++14Qbq64JtTAFfNDU8Wjb+wDyvgKn4npJGQwnO0vNAjj/htSW/0H8TfVcbLdix2XQA07GvgWZpWJ4lAT149yPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06Th48dZbeVUBJurg+bDQkzqgN7ZY/biMHtK3UQk77s=;
 b=fMPVy7G6V/fcLoVeLlHKdH4pHoFC/rkobMSj7oyfiiK44naG81Qo7lXCFlsiwHrppxll/NRTbhPaTT5muT0PRBm21JSkmcyfDPVMQRWkPQI3bUJHWs96im02SaEQT/UD83NdJTh5qec7U2qrLMUBvsJC8/shnE46LmVE/YvDaDuO0I51ITcSpln5vMLV8uGZXjw3t0cZ40z1DVCHDj19RBypzAMlb1fo07t2Zf0cYZewMBv6v3LOhIncMz3BzAWE817Xtc1TzRJHi2e9FX7LHvAO7iAoBaewNaX+FiDezjaOxJK/iWZbbtee4gvsClVyK+9xSiwj9FX8mBKXmhGW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 1/4] xen: XENMEM_exchange should only be used/compiled
 for arch supporting PV guest
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-2-julien@xen.org>
 <8c0100ab-dfd7-9c64-c89d-338db62cf20b@suse.com>
 <3bb6ff6a-a4e8-daaf-daaf-a6efe07819d4@xen.org>
 <58669e8e-8397-a5ee-5c54-cd18bbb2718c@suse.com>
 <5c20c433-34c1-6c2f-e6ee-f5551921263c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f0fbe12-5e0f-6ceb-d2ba-72677f69a063@suse.com>
Date: Wed, 7 Jul 2021 16:48:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5c20c433-34c1-6c2f-e6ee-f5551921263c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0179.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3d24111-e2c0-4315-219c-08d9415653a8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB377401F22B2000F769709E57B31A9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OjyEWQacvox0sQTPolgrToS80x3lTvJvrwNREhUKzOHhgAFfeYIxJSalVqxV1fvXe4vOVo3VrsR88daxUDqboU9bvbpc3uqBr9R62JFQjJ706uk/JBPs1ltfnj8imc9fWjj17QXF/1b7aY2hyMTqxyWEytAOADX1bedZr+vBdQtiUKzPksWuGwxNRN3HKcI1USDpyMGo8P4lRD1leTjeYhHYNG3myrkbwa5oU8s5ONO5e3wQm73UrGig0tZ63x5HJuLtN97PRu1cD1gV3MSSCwBmprHOuSlGCMv9sj6Qdci3B8uBGDD6350PjrZFOdA/AxZDxkSe3WXQ3auqSvSWkG6K3RQAuNvzGb+hQEI+VjqJAw9S5y3ufpTleTZi2MTvFaqCsIVfPKwQy9ag61iOFz+PKs2T7PN7M1ch29TMIH+j98cPe4wpEgzOffG5NTC39DJ2Nelukenkw8UB4SxN4ZGZD/kXegGwQY8iOYvJ2JGPKYB1Z6wcSYy052tRqHrFSDBkAuUCgu5NhpZbB7KNQSuIbAYNlpv65q8j9GTvT/ETKdfxdRd7eQw06PAdGEZD7JRDKo6Iii0+7WcjWwZUv7u7u+JGyWreqrFw2YlWrAb4U2ZizieC/Q3VzS9Gz18Guw9EUPUrTFjsEBNX5JD4dgSAM3dthhKXa5FRslLdC3tayd0cQXB9jr1lxw1cP8ZceT168bsLE8eDsV+A5smtsg7RXU/WveMmSzzGq0p4bBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(39850400004)(346002)(4326008)(26005)(956004)(186003)(16576012)(86362001)(53546011)(36756003)(31696002)(5660300002)(54906003)(66476007)(38100700002)(316002)(2616005)(2906002)(83380400001)(478600001)(6916009)(66946007)(31686004)(66556008)(8676002)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SSsyM3RvcFppOFhhU1J2bi9ESWRZK3YvU0ZOajNOczRPVEM1ZGdZL3pnMUpO?=
 =?utf-8?B?QllURGVBV3B4V3VrWTBEUERaVVB2NTBqQlF4dzZXNzNiWjZBNXplRGJtT09K?=
 =?utf-8?B?N1R2eHlRdzQ5bzBaRzdjVjZQc3VzaVhVZEZpd0kwV2J1cVlEK3lhbmxNcUhm?=
 =?utf-8?B?bWhIWFdGTHVoRnYvVm9rSmsxY0t6L01sa21UY0xmaDJ3a0JhTURzVzFmRkRw?=
 =?utf-8?B?Wlp1OE9VdVZleHcwYngwaDRpUU53VEduZGo2RlNObmF4TlZPZ0VrODU4RWJK?=
 =?utf-8?B?UkNrTkNHZzJ2Rm16bGEvMjJqcmJvMmFCQ1FnWDlxaHRVVjdZbXhNeWNmYnNq?=
 =?utf-8?B?MlN1dDVWRGk2R0R1Wm9nS1BGajdYalZqZGVvRWhxRWlNWm14bS9wWnQybXFl?=
 =?utf-8?B?SVJrT3RNWUZ3L0JPRS9DVjdSUllhVW5MbTdGR1lvRm1JcUhrYncvOFQyWjJw?=
 =?utf-8?B?bU9FbHRNczhXWG9yS0xhTVJvbDM0WHlGQ3VaY0pQWkJ0MTRGQ012MStYN00v?=
 =?utf-8?B?OEc2TmNacEFOLzRjQTN6bE1iMTlvaVZCaU9rSmQ0TnFyU0xNOUk5cW1UZzJj?=
 =?utf-8?B?VkhCSXJEb1RGcVBMSUU2VHhaM3Z6bDhIQVU3bmJ5TWlkM1NJdTBodDJsMEMy?=
 =?utf-8?B?VzlnS29xWDdXSFA3SFcrMktQaTA3RUlTNGY3MGRRUG1tVXEwNmJsaW5pVlFt?=
 =?utf-8?B?M1V4NXVXRVV4NE5jTWtJZytpOVdVd1o0NzFHd1A3Ym5YbTRZdHgxM3lRelUx?=
 =?utf-8?B?dHlqeHFySEtVUXBoWXZtRGFDakVFdlVENk51S29iSGJUWFQ1ZEg0QldVZysv?=
 =?utf-8?B?REpTM3hmQVBZNkxCT1NjN3Z3a2JYZTQrY3hWZ0lzanBQem5xc3RKV2Z2amVa?=
 =?utf-8?B?UTJCMUNCQXpyNGdsc3JVNTN2clVtUFdTVUVMcys5a29jMlJhdE9LaHhXK2l5?=
 =?utf-8?B?ZW1HRFJKUm9DQjFEL25lTzNtM1YzT2MwWVNlU2MycHZSTXpDaXZMV3crWWs0?=
 =?utf-8?B?V2ZUb0FqSjlsMXRtak9HbXBQa2lOV1RmbUxxZ2M2ejZFejNXWWlsUGxaWUln?=
 =?utf-8?B?aUlyNkFxS255NFkxTk9HcVpGT3ZHTStmWXJmeDhROUJDN0dlUVpFZ1dndDJ5?=
 =?utf-8?B?M3NKQWRlOG0zSTF5cTNPNFNTY0drVTkzQS9iVFYwSHR3U2V0MHZ2WDdtTnR4?=
 =?utf-8?B?VWdHNHl4N0Z3VVdCUzBWK2k3T25vN0VBdUZrSWd2OU9YQzYyRnp4d2U4MnZq?=
 =?utf-8?B?aS9uNkpUUVRUR3RETVZiMEFZMDFDUGJJZGVlWWY3ZGlDUlJKYm8wVEhwV0dY?=
 =?utf-8?B?eFZQRVNFbllVNEdNS01rc25xcFRyL25NbUhCbHVoZ1RCeHliaytUMlN3eVFX?=
 =?utf-8?B?UHNITkZRQ2EwVGhBSXczdWc4WUFDeW96elBwandWZExxaXdVanhGREhyek9L?=
 =?utf-8?B?UHpVV2VRVU4xc2lRS1piNUhiY1FqS0E4ckE5Nkp4cjdoKy9HSTdBZFdqQUJ0?=
 =?utf-8?B?SGZtZEJrclJFY05adDVrU3Boa3FPNUorODJtbW4vVWJMZmduQ3RwRHE4bGda?=
 =?utf-8?B?WFJBb2VsOWNabmprT29NK2syczByMTVlUTh1aVZ2VTlvczJWcEU1eFdqV1lB?=
 =?utf-8?B?TTlCVnFtRkVpK0RSU1ZDL2prV2xSK2pUWWhRdElEUVllNzVPdEhEL0ZhRnA5?=
 =?utf-8?B?cnlmWVpBY3Brbm11cTgyck81MW94cVJKY2dvWUw5di9HcTUrWEJ0eTlEckg3?=
 =?utf-8?Q?DBFnxh9Y4gYLItpKxXVG6D1HSOl3iCK6LZXXj7k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d24111-e2c0-4315-219c-08d9415653a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 14:48:47.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEYP2UWwkg9RoOx8W5EbY/UMDzR0SZzle6Ve4STewTGp9MPLpHcxd3Ix2YnR0Yy2CAS/GTmvoo5IrhAnklzWUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

On 07.07.2021 16:21, Julien Grall wrote:
> On 07/07/2021 15:06, Jan Beulich wrote:
>> On 07.07.2021 15:39, Julien Grall wrote:
>>> On 05/07/2021 09:41, Jan Beulich wrote:
>>>> On 03.07.2021 19:11, Julien Grall wrote:
>>>>> Changes in v5:
>>>>>       - Removed the #ifdef CONFIG_X86 as they are not necessary anymore
>>>>>       - Used paging_mode_translate() rather than is_pv_domain()
>>>>
>>>> Is there a particular reason you use this in favor of steal_page()'s
>>>> paging_mode_external()?
>>>
>>> This is what you suggested in v4 [1]. I can switch to
>>> paging_mode_external() if this is what you now prefer.
>>
>> Well, I did say this would be better than is_pv_*(). I probably didn't
>> pay enough attention to you already pointing out paging_mode_external()
>> in the description; I'm sorry. On x86 both are in sync anyway, and I
>> have to admit I don't see clearly enough which of the two would be the
>> right one to use here, partly because I'm afraid I also don't see why
>> steal_page() has such a restriction in the first place (which you now
>> build upon).
> 
>  From a quick git blame, I have found this:
> 
> commit fae7d5be8bb8b7a5b7005c4f3b812a47661a721e
> Author: Jan Beulich <jbeulich@suse.com>
> Date:   Tue Jun 20 14:29:51 2017 +0200
> 
>      x86/mm: disallow page stealing from HVM domains
> 
>      The operation's success can't be controlled by the guest, as the device
>      model may have an active mapping of the page. If we nevertheless
>      permitted this operation, we'd have to add further TLB flushing to
>      prevent scenarios like
> 
>      "Domains A (HVM), B (PV), C (PV); B->target==A
>       Steps:
>       1. B maps page X from A as writable
>       2. B unmaps page X without a TLB flush
>       3. A sends page X to C via GNTTABOP_transfer
>       4. C maps page X as pagetable (potentially causing a TLB flush in C,
>       but not in B)
> 
>       At this point, X would be mapped as a pagetable in C while being
>       writable through a stale TLB entry in B."
> 
>      A similar scenario could be constructed for A using XENMEM_exchange and
>      some arbitrary PV domain C then having this page allocated.
> 
>      This is XSA-217.

Well, yes, this was to repair the damage which could result. But it doesn't
explain why page stealing couldn't be made work for translated guests as
well.

>>>>> @@ -815,6 +812,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>>>        if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
>>>>>            rc = -EFAULT;
>>>>
>>>> I'm afraid that for correctness of the interface you need to keep
>>>> this part even in the !PV case.
>>>
>>> Xen never initializes the field nr_exchanged. Instead, it expects the
>>> guest to set to 0. So I am not quite to sure why we would need to keep
>>> this line.
>>
>> Hmm, the public header is wrong then, as it documents the field as
>> [OUT] only _despite_ the shouting warning in point 5 of the comment.
> That's confusing... I will look to update the doc.
> 
>> I guess I never really understood why this sub-op differs from
>> others in where the continuation indicator lives.
> 
> I am guessing the continuation was added after the fact without 
> coordination?

I don't think so, no. I rather expect someone to have been in a different
mood that day.

Jan


