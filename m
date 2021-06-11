Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019B3A42AC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 15:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140366.259369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrgoP-0000HT-Mu; Fri, 11 Jun 2021 13:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140366.259369; Fri, 11 Jun 2021 13:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrgoP-0000FI-JR; Fri, 11 Jun 2021 13:03:01 +0000
Received: by outflank-mailman (input) for mailman id 140366;
 Fri, 11 Jun 2021 13:03:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrgoO-0000FC-9v
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 13:03:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcbe23ae-7f41-4063-ad71-a1d33bf63e48;
 Fri, 11 Jun 2021 13:02:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-ZlK3tSEYMmOxR17o2uNxLQ-1; Fri, 11 Jun 2021 15:02:56 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 13:02:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 13:02:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0054.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 13:02:54 +0000
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
X-Inumbo-ID: bcbe23ae-7f41-4063-ad71-a1d33bf63e48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623416577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2JC8urWWDlP8r8Gu85fTSrclDgyvEohEKrX4HjPBLk=;
	b=JlWOwELA999eb5dYr0yZzsFYMVQ906h5/vOiAAL0FCi0Lf+jxODD3NlREL4bIrwkMM4sAn
	0olkjOx6659+5X5NMLWJaFhgwA+9uesphquVati1S+/cAIltGJhXAJE+LN+IzHxhPwO7cK
	mKEMpQsSgJl9wmd7rq2as0Az04ARwuQ=
X-MC-Unique: ZlK3tSEYMmOxR17o2uNxLQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BskrIBDap6QhX411ZvrnDpm1gZ5B5Bm7GmRkmMOo6PveoE/g0Si4VkPwb7YPnyhBZToalPdZglUDlLHFlEnxRxVjPIZa7hRrlTohGUn+vA4rMpgwsv0PH1WSTGIBq1ylhmqll4IyPDhbrqd5c8fW9Ke+F5b3eiBR/+yCib66eXG+V9avrfRPoxhVsH/UFhkcheyu1OUlozsKokNub9xAgmarcB3LeCJ8McXm2K9DOuIOlgKv+Hkf5ss91f3XuA6vs3HNCV7ULL38KP48ZehcX2xSS89Sl1+WYm0t3C1n55QIKH07RaIchenaqNEap6RM8fUrNKKGa0XgR/LcrVw1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2JC8urWWDlP8r8Gu85fTSrclDgyvEohEKrX4HjPBLk=;
 b=g4EGFhDqRhzUxiRnvOxPMuEZ0KbWfNZnB/PPBU04fkTV6aTe0+KY7lN2+D34N3Va1Thf/tKtp9R4/fwRb8OLW1rfO9CMOrFDXWfnyZ6xZBHb8nxmJp4VE7PDccmZafgNb8lzsWsHaMJrjihFINdA1nEH6JFb8mu/EIhfSkv5a/xqMN0MZm6R/owDkeUF7Ysgkogpdna1beM0jwpiIgXVqjHBqAq6X7TzMtNmhEBS3tAHq8S3evDNfIZ5dRDhMzy7aoPpIdpIy9676RLD5ZoBBgtQrMplBOmxc6fhAPGKIatSqZ4aBZSDn95Af42f50UlO6LXxfmYmiB4aNlyOtB29A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] Arm32: MSR to SPSR needs qualification
To: Julien Grall <julien.grall@gmail.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
 <CAJ=z9a07v-cnMhK=cVjjdN3-f4t8qGc3oQz17zRdLxOauBp=qA@mail.gmail.com>
 <af2f231a-5130-8e5f-b024-04f74e57d1ad@suse.com>
 <CAF3u54BrJ9MViXnBUMykukaOrpO=SyEV0KwE8Pbs8=tQiLb7wg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1dca7acd-8f37-b9a0-1ea5-dcd7afc62710@suse.com>
