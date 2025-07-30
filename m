Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26DB16853
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064525.1430120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhETz-0007Em-5O; Wed, 30 Jul 2025 21:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064525.1430120; Wed, 30 Jul 2025 21:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhETz-0007Cl-2i; Wed, 30 Jul 2025 21:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1064525;
 Wed, 30 Jul 2025 21:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dkTI=2L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uhETx-0007Cf-Uw
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:37:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2413::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54360a38-6d8d-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 23:37:03 +0200 (CEST)
Received: from SN7PR04CA0235.namprd04.prod.outlook.com (2603:10b6:806:127::30)
 by IA1PR12MB6140.namprd12.prod.outlook.com (2603:10b6:208:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 21:36:59 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::99) by SN7PR04CA0235.outlook.office365.com
 (2603:10b6:806:127::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 21:36:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 21:36:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:36:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:36:57 -0500
Received: from [192.168.18.248] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 16:36:57 -0500
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
X-Inumbo-ID: 54360a38-6d8d-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UywwT5vYk7CRY+nEOhakEQq/+/nseBJ2OSC0U+8Cm8acIJADEWJJcciZ8fBwtKQH4AtZ9e9PF8jaxb1Ol6E41aXzb0BJW0S+BLUlHPAiyCZojmKz2rImYDHp7OCI/5jOLm+Bjm4soJE2nj9oL+gAKcmFL3topK/6mqtgL/P24rU5GQhLfZwllGH/VlGZ25tLRnqTl6rsbZEPmX3l/l9e9kmPDwXRmATwtqT3VJ93v0AU7SEqh/FjHP8XvheXK5aesa1k/6wA1czNEUb8I0lAsx16ChQyn+I1OHA+KmSVmfODATwxDQvwIwCqPhCk6W1tEtdGVOseMaDDVtdJGKfzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v+1xXV2DoetiDSFLfqzm/NEsECW0mFhILLJqc/Qsjo=;
 b=Awmhn2skdNu8B1tPogI9ehI44Lf4FNUemyM11QxWHT/iwuKNksCRPeRyBdnS7klVgByz2qrpJIZPOrAi1jCQdVqPfzjdSy9XiavO5B6a1/rex7D39CWqQQdw6lPCr/5OhbrhWGGaV+dP2LE2TXbcnnAk02qR4yWIB8eWRwf6z4qnj/RO9xAX3De6B16DXWMKqmQ4Sme9cGEBCVTUm4NmzzmVUIWvPncrBmi0DlmsUtMCc73sxo2iYQNNq2/Y8DTAe4kSWpnxJpiVUw08UEkhwzeSMHpbu0S4Uv6+IwhAxQUYRSSqRkNaIkkGotfodHWoLqn1F87AwKKbJF57REkOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v+1xXV2DoetiDSFLfqzm/NEsECW0mFhILLJqc/Qsjo=;
 b=kF8qx8xtyOccPLS/iA/uEmahZOU27xqDmBlG44mdKo7Q95An1eBknddh4QmTMqfMe1eH7S6ukAo9Uy8OJvqL/AiXDiViNumxfTDoZFBv+Fn5CB6m8mgcfoJIOcDXyDWdMvlguNrOLG1tubXekVdYjzlPBwnssX7PGWjGdVhx+ow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4dc6a43d-cd17-4d6a-af2b-3c9f587493c3@amd.com>
Date: Wed, 30 Jul 2025 17:36:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/xsm: Expand XSM_XS_PRIV for untargetable
 domains
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-7-jason.andryuk@amd.com>
 <c8e89f88-3626-45eb-b34b-2ab4f2e8eccc@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c8e89f88-3626-45eb-b34b-2ab4f2e8eccc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|IA1PR12MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a0bf13-36e0-43b7-33e6-08ddcfb1367a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2Z0TDN4WHlpdFkyL3VuUlY5N2I5b3ZIOXNBTVB2QldxRHNKMXdPYVQxKzlY?=
 =?utf-8?B?MW9vbzZVUUNubzBIMXltK2JUU2dWSXZ2cE5JbVY3SDMyRzJXRzR1MUFIQ1l3?=
 =?utf-8?B?UFFHRGMvZFM0MHc0anZmbnh1eHdBdjN4MjJXT29meVh3NlVjdHE2c1V1dTZK?=
 =?utf-8?B?MnZ6TEFQcnFFQW5YVGRZWjFVcWVhVnZZWGNaelZ3cWZvVkg2cWVyYk9nVHBZ?=
 =?utf-8?B?R0I0UlFyL09TZURmWlFTNjduMVZ5RnRaTjJnY2s0SVJTY1NEQWduenNIcmJ5?=
 =?utf-8?B?R2c4V0F0aEJuVFRwUldmK3FBNElRSnJqWjUvZGF0WU5GcWpyKzcya3pxNHV4?=
 =?utf-8?B?RXJrSDJMSWNKcTVZV3VoSDZDTkVkanM2QnQ5dFlGZnJSVytXQW5UeGpHc2tZ?=
 =?utf-8?B?bFUvOVVIL0VpTEhTSWpydTl1WHM0TUFrbnZ5WUppdm1lQk9YcDBWK0FtT3ln?=
 =?utf-8?B?SWhRUEwyOTFYZmZZRFBCT2plQjg4enh0Q0xuL3RSNDhEN1BEWHczNFdnTVFK?=
 =?utf-8?B?RFlzZzBxSnQyMnUwSDRPK01za0xaSTRqeVVrbW9ycHFUamJEd09TYUpHSlJR?=
 =?utf-8?B?Skc1dFlKaXpxVGFMaW1SWERpRFhWUld0dThJTS9JSndabTlFN0p0eTQ3L0JF?=
 =?utf-8?B?VmNER0k0RmZicmpmWkdEVXhGOEJLdjVvTk9WSWkzSksrUHRvT3V3K2h4SEVn?=
 =?utf-8?B?SWdhR0RsOVpCd2hiaXZySEwwUk5GRlhOS1h1VThZNGZIdlVhcG1Eb3pTSjhM?=
 =?utf-8?B?THZpb3hBVDBSZ29rNTlLbkNvWWpodXFqR2RlUUN1K2lkWHowbzZ1T0NSTHZB?=
 =?utf-8?B?VmI5WGZyZUhYa2FaN2t4Y3JDQndYSTk2Ylo3ZHpTZHZObjN1eHJTWkFEdVQr?=
 =?utf-8?B?b2Y0enN1aFNmaWljeFIrdkdRNjJUS2ROWWdYOVE3eEpSQUNkTS8xdHBHcERi?=
 =?utf-8?B?bC9pWWtvamVWV2RMQmUvbDBRU3FVYzgvNDlzL2R5Q201M3N1QkxWbGJhNjU4?=
 =?utf-8?B?bUFRQ20rSWIza3ZmMGFyeTg3aGY4UkxZN0pYOVNDeFRFSUloRkR0Vm9HclVG?=
 =?utf-8?B?YmtlLzJTcHRxeHpYV0dZeTFORXRoL05BbzRUWUJ0NHNaYldReDRTYU84eHQ4?=
 =?utf-8?B?MkpERmZiY3BkVWQzMVk5YUZ5dnNwa2U2ZE45VzQ2ejBleFN5bWJNbXZ2RlB5?=
 =?utf-8?B?Wm02a2I3WGxYTldnbitZWVBMblowci9GOTVZc1M2RlAvZVhnMW5Cd3k0WElv?=
 =?utf-8?B?MURHZnZlbzZjRTZaNkNCTW9Hakh4MitTYnVLZWpXb2tFVmNSYkN3Unc2RVZi?=
 =?utf-8?B?N0JlMVMrU0g1aEpvK0UvcTMxU0RFc09lcFZZT05rUEJodUtpamp0ZWxMTjdp?=
 =?utf-8?B?eFp5R3hvSlVjVUEwZ053ME5vSTI2dW5EOE0rcVdObHA4eVNEcUFScGYwLzBZ?=
 =?utf-8?B?OGplWDBrS3ovb29yS09yUnZXL3h3SjBPdnNvamNPUDRSczcrRC9tTHFTcDY0?=
 =?utf-8?B?OUhOaXJmdjNHODNWMWthOFpwcS9rMXFnU3FldFVMWGtYWHE1YkRFWGRRSDhq?=
 =?utf-8?B?M25DcTJ3eks4VWpkSXZ0cHJ6cVFpSTZQY0NUeXI0VS9XbE1OODBTT1U5d01W?=
 =?utf-8?B?elRMOTQxTGFrZHYwK014TGYzbFJOUXYvMnVvclE3dDhBREMvZ2Jsb3drRVIr?=
 =?utf-8?B?LzlhSUdOZkVVV3orWVlwTm1NazNFT0R4MkVTcHIzSFFnZEt3aEUzQVRkTGNQ?=
 =?utf-8?B?OXRRUHEvSWw1dExjazlhTzJ1N2hMVGVBeFMvc25uL0ZXUlo0M2ZJY25ESFQ1?=
 =?utf-8?B?Nkd3Y0d1Qm1EWlhwZnFTb2F5ZldOSGRIVUlwbFZSVUtYQjkzbHVPSXRaODFT?=
 =?utf-8?B?b1NQc1AxdE5TRDhFVy8vTmNkNllBcnU0V3hYTFA2VkF5VTNRUzN3cys4WEdK?=
 =?utf-8?B?MFF0U1FsOVdqYTE0TVA0bldCbUQwMGFuQ3NISUc5NVlEYW53THorNzlGaFVl?=
 =?utf-8?B?c096MDhtV2VrQXB0Mkk0VnQyeGNuMGRNNWZTTGxJT2YxZURyaXZoc1BPdDVX?=
 =?utf-8?Q?DwQr2w?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:36:58.5951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a0bf13-36e0-43b7-33e6-08ddcfb1367a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6140

On 2025-07-30 11:19, Jan Beulich wrote:
> On 16.07.2025 23:14, Jason Andryuk wrote:
>> Untargetable domains are currently hidden from the control domain -
>> e.g. xl list will not show them.  getdomaininfo fails on the
>> !is_hypercall_target() check in XSM_TARGET.  Add control domain to the
>> XSM_XS_PRIV check so it can pass.
> 
> This feels like a pretty gross abuse of XS_PRIV. It once again supports
> my take that the level of granularity you want will require Flask. Or of
> course you could also come up with a new access control mechanism, much
> lighter-weight than Flask, but still not dummy nor SILO.

I considered a new XSM module, but it just seemed so close to the dummy 
policy.  From my perspective the board permissions of 
xsm_default_action() already implement the coarse permissions we need.

SILO works well because it builds on that and overrides a few hooks.  A 
new XSM module would need to re-implement ~every hook since 
xsm_default_action() needs to change.  So expanding xsm_default_action() 
seemed like a better approach to try.

> As per my reply to an earlier patch - whether it is okay to prevent e.g.
> "xl list" to see all domains is questionable as well. I'm not seeing
> "interference" there.

Yes, hiding domains from xl list seemed like it was going too far.  A 
system administrator should be able to see everything running on the 
system.  That's why this patch allows it.

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -87,7 +87,8 @@ static always_inline int xsm_default_action(
>>           fallthrough;
>>       case XSM_XS_PRIV:
>>           if ( action == XSM_XS_PRIV &&
>> -             evaluate_nospec(is_xenstore_domain(src)) )
>> +             (evaluate_nospec(is_xenstore_domain(src)) ||
>> +              is_control_domain(src)) )
> 
> Like in patch 2 (in is_priv_domain()), I think this wants collapsing the
> two evaluate_nospec() into a single one.

Ok, thanks.

Regards,
Jason

