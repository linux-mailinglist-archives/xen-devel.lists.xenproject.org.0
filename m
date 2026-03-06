Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJu9N7UMq2nCZgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 18:19:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2A225E37
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 18:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248131.1546456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyYpW-00011u-Nu; Fri, 06 Mar 2026 17:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248131.1546456; Fri, 06 Mar 2026 17:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyYpW-0000zk-LK; Fri, 06 Mar 2026 17:19:14 +0000
Received: by outflank-mailman (input) for mailman id 1248131;
 Fri, 06 Mar 2026 17:19:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfUi=BG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vyYpU-0000zb-Me
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 17:19:12 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 966552e6-1980-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 18:19:10 +0100 (CET)
Received: from BL1PR13CA0005.namprd13.prod.outlook.com (2603:10b6:208:256::10)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Fri, 6 Mar
 2026 17:19:04 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::5) by BL1PR13CA0005.outlook.office365.com
 (2603:10b6:208:256::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 17:19:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:19:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 6 Mar
 2026 11:19:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Mar
 2026 11:19:03 -0600
Received: from [10.71.193.38] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 11:19:02 -0600
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
X-Inumbo-ID: 966552e6-1980-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbsIc6QzCoX00VPpNlTIdN8ucMguHHrM2ZWAiY2Ij14i5bhAO2DEnA26fQiV9grm8Je502ct57euS/o3/a57YXBKnvGx5zPem4C5wYLKyobIrgnf0v1HzNwEBd7aOGs/Zao0zn2bHmdpyxE2ppqRw0RQhSSxJ9AQcEr4KeNT0VQ37GtFnA2fDFo4+II81qzURNHRtiUxHYs8UgE49OacQSP+c4RmpLAn6B46lrLf7n3A/IOtNZgIdN6oPb3rb8QrqKpg/VNLr+TaF7gFQJKylNlRxQobSOrNNBpEFzsatfdMgXKOMDbGqiX30pkxUDlZgeZfmn4WLM5jKerpf7llAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qcontLYIVWajp9z5CaJED4NI+Xo+UmR+TqAT5Xge9o=;
 b=SID23bpqHKxM3oS7z3f9Q5UCR73+And9TGgR0S3PMM94xpprAgBAtYKcdP6mRpTX1LwL2zODb/G7UZcD8yPYFXS9p88aoJRCyN78h6g09lKVduCOtImS6tnnjevCuiHFyvqiCLFypkCwiU4YlnxMr2hJFHFuN1sPh15GHIPkUEfvAvjJCP1crRAJobffMtUPxT3An6xOiAdHZWI42Saa6AH0UMXidctl0/iKPLGi7uXuTPxQaSGtJMhuGKjyo72L58PT5ouuqKt4mV5kLXXc2ydJrXwvd3BBgNja4+ZhsyooHrY5MybI8zE9QylcP6aXf9UynbNVKN1PPsmW2R+KmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qcontLYIVWajp9z5CaJED4NI+Xo+UmR+TqAT5Xge9o=;
 b=j+/9tEA34DF49Q5ebAMudLllgxtXDvSbo3LSNzj36KQeNXwYbXBi5dWrH/wsLWqqO/5zYWCL93l3OSpb6icGP5iVhw5NphWE/D7zhaQyvr4EjrzspBa5ojjp4/qsT/WeaR1kloh2rwMHF2chEolxLiHm4vb7OJVBQMBhg7YroRs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e577e8ab-6c90-41ab-b42c-b018d911341d@amd.com>
Date: Fri, 6 Mar 2026 17:19:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260305194358.2564387-1-ayan.kumar.halder@amd.com>
 <f1a5a509-bc6d-4616-872c-c5bb1ecf9da7@xen.org>
 <f10e2a5e-446c-42f2-b9ce-44498acbfb1e@amd.com>
 <c075f47f-09f1-443b-949f-936534f75ded@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <c075f47f-09f1-443b-949f-936534f75ded@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a2c7ef-e761-4f29-3e88-08de7ba4773e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|30052699003|1800799024;
X-Microsoft-Antispam-Message-Info:
	1K3KUQYe5JRY4lH2veudExy+Fc/tBOOsd+gCd0bRU5kiP4q3PPZfl4INhpxtVRFBzPlXvybU/KYo65yyz2k4iw1V57r6Q0rss8cykdZqh0rMsJGMrDwJmHYz7m/Sc2u2tVcFBWJIRHlRwbPooodqpIkzEY+S5f1XORaAdIt0Ob5sEtI4nxYnuadefmGkzuu1er0kYo4YyTBhpEaxsYTfiqlRMdxojVZWCSPQHD3lwF1twi4C7B78QHGPO/0Ba45sz7nRDV8opsZHvxdNamv/iH3b88Uay5PQituAkcgUTD/P2dtiqMwXidLruHQq8k57gRNGeT8G4y1ET107b6Tz/S5GujQsrqoqRSrSvpCL07DneeHNYa9FRUeJAOAqBs0E9aQ6mndu9PRnuZYFE5DYdPj2d42bersEf47LbiCQc58Ol+jMltp6bpbCDbRwqPLV0LK0kd6kgKQtwlngFbigqgID+7QBoFoSxLgjWILWbbFF+KcBCDw1KrFbXHCP+Y5bPM4qDai0GbEv0nfAdzV1TpthWOzEoPOq7B3TlcpJWu+5C5iN4NbwhW9DMHMJ4/t0ZjUSIknZsq+RT73fAQDMqo5hPHGXPvN3m2s+6ki6hY4u9KHIUgM9et7/LTgb2dWjxNguWCFJOSgTPoHz6JXyNIIkbax/13Euq5KZigWCtdn2xdSwhY+kABvJIWu+llc6Wx/xDoaI4tCQ+MKEG4pVG1atGUUHE400ikUjZYDC28zMaBrVaem7CJNC3jVwc7sMFdIfVUuXGpVckrCvnRbnmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(30052699003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gXuL6kNjZnfVFp60Jc/154Um4PYptT6xIQkrXd54QkxP71hOSLJZuhXI6G+6oNvAWJdu5SbTVVXDMfzefr1eI8DHlt2+v7JE6hf0oCXnSi9AlHy2fc3+lzV8ROKnwXDufGPligAct5nOyykvaA4NgCL/UV/Rqnane1m3ui1tqgWfAESm/fTbBY2khYY9LMWOI307PN+KZy0ZpMSRiE+ceTKglvz6l3r6b/U5LUs1Z9rBaQ/Qo05HPP/udhbAIrQtiEHvtH3+CXxw4tgjvLZhoHrXVETmclOlkF9pywMSdSRL4H58YutRBbJZNqCnNTxcCMHVs2G7jVfvEjhOpq/VL+DoeDFZFSgi/OgD8mLgICXeKHUUauswwbEcelpfJfBQAGe8CIP0IzgefVLnUydxGfRj8pQIDP//YJSWyrIFQ+lnWptoiSu0Mmgax014CrGh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:19:03.8166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a2c7ef-e761-4f29-3e88-08de7ba4773e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-Rspamd-Queue-Id: 52A2A225E37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.978];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action


On 06/03/2026 10:40, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 06/03/2026 09:51, Halder, Ayan Kumar wrote:
>>
>> On 06/03/2026 09:24, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 05/03/2026 19:43, Ayan Kumar Halder wrote:
>>>> Set GICV3_NR_LRS as per the number of list registers in the supported
>>>> hardware. This ensures:
>>>>
>>>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>>>> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
>>>> This ensures that if the hardware does not support more than 4 LRs
>>>> (for example), the code accessing LR 4-15 is never reached. The
>>>> compiler can eliminate the unsupported cases as the switch case uses a
>>>> constant conditional.
>>>>
>>>> 2. Similarly In gicv3_ich_read_lr()/gicv3_ich_write_lr() , we can
>>>> justify that the unsupported LRs (4-15) will never be reached as Xen
>>>> will panic if the runtime value (lr) exceeds GICV3_NR_LRS. Some
>>>> compiler can eliminate the code accessing LR 4-15.
>>>> In this situation, using panic() is better than accessing a list
>>>> register which is not present in the hardware
>>>>
>>>> 3. Whenever GICV3_NR_LRS is defined, the default condition and the
>>>> related BUG() cannot be reached at all.
>>>
>>> I am not sure how this is better. You will still crash Xen is 'lr' 
>>> >= GICV3_NR_LRS. Can you provide some details?
>>>
>>> > > As part of functional safety effort, we are trying to enable system
>>>> integrator to configure Xen for a specific platform with a predefind
>>>> set of GICv3 list registers. So that we can minimize the chance of
>>>> runtime issues and reduce the codesize that will execute.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>   xen/arch/arm/Kconfig  |  9 +++++++++
>>>>   xen/arch/arm/gic-v3.c | 12 ++++++++++--
>>>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 2f2b501fda..6540013f97 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>>>     endmenu
>>>>   +config GICV3_NR_LRS
>>>> +    int "Number of GICv3 Link Registers supported" if EXPERT
>>>> +    depends on GICV3
>>>> +    range 0 16
>>>> +    default 0
>>>> +    help
>>>> +      Controls the number of Link registers to be accessed.
>>>> +      Keep it set to 0 to use a value obtained from a hardware 
>>>> register.
>>>> +
>>>>   menu "ARM errata workaround via the alternative framework"
>>>>       depends on HAS_ALTERNATIVE
>>>>   diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>> index bc07f97c16..fb2985fd52 100644
>>>> --- a/xen/arch/arm/gic-v3.c
>>>> +++ b/xen/arch/arm/gic-v3.c
>>>> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>>>>   #define GICD                   (gicv3.map_dbase)
>>>>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>>>>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
>>>> +#define lrs                    (CONFIG_GICV3_NR_LRS ?: \
>>>> +                                gicv3_info.nr_lrs)
>>>
>>> We should avoid lowercase define, in particular with generic names 
>>> like 'lrs'. I think in this case, I would rather update 
>>> gicv3_info.nr_lrs:
>>>
>>> gicv3_info.nr_lrs = min(gv3_info.nr_lrs, CONFIG_GICV3_NR_LRS);
>>
>> But we want to enforce the user to set CONFIG_GICV3_NR_LRS , so that 
>> we don't have to rely on gicv3_info.nr_lrs.
>> > The only reason to use gicv3_info.nr_lrs is for backward compatibility
>> i.e. when the user forgot to set the config and as a result it used 
>> the default value as 0. We don't want to allow this for the safety 
>> use cases.
>
> Xen upstream has to support various use cases. One of the use-case is 
> Linux distributions where they want one Xen binary booting on multiple 
> HW. So "gicv3_info.nr_lrs" will have to stay forever.
We can default to using gicv3_info.nr_lrs if the user does not set a 
value in GICV3_NR_LRS. This is what I am trying to do in the patch.
>
> Now with CONFIG_GICV3_NR_LRS in place, I am concerned that someone 
> will try to configure the value to let say 16 but their HW support only 4.

If the user has set it to an incorrect value, then imo Xen should trust 
the value that user has set. And then any malfunction caused will be the 
responsibility of the user.

IOW, we want to put the responsibility on the user to provide the 
correct values.

>  I can't find any check at boot, so any problem will still occur at 
> runtime.
>
>>
>>>
>>> This would solve another problem where you don't sanity check that 
>>> the system effectively support CONFIG_GICV3_NR_LRS.
>>>
>>>> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>>>>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>>>>   {
>>>>       /* Fall through for all the cases */
>>>> -    switch ( gicv3_info.nr_lrs )
>>>> +    switch ( lrs )
>>>>       {
>>>>       case 16:
>>>>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>>>> @@ -178,6 +180,9 @@ static inline void gicv3_restore_lrs(const 
>>>> struct vcpu *v)
>>>>     static uint64_t gicv3_ich_read_lr(int lr)
>>>>   {
>>>> +    if ( lr >= lrs )
>>>> +        panic("Unsupported number of LRs\n");
>>>
>>> Do we really have to panic in production build? Wouldn't it be 
>>> better to return '0' and maybe use ASSERT for a crash in debug 
>>> build? Same below.
>> You are right, we may not need this. One option I am thinking is ...
>>>
>>>> +
>>>>       switch ( lr )
>>
>> switch ( lr & (lrs - 1) )
>>
>> This ensures that we do not hit the unsupported cases.
>
> What about implementing it as RAZ-WI? 

You mean

  case 4: (lr >= lrs) ? 0 : READ_SYSREG_LR(4); /* read */

  case 4 : (lr >= lrs) ? :  WRITE_SYSREG_LR(val, 4); /* write */

> This would make any issue more reliable/obvious (if you have multiple 
> index accessing the same LR, then you could end up overwriting an 
> existing virtual interrupt).
- Ayan

