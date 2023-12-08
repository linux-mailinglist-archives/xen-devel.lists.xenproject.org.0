Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE79809E74
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 09:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650421.1015924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWOn-0005NK-A3; Fri, 08 Dec 2023 08:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650421.1015924; Fri, 08 Dec 2023 08:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWOn-0005Kg-7R; Fri, 08 Dec 2023 08:39:53 +0000
Received: by outflank-mailman (input) for mailman id 650421;
 Fri, 08 Dec 2023 08:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8K7=HT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBWOl-0005Ka-4L
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 08:39:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe59::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58c3a411-95a5-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 09:39:49 +0100 (CET)
Received: from PH7PR13CA0018.namprd13.prod.outlook.com (2603:10b6:510:174::22)
 by MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 08:39:44 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::32) by PH7PR13CA0018.outlook.office365.com
 (2603:10b6:510:174::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.14 via Frontend
 Transport; Fri, 8 Dec 2023 08:39:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 08:39:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 8 Dec
 2023 02:39:40 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 8 Dec 2023 02:39:39 -0600
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
X-Inumbo-ID: 58c3a411-95a5-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPGZdsoGtESd9TUYey/Dw3tCic/fe1vGANMRBlicRTlv8IDTpV2NJJ0EJIkOFRtjjRME5shbB0kjh5kucXY3sVyJsoSHhPF8rGIRk60fMNQrruDgK5CWrxewfTROUmm3OEI/7WQfC3o6/SkEKFUjvIRHz5pONSs4eHC2z/MbP+3/1s+qCMx8l9SheULTnFUgHUGHX8adBS87wZLBTY/cPz5gQH++qgb/hZoRDHPhOmveg3j6yPmpmrenwd7P8p2sIJvyvyt9TcwVBd+82TRhFXiXSqTIqYVCXlti6ik2PmvKjXUWqIt+f2ht3IZrnZp7BW5mUzXpug6JbJ2UnAq/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLFA0sxO1id7jPf2s8b5pgDNGgRPZNPiSSZAOaKwLaA=;
 b=V170utopYhVjX7XzHBwj3gaAMEttyIV/YLtfX0g4BAE9sItZIOMzRvYSa8KYAGbBbH1zhXXMfs7Y91JpYzP+PcZ3HxjxqtKnL4IoxioB23FVyVmXXnhgVQL+Em94oQ/nayq0xKauQCqWwYiucypGFvpTPrRqtfvnAhqSxJdSQn44qxbs6wt5mG1BLaQh6SBD1+KzaVDrTqk/cGJKX7Yx7Aps3IScEfMU/+BuRXbViZnwR/PeIPlM/OIus7DdZPuyxZO0yER7lJYzdTtIh1QLXf1BEYdtM71La0Z0fGh8AWxZjcLTIFn+r+DX//F7SY56Xz5PhYnvjJXJ3ZL3m+PAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLFA0sxO1id7jPf2s8b5pgDNGgRPZNPiSSZAOaKwLaA=;
 b=xBh89n1r3AYhr6Uc99xyjqeudYY72jVoXuvhL0AVgZJ5KgL62OAPm3Kw6E4Ayr58wTOxzNnE8zKXiQ+ss8gB6vUbEL8nZX41/RPaad1DGYGCL46mEbkt5fJ6I6IdPfMMDEXd/VN8+6wNvmJhkV9KCuSJIHpnWxeU1vjJx7gT9K8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <beb72672-4ff6-4fce-a3bd-2a7ead9e64ec@amd.com>
Date: Fri, 8 Dec 2023 09:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] automation: Add the Dockerfile to build TF-A and
 U-Boot for FVP
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-3-Henry.Wang@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231208054637.1973424-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 498da0e9-f61f-43ae-ad58-08dbf7c93a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CINa07Fjmi34eRPMfvyFh3j4RvG9dzRG+EdrdVbfATdzEcKnmPldBVOH9cczkwELw/zLjuFsQggxu9LphYHmFfgxRdUyt7l9rHO5AkmnaqAAE7BmaKrkrFs2dk0+Ht9iCemiN5vCchAafLJWBt11sCE6EQo2fMnZNw2DrTRCDG44vxoEVJ0scXvV9Tuo+Fw6qOQnbKuJE3monFOanF277lepchnSljslb8tE/HX17udV047RceVGZ6DXZZ6YW5GELb3dLGxuDyWJfJjjk8vVOQC6UUkcUMbxGV4jLV1YJrREHlLa8SasriaaZuyLNbtcwkZNq1Osxvi9VeVk+2CdMoXdJzrg43BUjvzid1xMh2WHM2NsZc5CqomywkAjNOmAVFosV78wWEaMfup2bZK4kiorR/UvGL9mPBIkdYGXzAA1cqyBfvxqYZs2WqAZy2HyjiXyUyxAh+/BJZQJzDGHtbA4mHXNeXzWnvqyMM04jvH1Xvo1X58yP7d4QPgStSaq06XxXa0eM3hw5m4XRNuJY5Jp18EgdfsT2xrecQLazOJkHQUl5NS4/6voOcSvBQ6ggQbw2YnqkRFvD79nXeXq5zJRHw192vJY7LdZgL0jzwHLFd20xVhkFUYohzvZtdMVSZU/ywYGOoSDNG5+RWPtIETDxzNyHGOih2FWZdXiw8FLpxdJ6f4NdTro1pORaM97+Co1SS2zpuv9+FqM/ns0u0i4qDD9DByycvbt34SUudlePL1xy9N7F/N0DMBnoJmqwnqA83uN/EcR5Ce+Zoo8Mv7B2fRRUj8VdV12xEd34wg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(83380400001)(81166007)(41300700001)(36756003)(40460700003)(426003)(2906002)(47076005)(356005)(82740400003)(36860700001)(31686004)(31696002)(44832011)(966005)(478600001)(53546011)(54906003)(40480700001)(110136005)(70206006)(16576012)(2616005)(316002)(86362001)(4326008)(8676002)(8936002)(70586007)(5660300002)(6666004)(26005)(336012)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 08:39:43.8230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 498da0e9-f61f-43ae-ad58-08dbf7c93a1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734

