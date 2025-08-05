Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386BB1B11C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:33:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070202.1433849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujE30-00076R-EF; Tue, 05 Aug 2025 09:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070202.1433849; Tue, 05 Aug 2025 09:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujE30-00073j-B7; Tue, 05 Aug 2025 09:33:30 +0000
Received: by outflank-mailman (input) for mailman id 1070202;
 Tue, 05 Aug 2025 09:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xH0J=2R=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ujE2z-00073d-1I
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:33:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:2418::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d0f8f8e-71df-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:33:27 +0200 (CEST)
Received: from MW3PR05CA0018.namprd05.prod.outlook.com (2603:10b6:303:2b::23)
 by PH8PR12MB8607.namprd12.prod.outlook.com (2603:10b6:510:1cf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Tue, 5 Aug
 2025 09:33:23 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::e9) by MW3PR05CA0018.outlook.office365.com
 (2603:10b6:303:2b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.12 via Frontend Transport; Tue,
 5 Aug 2025 09:33:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 04:33:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 04:33:22 -0500
Received: from [172.17.155.73] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 04:33:20 -0500
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
X-Inumbo-ID: 3d0f8f8e-71df-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gttRFNHNlv1mMANa96YWew2RPUrKOJ7iPhulFy7ii1LXerhvqmc86bIZCwfN4CNOgasBtR3pJ0Z1tBaxZ6no1Co/5bKQHkeLZ2toogCSLjY7IOXcfMAGfPhI0FlgBSeaoJ7tkz1tQiy4J5gGH8PZh+RnzShafcUTrPENlD7vvsPbmNAd/48v75qtle0ey+H50/lEWF917qg1kLxwoV0YkmWVcOQuqbACmEmpAOe1Y87Urd7ZOS6jdh7qZtEY3fRDK59fEBhgsT3QSV+y7imXH8oYdqSyRrh2A7D8hBDUXyAkS5FmQtD9vpODTWUdMhacgRhRkG+fGCYyidVn7Tmazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT/4jGGRjeikvtWrxMaVrECdpK9ZcZ5gGPvi3qVuHDg=;
 b=anyOmx47A7AQSTDZt1japCKh5GilMlbDTmZRXe0H4JW1p5VPLMf34lHUg9Dxyfx1YQgh1RfgOW/3VPnHyZ/dg7jGT1XEdttYwVLK5W281/63yoMEMMWzcRo+H6k7IWUiSEko5sbtIo/3IEJT7wocTVTN3u+ZWs4C5Dq81HEMc6nx+fuqkJu7FE0SGDrhKOLz6r4MlCtCXDoKQc5WrnoHe0aouEJEbCQtinhJSmPwoceTk6+gqhofDkAPv/kN6bAyGQOZpz9C/Y+GW0oZMi6aejUoP7EpIfsIHsp8R7oM85sQBITOjWHopplTbKjEGNPTL8I2o8/uFD75mti86KraLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dT/4jGGRjeikvtWrxMaVrECdpK9ZcZ5gGPvi3qVuHDg=;
 b=EZ8rxok3u3H2G3N9GWdwu4d59kzJr8wOprJrp7XJaYLCrLhv832JwOtQ6AUAYCnarKBuLUQwvNvVXk+HABfQnYJOoBg+y1oRebEwVB92zFpzZstpFHLOJCHOGFINtlNiX2Ve/njEilo5YS3tMOAFVuNj0bS1oFUanrPDrtyuTmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a3e9afa2-d60e-4779-8eee-54268d7d833f@amd.com>
Date: Tue, 5 Aug 2025 05:33:20 -0400
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
 <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
 <cefc96a0-b095-4bc8-baa6-4d929ffaa1a6@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <cefc96a0-b095-4bc8-baa6-4d929ffaa1a6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH8PR12MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f23baf-63ee-42d7-de04-08ddd4031f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2Z2K04yWmo2a3hkOU5xTlVnY3ZpNWhHQnBBdWFOb05hdjVUb1J1cjdJaWtv?=
 =?utf-8?B?cmlhQlV6VHVMZ3NHcGNEay9kZ1RhVEcyU3lWTDdwNmQrTlRaVTdNTURjNjBL?=
 =?utf-8?B?VTNzV2Nod3QrSmN1NjNCU2JkOXNMaXlTMVlQNUtlNDcydnJPSVhuUDcxaUZ5?=
 =?utf-8?B?ZmFzQ3JyMFRGenhFdDVXYXJPSkhqOFJIejZPWFVYTUl3TDFsSHRFZ0hTV2kr?=
 =?utf-8?B?L3k3M0lJVVg3b1pMOFFPT1IrQytUMGVGWno0K3NXdVhRZjh2d2RtQlp2R3RM?=
 =?utf-8?B?NHNWaVF4bnBydG5UMEVuWkIySm5VTkY5ZkhMUEpEby9BeFdDSkt4djg3SmNq?=
 =?utf-8?B?S0RGdERHQ1dYKzBCais1TmMvVFhmRWRRdXJmTDFBdGV4MzRCVjJOUGd5czRJ?=
 =?utf-8?B?SmZKWXlPT3MzYis2U3llWUZrOFJyWlQ4ZmRFemM3RDNtd0ZCa2R4LzRLakpH?=
 =?utf-8?B?OFlzb2l1aWptWnJYOHVrS2dUS2N2ZGQ2Z1pSN3V0aXhja0xxSlhMbU83bEJj?=
 =?utf-8?B?ZG9Oa3dPZVh6UnNTT0dvK3k5OTBTZ0djYUpHaUVPSUlhZCtkMG1uS2ZZemRZ?=
 =?utf-8?B?NDZiZ2ZmdDltL2p3R1RWSm1CSmI0SytiN1VMWjJBaEN2djQwNlZBc3oyTUZm?=
 =?utf-8?B?Y0g5Q2E1OE5CVmlwY1pRa2p6MlZmeFRiNHl2SFlNQisyTXpkdmdjZzBhbG1G?=
 =?utf-8?B?SjFrMUxqcCtjejRPWkVKRElYLzI2QkxOM3c0NGdUbjNtaXc0YlRjTXRwSnM0?=
 =?utf-8?B?ZHhNT2JndzVrNERrWEdNZGpNRSt5bmRGalVSZzdVaG9iTi9SNGJOSnVNMUVY?=
 =?utf-8?B?TnFpOFpncHVSeEpZUEo5Tk04WVlXZXVaK3Baem52WU10bHB1ZVQ4eTdQaFln?=
 =?utf-8?B?K2wyeFJIcmtzTmZscjBDOHdrNCtXcTloVDRVMkgvSEkvcFg1SWpKVXd3TUxZ?=
 =?utf-8?B?RlNvZFVVUy8zOUFSaFVDTi92NEVscnE1dEV1UUJ3bkdOeVlWV0kvSUIvdlZO?=
 =?utf-8?B?R3FZNVB2M1RTMmNxeFBWQnNzS2xKZEhZejBMYmlHUlVpR2xUVVRXelJVRlJl?=
 =?utf-8?B?WmppRVRvVG1lem5pMDZmZ085VFJValoyMjdPUXJCRlJQeGFCbmZsNk5ES24z?=
 =?utf-8?B?WE45dk84dnM1djMxUnVVNXNvM1pvajNVRlBKbngyYVNFNS9mRHFkVURyV0RX?=
 =?utf-8?B?WFpYYTNpMmRYUlNNTTlnTHBTaTk1NU5YSC9vNnVvZDFqR2xLSUJQc0dJVi9C?=
 =?utf-8?B?V09GWVVIY3gvZVFXODJwaUpjOVVZV3I5Vk8wcUhUUExud2Vqdy9aQ0R2VVZy?=
 =?utf-8?B?QnNPTXY1bFNqK3psM1VGR1Y4T0tpU0ozSUNQa2pqeFhxNE9WVzBlSkVjcms3?=
 =?utf-8?B?MVA3MjQzK0thclBNRlNOMnhhRVR0Z3pHZEhHa3dWbWV4bThTTzZXZTFhRStY?=
 =?utf-8?B?ZGJLUlJPbmtKRGIxQXpzc1JNN2FKRWxtbFJ4aU4vK0xtUlExbExCN09qb1lJ?=
 =?utf-8?B?NGdsR0tLYldMNVhlRmx1UERWNFFhVU45N1E1d2JjTkg0ME9vNWJSYi9pc1hi?=
 =?utf-8?B?L1RBNGxrOWtHOTN1M3ljZzhOb2NuTDFNaEFFVS9nSUYvbTRzSElncVhCYjZB?=
 =?utf-8?B?MjU1cG1BN3E4cmNTSkhzenJocjJYQkhOcFNIVGh2em1oMTRScjJIQ09WZUNL?=
 =?utf-8?B?UHpiemFiTDRXR1RuOElzeXpZS2x6bjlMVlZZbzdiT0VUa1VNaWl3Y1g3VDlh?=
 =?utf-8?B?WG1mZGVEdGY0bWlNRjRBMmhaRUdWNU5scmJFcDJqTGt0cW1SWko4K3VRQlky?=
 =?utf-8?B?NlNYdVRWam5CeGI2NDlNZHByL1ZjUDFQbVRrUFdJMXlONHVTcytuTTBvODA2?=
 =?utf-8?B?NlF0a3FIU2RLSS9RamRZQjl4VEhmUlAwaHg0YS8vU2V1VlV6SWNrQ2YwNnA2?=
 =?utf-8?B?RU14R0lja2RnRVo5UXVPT3MraEtUZEo5dDFzb0czdSttcXhpenFTTnQ5WEZH?=
 =?utf-8?B?QzBhUlNoL3lDazlrekZ3ZVppMTAxL0hqSGVQS3pRSlcyZXhiUmZVOUl1dU5W?=
 =?utf-8?Q?0BngBP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:22.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f23baf-63ee-42d7-de04-08ddd4031f28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8607

On 8/5/25 05:17, Jan Beulich wrote:
> On 05.08.2025 11:06, Stewart Hildebrand wrote:
>> On 8/5/25 03:44, Jan Beulich wrote:
>>> On 04.08.2025 18:57, Stewart Hildebrand wrote:
>>>> On 8/4/25 03:57, Jan Beulich wrote:
>>>>> On 01.08.2025 22:24, Stewart Hildebrand wrote:
>>>>>> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>>>>>>  {
>>>>>>      struct sched_unit *unit = v->sched_unit;
>>>>>>  
>>>>>> +    if ( !unit )
>>>>>> +        return;
>>>>>> +
>>>>>>      kill_timer(&v->periodic_timer);
>>>>>>      kill_timer(&v->singleshot_timer);
>>>>>>      kill_timer(&v->poll_timer);
>>>>>
>>>>> What if it's the 2nd error path in sched_init_vcpu() that is taken?
>>
>> ^^ This ^^ is what I'm confused about
> 
> If sched_init_vcpu() took the indicated path,

What path? In the one I'm looking at, sched_free_unit() gets called,
setting v->sched_unit = NULL, and in that case ...

> the if() you add here won't
> help, and ...

... the condition is true, and ...

>>>>> Then we
>>>>> might take this path (just out of context here)
>>>>>
>>>>>     if ( unit->vcpu_list == v )
>>>>>     {
>>>>>         rcu_read_lock(&sched_res_rculock);
>>>>>
>>>>>         sched_remove_unit(vcpu_scheduler(v), unit);
>>>>>         sched_free_udata(vcpu_scheduler(v), unit->priv);
>>>>>
>>>>> and at least Credit1's hook doesn't look to be safe against being passed NULL.
>>>>> (Not to speak of the risk of unit->priv being used elsewhere while cleaning
>>>>> up.)
>>>>
>>>>
>>>> Are you referring to this error path in sched_init_vcpu?
>>>
>>> No, given the context I thought it was clear that I was referring to
>>>
>>> static void cf_check
>>> csched_free_udata(const struct scheduler *ops, void *priv)
>>> {
>>>     struct csched_unit *svc = priv;
>>>
>>>     BUG_ON( !list_empty(&svc->runq_elem) );
> 
> ... we'd make it here (afaict).

... we'd not make it here.

