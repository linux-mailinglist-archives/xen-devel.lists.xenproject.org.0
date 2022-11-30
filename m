Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4C863D6AE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 14:29:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449901.706932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0N8C-0001Rq-Jw; Wed, 30 Nov 2022 13:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449901.706932; Wed, 30 Nov 2022 13:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0N8C-0001PL-H0; Wed, 30 Nov 2022 13:28:08 +0000
Received: by outflank-mailman (input) for mailman id 449901;
 Wed, 30 Nov 2022 13:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXMn=36=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p0N8A-0001PF-Io
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 13:28:06 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb2762b5-70b2-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 14:27:54 +0100 (CET)
Received: from BL0PR02CA0043.namprd02.prod.outlook.com (2603:10b6:207:3d::20)
 by PH0PR12MB5631.namprd12.prod.outlook.com (2603:10b6:510:144::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 13:28:01 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:207:3d:cafe::9a) by BL0PR02CA0043.outlook.office365.com
 (2603:10b6:207:3d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 13:28:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Wed, 30 Nov 2022 13:27:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 07:27:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 30 Nov
 2022 07:27:59 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 30 Nov 2022 07:27:58 -0600
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
X-Inumbo-ID: cb2762b5-70b2-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk/jtjsirDy8H5khh3QPeR+sjBrBPf6Ci+Qb1tSNeN4C2VjkhEq5vY87aGxZG+ZzWpjqiJ/kLr96nfLD8FJzIOZBPKTc/roIoNZPSABZOb86VXWT+Xn/QOJQ0T9Ji0hb52OO9uY5HQ7Txzf04m8W+YpD5afnh3K3ryqf9KUwPY19gmBjGU/9H7+pXUxbLBLBezUdFMbGsQBsA2EKAAvHGz8AEA6q1d3a3tUI0buLQzyJrfHGqE69G9M1WTeoM2YT94q6pMlQZAPqFh7GhWVI3F63fQ22xj30fFlnTyFZmFQ3Y2ChXWbSHcz3defEENBKbflX7CN2NBkrLBn5CC1fYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n9ry9VIO9lf5oOJla12j4isMFEfHv3L6ob+WUJPElM=;
 b=Apg9n/04EzVfCGv06AZmXQ0Nmx2gnTOGEFEw3ihli/lDiYhTbsd4DM3nb0tTzDhZ/bNNKC+E4egSf5WcmmwTdSdMnEGfpdpIhKWlepSwddghftkV1DmhWUBQJh8WiWexW3sK4QYHG20LoOlnSU3A8sbmt8Wsa+MpAVsvX4xE8R+mxdx7inW/wQ3JDjVz/rCQEowg10C3kvFPPmXUS/dX/Jb4vtBL73LsYXWRHMTFctV2Dyxm4dBbEDnRm6WXI9iJumD58uLabGXEmGTQmmWcYMQJbYdftrF3V5v2HzmvU4yVgchOjhKleagbzktnryUaZRxYctXzC5yclLeeA0EVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n9ry9VIO9lf5oOJla12j4isMFEfHv3L6ob+WUJPElM=;
 b=rNHYQd2W90ZruPRPZfGl4UWoFUe2b0zuaOixr+cpx/yyEweADpcyc848awtaTP0CnNwkBfkCHuhuDj++CyRNgzfOBixoAGilyLX5aOO0yqwX3pAWvvf8exCmub2OuL3v1PY7V6ziWzmCrdocaoHhgvjfxkLGUO6HSZmD2EN2M0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <49d4c5e3-d853-605c-a87f-c90ccba1ab5d@amd.com>
Date: Wed, 30 Nov 2022 14:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 1/3] automation: Create Yocto docker images
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1669810269.git.bertrand.marquis@arm.com>
 <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <18861c0c9c547959900532e38df11b2d67f0a1cc.1669810269.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|PH0PR12MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: a060b0c9-1484-4630-98ee-08dad2d6b31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	olXpmWnd9Kcf41sQRoXZTGS2tWExo3mUlsCwJGvQ+LxZt2rcYsWPMVjRXjJzyvykG+0x2OjaDyN6hXzX9bj28cSUY9smGrXyaJRSXCRLs12/gMn1LQ99Cxdo6L+67zcCuM6SUeG0KRE8kMXFZP3qgLdLYmJZdi8vGDFXoPVHR83IAswpFdWPAXSk1pKkfnphEex78777zkMat1OiqySbARpMmwWw7gA7MKxnESmsp4tHYT9m7HSciHKMAw2atdHNQ6a8cnA8KNnvFehaRK7ZHWeYtkTqPuDcyWhYghVPnP5JqmxM2EjVxsZrQhfIIfRpDpsiEJHDhppHF5Wmclo8zZjxv/kfL76u2zs/0hFOSTJSLYEHF3qDvPKArzNj+zy6fs9bdux2DqNmVRUwsClyvseSlP0jbdoTAAq+/KIzV905zNxBUkNPBX3uxPVcUpu/gB5e/IW3PasuAdwy21qv4sPFXlPxsGn1wjoA7+YZa0KzlvcvRXQ46OuHd92boZgUAVFSrqeyi1AkcTVbx2xET10renhgsc8yTKwrcT4pcVHmoplvnRqpLk7tEWztOuJBMDIVPdr6mS47F7LRM+iZY+LitticS7YVqa1vaJotPE+wVfKSZkmF6yAiQtFLpVD+jpLqpUPL/R0tOt7OU7pvT9NTHuw0YjrhmXKSQx6RGKRZ+iEbAoo5czIJAb4P3oYOV6PV/WvBER/1Ht/3qWcNw9Hq5uu2gwUTLVqGmeGEa0KBJ1xO+1DXWIvd57TciIs6SFflcrTmOE4iYWXORO/FLSDTLavN21zop46wxdM1BV0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(44832011)(83380400001)(82740400003)(31686004)(84970400001)(31696002)(86362001)(36756003)(82310400005)(426003)(53546011)(5660300002)(26005)(2616005)(336012)(186003)(47076005)(2906002)(41300700001)(478600001)(81166007)(70206006)(70586007)(8936002)(8676002)(356005)(40460700003)(16576012)(4326008)(54906003)(40480700001)(110136005)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 13:27:59.5707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a060b0c9-1484-4630-98ee-08dad2d6b31c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5631

