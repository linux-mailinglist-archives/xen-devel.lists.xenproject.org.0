Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094693A253
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 16:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763268.1173539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGCc-0004Jx-Fs; Tue, 23 Jul 2024 14:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763268.1173539; Tue, 23 Jul 2024 14:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWGCc-0004Hw-Ck; Tue, 23 Jul 2024 14:09:18 +0000
Received: by outflank-mailman (input) for mailman id 763268;
 Tue, 23 Jul 2024 14:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W1nq=OX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWGCb-0004Gg-1W
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 14:09:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2437904c-48fd-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 16:09:15 +0200 (CEST)
Received: from BN9PR03CA0974.namprd03.prod.outlook.com (2603:10b6:408:109::19)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 14:09:11 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::4c) by BN9PR03CA0974.outlook.office365.com
 (2603:10b6:408:109::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Tue, 23 Jul 2024 14:09:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 23 Jul 2024 14:09:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 09:09:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 09:09:10 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 09:09:09 -0500
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
X-Inumbo-ID: 2437904c-48fd-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWIK+Li/Am7aku33t5CIGahYOe4hPbPz+ZhpczfjqPMD52jz2aIaCJG1sZrRcKvWJoDASGozA4mKUm+2Snorvcs6YTorVpBLUQXDDliQg58dwyvnP3pyV5Jo+iSc/gO3Y/AhC/LtfB3Ensq+c3M/WtzFGVX4ptkn5x/fF9szmS2KhOGAmpUM18SxSurmlAvu8iccfivX664uYLz3cd2lsL0rgzv16NZ8ire89te65hkq1LCjdiakpMni9h45TSp3aGmycNXWb7yJcCshwTB0k7MprI158pxKRkY1SxEbG5EIHr414yQJi48XCrxxDnliOY8dWca/wG1mTwQYlK6REg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVEj1nE6RswZNDJ+mXfggHs0FnAaXmmn7YOQWVRsuCw=;
 b=VPUeKullYQREJy7G4uMRDs9Gq89iBHze1B9APdN9zfv4SW88qp7AI4GLbt9DWTwG6Vg1xbLj5UfAIF5y9iY8KfaapxF0DpPrVcoLbmEJN5vbUZzcBHpK4JhtAbRH/AH6cuty4lPUG/Sj6lHF6BfpQpnXxlABP69L5isa1jsEZJ0e7dDZxYDM4drWdi2Nk5aNqzzjzUq1MiZdoBLpRtDoAPGHhLLRtjGF82DXMXW4i9i761JyB5R1Je6T/a+JarpmKYIAjdPr7Lst3rtyfiZLcDNKxfXKSqN97TxPd1IKlLtxZpIzr/gcaH30wamtH9EBhoQTUJoTBjvHfENsRcnufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVEj1nE6RswZNDJ+mXfggHs0FnAaXmmn7YOQWVRsuCw=;
 b=chil8p2S19GhWrQsmblK11vFAn389PAaQj0zQmngmN56RCb0pRZxqDIwTfF/pyxD/RdaB03Gy1gaOzgW1OaCvYPmWWTN8GjrgyS/F4AzL3jYK4GixkgvwxrVIk9K6PIsQwjLRQsR6BcthDq1eaJ+5DwXjGXgIxOJlNEZOjcLY10=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1e737cea-49f7-4813-986f-229536123d23@amd.com>
Date: Tue, 23 Jul 2024 09:46:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] tools/libxs: Stop playing with SIGPIPE
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross
	<jgross@suse.com>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-7-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240718164842.3650702-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 437313a3-461a-4260-819a-08dcab2106c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1dGaXVzRXhyUFoyMzRIazYzb0xCWVczNURCUnRnVTl1YlFJbTAydHFhZE50?=
 =?utf-8?B?UXplenNqOTk1TEFId1VYOE11TFdZeUZQeDI0YXVPTzQ5TTZoR0lyK084ZEps?=
 =?utf-8?B?eEtsSENobVdlV0tiNjRRM0JTb3VxQ2IvWWFIaSsvS2NsSWV0Q1dXNEdhS0pp?=
 =?utf-8?B?eVRaNmNtSWR2Z2RBZ3JVZHNjRGF2OTZxQlpuU1NJN2ZMbG14bFdTeHhwMWlu?=
 =?utf-8?B?TUJtTzArSGlyN0NDK3JCVUI4azlBVGhzVlV4Vy9KYkpVdjJMUVV2cC9uSnJ3?=
 =?utf-8?B?L3hkYWZhQkR2WGR2b2lscDBvT3pKdlBDV0RobTJ3SnY3RHN3eHU1TzZaQjVl?=
 =?utf-8?B?TWdMOGFyQlpFTnB5aEFTVDBMcmY1SHN3YVN6SkYyZEdMRGQ5ZXRZMjFzZmov?=
 =?utf-8?B?M1dEQUJ3U3JsdjlpWC9lMCtxWUI1M29BS1U2clQwYnRTemdDVTR4RGVDR3Jp?=
 =?utf-8?B?SWgrajBKVHE5NjB0ZlRpNlJDQ0w1ZjdtRVRFT0ZUbGdNVjd0aWdDTDNoSGRp?=
 =?utf-8?B?S1RDQXB3R2J0VE82Wll5dzl5b2lSbHdZR2JKbGV4WVQvQlNpMTc1TzJBbmxI?=
 =?utf-8?B?WmFsRnNVWm1aQWdVbyt4aFJLb0FGRnB1T0JqcXFBamE4bUk4dGllSWw0Z3BL?=
 =?utf-8?B?elZ0M21jenhtbGRrNWc3K0hsNDFST0JWeTEzenpSS1hURVNzWHRpRHowcE81?=
 =?utf-8?B?c1hYNjBGVGlPbWJLYnQ3UCthdnJ0R1Y3UC84S3BJVk05bEZWMlp5RW45SkVW?=
 =?utf-8?B?TGhZVEMxc3NWMWJQVDh0ZlJNSldiVXJZZmw0ekNUSVFDL1dZOU03SHl2TTMr?=
 =?utf-8?B?aEFiSisyL3diaTR3Z3F2M1FGcXVZTHJTWUVEZ2pobzRyL09pZU1PMzZDYWJt?=
 =?utf-8?B?ejVwL1JDdzNVYjRmMDU0MjYwY1Z5M3lLc0hPdmdPOVdWdWRTQ2hvV1N2dENK?=
 =?utf-8?B?V1MyWHBlbG9VTFNsOEIrWXI0bUI2WmhvSi80RlBoR2VpN2w5emUrVlhoanZv?=
 =?utf-8?B?b2gyUW51bXFjcGNZM0MzZUZkY3lmK1dmc3AwNGFiQU42aHVhczJuSlRTUnRS?=
 =?utf-8?B?Vjg0eG5BbVBxK213d3gvL2ppL2JJYmg2YmtTS0h3aStpN2F6dWVNdlZ4dWRI?=
 =?utf-8?B?YW90ajZxdDNzbjllZG10aVYvRnpuOEhzR2I4cjJtWjZYQVEwTGt1MUtOQ2Vm?=
 =?utf-8?B?bVJLVFg5dURxMFpwUzRLL2p1a2Y2SjJ0bUhhMHlJaVNHNFphMkM0OHRnN2s0?=
 =?utf-8?B?R2VKaUhyZnJmL09UdFJzQWN4U2FRbklJRFE0RjRwekVDdEk0RzNSV09KSkV6?=
 =?utf-8?B?N2NFU3pRaVh0NEZWQ0hBNjdwTkhWME9PUDdBb1BOOHlGVnpHcVBjRHpSNzBV?=
 =?utf-8?B?aVdXbm94NE5LNXl4elZMWUwzMXB0N0k3MGJvNk5WVGdjNTR1a082MUVrQWxz?=
 =?utf-8?B?Rzkrc2Rra01IWkZxTzIwczJ0dTJqWGx3ZnRZUklzYTNKeDNzWDNBVy9NNFJO?=
 =?utf-8?B?NCtrN3F2MUNFZVd2Z3I3dmthSjZhM1Ryb3VwRHJ4WUJGYkdhNkJ2QUpkRmNv?=
 =?utf-8?B?N1lISUVSME45Z3ZoOUpkdjFHazNIOUhRRmprQXRuUCtrM1JraU82RXRreU8y?=
 =?utf-8?B?RU53UGVmMHBMTXUyZGRtVXc5VFZrTEt5MEJPNFA2SUdWaml5NWFmbTdXdEJB?=
 =?utf-8?B?dzlNcG14RnprOHh5NHdXYWJVTlZBcy9zK3IrSjlxSUEyT25abCtCMGJiUkhZ?=
 =?utf-8?B?YmNkc29teWdvYUJCRmd3b1VDR0RxY2FQRHpvWnJUYVZ2dDl2VmU4OHdBaStE?=
 =?utf-8?B?YWp2WCtNSWoxQnVqWFY4NDdmYmZ6TXBiTXplajd2eDRpZDNMK2JyTlJZYUtN?=
 =?utf-8?B?SmZUeDFFSCtjNjhyd1ZUL0VsRVRtaEhxclpMZWdaQjgvcC9qZDNvQ2duUDlC?=
 =?utf-8?Q?LyuyoV3nVyVriZJr/UMDOBOq/rg+tIMN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 14:09:11.4123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 437313a3-461a-4260-819a-08dcab2106c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874

On 2024-07-18 12:48, Andrew Cooper wrote:
> It's very rude for a library to play with signals behind the back of the
> application, no matter ones views on the default behaviour of SIGPIPE under
> POSIX.  Even if the application doesn't care about the xenstored socket, it my
> care about others.
> 
> This logic has existed since xenstore/xenstored was originally added in commit
> 29c9e570b1ed ("Add xenstore daemon and library") in 2005.
> 
> It's also unnecessary.  Pass MSG_NOSIGNAL when talking to xenstored over a
> pipe (to avoid sucumbing to SIGPIPE if xenstored has crashed), and forgo any
> playing with the signal disposition.
> 
> This has a side benefit of saving 2 syscalls per xenstore request.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

