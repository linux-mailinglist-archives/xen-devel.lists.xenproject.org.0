Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175A7809EE7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650457.1016003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWtl-0008GU-JQ; Fri, 08 Dec 2023 09:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650457.1016003; Fri, 08 Dec 2023 09:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWtl-0008Ds-Gd; Fri, 08 Dec 2023 09:11:53 +0000
Received: by outflank-mailman (input) for mailman id 650457;
 Fri, 08 Dec 2023 09:11:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8K7=HT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBWtj-0008Dm-Db
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:11:51 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1534b87-95a9-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:11:49 +0100 (CET)
Received: from CYXPR03CA0050.namprd03.prod.outlook.com (2603:10b6:930:d1::15)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:11:46 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:d1:cafe::2c) by CYXPR03CA0050.outlook.office365.com
 (2603:10b6:930:d1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Fri, 8 Dec 2023 09:11:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 09:11:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 03:11:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 03:11:44 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 8 Dec 2023 03:11:43 -0600
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
X-Inumbo-ID: d1534b87-95a9-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khMC9aDOruLLa5F/IqaKKIfwX5s0+mUYi22s4z2TVoG0lB8kGBZAUXeEEuHAta8UsfmHxsu0dR55CAAwRjPnMjMfFXOcRk2NneZU8n2d8n8WULPT/4Yog/DYS5VLN+GWZsdTRjHmLmeLX56mzZlPLx9O6PTvAGlzeUbUzytuQBBFHGfzr4qnEA0yYX+psUC1yvZ4dMvy4729VnpTP89k+VwIauPsnf/UjRTMjC5k3J7K8H4xr1cLvdh8b8W8csVU5okIQC0veH6qyOg6Pg8UrwIt/cWKGILwkWPpOBHLm6qWbcTaskXMsHEGrqqln0Wlc1aK+wLCOcXY/2PstTveBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3546FDg0OybIYPKSTH+XvX3nSuAMux9QhzEIe4NfNU=;
 b=cJFORTYr+atSpB+bDMuPBDIN2Off/IRI7Y9xaHE5M1CyHmcMfDgfR/XMpBzks0aem1JUat0TovG6EajDRF5/4X2gUd6EdqUbu9+a/9Fl6WBSQwAQm703PFX6y9y2D1nUbCQPN+WuAokPz2gVnUHIrFDFXWsK1BcMr0UVxXnx86eL6FYzR4cnUxnQZ+gJ2W9uUtDwQhR5ybDBtGkEN5KjsB5pmDxnXFTvwkF+IhLN6iAJ8r9hBAB2vIS7vizKulds5rNXFjDioOpaQTD3rnYIt8BLLhOa9Lw7G0AUY1Lc99sZH8lhoYJFgSx8sCbQkWINOi2daDXKHqFrb33anYhozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3546FDg0OybIYPKSTH+XvX3nSuAMux9QhzEIe4NfNU=;
 b=EAxPVX7nD7jplbnjUUlGakNZqpwPQ3vPHx5vTg4vDl8l+zVgEzbg/eFP6GNE1+BjBisMjWwmi1T5cSZPsw9avgl6v7p9ntqnIA0isjZ88fcFtPFDiB/JJGbFB0yLbZPrrQVbPLyJS/+ABrOJrQFEhqRkqbRKB0FLjqMw27DutrQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
Date: Fri, 8 Dec 2023 10:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 6408146e-407d-487a-0e73-08dbf7cdb3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+DGZMV+MNlaK+06Q4s+S31b+f3TSkJlz+cDbLUhdcyXAt0PTN/OWdx2/ydgsMUOP4g+14i+BFzkC3USO4+RIzxYHcHJTKLv1t0nGzh4aJ7gbEVqnwwF+fxDbe6q+sdeGv4M3psS+oQBBBEh7sawYR/bQVp7g8DEqdWYnTdf0LNHqnZo6Gmm+PULMWU6JxQw5nJnOA/zI6nnoNgwiZX4ItbAIpvJzPkAl9qXLXo0gB4FCwamJYsj0yf99UvRo0YnOtDLhFiTB+l2+nCdrSG0t8Ozxs6uIvSRl5nTuS6kdYgh7Rbiimefj3RpgLunmUOwEj0UQPoJG/Ip7xziRnBjdf0WjSCfykxDc2WzMU9gDq9wBxaERSee2mzav1Gw2kou5ZMBr/a+VoLPPHsdjjIWqIBKC+FwotwLhJq9ZG0kyj0fFLGizflJXy9TRNKuuBKFHU8Zv+ph5619mg5V0Ixxg9gKsvClqEX5DXU0RNflR0nwjg4KOdj19ARNr9IuDn7H7C9k5HhgxD/6eoMID3XStu5TzKs/1ux2EbwkvwKuOvS22Z5RDzTwFIyRiIK8So+717MFlBiynHd286tWtJ80j4P0ogNOZo9lVvz+J8m9dDdm+BvMebxlv6IT3wGiLyPE0Bsa3t/PP7gzgOIP3sYuT8bfKCzPblpnzVr2D3hZMd0gzvdadxeY/oO0lnk66O2rswW1jeMZYSStM97nsI8LUdcz1ihZVWPUY3PWTHE9oXPZzsL/zXjainoXqpPqrWUggXcNdsZnl8VL7/QjhEm/n/WhNgnUpntvRPzfcFJF5VHA1mvOrvuuDK0KyYfgzN+8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(4326008)(8936002)(8676002)(36756003)(86362001)(44832011)(41300700001)(82740400003)(356005)(40460700003)(81166007)(426003)(83380400001)(40480700001)(336012)(2616005)(47076005)(26005)(36860700001)(31686004)(6916009)(70206006)(70586007)(31696002)(54906003)(16576012)(316002)(53546011)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:11:45.7806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6408146e-407d-487a-0e73-08dbf7cdb3bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120



On 08/12/2023 10:05, Henry Wang wrote:
> 
> 
> Hi Michal,
> 
>> On Dec 8, 2023, at 16:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Hi Henry,
>>
>> On 08/12/2023 06:46, Henry Wang wrote:
>>>
>>>
>>> To interact with the FVP (for example entering the U-Boot shell
>>> and transferring the files by TFTP), we need to connect the
>>> corresponding port by the telnet first. Use an expect script to
>>> simplify the automation of the whole "interacting with FVP" stuff.
>>>
>>> The expect script will firstly detect the IP of the host, then
>>> connect to the telnet port of the FVP, set the `serverip` and `ipaddr`
>>> for the TFTP service in the U-Boot shell, and finally boot Xen from
>>> U-Boot and wait for the expected results by Xen, Dom0 and DomU.
>>>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks!
> 
>> with 1 question...
>>
>>> ---
>>> v2:
>>> - No change.
>>> ---
>>> .../expect/fvp-base-smoke-dom0-arm64.exp      | 73 +++++++++++++++++++
>>> 1 file changed, 73 insertions(+)
>>> create mode 100755 automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>
>>> diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>> new file mode 100755
>>> index 0000000000..25d9a5f81c
>>> --- /dev/null
>>> +++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>> @@ -0,0 +1,73 @@
>>> +#!/usr/bin/expect
>>> +
>>> +set timeout 2000
>> Do we really need such a big timeout (~30 min)?
>> Looking at your test job, it took 16 mins (quite a lot but I know FVP is slow
>> + send_slow slows things down)
> 
> This is a really good question. I did have the same question while working on
> the negative test today. The timeout 2000 indeed will fail the job at about 30min,
> and waiting for it is indeed not really pleasant.
> 
> But my second thought would be - from my observation, the overall time now
> would vary between 15min ~ 20min, and having a 10min margin is not that crazy
> given that we probably will do more testing from the job in the future, and if the
> GitLab Arm worker is high loaded, FVP will probably become slower. And normally
> we don’t even trigger the timeout as the job will normally pass. So I decided
> to keep this.
> 
> Mind sharing your thoughts about the better value of the timeout? Probably 25min?
From what you said that the average is 15-20, I think we can leave it set to 30.
But I wonder if we can do something to decrease the average time. ~20 min is a lot
even for FVP :) Have you tried setting send_slow to something lower than 100ms?
That said, we don't send too many chars to FVP, so I doubt it would play a major role
in the overall time.

I use FVP quite rarely these days, so you should know better if this can be perceived as
usual/normal behavior.

~Michal


