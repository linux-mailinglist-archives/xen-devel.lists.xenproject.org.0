Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CDxJytouGlEdgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 21:29:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68342A0384
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 21:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255771.1550601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2EYf-0005oq-Ja; Mon, 16 Mar 2026 20:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255771.1550601; Mon, 16 Mar 2026 20:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2EYf-0005md-Fx; Mon, 16 Mar 2026 20:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1255771;
 Mon, 16 Mar 2026 20:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q2TG=BQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1w2EYd-0005mE-NL
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 20:28:59 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9c4d40-2176-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 21:28:52 +0100 (CET)
Received: from DS7PR03CA0269.namprd03.prod.outlook.com (2603:10b6:5:3b3::34)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.10; Mon, 16 Mar
 2026 20:28:44 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::77) by DS7PR03CA0269.outlook.office365.com
 (2603:10b6:5:3b3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 20:28:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 20:28:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 15:28:43 -0500
Received: from [10.71.193.38] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Mar 2026 15:28:42 -0500
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
X-Inumbo-ID: be9c4d40-2176-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFp1Ysxc5RIJnkUL9PtIEXpViYR1Qenr9RGF3ecZC9SYpGfH4Zy61/60/tff5HgVcqYQ2cjeRELu4vGbZm0B3/CFopZo50uPS/37AXTrEsmwQ6J4WOwLyISG8hINRlVP64ohOupjGeiIXFQJCfDO8yWVf9fRww/aH7tRpVPp78iXRLt6fq0dUuG586o0DMvQuiVtSK1wJKZ0IDzOWZQYxhX9C/F4dXloBIeT6cuz2cpXu51e33qihiZi9S3YYNziTbPo3qnBfdj/hiozADWTs7sHktoyrT78YBnknMPp5+7PpDGM/3Td6aJ1MO8/WzvasQO1xXIPSSc6Kx6jNanUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m44h3OqLUiCX1s8EY92rgHXZNQz8VnSD4clCQ3A2cWI=;
 b=P8YTl0CY5f3Oal6dNAkbNjCXQtuTi4f8DNecGVZqwuti+QQ5x8TCIrupLSdmrV2xVAMF8DGGx3UwjUGFIncgFaEoHvPyL1zqG+dIvr3dm71JE8AqfN9kstT6Nqx5pF9w7yIGVuoyeGpUNwE6ZdJAB2i3PW8+Qtlni5lD7amDwxdv14tNWdieFAyJVTETKDv4cF/cD2P7DD6bGU2KfC0tg+Dz9tmXf4YtGrsU3PGfDodQ2dvO2oJOljJcHzZvdrJxvum/vmuMXTfnu8L9guw6TgSEjQWjuE+V32d1OGWqO5Tcpwopx+kL8P6dYfRSFLQ5vGbrvRQeaf53iDQoDacXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m44h3OqLUiCX1s8EY92rgHXZNQz8VnSD4clCQ3A2cWI=;
 b=rKUsNMNNg8d8Qthtbr0vhjFH/rMC2URbScsw2H5GQ5c3E719+6ewSCVuTyguHi/N28OFB1aVgtqAAWHF7PvTClVzGqSbWQS8ctmMwf+KIn+rnXNLjvAmsLMMt7UvqQ1TUGWfsNeCHJgeQQ19u0Afb29LJ7/hqzAcRCVoMa0OgC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f8f95b11-95ba-4a57-8425-21bb7fc241f5@amd.com>
Date: Mon, 16 Mar 2026 20:28:42 +0000
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
 <e577e8ab-6c90-41ab-b42c-b018d911341d@amd.com>
 <343c868a-61ef-4c9d-b6ab-96c35aa66de6@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <343c868a-61ef-4c9d-b6ab-96c35aa66de6@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a9e6f7-17db-4e60-aaef-08de839a9e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|30052699003|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+SFnZRVneUfTsGeMPq7b85IrBWgxUNFFu1h0y3MmKByaD9qLi46P7hVvg3ezG5RZ3VQq7Ns1lMvM6RD+MreWEdh03oGOpOFsbcxHrvxfoc/tqgTp5CgUhxwAlOSOjSPywVqlceKHStlgpDAfHVVZMi6vKBnQj3yTggDLttOiDsZs8/QDex8SUH1eCqU9YA3ToESYofrXpqBWGSGmgwzOgAaxSKMAO630SAs8NmxFwqOhfof/9JO5j09E0C1tlWLuPgFXcLENVtFImBDXSDnaS3wNHS+doqs8ixPg9iqC8RkZSQUge3Xxhqp99x8wWW4RtQakm7pDUsnWQfuiaW7Wj6dvoT6vgavJrUmzU1+kK/HKNfqt6zf6CxO9Z5jGMXZd+uopwEiQSIh4XBm7BL87xEkWsoP/OLKCVUXerVKE8V4iMmSQW117Wa1qNrJTqYLVc71v8O5QwTSAZGiYf5D4JL2Jo0yledJP9PWWANCy0x5jb4Oimslqm+M7oJ26QKDrh7rt2rAVuQ2D1/sT+qZLDBezVG8+pjFxDSqjwwj8UYle7/jhaJ/siJ//uvqoy9CzKztu5JKiuWO/PeqdUf1U5rB9h2Zzcgy7NvX/TkjEM4aV+755FqyEJrPzM1SBuTbRfadgPPEnaP+hVqtZ15AlzXzrVRq8bxYlDAHaQoqiISy5l5pvsICMYrfmQ3qbyZ285kaOANTHOJxOGmiuYa6QzXU49DT4nsjLf3+yeMsBynzWpBHQBj5BOcZqyw/pxegHk8nv4xvre/Yaacr/uy0jzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(30052699003)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QaQZguKkXfpYbVr07UOYn6+X44TCfQPjElq2zeKQMZki7d4XMMyLfa5GecjvDidPyTF7hvXSZnieoIDFsOXB7riDfAhMscMYwKIH7bTEKJU4CLaoBlhCAKikhfRKPnC67K3dgfOAdNwAV7eREOfNdwGRxYucUqzudcp8kkW6wGbXJLbEbW4+x2aZumYczIugHrfn0XJDymg1DsVeqEJxnZTMjfrYVsVCiOyZXbDP8sImibOZiPgAYy9iXOFiW5tRxirHe9EguO76vuEeoyXFgbtrYpPdwJuIndCe+r4D+U1xRYFhO5TAuXw4rGO9ZM534SO2SoetSUEFjfihJpq8FvXnJOjgVwulBDPclHLY9ZHWcpuZfckRBQOhvuI9Pv0m+SYVjl4xK+CFJCS+XrJKmOO4Gq5kal4FI0oqd0rcNdXxChM1fubdAc2eTudlfaTC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 20:28:44.0629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a9e6f7-17db-4e60-aaef-08de839a9e8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: E68342A0384
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 06/03/2026 17:53, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 06/03/2026 17:19, Halder, Ayan Kumar wrote:
>>
>> On 06/03/2026 10:40, Julien Grall wrote:
>>> Hi Ayan,
>> Hi Julien,
>>>
>>> On 06/03/2026 09:51, Halder, Ayan Kumar wrote:
>>>>
>>>> On 06/03/2026 09:24, Julien Grall wrote:
>>>>> Hi Ayan,
>>>> Hi Julien,
>>>>>
>>>>> On 05/03/2026 19:43, Ayan Kumar Halder wrote:
>>>>>> Set GICV3_NR_LRS as per the number of list registers in the 
>>>>>> supported
>>>>>> hardware. This ensures:
>>>>>>
>>>>>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>>>>>> registers from GICV3_NR_LRS (if defined) instead of 
>>>>>> gicv3_info.nr_lrs.
>>>>>> This ensures that if the hardware does not support more than 4 LRs
>>>>>> (for example), the code accessing LR 4-15 is never reached. The
>>>>>> compiler can eliminate the unsupported cases as the switch case 
>>>>>> uses a
>>>>>> constant conditional.
>>>>>>
>>>>>> 2. Similarly In gicv3_ich_read_lr()/gicv3_ich_write_lr() , we can
>>>>>> justify that the unsupported LRs (4-15) will never be reached as Xen
>>>>>> will panic if the runtime value (lr) exceeds GICV3_NR_LRS. Some
>>>>>> compiler can eliminate the code accessing LR 4-15.
>>>>>> In this situation, using panic() is better than accessing a list
>>>>>> register which is not present in the hardware
>>>>>>
>>>>>> 3. Whenever GICV3_NR_LRS is defined, the default condition and the
>>>>>> related BUG() cannot be reached at all.
>>>>>
>>>>> I am not sure how this is better. You will still crash Xen is 'lr' 
>>>>> >= GICV3_NR_LRS. Can you provide some details?
>>>>>
>>>>> > > As part of functional safety effort, we are trying to enable 
>>>>> system
>>>>>> integrator to configure Xen for a specific platform with a predefind
>>>>>> set of GICv3 list registers. So that we can minimize the chance of
>>>>>> runtime issues and reduce the codesize that will execute.
>>>>>>
>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>>   xen/arch/arm/Kconfig  |  9 +++++++++
>>>>>>   xen/arch/arm/gic-v3.c | 12 ++++++++++--
>>>>>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>> index 2f2b501fda..6540013f97 100644
>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>>>>>     endmenu
>>>>>>   +config GICV3_NR_LRS
>>>>>> +    int "Number of GICv3 Link Registers supported" if EXPERT
>>>>>> +    depends on GICV3
>>>>>> +    range 0 16
>>>>>> +    default 0
>>>>>> +    help
>>>>>> +      Controls the number of Link registers to be accessed.
>>>>>> +      Keep it set to 0 to use a value obtained from a hardware 
>>>>>> register.
>>>>>> +
>>>>>>   menu "ARM errata workaround via the alternative framework"
>>>>>>       depends on HAS_ALTERNATIVE
>>>>>>   diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>>>>> index bc07f97c16..fb2985fd52 100644
>>>>>> --- a/xen/arch/arm/gic-v3.c
>>>>>> +++ b/xen/arch/arm/gic-v3.c
>>>>>> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>>>>>>   #define GICD                   (gicv3.map_dbase)
>>>>>>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>>>>>>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
>>>>>> +#define lrs                    (CONFIG_GICV3_NR_LRS ?: \
>>>>>> +                                gicv3_info.nr_lrs)
>>>>>
>>>>> We should avoid lowercase define, in particular with generic names 
>>>>> like 'lrs'. I think in this case, I would rather update 
>>>>> gicv3_info.nr_lrs:
>>>>>
>>>>> gicv3_info.nr_lrs = min(gv3_info.nr_lrs, CONFIG_GICV3_NR_LRS);
>>>>
>>>> But we want to enforce the user to set CONFIG_GICV3_NR_LRS , so 
>>>> that we don't have to rely on gicv3_info.nr_lrs.
>>>> > The only reason to use gicv3_info.nr_lrs is for backward 
>>>> compatibility
>>>> i.e. when the user forgot to set the config and as a result it used 
>>>> the default value as 0. We don't want to allow this for the safety 
>>>> use cases.
>>>
>>> Xen upstream has to support various use cases. One of the use-case 
>>> is Linux distributions where they want one Xen binary booting on 
>>> multiple HW. So "gicv3_info.nr_lrs" will have to stay forever.
>> We can default to using gicv3_info.nr_lrs if the user does not set a 
>> value in GICV3_NR_LRS. This is what I am trying to do in the patch.
>
> I am still missing something. Why can't we just write GICV3_NR_LRS in 
> gicv3_info.nr_lrs? This would simplify the code and avoid unnecessary 
> churn.

