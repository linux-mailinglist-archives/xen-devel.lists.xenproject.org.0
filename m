Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3FAD7C62
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 22:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013560.1391958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPoZF-00042k-7G; Thu, 12 Jun 2025 20:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013560.1391958; Thu, 12 Jun 2025 20:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPoZF-00040r-3g; Thu, 12 Jun 2025 20:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1013560;
 Thu, 12 Jun 2025 20:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQ89=Y3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPoZD-00040j-SH
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 20:30:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c04a9d-47cc-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 22:30:29 +0200 (CEST)
Received: from MN0P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::18)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 20:30:22 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::ae) by MN0P222CA0013.outlook.office365.com
 (2603:10b6:208:531::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 20:30:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 20:30:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 15:30:21 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 15:30:21 -0500
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
X-Inumbo-ID: 13c04a9d-47cc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+QsvYCorc1/MC9isUesy19/+9uexLk065goQ29tTW8iIh6pasJITzyer3W2nOsSVdtDD/4F+6tkY3wvIhQnLtRgC59tFMQYmM5NIs8Cpm1AVjpeGAYi0PhCPuyad4pMvBFRNUfQvyZrBKRxi/+SWpDKWiQv7J4TudcAP0dFUoym/Mll/wxlxIBx8edqv9rnW+zKQkAs5Zx1BDA5ZkuOiAg8EtUN5T8FtSCP9HfGK9fMr4lef4xyJnPVRRj9PFeZdSygTrH8gBAhzQdsmBvw/7550VWHXduiZUja0/fr3ShGMCODmC0frE9Ox0ugH18O4Zq5Oct4BLmN3JWZkU4l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbhSiqFxCJg3UTzzQSjLFfT2DQEtNEKTY6C9eF2ty6g=;
 b=whB3akfdlc3XHVr3rYHiDZcywR+98OrUd/Yz0I+IFDRnDTCteHYJZGZ5sa7YSXBQqKYaLOoxSKSQXVJERQgW4qAePnkfFzMhlKVxVY1wOqY2JKtMsxUazWrowimKNp2uocUvpqIF1WzAZNTYrM956XWvJ3iPEVZ/OIjKGscUPV8jxrPEKMaRkMq1Nduo9g7V6WXqfQM69jAdLZ/YSmBu40oh8VNfOzICJ7ovH+CG8jMdTqAfPXBg2fDkEIKf2zKhJvcaFPJ9N0byOEKq2Hr3poSTc+vKwIZeJOnrYYRawgL+S9ZhMxUgCNMtm8uDtVszJ+B8dDbvNHxb2smHdjpSxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbhSiqFxCJg3UTzzQSjLFfT2DQEtNEKTY6C9eF2ty6g=;
 b=yyOX/s52mVyBiN5zV6d2SUDbQBjwZ8AO/3fCKmMbXbgJfdAOPirUhURPlds0/9CoY5yADfspxXPgnPfBrFcYtpXoJvO2eqHecdgY+BL58wTumTlqt4cm8EscqbABdfNb2RCa8pkYzxVDs8uc7ve7m7clKT+JU9wUJnpj3mhzCuE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ad19568c-bf03-497e-a8ff-e01e08fdf624@amd.com>
Date: Thu, 12 Jun 2025 16:30:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xsm/silo: Support hwdom/control domains
From: Jason Andryuk <jason.andryuk@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-3-jason.andryuk@amd.com>
 <0f47268e-0674-46e7-bfd4-8a395ee1ddf6@suse.com>
 <6cc69b45-7347-4250-ab32-a1e2857b7d23@amd.com>
 <805abeee-0cad-4cc9-88ae-77e4c1e23fac@suse.com>
 <fc719213-3ac4-4f3a-ab20-47b2170b2a1f@amd.com>
Content-Language: en-US
In-Reply-To: <fc719213-3ac4-4f3a-ab20-47b2170b2a1f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7e4d77-b1f5-4c69-337f-08dda9eff4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWVaK3Naek9qYm9ZR1BiazJ6RVpmUVdPcUdoMGp2WUxOVzBmaW45bFFuSFhN?=
 =?utf-8?B?K2p6WGY3dy9aa29ZSXVGQUV3SzVCNExsRDZqRDRaNndKUlptRXJiMTU3SVNz?=
 =?utf-8?B?MTAvOUpvTjFhZEczSXowNktObExxZU9XczFEMVEvVjk0dCtDdkpicWVWS2tI?=
 =?utf-8?B?dW11ZitPbzR3eUppU0JUSmxRRVoxd3QxdE1VVjFvNEorTE9WQjdiYVdnWHcy?=
 =?utf-8?B?VkZLSW5tdVQ5ME9OR0h3K3lOZnZpZGhpVDhHTEV4UkpJQUYycTNhOGxxdHV4?=
 =?utf-8?B?Zk4vbmRKVDdGbUpFNjQ2Mjk1NkQyaG1pWHJmRm11Y1FUUVVBZnJnUG1XRDNq?=
 =?utf-8?B?WE8ra05JRkZtWUIvM2doNHdTVFhjS1NnYWVsT0MrSHlUekRiOFpadDZJWk0y?=
 =?utf-8?B?aTdLendoN0JBVS9ydkxLOW05OVVoOE1nZERndENrZDRsWmNuc3RRY3RGVHh3?=
 =?utf-8?B?dUpjTWthWEJTbXh1dS9ReXloK0NsT0hHS2h5MjBGd1E1YVRlYnlXTldiZWRC?=
 =?utf-8?B?NjhIc3g0enpnRUlKdEVaUG5wbW9TUm5aZ1U2TkVsOE4wa2g4UjFUY1NmUWZO?=
 =?utf-8?B?VTdyUWhjWXBLWHNTOG54K1hDTS9IOEdzai9Cb0RyL0k4TzdUQ0ZtUWRsUDhI?=
 =?utf-8?B?V2RJaytJOUFJZVdrTCtkS0VZbllnVmh4Ymx4eksxOWJuaXp4UlBYN2FTejBR?=
 =?utf-8?B?RjhnekpsRVNhbGJuNEtFdHcrelF5RGV3bTluOEJyWUJMaXp1VWJhRStiZzFx?=
 =?utf-8?B?d24wSW5NdUtIZGpXRVpZL0N1Nnp3eTVuUDRpaXkydjFibU44bVZjc2UxODdi?=
 =?utf-8?B?NllHYjRIOElhUnM0azF0YUFrTGJGT2tocS9mRW5HQ3VubFNRS2VLLzJuRlVH?=
 =?utf-8?B?dVh3Q0xxYy8vRURVYTlSL2lncDRaOGhWc3Uxcm5mZ1pIdDA3Ym9jK0JmeCs2?=
 =?utf-8?B?UVZQY3A2S0pJQXNSWGhzWmFkMUhRNnFoVEJOZUtYdnlVbytSOXBweklURUg3?=
 =?utf-8?B?VmphNm5TS3NBM0FKRmdsVGdJdEVSZDIwTjVpVE51cmVJYVhkdmFMcVF0ZjdL?=
 =?utf-8?B?aDVBaUpxc1dBMVlXQ3h6dzk5U01EMW91eW5ndVZQT1JqYzIrbTJjUEh4V3Yz?=
 =?utf-8?B?YTZjNnllWUl6eGp2aVJqZldDMlIwUHR5VWxIOGJzVGxqUTBOZG12TFMyUURs?=
 =?utf-8?B?NWZCb3piU2tKR2xINEIxR01iZnlxM09mc2RmTXNUM0hERURPRktQSWlGblJt?=
 =?utf-8?B?dWJqMnZmMUFqQzcxTHZHN1FzVUZXNjR0d0xQWkpvRVl1R1pmY0J3Z2psalR2?=
 =?utf-8?B?TFJnWVljTS96K1IxTWdTZ0NyZlh6TWM4cGRSc2lROVpJUG1WcXppNHRGdndW?=
 =?utf-8?B?cmhicGtpY3E0cE9pbkNjeUhNc1hLa2lBaVBqb1FjY1pBekhQMVhxUmliNWhi?=
 =?utf-8?B?TlhiZUNtcHZtSjhzMmdZSFJPMGw0MU9xaGtLZTRMTmZSNEZIMXFSUWVEL3Bn?=
 =?utf-8?B?MmlPQ2dLR0taMm9MRWtRZ0Jobkg5MTdyNUhHK2tpanczamRkNXFFZ2hzemw4?=
 =?utf-8?B?YmNjVCtnRU94OFQ0QVB6dXZDckRGckRVY0NVS21FMkhlZktBa2FMWm5nZHAw?=
 =?utf-8?B?dytadWpxQm9qQ0tIVURjOHhGR1YwRmQ3STJoNWhORVN4MVgyaEwzZWtwd1VT?=
 =?utf-8?B?REx0elhyODhmalRGTmowV1RqWllkSmJSTmxheC90b0JjWTZTSFJDL3dkOWxn?=
 =?utf-8?B?NEYyL0JQMGZSZk1XaDF2ZEdCQTA0M3dBRGFVd1hZamx5bm9TVFBQRXNMT0hD?=
 =?utf-8?B?RWFWa1I0Mityb3BDZlhhV2VyNTBSZUQwYmRPdXpwWWxYMDJyNEhHVVI0Sk4w?=
 =?utf-8?B?VXR1NlVYOUpLaEc5NkM3V1YyK1NMWFV1dWNncmJwVkVDcVdqTzkzRXZ6OHNX?=
 =?utf-8?B?Y2xKdkRYNjhZS3pEMGMzcmZlcHl3bkRabTFWNGFvQW5IMWhqSzNPdEc5WVBi?=
 =?utf-8?B?dnh6bDcrZk83em8wdjRkSitXdjVwOGlYK2FQSEt0SG41SDY1Z3BmVEpGRVdY?=
 =?utf-8?Q?d0P+gK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 20:30:22.7450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7e4d77-b1f5-4c69-337f-08dda9eff4ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529



On 2025-06-12 12:56, Jason Andryuk wrote:
> On 2025-06-12 03:52, Jan Beulich wrote:
>> On 11.06.2025 06:20, Jason Andryuk wrote:
>>> On 2025-06-11 09:17, Jan Beulich wrote:
>>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>>> In a disaggregated environment, dom0 is split into Control, Hardware,
>>>>> and Xenstore domains, along with domUs.  The is_control_domain() check
>>>>> is not sufficient to handle all these cases.  Add is_priv_domain() to
>>>>> support allowing for the various domains.
>>>>>
>>>>> The purpose of SILO mode is to prevent domUs from interacting with 
>>>>> each
>>>>> other.  But dom0 was allowed to communicate with domUs to provide
>>>>> services.  As the disaggregation of dom0, Control, Hardware and 
>>>>> Xenstore
>>>>> are all service domains that need to communicate with other domains.
>>>>>
>>>>> To provide xenstore connections, the Xenstore domain must be 
>>>>> allowed to
>>>>> connect via grants and event channels.  Xenstore domain must also be
>>>>> allowed to connect to Control and Hardware to provide xenstore to 
>>>>> them.
>>>>
>>>> Are you suggesting that SILO at present is incompatible with a Xenstore
>>>> domain? silo_mode_dom_check() in its original form has no special
>>>> precautions, after all.
>>>
>>> Yes, it is incompatible with the current silo_mode_dom_check().  Only
>>> Control domain is allowed to use grants and event channels with a domU.
>>> A Xenstore domain would be denied.
>>>
>>> Xenstore stubdom only exists for x86 today.  My limited attempts to run
>>> xenstored in an dedicated Xenstore ARM Linux domain have failed.
>>
>> This may want sorting independently first. Once sorted, the requirements
>> here may become more clear.
> 
> HW+XS-> xenstore works
> CTL+XS or XS -> the domain's console just stops.  vCPUs are in Linux cpu 
> idle.  I haven't figured out more.  This required some Linux changes to 
> query the capabilities since XS isn't exposed and ARM assumes initial 
> domain implies HW + CTL.  It's orthogonal to my goals, so I haven't 
> looked too hard.

I got standalone Xenstore working on ARM.  Linux was blocking in 
xs_reset_watches() - the Xenstore domain needs to skip that function 
like xen_initial_domain().

This is with SILO's check as:
static bool is_priv_domain(const struct domain *d)
{
     return evaluate_nospec((d->options & XEN_DOMCTL_CDF_xs_domain) ||
                            d == hardware_domain);
}

Regards,
Jason

