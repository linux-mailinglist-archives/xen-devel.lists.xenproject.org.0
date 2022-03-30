Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4D4EC5B7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296342.504402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYTL-0006ot-QJ; Wed, 30 Mar 2022 13:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296342.504402; Wed, 30 Mar 2022 13:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYTL-0006n3-NH; Wed, 30 Mar 2022 13:34:51 +0000
Received: by outflank-mailman (input) for mailman id 296342;
 Wed, 30 Mar 2022 13:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZYTK-0006mx-6V
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:34:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b6a6d47-b02e-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 15:34:48 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-Xu0tRWtVMemOfnZmYKoEpA-1; Wed, 30 Mar 2022 15:34:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3356.eurprd04.prod.outlook.com (2603:10a6:7:8a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Wed, 30 Mar
 2022 13:34:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 13:34:40 +0000
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
X-Inumbo-ID: 2b6a6d47-b02e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648647288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d//aov0a3uhTS5uqlmbDEVso240mUGcdqql3oLPkCb0=;
	b=LJ+CjqStSHm3ZwECLWAYs1a3yPHHhcA8i4e64okAMg1n0UPh3RJI4LZPZqcU2yb0IF7KxY
	mq1tKDE3GZhuoVpNi4oNtmbfiyO1Fk7PfMDBvhQXA6iDdtRaDHDAenMIV196ymoCfd4kPc
	GicS5kkMCATKKz/YQb7AXFzkwzn1zvc=
X-MC-Unique: Xu0tRWtVMemOfnZmYKoEpA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCGbR1JkwUSqkPNTLEua0XyfIEEy5dXkROtOmAUehGcAPv2p0hcwvNM1vFQnVzwIqOfSV9uCoD1uViI+6MGrcJaHekTt2U3WEVq9UhI8BsAbiPj1uGfFGqL9cUHkT2jS+l7CjUBBVrQK8AS1/wDGHCuRrQRiH/eyCJ+J8RE3tR9ZobGEmCvaWR3blphl7+7AoKRPgHAeYdvpySrTDPko6xJvS3pUYKgX6F34E3hgDk90ddHumPGFPYitD/J7I1gw0AcAuVtx1UzaPJb87rNcijUlTg7ryPKnkhB+CtWnS1/n7zGugGDlXN4VctezZcAyo4/51VGDUkt9WOr6OKcoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d//aov0a3uhTS5uqlmbDEVso240mUGcdqql3oLPkCb0=;
 b=l7IefxdacdN6XpYcoIEIXHvdctMTg+Ki0ymAWM0YdEeniYgtGDxC9RNKw0pwX1/rjv+zUeAGw7bQzdCj/wXoEoMM8ig+lifLJezctd7qE3lXQH1Hj3yRHFIwQN+GZTMOVA6D6tnERv5tOZnZwQhUNgoyioUS96pmR1BrH5Hn1kPrYOx+7UIyxEy+dKGUSLPHCi6tavbUrfSz+nK3/Z5n5kG5U5vsZgDkhI/AEgGhmia/n1xzgBnpXIOCx54BKATU2zlKDPZVwilroDFYgFt24i5sSU50ZoRCiAV29M8H6f4Sapze0oZ4PSe0KezaX6abySThbnSxWXCS3n7D8o1ipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <afabea4f-9497-726e-b5de-ee2df4391641@suse.com>
Date: Wed, 30 Mar 2022 15:34:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] x86/mem_sharing: make fork_reset more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <3ebadf898bf9e165d657a31c0aa98bbd300ffcb2.1648561546.git.tamas.lengyel@intel.com>
 <bdfbfe3e-66c5-3f99-8f50-16f38bfa78d1@suse.com>
 <CABfawhmxeK0RhXPzg9aqE8iytyNr72jekJ_FN9qWE1b32gxTkg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhmxeK0RhXPzg9aqE8iytyNr72jekJ_FN9qWE1b32gxTkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: accbe477-569d-4a94-d3a0-08da12520a6d
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3356:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB33560EB63FA73BAFCD801CBCB31F9@HE1PR0402MB3356.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dsHk/Ht6+4uI/n7XvCjDg/MMgfz7RSoeSc4hZ02zsppR88IbTVKEaSdjnhAQXOpUxe25y82+up6FpAqrMDC9OrqegRQ36w3b5AO3i6j9V+t9y2jbHNRhRQartA46LyYxij2Xgit9IdxVHwrNXuP48WB/D+4axHbXotn/59yoqcKgwjg0+FIo2ltUpOEqgjeeHyPxbYe9R8S9ZUL3DB+7FJGxsxQ/GultFXgx3mhQiin/fR6gKJF0sWbxWl3abmC6aeFIscU1nk+9eeD0/x/ImWyJaGEgYSNDo5V6HaKF1kPEJM+2QeH9bWj0gIOEy/Q9fIDlwce11f4X2CCOTGY4fosAo2h8sBXpz3BMcpqgIz+CMokx2bwRYAkiIxlh33ip0iQ5Kf9BXET3fu9jwhz8uirjGhTTPrrpAPq+bbRtlJCea2V8gUAz3+h9Ioqp5D4QGz4wQI3qnmjMaVLEowSNAGBuPjqHNiSf+y0VkuYDxjFyguMeG4s9gbd+iATzBbeA8vuUEjJ0vfs3cvavhwZWNSC3vjZzFg04rr6ul5iQW9n0UsWQfAPHUuZ/9WVfJziZPeIPztRt48LdHopASdrUtLfYCJYKISxOrZf2sZhXgy+YDhwYD4LWrImtmwEVIY5U2r2tlFnGDKAc5sqTFoJQBJX1Z+Nces1kHbLRkuFe0qnBumdmRZFs9bA4XjRDs94f69PJExTOtGcEPukYfc3FqopC+WT8u5dThGpN7eFjypylrvI1voxfHbHwAH/3G0dc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(36756003)(31686004)(186003)(83380400001)(6666004)(53546011)(508600001)(26005)(6506007)(2616005)(6486002)(54906003)(8676002)(6916009)(316002)(66476007)(66556008)(8936002)(2906002)(4326008)(66946007)(86362001)(7416002)(31696002)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHJ1bEROZFB5QUNyY0dZYnNrcGJGQ2FtWmhsblRBSXNxeWFSa0hIWkhnNkVO?=
 =?utf-8?B?bksvWG9KamJNT3hwaGY2NVQ3a21kNnoyRUkwdDBlT202bEJ0N3QycGtzNEUy?=
 =?utf-8?B?MXY2TkRZMHNLUmdmbUY5SnJmam5JcGRockNyZHFsOTJpQkJ5UWdwRkxUYVZs?=
 =?utf-8?B?cVdvdVB1UzJVQ1JYMStoeEc0SXhILzlscFpERFA0dlVwdytpZ0lEZjcraFJQ?=
 =?utf-8?B?NXhIYlN0eVVwNG9HTktrTWJGazEzZFhTVk0rT1BrUm5QQVBnamJ3cTBGMU5s?=
 =?utf-8?B?NUpYbVF0Wk1aK0QwWlJML291cEVRelpxMFZCZVB1cUx0UCtRNGNHTzVYdTRF?=
 =?utf-8?B?UHFINnk0M0szV3dMUVJiODVxb2p4Qmt1L1VKZzZkUU0ydnp1bUNJSk1jSlhp?=
 =?utf-8?B?NUFmRHc5VzBoSkpYMkFxN0xZT0dnYWVIekVhSHBsYlEyZFVUNkdOMU9mQ29F?=
 =?utf-8?B?cm5QaFYzZGttVm42YUpJRmt0SGpwT3hzZTR2REMyRkV1QTBOZmJVdlBMcGx4?=
 =?utf-8?B?dk1ITkdramlpMjdZL2llN0srOVJydzFYWHIzZ2JWMFhHM3B5WStJNG1uekho?=
 =?utf-8?B?RFRtVWhFSzhLM3JWdExodVRpdEN6QVZoUEJHM3J3bnZ6NWhyZjZVN2ZUTEYx?=
 =?utf-8?B?TmJoZDZMb3VOVXF1L21hTlRield3My9sclFHWHorWGRDc0ZNRms0UllrMnpT?=
 =?utf-8?B?WXh1ZU1jck1icXJwa2JVMS9XTGNHTS9EZjZ1YlpMaXNMZUhWT2t2WjR1UHZM?=
 =?utf-8?B?OFhXeVRibitTamVBenZLNGwzenY2RkoybU9PeGZsL1N5SGZidnE0YzMrRzJD?=
 =?utf-8?B?WXlWUkNvelpKek1DVTFST1FKVkdLdXA4Y0VHa2xhajNoWjFKcDJnYmdLbUR2?=
 =?utf-8?B?d1JBKzVTZGxuMGh0TG1mS29XOXNaa3RKZmdyRStiMW1MUGZPdDY2eU4vazZI?=
 =?utf-8?B?cmlhUC9YejNCaWxzNDdKaVJFa2pyS1hjdWNPb2dqNzFiL0NneUFOS1JFVVVi?=
 =?utf-8?B?QTB5VUh0Z1ZXdkIvQVNLMkhyL0F2cmVNNEFxNGRxQSt2cHFKUllkYXNzVWl1?=
 =?utf-8?B?MEJBYXdzNi9DdEhNRjBoNzFQNHFUc0UrZlpMNGcxTDdhRitXcGlZQ2k4VGdP?=
 =?utf-8?B?bktIaDFKWWt3dnF6aWM5MjhEU0Z6MDFUakU1WU1LZWsvWW1aNUdEeFAyU1hR?=
 =?utf-8?B?dVdNQ3BOWjJZOVhHQmx6eG1sNUtjTUttb0g2UTh3T1JhVzd6aUhsOTdLcHho?=
 =?utf-8?B?Nzc0Z3FPQlpSTFNET1JRZkVVcUtTUTFtV1ZOL3lUMUVWQU1ZSWl3RDQ3ZEl0?=
 =?utf-8?B?V0ZGSjB3bGxFWk5tdElKOWQ4Yis0Z01QUzYzWUJsQU02SDArTVhjdnpWM25I?=
 =?utf-8?B?cENseUpNaStYUVFkUUZtZExvS2NsZmF5N21lQjU5SHIrbHFZdmhrTW1iTzNS?=
 =?utf-8?B?QUUxb093bXBUdGMrTDFMWjloK3VQSjU1MnhpMEcwTk55aUZtZUZxYis0Tm5J?=
 =?utf-8?B?dWZPUDNlckpic0NsTzh5SmFuNlkwWHdFR25KU1A4UE1WOElWaURlTFB1bDNa?=
 =?utf-8?B?OHh2QlJCRWFZZ202YjBFemZIRVpaK2hzVWVzbG00RUNLOU5MN0tUSG14SzNl?=
 =?utf-8?B?Z205ZEt2RlBkdlk3eGVLUFpZUjdoN0dwT08zeGNhdTNXanNzRE13K0VjREJT?=
 =?utf-8?B?bEdVa1lNeVpLbjMydTkyZTFZb2Y4eHNrWFZGVk1iMUNkQ1B5OHIwem44L2dV?=
 =?utf-8?B?YXpkR0lxOWZoMjZERVFKUUdpSGpsVWlDWU9MTlZWQXhOT09RVHNrY2UwNUFz?=
 =?utf-8?B?OFNMVy9VNUdIVzVRanVYN2pMOEh6YnZFWlpFOUtZNDFva2tPNUQrbjltbG5C?=
 =?utf-8?B?NUhtZjJUMENxbzVzMkI0MXA2blc5ZlJqS3pHbHpSeHhxdTRXOHBIdHZLYzZa?=
 =?utf-8?B?WTI0VE5HUThFN2xTeHUxdDBPNFozQlRLSzVJZUx6UU9wNHcveDAxeVFqSDdm?=
 =?utf-8?B?VjRvMEIzM0Zub2QzWkJVdFI2blZHb1REMUJGaERqWGVZSnVVWlJHVUVoVGJX?=
 =?utf-8?B?Z2p0L3JzanptcUV4aEs5eVJ1a1E5WG9WaXp5UzE3TWZleHUvcGcrRW9yZ3Zl?=
 =?utf-8?B?cVF4bTlpTlpqTkJVTW1MRHJPT2h2dXRSQmFPRk1VNTlwdUxYK3phbEhsS1lv?=
 =?utf-8?B?YmtDbWdaZWJHWThsNVhWbDFKd280eEV0MmZlVFZQc0hMR01uREp6Zk5wdmRN?=
 =?utf-8?B?OW1zazFoMXB4TFhnOTdDQnRBcUQwZytsM1MxOTVXVVdVUEdyRDl0ZzV2U3pj?=
 =?utf-8?B?U2h5WXhSbFlQNHhDSUNDT1M4RTBXWFFXaDNyaWpEU3BMbmJ4SGdFdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: accbe477-569d-4a94-d3a0-08da12520a6d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 13:34:40.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhKff98np5H3uEupkm21Ob75h2FVjKRQ0WOWB6nc8d/LqSe9abLh1ew1VIIYrmPk2QzUqu+mQeKs8e72VPSlZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3356

