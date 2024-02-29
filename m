Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FC86C962
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:42:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687029.1069758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffju-0002nV-Aq; Thu, 29 Feb 2024 12:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687029.1069758; Thu, 29 Feb 2024 12:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffju-0002lP-82; Thu, 29 Feb 2024 12:42:18 +0000
Received: by outflank-mailman (input) for mailman id 687029;
 Thu, 29 Feb 2024 12:42:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aH8z=KG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rffjs-0002lH-Tn
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:42:16 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f64b7f02-d6ff-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 13:42:14 +0100 (CET)
Received: from BL0PR01CA0029.prod.exchangelabs.com (2603:10b6:208:71::42) by
 IA1PR12MB6649.namprd12.prod.outlook.com (2603:10b6:208:3a2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.39; Thu, 29 Feb 2024 12:42:10 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::6b) by BL0PR01CA0029.outlook.office365.com
 (2603:10b6:208:71::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32 via Frontend
 Transport; Thu, 29 Feb 2024 12:42:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 12:42:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 06:42:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 04:42:09 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 29 Feb 2024 06:42:07 -0600
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
X-Inumbo-ID: f64b7f02-d6ff-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffE9xrQH2Klfl4B00RouhcSdKwYBg0LPc4CVtV1yQz75N+P+6p/r1U3f3eY9A5FOTAbPAirZzUn1tFSSpjMnL70sINR2mai3u+eXYLA72qp05q9kkEYo9GKrn56C3KW4x3ocIgsMDD7ErcsJKaR0s2HgOrC4ZIa982INX4067hNX1H24q49mm0FiYhxqCJMECEGCfDlNDZ6TCO/qyAwsNvYQOZfxVJdrQ+7g2PyGE2Mw3+2k82/h781IdFCBAJmWAuyv8D82RgAV7p3IkqHj9buZPbs/y/7d/reBvtA/VdkHae/6npkV9Pyc9RrK/nOQVe5yLB1hQRHNetTCdFl0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR+/1AD3CcTgZburua/5KcSDzg4uv6mZ0FR95VNhb44=;
 b=EArdR3jfmAx+05yN78+0QkkaDcHKiLxzIwydiJ9JScYRXoTn+lo/6vT2XFGuotoucgnq9WB6z/PADw03wogO/sGJNBwHHqMcgAHsfQ8i8ZNPMQoDY4YIhQ9CBS9QDPqEdQCUHxFLMXgOFiHbUgso/6oZejC82/XHhPlPdEc+G+ZgH3+7Qz6xZ4WLhxsB7qfxF467ICwkluj+w4v1AvzFkMI1y7G+VcEdvXbhraV6noj1qvKqfRGF9T46+rp8mkE5OZNnjUqlPnoo6MitwWzFQBxL2x++d0rVZ850fDC/f6/viu0j1Sb/geCzIORwlFABCy5lAbMz2k6BOWmoxulruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR+/1AD3CcTgZburua/5KcSDzg4uv6mZ0FR95VNhb44=;
 b=r2+9K8rriAZT0OrNS+Urj57+vONvp2mIjMaYjvK5UgsAuporIz1nOdpXcwXFb1M/iXnRe/soEcv0CYFyRILUr0QcEybt5hQyxCMeXdOk16irrjcyNp9mzroNn6YSSxs02phXS1YICDvpsIQewXw+5bLYQ1us05VYFee+bidfV5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <216e9119-a7f9-43f3-80f9-f1c15685cad3@amd.com>
Date: Thu, 29 Feb 2024 13:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] SUPPORT.md: clarify support of booting 32-bit Xen on
 ARMv8
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240229121352.11264-1-michal.orzel@amd.com>
 <d1b7a4fd-0754-45f7-8c58-db36f0e94cfc@xen.org>
 <94176748-8438-460d-9434-6d18add55cef@amd.com>
 <544718e1-4855-4af1-a450-6362a8cd08f0@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <544718e1-4855-4af1-a450-6362a8cd08f0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|IA1PR12MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: ced1f797-014b-45f6-ef40-08dc3923d886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8gdnVajq/gKzVfQ+e5PcmVlV3Xhca8+SXXRiHlEBYAoBOqbLno3a16n28KzAEBq6WqMIGfq9vydhFUc/Xvpu16k5Q2gYzZnG1IcUEQjqRRh3Udbnr/ZgRoSAUzUpBRQjoBCUqNU4NxH9EEpA3l62Xo6aiiSU1XK6dxg/aQ4NSeqeoLUy1RIeNhwbnVeWd5DiU6R5b9vxpjxn5yW3fNI/ETQ3FxzaOSpmgwtPzDP60Mwv+HWhWOlV1g76eMkuv79caykK4aLMyoQPlk/v3gsDnBvP57hPO7j9lR1CJGcavE1a3JoFT50K6gOdWbXmLU5lEzz3Nd4kN8DQ5j4poJro73q0XyWc6H2mG7ThsUqC+yH5vzWKBUQ0ZSXtA4hmSyb1BkHteZRlLxieFh6MmXOFssvcQIy/mrieVyQC5P6XjeQo1CFGFcMtJ1FJUG3NBT7We0jhqRq7Uq5RU7YAQlVk+28kY4fWt3fhs+6DYsYBFiCO8/WHz7nZZQHyvP1r8xSjXoCuz+HJA/8mojUNP0sRWJ/Fo0ShRTEVVd0dl0nzd7zIBRtK4Trj33Rx0EGFNPCTpu7TYprXNgxqVJPSVxXQc69UPGOsp97EGEVfNYjoqYNfNxi1wojaRyRf3QMxOzuziJHEgHghmWYAo2T2VB0hXAzYGC7gTYz326+R/8/9Pj3vS/2526di4NZq3sE3umdh1q30cmS+1x4VjF+bWthao+vVYHCazMlSb9kqxVCDciOrqjvdbjobZLCfGRHz83yA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 12:42:09.8815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ced1f797-014b-45f6-ef40-08dc3923d886
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6649



On 29/02/2024 13:40, Julien Grall wrote:
> 
> 
> On 29/02/2024 12:37, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 29/02/2024 13:35, Julien Grall wrote:
>>> On 29/02/2024 12:13, Michal Orzel wrote:
>>>> Since commit bd1001db0af1 ("xen/arm: arm32: Allow Xen to boot on
>>>> unidentified CPUs"), it's been possible to boot 32-bit Xen on ARMv8A CPUs
>>>> in AArch32 state (assuming HW supports EL2 execution in AArch32). Clarify
>>>> the support statement and mark it as Tech Preview, as this use case is
>>>> uncommon and hasn't really been tested/hardened.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    SUPPORT.md | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>>> index a90d1108c9d9..acc61230bb5e 100644
>>>> --- a/SUPPORT.md
>>>> +++ b/SUPPORT.md
>>>> @@ -40,6 +40,7 @@ supported in this document.
>>>>        Status: Supported
>>> I would consider to use 'Status, Xen in aarch64 mode: Supported' and then...
>>>
>>>>        Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>>>>        Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>>>> +    Status, Xen in AArch32 mode: Tech Preview
>>>
>>> ... move this line closer. What do you think?
>> That works for me too (+AArch64 instead of aarch64).
> 
> Ah yes. I keep forgetting capitalizing properly :).
> 
>> Shall I respin the patch?
> 
> Up to you. I am happy to fix it. But I will wait a day or two just to
> give a chance for the others to comment.
That works for me, let's wait for Bertrand and Stefano.

~Michal

