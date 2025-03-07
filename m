Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E45AA56D0F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 17:04:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905171.1313023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqaAh-0004VT-6e; Fri, 07 Mar 2025 16:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905171.1313023; Fri, 07 Mar 2025 16:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqaAh-0004Sz-3O; Fri, 07 Mar 2025 16:03:35 +0000
Received: by outflank-mailman (input) for mailman id 905171;
 Fri, 07 Mar 2025 16:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqaAf-0004St-IQ
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 16:03:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b51ec921-fb6d-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 17:03:28 +0100 (CET)
Received: from SN4PR0501CA0060.namprd05.prod.outlook.com
 (2603:10b6:803:41::37) by PH7PR12MB6906.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 16:03:23 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::9a) by SN4PR0501CA0060.outlook.office365.com
 (2603:10b6:803:41::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.15 via Frontend Transport; Fri,
 7 Mar 2025 16:03:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 16:03:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 10:03:21 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 10:03:20 -0600
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
X-Inumbo-ID: b51ec921-fb6d-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwQrk7uMC9meaFQRXUuYywoZ/gpWrxUCAc8EFGgckWTQCcgUkTPAQjGfSA7ROY4akHTEg2j1847GVV9YNG84qqdL1/Vhpgpz9IDi0oZVkhtsrhcykkpIEL5NGy6dUQiS16PlxYFy0BVjrz9u4eivyNZH0l20Aj2p1VG3lq/CS5lyIF0CwhuS2qaH6d9gqu1Mwq26RvsWN+Tr05EqluCfycnkbZEneeWvaAPfkkwJzRQ3G6Rmw6m+22P7Skvcu4ZO2LZ4uiCXopZm8359XAqFn2sbyU+75JciVrKlAeAqbfC01QUhTBpFfXH8b2/JSqquZbiAgV6mH+CtfE85mBY1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAD8RspWKayh/+HoP93NlJFVnCoVOjCCIcVG82O1d1Y=;
 b=fMWEuLWfbQcwba0oISX6shgZNxY2Ogx4cDUTaUfD4hbMuVn2kZZPQTEe5bcfoFlsKTjPQ+62bQMdal8h/SMLUDyHAef0BSNEL+QOQTpxjsnOaDhOapgdxet1JKu8SeWGdyRD7Acz3fEd3dptgqZlftUSU7N9/aRQkmTnLYorN2MV6JvQIUNUrGSgKPT9sToiHhE8qC3NIm8802yZ7pgPGH6ipmlN4TBlmaEk3xChh++BHAupDbrs5aQx2fNRkFK99hVI8P927rW8Mt4P4mOPU6NYjS49HHNi5fz+UUHigCD3pcFAlMRB3HTAUvwcUnMaKXs9bMj4HtfOVOYNmi8E6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAD8RspWKayh/+HoP93NlJFVnCoVOjCCIcVG82O1d1Y=;
 b=V4fuNmnJ4f3ToOnf6nDT/M5+04SaWBw7odsgxG0V57DumMx+THJNvsMFf+R9rjXiIhHVzs3ZWgnkkEOGPPgEQTQr1oSKJ6Pw3K/TtOs0ipos3wXO8udv1LKOZsNm0KkuS3LLp31qzVmmah7wvZ2MgjC97IgHRSoyVRdySdAwTJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <734d9fdf-a201-4a46-9739-26a474683b10@amd.com>
Date: Fri, 7 Mar 2025 11:03:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
 <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|PH7PR12MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d42d06-d51b-46db-4168-08dd5d91957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGJuNGxJYnB2RnNwaStybFFROHRsT24xampkWU4vTmtPZGhSanNqcnNTY2Y4?=
 =?utf-8?B?aEk1MUMxdzNVTHZpK3FUcnBnekYrdTlES3NhVWc3UDZSbTcwSnlIMFh2WWQ4?=
 =?utf-8?B?Z3pWRFNqc29iVHlrYStyU0FtT0RXcjE4Z2s3OSt5TUJ5K1dsN1JFdmdEMHg4?=
 =?utf-8?B?WG9IT2UzbUR3WHNFUGFvdHJHQ3VHVUExdTJOSEtYWWs3cHFBMysrR3VsRUJ4?=
 =?utf-8?B?U3BJUVpXZ01xV1h6N3grZDVFNEtCaktPOGwxYUlnb2lRWCtIU2FyUWJ4bGhr?=
 =?utf-8?B?Q21qWkMrdnY5Sm5Xa1dTajhjWjJsRUU3dXcrb2VSZkFVSlh1Yzhmb2RtNWh6?=
 =?utf-8?B?VTIzNzhwRUhyK2dydUlZZ0ZOZCtadUtnTWpGb1VBTy9YWTlVQ3NvZkg4aXJK?=
 =?utf-8?B?YTgwWERWS0FXdnlJczVXSEYyVVR4WVlQL1FtQ1NkS0NDU3RSM3pCeVNKc2Ry?=
 =?utf-8?B?L3VUT3ZQbUNqSnN0VFJLcU1ydHJZbjRpUnZuaUR3NWJadmsvbm9oeDVsUkl4?=
 =?utf-8?B?REtHZkRFTzhrMVZyZUhWKzlyYXVtK3gxTUJqWDhEd2tMaGEwL09FaUNoVmdm?=
 =?utf-8?B?WTFjU3Z5MnZNdTRDck55YzFXRkZ0NVhaM3d3MEVkU0ErUGJsVE1ESm8wMEhq?=
 =?utf-8?B?U2xsV0t2VVVlNlc1R0RlYmkyM0ZvelkzSnY1VDJSZzFIWWJHWjlrSFJuUEFn?=
 =?utf-8?B?S1dVWGU2VVc1ek56K2kxNUFSdk43bDBaTzB4eTRpN2NHTjhVQWpmZWZ2MkhB?=
 =?utf-8?B?U3hYY1JyMW42eGRhOVdyYWFGYzFOd1BUcDNNRUNPWGlqcTNrZzVWeTMxeGN6?=
 =?utf-8?B?UTM4ZWUxa05iT0ZhOEdtaHN0U0o1QUVWbVAyMEY0WWJMbGx0WENzL3V4d0tx?=
 =?utf-8?B?Mm54MnFWZlZMVjVvSS9aWkpWcVpsNEtyd1FTVkpJZHNKMnVaanE3ak5mdnh0?=
 =?utf-8?B?djEvSDZydTZLOERudjZDWjBzYmI4SU1rWVpQUlVKdkZ0S05nbG5RZmhmWER1?=
 =?utf-8?B?ZzJyNVBCdjB4cStZZkN3N2ZwUDMwRC9EZzlIaTRCUHpoUE9yNkdObTNPWUNn?=
 =?utf-8?B?a05mR21xc0x0MEVLN3ExUXpYVElkZHcxTm9ZTFFPQ0pMV3ZyVkdpYVBjQ1hN?=
 =?utf-8?B?VndwT0NSZ002V2FFOWRLdmJwWlQ4aVZIVXZrbzkybFh3Rk1YNmswZzBxMkFB?=
 =?utf-8?B?eTV4Uzk3L2xzbFBpaGhxUFNqZGhpMDdpdllmZGIxekEvYThKSzJldHNPWDJI?=
 =?utf-8?B?WkRtUVNyck1OV2FZQkF0MzdhOUFGNloxclJEbm1FVklkNWkzdFg0R2VNL2J4?=
 =?utf-8?B?SFNTdlVyVjhrS0YwU1BaNlBoRGN0Wi9HcXVrZmNUMEdoeFZpSmN0TGJ3SXRP?=
 =?utf-8?B?THA2aGZPWUkxYXkzMU9MaklieDJsbnp6U0pmTlI5MDVRKzZ6YTFFRjdFdnpl?=
 =?utf-8?B?ZXpOVnJRMEZLUFcvV3NJbmE1UHdzaGdRVGhGNGxuenVsZmt3QkNWQWhUdDBQ?=
 =?utf-8?B?TVBaVzdsa2VuY2NBTzc1TDhKZVc1U1lsS1haOFE5WHk3UnM3MDJ2SnQxRjdI?=
 =?utf-8?B?ZU9yU1RGMDBwM3dSNHNvcXljTFUxMTI3YXVoZjdQYUFRUEdyV1R0b0owZTdS?=
 =?utf-8?B?Z3dPaFoycGxlczFsekp4bkhydTA4YmhJWTVXVHV1KzlqNkhFNWx0VmNUMStu?=
 =?utf-8?B?dDdIOGk4U2QxaGpWY2lHZTBCWmkwU1FLeXlwcTBoeW04S2hKQXg5UEF4OThs?=
 =?utf-8?B?TTFRZEVZZ25DN3hvd1c2NWczbFgraENKTW5HaHN1VUtHT2FQa21DU1gyaDFs?=
 =?utf-8?B?T0RRTE05Y0FDNFZzejA0d0sxWWl1d1psVmJSalh1UktLenNVWWFFaUhOM1Qw?=
 =?utf-8?B?WjZzclEzcGRKRjVpbWoyYjZ0VmJhUnQwVVFoNnRPZG9OdW45WUNHeWQ0QVNO?=
 =?utf-8?B?KzBRaldqMzFJWTFuNm80REFzeEphVGNhSkwzd3o5UmtiVTlxQ3loVHAyTmd5?=
 =?utf-8?Q?Lm2kVQeuRGX0EmGnyF1JtDTpW9QRtk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:03:21.4530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d42d06-d51b-46db-4168-08dd5d91957a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6906

On 2025-03-07 03:31, Julien Grall wrote:
> Hi,
> 
> On 06/03/2025 22:03, Jason Andryuk wrote:
>> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
> 
> A few years ago, we went to great length to avoid making the assumption 
> that the hardware domain is domid 0. See all the calls to 
> "is_hardware_domain()". So I am reluctant to force the domain ID to 0.

I was disappointed when it didn't "just work".

>>
>> This fixes using the Xen console which assumes domid 0 to use the
>> hypercall interface.
> 
> I had a brief look at drivers/char/console.c and I can't find any place 
> assuming "domid 0". Do you have any pointer?

As Jan pointed out, Denis Mukhin's patch removed the domid 0 assumption. 
  This was developed without this patch when it mattered.

I tested before posting without this patch (and with Denis's), and again 
now, and I didn't get a hwdom login.  Turns out xenstored was assuming 
domid 0.  Changing that with --master-domid gets to the login prompt.

Still, there are now other userspace errors.  xen-init-dom0 hardcodes 
domid 0 which doesn't exist.  init-dom0less only initializes 
non-introduced domains, so hwdom doesn't get its "domid" xenstore node 
populated.  That leads to other errors.

So I think with Denis's patch, this isn't strictly needed.  It does help 
existing toolstack code work today.

Regards,
Jason

