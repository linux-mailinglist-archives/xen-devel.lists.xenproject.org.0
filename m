Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB6CD17F8A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201350.1517002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbWj-0005Pu-EL; Tue, 13 Jan 2026 10:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201350.1517002; Tue, 13 Jan 2026 10:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbWj-0005NC-Ar; Tue, 13 Jan 2026 10:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1201350;
 Tue, 13 Jan 2026 10:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X45d=7S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfbWi-0005N6-Kl
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:21:28 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9db8cdb9-f069-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 11:21:27 +0100 (CET)
Received: from BLAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:36e::26)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 10:21:23 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::ad) by BLAPR05CA0011.outlook.office365.com
 (2603:10b6:208:36e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Tue,
 13 Jan 2026 10:21:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 10:21:22 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 04:21:22 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 02:21:21 -0800
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
X-Inumbo-ID: 9db8cdb9-f069-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWzEQWDi6gBlyXQr1RaF2qJht3tVH/9GnELItBCqk52HTz2884A0GY5jRqGT6M/6btXxmhYLKAPaoiUSjxo7fs5bZvmDQ6pfK7qNP9s/LT7hGtR+FkCu+oVDB8mc1Aa8HD2yHdAEp7bNnr8+Y8YEnPSE28uXIyRKC8GtRWK407dLp/IAFzcwLJLvPetyN7uA+zQYwr+IvgKXd7iqY+1ga9mejZ7hgsYQeDptYp08FGV4lTe5DCcHT4cakmfPQwPWZAn/0mfjqBgG4mEOd16X6ptHF0XwgWITrsks5/y6TOsz8NBqe+IiwqgB1SDFRFTBdmX6eBsEVlkwGmShMVNbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD9rrVHE8SNXkEpOMG/orsgKMfHvEtAl6NzTZVZHihg=;
 b=ytbe5K2fbIEO78yKcVAWT0b4//XkTfZFDiBBMvov0u1zUDTIMqKU/5Ah6VwSiNw/xTl52ga23D3wE+KAyDk9tEkoyFO0OCxa5O9yb+sWbW9rdd9MXPZCIo1Z3F2gImFpIA5YLjq+hzQNuURZjNk7gI1VbVccOcEN1/kfWIy0zEYvxrAIZKTGzlX13Y8WBe8+W9/fAP1rr3ONcaHxLkaUokLccCnLtVRcYi/0aN0ntqlVxiEWS+S9u2U5t7Upr5ppSOXmyh/YXZ7mwyka1LkwTi7TjJznGDmctfDv8UlwIwVMXDZ1nNr5P6Kh2gBsPZjed49jl3NtdqkCqDOykcSM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD9rrVHE8SNXkEpOMG/orsgKMfHvEtAl6NzTZVZHihg=;
 b=2ZkJ7qtpD8u4Nk2SFI+kxHDbom3l8zyHHxEhgaOSrk12AtfT+46SY3cmc4i9vADvZF4zCQsMgHjzHA7Nj9QRmUZDUWEDvdjsFs8Nuibdy8Q0Spbeb31tfU8Xk5Y7OCHrqn8WcFN/7RmXVV7fvq+fwNQuSSZQdDrlFbF93BPFx+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c12036c9-5e1f-4dfe-b096-5f3228568b3f@amd.com>
Date: Tue, 13 Jan 2026 11:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm/mpu: Implement vmap functions for MPU
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260105113503.2674777-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|IA4PR12MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: d1074f59-76e8-47e4-5883-08de528d8056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE4wSkhJRmhyaVZLVTNwbE5veFo0ZmpRK3pZN29EbkVTZGUyZ1FhSENpRUhs?=
 =?utf-8?B?TXpjV1RGaGJOOVpyMmRHaHBxZTMvanFTbmJFTlRMM3pQUDZWREhBNkpMdVhy?=
 =?utf-8?B?RVdOeThjbHY2enJVcDdRRFBOVTZuT245YzliajB6bnlVUnFBaFVSand1MzBp?=
 =?utf-8?B?MExsbjBmSkJJbS9CY0hENzdPMzRQN2wwTUM4cFQrQnBrMWw1bmZyYXpuZXR0?=
 =?utf-8?B?Z0xiWHVHMXBiWHZvRFVRWkVDZkNIWll3WWk2dnlZTkkvLzJKNlZDNzZCaTdY?=
 =?utf-8?B?SW4vZ2o4Zktvc3l6UXRLV1BpcnFnODRkeTF6S0kyRXA1VmFJdGtPTUNFYUtH?=
 =?utf-8?B?M0tHTG9PeGVaSlBxRHplYU1TcHM1aUg4TXIyeFprSHNIOU9jTjU5R3hzTmZF?=
 =?utf-8?B?YzgrelRwa3ZKanhFTzhaVnJXbWpXUFdXSmlwQzdtTUdCME5hVnpFNGQxR1VP?=
 =?utf-8?B?NnV2TWtpd0ZpVXBpWjhiWFo1OFVMRmhDSkRVY3lVTnl3QmFhcUxWNklxVnBE?=
 =?utf-8?B?R3ZLYzl0SldRSE1RNExUSDN2RkdzeXlpZkVHcnJrN0piRGd3SnBvU0pubU1T?=
 =?utf-8?B?aWVkbEhIZnpWZWozMEQ4OER2Qjc4MUhhRlFzWWloVXRkY0tZMHRIWkVtVWJC?=
 =?utf-8?B?SVNrd3kvVzYrKzAwOUFERHJVMzB2RW9ldzlpY1Y4VUtVVXgvTWZxejRsWjFX?=
 =?utf-8?B?cElBL1hHZVV4SHVWOWl6b1hyZXFXZlZTUmlST2JLeVcvcGw3a2xvL1lIdXU3?=
 =?utf-8?B?QzJXcGE1U1lDNlU1V0xZU2dteWR5MjVGMFFqYU1oeWN5dmNGdEFqWktBSlFv?=
 =?utf-8?B?UmMzaUJhK2l1a0NPNGpsZGEwV2JwWEM5aTQ0R3ZOb2ZxZmRKSklzYzZXN3Yz?=
 =?utf-8?B?VldIWGIvUEpxZEhITEIzeGR2Nm81ZnV5SFlRRlFyc2VpV0NyVkNveEZleFpZ?=
 =?utf-8?B?M2loWERaSExXckN0MXVyMjJIRkwvRVM0RS9RZ1I1dm9OcWZLUDJMb3phUThK?=
 =?utf-8?B?ellFUDBVSUFXUmMrSGw2em9Oc2R1TkVYOVZJUmVKeFZ5ckZQR0JCL21rY2hE?=
 =?utf-8?B?NkcxYUljL1NkTDNjWTBNUGx5MDBsTVdWcVZhcTdKVzlLTGc2VHU2ZUs0WDBY?=
 =?utf-8?B?Y2dRVTQ0UkRHeHVzbVpjL3FJaXd3YzJERmNxU3ZEb1dVOGZEdEovKzlidlBU?=
 =?utf-8?B?NFRWeUxUY2w2RkV5bzF4Um9KdTNQejd1VjBaN3FKNmhYSzhHOGc3c3BLK3lt?=
 =?utf-8?B?TjdQbUNOdE04Z0lZNnhValMzNmxCdmZQSExzMXR3WDBYek9ubzFOLzUxY1dJ?=
 =?utf-8?B?LzhPRU8xNEJOYzgrTUpOdXhoemd2NlpRZTBwMG9neVN2REZDaENjek42b2po?=
 =?utf-8?B?a0kzc2xVNzV1N3JTR2JxelZ6TkxmL2RtQzFnK3ZaKzM0b3BtOENSbVNkTmx3?=
 =?utf-8?B?bHU5ZU4zcXkzb2FLMEhUaUg1OU5sOVhUOE13VVpXcmx0bFVJRFVMNDFGdTBO?=
 =?utf-8?B?ay92eW5sWjJDSWhzRlVrRlUrcU50d3NKd0VzaEZDN3k1OFNCTUg2OFVtRWhv?=
 =?utf-8?B?dEtidm4xdUJyUXR4cFNCcVZhTzBnajZSY3o1NVVmc1VML3JOWFA4L05FaUZC?=
 =?utf-8?B?RG9JSGFmRloxbk1XR3crekVoaGRKQjJrcUNXYlBTR0pkTUdnZjhzZHF2cFRm?=
 =?utf-8?B?b1BHbG1oWGVkam5yVjJ5NVVIR251UUFqWWlpMGZUSkpGQkV5SGp2Rk1VaFN3?=
 =?utf-8?B?S1Q2N2poL1Nsd2hlTGRGU0M1UmFzZ0VFY2h3b1UvVlBNR2dtWXJBK1NYZWVH?=
 =?utf-8?B?NUhoMm1iRGFXMDlzMnBNTlRJRVNJT1ZBdHRIQnFzVldNbE8xWCtxd0RqMWo5?=
 =?utf-8?B?bGt2SXQxN0NpNVh0ckMvTnRMbFh2aGdQdTRkQkZoTXFDY3dpWTJ1QjZKbURy?=
 =?utf-8?B?ZU1tZ3lzMzV1bElvOWt1OUI4TVRxV2treGlNTHhFSFdkMHl1WFJmZFQ1NVM0?=
 =?utf-8?B?VmJIdTltZGpJelkzTHp5b1BSakFOaWJoNXp3YWdsYWJLWXJ0UnQ5ZmxGZ2I5?=
 =?utf-8?B?U2E5cFdZUTBPdzhpd0FSKzJnRTh5NnMvY0l5K1ZlVVZMN2EzeW9kb1VPZGhE?=
 =?utf-8?Q?6Rc4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:21:22.9748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1074f59-76e8-47e4-5883-08de528d8056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809

Also, two more things here apart from my other remarks.

On 05/01/2026 12:34, Harry Ramsey wrote:
> From: Luca Fancellu <luca.fancellu@arm.com>
> 
> HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
> in places across common code. In order to keep the existing code and
> maintain correct functionality, implement the `vmap_contig` and `vunmap`
> functions for MPU systems.
> 
> Introduce a helper function `destroy_xen_mapping_containing` to aid with
> unmapping an entire region when only the start address is known.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
> v2:
> - Rename `destroy_entire_xen_mapping` to `destroy_xen_mapping_containing`
> - Improve code documentation.
> - Refactor nested code.
> - Fix ignored rc error code in `destroy_xen_mapping_containing`.
> ---
...
>  
> +int destroy_xen_mapping_containing(paddr_t s)
> +{
> +    int rc;
> +    uint8_t idx;
> +
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +
> +    spin_lock(&xen_mpumap_lock);
Here you take a lock...

> +
> +    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, s, s + PAGE_SIZE,
> +                                &idx);
> +    if ( rc == MPUMAP_REGION_NOTFOUND )
> +    {
> +        printk(XENLOG_ERR "Cannot remove entry that does not exist");
> +        return -EINVAL;
and here you would return while still holding the lock i.e. deadlock.

> +    }
> +
> +    /* As we are unmapping entire region use MPUMAP_REGION_FOUND instead */
> +    rc = xen_mpumap_free_entry(idx, MPUMAP_REGION_FOUND);
Why don't you perform context_sync_mpu() here?

~Michal


