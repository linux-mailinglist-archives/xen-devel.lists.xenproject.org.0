Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EC6F664B
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529598.824146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTjZ-0005dE-3x; Thu, 04 May 2023 07:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529598.824146; Thu, 04 May 2023 07:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTjZ-0005am-1H; Thu, 04 May 2023 07:50:37 +0000
Received: by outflank-mailman (input) for mailman id 529598;
 Thu, 04 May 2023 07:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puTjX-0005ag-OK
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:50:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 594dea75-ea50-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:50:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 07:50:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 07:50:30 +0000
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
X-Inumbo-ID: 594dea75-ea50-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JP0dg7emPWMFCbzQHGL/5yHAjo5qtmu6tZBzrdZuC554LjwQWcSc0cM45W5WCLtHDkyAPguUILVEHlsXSwRsUK9bcJ7qZG/NcY5O2Qtn6JSH3suwRqzBMkc2AI9hIEwpMWZYZfN75L5ZI2TxROXZz22zws58Jm1slf2L86fZJZ7DNVW1PstZU4VTnE+l2u5Zd3H8HsfIfiYcN+jd5tU/KhnWL+s+pfKfy9ovSXb16T/9RpqecZO86b1Mg0xSROAjCmUSHpTSe/3m9n0G91BqZ4zD4OzwzoECSwksonNh1PGa4tpfdaFnw8/V8L0LhM+OwruwB3YmNc0Ockhy3sAVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv6nK4okzX9Eb24rzwqQlQtMHnW6zOzECXaBdXmSqh0=;
 b=FUDMwP3EvBs8q7nm4avNI8Xarpb5DVv3JXXTE0DSNTXtbbME9V6w0bvgUDAVEyIgdyOt+31slRNJeuTGIMkuesFss/m5apfj6ObKm4OfN80xmJzt9bLE6cChxbjvvsHRizDZ5OASTgQ0aWhY3irC53EsFVI1PpUwkhPz4VTSJtRXE8sYK9WI07cCYsBZJws6wZd1pbDcaC3FMMItqp0tzFAAi8yHyyHhj/RtrPciLz5mT+Sln3/2sQ4ZhRdh0QMCW+I1TX+g7PMtBHVWRkVjE95oGZsuMxbOXnWNqkGbVls4mVW4wViTdHriNY7YXoCFlDVcDiun9ju+dE8pp6j96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lv6nK4okzX9Eb24rzwqQlQtMHnW6zOzECXaBdXmSqh0=;
 b=PFc0i+CJGkznrX1w9D8cvcBv9r/32GnJ2Ah2nJIGrpZwhOqc8Rw01rBIgZOgU/wAU1q3pdXna4g4kxBDzQ47sn2DEGmWy8K4avMROVzJGdjolgKe4227Zl+InVcFNeketRWdufgrCOE0gjvYO2y67uNzXXnAFesElfewNEZwpoSxnQw873ytD/wbIfox6ZbwNCgCTLot6Pz7ijwE9Gl5gpXFpyt4vjhDpTHxsYgzkiJKEiQq7iCoDk6pqkQ3tV8zYGzXXoVFqGs9PIQ/pjRodw1M+MXYXyBp4nn521N6Onm5iD6X/OxDPiromeXH9OPjPHORpUxjICuEbHpUsgzmoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a46c7df-b380-cc41-5582-70b4829d7f47@suse.com>
