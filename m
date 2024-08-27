Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3066D961A91
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 01:27:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784397.1193740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5a8-0007Bf-7Q; Tue, 27 Aug 2024 23:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784397.1193740; Tue, 27 Aug 2024 23:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5a8-00078X-4j; Tue, 27 Aug 2024 23:26:36 +0000
Received: by outflank-mailman (input) for mailman id 784397;
 Tue, 27 Aug 2024 23:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ve6=P2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sj5a6-00078R-TM
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 23:26:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2009::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cab413b3-64cb-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 01:26:32 +0200 (CEST)
Received: from SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 23:26:28 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::47) by SA9PR13CA0129.outlook.office365.com
 (2603:10b6:806:27::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Tue, 27 Aug 2024 23:26:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 23:26:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 18:26:23 -0500
Received: from [172.20.38.216] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 18:26:22 -0500
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
X-Inumbo-ID: cab413b3-64cb-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzmvOz2sK11Eh/Li18zb+FTsHZ4KbeCFMwaQpOGCCnWERhrh4VNMadN6lPrvrUhOllnt7BDchX/XDFC+1Mo3n6otZouUTPTIefSC/i9BzMxz3bZVr24EVoD6Uhc6K817y0qFkEAtVRt6N3uD0tufZUl7gchTXJ2k6vCOaPy5kOwlkgDhT2FyeSh7HbLzyZCIyEKGBeCTJRXVrkpKdR8bYGRrYEqYdFmxMzIYukPmTA8TH4SJjpBwZYZ+m+26V+AalybmV3G/4/zjwmPGTHm+VuXvi/F62Sx3EkMTMjfRMetgmU4yYO2bWjcflWU1ota3P2pwYArFxILSCctV0h/asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64A3inMMlAXPkLih/Bn2MyMNi1I5lZpNECsr9i/D/6I=;
 b=sclBBYDvFRLxlPtCgJJIz55WbvGWs1alHjbtI6PoRXBdecZWcVETLv7PmPftsZaPrU3xUaSlmHRxBeI71Q35VlKwm/SGoVhVGfYdWSyq+CqNRJeJKQUsnxlAV8AGvib5VYgtN6OxGXu5mxVehYInhmk6+yCjEFite1c60cj72Ng7u2M2EhhoUu8dM/SphM7/i0Sa8qlKHDr1E0K97+6mTwm9/EFsruUITdcZMfQej1REsA1tG53pJfl6+VYCJ0qoVd5UG4uJP1LV62Cz/wxfrHEm9f/l4HmtiLDMX5JWaBz17/al96pcMRgtdAPLX2E+B+p4kSI0BtVxaVUOCse/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64A3inMMlAXPkLih/Bn2MyMNi1I5lZpNECsr9i/D/6I=;
 b=APmFbytcv5RPPz6LxNTNB+IS1LbDJc219d+p8v+nwQLggKUEq8BT40EM6XMYbfK7egt7h0WWdd2SyGbkwS+fKWejzyIioQbWIyETadqGyMWnKjKQnMWjTSmh6GldVVh/x+Qpzl+3hTr9z3o1iMZyQ8X296hLBh84/WzpBG5ptKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <ebef6a88-abae-4e9a-8f9f-56eddb5a569c@amd.com>
Date: Tue, 27 Aug 2024 18:17:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] libxl: Implement QEMU command line probe
To: Anthony PERARD <anthony.perard@vates.tech>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
References: <20240827100328.23216-1-anthony.perard@vates.tech>
 <20240827100328.23216-2-anthony.perard@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240827100328.23216-2-anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: f13a5ead-a97e-4956-2afe-08dcc6efacd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGYya0xoeXJlMTBqWTJyUzlLVjhWdjkxOFByeGJsdWVvL21VZWY5RFU4aXBa?=
 =?utf-8?B?dTQwaHJZanJkeXREd2FFM1ZGNEhzZCtEbEExbi9wRE5IaHpyOGNnL2ZhQVFq?=
 =?utf-8?B?eWdaVEw4elE1YmhVTXhTdW13ZUVCMEVWN2FQeVFZbUViQnlsNEpSTEZBWkdt?=
 =?utf-8?B?K2JrVWpnTE44eGtaZjdlVmNITzhoWWREd3FxR0I5S1pjSHBTUURsTDZHdGNM?=
 =?utf-8?B?VkZ5NDlNZXRrY0ZzbVFZd3dUZVVTb0YrZ3hXV2pLQWNJa3I0cTZsMllvSDdD?=
 =?utf-8?B?bUFIOHhyalFnTzZLd0p4SXBvc2hmbkRFRzBLbnI1Nm5kZ0huUDBEeitURVl6?=
 =?utf-8?B?NlFDK01ZS28wNlBHT2xOU0dybXlUUWhLa0FXVUQ4QXo2dit4dzRnUHVoQ1FG?=
 =?utf-8?B?Wmx5TlR4ajJMYlQrSjh5eXB5V2pCZWJ5UmhKN0UwMWZPR0RPQ1poRU1GVU9O?=
 =?utf-8?B?RFEvb0JtVHN3S1A5NzVvd3RjT1ZnY0JUajk5NHNpVHVaSFNZa2tlcjVpWGx0?=
 =?utf-8?B?eDROcXdzbGxteUJLdFdTSUNDZ3p3TjdQRjdoU0NXWXVLdjR5ZGdpR3FvUTNa?=
 =?utf-8?B?NjVncUc4WGR0L0t0aEQ2aFJoT2F4bXpZMTQ0ckZPTFAvRGt5VW9neUVOc250?=
 =?utf-8?B?Znd4em1wbDRraGd4SFA3Rm8xeGR6QzFDVFJNUGR5TS8rUFFKN3oxWGxwWDlY?=
 =?utf-8?B?VlVtT1IwSGlITjdnaU5PdDczQm4rOFNlNlQ5dG9JOHcwY3VEbThuTUY5aVox?=
 =?utf-8?B?UlJZUjd2SHRsTy92RUZVVFRpSDRDbksvbGlleEFpRTd2N1BFL2VCMlQ4ejY5?=
 =?utf-8?B?MjRQOXV5cHk0bExielFqTi9ZWjl1QnNFaVVzRGJiTWNkSmZ3WXFZRWZWMFhZ?=
 =?utf-8?B?ZHhTc2k4V0JlUjZDNkZUcnhqT0ZjcUpEYXUvcFdwVmRuT1BTNWw5T2tMTC8w?=
 =?utf-8?B?OXJlZE8wOXQwaDFlYUxmMDg4YTFWdnhGS0tPK3BvV2UweUQvalN2bStQS1VG?=
 =?utf-8?B?K2Q0a0RVUVFSV1NQQzFZSWNiZXRpQWttMVFzL1RqNXlJaU9SZFQ0ZmhHMnlt?=
 =?utf-8?B?cEpJNW1iR1RNK2ZWdjFXOW5KUkc2VFJHNkFoeW1MWjBmY1VPZFZibXRjMDJF?=
 =?utf-8?B?S0h3SjFlUnM3M2J1Z21UR01FUWRhTk5PZ3dOTVl1Sm1KdjEwMGZGdzZ5QnU2?=
 =?utf-8?B?d3hxcS9MU2RVNnV3OGphR2dGL0h5bndLUEU4UVhIMlc5SmZJNmxTR200UStE?=
 =?utf-8?B?QjVaaWp4UlU3WUJaeEswa0I3UGxuRS9IQk5SekR6U2tMbC92YmhKb3IwWk94?=
 =?utf-8?B?SUw2amwyTm1WT25wM3RWQURuSHNpQ3RYOTJZNGRES3VDU0l2RGttMTZjMHBK?=
 =?utf-8?B?S2JKUEhZSXU5Z2xEekc1U29iemV1a3lRMCtGWDArMUl4YWVZSHNGT3FCaE0y?=
 =?utf-8?B?UTlqeko4YTRvRTZBY3M1U2tiekxocjdJazM3Vis0RFdEa1VEa0xqMTRsUzVO?=
 =?utf-8?B?cEw4QkJBWXUwcGRPTVZlZ2RGcmNOZkJtT3AwT1NYbG9JUkxOYWZJYXQ1U1dl?=
 =?utf-8?B?eTdPOVplMkpNT3BrRW1SREc1SEJtOThaZ25OSjdra1lBQkpaek8xVTlBOTRs?=
 =?utf-8?B?NlRXTzlEaEs3WjNlZFcwMmpPV0Y5WUNEK0J0K3NJeU1VN0ovRmViS0xKN1g1?=
 =?utf-8?B?L0kwK3VGNDVwNjFSTHVYYzNzQUVpdFI0TFJjNXpXd1VFcW05K1lrOXNDaDlz?=
 =?utf-8?B?dE9CQTQyVVpoOGNXQ3JmR2lhUEo0bUlvd1VPbVZUM1ptbGhqVjhyeXdFalRD?=
 =?utf-8?B?SEFZTHMzVGZ0KzZmNDg4VVJlSlN6ZGZGbmtFM1ViT1hnRWQwQlpWaTkvSDZT?=
 =?utf-8?B?Y2M2am1BQWhWOWdvNVV4UlFUSHg0WVFIbzV5SHd6bGQ5OUNDei9jeEY5R09k?=
 =?utf-8?Q?mRefWtHIxyV5ZKuVpYtXtb34iMVMpBme?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 23:26:27.8317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f13a5ead-a97e-4956-2afe-08dcc6efacd8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236

On 2024-08-27 06:03, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Starting with QEMU 9.0, the option "-chroot", that we use for the
> "dmrestrict" feature, is removed. We need to find out which to use
> between "-chroot" and "-run-with chroot=dir".
> 
> This patch implement the machinery to spawn QEMU, and to run the QMP
> command "query-command-line-options" but doesn't yet look at the
> actual result. Whether or not to use "-run-with chroot=dir" will be
> implemented in a follow up patch.
> 
> The command line used to spawn the qemu we want to probe is mostly
> similar to the one we already use for the device model, "-machine
> none" comes from libvirt.
> 
> This patch implement the probing on qemu-xen, even if we probably not
> going to use the result. We could check the feature wanted for the
> domain been created, but this could get complicated fairly quickly.

"domain being created"?

> We already need to check the options "b_info->dm_restrict" for
> "-chroot" and "state->dm_runas" for "-runas" (which is deprecated).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

