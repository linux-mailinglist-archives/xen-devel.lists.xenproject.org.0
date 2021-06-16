Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11653A9890
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 13:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142858.263471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTIr-0000SR-Pk; Wed, 16 Jun 2021 11:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142858.263471; Wed, 16 Jun 2021 11:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltTIr-0000QI-LR; Wed, 16 Jun 2021 11:01:49 +0000
Received: by outflank-mailman (input) for mailman id 142858;
 Wed, 16 Jun 2021 11:01:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltTIp-0000QC-LO
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 11:01:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e01c74c9-67f9-4b3d-8433-c19d125cac31;
 Wed, 16 Jun 2021 11:01:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-Lgo-8QzIONmqVrB3j2VoFA-1; Wed, 16 Jun 2021 13:01:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Wed, 16 Jun
 2021 11:01:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 11:01:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Wed, 16 Jun 2021 11:01:42 +0000
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
X-Inumbo-ID: e01c74c9-67f9-4b3d-8433-c19d125cac31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623841305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P4Qd2KX4Ezz3bmQaG3UyE0GNrbB+QN0FC8EFB3mW1zc=;
	b=icfYihTsPMpm/K5zqlkwio+aXEVWOlPdMJmQjguu5r9rM5l6HM8hn61ed3M9FDdqSAHIi1
	rMLxOx7uLHBlJyadUoUNFjYNWoHwljsVRsYgY4SHJPFpg0m94Bh4h3KZzimyrbMIp1zKWb
	OrWetJFPN1OLClNWsA4c3CrLrPZfrnI=
X-MC-Unique: Lgo-8QzIONmqVrB3j2VoFA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goLh89kPEN+DH5mu+Q1OEIsgNuLMusl000kPUUeFJujS7KxDWDju8GI/IUyVqgbZQupZKoL//ZFkZofc7HbruzVUntx6rKgCvtqL1nDaBfOzqNWWiysIGSqWl8Mohs181q0SVERiUxFZlxRCCfyKrMDI3esg0R07wKBPfJhryf7bZTWXcQ7HGASNDl7Lt3B/4mL4b+hsGqo6SC8pD/CihoOOjfTJjXDNbmDNGwOBAeIIyDfIxYHrl85FAGEKatcPSQLTlFYFLY1UmPwzTGHPdoRSlbEziCwZeyDc16UzRONC0wzCiuzrovTomNxeYC+CrUl/5PgNWjJlvug2JnQiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4Qd2KX4Ezz3bmQaG3UyE0GNrbB+QN0FC8EFB3mW1zc=;
 b=iUGlSOSLGP2akuSzhGQX05Cwp9me7MXFqcPIzI7umeYppExWf8icgT3DNY0cUujCRjvRk7WAuIEsA18j3EA+2746Cl9FxrWlSYF2OHXfYP/afE5Ip4zS/MYhn93qQqGMlwZGEqI4tfG4/a465g5vOuf26FyHuAeIQVJvP2PMtqnuf0KtiwDq45K3Rzs3kBEeolJ+B1SLRTjYgp+q7JCcUOCcWHi3fFbbHVlHhAxYSSjit3pgCubUahdaYs59g5Xcd9z2/XEqwvYrldBgonC6jsu/bIZcNrHJMAcsfsmzKI/mLR2wvDQJyQtJcNWDRvLTcjkmlfH4B7P+OAXlWTsq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] xen: rename wrong named pfn related variables
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20210616073007.5215-1-jgross@suse.com>
 <20210616073007.5215-3-jgross@suse.com>
 <8dbeb9ea-56c9-de30-4d5f-fc9c0ced6ac4@suse.com>
 <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2328359-06ac-dbde-4afb-9be2a7b26e42@suse.com>
