Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78089EB63
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 09:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702930.1098613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS1c-0007La-I4; Wed, 10 Apr 2024 07:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702930.1098613; Wed, 10 Apr 2024 07:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruS1c-0007K3-EH; Wed, 10 Apr 2024 07:05:40 +0000
Received: by outflank-mailman (input) for mailman id 702930;
 Wed, 10 Apr 2024 07:05:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=23xn=LP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruS1b-0007Jx-As
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 07:05:39 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb48e2f6-f708-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 09:05:37 +0200 (CEST)
Received: from CY5PR15CA0144.namprd15.prod.outlook.com (2603:10b6:930:67::11)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 07:05:34 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:930:67:cafe::5a) by CY5PR15CA0144.outlook.office365.com
 (2603:10b6:930:67::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 07:05:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 07:05:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 02:05:32 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 02:05:31 -0500
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
X-Inumbo-ID: bb48e2f6-f708-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D01+JqgpcXFSnItoaLxsZKsp8LY2aoJrT941NWyxVG0oyxy0NQDFrdIwu6RvVQXz61mxA4ksDqSdU48/6ldJzv7pFWuv65/CtJZoHb4vz3tBGKYojbGlUkcX1Lj6pZ/FR2Txym3iMMx/+KAQWoYZEV4Mb6Qgpkht3KbaoxssaoB9l/zYSu4PBINbA3vy5VS9B7CBkIb+3Fno/dx6XqHqUjoZ7d+aHPVGZUXc/T7yEygFlTFt+6Gv+MmF1LlfWzkkQee3PhLcBKYHVDDFB8YfYUnaGCVRqwL7vDTC/pRExvuY2atnWiK6i2YSArQ13Eh/OytLx2Pyhx7+XitRKhL5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eErT36/RII/2aOMLaO00ftmzJ1j8KmvR+NeXdBzkLwo=;
 b=AAg2rthEIuPBrwtaDgckEC82nl3F0iElO8YPxO609vm/AGiD8cfRM+AO+xXA+WiTf9BKbxWrjrVi92XgI5aIuKO+DIGgfCQ6hD8BnwK6Loegt5faKG+noN9iqzWb+9sQW76B5FnTwGEpK+1XIRPBrTvszxU6Yk75X+i3b2ePTjI7ZUqSiWmGGhXCYK/6gG+3sW3cXx+knKUdC9AhC10BvvajChSQelxF6BVcGT1/zFMULJBi3DwPv9LTR+JzYefyw7bXuvbq6VawaFFJzz+CFSCtGfIxGtNMuCnTUYmlLvLU3QsuG77rnGE6umsg3jU/R1OKPMA5rGz1YI8uRJqVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=actia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eErT36/RII/2aOMLaO00ftmzJ1j8KmvR+NeXdBzkLwo=;
 b=CKmF6JHne8oEQ9rV+SzA+SkUFRn2ayqoij3LEA4iZmK6MHgQ+7IKE/YkNuPHn7Sjo6CgjOgSRSE/TLHP/whRkito8PkYcbGXJjgHLI4Ayme/11eLZJFGm6F/jz5HrSLOtuUmn+zMafiA2CxKFPYawtLYnPWRAsIOxFKYBlnoGrY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e7e7aea9-1488-4d3a-bf96-7145236ab470@amd.com>
Date: Wed, 10 Apr 2024 09:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
To: John Ernberg <john.ernberg@actia.se>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peng Fan
	<peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
 <d02b7de4-41bf-4bf9-8b04-e21625449f27@amd.com>
 <813e9e0a-9447-4012-822a-843e1f88f254@actia.se>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <813e9e0a-9447-4012-822a-843e1f88f254@actia.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b8eb4a-6ae3-412e-1858-08dc592c9d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rpspZEY9ZYll5SAX5LTh2DdYs4xSudmXQ5XqIyJgfeRUnvDJgdKRXSVbzN13YzsLcfDvdRORb3PMA5FJ7DrxBDSC25CaGKlSsuEkEKxMjoLtdUSsSHqh9qRVG1j6oQ6a6JCfxejxWgmgH1wOL9pOBHPusmdGENnZJAjR2nPa/uJ7wz1OP7mHZ5Ni4lGoKrQ4FqGSez7m3lYcN5/xa7Ssryes9W6a3eI9UxP7+JnIOCqKjzHA7HDngKQdUaQ/9fXxbebwKjq+Jo3FhQoGvE+x5vtipiTDX9EAT67kA4owh8i+4Be8bceBxkKbK3Hy0wZFVDQOf72XZf8DL608cVFGn+LAIeqFcw8R7gZf+8iS6YPZVXVAvH35Dl+AmxgsydKIYPVHB4b1Pt7tiaLOSydLG8MYKsW5tdcfXK5/3z6vVFagpFsWcPYVcxz/aXTAhMYD3VRX/fznYNst77ZWYgsJP4t8cmq/ZoA8X4DWNf7Lcr9Fn8l9CheLiLHnp2NESUrdyEaYXUBz3TxfZTkOeNB5rSewURMgbZ5HVgrKwl57dkmNROIXoxPw6+LeyIekRifyEgXt1S2xFpo7apkj3+MGB5QkxkNT3rUDB2WWbJkg1VJQeJ2o/RQeW6/Ag6ENMtfUE/tYDxm9NE8kw/tajsK7aaoU5EbrKBJGrcoX01Cm4ex7nFrrN4tvdBEAKCBfcv67ndNp+Js54uDh2rMZnDaUcA6xn10apAEcMsBskM66pVr01euyeG42GowttLsVuzGV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:05:33.3672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b8eb4a-6ae3-412e-1858-08dc592c9d73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367

Hi John,

On 10/04/2024 08:53, John Ernberg wrote:
> 
> 
> On 4/9/24 8:47 AM, Michal Orzel wrote:
>> Hi John,
>>
>> On 08/04/2024 18:11, John Ernberg wrote:
>>>
>>>
>>> When using Linux for dom0 there are a bunch of drivers that need to do SMC
>>> SIP calls into the firmware to enable certain hardware bits like the
>>> watchdog.
>>>
>>> Provide a basic platform glue that implements the needed SMC forwarding.
>>>
>>> The format of these calls are as follows:
>>>   - reg 0: function ID
>>>   - reg 1: subfunction ID (when there's a subfunction)
>>>   remaining regs: args
>>>
>>> For now we only allow Dom0 to make these calls as they are all managing
>>> hardware. There is no specification for these SIP calls, the IDs and names
>>> have been extracted from the upstream linux kernel and the vendor kernel.
>>>
>>> Most of the SIP calls are only available for the iMX8M series of SoCs, so
>>> they are easy to reject and they need to be revisited when iMX8M series
>>> support is added.
>> Stale paragraph. Should be removed given that the driver targets only Q{M,XP}.
>>
>>>
>>>  From the other calls we can reject CPUFREQ because Dom0 cannot make an
>>> informed decision regarding CPU frequency scaling, WAKEUP_SRC is to wake
>>> up from suspend, which Xen doesn't support at this time.
>>>
>>> This leaves the TIME SIP, OTP SIPs, BUILDINFO SIP and TEMP ALARM SIP, which
>>> for now are allowed to Dom0.
>> BUILDINFO, TEMP ALARM are leftovers from previous revision.
>>
>>>
>>> NOTE: This code is based on code found in NXP Xen tree located here:
>>> https://github.com/nxp-imx/imx-xen/blob/lf-5.10.y_4.13/xen/arch/arm/platforms/imx8qm.c
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> [jernberg: Add SIP call filtering]
>>> Signed-off-by: John Ernberg <john.ernberg@actia.se>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> The commit msg can be fixed on commit.
>>
>> ~Michal
> 
> 
> Apologies for forgetting to adjust that. Let me know if it's easier for
> you if I do a v5 with the fixed commit message.
> 
> Thanks! // John Ernberg

The series is already committed and Stefano fixed my remarks on commit.

~Michal

