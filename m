Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B848B1B0AF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070179.1433829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDdE-0002O2-4G; Tue, 05 Aug 2025 09:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070179.1433829; Tue, 05 Aug 2025 09:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujDdD-0002M8-W5; Tue, 05 Aug 2025 09:06:51 +0000
Received: by outflank-mailman (input) for mailman id 1070179;
 Tue, 05 Aug 2025 09:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xH0J=2R=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ujDdB-0002M0-Vy
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:06:50 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2407::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80bc8f6a-71db-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 11:06:43 +0200 (CEST)
Received: from BN8PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:94::36)
 by SA5PPF5EA4322E1.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Tue, 5 Aug
 2025 09:06:37 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:94:cafe::4d) by BN8PR03CA0023.outlook.office365.com
 (2603:10b6:408:94::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:06:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:06:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 04:06:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 04:06:36 -0500
Received: from [172.17.155.73] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 04:06:35 -0500
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
X-Inumbo-ID: 80bc8f6a-71db-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf+kM+pHdcSlGEbmUNLR+NjP/jtUUlryw/aWMs55ZTcILKpqBdOdcf2SeDf92D2hO+iAzCE1Sr/i/xHSkfqaUrAuxdaYug2sBQc29upXSGoHviPgyX+PDaMjgekHQtuWYvVOibvezKIwgWO5WFNwZsyl2zb8sXI7CCpMQQv7gu13NgT4zfmcRvF3V710v9MRAPD/oVQ228K46H10F4wUqpW2J6t6UkmP4y8YUTgEb18rPg51FU8evtlVpwgTq5jXp+ojWWfZ+C84+q9aP/7qBwR/AhRVuJNo1Hthglk0/jXTNuPt9R1ui7SghBu0/qq5wQVzmm7dLikgijXBzCtGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbzFTXG6Tdv6VDFdu/L7lY5UwU2AqKK7iKjpcfjzHco=;
 b=MvAC7xdImvDp13CZ8dVyVq9P1N4bQBYy++TW+l7bJqKcgZu2MoN4MzqArfJXcAGPPtfaYbpcqcRIN8ogty/KoPFLcQyb7yjMyl12Xacdmh9U6cunerhuOBQVOWArGTJ2oB855Esq+MUt2eedeYHG9R4AD5z/daSUrHypdB1J1gdMp/9COWFVZFawiUDtpQVE5wdMxHmNLDi9vIQCmuqYhHhYQ4ei0znxIM96JCg9TjBH1Y+U6PzxsUipazWe/KeFiHTEBHUefmFrZ6KVt1/tJGmMLxQNz+IbJ/2aSKU0+leW/mtoDLUEGz/pYfa+uAM/GeajNzVVvnUQEPKA+zG0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbzFTXG6Tdv6VDFdu/L7lY5UwU2AqKK7iKjpcfjzHco=;
 b=aDtWgKAPn6OJWQQ/ipYYIJv/c6G49uwOG+/ibVcaASaM8QwpQ1+x/g04j1R6jnhnMcEedvW1rH+QvhfKAK0wDGM65XJ41Bgp7H8lA97SHCL1u105SfmuEt0VihsSFp/z4zASzOIzDEqeA0l1sJbyN6jf19xxStK2sprx3cLzwDA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
Date: Tue, 5 Aug 2025 05:06:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, "George
 Dunlap" <gwd@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
 <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
 <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|SA5PPF5EA4322E1:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ef121d-69c8-48a8-bbc9-08ddd3ff6221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTVsZUdMblVIeDZpVCtsaFhOVzZ0Q1ZhaFZxUlloRkoreVVUUlJnaDhZdHQ4?=
 =?utf-8?B?Ujh2ektmYTVFQldoMllIM0oyVm5INnR5OGtXSG05MHZYTFhNUGtjVlpxTmM2?=
 =?utf-8?B?QlVHQXlucTM2RmFjSk9kYVdoU3pMcld3cHQrcHNhZ1BrVW5aTzd3Y0RqWlMx?=
 =?utf-8?B?MHJ3TGNOaEFCcHY5dGIvVUxxbEQya3BsbDNlVzlweGgxQmFpV0xxZ0tOblQv?=
 =?utf-8?B?ek50UWFLN3AzK0FaUElnZnFEMU5TOS9iNVByejU1dG5VK3ZwejlaYTJ0c0VT?=
 =?utf-8?B?ekZrRVZoVmM0aVhNaXdKNjFXd0lxYXdCdHVnOURZYjBORjdvOTArVk9rOHBY?=
 =?utf-8?B?NythUWkzeEovQm1JdEIvUnNmRXg1SDVtbDNXQ3VOUllpVkJrVEh0Vk5mMCto?=
 =?utf-8?B?azhhbUY3RERwbkJTOS9ESXUzYVVQOGc4SExzNktod2puWk9EaGhjYVhzT0Jh?=
 =?utf-8?B?eDF1bGs4UGlkdk9ZVkFXMXFVa2NYQW9zTlpVbXBqcVdSMVhKM1Q0S201MFEw?=
 =?utf-8?B?enZlcGtLZUZ1U1cwREJKVElaSkJ2Ym56MzZIMCtxL1ZrRjRkUDg3bldVZDdU?=
 =?utf-8?B?bFdDME84bTNIMkpqU3kzTEMzWGVzenEyZkVBSzJGL2NjVWc5b0ROcWxzNHQw?=
 =?utf-8?B?ZncrZmpSNTFBUm81U1JCSGFNVEJBOWRKQXFvVlFjM2NNdVBWdTVjV2dCVm9o?=
 =?utf-8?B?MGY2dnhtbnR2QkdnTU9kU2RCdXlCaEFUY3pvb3pEU2ZjcE4rc3JsR2lmdFI2?=
 =?utf-8?B?RnlscUZJWisvV0FCcGpCZmtIZmlic0FRditwdVNBYmd1a2ZETW1FMm1URVVX?=
 =?utf-8?B?V0t4RnYxMFp0MWdLeFpMSGx5Y0pNK3lxUGNULzlqTG5MWHJHTWhVZStGSTVs?=
 =?utf-8?B?WkdFTzFiS0RXZEJqeUJqUVhPYTR1WWFMYVNsRDVRNkRBTDNjRklYcHBDcUNr?=
 =?utf-8?B?Y012WHVla1ZFN1BWanNZRDV3MVVsQ3ROM3lteTFwUDBxSXZHdnFyRElzcTV1?=
 =?utf-8?B?NlU0S3FJcWVRbG5mU3g4SGhKMmNxVlhsZWJZdmJIQWZZVVEzNnAvbnA5Z3ZG?=
 =?utf-8?B?TUtjNVNRbEJldFI0N1M3dXgyRzhRcTlZeHAveWVWUzVkRmlrYkYyaEQrdGtT?=
 =?utf-8?B?S2d1NVNMQ292NTRzMEtaRUJBZmlBQURrSVRzamp1THpVZ2VncWNWMHBlbkFM?=
 =?utf-8?B?QVVpa1I1RkdNaGUzV3RzaGdWeldIZ2R0cUlZZFp3NDdBK1N5bVkwbFpsKyti?=
 =?utf-8?B?REh2ZkVDeTZqaDRYSERFeXdvUHlKdlFnU21XamNTemVWK09HYnNJUnI1RTJ3?=
 =?utf-8?B?bXNQNU92UjJoM2t2U3pKRnJseEJYUDc2YzVKSkc2YkJRVUlCVXdXTmNRSlE5?=
 =?utf-8?B?ZlFWL1g0Y0kwQ1loZnUwTHNZelVZcmtBRUdHMGMvK0dpTE02TC9SR2NEYUpG?=
 =?utf-8?B?QnY0VEpWbGdlRHI0K05RWkhwR256ZkR3amZqQzRySzFUY0tEaUIvK09nWnVw?=
 =?utf-8?B?VkdkV3NwYzJjdENpUktTYXQ3cjNOM3BtY1RWeFdyRVgxVHpiNGthVFJuWWpn?=
 =?utf-8?B?cC93a0w3R0hNSnE0QXlOcG11MnBzdlMzZElSa2RkcmZxb0N0Y0lEUXlKS28x?=
 =?utf-8?B?MFlGWDVJNjh6VDdBS0lsbnFpbmRGUHRtZG5iWWRXZnFMVlYxcXUvdFp3NnhO?=
 =?utf-8?B?OVk3cmYreVdBamhrTGdwUVdhM3VEUDZva2VCd2dyTCtvOURNUUZMNW9ER2Va?=
 =?utf-8?B?Q0hNWHFtekgyMWlvanZvRERiRm0xZmdvSW1Rc0hOLzlZdFVBalVZbmJ1cWEz?=
 =?utf-8?B?eFF5M1piQ1AxckZoOEZxeHUra3ZCek02bnRiWjZhdXdMWE4xbFVDSnVkbmNR?=
 =?utf-8?B?d29SVytwc1JRWnNzOVhLdFNhRm9YYW55dzY5RStlL3FSWjVFUFFUYlBadWJh?=
 =?utf-8?B?RDdJODJ3eGttSy8yNTVxSTlLS09rbkdJVHdlMWhKUndjcFU3ZmlJSWUzVnRL?=
 =?utf-8?B?V3QxU3VxanBHWkJlcGtIOUZoMEVSYVhlVVJtUmVNazRxQ0U2QzlQYTlESTZ2?=
 =?utf-8?Q?aph1An?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:06:37.2431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ef121d-69c8-48a8-bbc9-08ddd3ff6221
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5EA4322E1

On 8/5/25 03:44, Jan Beulich wrote:
> On 04.08.2025 18:57, Stewart Hildebrand wrote:
>> On 8/4/25 03:57, Jan Beulich wrote:
>>> On 01.08.2025 22:24, Stewart Hildebrand wrote:
>>>> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>>>>  {
>>>>      struct sched_unit *unit = v->sched_unit;
>>>>  
>>>> +    if ( !unit )
>>>> +        return;
>>>> +
>>>>      kill_timer(&v->periodic_timer);
>>>>      kill_timer(&v->singleshot_timer);
>>>>      kill_timer(&v->poll_timer);
>>>
>>> What if it's the 2nd error path in sched_init_vcpu() that is taken?

^^ This ^^ is what I'm confused about

>>> Then we
>>> might take this path (just out of context here)
>>>
>>>     if ( unit->vcpu_list == v )
>>>     {
>>>         rcu_read_lock(&sched_res_rculock);
>>>
>>>         sched_remove_unit(vcpu_scheduler(v), unit);
>>>         sched_free_udata(vcpu_scheduler(v), unit->priv);
>>>
>>> and at least Credit1's hook doesn't look to be safe against being passed NULL.
>>> (Not to speak of the risk of unit->priv being used elsewhere while cleaning
>>> up.)
>>
>>
>> Are you referring to this error path in sched_init_vcpu?
> 
> No, given the context I thought it was clear that I was referring to
> 
> static void cf_check
> csched_free_udata(const struct scheduler *ops, void *priv)
> {
>     struct csched_unit *svc = priv;
> 
>     BUG_ON( !list_empty(&svc->runq_elem) );
> 
> (i.e. particularly this BUG_ON()).

The comment about credit1 was clear

