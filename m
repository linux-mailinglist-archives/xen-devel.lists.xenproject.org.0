Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6CD62F04D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 09:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445498.700686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovxDE-0006Df-Tm; Fri, 18 Nov 2022 08:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445498.700686; Fri, 18 Nov 2022 08:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovxDE-0006AD-QK; Fri, 18 Nov 2022 08:59:04 +0000
Received: by outflank-mailman (input) for mailman id 445498;
 Fri, 18 Nov 2022 08:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovxDD-0006A7-Mo
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 08:59:03 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e32b77d-671f-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 09:59:01 +0100 (CET)
Received: from BN0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:408:141::31)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 08:58:57 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::fa) by BN0PR07CA0017.outlook.office365.com
 (2603:10b6:408:141::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 08:58:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 08:58:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 02:58:57 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 18 Nov 2022 02:58:56 -0600
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
X-Inumbo-ID: 3e32b77d-671f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKJWz8ZBM/dzmJNrBECU4pxv7QL9K89lRamHne6O3pk3MjWhfGlVOWIBjM2Rp/JuSrGgVeeiPOfLu1AmppDcRVnHzb4YdbMSDhgP7x2wyQM4Tny6pcgcn5bp5nlHAEmo/2zPadWM0EH8XYVNpGc+cpxRBU4c2O97Mdhjt+R5U9/ZwQAcxcR0l3d5pPS5mt+g9ogzJvYW7e/iNELCiWzPIVMB905yylo2uJXCdtDSJq0Bk3N18pOvOD82be/snslYuwnVvGRaywbA63gnP+g3askGjA2XhZM2rPHtRxP+A5QtG4+fKY2sA9IiGxoqj0wfyY7OWB/klO4WX8CfXZcxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsMGNa8Ypjffr4ofXhsaDP269QpbB6DEbUFgt0QAfX0=;
 b=h8cuS/kMlKIbNSsrbgdGaRnVjH/7oQkwWNWAX+hMDhoSLRv5g7EkAB4olK8GTTzDFqKS0vGdr4qp2Oul+YLGUiY0mfahSyouHwqvFsNZ5xmEmMjMvC518klZfzqJPZ1ednqxKlq7ii/YCb7Y4bX6uLpBfA7Kam88O86S6JaWnqGj23KcXq62FZlLM8IiFpx2AAdtyIhWDCdZXLI560wVvOOxF2TQbygGDsiyZQlR7VMncM9LN2qFRwobGJy+osZLJE8cT6C00lFld/4Q7nJZgiaipTds+dzeeZTjFHi2nGk7hkK8dwV2IQK01vwtRpmP/MRlCIsAofN//DRow3P4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsMGNa8Ypjffr4ofXhsaDP269QpbB6DEbUFgt0QAfX0=;
 b=G1qK6uphJNMBQvH/GwIzWDKRh8TTSHW7NVmBIWaBMchZrw7WT7lbfVfFaFkT+U2GaXupk9VsL1yPYkgK+ctJmXcjDjumO260bPRZ4je4fZVyeTXagZA20GPDbMC9XFZ0Co1HxMLwQ4VsBrXnUdxRGHZMQzPTBX7meOZLZWOmpYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f7c65c1f-c566-af6f-e1c3-c1c27e5abeea@amd.com>
Date: Fri, 18 Nov 2022 09:58:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/3] automation: Add a clean rule for containers
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1668677493.git.bertrand.marquis@arm.com>
 <3a127e836d744fbb2954690293ee47d2c0c899e2.1668677493.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3a127e836d744fbb2954690293ee47d2c0c899e2.1668677493.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 69aac28a-6d59-47c8-3907-08dac9432096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mPwav3ey1dUl45EHLvAYA3Y0v12VfQZGfG5mvVjqVQUkcESrF9eXTd6yLYCWj2jDRBJYHHMWimRinatrBACgbcjnu6L/OdYkQ9aEUEAi1/kPow/IcWIMoYzC6i+REzo7HGPLK2lF4TWgZxErRRz/Pu5roO2AJrcQQ1jEpnVX3ItwwV8xUQ5eQLh4NuaPp6JCoElWCt+YjcTdTn+sZQNR6qWzcwuj6+lhIucotz7ExCotxQk32X19kAbcrgVf3c33aYxeBpqnaoiYSJ8zyqkGhl/P49b/6fwyj5qODXX/2Ak9UOH5I2RQErY4wVPMLG2byxzICpNDbZEGdvC+ZOmt/YYhbDRqm/l/UhwKnB5OV+vnK0jlmwF02oNBxZNEbGAssMfRq+xBkxGpPfOcoihJYsBwDJOXLyi5yDj3XOJMW7bCgNFj4WHMQXVCsvqD+EqKP6XtT/yay9d7dteFrcE8024Z2f9AAGDUbXPyKdOSw++oIP+5AR7zBz0WQG1mKZA56f0uvQrludItRDgOfYNUxyWCiPyv3kpfSdNfffOa4bQbWGxY4BYJOGgx900sfkVrXKNzObQ/VC9hvGHNuWmMPsoYB2PMbYvZQ17099BDbPCHeA+7hn40xS/2/6rvL4TtmVD8LkMAzHXTzsAefxcOphf9qlxVfYqH7EtHRL0i6dYPfU4tHYBo9KID3wpxr9EQIK/8rz2oWScN3LaxttfN4q+D/nJs4rzUjlk7jPJJ3EIAAfktdHpFg54v6O4hPOw8cFnGBoqd4zYxCnJqAnjgeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(31696002)(356005)(36860700001)(82310400005)(41300700001)(81166007)(86362001)(8676002)(16576012)(40480700001)(478600001)(5660300002)(4744005)(316002)(8936002)(70586007)(70206006)(4326008)(110136005)(54906003)(2906002)(26005)(44832011)(186003)(2616005)(336012)(40460700003)(53546011)(47076005)(426003)(31686004)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 08:58:57.2585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69aac28a-6d59-47c8-3907-08dac9432096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523

Hi Bertrand,

On 17/11/2022 10:39, Bertrand Marquis wrote:
> 
> 
> Add make clean support to remove the containers from the local docker
> registry:
I have to say that I am a bit scared of adding a clean rule.
make clean is something that can easily sneak into this directory and can
remove the yocto images that we had to spent several hours to build.
The accidental clean can have severe consequences :)

In any case, if we want to add such possibility I would stick to calling always:
make clean-<image>
and remove the option to call "make clean" to remove all the images.

~Michal

