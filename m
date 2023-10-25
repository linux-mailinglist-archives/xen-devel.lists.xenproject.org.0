Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2963C7D741C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623184.970767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjPZ-0006qs-3J; Wed, 25 Oct 2023 19:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623184.970767; Wed, 25 Oct 2023 19:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjPZ-0006oB-05; Wed, 25 Oct 2023 19:19:25 +0000
Received: by outflank-mailman (input) for mailman id 623184;
 Wed, 25 Oct 2023 19:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lpe5=GH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qvjPW-0006o1-QV
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:19:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64b32b78-736b-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 21:19:20 +0200 (CEST)
Received: from CY5PR15CA0082.namprd15.prod.outlook.com (2603:10b6:930:18::11)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 19:19:16 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::a7) by CY5PR15CA0082.outlook.office365.com
 (2603:10b6:930:18::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Wed, 25 Oct 2023 19:19:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 19:19:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 14:19:13 -0500
Received: from [172.30.200.120] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 14:19:12 -0500
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
X-Inumbo-ID: 64b32b78-736b-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3GnuVDhmUhivyLdq2DZSfC4HslZZm19konEXXXlCsB+MVxwp9cK7kpZhSFIVuHZ9U6bB8J6bPCdulZGPXlLX995b+lnmyKMPFNYhj+GMs6YC7j+5mArUi805t9W0ax90+7+6YyjviL1FJozeMBOv4FsY1pe6G7TUfci0MamOUZHT4ClrgkrTzUDmwpfSx+0K8uvdSQYAl4YOD/NPb0hJh/hGMAGLRxGiP5SNUt+0N57etwiF0hcddmKpjrm4ql/NZjiEd3rLeJcV1HFCeVG7CVy50rDaYFnAfcYCkN4DZNBDBcOT1MGAW4uX3hoZqCTlvgu7mByAkFJKcTafY8B5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RASlQHoru4oseIk41rX07mI1o7EkWFyJ2TklU0lx76I=;
 b=PIYDb9NPgbK1x/1vCri+oPdztCD7O88VzY4vFZ6IeGj0oP6LqYnVhSToOC6upVzdUKYm/4FotOQ/eJrTQ80zpNmWYpmA54FOw4bwkjLNZq7oUFCZ14x14eq6gI1LLZNPwcMfTCG8CTquqU+7j97lTE8f7MH/EHWqTnEQnKUEXK/v5Yk3pCbaInade0/oDNRXOKRtlLxc/vEzd/eUb55IISoCzMp7ye8oEICnO4rmunYKTtMUpi2RFYB9oZqABqhW5sw//Xdq6vj9w3DGF6sNkh/TFN+cIt0a5ZSdIC8mHTG2KKrP549KchzakiQe4z8+zTu1v5qY5+Ceuv2D/kAxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RASlQHoru4oseIk41rX07mI1o7EkWFyJ2TklU0lx76I=;
 b=qA9Pe1ZHz5zV2tCBQBh3SggNGHll1lteP49t4GSTovMvufXY2W57G+CmSG9tzRYzIJ+ZSwxCtwpUKvqcSFzVpNU2XWfdjrKB48+e12i6HF1y3rc0fkO62cNwDOawO3vXc/g15MJUVOWvaYiRdDae5APcIw2XNHr1GeWQR+P3cac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c563db76-1ed3-4a22-be4c-9d8300907487@amd.com>
Date: Wed, 25 Oct 2023 15:19:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] xen/arm: make has_vpci() depend on
 d->arch.has_vpci
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-4-stewart.hildebrand@amd.com>
 <972ac641-9dff-4668-87eb-f48d9d0497c6@xen.org>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <972ac641-9dff-4668-87eb-f48d9d0497c6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e8f723-63d8-4f95-b8cf-08dbd58f46fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qY3LDJnxNeRPj3+hAb+bx7weRuHqioVi0wWc8BikMOm8HEJ0+eeA5aRTtU20XktBKwLYuYf1DQyNGQOtYCRQnS+QJtTbD4samslorsHRO9/PjwLDxaNyjo3MA87CZrebIkm0gfVBom6YDIpBhuZkxiyoeclMOWdcsriX5+2CKvzMNAUODDQ4gJVhAJyZHh0Tbh1D58I6GiwyE06zrJ1/y/Tu/mKCWOBaYYo4dsTkWlsklIreDyTKokOAnzGZO3fsAQNGQeB27lle6uCZVf4fEzeT4HG9U7hOOurm7yfshjTcFlcYvzLgvQRF76ibsBpn2+GX9oA+MmXh9jjSZyCcYkxYI26vx0+tvWfELCZs7SPZQGwUUCTUmXp/IDEvX1pFsnavcowmDYcEKDD4QWXFSwQOHPh7HHTRngRFCqVLXEWedU/EBeHGWX5HIEGtZbAwt3gwHqmH06E5SgMvZQApBHZD+eB2ZZ6tyEW1qFGxzZAz5Eh2JgHk3jUyx81rc1RV5THBADUY3gdz3SSSJnC7kMmOFNPH4IPtxJxvrweC1NoBiVtK7oUzBe3HPJJF/Q+ePG9BdHdL4g049HnOgsapsuXaYWE8ntFEsODA2JwL+8sM/ubjxXV7gGUqPPcdkGk5E1PwzFAsX+3Z095MUY1dtOrxbrWNYYFSyUr7FUyD2sbGDzQPr8GgstDTDG8ugqw4bMHh0JodiseDOgj5v7UYNPSOBSEHX+U+CXMo0ITRJZh38Eos8Slr4s3li1h6nq0NHUEQqmeh02Qvo8CbXExoUCPsNad5Y90HoQV5C5+7uP8hX2duMi/KHEHECb+IRHBh+a5j882l6VafjGPVv4Yfqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(31686004)(478600001)(2906002)(40460700003)(4326008)(5660300002)(8676002)(8936002)(44832011)(40480700001)(36756003)(41300700001)(316002)(70586007)(70206006)(426003)(86362001)(6666004)(966005)(54906003)(16576012)(110136005)(26005)(31696002)(2616005)(82740400003)(336012)(356005)(36860700001)(83380400001)(53546011)(47076005)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 19:19:15.0101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e8f723-63d8-4f95-b8cf-08dbd58f46fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332

