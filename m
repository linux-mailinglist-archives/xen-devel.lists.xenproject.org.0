Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E18C3040
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 10:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720245.1123329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5iCj-0004i7-0U; Sat, 11 May 2024 08:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720245.1123329; Sat, 11 May 2024 08:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5iCi-0004gB-U4; Sat, 11 May 2024 08:35:40 +0000
Received: by outflank-mailman (input) for mailman id 720245;
 Sat, 11 May 2024 08:35:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5iCh-0004g5-T5
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 08:35:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70d687c8-0f71-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 10:35:38 +0200 (CEST)
Received: from PH7PR13CA0001.namprd13.prod.outlook.com (2603:10b6:510:174::7)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Sat, 11 May
 2024 08:35:33 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::f2) by PH7PR13CA0001.outlook.office365.com
 (2603:10b6:510:174::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.20 via Frontend
 Transport; Sat, 11 May 2024 08:35:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 08:35:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 11 May
 2024 03:35:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 11 May
 2024 03:35:31 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 11 May 2024 03:35:28 -0500
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
X-Inumbo-ID: 70d687c8-0f71-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAAXROwKecQIuKBmSX7OxN5ruENGQa8qwQAlakNxbBw3IN1olielxQOfcAoB++3CxALl4W0NvHd+GG8yB63KvwVTEOxSZbHc+h0YcH/mJaOiPXVDPYu5/Nq7+5qAPw7USd8EluV1BnNFkHoo5j/iPlsHcTXlcAOEqASQbtHXSX1YMc2FRw9tT9JO4R9+Rb5erSH/a9qAgg30H6TFpl8hbxRW3nokHEd0NUVpLBWJ/UIq/NVp0YU12/izMVjCVLCaAfOqzaRhhFC/tD7kT8UVTz2BPBeO1tNp57DdMAAt2jUNhA+wmKo1uG1a2+fiKmJ4bpJlBSPyM0M9Eu3Wb10nXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDpgzmes3wIY3sYaKYUQcA9ltTQSQkPL7jlEx+Brflk=;
 b=BWNL/PVaWdgtsgCGFToLPtMqb8tiEbsj8GjLMgyggbEF0i3aCMqJcUXqyJMr3UjCdjAZPGMTqAWbcarow0GA6UqHsOetJUz+oM2fGRjewph84zChDuxRStzMNwPZRriOa/MsfdR1PflPWQglRhzbOsgvmBfQsxW6cTlNvFRR6ZPPExdzRuuG2nUvKAXqITW6kmdO/nQVtZkQLmwHHCADYzHxQRxhgayyEOyoRTbTmvOGBdjJ+gFiSeVr6RjDxar5I1uGc0eRfprmI1fvX8tc5nXJv1rGkKwJykx0SXm6eBFB8m2CBzfPRShEydAIf/hZGQn61py1iOx6O7n7FsnoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDpgzmes3wIY3sYaKYUQcA9ltTQSQkPL7jlEx+Brflk=;
 b=IyW2SPVDZ0OWCMMNBK56Xe2SWg+2wjIrexsxINbqVYnt9tVL5EA3h/qcHcUU0xO7iB86f+UNwOGmV07OA1+UjiynO2JPoHX5ivsvmRa7HlbBuedxgHMsgCLAJU092TrUH54AJSgC8Ng2ZaLxx8aAK7BDNmJ0VYJo2BkZ5Z7KJpw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e8106388-9916-4d1f-acee-f6cbdbf5f364@amd.com>
Date: Sat, 11 May 2024 16:35:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
 <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
 <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
 <ff5e2477-ed5a-40cd-a592-5ceb3bc8f1f1@amd.com>
 <1ad2c873-219c-4d96-82d6-e1bc58216f2d@xen.org>
 <1e9c6513-8e45-4202-a25e-bc342072d6cd@amd.com>
 <f2580cb8-c391-43c7-9696-200f9633dd4a@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <f2580cb8-c391-43c7-9696-200f9633dd4a@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fabbb50-767b-4427-7b85-08dc71955214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGVVTk1vbGx3Wnd5TmhYVmdZeng2NlNhMzBDYStrS0lWdEcyWXNvb0kxY3Ur?=
 =?utf-8?B?ZmNnbXptWHc5dDh6UHgwckFEMDBJQ3hKN2l6ZmM2ZEo1dGlUY1NpVWZaMDR1?=
 =?utf-8?B?STQ2VzlDU3NlRHNYSnpwclZ4QTNRZVFjTUVZeGtPbVVibzY3dGU0K0s4Wi94?=
 =?utf-8?B?cFg0OUtPWXBuNVBKQndqYmtHNE04NTRRMTdFV3FvOVdFZUR3cFVKRS9MN1NI?=
 =?utf-8?B?SzVCMjdzbXBHUmpCNW5jWUlxb2t5RzVpUnV5WlFCOXJFVFF1REV3NmozMVc0?=
 =?utf-8?B?VG43NlY5a2xXbkI2b3ZNMGhWZHdNTUEwbEp5a3FuR1lYNnFlUGdOcEtmdXZv?=
 =?utf-8?B?QkdnVXZ0ZWV2cnNRdFJTL1lYSi9HSnRLVHE5cTJmUkZHa3pINGREWEduMlRh?=
 =?utf-8?B?M0ZWN2hvbEloMU1wa2JlRGVVdGx6dzlMVURpSUwvY043WFBjc2Y0c3RHMlEy?=
 =?utf-8?B?T2dHSUVSU0NXYkUrMUd6dmR2TGdkRDBFcHJQcHhRUHErTTYzU0lzWGdPUWdN?=
 =?utf-8?B?THdyb0R6akc4QVJpKzVQeHhYTmpiejNZemcybngyeTZrU010QWhNSU81SXFo?=
 =?utf-8?B?c3NsUEswbjJLU1ZmZ0JRNXR3ZmVpOFc3Wm1PVVNGZE4wK0FGYzZTTnk0c0ZR?=
 =?utf-8?B?QjY0T2VkU2lvRnQ0WWNjU1ZOQWVWUGFPMVQ5V0N1czczeWtEWUJLcHQ2Njdj?=
 =?utf-8?B?ZnJyMUp5bUx1NDJmeE56VXJTbXV5eldyRWkwQ0lmZ2lleHlFaTliQ2tnQmFT?=
 =?utf-8?B?WlBxeGFDR084SXpTR3A4T250N29EWjFiNkFESVNZNmdTMTZvOWJFNUYwTGNE?=
 =?utf-8?B?dHpHQ3pPOUNtWWI2a2xNV3pxN3JJdVQ3YVVsZkZ6cEhIQ3REdzBaS0h1QmRr?=
 =?utf-8?B?MUVDZ29ldHZBaG04MVMvaGJEeEVSY0NPMTUycTcrdEFvZkNSekVFU2x4Q3dP?=
 =?utf-8?B?cWlzOXR5ZmpPbklNREZZc21jNWFlY0pjc200QWJuUzIzbXRlZm1lK2pwK09n?=
 =?utf-8?B?Vm8vZHR6N2pJK3BERGtIeUpWTDdOOTRnUjdPZ3lsZFFKdjlDQ00yd2FmVHZC?=
 =?utf-8?B?ZXlkNUEySys1SUQyREc0aE9lOExZMWx3Q3dhUGJERkx4ZklkTGRUbTRWN0Vl?=
 =?utf-8?B?VmxGZGN6eE1KTC9NQXZKSUc3M0ltZHBLNEtVR0w3SnpaWHpnS1JnczZCeUxx?=
 =?utf-8?B?cSttVHRmQnpRZ3N5ejY5emI5U1hOaVUxVnRzWDBDSmovN3F6MVhrRW1OdGZy?=
 =?utf-8?B?R3MzNTNQeTlBK3oyTStUWHRvRU9pLzd5UWtnQlZ1eHVZVFI2WEE0bGNnTklJ?=
 =?utf-8?B?cS9ZZ0llYU1VVEE1YnZ2R29UaDFVU1U2L3VJYlptbC9uVm5rcE1pdDVvSjJ6?=
 =?utf-8?B?WVlnVTVEYlhNWmN6bXd5cEdNS2sxMGxHaysrN3d4d0ltaFpKY2JCM1pvMzJN?=
 =?utf-8?B?YUZrNlN4QkZ4eXF2MHprRWxxbWM3RHdWcENYUWk3VnRVTS9iOFkzNFRqTXd6?=
 =?utf-8?B?Rkp0ODhiQ3hMVGdrL2g5UWVUaUluL1FoVGtpWCtUaWNSZUtMNkhPaWNXZ1Fk?=
 =?utf-8?B?Sm1zL2VPZWVCTHBjK3J1aFZGSEdacVVweEdBWFhNSzRJK3Y4aUFwa2NWUC9Y?=
 =?utf-8?B?Vmk4ZXpnelc0cjJwUkdzSVZLY1RMU2tXNXVtK25yWkd2OXZHbXUvTnNLKzRQ?=
 =?utf-8?B?bmdlR2g4WTdFSTdGc2ZzallzM0ZDbkhjMU1vdkZFU3NkcnhiT0F3VlpaaUxL?=
 =?utf-8?B?bGZEZXZ1eTVFTmVvR2xvT2laSWw4Ri8vbmhSQVpMVjdPRTFxWXdVMmMxRDdR?=
 =?utf-8?B?TUp0c2JUUkF4TVUya3dXc2Y5eE83UUc1YlhmQndXMkZydHJqU0ltTTRRUGFC?=
 =?utf-8?Q?GWpdJPSLrfvJa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 08:35:31.9813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fabbb50-767b-4427-7b85-08dc71955214
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523

Hi Julien,

On 5/11/2024 4:22 PM, Julien Grall wrote:
> Hi Henry,
>
> On 11/05/2024 08:29, Henry Wang wrote:
>>>> +        /*
>>>> +         * Handle the LR where the physical interrupt is 
>>>> de-assigned from the
>>>> +         * guest before it was EOIed
>>>> +         */
>>>> +        struct vcpu *v_target = vgic_get_target_vcpu(d->vcpu[0], 
>>>> virq);
>>>
>>> This will return a vCPU from the current affinity. This may not be 
>>> where the interrupt was injected. From a brief look, I can't tell 
>>> whether we have an easy way to know where the interrupt was injected 
>>> (other than the pending_irq is in the list lr_queue/inflight)
>>
>> I doubt if we need to handle more than this - I think if the 
>> pending_irq is not in the lr_queue/inflight list, it would not belong 
>> to the corner case we are talking about (?).
>
> I didn't suggest we would need to handle the case where the 
> pending_irq is not any of the queues. I was pointing out that I think 
> we don't directly store the vCPU ID where we injected the IRQ. 
> Instead, the pending_irq is just in list, so we will possibly need to 
> store the vCPU ID for convenience.

Sorry for misunderstanding. Yeah you are definitely correct. Also thank 
you so much for the suggestion! Before seeing this suggestion, I was 
struggling in finding the correct vCPU by "for_each_vcpus" and 
comparison... but now I realized your suggestion is way more clever :)

Kind regards,
Henry