Date: Fri, 11 Jun 2021 15:02:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAF3u54BrJ9MViXnBUMykukaOrpO=SyEV0KwE8Pbs8=tQiLb7wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P193CA0054.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e7c6be-2612-4550-5a63-08d92cd93a1d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7149:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71495377DCE357536CD6FFDAB3349@VI1PR04MB7149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXLv7mLZxIhQjR5pz6TUiFAKX0AsKvQj74bxEvY9Q4lyeO0K4HTdUf7IK1nwbM2v4tNdP9m88PyrXLhFBgprQ9GFCRkFVoYclz4DTV3bkYBlxo8kPh0r2nwdSM4UK3LIEsi6aYRQluovd/IQ0q/3jfQHhZClomy3zD1z6Rvs9fjZj6uMiWGjfIoIKOMYx7GwH4gY0eLRkiMV2pXh9GmEa18WiSgYLQsWhPkq2KB0nUuP6G+EXTbYfLMg1Gy5oglTPOeNBctGiyokRXZUG0LiRNF94qqybeMQjCjGtgAqBf7a3KDss2CKmstpeRX9eBu0PciNgOvqa9u1o+vddj+NkGXfn16dIMdHowuVDFyklJntpe+kmuVlTKnS1PfZv6o/egcV1UHtrRMlZ/x2FG6UqXrVKgsCZ5UI/6USUtLrf2jyrUOo0oOpUTHBLDuLsACjoYXOpk3fv59sCi4o23PXq0I6FqeQfF38MdKDkRoAORyh4EGD43KOHAmrDsJMMDPtRiIS5hfY4AwJCbAifB4I/vtdnNUl67O933scuAs2GGeeGYx3PJkv8oFu5Y5Gj0L9PoFOciXJdd4Rvfh4amR2DCxidXSv/AGqxYE3M3blwHJVWBviH/pUJpCQeTPAkeuQ2HG1kBIp+9pa6xsbsFsYLRfJdQeCE00FYhHE1KkHAuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39860400002)(396003)(376002)(136003)(16576012)(4326008)(66476007)(478600001)(6486002)(54906003)(8936002)(316002)(66556008)(2906002)(31696002)(66946007)(5660300002)(31686004)(26005)(8676002)(83380400001)(53546011)(16526019)(6916009)(186003)(2616005)(956004)(86362001)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVo5WlBPdjlRbFNIWnVhcGl4b0JXYmMwZ1FWa1BaaCtydU04TW5KUklwVzU2?=
 =?utf-8?B?QmFJRWRCaElLc211ZitpRy9XVjE3SldWL01xc1NEbitNWnpQSTVOUUVQeG91?=
 =?utf-8?B?WHdPdkhmWlNQVG9LdDJkeU9YMW5FNmhNQzVyNEVsaTdnSDBTVm1McGRUK2tN?=
 =?utf-8?B?MXNMSWFleEVXN1VvTzk4Rk93U0h4SENURzJrMFFmSkJ6eThxblE2RWdXaXFI?=
 =?utf-8?B?dXo3TWh5RkxvZGJHR1V5THhkZS9EcjdzVmpxcXZqT3BjMVB4TTZXUFdBVUJz?=
 =?utf-8?B?Z3R1dVd1TlRONnBUZU9vN1k3RXB2N05QNm0vL1lXRjlCTXBGT0dXekozWUZU?=
 =?utf-8?B?ZlAyY1dHMDdzQzFuV3NVQVJTeFBmaENtTmJDV2RiRVhOZzgzV3VFSXYxMm1D?=
 =?utf-8?B?Nnh6MWZWM2d2bEFXU3lCSnhwSGExOFc5RkFmR3RpWUpmSjBtVHJ1WGFrQ0lj?=
 =?utf-8?B?UnFua0lMOERTdWpOV3VzN0JPcVJVUHFSTFdPV2E1NTBWOWVTdjV0bzBGT0to?=
 =?utf-8?B?N09VU05uNEZaaGF1b1pjeGpzWE52UldhaWVEK3NnVzdjL2lIU05KdW84YlI0?=
 =?utf-8?B?OHZrVE83ZU5ReSs5THdJb25yNzVKb1NrQUNrMDA0b3U0WS9HMUZTMHpSQldN?=
 =?utf-8?B?dVZCUTVhTnhvUDAxa1pqbENTdEV0SWN3OFJ2eE9HaTlXQ3RqR0dZWDdXODFh?=
 =?utf-8?B?RndMTUJIUDUrOEZDTGh6T29oVzd4QThiQkpDZXc4WnB6SFlWVS9FUXVuQlVG?=
 =?utf-8?B?UkNhSG1JL2s1VEpzcTZlT0dMRE53U3ZzUFlVVHdZUGhOWEZjM1lDblNialJI?=
 =?utf-8?B?RVdzZG9GOWs5VGJ2ZjJ2MjYxaTluRFdKT0pzOXUzTVk0SWhjUmc1SnVRSHBy?=
 =?utf-8?B?SkdBRXpqNmZhMkZWNFZRRjNiQXBGOFZtMTQyb01tWUxNSzRCUzZGc29GelRx?=
 =?utf-8?B?MkErNkllMmhWVmRCNlF5Y3kxd1BKQkJEeGFvbTQ4RFlPelJNS1c5TG9oc1d4?=
 =?utf-8?B?dTVTY0xiY1F1TE95WUVnQXhsLzNydW8zdE55YUhmWFFwSmNKSUtKalRTQzVQ?=
 =?utf-8?B?bTlORnJZNTFIRXhHalE0ME1oUm5SK3VwLytRWU81UVllUDdJT3NLU2JvcjVu?=
 =?utf-8?B?SFpmTVJURWhjS1hGM0wvYmhzeGtUWjgyV1lBc21wVGZxZ1ZCYkxjTzd3Mjl5?=
 =?utf-8?B?OEJRU0dyeUs1UGV3SjIvZlFQSUdvZEVBZUNvZE4yelU0UmlHcWFsYzVCRmtB?=
 =?utf-8?B?bU1IUlU5M0tHaXd5T25wZEdlTTVQQ2RmejJTQkFwRGREdjRpeGxHc29OSHRV?=
 =?utf-8?B?NFFVcW5zMVR6MjJTTFJnM0I2TW9XYW1LYjk4bS9KV2k4RnVYL3ZsMXhVQWZ3?=
 =?utf-8?B?cVJ0bjFnSTkwUHJKbG1TRzJQSlBYU280RW9sNFVnRUgwa0NaUFljUjhuUFJM?=
 =?utf-8?B?Yzd6ZklKTi9uWFFNeHhnaldjaGNlSDU4UllBRlVnL3JNRVg5MUFVbWxINlBO?=
 =?utf-8?B?Rm5CYzJEblhTdWxuY3FyQndDQ1E5eS9KNGlXYTNDdUd0bXI5c1hZcmU5N01r?=
 =?utf-8?B?R0xDN0FrRmxpcWRPVFFlMnI5c1VaazVMTHlzZk5pczFKM2grQ3VxeVRpSXlt?=
 =?utf-8?B?TEVwS1pTbWdMUmwyM1dQQjR1Q2E0Uy8rdFZ5cnVOUW9NenF6VTZDOHowdEhj?=
 =?utf-8?B?bVJlSmZFTlJaT2V2MkdERjFkemhBKzJzY2l1Q1dGMGxFWDk0d1hqY3FQL2hx?=
 =?utf-8?Q?Ls6FCHWJd0bvICRJjRyDY7/erNcB2Y7Bj6h0Ge5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e7c6be-2612-4550-5a63-08d92cd93a1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 13:02:54.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05fwurV59DcAfTzgIF4qHIwXPuaV6kQTd5izljx6+qGbY8ag9iZL5CrqZmmKpMGFqJ1QulGOoju47e/dM0nAIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149

