Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262807D66A2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622744.969848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qva5B-00025G-GU; Wed, 25 Oct 2023 09:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622744.969848; Wed, 25 Oct 2023 09:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qva5B-00021x-Df; Wed, 25 Oct 2023 09:21:45 +0000
Received: by outflank-mailman (input) for mailman id 622744;
 Wed, 25 Oct 2023 09:21:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XAhw=GH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qva59-00021r-Fi
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:21:43 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e77c8b83-7317-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 11:21:41 +0200 (CEST)
Received: from MW4PR03CA0028.namprd03.prod.outlook.com (2603:10b6:303:8f::33)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 09:21:37 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::85) by MW4PR03CA0028.outlook.office365.com
 (2603:10b6:303:8f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Wed, 25 Oct 2023 09:21:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.0 via Frontend Transport; Wed, 25 Oct 2023 09:21:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 04:21:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 04:21:36 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 25 Oct 2023 04:21:34 -0500
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
X-Inumbo-ID: e77c8b83-7317-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CydTf7+zTKxFF4uaBEYSpkmxTRYA/cgph2sSr0jKz4ISc2iAwSdiYhb3HL5bUMcfP0q4km8u3SKHup2SKxqkGC40agjw07gmPdMejpGRk8+KBNk6L6A8RUsZiZcIG6hyTQM9bQG4VTKJWDgH13T4g14CAfFTSt+N6WnmFbx7cGd6wyJfKEqI0Vew2B5nRo2O1VdD1zWdWbpbjMr2roXCflr87dWhqpUVCWOucY8ic9ftbzUoNUdm0pmWJNgR/JjYjNdAaRtAfKbM7Fc6gFsHypCy0j27thdAbVeLOk5JRCLRwJbmsmcfnlNcGI2dcl2m8QIwa6CEvCvW2dG3e1diNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UiioaXloc+8FEJy+zcjhibtF1PbYvv06pqt/tf7RQY=;
 b=brChlVtaY+5yxf89lSzQmfKn9WtbowMn9xoD0Fk402FT2WH29vka2IZfeDu3I4Tj0Vie9wUx5/ydRNSDCoP29ctz6FIOpGNbZbkCTH4lnm5nGC/5nMtUTwjKj2bsqOjeO5SI3XxX9BymFATI4C7JzniQTvx9M2O/X5vkA6HLwHBnOs29+RIXoaechzN8PfRrAllGbyVf4KjROKxGWq0LIfX/cUvD6ENFmTh2Ve2oYHSd2r7uUaQvDy+mmx+VE1B4a22MuwaSAJAJ3jPZUQX6pcXR/cVIDC2u9ytL39JIwZEx3bG3lTo8C/QgSJzbHO3DudcGby/hHeC7yLNlntDDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UiioaXloc+8FEJy+zcjhibtF1PbYvv06pqt/tf7RQY=;
 b=Byy9WoN4AWb/z/AuBlD9zTOVLei2sWOLCYc8YuL8uuvIuly273QEL2KBn5XHO02C7PGLtXwhrbxvzebPuAqk4L5eBjvpC4+Qzyp3xOPDbisPI8gJtfufoClwd8MCVWah1S6bbBrDXm6Uq4NO3sRDgTU3rfgTtGUmpjg+dmdfFWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <14ab687e-2d2b-40a4-9f79-3f547bba286c@amd.com>
Date: Wed, 25 Oct 2023 11:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the
 environment
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20231025082834.31680-1-michal.orzel@amd.com>
 <9e646df5-a9de-545a-e827-951a161c935f@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <9e646df5-a9de-545a-e827-951a161c935f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcab853-5394-42b9-dad4-08dbd53bca0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tRSlSvx63lqdvmBtjYugjaoC+uxMNmJPq4tw0jV9DhNIfrbxFcjoL3Z/bQwRHg0TGNgt/RezL0BF2KBQE7CsmPWnRThMTJ9g0qSqy6ZIhnp2qgxwKf9K6qagWMMLQevucICWg6FGDt2b8sL8cIiEwmQEJZXI/sm/vE4fkVOfS+RqssLPhXvv/3iFA3Ylyhe//zSu/NXnww+HNIiZq2Gz1ehhqlQgkMX/x16/xujLULG+8A61aVP9EmydFv0KeIJjXL14ytbmLkPBf0NHBBcLQ0hLPYeLx/yeQIPwA8I4g1bg3sUZWpAbz+Yp508ZT9LbQE1lzi38o7hRMlxVhBYTInzqrGz17uTKR0cqYLskgQ95Yc5s/MINZaCEYT2u6ABdQ+dLEmUOOoG8j2aXq8vMs6QZ3IcCg5+Ddnkc6gQeKxvya99cdDR87zyq738kY1XkDh53PwhHn7ac4LKK6Hju0wjk84+j0rMciVv3/rQtr+TMLmWwx+DspOiJPj5l1rTeJ26ePQrc6BAfyZVr07URzJBUbVprfwwJh1AeidCv+PYCBELqG2i0RIgo6AzF+j5coowiKZ17VzIEwoxSc+5poRTJEcFc8/ZWdyNX12lQjjiYQGsavUd0PCfmxdCoqzP4DFRKvsXe+uQtYR+tw1jJ+5VkfiugMMGCw4Ffbv+fJsSPcmaSJyvge1ysvwLItUL/eUZrU5fU182oDhvoISrKdFHL4y7M+dFPPvhORx9duJUTg2BgB8flra9M66RHuA52iLfo8pBSZdkiOGeQU89fEZqKcaxAhIbbvGoaZjLsZk0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(64100799003)(46966006)(40470700004)(36840700001)(31686004)(6916009)(16576012)(2906002)(40460700003)(36756003)(5660300002)(6666004)(44832011)(8676002)(40480700001)(8936002)(4326008)(41300700001)(70206006)(82740400003)(54906003)(86362001)(478600001)(70586007)(356005)(53546011)(2616005)(426003)(31696002)(26005)(81166007)(336012)(316002)(36860700001)(47076005)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:21:37.0899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcab853-5394-42b9-dad4-08dbd53bca0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138

Hi,

On 25/10/2023 11:10, Jan Beulich wrote:
> 
> 
> On 25.10.2023 10:28, Michal Orzel wrote:
>> At the moment, in order to use a different defconfig target than default,
>> one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
>> Switch to weak assignment, so that it can be also obtained from
>> environment similar to other KCONFIG/KBUILD variables.
>>
>> This change will activate the use of KBUILD_DEFCONFIG variable in CI
>> build jobs that so far had no effect.
> 
> I'm certainly okay with the change, but the above sentence looks misleading
> to me: Yes, the envvar was ignored so far, but isn't it the case that the
> envvar as specified in CI matches what Makefile set it to (taking into
> account that for RISC-V riscv64_defconfig aliases tiny64_defconfig), and
> hence the specifications in build.yaml could be dropped (until such time
> where truly an override was intended)?
Well, today riscv64_defconfig matches tiny64_defconfig but it can change. Otherwise, why
would we need to have 2 identical files? Looking at the latest full build series from Oleksi,
only the tiny64_defconfig file gets updated which would be the clear indication that what is
specified in the CI matches the author's expectation.

Also, I never mentioned that this change fixes something. I just wrote that it gives a meaning
to a variable that so far had no effect.

~Michal

