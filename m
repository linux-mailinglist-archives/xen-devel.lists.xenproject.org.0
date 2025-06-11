Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B84CAD5B19
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 17:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011901.1390438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNkF-0006X9-Pe; Wed, 11 Jun 2025 15:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011901.1390438; Wed, 11 Jun 2025 15:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNkF-0006VI-Mg; Wed, 11 Jun 2025 15:52:07 +0000
Received: by outflank-mailman (input) for mailman id 1011901;
 Wed, 11 Jun 2025 15:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPNkE-0006VC-K7
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 15:52:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2416::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 031655a9-46dc-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 17:52:02 +0200 (CEST)
Received: from CY8PR12CA0003.namprd12.prod.outlook.com (2603:10b6:930:4e::8)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 15:51:57 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:930:4e:cafe::54) by CY8PR12CA0003.outlook.office365.com
 (2603:10b6:930:4e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 15:51:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 15:51:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:51:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:51:55 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 10:51:54 -0500
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
X-Inumbo-ID: 031655a9-46dc-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHB6nAhXsv7H8Erj0uCHpEsk1d3tmn7W3el2zR+3aYvZeVf8LWc/taZ4aBxVm2pD0qvFTB5YHXhYJ4VOJtrLddmxNCEcvSMAGv5+6YSCy7thu1xil7XkotCRwOPal+fv7B2BAf6pP+Ex/633v9agaJVU6v0rOpfqNcIM3VIiL72xxfaoo9cjpaCbv9hXGpN/VnQqHnFTi8gCRYwT9ocSsx9p+dJt7nyTqMhUocur7MkR6vVgJXC/mn7InOgbWKqLitiB/4ew9/JLFeC6u/Abs63KNvR2f//+z0plIWjbP0B/SM75uAncY++BGtHNyRBFznEVOTd0+6Gkgy9IkiyThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6knYC8fsWowFRgs5B54grYDA2NIIDK6L3C975z9rfC0=;
 b=BHYgw/11TrWLhJqYww9AEINHKiwyfvGyuD4UheAaS+oNiMRUnuFkcTex4qRhQtJyve+RySKc0ADnsEyv1IUrDM7ZR+J6lLdL081JwwKO/FIn2pRq5s9tFmmbymGW3W0DyF8fAECTOqETs9PWYTz95M3MD0rJ2HtqoaQvQaz5vU9a/4WzR7GrrhSJorU5tqF/uDcny355RJc5Py9270lKTWArB64EjCIyrvwjcoM/II2dNFyn1rthN0USosUECnH2g1t72By/MYaBPJPyqJnbW+uXY+1zdG84sLHIHew6YhxLDPHT/6zFPDmtF1TGr1gOTjMj0/kpjyJT3G8/xQSHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6knYC8fsWowFRgs5B54grYDA2NIIDK6L3C975z9rfC0=;
 b=cuAPXshBMFHb1lcDexf1+YA1cj9WwSEYPcz0Eob1pvEal+aw69GK50C0QxcRFX8Xca3q68T8pkdT6hXaAnEZj6C5BMsaRgPgjWH4YMnNIY/4qm0+7yA/cpp6JBnGSj8rzbU6NHmJRy0xVvCDCSw1ii871dQ/nPM9zPOzMj8hcGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <12700a8a-a969-42ed-aba8-753ff9da9a44@amd.com>
Date: Tue, 10 Jun 2025 23:13:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/xsm: Add XSM_HW_PRIV
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-2-jason.andryuk@amd.com>
 <43725e7d-cb4c-44b7-a3e5-59d8d597c805@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <43725e7d-cb4c-44b7-a3e5-59d8d597c805@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: fda30669-1b97-42f7-46b6-08dda8ffe561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlJhdmV4dWE3em1taTlLdVhsdlY4cWV4VTVaSGMxUDJRSkg3bUFhaFYrMVo1?=
 =?utf-8?B?T0k4UURRMlZGM1pKbU9PZGpmeUtZb1IrUDQwZzh1OXZMQmwrN0x6Ri8zZ0pM?=
 =?utf-8?B?bHJCZk1pSVJqZnNmV1Z2ZVhwSEtWdjhXRTZkb3FRWEJpSTBROC84d1BlVC9o?=
 =?utf-8?B?dVF5Z2M3K2E5Yi9PaWZyY1gzQTRYR0s4ekN2NTY1RS9zMWk1cjdaSnZFL2dT?=
 =?utf-8?B?MnZXNElDRDRYNEVNY1VCSEtSYjdEMHNmcXkvRlkwTCt0cll6K0VFSVJRZWIy?=
 =?utf-8?B?VlBnUWYzR1ZDVFlsem1ybDNCUEJNTmozSWhHUmVWUjU1QUFWcS83bHlzUXRw?=
 =?utf-8?B?RjdhZVFmOFR2d1ltejBjR3hhdzYvUERxcHM3UUlJMlhGMVc5QTlwSkU0T25r?=
 =?utf-8?B?dU1DbzBUakdORWNTUklWakx4ZXV1a2JQRU9XR2tDbm4yeitnMkpmQVhYaU9P?=
 =?utf-8?B?d0NFV29iL0dTVXFHcDgzRFhlbk1mOFpWdlh2N1dDZHNKZzZYZnN0RVJRUGND?=
 =?utf-8?B?WkxKZE9kQW1UN1haUG93dTQ4NE1BTUNZcllTNFAwZEovcnpzRGNxOWlJbDNS?=
 =?utf-8?B?Z1ZzazF5Y3JjRktpb3dEM3VXbit5Y0FTYVFhWk1TZEppbVp3M0RjcFpZSjFK?=
 =?utf-8?B?OWRERHZ5WnpLWFg0UlJIT2ZvVldYWTNlVUxpUTUydjRBUGltNFk0cFdGanFp?=
 =?utf-8?B?dzI4Y2NiNVlHejV3bGNrcFF1QUFUcU56bFhudE9SSmNCT3B3THdpSnQyc2Ja?=
 =?utf-8?B?SmhBRFVQelRPNko2YVpLenA2dzR5ZzFZVy93cmVIY1ZtaUg2ZzUxU0RDMmEv?=
 =?utf-8?B?dFhzbnBQaHJMTC8yWFlyczVTZGwrci9pWXlsd09jZWZnaHh6UE1sQVplbjBQ?=
 =?utf-8?B?aGhrWHhYV2F3TmRxbHozd3AxaVJ5aUN5YVFNRVduZ0VDR3JXU3ZDZlBXRFJR?=
 =?utf-8?B?WEpNT2FrS3J2a0trYUZsQUxLcTFYaXEvVGdyKytZWDlPbndvOUpxVGNvWDlZ?=
 =?utf-8?B?NFduVzlHaXNTNmNpd202d25JNGQvMkRxTkNPc3FjQmFuM1BUS2oySjExaHNY?=
 =?utf-8?B?b0NxZHFIemJQRCtSSTV2d3dMdndJbnhHWEJVeHpUalJWVVhvaVJ6czlHa2My?=
 =?utf-8?B?S0lUWmhic2pnRG1BVE5QM3lyT1ZMWCtYcjIyN0hhcEtUTFYzYmJxVTZzZjZW?=
 =?utf-8?B?UU9JTXVZcUYweWRSWDdQeTNaaHZVZG5XT2NjNEZXaUJTV0l2R3dtRUJJV2JS?=
 =?utf-8?B?TkJnZlkzL0dkRnpiajZKMkFETUQwaVZ5aXZvZ0RmSFBURlpITnFSOUVoQnVJ?=
 =?utf-8?B?YW9pbXJxZlIzS0paR1RXanF2aHh0R2ZRKyt4UzFoVmdDOVV5cGU3MkJYL092?=
 =?utf-8?B?RjZPM3A4VWhvRXpPeFlmVHEvVFpieEVJSEFndkhlUVVIM1lKQk1GNVRLOG5I?=
 =?utf-8?B?a3RUVkJlR0lzN2t0YlJlb0prL3ZnWTRaUk9RZmVNTkNXWWg3UHBZZHNnYU5F?=
 =?utf-8?B?cGsyakNVT20vSXJZMVZmQlBzTm9MNnMxaVZrUEFQMURwOHJuMnRYZUVxVU40?=
 =?utf-8?B?UUQrM3gzcWhiRlVTdjVvRzJ5enRzUEJURnQ1MERpWDgrQzNxczdhZXdlS0ln?=
 =?utf-8?B?RzBmUjljN1JkUDhlb1dtYko3Zm8yUTdOOHgzOTFiNEt0bERBbXJuL0dVR0VT?=
 =?utf-8?B?cE5rMGxuWmZncklVWUhBZWFXVkZFVmNtYXp0cC9XZ3R3a3RuNXBKdzZETXVa?=
 =?utf-8?B?ZmtJd1ZuZFZ4dGlRQ3AwSVFSNDIzbms2UkpMSEEvZlhsUFRsdkFRamlDTGRt?=
 =?utf-8?B?NG9WaE1JcFdHN0VXd0FkQ1dLQ1FyTlpOUndBbHRnOVZ4YVBJNHdOdkVLUkFj?=
 =?utf-8?B?Q0xaeUhWbTNzVUhKV2U5TFZRc1pXa211NjhRam4zVDJyVDU3Tmp6dStTdWdz?=
 =?utf-8?B?K3hSQ2tVMWNBZHlQSDhHMncrR0N5c1ZNZlJIYi9oTkhkT1p4Sm5kWXhpb3dz?=
 =?utf-8?B?Vlhlbkh6UTFZN0M3eWQrbVVObW82aEN2Kys5QnI1bHRndVVCMEJLMkFXakt4?=
 =?utf-8?Q?yQMsai?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:51:57.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fda30669-1b97-42f7-46b6-08dda8ffe561
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

On 2025-06-11 09:02, Jan Beulich wrote:
> On 11.06.2025 00:57, Jason Andryuk wrote:
>> Xen includes disctinct concepts of a control domain (privileged) and a
>> hardware domain, but there is only a single XSM_PRIV check.  For dom0
>> this is not an issue as they are one and the same.
>>
>> With hyperlaunch and its build capabilities, a non-privileged hwdom and a
>> privileged control domain should be possible.  Today the hwdom fails the
>> XSM_PRIV checks for hardware-related hooks which it should be allowed
>> access to.
>>
>> Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
>> platform_op.  The hwdom is allowed access for XSM_HW_PRIV.
>>
>> Make XSM_HW_PRIV a new privilege level that is given to the hardware
>> domain, but is not exclusive.  The control domain can still execute
>> XSM_HW_PRIV commands.  This is a little questionable since it's unclear
>> how the control domain can meaningfully execute them.  But this approach
>> is chosen to maintain the increasing privileges and keep control domain
>> fully privileged.
> 
> I consider this conceptually wrong. "Control" aiui refers to software
> (e.g. VMs or system-wide settings), but there ought to be a (pretty?)
> clear boundary between control and hardware domains, imo. As to
> "pretty" - should any overlap be necessary (xms_machine_memory_map()
> comes to mind), such would need handling specially then, I think. At
> the same time: The more of an overlap there is, the less clear it is
> why the two want/need separating in the first place.

So you are in favor of splitting control and hardware into distinct 
sets?  I am okay with this.  I implemented that originally, but I 
started doubting it.  Mainly, should control be denied any permission?

We aren't using the toolstack to build domains - dom0less or Hyperlaunch 
handles that.  This avoids issues that might arise from running the 
toolstack.

Thanks for your feedback.

-Jason