I am trying to use compiler to do dead code elimination using constant 
conditional. Refer the snippet:

  static inline void gicv3_save_lrs(struct vcpu *v)
  {
      /* Fall through for all the cases */
     switch ( lrs )

Here the pre-processor evaluates lrs to a compile time constant 
(GICV3_NR_LRS). Thus, the compiler eliminates the code to access 
ich_lr4_el2, etc when GICV3_NR_LRS == 4.

Is there a better way to achieve DCE ?

>
>>>
>>> Now with CONFIG_GICV3_NR_LRS in place, I am concerned that someone 
>>> will try to configure the value to let say 16 but their HW support 
>>> only 4.
>>
>> If the user has set it to an incorrect value, then imo Xen should 
>> trust the value that user has set. And then any malfunction caused 
>> will be the responsibility of the user.
> > > IOW, we want to put the responsibility on the user to provide the
>> correct values.
>
> I think this is the same things as the device-tree. We could trust the 
> user didn't shoot itself in the foot (e.g. asking for a feature which 
> doesn't exist). But at least for Xen on Arm, we try to be nice and 
> tell the user that something is wrong early.
>
> I don't see why we should diverge here. This is defense in depth which 
> would save a crash during steady state if this was missed. I am 
> assuming that it is better to crash while your car is parked than 
> while you are driving ;).
Yes, I am fine to put a ASSERT() or BUG_ON() in gicv3_hyp_init()
>
>>>>> This would solve another problem where you don't sanity check that 
>>>>> the system effectively support CONFIG_GICV3_NR_LRS.
>>>>>
>>>>>> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu 
>>>>>> *v)
>>>>>>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>>>>>>   {
>>>>>>       /* Fall through for all the cases */
>>>>>> -    switch ( gicv3_info.nr_lrs )
>>>>>> +    switch ( lrs )
>>>>>>       {
>>>>>>       case 16:
>>>>>>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>>>>>> @@ -178,6 +180,9 @@ static inline void gicv3_restore_lrs(const 
>>>>>> struct vcpu *v)
>>>>>>     static uint64_t gicv3_ich_read_lr(int lr)
>>>>>>   {
>>>>>> +    if ( lr >= lrs )
>>>>>> +        panic("Unsupported number of LRs\n");
>>>>>
>>>>> Do we really have to panic in production build? Wouldn't it be 
>>>>> better to return '0' and maybe use ASSERT for a crash in debug 
>>>>> build? Same below.
>>>> You are right, we may not need this. One option I am thinking is ...
>>>>>
>>>>>> +
>>>>>>       switch ( lr )
>>>>
>>>> switch ( lr & (lrs - 1) )
>>>>
>>>> This ensures that we do not hit the unsupported cases.
>>>
>>> What about implementing it as RAZ-WI? 
>>
>> You mean
>>
>>   case 4: (lr >= lrs) ? 0 : READ_SYSREG_LR(4); /* read */
>>
>>   case 4 : (lr >= lrs) ? :  WRITE_SYSREG_LR(val, 4); /* write */
>
> I was thinking to do the check before the 'switch' as i don't think it 
> needs to be duplicated per 'case'.

Yes, I agree.

- Ayan