On 30.03.2022 15:19, Tamas K Lengyel wrote:
> On Wed, Mar 30, 2022, 6:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.03.2022 16:03, Tamas K Lengyel wrote:
>>> --- a/xen/arch/x86/include/asm/mem_sharing.h
>>> +++ b/xen/arch/x86/include/asm/mem_sharing.h
>>> @@ -85,6 +85,9 @@ static inline bool mem_sharing_is_fork(const struct
>> domain *d)
>>>  int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
>>>                            bool unsharing);
>>>
>>> +int mem_sharing_fork_reset(struct domain *d, bool reset_state,
>>> +                           bool reset_memory);
>>
>> Please avoid passing multiple booleans, even more so when you already
>> derive them from a single "flags" value. This would likely be easiest
>> if you re-used the VM_EVENT_FLAG_RESET_FORK_* values also for
>> XENMEM_FORK_RESET_*, with suitable BUILD_BUG_ON() put in place to
>> prove they're the same.
> 
> I don't see why that would be an improvement in any way. I also don't want
> to make VM_EVENT flags tied to the XENMEM ones as they are separate
> interfaces. I rather just drop the changes to the XENMEM interface then do
> that.

If the function gained two or three more flags, how would that look to
you? And how would you easily identify the correct order of all the
booleans?

>>> @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d, struct
>> vm_event_domain *ved)
>>>              if ( rsp.reason == VM_EVENT_REASON_MEM_PAGING )
>>>                  p2m_mem_paging_resume(d, &rsp);
>>>  #endif
>>> +#ifdef CONFIG_MEM_SHARING
>>> +            if ( mem_sharing_is_fork(d) )
>>> +            {
>>> +                bool reset_state = rsp.flags &
>> VM_EVENT_FLAG_RESET_FORK_STATE;
>>> +                bool reset_mem = rsp.flags &
>> VM_EVENT_FLAG_RESET_FORK_MEMORY;
>>> +
>>> +                if ( reset_state || reset_mem )
>>> +                    ASSERT(!mem_sharing_fork_reset(d, reset_state,
>> reset_mem));
>>> +            }
>>> +#endif
>>
>> Should the two flags be rejected in the "else" case, rather than
>> being silently ignored?
> 
> What do you mean by rejected? There is no feasible "rejection" that could
> be done in this path other then skipping it.

IOW no return value being handed back to the requester? The function
does have an error return path, so I don't see why you couldn't return
-EINVAL.

Jan


