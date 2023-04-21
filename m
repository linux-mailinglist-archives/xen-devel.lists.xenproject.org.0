Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5346EA580
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 10:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524508.815504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplk1-0008PH-8t; Fri, 21 Apr 2023 08:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524508.815504; Fri, 21 Apr 2023 08:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplk1-0008M9-5L; Fri, 21 Apr 2023 08:03:37 +0000
Received: by outflank-mailman (input) for mailman id 524508;
 Fri, 21 Apr 2023 08:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1kD=AM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ppljz-0008M1-PR
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 08:03:35 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01afc91b-e01b-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 10:03:32 +0200 (CEST)
Received: from MW2PR16CA0066.namprd16.prod.outlook.com (2603:10b6:907:1::43)
 by MN2PR12MB4520.namprd12.prod.outlook.com (2603:10b6:208:26f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 08:03:27 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::b1) by MW2PR16CA0066.outlook.office365.com
 (2603:10b6:907:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.27 via Frontend
 Transport; Fri, 21 Apr 2023 08:03:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.27 via Frontend Transport; Fri, 21 Apr 2023 08:03:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 03:03:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Apr
 2023 03:03:25 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 21 Apr 2023 03:03:23 -0500
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
X-Inumbo-ID: 01afc91b-e01b-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqPiAMUYpLi0DQlG3wf1yXw7upNMVjS0wWFACzElI2b74EKzn6E9YCZ1m23gmNLNqXDzTMFqIE67Zc7YivTMmSHbrgZEYgCPkIK42A9ixVtxnBeYoY/tXbV17JEKe3B4Q8DNz3Ni4yt/d6rwKx2/OUAkZQmYNcx8qdm6CC22gGV36Nu5on7OmJyadSQrdJX3Y6YHOkK1NDuNkbAr0M7cz8ZhOsuO48+t8+g+X9V8LZ3TuJ9W5B76P0zLdw/8QdfAiusUdI0PHd3a4Um3i+EDg4nedc+XcdEjfixlh9jxgeCwSoB+y83YwOvkioUYWQBUegvrTu/Wy4WvB0SDcdUBEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YMUnGWGzw3nBKPKWLtJPAgE40LUnF7BLZ38MPB1Sw0=;
 b=PlK/kqBLwsBCSrg6h6Zx1l8qt5F8g7lN0S3MqL9laK4aWw0Hf7wZlBfkn8vFYVVtmZbBA60G/o2p0bjLb662Kf5K2Xjjd57hPDEy0FoITyhCIqEK5DOVSqIW+Xbza61ltwlU+SoxXNn3xa9p7crErnMLSoXpbHF6jsuE4SXD2s9K7BG+GxqTHNWBBGxz+fnxHVQCKEE0ObQrd4W+bY+dSgPygQ9CpftjVkR9KYygKT2pJodVimc/vxwy4NdXD3UWR09TdRHD1kOmx3SFYijs5BHh4FqQK3fg2GGAVbU72mcfMQESgsW0uKmsWAfQ5ZY6ZMsoBOTHeFT6/dEp+INf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YMUnGWGzw3nBKPKWLtJPAgE40LUnF7BLZ38MPB1Sw0=;
 b=cTrd46n3lQnBEtw8q6OF5VBpaEecs3jQqx0W20Wh/9DlcD8V7d9TJKHiaJ+QFO+pXmNRLc1aLGsbiIEdiRymUBfG56QuK8ZFGDqXElhdKbe3mnqIMYULs8EkdX4hoU84ziE5W8yeW1b4d+wO1D7XM52FH3+CSCJnLD9Mh8aoA5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cc29fe9f-5df6-816f-aeee-b8a1933cf3e8@amd.com>
Date: Fri, 21 Apr 2023 10:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN v5 07/10] xen/arm: Restrict zeroeth_table_offset for ARM_64
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-8-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230413173735.48387-8-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT067:EE_|MN2PR12MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: ee51d579-134e-422f-395f-08db423ee31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R8qUpPslDdKYq3l6WSD0yogmnHziN/UNaYeZHPAIIcJi/4gHkwe8ComxGfPCI/dtvUzVP5utUe5uhpHvgbUUH6SPT4VdBvh5M27NbJ1UGVdRFmAogql/9pa+ZHsIVBZ03jLKRnmk6/jwrby7iA+iYp+PIlCPfkqcx1J8AzXON9cMTCkL1VANTs7CyodEtgP3211NCRM677KarwMU+75tki/UAOEOqy4AU4MSYcvmvjYhC0OToqGzUIFaj0v3THlme9XFVZT3NcE/uh6pvGQ1SpRYSNaBLe5PjUBiFfi5nUsOBShEFeTJBFJ3/KW6EtlTqKObJGliDwsYbD4XffCqMLeGojPP465Qe/lOtQk5in+1kNqy1ga4HsNL7b3pQ76Jl2j9IFPDc0+lZTdCjxfCiyBwqlOczdIxEMqyTaMOpzhRWxBl/H+3Pem6Fqk2TcQSr+5JN7+Qi+0Og9ddmW4AW8dIYO8vKXmkeuSD3tM1Ut0DrJwlTxH4IZZUTlIBR+aNKh9sWYRg2rh/FZi2LLEsSQXMlZtmjH4yQOgYvZHZkFa6IcJ5QfQNUzSRBl2xzBBLCsEhJRnYWkLESFlLDIiWCz0yFs88K4bpXWFl3XG0s+VQLHRJgp6RtJOFf6os2yDw4nLE2gL5csmagXH1dFsD5nnWjYzxW69DNsALVmYTDU1aYcU1QTDPM2BUzqveWMopz5Zvi5i4XgNWrbm9o4z6i8sraBNU6qDEBMBQX2Zd8ceK3BpZ+oF9/wybp2RP7njaykVLn4yeymoSLR/sR+i3yQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(41300700001)(70206006)(70586007)(110136005)(316002)(26005)(54906003)(4326008)(478600001)(16576012)(8936002)(8676002)(426003)(336012)(7416002)(44832011)(5660300002)(53546011)(47076005)(36860700001)(31686004)(186003)(36756003)(40460700003)(2906002)(356005)(4744005)(82740400003)(2616005)(81166007)(82310400005)(40480700001)(86362001)(31696002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 08:03:26.7243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee51d579-134e-422f-395f-08db423ee31d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4520

Hi Ayan,

On 13/04/2023 19:37, Ayan Kumar Halder wrote:
> 
> 
> When 32 bit physical addresses are used (ie PHYS_ADDR_T_32=y),
> "va >> ZEROETH_SHIFT" causes an overflow.
> Also, there is no zeroeth level page table on Arm32.
> 
> Also took the opportunity to clean up dump_pt_walk(). One could use
> DECLARE_OFFSETS() macro instead of declaring the declaring an array
s/declaring the declaring/declaring/

> of page table offsets.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


