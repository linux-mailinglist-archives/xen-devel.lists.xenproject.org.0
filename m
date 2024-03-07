Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C4687554F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689989.1075576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHgd-0007CE-3r; Thu, 07 Mar 2024 17:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689989.1075576; Thu, 07 Mar 2024 17:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHgd-0007AE-1D; Thu, 07 Mar 2024 17:37:43 +0000
Received: by outflank-mailman (input) for mailman id 689989;
 Thu, 07 Mar 2024 17:37:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inme=KN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1riHgb-0007A8-VX
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:37:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6415b87c-dca9-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 18:37:39 +0100 (CET)
Received: from BL1PR13CA0229.namprd13.prod.outlook.com (2603:10b6:208:2bf::24)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 17:37:35 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::7e) by BL1PR13CA0229.outlook.office365.com
 (2603:10b6:208:2bf::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9 via Frontend
 Transport; Thu, 7 Mar 2024 17:37:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 17:37:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 11:37:35 -0600
Received: from [172.17.205.23] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 11:37:34 -0600
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
X-Inumbo-ID: 6415b87c-dca9-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hkgz3m1XLeIl7XwjYi9qkTa+DTJmgkaUpZa0V9UG41PVdi+A/ooCUKIS055ug6SzzhO0qrWClC6WOn139rd5FYJoVCJgNmk/ZJ1vGxf9CekaRxX8RqfDx0ZIO89aawVA+7BkRyUSyoH+ui0Tq6jBWNSRVQ0G300Igc/m4uGUtuhhd15ncMRAQl/yEvdlMQ0GYaPOHD0azBxKI4agJDaZKEmcWIanYnTqtSjXmfaj8psEMOamnmx60RW/NELWbA/Jenek2R+6HFz/YayctGCGSXBL2d1Vgm54SM488KECVbOlqRdgidyTx58nF93U6oOoULPFJ28DXa3r5HczwUUF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv7KW5Wwm4Hia1oW6MlVGs+pvsoaPx39pBEuqEVNQoM=;
 b=AtUfXvw2zTYcJDc4+7iJcQrXmacuewA6uuPvFmINCp2Vh/gJ0immwjExcHMtq4sOu8xJN6XmAtJ1Gu48buEorIaeiKtSeE76T/hpyg0IwvRk8KtYVnNoZDB6AF9th3Y3+4zJoFb6o4u1yTNlqZniB2neKYYFy5ejW37hjZWhPCEVyfxYoICLuZGgoS0d7q1gtQByloPDpBl5O1SQAG3Dw+XunRZNM19hhgUlitIlhfXoJR7bWlAow2CSpRN2j0X3TMkXkSFob8kDw+am5gYE0toY7u+n/mI2avYJVNRUP38nfaIcoIfbYCha+P0HzqNrtfTWcjEnwnym6eCM6Pp4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv7KW5Wwm4Hia1oW6MlVGs+pvsoaPx39pBEuqEVNQoM=;
 b=1/WUZaqlr4PgIVz+bUxAyjvYiRuRLMb8siG4WM+UPfe07RILp84ssIsxgk+G5McF7z4QtsquUt8ihK7Vb1n64BDVdomAueD6kFjyu80qMH72Y9NFQ6Km6mTGFQaHlbuOudsQWpg6YerLe5EbZgS0xoc5nwUNmxurHloHOSM2xBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c771b190-134b-453a-8699-2a29c6685e86@amd.com>
Date: Thu, 7 Mar 2024 12:33:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 0/3] x86/pvh: Support relocating dom0 kernel
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
 <ZemQS-8a_a5pwzf-@macbook> <f6cbaf67-f5c7-4947-a07a-0f1d8f693462@suse.com>
 <ZemVBa1rxMsNI1pp@macbook>
