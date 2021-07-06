Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E003BC8E3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 11:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150983.279108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hrX-0002GC-KE; Tue, 06 Jul 2021 09:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150983.279108; Tue, 06 Jul 2021 09:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hrX-0002Cu-Gc; Tue, 06 Jul 2021 09:59:31 +0000
Received: by outflank-mailman (input) for mailman id 150983;
 Tue, 06 Jul 2021 09:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0hrW-0002Cg-3Y
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 09:59:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60ed37f2-f6aa-477e-893b-832d121a948a;
 Tue, 06 Jul 2021 09:59:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-1LOyhCd4OF2red7fDPWtNA-1; Tue, 06 Jul 2021 11:59:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4848.eurprd04.prod.outlook.com (2603:10a6:803:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 6 Jul
 2021 09:59:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 09:59:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Tue, 6 Jul 2021 09:59:25 +0000
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
X-Inumbo-ID: 60ed37f2-f6aa-477e-893b-832d121a948a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625565568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eltZ53WzeP6D32Cf1/FknSFJzekvUXZrLl6S5LDaCgM=;
	b=gvnobWSfkxIqzDYVYhlFhTaxZgfzsSSOyPcvKf9gTF8YPBlGlhE8ediBQwZr2BO5mOzGbO
	JL+Ye/p9MJrf4CNeSjBXKq1z13+SJjJ3u0mJTWW9kk2s2AAkCkAud5v2aIrHBi/fumope7
	5Z9bB1FfPdrlXidyI7zO8WvmBbU91A0=
X-MC-Unique: 1LOyhCd4OF2red7fDPWtNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAqVNqV6FnfnIjR/WkpjLWxTQ5JNoiMMWluXZP/4z1KZlrx4XTgdjutcff6AoBta6umLDCOJh4d21MR6lEQFaeDoiY7Ig0/Eg/q0jNszaHrxnW39QjyGxIPtPw1ojz9+dPNk1BoiSXm4BQVgFkF7umLtfRZGUio4Pyx+lBdMMDdPOrlXXW/NiGksyw5pS93JWn1mvfnE5bBbdObJJ1OOiPrlMFcZ2BkJ4grGY/fCywuCjd6F2NsGnCmN5bEpy1tPynLWIR7Cy3534UwcnKkFd2AAocKSyadoEKZaBx8seisiMMpp96FHSutvXV7fTa85YPeNbAXRzH/WvTYd6t6l0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eltZ53WzeP6D32Cf1/FknSFJzekvUXZrLl6S5LDaCgM=;
 b=D9WsUrYgczfG7Cv5Lyv9d/cJhe7cYDHXByQAw0ML8Hr8/C/LVA+7lZIJpcwIVy0DXvxzbZRI729lyurskTRj2Ss/GQg+3t5q+9gxRDFYW8aXot88yDGkROhsS0baB+GE6OpbL9JToR6oEKoLgc3Zg/pAGCHxwJW08CJ0NZUEnq80sSHsgAs/CiR8OYltx4MzcIWucrjWyYz6fXz0KJDZbWKS2/JgKYGd3rC/bBghHOY/b+URrWdubhezGUxVSE5mbh5GQnkbEiZb0xB0gyxNseLyM1q3LquaXN4GTszpIh+IlPwimU1iTJ4H3+MCjCiQD2rovzWQTDP35+i11yXPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
 <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
 <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
 <c6ab1b8d-1598-f7fc-f717-f58f8e0aba68@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea219d56-ea73-8904-ab47-421bd5c53a9f@suse.com>
Date: Tue, 6 Jul 2021 11:59:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c6ab1b8d-1598-f7fc-f717-f58f8e0aba68@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f74b8ba3-71f3-423a-3d5c-08d94064bccc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4848:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4848B0D96005FCCF32B6BB40B31B9@VI1PR04MB4848.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M82qvb0kUe+Y882982w3eV9GJw7DiBHucGRqxQJUHtI4M27UhAQrel1wfREqBJSurTf1DGP48cIlvcVLpH+11Hum9MlEoeoatph28l5JwxUOWWb72/3Xmr4Fx08O8d2eCqki/8ZZ6u3w1cUpFq65Hz6XkrxaAtW6yhj+7mHgL/ciTj2CGSbiXo/3n4ESqUSTcdRVuc9BOzUOM5+/jDMKx4MHxreftp5wHqEUVqrkKb3rO0scqIiEyO0fKSO/B2mZwl6BapyEeG1Oa0gJ5/8pHqdrr98bbyaFLsYEXNOgIAHSFtV0Ye2Zt4B0rrjC9wuOHcG5sYdCyZatBCi054/nC49DF++2EVuqK4KLDDNSnl3H7RX3lT6RebtWq2GfzLfDeIj0mn3g/D50h4q061RkLmYZaoLilLod/YxCVuo4H/5P1OfLgkVKct8791hwRxjUgOI0cxs6Weihu5PIk+xjKZrefnC/GjggmxrUsKUnn5bWDW8FMV0NRhkK10lGhaAWOuyZZO1Ts2MONnzp2OO5DsZytP4+HNQ+uRXAMz+BNbBNf/pOtG00x1IKJTsdmAMFsxKrAENNyJHsXLVMlCDczybUzZXSZ0Q4kKrMJ8EDWHGt2hxQ4Gwd8ljWIqcewc5vAH8SEcjWIk+RQKArwmo4rYrHyZVux567sft/NmvFwLqi2VbD369lMWLLAXxxXh6X/fpuPFGyr4TVOH4IlbhCAy+8KwJtOFHh+nE96LB30rk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(16526019)(8936002)(31696002)(5660300002)(66946007)(66556008)(54906003)(53546011)(83380400001)(478600001)(66476007)(16576012)(36756003)(956004)(2616005)(186003)(316002)(38100700002)(31686004)(4326008)(86362001)(26005)(2906002)(6916009)(6486002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGZpSitocHlyUFRCRVFkektiQ1QxUWFKMUlmR2s4L2dNejZoOVg0ZlNwNU1q?=
 =?utf-8?B?dzRDU3A5V0c0MVIzR2gra3pEb0I3RnVoYzFOdGhJRU1nNkh0ek1VUDNpeGc4?=
 =?utf-8?B?VGdiSHlaa1hzQ2IxeFJlYjhrWVQ2dklRUUxBb2E1TUFSSE94T0ZJcUVrYk5W?=
 =?utf-8?B?WXlFZjBuWHRkSy9xUkZxWllqNWZtalNiNCtJVEJ3V1QyeWF3UjJDejZ4RlZG?=
 =?utf-8?B?ZzZJYnBaczBPTWNWYnROYy95aTNSSkoyK0wxVGF0SzJSblN2aTA4b0x5alJX?=
 =?utf-8?B?Uk5SZEgxL0tLRnBBWDE3TjFObGNQZUhoRUx1cEJibGpXVGlLaWJub2FxTkNy?=
 =?utf-8?B?RmEyWnM2aVhINTdpZWRWQlgzM1AyOExTV2tQcERBclg4TTJzK2NsNFdkaWls?=
 =?utf-8?B?L3V5ejd5eElxU1BKbFZmZUIwV2pCUDZiSU04T3dxSDdJYTBIRDdrZ201Wmtv?=
 =?utf-8?B?RUdkL3Z1TGdYSGV2ZEtZSm41a29Gc2N4RXhPelJqTkpCa2FURm54NXh6T0NU?=
 =?utf-8?B?d2ZhanExdGZzTDBCODNobHJHd2hFNFBYM05qc2N5RHI1dTBSUzJyTFpQWnlZ?=
 =?utf-8?B?VkU1N0xZNStXVW5wcjkwT1B5bStEMHhNRkJTTUt1V2NTMk04MG1hVWxVVXN3?=
 =?utf-8?B?bjdZR01zNStwZU9haDNoQUtwcmRWVU9STVpuSGsvM3Y0bEhCZ1RZclVQb1pZ?=
 =?utf-8?B?amtpVy8xZFpCTC9HaXp6KzNhTEtXWERpVGNHTVk0eFJZZXJYN2w4RnFKS29P?=
 =?utf-8?B?N3FmNXhZRzIwUmNreFdsVkc0b2xqUlp1NDQxUms5NklKMFkzUm1Edjk0Szg5?=
 =?utf-8?B?a0hmMThtQWZKVDN4eTNiVDNiM0xMclhZdVRSWW1aa2pzM3lESVQyUDI5dVJ6?=
 =?utf-8?B?M243OStyRUh3ZFU0eTlTRnkrbG1PbTVPNTQ4eHJtV05EZjY0eFUzVlBXeTRB?=
 =?utf-8?B?akdLYzVqajZLOUcwQ2MwQUVhZjZ3RFVMYmJRS1BmQjc1L01rem5CM0dSL0JG?=
 =?utf-8?B?VndCbnJ6VjI5VlZQRXFCckJVNkV3cXU2d25Sb1dzd2tFTVdmcVRMS213aDhF?=
 =?utf-8?B?RktTZmxlamlKZXJJTUFsZ0drRUZtVkFVcWJiMkwxS0ZPM1ZIb0xuKzcwcWZX?=
 =?utf-8?B?SDJLbjBsUDRCYVRxQm13U3dHbGN6aGZCdVJVdEMrWVp1L3lrYldCek1lME9Z?=
 =?utf-8?B?Q0hicGxVRW5HTlJWeFR6aUFKNVViTGRUbk5jSHpjb3BTRWhWOU9YcDlySmN3?=
 =?utf-8?B?QVY3bzNlOEFGQ043R1lFbmlCUHlVcEtNMHg0S0NhUXE1cDdxcW96aTBrUnFG?=
 =?utf-8?B?Si9DSURNRHIwVGRINjg0TlMwRlBYTllXM2d5OUR1dXJkNkVVYlpreStPVlh2?=
 =?utf-8?B?eG9MTlByQ1BsaFNWOFhsdU5TZTZkQ08zM2l2R3Jvd1k5MU9NL1FIZkF3M2Er?=
 =?utf-8?B?UHpTUkFYRFd6QlhRQ2xpTTl0Nk9WU2llVnY0UmFVVkFJdG1WZnZmU0ZYS1dv?=
 =?utf-8?B?akVwdEdlOU9Ca25ITjUwSXI4QmErK1A0M25PS0JmazZNbmNKUFowcmVJRnow?=
 =?utf-8?B?Wi9tWEhtd0NpV0ljclBBdUl5ZkM3QWpMTVhvRjBiWi9GYUVrR3A5UHZTWWlL?=
 =?utf-8?B?Zjl6bCtsbFczTm42Y3MvTFB1Rm9EblQxR2dWRnRGbk5qWDA0SVgwcklMUFEv?=
 =?utf-8?B?Z3JYZEoxVW1vMXlRMzg4RGNRK3FEMWZtbGZ6VUQySVNHQWtnaWZ6RUtlV1NI?=
 =?utf-8?Q?GzUDOBRkeMZ1rN8BpOeZmNqkI4aTyfafK0PyOWM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74b8ba3-71f3-423a-3d5c-08d94064bccc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:59:25.9413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzORCWD7BuRMX9oZRXESyqWcsnmD7NxXy3SvvvPTgT2rYA7yQuqDioAa6XYN5o9tZYcy6BECnOW6sNcElb7W8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4848

On 06.07.2021 11:39, Julien Grall wrote:
> Hi Jan & Penny,
> 
> On 06/07/2021 07:53, Jan Beulich wrote:
>> On 06.07.2021 07:58, Penny Zheng wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Thursday, June 10, 2021 6:23 PM
>>>>
>>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>>> --- a/xen/common/page_alloc.c
>>>>> +++ b/xen/common/page_alloc.c
>>>>> @@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
>>>>>       return pg;
>>>>>   }
>>>>>
>>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>>> +/*
>>>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory.
>>>>> + * It is the equivalent of alloc_heap_pages for static memory  */
>>>>> +static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
>>>>> +                                               mfn_t smfn,
>>>>> +                                               unsigned int memflags)
>>>>> +{
>>>>> +    bool need_tlbflush = false;
>>>>> +    uint32_t tlbflush_timestamp = 0;
>>>>> +    unsigned long i;
>>>>> +    struct page_info *pg;
>>>>> +
>>>>> +    /* For now, it only supports allocating at specified address. */
>>>>> +    if ( !mfn_valid(smfn) || !nr_mfns )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR
>>>>> +               "Invalid %lu static memory starting at %"PRI_mfn"\n",
>>>>
>>>> Reading a log containing e.g. "Invalid 0 static memory starting at ..." I don't
>>>> think I would recognize that the "0" is the count of pages.
>>>
>>> Sure. How about "try to allocate out of range page %"PRI_mfn"\n"?
>>
>> This still doesn't convey _both_ parts of the if() that would cause
>> the log message to be issued.
>>
>>>>> +               nr_mfns, mfn_x(smfn));
>>>>> +        return NULL;
>>>>> +    }
>>>>> +    pg = mfn_to_page(smfn);
>>>>> +
>>>>> +    for ( i = 0; i < nr_mfns; i++ )
>>>>> +    {
>>>>> +        /*
>>>>> +         * Reference count must continuously be zero for free pages
>>>>> +         * of static memory(PGC_reserved).
>>>>> +         */
>>>>> +        ASSERT(pg[i].count_info & PGC_reserved);
>>>>
>>>> What logic elsewhere guarantees that this will hold? ASSERT()s are to verify
>>>> that assumptions are met. But I don't think you can sensibly assume the caller
>>>> knows the range is reserved (and free), or else you could get away without any
>>>> allocation function.
>>>
>>> The caller shall only call alloc_staticmem_pages when it knows range is reserved,
>>> like, alloc_staticmem_pages is only called in the context of alloc_domstatic_pages
>>> for now.
>>
>> If the caller knows the static ranges, this isn't really "allocation".
>> I.e. I then question the need for "allocating" in the first place.
> 
> We still need to setup the page so the reference counting works 
> properly. So can you clarify whether you are objecting on the name? If 
> yes, do you have a better suggestion?

It's not the name alone but the disconnect between name and actual
behavior. Note that here we've started from an ASSERT(), which is
reasonable to have if the caller knows where static pages are, but
which should be converted to an if() when talking about allocation
(i.e. the caller may not have enough knowledge). If it's not really
allocation, how about naming it "acquire" or "obtain" (and the
config option perhaps STATIC_MEMORY)?

Jan


