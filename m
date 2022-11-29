Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC80463C347
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 16:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449472.706239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p028L-0003rq-88; Tue, 29 Nov 2022 15:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449472.706239; Tue, 29 Nov 2022 15:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p028L-0003pt-56; Tue, 29 Nov 2022 15:02:53 +0000
Received: by outflank-mailman (input) for mailman id 449472;
 Tue, 29 Nov 2022 15:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBYr=35=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p028J-0003pn-1O
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 15:02:51 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3319eff-6ff6-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 16:02:49 +0100 (CET)
Received: from BN0PR04CA0079.namprd04.prod.outlook.com (2603:10b6:408:ea::24)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 15:02:45 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::a7) by BN0PR04CA0079.outlook.office365.com
 (2603:10b6:408:ea::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Tue, 29 Nov 2022 15:02:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Tue, 29 Nov 2022 15:02:45 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 09:02:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 07:02:44 -0800
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 29 Nov 2022 09:02:43 -0600
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
X-Inumbo-ID: e3319eff-6ff6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exfY5MBCZyuv8+pj2soR4sgdavnpwCgdOZeutj/KttthVzxSYubIt8JxcHcykH16xIkdPu8V586mDFh1SBkL4Ub8hbB9H4Q2W5ds1g1p7Q2OKjDoMe5JkU23eFVJafuxJmWZ7rc+Qqcv0IbWVIzXvCzdvQMwPz3Apiwm3Gv9gF0e3m+4+d7EUaOT7t9MgQRAPD+srfz9k4gb8pHjxAzTa/MV7sx9BFmvmFmElcx13lyb79uiIwnCTMj3R6C2s9SUOmxzBhYewQjIOSmODYlCbi8MWB+7pKy0M5zcOGdPPYwwgbeZPAFOao37+iafdvofHh357D8CAY7CEuuj0Hlk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoPvd3sa3RBD8P+HoEBR8TADvF00Wx35FeNQ6pJDlLA=;
 b=iXA8+6azqBH6LHPxgkzztKBSSTp+B/iWSUPs6PhhaCUDvU7lFRZTPdUMrv9AhlWyOTEDRWDPbRZbFAkeUjqPB3EsvnD90kJXLcBiU0aKjC1uhnzrAsRCVaDBpFeH12NnRgMPwR8NTbsdPm7IWFNYE1EpzJCbfQn8/DWuaNC/FP243k7NlfAqFFCcmo2PPlhA8kchFA4uZCBqNEGHG0Lm+I93kMIoSDkkWGJpzcuqHNkoP1wDebMxLhGluRtwjodmOMvXor02BkBQB/LFmBJ4IeXa/r6/DM+Jt68o+NLj7TQzmkBC4icIypuBiHq+BQF5D8LHlvYaqEQSyCnmCOFoZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoPvd3sa3RBD8P+HoEBR8TADvF00Wx35FeNQ6pJDlLA=;
 b=BhvQPeCC+f4afmrZWgJr6EyHCiydh4uxO7n2AkXhZ2QDA7U0zwgCQYgglDy/NH1ZG9Fgj7+ZA3dThR9FrCZyqvCt9WmtDegLV5/GlE2yjdVUbdabrb4IM5JnjFTU3QLBuISn4wXkJet0m048u9Izu+lsKqJkg7m0HjY/Viox8wo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e999b40c-4b9b-316b-9200-fc7e39b9710c@amd.com>
Date: Tue, 29 Nov 2022 16:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [XEN v4 11/11] xen/Arm: GICv3: Enable GICv3 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<jgrall@amazon.com>, <burzalodowa@gmail.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-12-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221128155649.31386-12-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT031:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfe2f5d-4477-48ce-01b8-08dad21ac5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qnky/e8dNH+g2pBKRLc6/nc2nguLplkj/aBAb4LyaVxIJoTAN7JQdMPaGV3/aAyOiOKmQyrsYuVfmDXFQZvu32Cmbios8eih4HB30EpyTlcTua5XoS8+a+hnjYiZLrpd/FX1hhdv8PLCbp1JcnRkvP1aDjp5MMtbycDt8Uj82aGIVKYiv/7jAZUvnJOZegiDxqnW4LZi3NxMjE0wb6idJyKPIOK1ADVE5cIq4Nl7+MPN6OPP/zTk4XfDqF69Y6y+UTgYD6/MwkbxUUX24q5KLzrcqr8ww53/DzaCmdVCQ6LfcPFKTySl9/M54/kofY95xBf9IiRSDuAPLNLGvCKUxtiZ3I+G3n8BLYJNN/plPO6eeJg3ujTjPyI3f1pI2ikDPoUDRMzJM2iyP6/ak8CTD5iF/ZoCLNUln1D339KW+YZ5WTeav6YmE5JExjc5YTbFHD19wVjhneHz7gPDBmLWDhqwo9f6XfiM600/ERzE4VPQdJcoGbnNZxiC38+qfS28ZawRHxNCcUCZrqgf9n1sZi1tQIjaZc4c/F4Ke5Z1Rn6RdnkSsWJp0I4B2PFvigK/UKIVbLWWzGieEkLVgmw/Jwwb1Nz74/BVrT6sn/ZOqIXV+5T2MeKzSoBeoQ0CdmIthOOfC8989A15WVGzqDeSMIQsj5X7xNkA9LOlc/sjvQxr22fd73azMLvQa/5df9iPIleXov5mE37p8HERC5XtiyfRZ/xZCYcgb2GI2UCUiowlf20xfKLsucYdgKtNy5+amQ0eihgxS3GfNHbfu789NA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(2616005)(31686004)(36860700001)(2906002)(83380400001)(70206006)(356005)(70586007)(41300700001)(478600001)(8676002)(40460700003)(36756003)(82310400005)(53546011)(82740400003)(26005)(81166007)(40480700001)(186003)(336012)(426003)(8936002)(5660300002)(47076005)(31696002)(4326008)(86362001)(110136005)(54906003)(44832011)(4744005)(316002)(16576012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 15:02:45.5210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfe2f5d-4477-48ce-01b8-08dad21ac5ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439

Hi Ayan,

On 28/11/2022 16:56, Ayan Kumar Halder wrote:
> One can now use GICv3 on AArch32 systems. However, ITS is not supported.
> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> By default GICv3 is disabled on AArch32 and enabled on AArch64.
> 
> Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

