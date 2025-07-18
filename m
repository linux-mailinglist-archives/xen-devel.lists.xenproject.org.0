Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0E1B0AC5D
	for <lists+xen-devel@lfdr.de>; Sat, 19 Jul 2025 00:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049317.1419267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uctxX-0001T5-5K; Fri, 18 Jul 2025 22:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049317.1419267; Fri, 18 Jul 2025 22:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uctxX-0001Rs-2W; Fri, 18 Jul 2025 22:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1049317;
 Fri, 18 Jul 2025 22:53:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyJe=Z7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uctxV-0001RT-DH
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 22:53:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2414::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b0de6f8-642a-11f0-a31a-13f23c93f187;
 Sat, 19 Jul 2025 00:53:39 +0200 (CEST)
Received: from BN9PR03CA0887.namprd03.prod.outlook.com (2603:10b6:408:13c::22)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 22:53:33 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:13c:cafe::22) by BN9PR03CA0887.outlook.office365.com
 (2603:10b6:408:13c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Fri,
 18 Jul 2025 22:53:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 22:53:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 17:53:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 17:53:32 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 17:53:32 -0500
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
X-Inumbo-ID: 0b0de6f8-642a-11f0-a31a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7sds0Bs5nLhSpYdb1ubqCRCfeFzvbIc6E5rBqtWhGhO0dv3f2GN6RFJWl5DrAvC4swbzhscdfivgoArB+eeoEk5mX+/u+BLeV4OZWj8ikMs0fhuntzdcho7glcBeh68h7P9zyjJN5lJZZHklapZra+k3+D09gPMq55pu+xDgRzZFM/Nq43EhmXsadywj6ewcG1rR/i8LkuZIpEb1S5QAC40T97H8vqbSB3T+US4q4A6//Pfcr1VEM6OJgwNI9hyrNxbSlf4D9KYhn9q4IevKt6xFgEH1a2LdlNQGev9fRnhDYL3PB7JRKdxnUR463spzmN92zx2SqH598ZZlyEVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAcLzcNqk6f1og9tlW0haAs827oTZcwps+2zzEVafhQ=;
 b=YZAM616PbpoaWVX3+EJSsjLsGwcoLZENmrTeEkzgVOHwuo7n5ZwoZ+NczAd0gChrY3G++62MzZMQAUXFrShvTOutQoeTbbW2BHN4iFqEZXMugjagQW9ALADqYGJIg3B+MRzuSQe27O0FsppLBaQXGOoDS/c9GoeGr9J9ijHocZUoQDsCB7T55yGM+SeRCZSDg+W8BOFGly4B+19nDnwW6EbKklqhIhUcUuaooJol+yvtcl20sBGMbFI77u1OTZdAD8yIf24h4NgPO1VmBgTzY2TXMACjcrmIFQkHJmvEHMl6g3XRUiq+I5Hq9VilIhj/IRClK2J/i05RoN2cnkbo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAcLzcNqk6f1og9tlW0haAs827oTZcwps+2zzEVafhQ=;
 b=msWxU4J6UxKWj/f2fqytjTMqZUijd+chW5UfNRGe//GOJ6ErhOqB9FajtYzv4sYjWAS4TkJ18Ue7iew3Qps2orGTP6UOk7paS0upIQB3J7uZ6aTrGxomJ0NcD4IRHt9oBeGhIvyrgO3jrKR/N2aX/spqe9SUphrB39U/aagVc5U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <32a94067-d16c-4f28-b43c-110ddc52f73a@amd.com>
Date: Fri, 18 Jul 2025 18:37:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/17] tools/init-dom0less: Factor out xenstore setup
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-16-jason.andryuk@amd.com>
 <8869fd3f-9d72-4771-8e08-b394a055f7e2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8869fd3f-9d72-4771-8e08-b394a055f7e2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c34aae-e1be-4f32-74a0-08ddc64dec24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXFXb09VOTI2MWY5YjExQ2t6ekoyUVhVWkJXZFpPK0Irb2Y5SG5KNDlwNHRP?=
 =?utf-8?B?dHZFNjFUZlZDbHduYnVVRHdZSjNxb1JxN0Vrb3RQY0xHVVdMeWcrSEgrTnhl?=
 =?utf-8?B?dnlrb3NMZitHNnhYY2xKVTVvb0pDR2p1RXRHMmZBb3NqWHo1ZEE2MmhQc2l2?=
 =?utf-8?B?WmhvK3pIK1FucHRYZXJwZDFaVzUxNjRqMTR2VFNVa2l6ZzhiTVZhUHZvU1dk?=
 =?utf-8?B?cys5MHFUdDFsekRtaHFBUEVUNDdvSWJld09VRVdJeVRqcGZlT2hLSm4vaXB4?=
 =?utf-8?B?V0F5cVR6NTRnV2JkNjdvUzBRNXJkcEo2ZVBRVEVTeTROU1I1bkZBZzFBME00?=
 =?utf-8?B?RS9mMnFwd3lsZE9vVnc0aGFMZ1k1Ny9oWjB6Q0JlK3pUUEhyQ1ZCUWQvTE5G?=
 =?utf-8?B?d1FFVXZzMVhUTHhJVzdyK01VK3NqT2FSUUtOR1UzekZUYk9JSTQxLzdDVnJr?=
 =?utf-8?B?NkNzNG5QRllTTkVxUFZnQ1F2dmxEK01pU0dYT2ZtRXl4eE5nVHJxRU8rRkRG?=
 =?utf-8?B?Q3dGUlpHdHMrY0VKaGhVbGYxTkNVUVpHS3U5d0dNV2dlZk9aUWdmN2MyRE1s?=
 =?utf-8?B?VDJKWXNLS3F5OU1vREUrN2JubUVYOTdNQmd5Qkx0OTZsWDZBU2pYbXd5OWFI?=
 =?utf-8?B?czFDS0MvTDVSTlNhV1ZrVmhLMGI1OUZWUDJ3ZnNoNHBJTDdYV1RWckRhUTdN?=
 =?utf-8?B?ZjN0Y2VYZEpQNUlKUTdWQjRoL0pNVWV6U0ZtNHFZNmE2U05hVDhzS0Vrb1du?=
 =?utf-8?B?Rk9tdVhoemNJcXVwTkdRTk5TMUczUjhWWkVFajMzdExzcEppUEIxOVBLcXJF?=
 =?utf-8?B?bHJsb1NscWtHbk5sMDM3cFFqRmZDR1JrS0g2NUZ0amcyaXhKYjdXVTRaMjNI?=
 =?utf-8?B?VUdtWjJCVTFJLzlFcDczbFJFTWJuUkxuRmdQbW5ma09OSThWQ2t3MUVPTU1F?=
 =?utf-8?B?bEE2a29xRTBMdmZyVTFUOFdnVVVvN0NoTXYzWERNUUF4d1hFcEVrMjZSS01G?=
 =?utf-8?B?Q0F1T0MrYmdIU0t1NHEyZ2dKY2JXUlhMOVFhdENhbmJrVThOUFZ1MzdwZVFL?=
 =?utf-8?B?aSsrbDJPMm9Lb0VnSm4rM3dBTXpsWXVObFhZdktDRWo4ZHA1bHpaZTNlQ1NN?=
 =?utf-8?B?ME5UZVljMkNrcTlMVFUvaVNOd29xSW1xRG5sK2hzUkNpQ2ZzM0lxS0lOQTgy?=
 =?utf-8?B?aEcvTlJpQndEZ1k0NlY5SXNLWWtZeXdlaEdrY3VOcVZaeXkxeGZpdVdERWdh?=
 =?utf-8?B?b252UlBsNWh2R0xDOGdScmtNS043dm53YWJhM04rbU41azMxL1plQ0dFSEVP?=
 =?utf-8?B?dTBPbDUrUjNmbEVxNUhBbCtJajIrd29DemdGRHFnUlZtYTREQXdIcTQ1NkpC?=
 =?utf-8?B?VFQxRDF3OHg5aWZVckhGR2pqaVMyazhpUTVvc2o4SWM1b3JVN1dEWXZMZWxY?=
 =?utf-8?B?L0NsT0FTcWx1bjBxQXU0QzRWanNHS054ZDdTNHVweFV2U0NILzI0VUNxeXFi?=
 =?utf-8?B?K1dwRkhGbU1JOU9Ga2ZkcGtjRmxXUkZUTUlNU2l5T1RzTVpZVHNGYnN5N2sr?=
 =?utf-8?B?NXlEcW5ZYnRacUtvYThkSWkrNUZlMCtNdHQ1b1RFZ2hLTlo2OGVRRE1GT2F2?=
 =?utf-8?B?TnYvcVl3SjQ0SVZKWDZjUU5vSis3Y2xQUEhOREJ1SzNYakJhUmUxZW40cmN3?=
 =?utf-8?B?QUIzQUhjL090Zm4xZ24zU1JrL0dHMk1GcC9YQXRyQ1RleFpBZ2V2NjdqNkZv?=
 =?utf-8?B?RldBdkwyUzU1bk1kRXFhbXV2Z3llK3gvM0M2SEJuWCsyZW5vYXNxYkNPZ25C?=
 =?utf-8?B?NlNVUitCSjZ5UTdOdGRZMUxuOFFjb3ZBbWpxMW9mN1ZjMlcxK2oyRHh1SWps?=
 =?utf-8?B?UXIrZmZxMFAxaUNGQkI3d0tLZWI5anp5am5PQnh1S3BNMzhTb2RPWjhDdGpW?=
 =?utf-8?B?eitHek5pS1Z1eExwUHA3T3VwVDIxcTJlOXgrb3h0dkQ3a09ldmUrVUw2dVRv?=
 =?utf-8?B?bjFYS0Z3MnZzNDBYdGdKWlcyYUc1NWQzb1ZHcGtTQWhkamllZWh2aGYxUWsz?=
 =?utf-8?Q?PcBuDA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 22:53:33.2632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c34aae-e1be-4f32-74a0-08ddc64dec24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346

