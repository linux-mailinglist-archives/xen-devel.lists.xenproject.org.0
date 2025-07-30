Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22771B1684C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064519.1430110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhENw-0006XQ-I6; Wed, 30 Jul 2025 21:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064519.1430110; Wed, 30 Jul 2025 21:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhENw-0006Uu-EP; Wed, 30 Jul 2025 21:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1064519;
 Wed, 30 Jul 2025 21:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dkTI=2L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uhENu-0006Uo-Ri
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:30:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 753252d1-6d8c-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 23:30:48 +0200 (CEST)
Received: from BL1P223CA0032.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::15)
 by CYYPR12MB8991.namprd12.prod.outlook.com (2603:10b6:930:b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 21:30:45 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:5b6:cafe::c7) by BL1P223CA0032.outlook.office365.com
 (2603:10b6:208:5b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 30 Jul 2025 21:30:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 21:30:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:30:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:30:44 -0500
Received: from [192.168.18.248] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 16:30:43 -0500
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
X-Inumbo-ID: 753252d1-6d8c-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTuIpymzwDBwkgwgce5xC7ZPdoG0yw8t5KrwjHrWw6khpHb0Es3ZyXCsOJKPVHcO8sveGbtPG1BhndPZwQSL6gEkaUXWYcJwHU620WAk/HbSb7dEOEDnJcPKUSeRAwrr+wZ0dG3bq9u5E+beUvXuGgCYfyLW4P3cj6pYsb5+iZw+k+Ji24Esduk2Y25BK+axVTaa9fWUFTeDHho4ynv5UZMVkATUTey5iEZeoxq7Ru//H6ZncYAA5GHaN6uqhOz59rA1LG+/+bGAk36oWu+hp46yqjAFLqS1RzQOHC9IcBHXINCJWlTx5jVuffVIv7SnF2imRmwhAowkiXVmrCbbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc4EnfLX1MA0bMFbQ2KC0kWa0Hk1oFGi7KzIMJVQrA8=;
 b=pbp40SElGdasC4+Yo3KwHSxHF5tR52Eq8580LmZeu/whftGr702MvIrOZyn6czFaW/nkNEQI+OVmpXZGHXxrwZv7u0hV+Oks4SbJpg89M5zVgunLj0dNbHgV/2KFapDwm6enGoybzmcUjWGqwNx0tNnT/P6tKcy0oTFfWRB0IdpXPuCG7In+spYkkeGJ2ggAVfUvQeRsaCdWRTPDd7JGmRmf3n3rXozQP5YbivYilht0Zq/i0hAK1JtL0P4uHIfNULBUbwOd89ml9cr6EWM7hkE5XLa8F7MBFnS4oAPVq+jB1sQk1Hr2AJiTBBamf4M1LaSTIDkgGaSVpsXfZca0cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc4EnfLX1MA0bMFbQ2KC0kWa0Hk1oFGi7KzIMJVQrA8=;
 b=pnahIEg7xH5Dz3ldqp4wQ9X8iCeCYxYlb8pJ6sTxc7Kb8uYrCMVPNZPtMuyR4bpzWP+mz0KyY3v0w0zNAKsqbQpUSfJecFOiSwGb809A+lv+JyMe2J7la6x3HAq1X0VDET/Bkq9Zvw66ovb5FvK1u1BhkRzzVME/dENJ9lLNrBg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bade3386-4296-4e4d-8eb2-840f2ac07b93@amd.com>
Date: Wed, 30 Jul 2025 17:30:43 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen: Introduce
 XEN_DOMCTL_CDF_not_hypercall_target
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-5-jason.andryuk@amd.com>
 <222ea3ed-8ce3-4622-90d4-763bc0fd1217@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <222ea3ed-8ce3-4622-90d4-763bc0fd1217@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CYYPR12MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: 53df2386-2a53-47ef-26ff-08ddcfb057d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0hHT3pMN3JTOE02SExEdUI1TlFRMHNDMjNtcjJ5Q3pWUVNDdW1zcGxSTVdo?=
 =?utf-8?B?UXlOUGtsajd3WTNaNDRCTVBidlhLY0lHQUs0UlFvRFd1N3FTMnFxRXl5bkRJ?=
 =?utf-8?B?R3A5YVZOMzFIaGpRSE5jQVVTVzVkMjV1eFVWeG4ra1RKNmVpdnZJV0d4MXB3?=
 =?utf-8?B?cVU0Y2hxYXM3cXZYWVJUTWpLVFZybjFOclJtWDFRWitJWUlhb1ZxVktNd0tO?=
 =?utf-8?B?eW42WGxwSGgxQjhQeXJ2WlVEMDR1NHRYL2E3UndnNmt6U0RJRjF1U28rakRl?=
 =?utf-8?B?VG1kejNNV2xiNEhHb3pIUFpjYTFRWUVqSyt3TnhBL3l6alRHQW1Ld1EyS3Nl?=
 =?utf-8?B?M3Y4OURxdWVkN2RLTkRuaU5obXk1MGJiN0I1RG1QV0ltRVdPTWVPRml0TGQx?=
 =?utf-8?B?YTBsVHg3dkxXQk5HZUFHa3lpeVVaNXlaL3lDdWZ5UTlTTkRLamUzVU4xcjg0?=
 =?utf-8?B?NHBlUEFwazV5VGkrZndiUUlJZFR5MHozS0g4eUhJZ0VZTUg3ZVBIWlpUZFZy?=
 =?utf-8?B?ZzNHUm9TSjI1dCtNOG1heUdMWDQwRUIyU1VmVjdpN0oycFVoZnI2RkxXOUwx?=
 =?utf-8?B?MW5OVHdNd2dJUmlqa3VVL2RsVGc0dm9TcnhMSXV5SXF6bDRnbVRiRytscjBN?=
 =?utf-8?B?TTl2OU1xU0tjemlEaEdKd1lmM3lIRmk1eFUxRlp0ZjRrY0FlVVJ1eWdNQVRa?=
 =?utf-8?B?Ry8rbHRCRXVlQ2YyckRsVnBsa0t1cnZWVzFocDh5UHFnak50M2l0WlcyKzFZ?=
 =?utf-8?B?bGQzK0N0aS9kbU8zTWlrMWxBcmphYzBvNTJtYkhuN2ZEb0VQNlVsMzZiSEtP?=
 =?utf-8?B?dlB6ZFFsMHZiU3pUbk5WWVdjYjZWREpoYkFxQVBlTVZwSHo2Vzl3aURpNm9R?=
 =?utf-8?B?Wk1heFBaMzZKZjBBeUJ2V1o4blVzZjB2MEhKMzRUTzRlSUF0bXZmQmJvTWJE?=
 =?utf-8?B?UnRoRUM5L0ZySFhWOVFIR1B0U1gwRGZJNDZEWVN3a25HOHZsT0ErZVkwMk5r?=
 =?utf-8?B?MERQZlpldTMvZ0V0NVZrSUZtMGF2VEJVK2JTOHRzMjR6ajhpWDREb09nTkp6?=
 =?utf-8?B?Y2Y3UksvZVBZalNnY0ozUUFXeEV1TUw3aUFXZElsMjJLUHNBVFUxdlZnMWFm?=
 =?utf-8?B?b2Z3ODliSWtZcVFjbWxtT083YU9WUjU2TExMZkVucm90UlRzQm5nelplV3Uw?=
 =?utf-8?B?cjRNWGczL3ZjbWhLQndhL1VKM09mUEh5OUZzamxiQjI2N1NVeWFCR3ZzZGlR?=
 =?utf-8?B?eEYyMFdPVi9YQWdxSTRhaFBxUUMxM1hnK1o4TzNLVDV0aGlyZEhyTmNvWEY2?=
 =?utf-8?B?UlJISm1JRFN6YXJaREh1eWVmSllxc2kySUpDMnBvV0JLOEsxMTVzNzhJT3ha?=
 =?utf-8?B?TE9kMWhUY3hkSW5WL3d5VFNYbUdMbTJLYWJGTjREQUxBZzA5WHhwU3A3WldB?=
 =?utf-8?B?eHZCc0FYNFB3ZDlpUGRSeHgyRXZXNmZKamhHT3lNSjVUclRyOUNwVnFQSHU0?=
 =?utf-8?B?dW5YN1dJNm5xUWkwb25LMmhSOVFrZTFrQUtKTFJuT29oZGtXZUhTREhkVFkz?=
 =?utf-8?B?cWJUTDdwRVpJNnI3ZklYeVVvb1A2d3UxZU1mVW0wczROUUtYNDNtZk9rdGg4?=
 =?utf-8?B?WnNxdHBzcWU5anB3SzNmRXJEMGdIcFNFUk9oV2pQUG1iQS9tdm83akJkamww?=
 =?utf-8?B?SVMxUTVEWnRrYlB2QWd5UW1lRTRLaHZQQi85UUNSbkpWSWlwcUtLdVpaQ2Qz?=
 =?utf-8?B?dlVRU0Vyak9lTEd1OUpRM0ZaN044SS96dXFhaEh1ZThvZHVPUjBGTTBXTExS?=
 =?utf-8?B?Mk5qWm01cm5RNTlRTFB4b1dFVmxFL1JUcjZZMk81UldpNi9EQlpPS0ZjUjgy?=
 =?utf-8?B?SThTQkFJVCtubzQyOEtvbEYwVDZsYWRET2tydUJ5ZkxteFhKS3ludklGc05u?=
 =?utf-8?B?SGNUZHFaUDk1Z2R3ZTN2L3dkaDZ1aU52am5BQlFkc3ZncllTbDc4ZjdIN2Rr?=
 =?utf-8?B?UHNVUTlONzR3Qk5scjhKcmNnU2l6SXAxaFhwQW1HbkJjRi9INlIzODJVZWRy?=
 =?utf-8?Q?2SmrAP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:30:45.0558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53df2386-2a53-47ef-26ff-08ddcfb057d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8991

On 2025-07-30 11:06, Jan Beulich wrote:
> On 16.07.2025 23:14, Jason Andryuk wrote:
>> Add a new create domain flag  to indicate if a domain can be the target
>> of hypercalls.  By default all domains can be targetted - subject to any
>> other permission checks.
> 
> I think terminology needs clarifying here: What exactly does "targeted"
> mean? Is that e.g. also intended to cover
> XENMEM_{current,maximum}_reservation, which "target" a particular domain,
> when at the same time they don't interfere with the targeted domain in
> any way?

Avoiding interference is the primary goal.  Those hypercalls definitely 
need to be blocked.  xsm_default_action() has limited information 
available, so we can't differentiate particular hypercalls.  Blocking 
extra non-interfering hypercalls is not a problem for us.

>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -91,12 +91,16 @@ static always_inline int xsm_default_action(
>>               return 0;
>>           fallthrough;
>>       case XSM_DM_PRIV:
>> +        if ( target && !is_hypercall_target(target) )
>> +            return -EPERM;
>>           if ( is_dm_domain(src) )
>>               return 0;
>>           if ( target && evaluate_nospec(src->target == target) )
>>               return 0;
>>           fallthrough;
>>       case XSM_PRIV:
>> +        if ( target && !is_hypercall_target(target) )
>> +            return -EPERM;
> 
> Hmm, for TARGET, XS_PRIV, and DM_PRIV we're now doing the same check
> twice.

The different cases need to be covered somehow.  I didn't see a good way 
to avoid the duplication.

Regards,
Jason

