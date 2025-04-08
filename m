Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DADA80D04
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 15:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942187.1341442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Pf-0006Yr-IN; Tue, 08 Apr 2025 13:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942187.1341442; Tue, 08 Apr 2025 13:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29Pf-0006Wx-Ev; Tue, 08 Apr 2025 13:54:51 +0000
Received: by outflank-mailman (input) for mailman id 942187;
 Tue, 08 Apr 2025 13:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQ/n=W2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u29Pd-0006Wr-DS
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 13:54:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2417::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c75e9f-1481-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 15:54:47 +0200 (CEST)
Received: from CH2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:610:54::12)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 13:54:43 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::57) by CH2PR11CA0002.outlook.office365.com
 (2603:10b6:610:54::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Tue,
 8 Apr 2025 13:54:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 13:54:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 08:54:43 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Apr 2025 08:54:42 -0500
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
X-Inumbo-ID: 07c75e9f-1481-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1ovcY/lpWIf06zV8wmvi1SxK5ScJURHXb7HSqoF7vmP9syDsazRaeyIMZ4PO0OGcE2+V0/rrLjocW8lCXPgx5J9FITf0l/98F3aSn3QInkxtdOXcYlLJvyhEhkFpTfF7+8aJpZwIHWXT4G81QKbV4i916iDPFOUwIe575OFR7d8eDb64IDeCTLIaeJ3wA8QDD/29g/cwZcGHOvJEbSCUmPk89bAMyDSZ5FDCxPHyds9IPeAMX9D/Zuh3Gg7YK8kn9JssXxDhf/j5/S1e0tAM3C0C1deUH9lxG+U/N8Fk5/Ssx7M5OD+Hv/zXfEkehAHboWYgNz4q4XsZgiUgYrq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA1/TCjzeqqYD02HZ5fD+5JeIdV1o87pIQuKSETAJT8=;
 b=L/BjgSd21tcHM0pakzvzJOpcfmEdyzAaeVT1tyIm1gb31eaDNK2m9rSlMqLjl5aWbO8x9IZ8YMeUeazbT6d+rbb0O4k69VRRUaNnrg/mZasqk2JdjUD6ZXFFIRssXimXv7Ym4QDmk92+dAqnNIO2+PQ0Xz0qaB4//FmEYuUxmDkClNx2+GYs/lQfZ36DJFvghR7w0qfpTPsMBoBMUwkehfqhNZwM30ZLELacfun+D+zCccY1QgX43zM8/S8A55uenEzfT8kW/b1IR9BF9YPI3fXNrASrKEXW24PB8jLdVylNJ8XonydpszkHhTXd7bDwI3GQFBCbGbcN42/5po4z+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA1/TCjzeqqYD02HZ5fD+5JeIdV1o87pIQuKSETAJT8=;
 b=QvRTLqTm7vmSSERPN7XQ45TjaMkJuNS3dhFRx7eBSIhxeNiJ17qpX7jiCZXWhpz3sR2Vywghuuj+LNdkPgEPk+nTNoPfiRd1w9Vep2in/VD0jYTnGFmPl71pc9pgJ4GxXT96ADhwMJWqLo4eBsMkxj4SwDYZZtIYwEDcXrxnyIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2843a46d-0b30-4fa1-b8de-b0030a98e636@amd.com>
Date: Tue, 8 Apr 2025 09:54:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] xen: introduce hardware domain create flag
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
 <20250407194038.83860-2-jason.andryuk@amd.com>
 <b032e7bc-61a4-4dac-97c1-171771869156@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b032e7bc-61a4-4dac-97c1-171771869156@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 37327ee3-1d93-4ce8-890e-08dd76a4ea65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2xxWXFEMXYwTmNiL0VZVXNRT2lENmd5MUxMQ1liMEZaWW8yUzJjSmhHYXFU?=
 =?utf-8?B?bzliL2hITUdKREJ5anJ3YW9EVkNTb1NVc3EzU2lZS3hRRm9UR0lUTy9TOU1v?=
 =?utf-8?B?MHpTZWhmd0NKWExvbnhZaTdGWko4cFdCZXdVajhST2k2cjRqdENJTFBtdDJr?=
 =?utf-8?B?RnNMUlZ3NnNML2hvNmR4UzJ1UTY4M2srTkJFcjNwMUFETW9GOG5YL3IvT3gz?=
 =?utf-8?B?TjUzTkNKM1NNR1YxMXFtRk5WajRMS1dFOFFlMW5CNkJFd3NGVE1FeFNTcUZy?=
 =?utf-8?B?d0MwQkxIaEtSdnlhOU95dFpGbDkyWVBiWjdreGlKQ3RLb2wyU1NzRysvSlZK?=
 =?utf-8?B?VFFyMGRKS0dtK0NhMEQzeUwwMmJDL2t0RWtocjZFMXNJb2V3OUJRend3dzhv?=
 =?utf-8?B?Z3ZrQlZKT3BlV2R2TCt6KzBiMnFGa0QxcVdHYVpMZE9pNzFoaXdvVVJKZUFq?=
 =?utf-8?B?UnVDWjhyMDZnYzI3aEI0dlF6M3l1WHEzd0wzcnp5Q0Q4QTNha3k3enZjMnFk?=
 =?utf-8?B?UXhvM1F4SUx6YXNwOFRHUk5GZkVoRjRuTzY4RXhmUWR4L0FoUlFHQzBFaEZ0?=
 =?utf-8?B?azkzUHNsNmdZWjZTRDdqb3RUaEhieVBuQ0tGTkxuNlhmaFV1NWd3YlJnM2dy?=
 =?utf-8?B?OGVtUSs3QlkzajJHMk5TK3lxWVhYTUlVYnF1WDZGdzlsUEc5OFVhcEI0VGFi?=
 =?utf-8?B?NWY5RER4Y04weFNGd2ZndUlMNzRLMkRKOVAya20yYWJxWXo3eXAxRkxZYXds?=
 =?utf-8?B?VTJ2VEhQaklSUWhSMW1oYnhFdTB4OU8rc2Z0V0NuKzliTElxNkJBUUU0M3VH?=
 =?utf-8?B?cldpTlVkTUVWK0c2bEJqL2o2OWoxRUoxTVpUa3habkpaQU96NUhXNWFrK29Z?=
 =?utf-8?B?MWVCWmdua3Fxd0ZxUWhHR0JTa2JtL2o4WVJFZlp6YWd5RFppbkZaTGxLTVM5?=
 =?utf-8?B?cEI1U2hhbmVtYUpWWHA5K0prQndTOWFyQVdEY1c1MDVzaTV4QUFkTVJkSmw5?=
 =?utf-8?B?K2hXcW5OUmdmWVNVckRBZmpVcklPaWVOMWtIOWZ6WHVWcmNKMHhzTjZFZ2tx?=
 =?utf-8?B?SnhjbzIrTXVSK2FHbVVzYW1ZS3hHQW9lM0lCbU1xQ0k2bUR3bVNLRUZFbGw2?=
 =?utf-8?B?YVh5ZFhrbmJaTCtncDdtLzNGSXBFMUc2U3dvNG5teVB3aXVZTjNJcXFYS0Fx?=
 =?utf-8?B?SjRNWE9qSW50UlRYcnhIL1dFaDhSY3FaVG91OUpvOUZwVmVoTEdaV1dZTmhS?=
 =?utf-8?B?czBrVFNFMUxUWmVZMU1CQ3h6UklQeHlyM1dMVmY0MUhKVFV1U0twTXp1MStF?=
 =?utf-8?B?VDdPOGViaWcydklPTkJvZ0hDWExSYkY0N3dUYllncThtSFZONWd3eUlHazA0?=
 =?utf-8?B?ZWtqVXFydks4R1JadVFCRTRBMVdOdjNQd2s5U2I3bE5xOGtKZTN4UUl2V1VH?=
 =?utf-8?B?S0ZucC9tdldzdExxUWpOY0pPL281RlM1bGhoRS92TUhoeHRHaXh0VGRaNCt5?=
 =?utf-8?B?blZiUUV6SWNJcm9uY1R0N0ZXWW50RGMwUi9rSHdYWVBxTUJiK1RnMDRnRS8x?=
 =?utf-8?B?RTFGME42d1RvSE1rR05ZL2RNS1ozMXgvMHViQm9RU1hKSVUxakVOV1ExKzdS?=
 =?utf-8?B?Ri9mVnVVY1ZteExVYm0vaFBFOFkzcEFJeGV4Ulo4UndUaFNrNHVvaEZ1VDhY?=
 =?utf-8?B?Z0ZKaDRWUExzaUJLWHV1N24zVXlBNmlweURzOEJVRlNzNXRQVEZNYkpkOXZ4?=
 =?utf-8?B?NDgwUGFGOFdjSUNnMnRsVUN1em1ES3hIVERST2duOUs1Z1lYUERqdHRkUVBx?=
 =?utf-8?B?NlNuY0gxeFZLNFRwSTNQY1lMRTVoSnpPNUVGYmpwNnp3UjJid1pPQjlkNUxL?=
 =?utf-8?B?NU4vUlZlcUFWb0pyZEIyZWI3Y214OHFyNjJQVVNDbGMyYUQvTkJoS2tPVnQ3?=
 =?utf-8?B?ME5PeHEwblVKcndVMGJQbFZqWDUyOEhBeGh4aWQvVld3V1hZMVhZdFB6V21k?=
 =?utf-8?B?ZzZzM0hXS3dCNEFWVXM1ZUd1N3M4K1ZMTFQ0azM1OW5jK1Q5TkwydjFpbE5y?=
 =?utf-8?Q?UjNF/d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:54:43.5090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37327ee3-1d93-4ce8-890e-08dd76a4ea65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602