Hi Henry,

On 08/12/2023 06:46, Henry Wang wrote:
> 
> 
> Unlike the emulators that currently being used in the CI pipelines,
> the FVP must start at EL3. Therefore we need the firmware, i.e. the
> TrustedFirmware-A (TF-A), for corresponding functionality.
> 
> There is a dedicated board (vexpress_fvp) in U-Boot (serve as the
> BL33 of the TF-A) for the FVP platform, so the U-Boot should also be
> compiled for the FVP platform instead of reusing the U-Boot for the
> existing emulators used in the CI pipelines.
> 
> To avoid compiling TF-A and U-Boot everytime in the job, adding a
> Dockerfile to the test artifacts to build TF-A v2.9.0 and U-Boot
> v2023.10 for FVP. The binaries for the TF-A and U-Boot, as well as
> the device tree for the FVP platform, will be saved (and exported by
> the CI job introduced by following commits). Note that, a patch for
> the TF-A will be applied before building to enable the virtio-net
> and the virtio-rng device on the FVP. The virtio-net device will
> provide the networking service for FVP, and the virtio-rng device
> will improve the speed of the FVP.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v2:
> - Add Stefano's Reviewed-by tag.
> ---
>  .../2023.10-2.9.0-arm64v8.dockerfile          | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
> 
> diff --git a/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile b/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
> new file mode 100644
> index 0000000000..6566b60545
> --- /dev/null
> +++ b/automation/tests-artifacts/armfvp-uboot-tfa/2023.10-2.9.0-arm64v8.dockerfile
> @@ -0,0 +1,48 @@
> +FROM --platform=linux/arm64/v8 debian:bookworm
> +LABEL maintainer.name="The Xen Project" \
> +      maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +ENV UBOOT_VERSION="2023.10"
> +ENV TFA_VERSION="v2.9.0"
> +ENV USER root
> +
> +RUN mkdir /build
> +WORKDIR /build
> +
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        libssl-dev \
> +        bc \
> +        curl \
> +        flex \
> +        bison \
> +        git \
> +        device-tree-compiler && \
> +    apt-get autoremove -y && \
> +    apt-get clean && \
> +    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
> +
> +# Build U-Boot and TF-A
> +RUN curl -fsSLO https://ftp.denx.de/pub/u-boot/u-boot-"$UBOOT_VERSION".tar.bz2 && \
> +    tar xvf u-boot-"$UBOOT_VERSION".tar.bz2 && \
> +    cd u-boot-"$UBOOT_VERSION" && \
> +    make -j$(nproc) V=1 vexpress_fvp_defconfig && \
> +    make -j$(nproc) V=1 all && \
Do we need 'all'? Can't we just build target 'u-boot' for u-boot.bin?

> +    cd .. && \
> +    git clone --branch "$TFA_VERSION" --depth 1 https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git && \
> +    cd trusted-firmware-a && \
> +    curl -fsSLO https://git.yoctoproject.org/meta-arm/plain/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/fvp-base/0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch \
> +         --output 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
> +    git config --global user.email "you@example.com" && \
> +    git config --global user.name "Your Name" && \
If this is needed for git am, you could get away using 'patch -p1'

> +    git am 0001-fdts-fvp-base-Add-stdout-path-and-virtio-net-and-rng.patch && \
> +    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t all && \
> +    make -j$(nproc) DEBUG=1 PLAT=fvp ARCH=aarch64 FVP_DT_PREFIX=fvp-base-gicv3-psci-1t fip BL33=../u-boot-"$UBOOT_VERSION"/u-boot.bin && \
> +    cp build/fvp/debug/bl1.bin / && \
> +    cp build/fvp/debug/fip.bin / && \
> +    cp build/fvp/debug/fdts/fvp-base-gicv3-psci-1t.dtb / && \
> +    cd /build && \
> +    rm -rf u-boot-"$UBOOT_VERSION" trusted-firmware-a
You forgot to remove u-boot tar file

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