On 2025-07-17 06:33, Juergen Gross wrote:
> On 16.07.25 23:15, Jason Andryuk wrote:
>> Factor out the xenstore setup code into configure_xenstore().  This is
>> in preparation for handling already-introduced domains.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   tools/helpers/init-dom0less.c | 51 ++++++++++++++++++++++++-----------
>>   1 file changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init- 
>> dom0less.c
>> index a182dce563..6ae7cf2e7e 100644
>> --- a/tools/helpers/init-dom0less.c
>> +++ b/tools/helpers/init-dom0less.c
>> @@ -235,43 +235,43 @@ err:
>>       return rc;
>>   }
>> -static int init_domain(struct xs_handle *xsh,
>> -                       struct xc_interface_core *xch,
>> -                       xenforeignmemory_handle *xfh,
>> -                       libxl_dominfo *info)
>> +static int configure_xenstore(struct xs_handle *xsh,
>> +                              struct xc_interface_core *xch,
>> +                              xenforeignmemory_handle *xfh,
>> +                              libxl_dominfo *info,
>> +                              uint64_t *xenstore_evtchn,
>> +                              uint64_t *xenstore_pfn)
> 
> This is becoming a little bit convoluted.
> 
> Wouldn't it be better to have a struct containing most of the parameters
> (at least the handles and info)?
> 
> An alternative might be to make those global variables in order to avoid
> passing them around everywhere.

Yes, I'd be happy with either of those options.

Thanks,
Jason

