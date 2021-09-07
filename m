Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA34402341
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 08:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180394.327035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUIo-0001Sj-UO; Tue, 07 Sep 2021 06:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180394.327035; Tue, 07 Sep 2021 06:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNUIo-0001Q8-RJ; Tue, 07 Sep 2021 06:09:50 +0000
Received: by outflank-mailman (input) for mailman id 180394;
 Tue, 07 Sep 2021 06:09:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNUIn-0001Q2-Ji
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 06:09:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3422ff0a-0fa2-11ec-b0d5-12813bfff9fa;
 Tue, 07 Sep 2021 06:09:48 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-I2SFiyC0PHSf8gq9h58a1A-1; Tue, 07 Sep 2021 08:09:46 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4611.eurprd04.prod.outlook.com (2603:10a6:208:71::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 06:09:44 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::ac:a0be:c26c:908b%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 06:09:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0701CA0002.eurprd07.prod.outlook.com (2603:10a6:200:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend
 Transport; Tue, 7 Sep 2021 06:09:44 +0000
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
X-Inumbo-ID: 3422ff0a-0fa2-11ec-b0d5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630994987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=intlh2v0bqwJEaN4Bk097uOqhuTDV3eIWchBM22Tee4=;
	b=aV4wV8NhcS1f/dnBgkrI0DM4ytGBv68YsQGT2XISstUDig9eS8fzbXtc6llASR4mN8WkOW
	MWW61lbUQCbOLtMyDnEBEalc90acpljJV+BRaW9PnXzIctkvbL9EqPcaDtdsZotJwx4j2w
	AWyWDHjd7ZTGDR2xoqTe4h/PWSuyXiI=
X-MC-Unique: I2SFiyC0PHSf8gq9h58a1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcbsu/NNkyMxzR3bZfLME8+s1JV0JyI2Uhr3w4fNcvbXqtGc/uCrJkeSavDumnckzNMCBQ3T1LcfbrkAmrkqR1BzKOZVAVtimIdh0rlnuc96XZ8+VwhvtkrTLIVJpHaXJ5KgrEh33Ul6+FdvysuaVesped2xxWgL6nAPmWNVAXSkbdJmWcQIAmZK+dgH2Sqt7yTNbOOVVunyFRcfhcDqzO0zsh+4ffTJNQmK0EKsapsL32OpzU9FWDI4tok+Ci7EkSxyWAAWtCeXPH2w/yPDbxn9hXDEvpoplGD9zfyiQ4oTzFdtdyNrBWCBpWq21SJblw+VfoGSr6eWLBzd4HSuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=intlh2v0bqwJEaN4Bk097uOqhuTDV3eIWchBM22Tee4=;
 b=WbNhEBKMFas0v7so4B4EXMK9VDttK5CrggaDVaZqYQx1XKXr+YTHtmInwHsLFbOIxE0XUGU3swoxoFCi15mYDKRMb9PGa2+ehxPnS8FJmToBtyP9sqcG+DEBg8lXbrN4V6qLsJ5tD1nrAac1QpfXdXnE/7wIAAbpTar39N2+K1Z8/lxcy/LL/Eo3JqOwA+GQ5zamfLgaqfjKu0uCNPQvUccrUp2FrDS0IfNPEiwrfBweBiKlh7N7SUQrDII/Fr7Yb1A1BV53i/dF+VN7hlsMC9gHSXkbntc/35IE9BZaR3sQD5LOsyK4txW306mZhWyzPgvMYotPkjwldPEXK3ZtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v1 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Pu Wen <puwen@hygon.cn>,
 Andy Lutomirski <luto@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jane Malalane <jane.malalane@citrix.com>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
 <26b88d5a-ae6f-0065-7c3f-5eeb6dd80078@suse.com>
 <2972c71a-5fed-0813-8ec0-d179eacff14d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70f376c6-eef2-42ce-a8eb-67c1130a41e4@suse.com>
Date: Tue, 7 Sep 2021 08:09:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2972c71a-5fed-0813-8ec0-d179eacff14d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:200:42::12) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f42b0e4-3df2-4116-88cd-08d971c61668
X-MS-TrafficTypeDiagnostic: AM0PR04MB4611:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB46116793E746B4C372CF9757B3D39@AM0PR04MB4611.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oLzwCsgJlpWEVEYU8ia0oPbj8WWhy6mWDF4u/iJixc/tU0IECKC+E36AMCdW44Pu6cLxEGThCFvrhq9Qt4a0KbWphiRcLPiotMZjZ/SoCDSNDWCMfB4rLKcMvWlvp5zJosOFJzYaX9s9R+S51dwp5WK8LlkEo+tchDWgBQ6I7QVsG2si85F2Ye+VsovxkiTo++8IECHw6HWdcx4RDmgVe5Gie9CI/6M/AYC/KldiurePOlvDkh+KWWQ9vAlNpSA9Wh7E6nnySubtU7tf44J8goSa50/jt9OQ45FJ8nR8LPAEHckmzx0brCG01SVRlZxnpW3QWUxsnKPTIts6zeUFFZi73AYg1nAVYw3ZvKlhNM6V8/PFVWuvKjue79udDYMmqfiWHoDc9VOdFLarwPNY7WENCXsPKzrP/9L0aZLOFQ2A4jvD0ICSDZLA5YdAeQKQBrYV0f6RtonNvYWulAjI3tPpAnXkQ7dOPj6YEhRAyEoU3Y1c7F1Jv1/Ha1MO7bTvo5gwSPmSTnxpxGfYPcqOL7rBIplvgxCVc7ZaxjqZISeAjPUtLdgnBW7EUv0OG3t/afKHt9ZDDMod6TRlfef5aWR1hoZb3SaIr6af3EXQCEr8VJUC5nGUn4MtCnojFiglDbmj4cB9o2xxdsnLsi7pb92Fzm2vQNHCyT0X1d0FUUB8zd7d0ZzZbxtKvU72RXhSpGjhagZj14BUKfkn4fWzNvdevARVQ3Bc6f1xkBPwDlYtddcTSpVrqt5kL+fswrsi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(31696002)(2616005)(478600001)(8936002)(4326008)(66556008)(6916009)(66476007)(66946007)(38100700002)(316002)(16576012)(6486002)(31686004)(54906003)(86362001)(53546011)(83380400001)(36756003)(956004)(26005)(186003)(5660300002)(8676002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWhEM1dTQm53Nnh4NGlkN1V5bkN3ck5kaHd3ZFhINlZ5SXIwM0RndUw3alc2?=
 =?utf-8?B?RlNYZ3hXYWRpY0JLeitsU29peVR5blpqTGU0N0thTnhrdnM5L1NmOGF5OWpK?=
 =?utf-8?B?djJZVmVOL0EzUlVmdm8rR1hvU1NQUVVtdlZQQWtycFdjZzB2OGhMd04vSUwy?=
 =?utf-8?B?NVNlbjhGcHI3bDN0aTB3MStRMUdRRC9kbDJtc0xFQnpOQUZBdmpOVHo4Zk5R?=
 =?utf-8?B?YVNnMytVNEpRTUJNZDk0Nm41RENGS2o0aFVNaFhlMWRsamVVTnJrSUpXWGZv?=
 =?utf-8?B?ZnVibWlsTGZoN0dPN0dvRUlVbW5EWUMrUTNnM3pHOEwzL0pvcWp1bXFmRUJ5?=
 =?utf-8?B?bDExSlo3MGJUSmVOU1ZUalhpU3ZkT1drcjRZaWVUc09yVXV4SzZ2cXNtYzhN?=
 =?utf-8?B?ekQwdm92REdnVHl1OC9GdDIrUlZ6L0hLTXJndWJTZkJXeWV2clg5M2hRdUhy?=
 =?utf-8?B?eXpIaFFHbnRlem1lc0daWjZRUFpjYTFPZjdabVJkRThHcHFROEJuTkNkejBE?=
 =?utf-8?B?MHhFaGN5YkY0N2lUS043em1TVzdPeTZKdjJpbUMxQWxyN2Ezdm1vTTNEcXVY?=
 =?utf-8?B?RldJWGc0bVZ3SXAyWGFuNGJtV0ZNSDFqaVpidm1zOWpZYzRZblFkaUoxaFNO?=
 =?utf-8?B?N3JiaEdheVZnWXhzdUE0VXhSNzVBVlh1VUJISjFXZnV0a1A5M1ZhSURIODZS?=
 =?utf-8?B?d0ovOWxueHZjNFU2Z3FDcUw2QlJEVmJoblkrTXZKcjllZTN6OHNXODA3RVZp?=
 =?utf-8?B?T0Z0bGdlWHY2K3dXcG9EUXlSNEJOU2trbmJkUWt5RmM1RGJKK1ozWm56VXE5?=
 =?utf-8?B?dWhMVUxXSmMzQjBZSmU3QWZIYS9pSkNMWjdqVko0SGIrRWQ0dnlZdjlYclZj?=
 =?utf-8?B?RDNMQTRhT1N6V0NOa0FmdlNGVDc2bXUwY2NSR3R5SEpDbGZqazVTNkVJWWJP?=
 =?utf-8?B?RXpUajliZDJ3Q1NaUlRDWk4yUXRKaHN3b3FUT3pLUlFmVTRyODRvUXNBWXJB?=
 =?utf-8?B?UDEvQUEydHYyeWVvbE9oUXg4VjVyVWs2ZDB5aGsvT00zY2xUQ3pTcWpwdjVU?=
 =?utf-8?B?NlRWaDNuZjRXMjFNYmF5UTNNNzRkdGFQWmhmS2F1dTdwU2w3dlVEZmVscnov?=
 =?utf-8?B?ZHU1bllYbVMrN2pmRG4zQUcrcXBwYktWalhVSkJJWTY1NnJJT20rQVRCb1hh?=
 =?utf-8?B?RC94UVhZNWF3ZVMzY1NTM2V6M1NPRENzcm96MzV4TW1LK1VQakJ1SFM5MGtE?=
 =?utf-8?B?ODV5VjV3WkZFdmVSYjBKS0UzREgxWWxyaE1pTGhvUTFaeCtYNldxVGlzUlRR?=
 =?utf-8?B?OUU2amRRMzRVUmdJbnF6OGZzMDNPc09iRXlqYVErZTRlWEtwbVdERnJkQ3RC?=
 =?utf-8?B?ZXUwdmFidkwrMHRZNlJlRkdoTm5kMHlRdDFZS3pYV29KbjNpYkc5U0NqRlNN?=
 =?utf-8?B?OVYwcC9oa2c3L3grM1hhRTFtcmlzdFJwSGN3OUdYa09SMWpEdkE0aFBWQWRl?=
 =?utf-8?B?TXp4a2I3VytHMTBQUmIvOTZFZTJHRkkwWXZEdVRJaFBRYkRXZDlyTFYvOWZq?=
 =?utf-8?B?U0tNQ29BOXh3d1Z0aGp2UXFHNzlvRnBDZlVtYmVUbDFITHBEUUpVdk9hV3JB?=
 =?utf-8?B?amhGN3AveEpyVyt5bmZkbU84VlBLbndhMFBNOXNVQlQzOUNNR0I2TiswM21K?=
 =?utf-8?B?R0kxNmk5bTRzTEFmeURHNzM3eDNPMmlMbFkycWQwdGZIa2FDRk5iOGxBQlZx?=
 =?utf-8?Q?frwx11arucvmqtG/L+Z5vi9OjXR9sye0svjP/3Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f42b0e4-3df2-4116-88cd-08d971c61668
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 06:09:44.4237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrlXNOH2d3K10CZXYFx7pC+O0tNHhdwiSffOj27flzzms69sKdbMJoU/ZievS9k1nRDdpvbotinVz7WafPficA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4611

On 06.09.2021 20:07, Andrew Cooper wrote:
> On 06/09/2021 16:17, Jan Beulich wrote:
>> On 06.09.2021 14:00, Jane Malalane wrote:
>>> --- a/xen/arch/x86/cpu/amd.c
>>> +++ b/xen/arch/x86/cpu/amd.c
>>> @@ -681,6 +681,19 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>>>  			  c->x86_capability);
>>>  }
>>>  
>>> +void detect_zen2_null_seg_behaviour(void)
>> This can in principle be marked __init.
>>
>>> +{
>>> +	uint64_t base;
>>> +
>>> +	wrmsrl(MSR_FS_BASE, 1);
>>> +	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
>> While I don't strictly mind the "m" part of the constraint to remain
>> there (in the hope for compilers actually to support this), iirc it's
>> not useful to have when the value is a constant: Last time I checked,
>> the compiler would not instantiate an anonymous (stack) variable to
>> fulfill this constraint (as can be seen when dropping the "r" part of
>> the constraint).
> 
> This is "rm" because it is what we use elsewhere in Xen for selectors,
> and because it is the correct constraints based on the legal instruction
> encodings.

grep-ing for "%%[defgs]s" reveals:

efi_arch_post_exit_boot(), svm_ctxt_switch_to(), and
do_set_segment_base() all use just "r". This grep has not produced
any use of "rm". What are you talking about?

> If you want to work around what you perceive to be bugs in compilers
> then submit a independent change yourself.

I don't perceive this as a bug; perhaps a desirable feature. I also
did start my response with "While I don't strictly mind the "m"
part ..." - was this not careful enough to indicate I'm not going
to insist on the change, but I'd prefer it to be made?

>>> @@ -731,6 +744,11 @@ static void init_amd(struct cpuinfo_x86 *c)
>>>  	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
>>>  		amd_init_lfence(c);
>>>  
>>> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
>>> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
>>> +	    c->x86 == 0x17 && c->x86_model >= 30 && c->x86_model <= 0x5f)
>> DYM 0x30 here?
> 
> 0x30, although it turns out that some of the mobile Zen2 CPUs exceed
> 0x60 in terms of model number.
> 
> As Zen3 changes the family number to 0x19, I'd just drop the upper bound.

Minor note: Even if it didn't, the !cpu_has_nscb would also be enough
to avoid the probing there.

>>  Or 0x1e? In any event 0x5f should be accompanied by
>> another hex constant. And it would also help if in the description
>> you said where these bounds
> 
> From talking to people at AMD.
> 
>>  as well as ...
>>
>>> --- a/xen/arch/x86/cpu/hygon.c
>>> +++ b/xen/arch/x86/cpu/hygon.c
>>> @@ -34,6 +34,11 @@ static void init_hygon(struct cpuinfo_x86 *c)
>>>  
>>>  	amd_init_lfence(c);
>>>  
>>> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
>>> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
>>> +	    c->x86 == 0x18 && c->x86_model >= 4)
>> ... this one come from.
> 
> From talking to people at Hygon.

Fair enough, but imo this wants mentioning in the description.

Jan


