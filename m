Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FA64B38F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460458.718367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52qW-00009d-AZ; Tue, 13 Dec 2022 10:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460458.718367; Tue, 13 Dec 2022 10:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52qW-00006K-7T; Tue, 13 Dec 2022 10:49:12 +0000
Received: by outflank-mailman (input) for mailman id 460458;
 Tue, 13 Dec 2022 10:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p52qU-00006E-Qj
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 10:49:10 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ce72d68-7ad3-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 11:44:27 +0100 (CET)
Received: from BN1PR14CA0008.namprd14.prod.outlook.com (2603:10b6:408:e3::13)
 by CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 10:49:06 +0000
Received: from BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::a6) by BN1PR14CA0008.outlook.office365.com
 (2603:10b6:408:e3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 10:49:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT011.mail.protection.outlook.com (10.13.176.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.10 via Frontend Transport; Tue, 13 Dec 2022 10:49:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 04:49:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 04:49:04 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 04:49:03 -0600
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
X-Inumbo-ID: 1ce72d68-7ad3-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgeA//zoXxUqp6yQFj5hO9gGQvp6bZ618CTLyUNfa67vhLcikl2cFQ+bXcEH5RDQ56x83IMIDwCk1goLMtLvqbt1BezTEZh+mRVGEMlt/rcF5tJJAd7HkLJFAqX2pyN3a6GpUqFFYKmCiD/7vVBCSocPeIih8ePT68ibia81tLK9lNJJE7MnYzE6F/9RouJEaFrxZzeJzfyFnK0hfNBPzVdi9QPP+i4V2IfPPMgVP+mXvFPX9PS0O3LdaHxZCGV2pUgdQEcNprZRpsQXOuh4RmpSgd49pAKibTsjJsQJSNrl/wzrMX4qxr651RtDsHanyQHcyK0H+mgINIB2hB51ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuNpgwYzPNZ6sJRzy8OLXSaURUuZ7f6G0pEmrqOaVZ0=;
 b=mMpI6ozm95K6Vg23ZwbJi3zDCnjHHGhkhSDCH9r0D4+8G7CIHddPJzNklsKv7jFCT8rQpcawzISI0i+xmSXX47n8EeqoWam23Z1+Ksmt3xHrLSZFcT/JPmC9YRIAKQn4UJWyMt7hOD/vT+NLBdy37i3nsbTM+o6YkULCJ3VQ7GfUeprIDb/Fnzlboor236EBp5EboNh98Wp3k88oBBR+bbxAut4jn8GGF6ZR+5Cf4nP6sAlRVqTVNJoSponuqUjDAa2L6E3tIVerRtksx2+QXzezDNhw63wXwr3idAi7iuPHxD1pa6txQpHUUDaRWsL89sz18qzgdYLw1RcHSnNf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuNpgwYzPNZ6sJRzy8OLXSaURUuZ7f6G0pEmrqOaVZ0=;
 b=XvjM+zER//iBQuNmzSjLdRLxDardozZw4BxLJMUWJSTZKQeFJi+WAgvOuNVKh3zwyzY8pUoU8H4RbwonFCOGhSGiyGSvUZhFXxRk/LDvDII9LAnBri840v9WCphpPxlDGda11MrDIuZNUVdYZOIh5JnVnrBvTdSkUc5Av3bd/DU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6b1172bc-2b26-457b-5653-1046bf8ce0de@amd.com>
Date: Tue, 13 Dec 2022 11:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 03/18] xen/arm32: flushtlb: Reduce scope of barrier for
 local TLB flush
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT011:EE_|CH0PR12MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: bb361b4d-93d7-497b-1da7-08dadcf7a7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tytR7vxkE6bVK4peBdHnyQdcRiE5/GOJm3OTINAPyE57p2vLSU/J46EQGCF2EEmrkRiNBTYt3Erl9hjxCwibLxq0/SFyXmxJc0Gn4f2G1asKxSlNGLDXpirhqysitv6Biw+9XM2Fyc43LofMxu3RL8egJbEvZZew7IAeWj6l4K6PuzBrVEAFCx3cABDIKA359sONxnz96IWB3teJVhlhGO5xMgkDhp3jvq2KF97gkC/yncsATFZZK20vNge6eoEzJ+n3ri9LxIrzxKM6bV084E4mJHiS8XgPa4hkVPoRGzCr1oiOjvbBvFtJZyIjx52bVNVMDk+HzLEvlE/GY5H0jWuTansLIP/SKqoNgy3JXzY7cauGF+UfyIGBW1lnof5mkFqFu0dvgDK3SD9igbr3exm+MFL05VaJdZuy5//Ue004A+kKNiw+nbL8IY16CfmwyCBKNfWgvMUeabT2vVTq5eFD+fjfa19ucykVrPjzCl1TJUeSowly+7gFKmiVxOaHFcN/yMxlZq7Y6CxPxXkAIQQUOzK3ZYaWCxoPzyUUC+oF9gfi6hr7XWy6RwavPb9JkRXx1YyrcCRjOGog58OEpE9mF2AFTSWx1DFDKhnD+LB1jzCxrShguYfw2ykkfUYZ9JI7apV/KFYjVcYd4euKBUWTu+LYp1FxFepuAKA4FP9k+aGS6kKtNMeG6eKvBvnrzsFBc2MjR84jqneca2u2FwlkCCPI+8braFTfYiIcSCoKG6RVmZS9f4ed4CcsQOuzVIiB+UcsXM+P2c4mXBL99A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(81166007)(82740400003)(2906002)(31686004)(44832011)(40480700001)(4744005)(426003)(8676002)(53546011)(86362001)(82310400005)(6666004)(70586007)(54906003)(8936002)(5660300002)(316002)(4326008)(16576012)(70206006)(26005)(110136005)(478600001)(41300700001)(36756003)(356005)(36860700001)(31696002)(186003)(2616005)(83380400001)(336012)(47076005)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 10:49:05.4116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb361b4d-93d7-497b-1da7-08dadcf7a7ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5284

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Per G5-9224 in ARM DDI 0487I.a:
> 
> "A DSB NSH is sufficient to ensure completion of TLB maintenance
>  instructions that apply to a single PE. A DSB ISH is sufficient to
>  ensure completion of TLB maintenance instructions that apply to PEs
>  in the same Inner Shareable domain.
> "
> 
> This is quoting the Armv8 specification because I couldn't find an
> explicit statement in the Armv7 specification. Instead, I could find
> bits in various places that confirm the same implementation.
> 
> Furthermore, Linux has been using 'nsh' since 2013 (62cbbc42e001
> "ARM: tlb: reduce scope of barrier domains for TLB invalidation").
> 
> This means barrier after local TLB flushes could be reduced to
> non-shareable.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


