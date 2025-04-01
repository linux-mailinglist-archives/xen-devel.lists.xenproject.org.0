Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE28A77B25
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934002.1335849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzau2-0006G8-K8; Tue, 01 Apr 2025 12:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934002.1335849; Tue, 01 Apr 2025 12:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzau2-0006Ea-HA; Tue, 01 Apr 2025 12:39:38 +0000
Received: by outflank-mailman (input) for mailman id 934002;
 Tue, 01 Apr 2025 12:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neKF=WT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzau1-0006ER-EV
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:39:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfe58ba-0ef6-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 14:39:35 +0200 (CEST)
Received: from CH2PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:52::20)
 by DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 12:39:30 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::e2) by CH2PR04CA0010.outlook.office365.com
 (2603:10b6:610:52::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 12:39:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 12:39:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 07:39:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 07:39:28 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Apr 2025 07:39:27 -0500
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
X-Inumbo-ID: 5cfe58ba-0ef6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIc0jFuX1sG8qthipMKzXGCNFEP9fEba+MY454aWT47DqJaNUlgGXlx8N/Bm2+rrd01sZp2sYoBufGBD0gx2oSc8WHzehw661niKFeJcTPx+37tYi5i6NrEARniYNANkYnE/Ram4+DDg7x4Urka5QjHekBD/5eMlkuuM1/1H9jmbQDCY8akyVizIUjhxeE0az4xPxSM1leMXNWRKegnfETtdYwBxO+w68rEZI1DW8/5qBX4CFNlvtkJNpQRqzw4YzwsVUBHNKepu61B/pR35KTMPsEcQ+g/ICI3oq3nxfPj2UqRiCAOOzDc+56Kd1ZvdtOC+LRCgBg9Da4Mmn1PUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl5YIREPVy4diKHm+UdWDNY2Fzpg+ZBzCB3gMcTj42A=;
 b=kh1HCqAGWRwsTLN+nxQ63InF7Awi7uTq8EKyIOjaotD97CIltxmj2w0FeviWSU5IVuzULo7x8CkkPH9TUbotG8L0f5DtZET8cdBGKKH5zyp3oGUlJweVcABlpC7yCTIaD5gomZymKjRA7TkA4ORWLTmoVggfl6GIQyNmtt8RznXWLYNqLOWfhChh+3tyo8YK3KqhZbwzjJ5zrW9yCdhKdGtILXtHq1vYD48/jSF4PD7LiW3CQdsTWwWojuCNVFjlcOFrRr/I1cOTvFzXXGBKlLOhC48HwrKWvYkHbFsPjnw4m8YOmMg6gLwiB/a1K+hNSnqml98LiepujnkdOt6gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl5YIREPVy4diKHm+UdWDNY2Fzpg+ZBzCB3gMcTj42A=;
 b=bWTbkobCJfaJLuh2O48Q61TrGwCBJjL0gkn2N1hD//xxgm5ZSDwx2fnXUdlvYlxdDSdS4Ozlp4Vy8j5bxzw9fNrfaoWDnPgDADAZz9U4vFc8BbrRJnvn4yYtrUs+VXhLHXhr2uX9Vn7RGVEtDXTi8rUBwckpoEFCThIatV/V6cc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d2f986dc-db9c-43ab-9e46-702b4f94af31@amd.com>
Date: Tue, 1 Apr 2025 08:39:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen: introduce hardware domain create flag
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-2-jason.andryuk@amd.com>
 <049a2acc-09a9-43b8-9937-960ce2b99fda@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <049a2acc-09a9-43b8-9937-960ce2b99fda@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 659fa37e-5f70-49c4-6b5b-08dd711a3eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTJXWmZMcEFTNGF2OEhHZ0JmYlUyWVdJMU5WTzAwVzdrbmh2WG1qZXlmRUc5?=
 =?utf-8?B?RGcxSlc4YVVPaW5ScHVjQ1NwZDBKMFB6aWM0ak5PYjVlYlFwY3ZwQlB6aWd3?=
 =?utf-8?B?dlhxbUJocDliajlXMXpobW8wQ0hsWVdFbWFkeG5qMHhkWXQzaHR4YjZ6SjFG?=
 =?utf-8?B?NWxjdWRhdkFKK2d3MWo2NHptSThSWC83ZGRLNmFWaytMQ3diQUI4SnA2WkZu?=
 =?utf-8?B?L3dxUjFtV3d4em5mcUc3bkpJQmZIQmg3dU51K29IWkE1LzFvS2RQZk4xZzha?=
 =?utf-8?B?SElLUWJub29kcVRqUFE4eTVRZkVrR3NzTDdLMnNHZFBMZGJjb0xNc1FFQ09m?=
 =?utf-8?B?aWM1NGI0RFNMY0lUQy9EOFdCZXViWTVRZS9ValBvN3BOc0VGWSt6bzZvNFpz?=
 =?utf-8?B?R0c2NitUWXBvTnk3MStZem9qTm0vZFhDQlJXcHpoQ3hnWVhicW9VWXJiWnZk?=
 =?utf-8?B?ZVdUYnBPMk5qY0NxYWFxelZpa1pZNWFqRWFIK0NNQlVtdnNSRXZWQkVJWC8w?=
 =?utf-8?B?NlZlS3ZWT0xNMVovQWN1YnBFbEdGU2gxZS9jbjVlei9PeUVDV3JBY1drQVhm?=
 =?utf-8?B?YWh4eWI0Y1Y3cDB5TDBvc1NTTExiemp2WGtpVThQUEhnSnpmOHNkYm1pdWZa?=
 =?utf-8?B?emM1UkcvMjJVNEQ2SWJXOVJzV09BZFpYZkJEWnF5S3lRSVF0YUtOUFV5aG1V?=
 =?utf-8?B?VDRHdnBPMUF5Z2NTS2hkWTJhSkJTTkNQS1V2UWRMSlkvYVk4Yy9vVFJRL3pC?=
 =?utf-8?B?VytyVnp0WDlPQ2dOVXB5WEEwaGRWZnpOcEVjYmZkRGpud0ZwZDhBeXBZWjVv?=
 =?utf-8?B?cVpxWWNlMmFXdnI3N29wdWp0RU01RjVrblZhVlJUelZQSXBDYWpDcFdlWG1z?=
 =?utf-8?B?emhXQkFsWDRzenhuRGs5dVZSUldmYnpGS2tjT00yWWFyUGVKblh3eUZHU0pC?=
 =?utf-8?B?bmtPcHlDak93VFBLN3NDOVNyc2pnZUphV2RNVnVzWndOKytkdjVqOWJ6LzN6?=
 =?utf-8?B?RExEQlJ4aktlRWZXblJLaWVXMURvaHRzUmZsdjlDaWEwR3diVXI0cTZSbDVY?=
 =?utf-8?B?TysxVjlUeWVCUW1RcDJFTUtWeFdkeVVqbFFPdG9IZ0doQnJoM204THZHV0d5?=
 =?utf-8?B?eldwM1Z2U1RzRmM3Zkk3eE5KMkJ6SUhzOVdLVTlUZmNqUG1FdHpIUHdDMG9v?=
 =?utf-8?B?RTNubTJEVUpXQXVEaHc2U3JsSGhhK1hkWlNocDBpUnBJMDh6blZ0cHhQSkEz?=
 =?utf-8?B?MVovL0ZSM3MvQ3FPRytyUGh3dlJBNWY4UTdvbHlwTm84Uks3YVJzWGd4Q0ZG?=
 =?utf-8?B?dks1bm9ISVFCZVdsMW5nYmxNQXRnQkJyWXlXTTAza05lM2w0dVNpSlNoZjkw?=
 =?utf-8?B?aWtkeDAyTGErVXZENmdLbVRNc1NIdmpCdDdEUy90ZHlMOC9jNFE2WDFGcC9R?=
 =?utf-8?B?ajY0QzBkdmhFejRXQ2MySTJRQmZYQ1RlZ2VQcnY2NktMOWJ3Y0FhK08yMDBF?=
 =?utf-8?B?UmFwUU5CMlMwWVVQNGV0eXBJcGZPVFdwL1E2OTBzM09RS2M3eDUxR1h6NnhB?=
 =?utf-8?B?dmZXQ0tpYU9ucXg2dkhkK08wZnEzYkFwZXpHTmtlcERLcVhoUm83YkR3OFJo?=
 =?utf-8?B?Y0VkSURlclZuT3daR2xMa3REaTVEL3pLRkhxajBmUUpZMU5FYnhpQldoYi9x?=
 =?utf-8?B?MWFwWEhORStzTXRKaG55ZjI2YUxEYk9BRzF1M25VM3hBUFlsRFA2ak5WT1hp?=
 =?utf-8?B?V0NCUE9SNjgxZ1o1ZUtnOTg3WHlnREFzWmdXMFhYNW9QU1FDSHBKM1NHVzh4?=
 =?utf-8?B?elhmeXdWY0pJYXEyN2lVdmJSaFdhSFBhaE4wVnBxYUVNU1pWbDhpVWs5NnUy?=
 =?utf-8?B?ZTdBV3NoK2Z0VlJid0M2OXZOcmdsS054eW1NM1JhMHU1YjVtZXZLeHNvb2Rq?=
 =?utf-8?B?VTJVcVVhZzhFd1c0SlFVL1pJaVN3Ukl1RHk4dVR3YW1QdHl6TjVVNGZ4U1JC?=
 =?utf-8?Q?3EK3pyFyHfXvee11bNcpcMSIj1JbfA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 12:39:29.4285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 659fa37e-5f70-49c4-6b5b-08dd711a3eee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274

On 2025-04-01 08:00, Jan Beulich wrote:
> On 31.03.2025 23:43, Jason Andryuk wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -820,11 +820,15 @@ struct domain *domain_create(domid_t domid,
>>       d->is_privileged = flags & CDF_privileged;
>>   
>>       /* Sort out our idea of is_hardware_domain(). */
>> -    if ( domid == 0 || domid == hardware_domid )
>> +    if ( (flags & CDF_hardware) || domid == hardware_domid )
> 
> Since it's || here ...
> 
>>       {
>>           if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>>               panic("The value of hardware_dom must be a valid domain ID\n");
>>   
>> +        /* late_hwdom is only allowed for dom0. */
>> +        if ( hardware_domain && hardware_domain->domain_id )
>> +            return ERR_PTR(-EINVAL);
>> +
>>           old_hwdom = hardware_domain;
>>           hardware_domain = d;
>>       }
> 
> ... doesn't this code then also need to set CDF_hardware if it's unset
> in the function argument?

I don't think it matters today - later construction depends on the value 
of hardware_domain.  Which is also used for the check underlying 
is_hardware_domain().

But I agree that it makes sense to set it here in case the use of 
CDF_hardware expands in the future.

> Then:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,
Jason

