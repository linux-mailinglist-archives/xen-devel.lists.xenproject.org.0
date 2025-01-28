Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D09A202CD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 02:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878256.1288433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcZyl-0005d2-Ju; Tue, 28 Jan 2025 01:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878256.1288433; Tue, 28 Jan 2025 01:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcZyl-0005YC-GV; Tue, 28 Jan 2025 01:01:23 +0000
Received: by outflank-mailman (input) for mailman id 878256;
 Tue, 28 Jan 2025 01:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LT9m=UU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tcZyj-0004sS-NF
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 01:01:21 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2407::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 626d0743-dd13-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 02:01:19 +0100 (CET)
Received: from BN9PR03CA0380.namprd03.prod.outlook.com (2603:10b6:408:f7::25)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Tue, 28 Jan
 2025 01:01:14 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::4d) by BN9PR03CA0380.outlook.office365.com
 (2603:10b6:408:f7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 28 Jan 2025 01:01:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 01:01:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 19:01:13 -0600
Received: from [172.25.15.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 19:01:12 -0600
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
X-Inumbo-ID: 626d0743-dd13-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXsTFzVuYm7xPvxeyrsmGb9MeOskgFfWIQ6FTrEc61RmhgATJVsO5OOVOzXl8IWXavrZbXW0DnIyIUUs8qx3Rqn892I+wZYY84gAjIuH90wBrfUJdH7U1inBWxDIwMOEe/z39dbSZFMMpNeciknabPBgvAPxDdTSGflHrCYEhf3mfUqthaVUwHcLWnkQa7FdzZ4t2R+cpdKNQAZJmu1iUi+lDk4PdMe82reuZzHwW52aQfnCwvyUGOZoha9/O84v6gGrnuPx7Cc8Hg7zrERlliCAFTuRAYDoXvvT5sKZiP9gFlnObobmK0T6KG9h0vLsRu43rDYuDxuoQn0555wfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU5juYAN8MkcFeZ78u4MDJiUtRyZMgU3YrD1KmNTcy0=;
 b=G+k7Nst0BI6lz72QEchaKgWx4EEs8lSkuvjg4bIhU2SXDe1/voWUF8Bp5CNX8W4BWCn8X9wxnB5iZTUQhgedSK3KaQHatjt0IdFB50OpFMOexzof8vOL7Uyjjnmj7ZpQ9Kmk2XV9SzLY8k2YgX1KZ6mjS2gtf+7zibEYn0xnkGPXSMUm9zQvCK0KvQWUAwwMFNgHhllnuJp6/DORzErQjmQ9OCUsvGXG3fYnlDRwP26XmF5H9Rz9jtpJvQG17Hsx9tJQ3Z2RZ7C1P9hMgWiAQ/l2/YYdcv+4wjuaBX209/DuPNSCAuC36y/n6CAq7v2jaNcpxTPWisHug2IpKiAQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU5juYAN8MkcFeZ78u4MDJiUtRyZMgU3YrD1KmNTcy0=;
 b=JGqfn+BQpE+8zKd7Plcxikm2kvRSwbLYV8z6oqV4gBHs8qH5qm0pg3lg7J4bddGh6LmB3IuF7LubRLGH5HOpDZxG8dWehz1vAUTsC4ES/v6XQ7oMVxqshHpB9FjVaVY7YcFmLNc0pHP3e5bZo+mPZudKXM2AhtnmkxE2sBl92Ko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <047913a7-134c-4d6a-9db7-69dd3442d7c9@amd.com>
Date: Mon, 27 Jan 2025 19:26:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/24] xen/console: rename switch_serial_input() to
 console_switch_input()
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-8-c5d36b31d66c@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-8-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 895e2bf1-411c-4f5c-569e-08dd3f374345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVF2NTIxa2NXL203N2YwQ1RkUGR2VW1VZmxvQVVZMWRITjVvczNTdW1ZY3Nl?=
 =?utf-8?B?anFtWVJSa1h5MHYzanh1QXF4ODRyVmh2aFRQRVpsUmJkR0dDZStZbTRzRzhU?=
 =?utf-8?B?WlVEU1FtNlNLa1pLR3lUUU1WSldLTTVESVMyNDVpaUp0cTNuSVFJeGZoTUht?=
 =?utf-8?B?c3pTMnN6UnJHWWlZQkNyc1dMakdvRlQraE9UZ0dVNjZZNWJkWEZMNW9GUUdy?=
 =?utf-8?B?ZFJveTRPUnpOU0ovUWZEbG03TnptNW1makhHaGRvYW5mQzYwS054RkVIV2tC?=
 =?utf-8?B?NFJsdG5kNlV3ZnlCUS8rYXcwMXBxaktseFY0UW5BcFM1WWFqODVHUDJBR0Ji?=
 =?utf-8?B?M2lQd25QbFNSY0hNTmNaUlNUZTBXeWRWTmxFaWFWbEgrSFk4QlhYZ3NFSmpB?=
 =?utf-8?B?TzFJTmRnMUJ1enFjNml2dFhNTzBaWnlrN2FvWml4R2x2b215S3g0U2U3Rzc1?=
 =?utf-8?B?Z1FJYk5YKzBCMDhVNzgxSXVESWJrOFc0Y1BPSXhFSFB2WjVmZE9zaFZtcEgx?=
 =?utf-8?B?TGEyOGlrcExhVWRTMkpSL0toU3F4MG96SExaREZFK0d3NXVVdlVjQmxQdXdU?=
 =?utf-8?B?VGVqR3p0bHBNMkoxMUV2MlRRU2xZdEJrWTZKT29nR2xsUUt5c3JyU1R2MFND?=
 =?utf-8?B?bFZkdmpkQnJvTm0rVzZxVnAxL2djZ3I4dU1XQlgxYUxwbTRXK1BHaHFURWF2?=
 =?utf-8?B?Z1pwZ08vTnJ4VS9JT3NzMENsSmJ6R212WllDcGtJcXVwczAvYWRZdDhvc0NG?=
 =?utf-8?B?QXRTa1VFblRVV01Ca1k4bEd3Mnl1YXZ1WXFSOWFDcG5ja1R5Q3NNSmt0NmtW?=
 =?utf-8?B?aVpPUXNISVhJVjVTYSsxU2hRRER5eGRoQ3JhdEtSQS9ibG1tSS9KckEvSHhr?=
 =?utf-8?B?RVZIODhaNmZPSEFBUlZmK1VOM3dCVG96am1pTFVLZnkwMjJaOHBnUXZ4ZnRy?=
 =?utf-8?B?WTlaVjFpbmJFTHF5NmtUcThJUDEzVEM2Y1N4eEZiNTFMUy9pWnQzajFidjNa?=
 =?utf-8?B?U0RmeTZnUGJIejMvRi9uSTZjSDJLd3lzZk0zQlZKQ3F1QTM1NzROTFJtV1U5?=
 =?utf-8?B?S3R3dHl2TDRjUVVOamdmWFQyM0lIZWQwV2Z5RzRPWkp5NlI3U2lSK1Vab2xC?=
 =?utf-8?B?Q0FvT2w2MzRZNDVtYzd5R3dyTHpvUDZFNHpjVGt1aHU1cE5lYUVkcGVEUlF3?=
 =?utf-8?B?YVpFR3hLZGdSY3FLL0dVdWdySDJSY0tUNTNDUjZrVjc0ZXFLeVJZL05FYTJx?=
 =?utf-8?B?VWNFeUxqdE5TekxmK0IyMU13SlZ3SytlMHlQVENlSFJCRDQyVUE0dlAwU2dn?=
 =?utf-8?B?Z3FuRStyWkJtWEs5clhuMENXb3BhM2k2MTcrYmt6azZTTjh2RVEyMlYrNVpR?=
 =?utf-8?B?R2pocml3MDgrd2pqNDcvQUVtK0wwaTI5S3RXQUtCbktHTGVncWF4bndteVdV?=
 =?utf-8?B?ZExTcEZCM1NLRmNnZ2Vlc1Y4OWRoK09vazlaSURiaGJXczBFSDdtWVdnQ2NS?=
 =?utf-8?B?OE5HeHdVaUFvNXhrcnFkSWRETHlqUkNFcXlvLytYemd2TUlXQXVDTmowTFhx?=
 =?utf-8?B?cU9jV25yNHNRY0wxdzRDOVd3Y2tJOWVtMTR2cnYzR0ZDdGlzdHJGVWhoa2N0?=
 =?utf-8?B?WVQrdHB5bUdFUGRLYTFITWZ4c2l2aDd0WnR3eFprVC9JdVNxTk1pdW5Gb2NW?=
 =?utf-8?B?bEg5RkdBUzJZUklTQ095RHJJMHBzT3E1R1MyUHF4TWJuZGZ0eTJpRU50a2lI?=
 =?utf-8?B?aEplVVVQUmxuTlgzNTFIYmZsclJIbmhMazBNRFM4enEveUk5N1FFRVVSbm92?=
 =?utf-8?B?Mk5leXFUWWlEQlZDSEdObzl6YXoxVXhVWXJWbG1Da2JUV05ZOEJRNW5wQWov?=
 =?utf-8?B?UWZuZjhTVlR4RjFmUlY4cTZnZ09CZTFlRDZMMFlNYlZ0aGZVOUxDbktWVUdr?=
 =?utf-8?B?Rml1N2o4NE9ZVEZzeFRmaWo4K2tMVXU3Qkg1WS9wRk5pUnUvRFovc3BEZGxo?=
 =?utf-8?Q?sOjrbc8tHdVOUWuoc1NpvVv2nDtfYc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 01:01:14.0066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 895e2bf1-411c-4f5c-569e-08dd3f374345
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712

On 2025-01-03 20:58, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Updated the name to highlight the physical console input selection logic:
> existing code does not switch only serial console, it also switches debugging
> console (debug I/O port and console hypercall).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