Date: Thu, 4 May 2023 09:50:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] restrict concept of pIRQ to x86
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <98f51b96-8a1c-7f33-b4d3-1744174df465@suse.com>
 <ZFNiS8oxfozlxCz6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZFNiS8oxfozlxCz6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 99aebccb-6191-4677-00f4-08db4c743b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	egBNRetxNH9oziw851GHE3LrKHTaGXHIytcqY4eyoWqQfdJ9JaLwyUvZVLDwqSjUqVai4+lo6W76CoBgVD5TgqqLsF2fi3HTgGZSG9sAtJsuf9bArgu3KL506f8ytUWoWuEdzPIG+mfRjXkZ0b5KxSVOjP5efg77GWPgOfMKFA/PFX25DVA3hHPknUucCMYlaPAA7/uWPQx+71uSFgnD9DR8OkfPcx9pxQ9nQmBz80Atdl7RYyDvjVqTOUdg+vCuczbYc1uBsoyIKWpbzg+VoRwrTM/Q5nV+Bqew0YXGHOTbmagWB5E6Zncpqo5MDhyc2ijNwK308X3eL5hwZHnNADRAMuIQC3MjpBDJ7Y5UsW2MNIT6YBv+lOfHOr/BdkM0niOwHzkn3wmOz02+iU4jf6OpvnhRdg6wRWJQiqv2lhIgacDqzl5vpSKtkJz2QzdQHo9fGo5nS4xIC3/BYwOIk3W58vyOfRmdQ4p6XrV2B7e6gyGCCVPRZ/oWyb56cnGqqrg+Utity8HkB6RrKZRY2mnuCNVW9rndgH7jgiI71M+4lJ0hnEG3Sse48dOvX4WceqPeQQj0qjNTGir4/G+NfVTky68ZH9j7rfUX/XJPYKEdyU50V2nz7oMImq5Zojvd2GuXU2Qflg+1QiH1tQTYlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199021)(5660300002)(2906002)(31686004)(2616005)(6512007)(6506007)(53546011)(26005)(41300700001)(83380400001)(38100700002)(8676002)(8936002)(316002)(66556008)(66946007)(66476007)(4326008)(36756003)(86362001)(31696002)(54906003)(186003)(478600001)(6666004)(6486002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXBvNzZCcFRYR0hyYVRHV3Q5SEZHWGxvTEtEaVF2MFVzamdCVmd6OS9pV01K?=
 =?utf-8?B?MFRBOWZWa3FBdldGNXhZSjJ3czE3bWlSM282VWQ5TFFlRWRTQ2E0WklqcmVo?=
 =?utf-8?B?VFVrWGVTL3UrcUEyRXMvZWpWUzFqa3J6VHU2bVdVdWVOa2NRVnZLQTlmSmVo?=
 =?utf-8?B?VW1zUDlqaUs0TXJaajh2aG5WSW0xMnhMR1BRMWNIZXF6enhJL0RadmZNL2lV?=
 =?utf-8?B?cGVJa3JKZkEzLy9ZTDN2SU5yVENXN2xENEdiMDRCU3hUMms2TjdqcWcvN3dT?=
 =?utf-8?B?NCszdm9BeWNlZnlwSXpHRW9MWXordDV1dllTc3FKQ0p4WnhFbHRMRUdabTZu?=
 =?utf-8?B?ZWRkK1Z2OGxQQ0JaOWdPUXk2SFBYeFg1T0ZSSTNlT1JiZzE1UzZzTWNzR1kv?=
 =?utf-8?B?N0xqWlRqQnEzQlJaT3hJY1FiNlNPU016bTM4ajdCSDBUOWY4MXlBN2tPQ25j?=
 =?utf-8?B?Tmc2VXVPRlZqTDJ5RnVzci8wUnZpRkdSZVZHazYrM2VDak82MUhaQzFONkxC?=
 =?utf-8?B?NnE3a2dhb2JjOTkzRmd4L25WTlNiZFZSNkowOWZCeGxEZGkyOGVYeU9BVHNG?=
 =?utf-8?B?RklTTGgycGtoUWNla3F1RkpRMjl1UDNlU1ByZE1yQ3ZBRGM1cTF5Yjc4djZ1?=
 =?utf-8?B?S1l6MVFwdEp1aFRvVlM1WkJ2RUlIWEpHTVl2dzVCL0EwV3YvazlENmpkR1VL?=
 =?utf-8?B?M2ViTkJma0pNdkZ2Nm1nOGo5M2FhYTU5RS9qWERiU3pINEtaLzB6Y0FweUdU?=
 =?utf-8?B?YmxUK3JBZ2QzczhRRVo4QVhaRjdGR0VPUk95V1FId1VGeENiTkJiK2tIN2M0?=
 =?utf-8?B?RnBmUnFWeXVCL2V3R3pkTGYzb3NwWFZmTjRJM0c1SXArd0M5akdQcDA1d2FS?=
 =?utf-8?B?OG9ObE1lMHNhU2locmdMUHFHcG5KRExaVVkyeTFpbVdyY0xiWFZJVWJUYjg5?=
 =?utf-8?B?cjd4Q25lYnRacXdTZ1J0WDlXMHlkcUxkbCt0Njg1V1IxLzEzVWs0SU9LSEtx?=
 =?utf-8?B?YU82OUlEUGFrQVM4RGVCV3FlZ1lOMzlUMS9NelpMRUZIdXZmWlJ5QUkyMlZh?=
 =?utf-8?B?M1JwMHBtWCtRajlEd1pIQXNrVWtlcTVSMmhQb01ZcFJLWHJSWEFyQzAxS2xD?=
 =?utf-8?B?OEZwRXFVRXNNWWczbWZwcGxPNit3R1o1dG9NQmw5djRGaGtDb1hrdGV6TGE2?=
 =?utf-8?B?THZXQ2hKQXZ0TjgzRnk1TkRxdjlSSmg0K1Vpa3pVREx1ZytvZ0NNTi9HcjlD?=
 =?utf-8?B?UmJpaFBmOUVPZWFsbHRwYW8yeGlEZHJxSXZoU3ltaUxyTlRsblVxRm9jMmZP?=
 =?utf-8?B?Mk5ycjNaK2U5M2ZpK2ZWdVBQWll0M09HS1Q3aDFRakh0aXVNYnJ4Nm83UXEw?=
 =?utf-8?B?eHVLQkZQYnJXMjJHVUdZcGNaeC9jRzFtZVZOT1Zzby85djM0eDdRNDJJQzh5?=
 =?utf-8?B?cHZzSTdvQ04reU1YY2dWRXdobjRnWGY1WWZneGF2bkFRU0dldFI0YVErTy9F?=
 =?utf-8?B?UVRZeGd6czlHam5xdjBvTkE1RitrTzlzcGhleVJPaUR0UjVVYzhpY0x4UVZC?=
 =?utf-8?B?ZCtXSGNpRGRmVWxMeEhHMXYvaDZyaDAxWVZuS2d6bXJXMHU5bGdicStFZ28z?=
 =?utf-8?B?Mkh2OTNyb3VweTlYZVB5QThyM05kTnhReHIzVjhyV3FsSHpvc0VkWWI1QlVi?=
 =?utf-8?B?Y0ZSVDAvTTNYSjdibG9yZXpnQitKamttaGJoZnhsb3RIVEdITld4Mjc5SjI5?=
 =?utf-8?B?OS8wZjRBSWowckpnai93eVhVMTUrb1BtRytSRmJZM3g1Ynd1S1E1aVM1WEZJ?=
 =?utf-8?B?Zy82M1h1TjBLdVA4WFhBK0dkOExnLzZqQnR1Um1kajlKNjNGczRRSVZTUUQ3?=
 =?utf-8?B?K1BGUk0yNTZjMzg4aHdicWYvK0Fid3ZIRld3K0JnT2tYeGtzVHF1Und3UE0y?=
 =?utf-8?B?K1JqZE5Bajcxd0xUV1Q3MFRUS25YZEFqZHBoK0VEZnVzSGNzREx5OEJjUEFu?=
 =?utf-8?B?QmsrMW13M0Y3YTlsR0pDUnlrMlM2bzdZd1FnZkdlMVJoNEU3OXQ4dmU2Wmx2?=
 =?utf-8?B?OG5xbHJrc0l1WkJpakpsY0pXSXhIei9mYUVPcWdRNjFwRmpodlpCVExoR2pq?=
 =?utf-8?Q?2DJkFr7GARF2a5H9wZI45YX9d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99aebccb-6191-4677-00f4-08db4c743b87
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:50:30.3616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xwm4pV/z8hQ2Tit/87I8FkCn20OZ0OCNW4SbAg+34leMZuw12P9b0rcnu4QOYac0enm9RLI8vqIcPxfaNP11Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

On 04.05.2023 09:44, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:33:05PM +0200, Jan Beulich wrote:
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -438,12 +438,14 @@ struct domain
>>  
>>      struct grant_table *grant_table;
>>  
>> +#ifdef CONFIG_HAS_PIRQ
>>      /*
>>       * Interrupt to event-channel mappings and other per-guest-pirq data.
>>       * Protected by the domain's event-channel spinlock.
>>       */
>>      struct radix_tree_root pirq_tree;
>>      unsigned int     nr_pirqs;
>> +#endif
> 
> Won't it be cleaner to just move this into arch_domain and avoid a
> bunch of the ifdefary? As the initialization of the fields would be
> moved to arch_domain_create() also.

That's hard to decide without knowing what e.g. RISC-V is going to
want. Taking (past) IA-64 into consideration - that would likely
have wanted to select this new HAS_PIRQ, and hence keeping these
pieces where they are imo makes sense. I did actually consider that
alternative, albeit just briefly. If that ...

> Maybe we would want to introduce some kind of arch-specific event
> channel handler so that the bind PIRQ hypercall could be handled
> there?

... and hence this was the route to take, I suppose I would simply
drop this patch and revert the 2nd one to what it was before (merely
addressing the review comment on Arm's arch_hwdom_irqs()). That's
simply more intrusive a change than I'm willing to make right here.

Jan

