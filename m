Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C425371FAD1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542970.847472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4z1u-0002BW-2O; Fri, 02 Jun 2023 07:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542970.847472; Fri, 02 Jun 2023 07:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4z1t-00029d-VG; Fri, 02 Jun 2023 07:16:57 +0000
Received: by outflank-mailman (input) for mailman id 542970;
 Fri, 02 Jun 2023 07:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4z1s-00029T-5w
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:16:56 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 739a6c74-0115-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 09:16:55 +0200 (CEST)
Received: from DS7PR03CA0152.namprd03.prod.outlook.com (2603:10b6:5:3b2::7) by
 DS7PR12MB5886.namprd12.prod.outlook.com (2603:10b6:8:79::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Fri, 2 Jun 2023 07:16:51 +0000
Received: from DM6NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::23) by DS7PR03CA0152.outlook.office365.com
 (2603:10b6:5:3b2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 07:16:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT090.mail.protection.outlook.com (10.13.172.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 07:16:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:16:50 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:16:48 -0500
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
X-Inumbo-ID: 739a6c74-0115-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvIP7kZMo7/7C8VZ+ZFhl8IyJ3yEnDFAiSv/dHtEy85rTZ1CpYbCfSX0TyZI7NCVaL9GICLorOxZyByIYlO4rSc9LNEu70jO1vUa7O0D80h/vIKNp9SKsRqBthynm9dUQ2UOUUpm9JgBoIaGAZrbdoXFQjdnzvxLAre6FB5wpJN02XEWOL3+pLaKNGNnOJP20HG88LNIevmN80g/QmZKWWSgDQrOiqU1+xoGjr5vF6FZrPsnq4WcUPPrev+zUhpHYjlifnd2xWBXHoMlXN5FE1lbKr+ONrtvPPBD0hP9Tym3DsAlLPNH/TBL+ZmhfXoMHRvFun3iCNQo6/0/bDq3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoSw0S8uu8LTbfmCWc/Sp8/zUwdtKnUuaif+/Dlek+I=;
 b=FnDVeg16uX+5lIo2+yb5YMLXyLSFdd60TJ/86aAK5Mm0r0/jf38WAOZ/wNWAAo/EL5pGD9pQ2Zpm/mQmqS7/Myx52oIMXOJQENx19fAh8t3bcDP8FayjYqEo0G+axzS+5EffVhQyDecKofbp341jl4g9n1uxGwKjP70YSd7J5n4ZeeOKESoY6Vj/yxy0AHl2KHWKeYT4RfxGImj4VtaUG5/HUWSF9oaNKucUHBDt0ZpJ9D32n+7/80D6ZnEPrp/z6+Y3IGXk/otHrxg1lx0Q+7HVQ8YhXR43dHBSc78uICdAWkZLZvUK9PBAj04aZTIFJdffMRzD/OsL0xsE9n1Ouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoSw0S8uu8LTbfmCWc/Sp8/zUwdtKnUuaif+/Dlek+I=;
 b=1wkbiYbMt8ROrL287bmmsY/HZXYsb3DeQVAJC4DA+A1b3iH1+loEZmOzP0y8r6wuNIgMsJ2BaTscUeUOy9yPXX/HVruesEFTtEArlbCLUTe4jKrewWUonppQXYNd/+XrZOAZcJto+1vmnAEpYF2AYflE9H0klHNWxwFhP8eR36o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e048e57c-dbef-99a2-abbc-defb31b641eb@amd.com>
Date: Fri, 2 Jun 2023 09:16:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-6-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT090:EE_|DS7PR12MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a20da23-6234-4aa4-8360-08db6339564c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4gff37FXuWEqp3GyJFuYPPCv4QOs9TqVNleWcp4lWCZQ69I2g1z6jt2wzOs9CkZNFhgEdFnI3XAjJ4x9JhRqB43y+SnuZddPQfjDIrKpo3AoDR0jtyQp+XKEakNxpgKxWed/i9oyDtnt5ta6e0DDnGJJYhQM2CCuAP+5fkb0e/RFXsSwgMA4qKuYoC/eeygzHBdIwe7Z9zOAExp4xHSYL7H5o7dV6n8q3db4QRndEeBsIDJLqfz5eK1IsKp1UaI0x780s6T4pAofRHskrtS+1yp2nccBUi4rQ1muj0aECVGx97oQtNE3L0txb+C5XjRGiPcLSfe/hVUDK2m1rs0Y6kD25gS1qkWjwQaNwFGaqOt85WK7jpXHVdSBfcoKSEI5vgEAh74MGUekSU3iR3d4QST5yCzNVRHTZeGjUpzG4ng7qw2qNTBs0oq1wDSQL7ybLDHXgZRkA+gqBiL/WXj3DaD0gRfWY9RBfi0LIropGEOr0qzTwg4OwTcwam80Ur6EgC0PSIeLcMF6yLQNr5u0vIS/h5U17khvOF1Vt/eEGAabjdKzGND7xaUI/kQUmGkZv3/48rXRovFaBw9KLAE5FcqaKfvxyXmsfBHvYcxsepxZ5k1SRB/ke5/MUIFMbJ//ykbREFFZyWkynxoh6E5L4MZtKeCK+tsD+3s60kR3A67qRKKAL2P8EOVH0Vvu8qGiX25A4G9eKjYwznOA46r9lj/JLw7/F0EXeHId2jEd4rOMORz3T08HSGDt5rnseNRi4cN9nzsHGLxGb5uyI6Ns0fN7wwGrjOkUODKDbgSgb43aH+EqwulJtf5tbWMOawk5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(47076005)(36860700001)(41300700001)(4744005)(70586007)(83380400001)(316002)(426003)(26005)(86362001)(40480700001)(186003)(53546011)(7416002)(2906002)(36756003)(8676002)(44832011)(2616005)(40460700003)(336012)(31696002)(82740400003)(81166007)(31686004)(82310400005)(356005)(478600001)(110136005)(70206006)(8936002)(54906003)(16576012)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:16:51.4260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a20da23-6234-4aa4-8360-08db6339564c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5886


On 02/06/2023 02:48, Vikram Garhwal wrote:
> Introduce a config option where the user can enable support for adding/removing
> device tree nodes using a device tree binary overlay.
> 
> Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
> Arm.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

