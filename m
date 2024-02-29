Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886D886C956
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687022.1069729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfffy-00084v-Bf; Thu, 29 Feb 2024 12:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687022.1069729; Thu, 29 Feb 2024 12:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfffy-00082h-8i; Thu, 29 Feb 2024 12:38:14 +0000
Received: by outflank-mailman (input) for mailman id 687022;
 Thu, 29 Feb 2024 12:38:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aH8z=KG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rfffw-00082Z-CP
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:38:12 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64e2400a-d6ff-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 13:38:10 +0100 (CET)
Received: from SJ0PR03CA0231.namprd03.prod.outlook.com (2603:10b6:a03:39f::26)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 12:38:07 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::ea) by SJ0PR03CA0231.outlook.office365.com
 (2603:10b6:a03:39f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Thu, 29 Feb 2024 12:38:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 12:38:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 06:38:05 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 29 Feb 2024 06:38:04 -0600
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
X-Inumbo-ID: 64e2400a-d6ff-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJQDSkbilx3/m8h3vsI6VPJKPgveIW/1/FMGBLqKTbVKWbNWu75X9TVM/9TE5Cx4FGQGEpc0jc3M273hqDF9KI/e4ojSPFXcyqmlWQamh5xQpFdO1Cu8hst1+PWOQy+9SqCnH2DG+tE8XVxUIBWFJND7QrjH7zhFoj+uT5KHaeTYRhVNSUt8DijhEKAbP5DVejcTDVuV7hmeqmb7fBdqgHGPmmRxTFg+2v4Z0B0FTVCtjUA4+N4pBk3FyTWN17f6dwc36SYlh+j1vjjZk/0xmbekoaSNKCZXHeQQXcGEtZby8lZyS4CD+KGPWSCuxaaHVVWZ1F4s3T6MKLA6fBQd9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCDT5YnQejQia952pd3v+RqJGlrl5xNRXEoQQK1M5ek=;
 b=V5eUqHnDdH4BQGQijHO+pyU/DsX9nljgXeiaUFDBjw7+Ka71xml6xsO6nvKcbYtkSyEOqEumnfBU3fjSMLwW9ZxdF0ieWRIZVBw/os6uAMZDKuTb7VDhyDUPrZ1XUHUUOSKxcpkVwC+Wx2B7R5SSDJseU+Pl2oWasy4f3j32ioQOiP98h0jTU787fckM8+9rsMJkfpnPQvW6k74QN3AZSPsosNBS4FY4gSHIoORc1QXs3DevO0y3/xUtTLfQhk+o5EyAOfFwiXzFm484+MRvqf1md/SQ+56KMIZgKP5U8n3fUxHF52kV46E/Ibw+3jdEwx1IrarSSVeSgdB8izo95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCDT5YnQejQia952pd3v+RqJGlrl5xNRXEoQQK1M5ek=;
 b=Oql5uLoO+GcQRKPWyJ1huKvYjlEsi0yeYDBDCr9HA07ZHC/dMWel3nKp7vf8goXEMR0wRrU2jbtF5mAXzCwHme0r1qnqrmn9ULCcBMOoCoxum9HncRpIVgzVkZWRUSZlBN5H3+TxgoETlH8NZnGgu287lIiZ4row4XcNsaXEuyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <94176748-8438-460d-9434-6d18add55cef@amd.com>
Date: Thu, 29 Feb 2024 13:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: clarify support of booting 32-bit Xen on
 ARMv8
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240229121352.11264-1-michal.orzel@amd.com>
 <d1b7a4fd-0754-45f7-8c58-db36f0e94cfc@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d1b7a4fd-0754-45f7-8c58-db36f0e94cfc@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 900772e1-165a-4917-b4d9-08dc3923474e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dsQtToHyy0ikv7aOZE5uYK4gz4QYnkY5kbG4Xeg0U+lYUmw5sY5gW8Ze8pLZhsS+Bc9KyxVCzpKL/IP4bvLaHe54dFEcSOw4D47XY6jwTdxCvxyl8G1Pkihgi9f/vf1l8ZBjqQMAXJF3mI0r4URFGdVIHqkOubHNSGD2lgWQJB+j0AWACfjiWosaYlrK4bZJoZuqSI9D20HD60VyJ2mvz3D13o7sdol/Rxi+PlXmSYQ1jPqxAMtSriFDNNbPfgps7j0td38v+xmw3Vl5+keJueHnGY+IFm7gT5xPFGk25tjFO9EqQXnlB4cMcVCy21ZnpD4elesLGBnrw8jY+Ap9qzwuZsh7fZylQrNr1XREz6Ua1j9qLT1jUoVSlRvMpDJCBYArws61czYeWuPn7gzbtkSGv3iZuLWgN+JSJDASaR7M6At0JmNtoy3Mz/pG9sJd2qB2T0CaWGi2Jyxpk1lPHJN4DiIRcbZxO1LFb7nwwWd+TLNb0scFWxsRSY+eJ/i1B0DBXVPTgS9ffHStKaOgbAoXykVLpHJ+HfUUxs4ysYBxnf0NMaZ9bPlazDi3q6yfcYYdU+ppDoRKjAgyVDDs7CdvbeMXXasxmcvZkk/pLxg0r98BjTrTF9040mHlt/2ccuE9Q/OJZJ4YuWaAdY9krZglQo5rHVz8RmR3sQ7l8gd0ZRa4LbfRBUZ0Grpf4QLlMsqGJ73oFiLJlj40Z3xY37gVXTspUSYiMSya8nNQQjHMXFsR7rAw1Y2yP/LGtVBp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 12:38:06.1653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 900772e1-165a-4917-b4d9-08dc3923474e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024

Hi Julien,

On 29/02/2024 13:35, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 29/02/2024 12:13, Michal Orzel wrote:
>> Since commit bd1001db0af1 ("xen/arm: arm32: Allow Xen to boot on
>> unidentified CPUs"), it's been possible to boot 32-bit Xen on ARMv8A CPUs
>> in AArch32 state (assuming HW supports EL2 execution in AArch32). Clarify
>> the support statement and mark it as Tech Preview, as this use case is
>> uncommon and hasn't really been tested/hardened.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   SUPPORT.md | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index a90d1108c9d9..acc61230bb5e 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -40,6 +40,7 @@ supported in this document.
>>       Status: Supported
> I would consider to use 'Status, Xen in aarch64 mode: Supported' and then...
> 
>>       Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>>       Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>> +    Status, Xen in AArch32 mode: Tech Preview
> 
> ... move this line closer. What do you think?
That works for me too (+AArch64 instead of aarch64). Shall I respin the patch?

~Michal