Hi Bertrand,

I will try to build and run the yocto containers for a test.
In the meantime I just spotted one thing.

On 30/11/2022 13:15, Bertrand Marquis wrote:
> 
> 
> Add containers suitable to run yocto kirkstone build based on ubuntu
> 22.04. It contains all packages required by Yocto and a checkout of the
> layers required to build Xen with Yocto.
> 
> Add a generic docker image template to be used to automatically generate
> docker files for different configurations:
> - specific yocto version
> - different targets (qemu arm, arm64 and x86)
> - different host platforms (x86 or arm64)
> 
> During a call to 'make all', only the images for the host platform we
> run it on in the CI is generated.
> If needed, images for an other host platform can be generated manually
> by calling the right make target (see make help).
> 
> Add a build script to build and run xen on qemu using Yocto.
> The script supports arm32, arm64 and x86_64 and checks that dom0 is
> properly booting. At this stage this does not run any guest on top of
> dom0. The script is to be executed in one of the docker images to build
> and run a system using a Xen source tree.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v5:
> - typo fixes
> - add INTERMEDIATE to remove intermediate dockerfile
> - use container architecture
> - use full words in foreach loops
> - fix shellcheck findings in build-yocto.sh
> - rebase on sstabellini next branch
> Changes in v4:
> - Rework the system to have one dockerfile template from which make will
> generate the required dockerfiles for the wanted configuration
> - add support for different host architectures
> - Merge the generation system into one single dockerfile
> - Merge patches 1 and 2 in a single patch
> - Introduce CONTAINERS_EXTRA to have extra containers not built by
> default (for those not used by CI but useful to users)
> Changes in v3:
> - limit number of jobs in yocto by default to 8 and add --num-jobs
> option to the script to set a custom number of jobs
> - do not copy anymore the build-yocto.sh script inside the main image so
> that the current one in the repository is used when running
> Changes in v2:
> - add a --dump-log command line option to build-yocto.sh script to dump
> the logs if an error occurs.
> Changes in v1:
> - add --image command line argument to build-yocto.sh to allow building
> something different than xen-image-minimal.
> - modify dockerfile to have one layer per line and make it easier to add
> other. I kept the for loop to keep the number of docker steps lower
> - update commit message to warn that no guest are tested.
> - fix build-yocto script to properly return with an error if expect
> script ends up in timeout or EOF.
> ---
>  automation/build/Makefile                  |  14 +-
>  automation/build/yocto/build-yocto.sh      | 351 +++++++++++++++++++++
>  automation/build/yocto/yocto.dockerfile.in | 114 +++++++
>  automation/build/yocto/yocto.inc           |  42 +++
>  4 files changed, 519 insertions(+), 2 deletions(-)
>  create mode 100755 automation/build/yocto/build-yocto.sh
>  create mode 100644 automation/build/yocto/yocto.dockerfile.in
>  create mode 100644 automation/build/yocto/yocto.inc
> 
> diff --git a/automation/build/Makefile b/automation/build/Makefile
> index a4b2b85178cf..72a5335baec1 100644
> --- a/automation/build/Makefile
> +++ b/automation/build/Makefile
> @@ -1,13 +1,18 @@
> 
>  # the base of where these containers will appear
>  REGISTRY := registry.gitlab.com/xen-project/xen
> -CONTAINERS = $(subst .dockerfile,,$(wildcard */*.dockerfile))
> +CONTAINERS = $(filter-out yocto/%,$(subst .dockerfile,,$(wildcard */*.dockerfile)))
> +CONTAINERS_EXTRA =
>  DOCKER_CMD ?= docker
> 
> +include yocto/yocto.inc
Because this appears before help, when calling make without any target like:
make -C automation/build
the previous behavior of printing help by default is no longer true (the default target is
taken from yocto.inc in this case). Instead we're getting:

make: Entering directory...
rm yocto/kirkstone-qemuarm64.dockerfile
make: Leaving directory...

This include can be easily moved after help to stick to the current behavior and still
achieve what we want (i.e. make will still first evaluate include and then call the first
target which is help, so CONTAINERS and CONTAINERS_EXTRA will contain correct data).

> +
>  help:
>         @echo "Builds containers for building Xen based on different distros"
>         @echo "To build one run 'make DISTRO/VERSION'. Available containers:"
>         @$(foreach file,$(sort $(CONTAINERS)),echo ${file};)
> +       @echo "Extra containers (not built using make all):"
> +       @$(foreach file,$(sort $(CONTAINERS_EXTRA)),echo ${file};)
>         @echo "To push container builds, set the env var PUSH"
> 
>  %: %.dockerfile ## Builds containers
> @@ -16,5 +21,10 @@ help:
>                 $(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
>         fi
> 
> -.PHONY: all
> +.PHONY: all clean
>  all: $(CONTAINERS)
> +
> +# Remove generated dockerfiles for yocto
> +clean:
> +       rm -f yocto/*.dockerfiles
> +

~Michal


