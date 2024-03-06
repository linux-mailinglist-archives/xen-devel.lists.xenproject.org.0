Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF29872FF1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 08:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688973.1073827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhlyN-0005lN-AL; Wed, 06 Mar 2024 07:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688973.1073827; Wed, 06 Mar 2024 07:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhlyN-0005jR-71; Wed, 06 Mar 2024 07:45:55 +0000
Received: by outflank-mailman (input) for mailman id 688973;
 Wed, 06 Mar 2024 07:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDSj=KM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rhlyL-0005jL-0P
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 07:45:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c86527c-db8d-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 08:45:50 +0100 (CET)
Received: from BN9P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::12)
 by DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 07:45:46 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::d) by BN9P220CA0007.outlook.office365.com
 (2603:10b6:408:13e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Wed, 6 Mar 2024 07:45:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 07:45:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 01:45:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 01:45:45 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 01:45:43 -0600
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
X-Inumbo-ID: 8c86527c-db8d-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVH8okqh0vq2WyZNx5oH4mDtkyAHdGLc5mNRJ8gqoRJ6grQ+koj/Ro9nnWCPvtV2zxuBEVgs6jWuiLS383Q3WAoKpGjntLYs7B5JIMY8sFlXZMC3mxBr4xfmTTYipRl1eQg7SkoRtO2004TKwfH7CSWXQMdseOtypUrTpDucH0hyXRdWNlUyzjr7xUq7UI1BUoE8T8+e1Bwi89T9sCJXIil3DtcV+amuKC0O4rJB5JMXYWNRf8s++9tHkHPShV+fG6gM4TCpxbJXGrJaJWt7cewGoXMKhGIBVYFeT4xg6OPCLvaBKuf+QOwiefuZHo3LqQhNULKSMvwx0kkQ32VSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NiyVVxkm7qwYRYm/eVn+i/fZI60GXvgZNgQfOtD4RI=;
 b=ffnu5nrGM+d4pj9yL/WlPCKfdGnowzF+qlbRp7pbZiLDsEwKgK6m+GzEY/Cr7MNG2zx/FyP8vf1wkS2Ur1zaj2bNWqZOiY35UOCUkfwUDMBTRSdOvgj8EVKfAf8dB1Jllg8Kt3KnFwpcEK30HNmvFnBQqwZc9Yw0PmeOneT2n/AK6KryRfibXhHGwHirxeTvOEZtQTG/qy1CsdTJBYyQJjt5+9dT2+FlACSCHe5iHDzYCohrqrZ2kSZOxvT/9XauOUe1yUUb54oo7B+bbTpV72HibmdtjVb4TkoFSADjHCfaSFRVUtECBPTO8IH+hRyrGjtUWfiO6rqZrj/7NMShzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NiyVVxkm7qwYRYm/eVn+i/fZI60GXvgZNgQfOtD4RI=;
 b=WVlxbIXY79CVf7/ikDvA04SDf1o8bcIt82WEbyYbaG9FyWL8lY4q7gTbuuQ0fnl2SOKCbe1nyVJ9cKnHESSoSzrP2Piwg4wZIAebzAvFjdeV0SxnQGAlRDLZ9rUb7TtSfcZaZ6vf9M0OobqtHi5wq99Yxuu/LyfQSQgWl+11Pf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7b59c858-a988-46ca-b5fd-41074970c2e1@amd.com>
Date: Wed, 6 Mar 2024 08:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
 <ce705871-bda9-4518-96da-010f24c98512@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <ce705871-bda9-4518-96da-010f24c98512@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS0PR12MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: efb5605a-c0c9-4043-ac59-08dc3db16ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dZvTRjw5NnmvS73ZWinvyV0XsEEz+mt4+TPvCF1Waz/FZ4j5R35CXa+BY9GYP4Cz0IoQHm32oJvT3Gequ1eWFolEVuk3keefeSyER0uHWvXuFatv4fW4wJ2ctdiyVW5Dds7/qG1pDMU4KrpF1l2fdgQ3PRZlgzGh1FTlb4kY+7r3UJ8qnekZQgVmppZb5WsqtYO8WTroWHuiduJH4g+oJoaTmbfcvl2yQd5uEGBHHpuQd6CZP20lJ+jtqcGSyIQgeHnow4sJHIgHJNbgjNwz4EIVFJIrzFtlYV1E1uwq0po1g8j+kzuD852LXsLF7pcUxwG2VgDFh7MU8UV6gns7qa/8dRMyw6z2Mk9ny/gRo5MSifK4kqp3+LbtuUAPsfXRY/tl2rOyTJ5o4Ss2buTOnfeNWWHWPPBvh8UYzSxAqyim6WQKY28u8zNjuDxFlikOehBxHL0o/IqaGicphzzCplKm/79T3UPrv4rryhN+tEgPrQExlB0YsxXU49IGZvckTYePmUhZquY821qbCdra2fY5Twj4ras+2EbgBtlTZ10m+2EF+ffQK8xILvJwO1tzF1bZ9EXbIpuehjSyL+yvZU8tifpE4ccsEUlWbnY2Vs0kh999K7ftR6qQTqjnuiSJX7iyIAI3h+lkxfQ0z87HkiqXhc+vutblE9+WFZLzhevG+25uuPx9sH0tTafZI2Q+ITAZeLoECPXijDOECZ7mwopTYIuV2ZYCeujRPA5zNayWMcZPkTj2JLhIKbprgJU3
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 07:45:45.9267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb5605a-c0c9-4043-ac59-08dc3db16ef3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6391



On 05/03/2024 20:24, Julien Grall wrote:
> 
> 
> Hi Jan,
> 
> The title is quite confusing. I would have expected the macro...
> 
> On 05/03/2024 08:33, Jan Beulich wrote:
>> There's no use of them anymore except in the definitions of the non-
>> underscore-prefixed aliases. Rename the inline functions, adjust the
>> virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt() one,
>> thus eliminating a bogus cast which would have allowed the passing of a
>> pointer type variable into maddr_to_virt() to go silently.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
>>   /* Page-align address and convert to frame number format */
>>   #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>>
>> -static inline paddr_t __virt_to_maddr(vaddr_t va)
>> +static inline paddr_t virt_to_maddr(vaddr_t va)
>>   {
>>       uint64_t par = va_to_par(va);
>>       return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>>   }
>> -#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>> +#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))
> 
> ... to be removed. But you keep it and just overload the name. I know it
> is not possible to remove the macro because some callers are using
> pointers (?). So I would rather prefer if we keep the name distinct on Arm.
> 
> Let see what the other Arm maintainers think.
I share the same opinion. If it's about double underscores that violates MISRA rule, I think
we deviated it the same way we deviated unique identifiers (IIRC).

~Michal

