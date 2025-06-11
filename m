Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4EAD5CE4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011950.1390469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPP2G-00010q-3m; Wed, 11 Jun 2025 17:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011950.1390469; Wed, 11 Jun 2025 17:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPP2G-0000z9-0X; Wed, 11 Jun 2025 17:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1011950;
 Wed, 11 Jun 2025 17:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPP2E-0000yl-HC
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:14:46 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2407::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9158f3e0-46e7-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 19:14:44 +0200 (CEST)
Received: from BY3PR04CA0030.namprd04.prod.outlook.com (2603:10b6:a03:217::35)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 17:14:40 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::24) by BY3PR04CA0030.outlook.office365.com
 (2603:10b6:a03:217::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 11 Jun 2025 17:14:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 17:14:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:14:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:14:39 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:14:37 -0500
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
X-Inumbo-ID: 9158f3e0-46e7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmMVXrBebK9KgqMvcrI0N2plMO01rwuLhat0IIss5iqfaLl/qvNcCqzEheOsGVNeDdAj2E5yNOdonwI5rrulsZ6/RHhpr+b2GYO0FfUkeCAqSDqamVcID5P9RJ+aRr7JXmA5Bvxy4FabvRlPBzNW6VBvPRM7St7vVs95D6z03+822JIhSlkbEhqsBxvuDIzxVEdpJHC6+OXxq9G2fLsgaoJ3yn/DcYg7j8dqmv+TTODKQgsgiuH2i38BDS9GcNm2B18p0OECMN4r60M9L5VkvB9eQAaU4ISMA7H4rHPqjJnsgvbeN5wGMI0+UEncY0/s8DUyfP97lLXhQ7JF539jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et0YllRS4jurYtI9iva30mNVvtIvpzZkSX2b8rff/Rk=;
 b=kbyqTbwXJiO0joBLqwjgv91/C/r3SI5JSMMJo3KUJUWIEfhQW/oAQlu+C3tkKTuyfDjdlKY77ImnS2m242DizVraociXXTixPMp+igByZv/kL1KNEeCjONgzZNXChrObx7PSDjRxAH6z/JPkTbhi8aM4O8luf35OTvGcmRhwZiqJMz1SaBJiZbaRErt+CydrC/lJUSQBY/zmR7BzPWYflWuyRN9puNY8SVOaNvXCxJF4HOeqQaWUKpf/RGNV1okoUSsBGzTrwvv5I0/eihHf/fofaOzoPpeWhki2A39gin+OwDamHEEsR6FoErbC9bOXpWr8osYnJU3sSVeQnAm+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et0YllRS4jurYtI9iva30mNVvtIvpzZkSX2b8rff/Rk=;
 b=bXVcEGxgVosMjIOexe9yFKcQtPAJu/exKc0XEI3LmFeYrYzYgyLUFaZAQ62ksHTOK4g1HmLKmo7xzXPdYc97qKzNFuAIAebWXrJtb/TlG4FMzshq6eQigrP4v11eAkn8t+/wi4GgqfB5ny9fdjYX+fyas3zaJ/K++bDWd2MlBX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9819e041-3b4a-4e5f-b391-149e0900f286@amd.com>
Date: Wed, 11 Jun 2025 00:35:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
To: Jan Beulich <jbeulich@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-4-jason.andryuk@amd.com>
 <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <af247ba8-150f-4c19-b332-2bf5f53a81a5@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e6e92b-c828-4ae1-14d4-08dda90b7365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1N2M3dYdWpRdkJveVJ0dmZ0MTBsMHlpYXRjK1VraDNRTTRSWnZTNEt5ajk0?=
 =?utf-8?B?T1ozMmNSbmVsK2RsM2t3Ky9qUXR2ZE1UTFZXSUZ1S0VDeTRQYVVQV0hCcjVr?=
 =?utf-8?B?TGExM2h4QkpwVFlBb3lBemlzMzhsVUEvSC9lUkFkRXF4bVRSaWs1REdmV0ZJ?=
 =?utf-8?B?RzFIV21ZSjlwd3hlUk0reVdsdE5TOVYvZzVIWTN5SW10WHNvalorYVhuQnds?=
 =?utf-8?B?ZmltblhHS3p2MGVPeTdiSnRZSitxWlFGVW5YUDNaR3F0Y1JmODloRm92VXM4?=
 =?utf-8?B?RWV2amFmY09YK0NDWVNOcVA0cGNwamw4c0NXM3NMZXdBcTY3M3BSTitjS2xw?=
 =?utf-8?B?VksxMkd4N1kybkFXc1hDUWExSVI1WTVaMWI3YTBYbXV2RENhNDhTK0pZbUQ5?=
 =?utf-8?B?NGlTQkRieDBrM0J2NVpRNlRKVnRtb1luUDZNVmhFS01vSk9nSGpNWHFXcW1i?=
 =?utf-8?B?Rm80d0FwVG8yUkJNQmgwZDQvTkpwN295NzJaaGxhazFub3I3Um5mTGtOdHUv?=
 =?utf-8?B?dTlFQjBVaFQwVFdrcW5HOU5BbmYwZFRhUW9iT2xYOTFDZkttUnNCcUMzS3Jz?=
 =?utf-8?B?OHh4bXdJWlVlTXJXVTNEVEhka2RJSkYrMmtXUWR1bHRVNDcvMzVvSnJoOWlY?=
 =?utf-8?B?cFRjN2ZwS2RKNThkTG0zb2NBcUdtMk1VN1ZCRWN2bGRUUE9meEoyTXRaZkpZ?=
 =?utf-8?B?bEtWNUhsRWJveTcrTStxcFM1Si9UZjNPQUFzempLdStpa1ZITzkxd3Fjb1I0?=
 =?utf-8?B?ZUoxVEEzT1N1VUZCYnJ3OGRYQ1RoTWlMV2MzMVhEdVFtUWR2NmpLSi8xa3NK?=
 =?utf-8?B?bmdESlA1SzVTL09TYUVUdmhsejViYVlRcUdCb0lQTy9uVEppd2lhMElYZk9k?=
 =?utf-8?B?US9VZGNuYTViTkRRVUc1NkJKTTV1UXM5NUlKKzF0bVVFZWQvTzRlTmx0NWE0?=
 =?utf-8?B?cUp0c3h1cHB4WVZvUFkxSS82cFE4S0RNN3B1NFpSMHNjZjFvbEc1UW1sVytv?=
 =?utf-8?B?R1ZlSis1NThhZWdrZitZaDJMdjVyUERyY1RnVGM5aE9tMVBuL2w4WXlYUzRi?=
 =?utf-8?B?cXB5aHFOQVd6ZmJMZDkzNXo5MHpweUtXMHVSMGJ4STVUbjUyaDVIOUpodmdO?=
 =?utf-8?B?SEhCbDJTTkpCUE1qN2VIYU14RGVNcERNeVVUSHFka0FpbU54TlJSRlZKV1U0?=
 =?utf-8?B?MVVPWVFRNktqR2JTS3hMZklYRnlCZkl1bi9HeGtWSmdsb1RkY1Y1QTBMZmRi?=
 =?utf-8?B?WkFCT3JNTzJNYU9kNG1ycFdaWHdKMjNkNzBCbnZNaDFiU2FlTGF0aGVYaERo?=
 =?utf-8?B?NkdRKzUxTER0cFU3eGNpdk1FUHYvM09HWnRZYUY3bENYRXc5Tzc3eTUzaDZN?=
 =?utf-8?B?cDBTZVlCVGxRSGY1QVVyTGVENlR5aU45SE5Hb2pTQzBNanhsV05wZUFYbk43?=
 =?utf-8?B?dVIwY1RZRHdmY3RIYjlrZllCZGRKalRqQis1UVdVcW1LV0NTV3NQdzlrRG56?=
 =?utf-8?B?NDArZi9ZU2diNzUzb2xzbXlVTHNnMEh4REMyUmlPZ3J6K09NZ0ZOT1QzYzZj?=
 =?utf-8?B?b1hkUDhSblFkMStoUHVHMkJ0TitTcDdpN0RCZ0JsUGV4N3ZBR0phS2FvbURH?=
 =?utf-8?B?UEFJcTBEdFhPVU5JZE52NVkrUzcrVDFkdkgxZi8xWmdtT3JVdHRYc1V6NERh?=
 =?utf-8?B?SmI5clg3UWdpdEZTSEUzWFByS25QMHB2T0RrMkU4SGJpdXF3eUVrQVRGZVFL?=
 =?utf-8?B?SHEzQ2szWVJWUjNEZWFsZmVRY0wxZnhzRXU2OEovbDhENTJNaUdYVjdzeHI3?=
 =?utf-8?B?SGU4ZmJuUUxqMjBXZ29RcGdaQkF6dWw3ZnhsQ1prZTlPTmRKZDhaZEJremp1?=
 =?utf-8?B?a0ZSZUpBSzNucG5lTiswZGdqdk1zUlMrdnQvMVYzS0dPOUhuUFExWXFSRVp5?=
 =?utf-8?B?RU95UU4wZzJVeHhXRCs4RU1rclFQZU0ybncyQ3J6cHBKRjMyTUpFSlFubkN0?=
 =?utf-8?B?eTdrZFlUT2loZC8wNk92bnEvMlk2T3BBT0ZNcG9mMFhsVHZEakJQTjJoQzBx?=
 =?utf-8?Q?c4V0Kd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:14:40.0746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e6e92b-c828-4ae1-14d4-08dda90b7365
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600

On 2025-06-11 09:24, Jan Beulich wrote:
> On 11.06.2025 00:57, Jason Andryuk wrote:
>> To add more flexibility in system configuration add the new
>> DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
>>
>> Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  This
>> will enable running device model emulators (QEMU) from the assigne
>> domain for multiple target domains.
>>
>> Stubdoms assign target allowing the stubdom to serve as the device
>> model for a single domain.  This new flag allows the single domain to
>> provide emulators for multiple guests.
>>
>> The specific scenario is a disaggregated system with the hardware domain
>> providing device models for muitple guest domains.
> 
> Why the hardware domain? Unless a DM also needs access to some of the
> physical hardware, it ought to run in a separate domain. Conceivably
> such a domain could service multiply guests, so maybe the "single
> target" concept presently used for stubdom simply needed extending?

One configuration is the hardware domain running QEMU for the 
virtio-gpu.  In an earlier iteration, I allowed XSM_DM_PRIV for 
is_hardware_domain().  Rightfully, there was some questioning of that 
hardcoding.  Adding a new flag allows it to be configurable.

Maybe target could be extended.  I was thinking that could be left for 
the stubdom case as it is today.  i.e. a 1-1 device model.  But a 1-N 
case could be handled this way.

Today dom0 XSM_DM_PRIV falls through to is_control_domain().  The idea 
was place a new check directly corresponding to XSM_DM_PRIV.

Regards,
Jason

