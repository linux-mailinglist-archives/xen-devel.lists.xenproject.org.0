Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA1758331
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 19:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565420.883528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLo50-0005n8-08; Tue, 18 Jul 2023 17:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565420.883528; Tue, 18 Jul 2023 17:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLo4z-0005jr-Tg; Tue, 18 Jul 2023 17:01:41 +0000
Received: by outflank-mailman (input) for mailman id 565420;
 Tue, 18 Jul 2023 17:01:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N9eI=DE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qLo4y-0005jj-59
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 17:01:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe59::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1aaf364-258c-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 19:01:38 +0200 (CEST)
Received: from MW4PR04CA0379.namprd04.prod.outlook.com (2603:10b6:303:81::24)
 by CY8PR12MB8361.namprd12.prod.outlook.com (2603:10b6:930:7b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 17:01:34 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::db) by MW4PR04CA0379.outlook.office365.com
 (2603:10b6:303:81::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23 via Frontend
 Transport; Tue, 18 Jul 2023 17:01:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 17:01:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 18 Jul
 2023 12:01:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 18 Jul
 2023 10:01:33 -0700
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 18 Jul 2023 12:01:31 -0500
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
X-Inumbo-ID: c1aaf364-258c-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLVFWd/WtqJegE9UEM3hEflCqFGbuGrZyfV7BsmhOsdGTl6ZPegwRj02H64wdl1UrrWuZRAPYaU8+rCpbO9baKnOARGx94/L9xg5x5AGOlxTJfpqPoOFQUKa4BuM94DFZnqY3YW0mdA5ZQgYCxTi+EeU4Y0NZfxueHQUdKfCR2HONSmSDaiU44mBLvaSYXZnTbmZTf5sGYDAPdV3MsZbzF8h6POZDTzEuR7123CxwD63/LHsI1m08JMSuZ6Hd7LTImYo2faicHJuqWLJlexIkH7+Vr2KferPaKtIpmBymzO/jdwnYzPrKqaMB+bpaaPbONkB88xVlrSaqozjEmLUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0eI4QJl/zvOMtlN85TFWCqI/abwRV2x4VOpktU11ok=;
 b=X5KsU5KztdA5jU3tDKyT04c14CM0IryRHI5MFZ/TXmvUDnjmwqZRsBavNmFx2MI1raaijPGs6tpK83QSUYZxvRYLJnV1n730sDFEFUR7QYZw9LGtEZjk+8reklEHtld0IgJ/GwUwbExtsIcLrdpsYUfP3KzaKLJIew3b1ZCf208NphjlgHpN40TkZHGx92cTwoE4tCH8LTHcBXwsgqE/XcP3dhk2p4jf2UFW3oEZ/RUpiZE32mmzhz9h2K/JP7Da2N3nXad8RQk9Wb9y7Dz1Ifw/MGn9ALFNukJqJB0uIr7LuwktjNYFwO3tQpBfztwJ1YwzeEQuJQfsULfiRLQQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0eI4QJl/zvOMtlN85TFWCqI/abwRV2x4VOpktU11ok=;
 b=OHgUia+cinvzUvErByNdJbqZ/EPe4JMN6ILV6GaxRMoQ6LGgPtQIpRfZdE6ILLTPwbBv8y5lgvfRDAjVzbwuwI8n3sLHJtTMJSMdTDOmrq6GlmSfxQRw3NT2veHvEnUbZCN0Ztqlmx4wOt4Z5uLLhUYpZz/SBRGlraGldXcTDME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a90a2858-c2ea-624b-8095-2e2976e1b34a@amd.com>
Date: Tue, 18 Jul 2023 13:01:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 2/3] xen/arm: make has_vpci depend on CONFIG_HAS_VPCI
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	<xen-devel@lists.xenproject.org>
References: <20230707014754.51333-1-stewart.hildebrand@amd.com>
 <20230707014754.51333-3-stewart.hildebrand@amd.com>
 <0dcbc190-2719-6c1d-55d1-4b229dc32e05@suse.com>
Content-Language: en-US
In-Reply-To: <0dcbc190-2719-6c1d-55d1-4b229dc32e05@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|CY8PR12MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 68dfcc84-ef37-495d-c98c-08db87b0a478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qeji5zZ5G5i2wAlHbcrdmdlE4eLW4pyAmyw3NhR4aMIYWJnuzeK6pz1HKiRUudhigM/Vj9FHg6tL/pg1mHikXrvy+T5YWGEETOpm4xNpS6+PwqbLiW7hA/eZj1x8vXXZzZXXP9u8N0an9Z7FrgLuTUfRIHks1HZKjzNg/t0D+LPbAAk6BjCLbEwPq380qizxyKIkpxgC+IEeidUIOVJL2Lumi4i6bHzEkfUvpX/+nd/nhjg0xSKk7SfUmus5K8/y09/OMwIzDz1TO8S1XK6JSjARbIQSLoO9N1VA4vT8CmkcZ3IRmC5l4nhVcWy8FbVy5tT0pTvC9K1BegO/3k/Kg89oeCNekjZoGDVMwsSEOS3q8Je6pdR3iROu1/FLP5F9oRXTWGw1WXd22w9DDHwJ3fo6GoulLKc7xAIMzGWnu4G47SxfNkm5yVF9m3KaXC/y1PDRLbavNQvhN5ZSXcmcGRaDS0zJ3GnHn8EMSbQg1M/cFgXbr8sG0odmFOd3ndGfaZmwxerfbIg0jZGeAfqQQhHZPRZ1/aNQcKx6Kf7eujiGPjfmUysviuprmzCTDqtIIPftLkQZlEAvtFEnXvLIfpIkFWhtShjm1PctNvbzgzKR52b7E2DEwost6FE10JUk/UCQ92vhkVppx+m74s+WOSWDiHR4aCWVhn6yWGAGyXbwc5QhtJi8Q2XZkKu8TveCcM2V8gy0lb3sCXQQ+rYvCKQLF5i4ehdRrD1Aqz7ECEr5wy6boB5NzIq/XkmTr9EqJOfz60uLMTeSpj+WAG185e1m7Y1LECVaC+vuxT7NUr4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(31686004)(478600001)(83380400001)(54906003)(426003)(36860700001)(2616005)(47076005)(31696002)(40460700003)(36756003)(86362001)(40480700001)(2906002)(44832011)(186003)(26005)(336012)(53546011)(966005)(316002)(16576012)(81166007)(82740400003)(356005)(70586007)(70206006)(4326008)(6916009)(7416002)(41300700001)(8936002)(8676002)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 17:01:34.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dfcc84-ef37-495d-c98c-08db87b0a478
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8361

On 7/7/23 02:59, Jan Beulich wrote:
> On 07.07.2023 03:47, Stewart Hildebrand wrote:
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -298,8 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>
>>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>
>> -/* vPCI is not available on Arm */
>> -#define has_vpci(d)    ({ (void)(d); false; })
>> +#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> 
> While likely not much of a problem here, I think we should strive to
> write macros such that their arguments are evaluated exactly once in
> all cases (for side effects to occur exactly once). When that's not
> easily possible, so be it, but here it doesn't look problematic to
> swap both sides of the &&.

Thanks for pointing this out. Hmm... I'm considering turning it into a static inline function. This would also satisfy MISRA C:2012 Dir 4.9: "A function should be used in preference to a function-like macro where they are interchangeable" [1].

[1] https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_09.c