On 11.06.2021 12:41, Julien Grall wrote:
> On Fri, 11 Jun 2021, 11:16 Jan Beulich, <jbeulich@suse.com> wrote:
> 
>> On 11.06.2021 10:00, Julien Grall wrote:
>>> On Fri, 11 Jun 2021, 08:55 Jan Beulich, <jbeulich@suse.com> wrote:
>>>
>>>> The Arm ARM's description of MSR doesn't even allow for plain "SPSR"
>>>> here, and while gas accepts this, it takes it to mean SPSR_cf. Yet
>>>> surely all of SPSR wants updating on this path, not just the lowest and
>>>> highest 8 bits.
>>>>
>>>
>>> Can you provide a reference to the Arm Arm? This would help to navigate
>>> through the 8000 pages.
>>
>> Referencing the instruction page would be enough, I thought (as
>> even I, not being an Arm person, have no difficulty locating it).
>> If it isn't, how is a canonical doc ref supposed to look like on
>> Arm? On x86, we avoid recording document versions, section
>> numbers, or even page numbers in code comments or commit messages
>> (which isn't to say we have none of these, but we try to avoid
>> new ones to appear), as these tend to change with every new
>> version of the doc. Therefore, to me, the offending commit's "ARM
>> DDI 0487D.b page G8-5993" doesn't look like something I wanted to
>> clone from. But if you tell me otherwise, then well - so be it.
> 
> 
> The Arm website provides a link for nearly every revision on the specs. As
> the wording can change between version, it is useful to know which spec the
> understanding is based from.
> 
>  Note that for Arm32 we should quote the Armv7 spec and not the Armv8 one
> because we only follow the former (there are a few small differences).

Thanks for having me dig out an up-to-date Armv7 spec. I find this
puzzling in particular because you didn't care to have the earlier
commit provide a v7 doc ref. Initially I did intentionally use (a
newer version of) the doc that was pointed at there (which I also
think is better structured than the v7 one).

Jan