Date: Wed, 16 Jun 2021 13:01:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <79434ec4-4543-97ad-b010-3f2c1b6a55ad@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 707bdb7d-0294-4f02-2eb0-08d930b6200a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7037009A945EABDA4B6DFC61B30F9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8o1qIriXw+Uz5PiwAEl1/f/r06R7V2GBc97VXm2vVBRg4NzSX19X5HtzKBIUKoREc+G0chfepS4y67jonRB8483V779tIK5VuZES4YiWEIbPhBwz9S2oaIx5CjI3q3FVpfRY3k25Ssnca353OTYYxY2GdV54pffF8i7qLsHM21ORavrwoBHYPcSpZZjTYZ7wjIQm+0grecb9uEQRtw7tqxK89p9ilOXnekeZdLl2zAMgiP9piZDLqVveemx07BmClZ5qJ1I9lDzcUTQiSkvJg/gPEP6TrnL9856IxBX0Ph9zSQnJZc/jsEF/MM1OEkGhaB05F3ZzQnPLFWb///Vt2jVb3a3Z369RKHy2g4Fhf/jxhB30e9I6qTvdzeRbcsRfD1p/xRslw6IIS4Rmo/rmtfT9LJMwYjFNJlS2yzLIp5G5ZNa8cTM6qYOLxCYNLdusLO5HXRbYO2z7QQFzCraMwdm0ANAtDvh/HKoqDeC3JYsF40M6pEYWP7gJdrs2q9EsZDuJ9EVgDY4AZpX7c4e4P3YhZ3sLM2j0vNhPb0Y5akDG2ERQ0gLT/9L17VhaMmwTCuqAk7gYZMDSHWftt8x/YqSVRb3yMTdf9+M/1Lj3HysaHAYNpzZTmD59zbVTwTSHBEk+jVS0USy41vyg3v9G9ReH4NkPX8C51nYQS0r0hn4mm29H1rAtKs40ZGCoL5iD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(376002)(346002)(396003)(136003)(6636002)(53546011)(31686004)(66476007)(66556008)(6486002)(6862004)(4326008)(5660300002)(956004)(2616005)(66946007)(478600001)(2906002)(54906003)(16576012)(37006003)(8936002)(8676002)(31696002)(316002)(38100700002)(26005)(16526019)(186003)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enJnZ2doM25heU5zeVliQ1NaRHVMOEZHaVFRM000Y3duRUpPUEZGd0pWNTlF?=
 =?utf-8?B?V2VXTDdMbFV5SVI3QXZHVjFPOGt4Y3ArZmhqeGVVejczZzFVYm5XOWZXWHAv?=
 =?utf-8?B?ZmpFcVhyakY3WjZrRGtwMGkrNVliQ1lUdkpMVkFnUFhaNG5oYldmU29pZ1Ez?=
 =?utf-8?B?Q2pXekJkS05jUTYvZGU3clo4NzRtVTJIN0g0YkxhMlR1R2FkaXM2ckxrUm1a?=
 =?utf-8?B?Y2NCenlUbXpBdk1ud05rKzF3VHNVYmlZQ0dOZ0VKVDJzRGFDdUtXKzVKNnNQ?=
 =?utf-8?B?dEp3c08wTUh2V05LeGNTRU11ZHZNSHBkMlJNNVFLelN6WnJ1YjFrMXlvaDJK?=
 =?utf-8?B?L0xycEgvQU92bUNCbm9lUnlLNHJVaHhZbXJKVkRPZHRTam5ydFVndnVpbTBp?=
 =?utf-8?B?bmxaN2VEUmhzblRKWWh6UEczNzh1c2IyejYwZkkxM3Y1M1FTc2Yrbm1HQyty?=
 =?utf-8?B?T3cyNllYK2dKL1NNUXVXNS9hb0tOOE0wZDZDOXp6d3VxYTNHZ2pDSmpicjli?=
 =?utf-8?B?LzlQV1BWS0l3bGZhWWxFQUFrRDc3cURHcXM0U205UmQ1VHdWNFRqV0ExQzJH?=
 =?utf-8?B?QmJMak4vdnh2SVZILy93UGxMc1BmbzZvWUVmVlVPSFV2MENUaWtZUHNDZUdO?=
 =?utf-8?B?b0JIOUxZODVKUnh0d3RheDBuK25Cc0tFajFSallQT1d5ekVBOVBYQWordzZC?=
 =?utf-8?B?N1loZjhEOVFoenZpTnB3VkFlc3Znalg1dGo1MjFpOWtHK0ZwZm5DdVQvSzJH?=
 =?utf-8?B?L0dvb2ZvVWVvdnByTEFzUmpCcU1HejRWcXB0Sm1NVFJDODZhU2Fha0VUdDY4?=
 =?utf-8?B?cERJUkVSRXptVlhxbkdZZ3BHS24zaVBSaEJsVEJUNDJQWE5yUkNvSmZFdytl?=
 =?utf-8?B?bjVsVnowSXc1eUNmZ29vZG1xY2lJSyt6RHdDVVhmeTViWnNPcE9JWi9WdXQr?=
 =?utf-8?B?OW1yMExQcjJuVUU5ajdTWnVnZlR2OENnZ2Zjc2NrSHpodWZzQ3pZWndQeDBR?=
 =?utf-8?B?NjJZcDFmeTBtZ3c5MGpneExnZ202Qys2UlRSeUdQZlZIL1RTK2QwWTU2QUJ4?=
 =?utf-8?B?dXdGNTNhYVJDUVlWTUJrV1dSRFIxQXNKZG11ZjFxRUVPWGQ2TEZCSlVtZ2dn?=
 =?utf-8?B?R0c4WWhLSmI3eTNuOGJRZGorY1ZFemYwNHJDbko2dUNQNUUyUGNPdTlmdG1v?=
 =?utf-8?B?RkVYcUVKN05XZXpUdkpBdUhBc1hrUGtET2dQYzZZUnh3bS9sKytYNUxVT21G?=
 =?utf-8?B?OHhVM2FBZ2dVc0VpbFczd2VHbmI5RHY2YUdRMGFWRVE0QjQzdGlaNVRiYWNZ?=
 =?utf-8?B?REF5cmxqZ1BqS2xnTzdUa2E0Rk1PMHZ3VS9UeVZndk5pZ1VSV0tEb3dQME5X?=
 =?utf-8?B?K1VXcEkzV3laWHgrY3ZHQlZLZmJWblhGUlg0V3ZGN0I1L2tZTTVlK093YWdU?=
 =?utf-8?B?OFRVU3VEWGhiR2dNWmdzSWQvYW5DQUg4RHdKeXg2NTR0c1JBRzllU0lUVmd1?=
 =?utf-8?B?NFRBZkhZMU84UGt3Y2ZNN1pHcHkyOUErSjlpVGFla1Vqa0EzT0xHWFk5Tkt4?=
 =?utf-8?B?eTk0ZzV2elZsTjdoKzEvVFZGRk5NSXlUMFlaa0ZzejFMcDlWalRUWnFSZnBK?=
 =?utf-8?B?d0ZLSWhsT0YzblZXVTFDTUJKNkMrRG9uQVhGelNWNkZpcVhRMk9tcDV2ZjRl?=
 =?utf-8?B?aVl6VmhnU0ZrQ2FUVytrT3l4TWtaOSt4Mkl2WkdPWW9nankxR2dUNXNpUDh6?=
 =?utf-8?Q?9YedW+zZdeuFqQI1XJDDkovymnkynzEAuODGe0l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707bdb7d-0294-4f02-2eb0-08d930b6200a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:01:43.0084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdcOza78rHSP8UbioDdGhUGS2Mm/UniLe4/AuDyrXtae80uQh/Wus/3Zjc138lQktOAqqnDXy0aKXShAz2GLuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 16.06.2021 12:43, Juergen Gross wrote:
