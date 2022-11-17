Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1EF62DC60
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 14:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445201.700249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovegN-0007bg-FS; Thu, 17 Nov 2022 13:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445201.700249; Thu, 17 Nov 2022 13:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovegN-0007Zq-Bz; Thu, 17 Nov 2022 13:11:55 +0000
Received: by outflank-mailman (input) for mailman id 445201;
 Thu, 17 Nov 2022 13:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovegM-0007Zk-5A
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 13:11:54 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66ce4df1-6679-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 14:11:53 +0100 (CET)
Received: from BN9PR03CA0486.namprd03.prod.outlook.com (2603:10b6:408:130::11)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 13:11:49 +0000
Received: from BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::2f) by BN9PR03CA0486.outlook.office365.com
 (2603:10b6:408:130::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 13:11:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT069.mail.protection.outlook.com (10.13.176.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 13:11:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 07:11:47 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 07:11:32 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 17 Nov 2022 07:11:30 -0600
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
X-Inumbo-ID: 66ce4df1-6679-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSehw+2Ba7klzG5TMNU8jooxQ4HtjGJCGgPYBmA2OUsTFF4ulC4vF6mTX1UO2A5t3xdbhGdC1Zp3FoTBR85/Q6fp5Oq8MIlTKUWHaLRAZOY1rNA08pmvkqX9ppjmYE9EL2koElJGPD2K9wCQL3RbvUnIM+LEEX5XBj1OGtW7FGLLRLsNqiIXwqVLKHbrahZzHKqYD2o4Kcv+DPKbW9BRkCm70traNRnSCsvg5JHrM5JVhmUPd7tFTXUNDVtGL8bIAY5RTcxbVOIqEf0s8F10G8ThAYvr3NO967ni13p6jNSeqB8qbbJ+5Hnfn9gbe28Q5dePdAhzULIIoXJmPpALzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kArmuR4bkKjuBcxB9hMbzYDZ5JaDT15JSnR6qov3KQk=;
 b=OJUrLA8Q3WtFfxUo7yh3TXi/aCVB45BBCvk3qavtynyRFVekhLLXyeO7bvVVaFSWramEM8Ht1OX3LvD78SY4vr92BaXywOBFO/bqWNgBqDNcEBaOWfpIKcxc4HjLMuGBJurSjTK3UVUBVnzbMuOoQvdzVB7j8evoz3PxB0rdFCF4hxl9bI0PJw32W442oalasQSw9ynlCyVhHSZCcKPGEmTgC2KxAO4Wu0OEjhwG0p2y0YBoBY9ZIaI4mOA9pbSnjhMWvC1/UjnYjcJRbO69ZGdnXCD0ASNlWPTpVyfpF0LCUGE1lLqRqHWWQiqAhzDFyLq2sDXnRjUBY1QWn3kDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kArmuR4bkKjuBcxB9hMbzYDZ5JaDT15JSnR6qov3KQk=;
 b=cGnkul4XvVBuMorKDFHwZz20CLzRygQEv1cW5+DtQ0IA6xn2ss2226tQIsGvO7xqQ3qREM9S14mqz3HWNaEtokYkvF+nLIDF0cRYvI6358Re5j/n72/s/KXTHA5icE5sW8po8AxQZtt8BbAFMxxaThFIv2U/QhGhDiZ/OR0V8Po=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a2a471dc-f757-940b-c0bb-2eba696e5a70@amd.com>
Date: Thu, 17 Nov 2022 14:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [XEN v3 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-4-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221111141739.2872-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT069:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c03cdf-51ca-4442-1abe-08dac89d48f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ljvKtJhpuye3u+eoMjPiEv+da6CF+TLAXF04Zz+7JLDxYhWoa88xBSQBdI7sTz0Ss7y4bHEMlAio+6o0FbHlXMvBqBIqz9ZhtKBkTVxZKiHFtP7q1+MtJcUHshBB0/MTFPChYtiNYeb9yr0xNEOtOl2GvXxRreubY2HY9sp8y3uVvORFB1Hfx0clC9dV//+6OUtnzASAtVeJdy+SCCX47OloWWj8YUgMY2euB4D0yQwno+dfKhnMud5fPUhqZu+OAVErqs947kZZ7dNjyG79lYSGYtC/7cor8grvDJvTus5QWqLORERYGkJPY4wt+nan96bc0kzcu03G7MARrNXfavrtGF6sPY81uF8BCy7Qp7YkOd1SSp0q6TGW5QWcF6Omnj0E4rOqwUnrr4pQfSp+ORNjpjwPw7Y2T676yucGRyPShc53iOqRFlk1JCWc+YOc0c5EEiLyYWuG7JUC7blaDm8LoNpxRSF01vNWA7m8qGEMyGIxh8knRcwSEbkbmkiWMIKidQS6zlhWexm0fxVylYVhe7pRDIK0A6oqaJ+LRpFr7aA1ro+kk5+xA6xUNcRR4kei/Wn7nX1SC5QbxzftbW316GFbFkRhpzEV9W5UC4cTtsUbEWspph8NmTtw3ltTKcuPhmIxPxMpfVo3jWPCucsKKRJ3JUt60dYcBllLAfVFSpFVvgnRRYDQ0u26BMY0G4q8Areej7w10Ow4Ucc6NgO9OXtC963f6nTuYJhwvBDxxvDKIBtH4C1OFVqvvgE4YewTuaAhSO/7vT1dDT13gQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(44832011)(4744005)(8936002)(41300700001)(31686004)(2906002)(16576012)(316002)(54906003)(70206006)(70586007)(36756003)(4326008)(110136005)(478600001)(8676002)(53546011)(26005)(86362001)(426003)(47076005)(82310400005)(83380400001)(356005)(81166007)(40480700001)(36860700001)(31696002)(40460700003)(2616005)(186003)(336012)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:11:48.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c03cdf-51ca-4442-1abe-08dac89d48f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

Hi Ayan,

On 11/11/2022 15:17, Ayan Kumar Halder wrote:
> In some situations (e.g. GICR_TYPER), the hypervior may need to emulate
> 64bit registers in AArch32 mode. In such situations, the hypervisor may
> need to read/modify the lower or upper 32 bits of the 64 bit register.
> 
> In AArch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
> registers.
> 
> While we could replace 'unsigned long' by 'uint64_t', it is not entirely clear
> whether a 32-bit compiler would not allocate register for the upper 32-bit.
> Therefore fold vreg_reg_* helper in the size specific one and use the
> appropriate type based on the size requested.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

