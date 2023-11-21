Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CC7F346C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638057.994314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5U8g-0000qH-FR; Tue, 21 Nov 2023 17:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638057.994314; Tue, 21 Nov 2023 17:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5U8g-0000nB-BO; Tue, 21 Nov 2023 17:02:18 +0000
Received: by outflank-mailman (input) for mailman id 638057;
 Tue, 21 Nov 2023 17:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5U8f-0000n5-7y
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:02:17 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe59::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8731b05-888f-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 18:02:16 +0100 (CET)
Received: from BN9PR03CA0210.namprd03.prod.outlook.com (2603:10b6:408:f9::35)
 by SN7PR12MB8003.namprd12.prod.outlook.com (2603:10b6:806:32a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 17:02:11 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::96) by BN9PR03CA0210.outlook.office365.com
 (2603:10b6:408:f9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 17:02:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 17:02:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 11:02:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 11:02:05 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 21 Nov 2023 11:02:04 -0600
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
X-Inumbo-ID: b8731b05-888f-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cT2NdHKO63QpDAlwUkMrqymPvcJFSBg0jMsIPUs/48W/OJ/pFjkxaWShJGGzEV5l8gtTPhgoFQdpDMJ8S+50ItAyxLIZGqwlUFNI5eR0TMyOTAzm3mRc3AQ8IaFIAGZpRBnKEDLXIroA8mWRhJfaIgAygROTwZW4UsRbWyx1UCoI3vG7E1AWX2opN4I3bL5JKaSLX8/Jl8kLfDQyM0LmznmkOjS9xwwjU3cgb4QSAtZ8DSEnGmFS3a4mjXGIfX2GvoXXsuqyo+/WgHe5U3ZPGDg/PTe2Z4oYptSnaVIuoxxanLFH5c7mttQ8UApAY6mi0Z4Qty/jzSa6X4nBTktyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcomW10rOYplO63Jlr9+7f0u0719wmUy6o0yDWVuVQ8=;
 b=RrX+EEvt6mpTidZw2/1XUfUxCVoXjnwbVkGpYFL26c4PT7ZWQ6TQD+caeZvKlHsUJHsJpdi+zWapRZdBL+caRL0HrLF7Y/GD6bLIuKycxa8FS9UxJqQQNkKGuVR/9wipBSemWWTSP9E2Xo1cn2SzrwTPn0bkeZRt5/P99XQXxrsVNTbp4VGjLnSw10+KwsQgvFhSGaHDAsyQVZaa0rQIJEfhabzoxqNd1ZklNAZUJbwK1I2EvmQocubrE7+tDMX4FYy4p7LYhB0KjyUa8RWdljyRpu7dzl8nXOIL3XANcyCFaEVh8IbMDSatBFDXHKdtb6sR/LfWvo1XIviKvEtyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcomW10rOYplO63Jlr9+7f0u0719wmUy6o0yDWVuVQ8=;
 b=OXcYn6cqHMCP1l8cZ8nwiWTclniQjECatEBhuejcoxBcxcwuHEypAT/hmc5A/J0OODx4vXpZy9oDxF8qGKSVFRpqG/LJV1QCP/IiywN+3vu32mKEr0/SFha+ROQ0OSEMqtjl2XD00dH+Zj7A9ygahRbrX8Flstsemsv8D376VYg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1d4201d5-c28d-4f35-9c11-19b3b52cc015@amd.com>
Date: Tue, 21 Nov 2023 18:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm64: Move print_reg macro to asm/arm64/macros.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-3-michal.orzel@amd.com>
 <efbca156-948f-4fcb-98b9-05f13f8c076b@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <efbca156-948f-4fcb-98b9-05f13f8c076b@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|SN7PR12MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ab8c43-8f48-4c2a-f4bd-08dbeab39a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BoCtjkU9RbVUpN0S3PrUNdynGNSpUIHLPDYt5QfuJuKV+HSPhndmuNyUIjC2dOVJZ9nTeD2Oxv8B9gVoWHYulL0/Jcu00fA9ypFxj6b6Su6Y4rGhra26L68QnN09OYWtO9sDJUYxl1p8XFZHjErPh2GHB9xtoHYypn8Ik3Y5GMq3VKKzzKGzybdm6PFurN7Es20WwQ2+25baAmDYpJHsYColqKjvsyFXkQrbRjZELHZKgAVg11RAnd/70p8oi05F9SSUqFXxXfiYmzVuqEcnSTAg5bOW8WC2O+jvMZ11oTEBbkil0b142OJffnVFmqURSxf34elR1I6RXlF+zetwQaEnskFe7LQSYs1TPNQqHdAgtPQA4Cqh21GPMsOEvaZe0fU+tylhj0dRgX9KKIzaSz1IbDkmYtUQOIFH9tR8PUYQ9hIjpN7px4ZXcGQqmmz08hDxwgADQ3I/E7CGumCsBXgiqexdOnTnVj9EdQl9DADSQVdtCGzEY5cbxodNsefyBhuULMlF9zXPKdsH0w92PNndu3UUOqC317gzzOhvwSRyoCrDE/wSqJ5HYH2pvi9ml7Vt07Kt8q0r6LL6dHqgvMrVL7Gms9C4m1E85ctVVPZYZaaKnBAGJI2fYia7OR/OSb24pUoYJ4Pc+cx2rrRmf09ge5+PHh1o+cMrtaoB1hGLFJY8lJqFaWo5lR7oTIcAca0HE+LEIgATp5plgWhBbxF/h5egjvo+p5L2R2XXzrn4Ks3+lj0+K+Wp5LdwIXJ9Zwruz1O5bBYgwlKFWm2eEjYWKUrJqyJUA6x5F/NioCVw60hNdTRCnvdHPloxIW4F
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(82740400003)(86362001)(31696002)(356005)(81166007)(40460700003)(36756003)(110136005)(316002)(16576012)(54906003)(70586007)(70206006)(26005)(2616005)(426003)(336012)(478600001)(5660300002)(53546011)(44832011)(2906002)(4744005)(4326008)(8676002)(41300700001)(8936002)(31686004)(36860700001)(47076005)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:02:11.0441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ab8c43-8f48-4c2a-f4bd-08dbeab39a45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8003

Hi Julien,

On 21/11/2023 17:16, Julien Grall wrote:
> 
> 
> On 21/11/2023 09:45, Michal Orzel wrote:
>> Macro print_reg is used to print a value of a register passed as an
>> argument. While today it is only used from within the common head.S,
>> in the future we might want to make use of it from other files, just
>> like PRINT(). It also serves as a great aid when debugging.
>>
>> Expose print_reg macro by moving it to asm/arm64/macros.h and:
>>   - rename putn to asm_putn to denote the usage from assembly only,
>>   - use ENTRY() for asm_putn to make it globally visible,
>>   - get rid of unneeded stubs for early_puts, init_uart and putn since
>>     the calls to them are already protected by #ifdef CONFIG_EARLY_PRINTK.
> 
> NIT: The last one read as this is necessary to move print_reg() to
> asm/arm64/macros. But really, this is just a clean-up. So I would add
> something like "Take the opportunity to..." or similar to make it clearer.
Ok, I can do that.

~Michal