> On 16.06.21 11:56, Jan Beulich wrote:
>> On 16.06.2021 09:30, Juergen Gross wrote:
>>> --- a/arch/x86/xen/p2m.c
>>> +++ b/arch/x86/xen/p2m.c
>>> @@ -95,8 +95,8 @@ unsigned long *xen_p2m_addr __read_mostly;
>>>   EXPORT_SYMBOL_GPL(xen_p2m_addr);
>>>   unsigned long xen_p2m_size __read_mostly;
>>>   EXPORT_SYMBOL_GPL(xen_p2m_size);
>>> -unsigned long xen_max_p2m_pfn __read_mostly;
>>> -EXPORT_SYMBOL_GPL(xen_max_p2m_pfn);
>>> +unsigned long xen_p2m_max_size __read_mostly;
>>> +EXPORT_SYMBOL_GPL(xen_p2m_max_size);
>>
>> Instead of renaming the exported variable (which will break consumers
>> anyway), how about dropping the apparently unneeded export at this
>> occasion?
> 
> Why do you think it isn't needed? It is being referenced via the inline
> function __pfn_to_mfn() in arch/x86/include/asm/xen/page.h. And
> __pfn_to_mfn() is used via lots of other inline functions and macros.

Oh, sorry. Not working that much with the Linux sources anymore,
I didn't pay attention to include/ changes living ahead of *.c
ones, and inferred from the last file touched being *.c that no
headers were getting changed by the patch.

Jan