On 10/20/23 13:29, Julien Grall wrote:
> Hi,
> 
> On 09/10/2023 20:57, Stewart Hildebrand wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> VPCI is disabled on ARM. Make it depend on d->arch.has_vpci to enable the PCI
>> passthrough support on ARM.
>>
>> While here, remove the comment on the preceding line.
>>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> I think this patch should be folded in patch #2. With that the
> hypervisor part would be properly plumbed as soon as the flag is introduced.

Will do. If moving the vpci flag to xen_domctl_createdomain.flags, there is not much arch specific about has_vpci(d), so I think this could also be moved to a common header, like xen/include/xen/domain.h.

> 
>> ---
>> There are two downstreams [1] [2] that have independently made a version this
>> change, each with different Signed-off-by's. I simply picked one at random for
>> the Author: field, and added both Signed-off-by lines. Please let me know if
>> there are any objections.
>>
>> v2->v3:
>> * use d->arch.has_vpci since plumbing struct arch_domain with a vPCI flag
>>
>> v1->v2:
>> * add is_hardware_domain check. This will need to be removed after the vPCI
>>    series [3] is merged.
>>
>> downstream->v1:
>> * change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
>> * remove the comment on the preceding line
>>
>> [1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
>> [2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
>> [3] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
>> ---
>>   xen/arch/arm/include/asm/domain.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index 0a66ed09a617..ebba2c25dceb 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -300,8 +300,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>
>>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>
>> -/* vPCI is not available on Arm */
>> -#define has_vpci(d)    ({ (void)(d); false; })
>> +#define has_vpci(d) ( (d)->arch.has_vpci )
> 
> Coding style: I don't believe we add space after ( and before ) in this
> situation.

OK

> 
> Cheers,
> 
> -- 
> Julien Grall