On 2025-04-08 02:37, Jan Beulich wrote:
> On 07.04.2025 21:40, Jason Andryuk wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>
>> Add and use a new internal create domain flag to specify the hardware
>> domain.  This removes the hardcoding of domid 0 as the hardware domain.
>>
>> This allows more flexibility with domain creation.
>>
>> The assignment of d->cdf is moved later so CDF_hardware is added for the
>> late_hwdom case.  Also old_hwdom has the flag removed to reflect the
>> change.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> i.e. ...

Thanks.

>> ---
>> v4:
>> Move d->cdf assignment later
> 
> ... despite my earlier concern this movement looks fine to me.

Double checking today, I see that in the failure case, hardware_domain 
is restored from old_hwdom.  So in that case, CDF_hardware should be 
restored:

@@ -986,7 +987,11 @@ struct domain *domain_create(domid_t domid,

      d->is_dying = DOMDYING_dead;
      if ( hardware_domain == d )
+    {
+        if ( old_hwdom )
+            old_hwdom->cdf |= CDF_hardware;
          hardware_domain = old_hwdom;
+    }
      atomic_set(&d->refcnt, DOMAIN_DESTROYED);

      sched_destroy_domain(d);

I'll see what comments I get on the rest of the series before respinning.

Regards,
Jason

