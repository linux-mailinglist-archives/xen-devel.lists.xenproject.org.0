Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E244066D7E9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 09:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479064.742657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhBM-0004mJ-8U; Tue, 17 Jan 2023 08:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479064.742657; Tue, 17 Jan 2023 08:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhBM-0004ji-4d; Tue, 17 Jan 2023 08:19:00 +0000
Received: by outflank-mailman (input) for mailman id 479064;
 Tue, 17 Jan 2023 08:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHhBK-0004jc-Ep
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 08:18:58 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94d996ff-963f-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 09:18:55 +0100 (CET)
Received: from BL0PR0102CA0043.prod.exchangelabs.com (2603:10b6:208:25::20) by
 BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 08:18:52 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::2a) by BL0PR0102CA0043.outlook.office365.com
 (2603:10b6:208:25::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 08:18:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 08:18:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 02:18:51 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 02:18:50 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 17 Jan 2023 02:18:49 -0600
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
X-Inumbo-ID: 94d996ff-963f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUl7B/smV1Gcp5rCMEDSCnh9tJ2YnOzLiFtQrES4aeL6YPSkKePbn/3DrfruF5liK3yWB3uPLyI/4r961QfpnVmyLDsOh6qPdUg4gcd97hE3GbCGlspJ//IBOmBLbO9klurCq3fiHA/bPQf+jOtfLh1Mw1nvfiPwmG9ObcDBgJo6NM4rM6QKPnUWWen9J4ph8ojYA3/Cj+JGN5XXwZ+aDP5oJhYQPh4NY8DdYAQ9ZPSC7aQKyyvIKOIlps6O7m28Ak6m0EkiSo+Q5mvjEga5Vm/dykpNL25ZgcwDg1KKvg3tz6p/4mcCFjxY5uWyydt9RMxgly3JhnAluGGfrLcceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgpEP/WjrUCJHbhWdQHNO5PYTzlfO9OU5BbSA0hxE24=;
 b=TSFUTlVLqW52goq5PoQFe2rLswVkZEUsixZ+Z3bvk5HLoU930qLRiFnacISB/vOWndXtSzpgBgFoZIee6zlz8JpWOQfHZX5tcbwF7W9v4rUs7vSh0QJlsaaBDmsfGMrnDxV3lULP/WForC6Xd38f2QirmhEh4nRCxjDXHRs1D9QpL/Supb4UKOIibWXYMdBspedl+WONNBVhbPhTvqZzS+egSMbCJJ4Wg/WOA6UdYBJ1+n++78QckLpJyejtuQ7cJF3hR5a3FW9tndsHYRPmX5CZQmm7OD1/e1v7+VURGYmybvbufreq4SOnS4YesxzElPitcGLA+heQAVWdUE+HPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgpEP/WjrUCJHbhWdQHNO5PYTzlfO9OU5BbSA0hxE24=;
 b=UzxUYBQ8GRZmVjl4SkQ/8u5SOws5mxUX7ewmj/SiKsVmBfyIGlao66WIcK5OE9CSwWngrjZLmPe3apPp2bi4uBY5fUcUOmn68p0LJqZiOnUfr2fIzH0LqeFxZzuuvVhJeA1+FmEi+F4XQY31vH4+QKGAmoHAK77VL3GN9tiD0Go=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f1db1e82-d6f7-5424-2925-d1c6d35fee11@amd.com>
Date: Tue, 17 Jan 2023 09:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
 <AS8PR08MB7991378797D89AF18F735C7C92C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991378797D89AF18F735C7C92C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9e3f22-2909-43f5-1c85-08daf8637773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NBX6FsRqLl7HGGgVTqaPnZuEv4nX4OImUQtrkwZSxsWjd0XrRhouU+bydG50g80rOvqMuvHjLBX8vcFuYoQHDFAmBXimJYlJqaNGLXOwd7GwjtCNb0spGwlD1kMOHlpJzWXr/nsHi+tbYeg2zqhRJRr07cFFGbKUkpER0lZQGkbsOE0E4F+MKO5dFN4cQhjxPicDWfOOpFkLVSOXx8jjHOZCCD9UxnLFA1pMDQmFdRxEBtA9SQmHpAsXKGEMX/9CGSuByyRjHAjqUX97lopOZ9SDX+bdaLY1i4Dg9btWGh2ph/m50jOpsw/qzD6MywznHSDnOFAz6p/+pPMzUaugJMReTOFFmf7G/S/yILkXoJrMiFFlGit5WrrDJgId9cTpbISNQ4S66Ak9L242uQhcQIOB7m7aK48j76qjLO6NVYJQ2jdja58/3fKhG19b1NELwshigxiVfUs9l/CqStcwcJUfoFKU0obnn3ffEhhrUMq+EZphT9cW2hXnaug4ZmGuYe5KKDkycA2d/eBiMqump9Av7IdEilN9hlfxW94WeYbxBD5X5Ct8HnJNaph2MKvmI/GajQdo+XlAy5KvtEYo6Bndf53u8760Ay2cIt6iU9J6KjLWlvpH85vNIR/vK2AxXzQ9OEtC82fJaU7R3mw2juVeI/DJf2AVXK/j0KHb6GRHeoPYU4d4kkvpIQVpq/AfkpLgm/92qpNc7ygZL2YvxSbKVMT0h1ncdfqT3sgBQInB5U9vVOOsTpA+KUiGYhxenoIfkDyDme3W7hquDj8yRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(478600001)(26005)(186003)(53546011)(16576012)(70586007)(70206006)(316002)(31686004)(4326008)(8676002)(336012)(110136005)(54906003)(426003)(47076005)(82310400005)(81166007)(83380400001)(8936002)(5660300002)(41300700001)(31696002)(40480700001)(44832011)(36860700001)(86362001)(82740400003)(36756003)(2906002)(356005)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 08:18:51.5361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9e3f22-2909-43f5-1c85-08daf8637773
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

Hi Henry,

On 17/01/2023 04:10, Henry Wang wrote:
> 
> 
> Hi Michal,
> 
>> -----Original Message-----
>> Subject: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
>>
>> The direct mapped area occupies L0 slots from 256 to 265 (i.e. 10 slots),
>> resulting in 5TB (512GB * 10) of virtual address space. However, due to
>> incorrect slot subtraction (we take 9 slots into account) we set
>> DIRECTMAP_SIZE to 4.5TB instead. Fix it.
>>
>> Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/arch/arm/include/asm/config.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h
>> b/xen/arch/arm/include/asm/config.h
>> index 0fefed1b8aa9..16213c8b677f 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -157,7 +157,7 @@
>>  #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>>
>>  #define DIRECTMAP_VIRT_START   SLOT0(256)
>> -#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
>> +#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
> 
> From the commit message "L0 slots from 256 to 265 (i.e. 10 slots)", I think
> the actual range is [256, 265] so probably using "(265 - 256 + 1)" here is a
> bit better? It seems to me that the number 266 looks like a magic number
> because 266 is not in the range. But this is my personal taste though and I
> am open to discussion if you or maintainers have other opinions.
I think this is a matter of taste. I prefer it the way it is because at least it matches
how x86 defines the DIRECTMAP_SIZE and it also matches the usual way of calculating the size
which is subtracting the start address of that region from the start address of the next region
(e.g. VMAP_VIRT_SIZE calculation on arm32).

> 
> Maybe we can also putting a comment on top of the macro to explain this
> calculation.
> 
> I did test this patch on FVP using XTP in both arm32 and arm64 execution
> mode, and this patch is good, so:
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>
Thanks.

> 
> Kind regards,
> Henry

~Michal