Content-Language: en-US
In-Reply-To: <ZemVBa1rxMsNI1pp@macbook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: adbf749f-0a5c-48a5-bac3-08dc3ecd46ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5aN9+mw9Vt1HE8GmQ/hWZcYb95GpPyaY6SvgGwMJnq0kOnIk9lHzfIld7nMRL4z4ZOBz+WY9Ot42ZsTLv0dGixZl1TqZl4+r+y1R86MK/0xAX0RJubNx0kFrIoGh0720rt5FY5UNacjrZO9fpJhpLIyYyN7linQhJXJ44xZl0Y1JRAyt3GR2t2z/66kGPEdtkyjUxZ6tBS5Tj7RdTriIND4GoMB56V2Rm05EE2sY8Ep0DDmu2YB9maUmLm+uKdQO6RdiM9PXYxq0jJHz5vZGwwvU20wtezXLcOsV2Gv/NqeDAoDo88WWoYrGDNVUpWRYEGw88Vwt6/Lx1U4WoCA3e/lFJG6dG/zWoyp2eWLVtOMPikQLGOtMLnyNSDKEH8eWtMa+c8jynDbYKFztuCykvbKBEC5U/Qk3fezk0kgCf1SORQAx38ao8id1ylbia+OYLc++aaKT9m7H5LmqyNC+fvttyh79mo0DqC1xysjtYUqh8J6jW9k6tSHwYbphzzXBYCpQ/B3Sk85tnc3GiBMVpPFkAAjXXiDfnTsonsXSYhAkRvC6oMzqTw39Lmd0kKy76BNSjMbo2Oio+hO9F05oKun0zLdWOCQ7dBEakkatcNgwucVhsAm9ZcF+q6gYOs9BSdLrWQnlFWXcXKYKnJd1mmuixUvZWhhMwdrfzVGSE72vT2GY5Tp4tlNvKcDJ+6DX4ztHMOh8v/VWYJFDq/8hwz9y9X6o4MAILq/ImDz1GFfW+TbK1BCojnTBTDiZLc36
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 17:37:35.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adbf749f-0a5c-48a5-bac3-08dc3ecd46ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

On 2024-03-07 05:20, Roger Pau Monné wrote:
> On Thu, Mar 07, 2024 at 11:08:37AM +0100, Jan Beulich wrote:
>> On 07.03.2024 11:00, Roger Pau Monné wrote:
>>> On Wed, Mar 06, 2024 at 01:50:29PM -0500, Jason Andryuk wrote:
>>>> Xen tries to load a PVH dom0 kernel at the fixed guest physical address
>>>> from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
>>>> it can be configured.
>>>>
>>>> Unfortunately there exist firmwares that have reserved regions at this
>>>> address, so Xen fails to load the dom0 kernel since it's not RAM.
>>>>
>>>> The other issue is that the Linux PVH entry point is not
>>>> position-independent.  It expects to run at the compiled
>>>> CONFIG_PHYSICAL_ADDRESS.
>>>>
>>>> This patch set expands the PVH dom0 builder to try to relocate the
>>>> kernel if needed and possible.  XENFEAT_pvh_relocatable is added for
>>>> kernels to indicate they are relocatable.  However, we may want to
>>>> switch to an additional ELF note with the kernel alignment.  Linux
>>>> specifies a kernel alignment in the bzImage boot_params.setup_header,
>>>> but that is not present the ELF vmlinux file.
>>>
>>> I wonder whether we need a pair of notes, to signal the min/max
>>> addresses the kernel supports being relocated to.
>>
>> Plus, as per your other reply, a 3rd one to specify alignment needs.
> 
> Alignment we could in theory get from the ELF program header, if OSes
> fill those reliably.  FreeBSD seems to do so, haven't checked Linux.

I will look into this more, but at first glance, I don't see a 
connection between Linux's CONFIG_PHYSICAL_ALIGN and the values in the 
elf headers.  As a quick test, I set CONFIG_PHYSICAL_ALIGN=0x800000, but 
the elf align values are still 0x200000.

The elf header values may be a suitable fallback though?

>> Then again - a single note can have multiple values. So perhaps it
>> doesn't need to be more than one new notes (except if dealing with
>> multi-value ones is deemed too complicated).
> 
> I've never dealt with a multi-value note, if that's not overly
> complicated I would be fine with it, otherwise multiple notes are OK
> IMO.

It looks like a single note can be followed by arbitrary data, so 
putting three values in should be fine.  PVH is defined with a 32bit 
entry point, so are 32bit min, max & align values acceptable, or should 
64bit be specified?  Linux uses _ASM_PTR for PHYS32_ENTRY so its size 
matches the bitness of the target (32 on 32/ 64 on 64).  I guess I'll 
follow that unless I hear a preference otherwise.

Regards,
Jason

