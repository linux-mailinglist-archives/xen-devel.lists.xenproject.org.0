Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29A2B0FBDA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 22:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054741.1423409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uegKq-0004IS-5L; Wed, 23 Jul 2025 20:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054741.1423409; Wed, 23 Jul 2025 20:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uegKq-0004FL-2G; Wed, 23 Jul 2025 20:45:08 +0000
Received: by outflank-mailman (input) for mailman id 1054741;
 Wed, 23 Jul 2025 20:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YbeQ=2E=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uegKo-0004FF-SM
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 20:45:06 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e77c77d5-6805-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 22:45:01 +0200 (CEST)
Received: from BY3PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:39a::15)
 by CY5PR12MB6033.namprd12.prod.outlook.com (2603:10b6:930:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 20:44:55 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::39) by BY3PR03CA0010.outlook.office365.com
 (2603:10b6:a03:39a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Wed,
 23 Jul 2025 20:44:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 20:44:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 15:44:54 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 15:44:53 -0500
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
X-Inumbo-ID: e77c77d5-6805-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6M8bKnAFKA8j+h4Ko7Mn2B2b/VhINFxeRXocogkU22949PqFGXQhUY0zURO0IRqHLDJXjrTbXeA0CfdNd+JlhiUE/11beZiGSHYr33hzz+qcr558/2ZcISvCvvo5FsT94bslTObBrJ4m6K7xGCkJufMvPehsolgbgCNWcIeMxyrDRtMDVChLwf+BV3t0RMLqjpCHRYpYDzBVMPhcDiCcY1h4+qPT/bOsQD1X8p+JFswiib8weKyI4z8+UBMKsoTV2984nnXgjvoMyJs62iW4+NdpYPF+6EOJUIwK07EOuo1J9lMUaPCkJIiJTg/N3gmEN1PkNlDXtkSMBFME0SRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=potqh3QIguw+LifqcfVwTsspYVABpGY3NDoB13jNelY=;
 b=TK1bpoogIO2GHNNmpI/PAYMRRoPVFJrtRqu4uEiBhCOo8c9uVrjjrsdHY3KlS/qv1LEDS6WIU92QOYlevwwa56dLjo7AOdkHm/3Hvg1KDoP4FDkQAMRTzkQqJeHKn+rvkDN42DCM1v4wkW3fwnYnIUQ9Dlpfrms4gVaBH9AP8DKr6fnMklU7phINGU+iQqbblDlFo+B61CaIjedRbnHTXI6yqKkpfyDNFNNZJgMjEEI0QF4C9J2kKXwDpuMGmaHGf0WBmU6uINRjdL2zfJd50tZf3QPKxC86XznOaqbWi6PtefrL7jUsmBW0xpIPeusHTgg1xRKY+o18nao4bjNx7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=potqh3QIguw+LifqcfVwTsspYVABpGY3NDoB13jNelY=;
 b=JOE3HnUPzprnORRjvnPPOSpPUygE5LYnoTiqQDH6tK8o5/lmVB2aitItuCDkqK2gQrkyFULVIVyXNHZD5wc1QU8apThQstHgnp2+U440Gw90pQnQUO14lKynNCbAKk4+3KoN8AHcTdqEIas/kLHs4u+myowAaomnEQJQJBLj+qg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <76e2a592-2888-4f1d-b3ac-4eb4d98b9a01@amd.com>
Date: Wed, 23 Jul 2025 16:44:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	"David Scott" <dave@recoil.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
 <5c99a02b-a5f6-4dad-8d55-936697c70f2c@xen.org>
 <b18d800f-ac44-4748-b366-f2421e4e0a49@amd.com>
 <5b4b8ffe-2660-4c95-8afd-8d28c1c016ad@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5b4b8ffe-2660-4c95-8afd-8d28c1c016ad@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|CY5PR12MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e34a457-3036-409b-aa93-08ddca29c7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTZhRkd3dDR6dXNmSFVsYjNuZWtLMCtmK3VjS09VdVVyemxxdis4N052Zkp5?=
 =?utf-8?B?bFZadGp1ZmVrRUt1dlFXb3I0Qmd3ZVIrWU1pWmFHS2xZdDg5VUwvTjFpRVgw?=
 =?utf-8?B?MVI4eGxQa3BWZytSZnllWHBvbVkxOTdZSzd4SFBxa0ltUWNVOXFiKytRS3Ji?=
 =?utf-8?B?dmhUek5HcGJWOWpoc1pQeWhMb1VGV0UzQ0RpTzJWYkhyV1FnNnBWRTFDcFJx?=
 =?utf-8?B?aUgxblg1TUQ3aWFZWmw2alVUd0FBK3JYcWRRRUdYY0F4UnpQVnRhcGhmSUp2?=
 =?utf-8?B?eHZUclhBRXQxM1FSNUpMOXIydFhGa1l2S2ZIckVqMnZXTmFaRHlxNmthaHdS?=
 =?utf-8?B?Tk50Zi94R2x6aE5YZHVYbXF4MEJEMDJzV21FM3JTV01mbks2a2d0QXNRS2t4?=
 =?utf-8?B?RlFMSXF1a0I5alRDT3Q5eEVhZW43emJnWjZuMm1kaXlKbzF5TkhMcjZnQmtJ?=
 =?utf-8?B?dWhzaDdCNytzcE1MYXF4SUxiNjlzaDNFVW1lazNZR2FvamI2NmMrajdvcUpt?=
 =?utf-8?B?QzNaeDBEWmt6VWcxcFRjZkg0U08rVjhib0tHZkN5QkZaMHc3MjFXKzVRYWpE?=
 =?utf-8?B?UzdQVnlySXR0K3oyOG84Q3dOWVVGU0g2SjdOd25iK1ZLeVlqTm5QYi9nMFN5?=
 =?utf-8?B?TFpneE9pTGJuUXc4RGROblc1VGN6c0lERVp1dGl0NXkzTTNpVVlXYmcwVHlE?=
 =?utf-8?B?S25IRXJYUmRzMncwZHpra3kvUlc2UFB2aTBxaFpkVjBOSFFiQjBwemZ4cXpt?=
 =?utf-8?B?QndhU1kwWTRwdXhnb0VnWWJHRlF3cnVZTUQvTVp3SGZmN2ZZRkRFbTNWdmVR?=
 =?utf-8?B?cTBwcEljZGhYYlBFMXNKMlkyeWZwT0R6Ry9iVDBpWTZaa3VOTDkyZVBya1hV?=
 =?utf-8?B?OWFyS0NYeWcyVWg5cFdLYzhKdmxvckpqQy9RNHFrNmx4b2tsSTFEdXg1OEpr?=
 =?utf-8?B?VmhoeWkxNXpZdUNySE1QOEorU3pUS2liVzh5RERVKzhsWnNwNExGUXdWYlBG?=
 =?utf-8?B?aWdlSHoxbWxLRTE4d0s0MUo0di9xOS9tNy9tdDB0TVZWNnViZDdQaUczNFdY?=
 =?utf-8?B?QXNzTkdWWVV4NmNNMTRXSUhwRnpGOWdkTUh2SCtqbWFGWnhjcCtvUmUrVnha?=
 =?utf-8?B?YzRJcjZVSXBya25TeFpmdm5JdFErUFlaaFhUMEU4WWNYRWp2N3BZTEtuanFJ?=
 =?utf-8?B?VFY0ODVraWpDVVFqajNISjNQbTUwL1FXUTB3cjlZcjVjQWVBUWZzejd4ODZB?=
 =?utf-8?B?b01VeHBudmNaam5IY21nYjh5TjhhRll6QVNIdi9UeEoycE9nanpwOUtxSGlP?=
 =?utf-8?B?WmFta2FFdU5HVThmTUJKQndOOEp0TFMyOGVDYWxoNnRpRjJaVkFZcHRjdFdS?=
 =?utf-8?B?K0pDc0NnUXpxdEhLRnZuUlIxUzBMWEI5eHF3Mml0Q3VRbVNXUlZ6SjkzMERv?=
 =?utf-8?B?NFEyY2psUEZENERPcGpMTnlWMWlxRmt2eEFmaHdxMzFkVEc3M3N6TkRFNXZK?=
 =?utf-8?B?R2FUaEtFL2gzcHQ3SkQzN2N2K1oxaEtkL1dWUFRCNWw3NERTV1Jadmt0R1Fx?=
 =?utf-8?B?NE03N1ZXanhqNlNZTzluVS9BM1pqb0ptZHNOK0ZtUEVBYSsxbS8xV21BY3Bv?=
 =?utf-8?B?NTlxWVVaR2tyYTgvMjRrdmdEU0N2MGI3T2M0alNVL25jalJ3Q0prMTdmc0dX?=
 =?utf-8?B?VHN1VGhaZTlsMjFRT01sSHo5ck9yRitxZDFRNVBjL3Nxdko1YkZ6ZmNsYnQx?=
 =?utf-8?B?OEJ1cW55a1NQK21PV1lxVEN1YjJ2OStMa0N5eHA2TEpka2VpVHBGK2dMTktL?=
 =?utf-8?B?bVp2bStPd2NNb21TZ0x1WUR4VkNtdFBmSmNqd1dXc0Zzc1JGUG9QQlhmclJF?=
 =?utf-8?B?ZmJVZ3RhM1htSHhVTWlJc2lGaUZ3eHp5N1JjblpTZnpSb3RXSDZ2M05LME9w?=
 =?utf-8?B?cHlmcDZBanVxVVZsM0JIRmJzcnVlNGdONXkwalp4QU5RMFhrZlFkYXgzZFZQ?=
 =?utf-8?B?MDkxcnVMWFRuNVpyZUJNYy9NekNwUnRZQ0NiSlNUR0s4SXJlZ2RhS3EvdXlV?=
 =?utf-8?Q?7WPaMu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 20:44:54.8579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e34a457-3036-409b-aa93-08ddca29c7b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6033

On 2025-07-23 05:29, Julien Grall wrote:
> Hi Jason,
> 
> On 21/07/2025 23:00, Jason Andryuk wrote:
>>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>>> index 88a294c5be..f1f6f96bc2 100644
>>>> --- a/xen/include/public/domctl.h
>>>> +++ b/xen/include/public/domctl.h
>>>> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>>>>   #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
>>>>   /* Allow domain to provide device model for multiple other domains */
>>>>   #define XEN_DOMCTL_CDF_device_model   (1U << 9)
>>>> +/* Domain cannot be the target of hypercalls */
>>>> +#define XEN_DOMCTL_CDF_not_hypercall_target   (1U << 10)
>>>>   /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
>>>> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
>>>> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_not_hypercall_target
>>>
>>> I am not sure where to comment. But aren't both flags mutually 
>>> exclusive?
>>
>> No, XEN_DOMCTL_CDF_device_model is *this* domain providing the device 
>> model to other domains:
>>
>> + * Device model capability allows the use of the dm_op hypercalls to 
>> provide
>> + * the device model emulation (run QEMU) for other domains.  This is a
>> + * subset of the Control capability which can be granted to the
>> + * Hardware domain for running QEMU.
>>
>> Whereas XEN_DOMCTL_CDF_not_hypercall_target removes targeting on 
>> *this* domain.  So the domain with XEN_DOMCTL_CDF_device_model cannot 
>> target the XEN_DOMCTL_CDF_not_hypercall_target domain.
> 
> Thanks for the clarification. I misunderstood the goal of 
> XEN_DOMCTL_CDF_device_model. That said, I think there is still a problem 
> because with CDF_not_hypercall_target, you would not be able to have a 
> device-emulator for that domain. Is this intended?

Yes, it is intentional that CDF_not_hypercall_target prevents using a 
device model.  With out safety use-case, we want to be able to avoid 
interference for specific domains.

Regards,
Jason

