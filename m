Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4C72F76A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 10:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548574.856550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LZg-000758-7k; Wed, 14 Jun 2023 08:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548574.856550; Wed, 14 Jun 2023 08:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LZg-00073N-4N; Wed, 14 Jun 2023 08:09:52 +0000
Received: by outflank-mailman (input) for mailman id 548574;
 Wed, 14 Jun 2023 08:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nJe=CC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9LZf-00073H-8i
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 08:09:51 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4059425-0a8a-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 10:09:48 +0200 (CEST)
Received: from DM6PR06CA0076.namprd06.prod.outlook.com (2603:10b6:5:336::9) by
 CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.44; Wed, 14 Jun 2023 08:09:45 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::1a) by DM6PR06CA0076.outlook.office365.com
 (2603:10b6:5:336::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.36 via Frontend
 Transport; Wed, 14 Jun 2023 08:09:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Wed, 14 Jun 2023 08:09:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 03:09:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 14 Jun
 2023 01:09:43 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 03:09:41 -0500
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
X-Inumbo-ID: d4059425-0a8a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9CsL5yXVYh3tPYkwD+Agb1Ak3SLkEcOueSpLYxtljZNHxVzuqjnI4t0TrjLJYfCxeL56mbdLI4GmbRpXkkYtTUy1uM072jCEpUnmi1qWzRMGWJJwUatnnJOPqr7rg1VvoNLy2//cGXMXdPxZScs4JyhVLLplzqpxnhCWngB6AD7Ge/ZaloflJ1L01FT7AchPpRjiNO5IUu0LUkC9nY4YR++jbjnZeeIOoYChDlB9XxT/h+fyUrhkg9R7wKKEMjkAx4K3iZnIV19Jhtc84b5oRKKNh5iTtXYb4M2fsxB1OHK69Eyv2yzlaaYR/SLP02/6LXet1Ee/G8WACnVgVAzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXdTZvQddnn9tDkcSVp70wA46r1lK68Zs0r330WqhS8=;
 b=PKL/EMGB3txthkRs3FARp9Jd/LoPZ/x/ejIY3V7SAx//7ZBTuk5ssoQycbdAWDFdz5oxi87QiMjzirb0gfX3++mJWLq87G6TSdZu4LBClabSKlRMmZTnZ87u3Wl3KKHeLnx9mqCpmQpcRDC9RKdCb1FZ3t10Ir2sfxcbYt5bM1eAevzm6aOWkrQXTQI/AAnoqfI8g01Q8pKarWDe6XLk6zcdy64X72ko3SunMBis+QTN3HTacslh7lxpSUBp7lJWOSWqV8aYEbYptP4yUJd5wAnAUMK0+pkFQrZTDsKuqzEQ+xP6DcQFHkF8F4rfvDlNwZa4Qdg+vSyYZ/qmYzYhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXdTZvQddnn9tDkcSVp70wA46r1lK68Zs0r330WqhS8=;
 b=GZJigb5UvRGD1zyW6ny5tr2N8liZDH6X4Kla9sgAl/7pN6MfkHM9tzIcKbzfA7O/0DbheXMMID0rx11Ny9/qNSGfMmLnuCq4AF1uA5gOAgB0xBnjECpypv0MsPA4Lv54Z50+pnCqJgE8ZVk5wkHSVSDg0tVZs8crQc/2PlXW6p4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e9353bd5-a0c2-0451-0c7c-8778b3c285f5@amd.com>
Date: Wed, 14 Jun 2023 10:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230614073018.21303-1-michal.orzel@amd.com>
 <261ab0b0-91ed-e6b7-730f-0ecb8a7b5635@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <261ab0b0-91ed-e6b7-730f-0ecb8a7b5635@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0ae632-5182-4a27-05ec-08db6caeb6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hl6l+LzEWc5iQPBMVLi+1zokJuMd/RsC5vkjuPFNq5h+1mTQrkHZkV9WGakSg2ZFnHYSNO5ADz1+QLP11nnk+3kQwo6o1+UUFIlKCdXBPEbKwUaJAAFuzeEtfQQ7S55VEarC55JTQ4AxiEQq7cnkVF5UA4xkyrP3VqgUSyy5Rc8txoPK28raIsxrUbm0Ry+clmal9GIrX9D31T2iJxvRBsQIYPtnnxz9aGdBAogtvQ1R3+lV8/UwrgUvmd1wxhqgGUtrHjmLtCL9jOeGiiZlWXa0fwdNfL+LiwufQyqciaC72nwz+jPOSaOAwBAGEhWVdzfvJQx3itEjYQ+639E+stCmhYzAYOhh8BbjuzYF1IDP2E6X5UH5BDKch6cKYGb7AL9MXgcnQR8ojKqqeB4k+PFvXqlqhFG7Na0N0mDt2payKD+HmgSfOEmVH84YGqjWlWnv8PCL9Jr8xTasCMyuAGp9DWh4lQiFHZ0wDCPk7aAZgOLbeC7QMGQGkMnOiYZU7leGzxgzQpgwzyFxBY4M6DE6ur2HcQlJZDOoGzap0ynNFkN68Ik8c1lA8a35g0qoZ79Uw/W5pMiz+fYftsfrJ5I3gO0twZlTWSYk2usyL19dzyFrDG/CJQ9zKPEU9+avG5nWeV5tLtryz7hNMpy6RoZ1BUtZ7ALA/dPxcEspZvK6mVNh6R3pMgznVQFz8+piqACm4TA+XG5wC/m+g25Ml8oo8dOW0ctziUiTCCiBEPwl1q38cKRNTDKm+eEd63YMJ1SuftWYjBsjEkz8D65I++RwRdWCp70oR6vvdTrtU0V8GgPdKO3UgyXBLJZoC1R5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(2616005)(40480700001)(54906003)(16576012)(40460700003)(110136005)(70206006)(82740400003)(81166007)(5660300002)(478600001)(8936002)(41300700001)(8676002)(4326008)(70586007)(316002)(186003)(426003)(83380400001)(356005)(36860700001)(47076005)(26005)(53546011)(336012)(31696002)(82310400005)(86362001)(44832011)(2906002)(36756003)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 08:09:44.6341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0ae632-5182-4a27-05ec-08db6caeb6a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220



On 14/06/2023 10:04, Andrew Cooper wrote:
> 
> 
> On 14/06/2023 8:30 am, Michal Orzel wrote:
>> Missing newline is inconsistent with the rest of the callers, since
>> panic() expects it.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> although...
> 
>> ---
>>  xen/arch/arm/bootfdt.c            | 2 +-
>>  xen/arch/arm/domain_build.c       | 6 +++---
>>  xen/arch/x86/cpu/microcode/core.c | 2 +-
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index b6f92a174f5f..2673ad17a1e1 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -225,7 +225,7 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
>>                                   size_cells, data);
>>
>>      if ( rc == -ENOSPC )
>> -        panic("Max number of supported reserved-memory regions reached.");
>> +        panic("Max number of supported reserved-memory regions reached.\n");
> 
> Trailing punctuation like . or ! is useless.  Most messages don't have
> them, and it just takes up space in .rodata, the console ring, and time
> on the UART.
> 
> I'd recommend dropping the ones you modify, and/or cleaning it up more
> widely.
I will keep in mind to do that in global scope in the next patch.
We also have quite a lot of printk() with trailing punctuation.

~Michal

