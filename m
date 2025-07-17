Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB9B09557
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047388.1417868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUpK-0006te-8G; Thu, 17 Jul 2025 20:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047388.1417868; Thu, 17 Jul 2025 20:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUpK-0006rE-5H; Thu, 17 Jul 2025 20:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1047388;
 Thu, 17 Jul 2025 20:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucUpI-00069o-A8
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:03:32 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b39612a-6349-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 22:03:30 +0200 (CEST)
Received: from BL1P223CA0039.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::10)
 by BN5PR12MB9487.namprd12.prod.outlook.com (2603:10b6:408:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 20:03:26 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::6b) by BL1P223CA0039.outlook.office365.com
 (2603:10b6:208:5b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Thu,
 17 Jul 2025 20:03:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 20:03:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 15:03:25 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 15:03:25 -0500
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
X-Inumbo-ID: 1b39612a-6349-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdp80vbjCTGz5P1Wcq2R+XcyH1qnX+qOuCT/FqhjrWBjnbQzAsHRAfR8fsxZsGU5ru5P86Tjb2rnUEwGzsfNe/ai1vN1ybrS1dhHv80ELqqBVV3gBuLfSaFX1RNLn02+M4gU2XJhUDzFvyLVEvssSW+lb1ZNRM8tIRmfIV8GzCpHVyQSdfjVXTkrn9dUnFKWqewqwl3e9RTVftOM5FBX1rjCscqG4wIglWoIyiDH5xX+XUErNJlc3HncDs8CwFIj+csVG5SkjDn42E3DBfWDhg6lpZFFFPcZGhBAzsbtfrqnMQlNrhjX5TyYj3HF49v9p3eD3FevEoV6KoqjE0bVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJJfQHZMwoiMiFvNjuHEHJzOUaC+uV1I4oxU2u9+lUg=;
 b=JzUSVtC8vA1h6wupfYo+S4KTfwnasJVf7tlarD3QI1F7LzBJ1kSvoShNIjXcr0DC6rU/766tOGuzv97Tj4P7C9g0pcxITY2kDqKQdOc47RSA1wkHMaUoEjOZW9ChVxo621lLZ2bzB0reXqSlv6GnS7Lkz93H9CVwYjUW5Gn1nTTpwRmsAndVhBu9brewGMVk2DJYLyOz4zhCwkfJRp89IgSl0BUScXx+/4erz5Yy+mPqd7BewrQKa0olFUcSTu25AQMIMdzn6bTNlA8830ydeP6dllb/pv1x+cRWQBqnqgncU0HiiKrXu5GrBOFKSypBSmFs4p4hljvdkGh2zJZYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJJfQHZMwoiMiFvNjuHEHJzOUaC+uV1I4oxU2u9+lUg=;
 b=YyRFI/VaPwHmfXc+8TWNMuYbV6TOUZ5iqF213JVaZnnc1cKeY318ZeA1b1fd905x60/XH6x+S2165ACRsEYYgzYTbYvnv7cWKTITnkGNdpg8zmlSX9fX7UA93yCTnLwor3G4MOuMULDo3HnXf6/K0zqiDi9dN3aIep6vNo8eDok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d5962c3b-1f0d-441a-bcee-ca1a32d4ed32@amd.com>
Date: Thu, 17 Jul 2025 16:03:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] tools/xenstored: Read event channel from
 xenstored page
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-11-jason.andryuk@amd.com>
 <733227fb-7573-46f8-9c91-11470cab0e31@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <733227fb-7573-46f8-9c91-11470cab0e31@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|BN5PR12MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d26e1c5-3723-4d59-5c72-08ddc56cfdd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHV0cmxSQ1ZGZlpCeWRxTzFWSkNYdEVXeU5QbmgwWlYvajh1UE12UERWSXNn?=
 =?utf-8?B?a3BQMFlaRksxR2I3aW1sVmt3UnpwUjc3YUpPdEhjaFRXRXdWTGJKc2o3eXh5?=
 =?utf-8?B?ZTI5dlV6QUZZNHdJeXVvbDA3S0Q1UmtWcjFOODlKQk5PSmJWU0QwbVZMV3Fq?=
 =?utf-8?B?aFlaWTY0Y1hPUTNlUjFpeWhtZEJvMTE3YlI1clk5cnJ4MmlQZCt1OUQ3WTVx?=
 =?utf-8?B?NkJiWjFmSzlxM2EwNlRvb2N2SG1oUDBQa3YyRXZhQitBRHBZS0ZSZTRzbVRR?=
 =?utf-8?B?dm1TY2x3NVAwVEhnbUwxMStrTzhWZEFnRW9ZN1VENEtnRitva0lLZUs4ZjMr?=
 =?utf-8?B?OTNtOXpPSG5Qd2ZESFREK3hiUmdxMlVKcGNrMDlZWHE5VFBkUUFvb1QwRERY?=
 =?utf-8?B?d3FydnJBUTFYVmNsb0w0dEhEdG5ZdThKQkNVTFMxOW9INVV0cDJGQ3NoYnVi?=
 =?utf-8?B?L1VnN0hjbnFYWXFtRFBSLy9SdncybDRGMnlRcEhDWE4ySGdjY2w1ZEJNekpr?=
 =?utf-8?B?QzJGTW5uWXFEc0VPdlBmbVR1K2tPb29EZXFnWkxjcnZZakZMdkFIYzlGVUJP?=
 =?utf-8?B?Q0tDV2pXbDFrOGdCM25jVk5VNUJwVm1DcFBHTktFbitjOEpOT2xQWXgwMjJW?=
 =?utf-8?B?YmFNd2MrSkZleVJ6L1g4alZZLzBUK0s4clJwSCtjZFZ6N0lFeS9WNldTNUtE?=
 =?utf-8?B?cWdJOGhOSnc0bmZqYkpSenc5RVEvUjFrQStHL283R0tNTnJveHBoelMySXlW?=
 =?utf-8?B?TTNud1dhOE5VWWs5T3NSZWhJSUpsLzBBTXRZbkQ2Ymo5eXhsNlFJOFBGaS9D?=
 =?utf-8?B?cms3Z3BZV2pJTUtFTnpzV1E5NlArVE9GWEVycmE4bTEvcnNTV2Jlc0dmbEpv?=
 =?utf-8?B?eUZsdFJsZStld3V1NnMyWDR6Y1c1bEZHbEhFSHl5L2VoZWhrYzdxVklNanlx?=
 =?utf-8?B?Y29ORGhBbmpiSEQ0V2VNOFhRclNOQUJ6cFdmSmswY0FSOGphL1Z0NVpqdGlq?=
 =?utf-8?B?VGRvWll1dFNBZVd2em9YZ3dTSkpQYnJsN29mRFdFaWFJWnViVy9LWHN1MzFM?=
 =?utf-8?B?dEozZnNNSDZ1QmM3cjRSZEVxRXVqYnVEUkovMThDa3BVNGF1R3dvYkk4eXZM?=
 =?utf-8?B?ZEplUGZ3WmdHSlk2cmdrSzQ3TE8wUklFa1ZsMVlJOGNUNkFZeDdRVTRHOEF6?=
 =?utf-8?B?dm1naHIyeG5NUDhrV3RIT091Wkh2S3dnUFYwY0Z6U21XL25CZThnSlc5c2xT?=
 =?utf-8?B?VzlNS1NBR2pWOUhRODQ1Q2xWbzhmdFJWNkJsUjEvMTZFQWJyaDFqSWtoTm80?=
 =?utf-8?B?V0xwNXlidU5IaExGYWdMd2hKSWp3YnFpVTE4VkxMU0o1Nmlqcml4cmR0VHc5?=
 =?utf-8?B?OGlWV25wYXZxSTBtQVFsRFhSdG82L0tQRlJsY1hpdTBLRDl3RW0zaGpuUnlS?=
 =?utf-8?B?bEpITVpNM1d3SmxVcWNlYWZ6eCtUR2YwVU5zbzl3eVNlYVJkOTMrVk1CdkZJ?=
 =?utf-8?B?aHhkQ1Q1RkhxK3oyQkRhME95L0JIcUZPQUdpSHZyTlhLWHdCbXlxaDM5Ukc1?=
 =?utf-8?B?bnROVkJpUVNKT3JmaitIcEJjL0pOS0dXT3N0NmpSSkMwb2Z6clI5dGxsdjk2?=
 =?utf-8?B?Si8rbXZ4NndIcXNNOFdsTWM4NTBDY0RFYUc0UDBrclUvUlN2YkVBZzEyVi9p?=
 =?utf-8?B?NGtOSitFOWIwR0pqVEI2cVl6eW1hNUdrY0NBcEpkczBRaEVYY3htVEpvSk9R?=
 =?utf-8?B?ZzhwOG80K3lKY2pRcVJ0R0NGWWV5WkQrOENnYzc1ZStpT1BFOWI4M0F0c1h5?=
 =?utf-8?B?VEdXZDAwLy82Q2NTakZyVjN2Tk82dDh4emwxeHNYVUJMZDNCeVY1Q1RNaVRw?=
 =?utf-8?B?c3IvUVg3QkRTUTNKTVBnaHU4WUJPZ0t2eExHVERMWkh3Qlpub3Z3UEJpTHFZ?=
 =?utf-8?B?bVFYa0k5ODU2UUlJYzMwMGs3RG5KK2F0U0x1RkludEpwRGhYRWc1c3I5M3lo?=
 =?utf-8?B?ZkFHa2VxTjZkZjU3dFcxLzBScENKU0MwR080VXR1OHl5Q2NpSG0yQzVFYnV3?=
 =?utf-8?Q?WNdTZQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 20:03:26.1858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d26e1c5-3723-4d59-5c72-08ddc56cfdd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9487

On 2025-07-17 02:22, Juergen Gross wrote:
> On 16.07.25 23:14, Jason Andryuk wrote:
>> Make introduce_domain() use an event channel from the the xenstore page.
>> It is only used if non-zero.  Otherwise the passed in event channel port
>> is used.
>>
>> The is useful for a xenstored stubdom to configure domains autonomously.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   tools/xenstored/domain.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>> index e1d5e8d614..94b2a1eaa7 100644
>> --- a/tools/xenstored/domain.c
>> +++ b/tools/xenstored/domain.c
>> @@ -1021,9 +1021,15 @@ static struct domain *introduce_domain(const 
>> void *ctx,
>>           return NULL;
>>       if (!domain->introduced) {
>> +        evtchn_port_t iface_port;
>>           interface = map_interface(domid);
>>           if (!interface && !restore)
>>               return NULL;
>> +
>> +        iface_port = interface->evtchn_port;
>> +        if (iface_port)
>> +            port = iface_port;
>> +
> 
> Any reason you introduced iface_port?
> 
> I think you could just use:
> 
> +        if (interface->evtchn_port)
> +            port = interface->evtchn_port;

Yes, I think this would be fine.

Thanks,
Jason

